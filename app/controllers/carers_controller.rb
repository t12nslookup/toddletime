class CarersController < ApplicationController
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
    @carer = Carer.find(params[:id])
  end
  def update
    @carer = Carer.find(params[:id])
    if @carer.update(carer_params)
      redirect_to @carer
    else
      render 'edit'
    end
  end
  def show
    @carer = Carer.find(params[:id])
  end
  def index
    @carers = Carer.order('name')
  end
  private
    def carer_params
      params.require(:carer).permit(:name, :phone, :email,
                                    :can_contact)
    end
end
