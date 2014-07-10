class CarersController < ApplicationController

  before_action :load_carer , only: [:update, :edit, :show, :add_child]

  def new
    @carer = Carer.new
  end
  def create
    @carer = Carer.new(carer_params)

    if @carer.save
      redirect_to @carer
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @carer.update(carer_params)
      redirect_to @carer
    else
      render 'edit'
    end
  end
  def show
  end
  def index
    @carers = Carer.in_order
  end
  def add_child
    @children = Child.in_order
    if params[:find_text].present? 
      @children = @children.search(params[:find_text])
    end
  end
  private
    def carer_params
      params.require(:carer).permit(:name, :phone, :address, :postcode,
                                    :email, :can_contact)
    end

    def load_carer
      @carer = Carer.find(params[:id])
    end
end
