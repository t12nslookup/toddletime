# frozen_string_literal: true

module ApplicationHelper
  def errors_for(object)
    render 'common/errors', object:
  end
end
