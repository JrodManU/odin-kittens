class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created successfully!"
      redirect_to @kitten
    else
      flash.now[:warning] = "You done messed up"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten updated successfully!"
      redirect_to @kitten
    else
      flash.now[:warning] = "You done messed up"
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten destroyed successfully!"
    redirect_to root_url
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
