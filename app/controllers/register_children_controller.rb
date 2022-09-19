# frozen_string_literal: true

class RegisterChildrenController < ApplicationController
  before_action :load_meet, only: %i[new create]

  def new
    @children = Child.in_order
    @children = @children.recent if params[:historic].blank?
    @children = @children.search(params[:find_text]) if params[:find_text].present?

    @children -= @meet.children
  end

  def create
    @meet.children << Child.find(params[:child_id]) if params[:child_id].present?
    # raise params.inspect
    redirect_to register_meet_path(@meet)
  end

  private

  def load_meet
    @meet = Meet.find(params[:meet_id])
  end
end
