# frozen_string_literal: true

class RegisterLeadersController < ApplicationController
  before_action :load_meet, only: %i[new create]

  def new
    @leaders = Leader.in_order
    @leaders = @leaders.search(params[:find_text]) if params[:find_text].present?

    @leaders -= @meet.leaders
  end

  def create
    @meet.leaders << Leader.find(params[:leader_id]) if params[:leader_id].present?
    # raise params.inspect
    redirect_to register_meet_path(@meet)
  end

  private

  def load_meet
    @meet = Meet.find(params[:meet_id])
  end
end
