class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable,
         :authentication_keys => [:login]

  attr_accessor :login
  after_create :send_admin_mail

  scope :find_by_approval, ->(approval) { where('approved = ?', approval) }
  scope :find_locked, ->{ where('locked_at is not null') }
  scope :in_order, ->{ order("username") }

#  def login=(login)
#    @login = login
#  end

#  def login
#    @login || self.username || self.email
#  end

  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver
  end

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
end
