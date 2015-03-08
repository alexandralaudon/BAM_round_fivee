class CheesesController < ApplicationController
  before_action :current_user

  def index
    @cheeses = Cheese.all
  end

  def new
    @cheese = Cheese.new
  end

  def create
    @cheese = Cheese.new(params.require(:cheese).permit(:name, :price_per_lb))
    if @cheese.save
      flash[:notice] = 'Cheese created successfully!'
      redirect_to cheeses_path
    else
      render :new
    end
  end

  def show
    @cheese = Cheese.find(params[:id])
  end

  def edit
    @cheese = Cheese.find(params[:id])
  end

  def update
    @cheese = Cheese.find(params[:id])
    if @cheese.update(params.require(:cheese).permit(:name, :price_per_lb))
      flash[:notice] = 'Cheese updated successfully!'
      redirect_to cheese_path(@cheese)
    else
      render :edit
    end
  end

  def destroy
    cheese = Cheese.find(params[:id])
    cheese.destroy
    flash[:notice] = "Deleted cheese: #{cheese.name}"
    redirect_to cheeses_path
  end
end
