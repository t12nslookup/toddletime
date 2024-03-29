# frozen_string_literal: true

class ChildrenController < ApplicationController
  before_action :load_child, only: %i[update edit show add_carer destroy]

  def new
    @child = Child.new registered_date: Time.now
  end

  def create
    @child = Child.new(child_params)

    if @child.save
      redirect_to @child
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @child.update(child_params)
      redirect_to @child
    else
      render 'edit'
    end
  end

  def show; end

  def index
    @children = Child.in_order
    @children = @children.recent if params[:historic].blank?
  end

  def add_carer
    @carers = Carer.in_order
    @carers = @carers.search(params[:find_text]) if params[:find_text].present?
  end

  def destroy
    @child.destroy

    redirect_to children_path
  end

  private

  def child_params
    params.require(:child).permit(:name, :gender, :date_of_birth,
                                  :emergency_contact, :medical_conditions,
                                  :special_needs, :registered_date)
  end

  def load_child
    @child = Child.find(params[:id])
  end
end
