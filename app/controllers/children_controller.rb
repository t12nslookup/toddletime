class ChildrenController < ApplicationController
  before_action :load_child , only: [:update, :edit, :show, :add_carer]

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
  def edit
  end
  def update
    if @child.update(child_params)
      redirect_to @child
    else
      render 'edit'
    end
  end
  def show
  end
  def index
    @children = Child.in_order
  end
  def add_carer
    @carers = Carer.in_order
    if params[:find_text].present? 
      @carers = @carers.search(params[:find_text])
    end
  end
  private
    def child_params
      params.require(:child).permit(:name, :gender, :date_of_birth,
                                    :address, :postcode, :medical_conditions,
                                    :special_needs, :registered_date)
    end
    def load_child
      @child = Child.find(params[:id])
    end
end
