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

  private

  def snack_params
    params.require(:snack).permit(:name, :quality)
  end
end