# frozen_string_literal: true

class WhatContactsController < ApplicationController
  before_action :load_what_contact, only: %i[update edit destroy]

  def new
    @what_contact = WhatContact.new
  end

  def create
    @what_contact = WhatContact.new(what_contact_params)

    if @what_contact.save
      redirect_to what_contacts_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @what_contact.update(what_contact_params)
      redirect_to what_contacts_path
    else
      render 'edit'
    end
  end

  def index
    @what_contacts = WhatContact.in_order
  end

  def destroy
    @what_contact.destroy

    redirect_to what_contacts_path
  end

  private

  def what_contact_params
    params.require(:what_contact).permit(:contact_type)
  end

  def load_what_contact
    @what_contact = WhatContact.find(params[:id])
  end
end
