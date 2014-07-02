class SnacksController < ApplicationController

  def index
    @snack = Snack.new
    @snacks = Snack.all
  end

  def create
    @snack = Snack.create(snack_params)
    if @snack.save
      redirect_to snacks_path
    else
      render :index
    end
  end

  def show
    @snack = Snack.find(params[:id])
  end

  def edit
    @snack = Snack.find(params[:id])
  end

  def update
    @snack = Snack.find(params[:id])
    @snack.update_attributes!(snack_params)

    redirect_to snacks_path
  end

  def destroy
    @snack = Snack.find(params[:id]).delete

    redirect_to snacks_path
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :quality)
  end
end