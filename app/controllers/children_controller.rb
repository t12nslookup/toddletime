class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end
  def create
    @child = Child.new(child_params)

    if @child.save
      redirect_to @child
    else
      render 'new'
    end
  end
  def edit
    @child = Child.find(params[:id])
  end
  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      redirect_to @child
    else
      render 'edit'
    end
  end
  def show
    @child = Child.find(params[:id])
  end
  def index
    @children = Child.order('name')
  end
  private
    def child_params
      params.require(:child).permit(:name, :gender, :date_of_birth,
                                    :address, :postcode, :medical_conditions,
                                    :special_needs, :registered_date)
    end
end
