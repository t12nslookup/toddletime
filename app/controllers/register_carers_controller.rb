# frozen_string_literal: true

class RegisterCarersController < ApplicationController
  before_action :load_meet, only: %i[new create]

  def new
    @carers = available_carers
    @suggested_carers = @carers.joins(:children)
                               .where(children: { id: @meet.children.select(:id) })
                               .distinct
                               .reorder('carers.name')
    @carers = @carers.where.not(id: @suggested_carers.reorder(nil).select(:id))
  end

  def create
    @meet.carers << Carer.find(params[:carer_id]) if params[:carer_id].present?
    # raise params.inspect
    redirect_to register_meet_path(@meet)
  end

  private

  def available_carers
    carers = Carer.in_order
    carers = carers.recent if params[:historic].blank?
    carers = carers.search(params[:find_text]) if params[:find_text].present?
    carers.where.not(id: @meet.carers.select(:id))
  end

  def load_meet
    @meet = Meet.find(params[:meet_id])
  end
end
