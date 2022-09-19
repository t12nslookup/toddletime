# frozen_string_literal: true

class CarerToChildrenController < ApplicationController
  def new
    @carer_to_child = CarerToChild.new
    @carer_to_child.child_id = params[:child_id]
    @carer_to_child.carer_id = params[:carer_id]
  end

  def create
    @carer_to_child = CarerToChild.new(carertochild_params)

    if @carer_to_child.save
      if params[:from] == 'carer'
        redirect_to @carer_to_child.carer
      else
        redirect_to @carer_to_child.child
      end
    else
      render 'new'
    end
  end

  private

  def carertochild_params
    params.require(:carer_to_child).permit(:carer_id,
                                           :child_id,
                                           :relationship)
  end
end
