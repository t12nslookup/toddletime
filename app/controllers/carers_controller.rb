# frozen_string_literal: true

class CarersController < ApplicationController
  before_action :load_carer, only: %i[update edit show add_child destroy]
  before_action :load_multi_select, only: %i[new edit create update]

  def new
    @carer = Carer.new
  end

  def create
    @carer = Carer.new(carer_params)

    if params[:how_contact_id]
      @carer.how_contacts = HowContact.find(params[:how_contact_id])
    else
      @carer.how_contacts.destroy_all
    end

    if @carer.save
      redirect_to @carer
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if params[:how_contact_id]
      @carer.how_contacts = HowContact.find(params[:how_contact_id])
    else
      @carer.how_contacts.destroy_all
    end

    if @carer.update(carer_params)
      redirect_to @carer
    else
      render 'edit'
    end
  end

  def show; end

  def index
    @carers = Carer.in_order
    @carers = @carers.recent if params[:historic].blank?
  end

  def add_child
    @children = Child.in_order
    @children = @children.search(params[:find_text]) if params[:find_text].present?
  end

  def destroy
    @carer.destroy

    redirect_to carers_path
  end

  private

  def carer_params
    params.require(:carer).permit(:name, :phone, :address, :postcode,
                                  :email, :how_contact_id, :what_contact_id,
                                  :other_heard)
  end

  def load_multi_select
    # how_heards is no longer used.
    @how_heards = HowHeard.in_order
    @how_contacts = HowContact.in_order
    @what_contacts = WhatContact.in_order
  end

  def load_carer
    @carer = Carer.find(params[:id])
  end
end
