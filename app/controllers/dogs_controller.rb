class DogsController < ApplicationController

  before_action :get_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    @employees = Employee.all
  end


  def create
    @dog = Dog.create(dog_params)
    if @dog.valid?
      redirect_to @dog
    else
      flash[:errors] = @dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def show

  end

  def edit
    @employees = Employee.all
  end

  def update

  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def get_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, employee_ids: [])
  end

end
