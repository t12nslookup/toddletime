class HowContactsController < ApplicationController
  before_action :load_how_contact, only: %i[update edit]

  def new
    @how_contact = HowContact.new
  end

  def create
    @how_contact = HowContact.new(how_contact_params)

    if @how_contact.save
      redirect_to how_contacts_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @how_contact.update(how_contact_params)
      redirect_to how_contacts_path
    else
      render 'edit'
    end
  end

  def index
    @how_contacts = HowContact.in_order
  end

  private

  def how_contact_params
    params.require(:how_contact).permit(:contact_type)
  end

  def load_how_contact
    @how_contact = HowContact.find(params[:id])
  end
end
