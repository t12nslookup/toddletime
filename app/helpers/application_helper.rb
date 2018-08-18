module ApplicationHelper

  def errors_for object
    render 'common/errors', object: object
  end
end
