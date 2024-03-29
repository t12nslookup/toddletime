# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController
  # Remove the first skip_before_filter (:require_no_authentication) if you
  # don't want to enable logged users to access the confirmation page.
  skip_before_action :require_no_authentication, raise: false
  skip_before_action :authenticate_user!

  def index
    @users = if params[:approved] == 'false'
               User.find_all_by_approved(false)
             else
               User.all
             end
  end

  # PUT /resource/confirmation
  def update
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        @confirmable.attempt_set_password(params[:user])
        if @confirmable.valid? && @confirmable.password_match?
          do_confirm
        else
          do_show
          @confirmable.errors.clear # so that we wont render :new
        end
      else
        self.class.add_error_on(self, :email, :password_already_set)
      end
    end

    return if @confirmable.errors.empty?

    # Change this if you don't have the views on default path
    render 'devise/confirmations/new'
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        do_show
      else
        do_confirm
      end
    end
    return if @confirmable.errors.empty?

    self.resource = @confirmable
    # Change this if you don't have the views on default path
    render 'devise/confirmations/new'
  end

  protected

  def with_unconfirmed_confirmable(&block)
    original_token = params[:confirmation_token]
    confirmation_token = Devise.token_generator.digest(User, :confirmation_token, original_token)
    @confirmable = User.find_or_initialize_with_error_by(:confirmation_token, confirmation_token)
    return if @confirmable.new_record?

    @confirmable.only_if_unconfirmed(&block)
  end

  def do_show
    @confirmation_token = params[:confirmation_token]
    @requires_password = true
    self.resource = @confirmable
    # Change this if you don't have the views on default path
    render 'devise/confirmations/show'
  end

  def do_confirm
    @confirmable.confirm!
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, @confirmable)
  end
end
