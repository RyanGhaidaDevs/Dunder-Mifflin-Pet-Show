class EmployeesController < ApplicationController

  before_action :get_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all

    if params[:search]
      @employees = Employee.search(params[:search]).order("created_at DESC")
    else
      @employees = Employee.all.order("created_at DESC")
    end
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end


  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
    redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def show

  end

  def edit
    @dogs = Dog.all
  end

  def update

  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
  end

end
