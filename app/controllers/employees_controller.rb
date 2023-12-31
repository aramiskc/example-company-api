class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    render :index 
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    render :show
  end

  def create 
    @employee = Employee.create(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone: params["phone"],
      job_title: params["job_title"],
      department_id: params["department_id"],
    )
    
    if @employee.save
      render :show
    else
      render json: { errors: @employee.errors.full_messages }, status: 422
    end
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    @employee.update(
      first_name: params["first_name"] || @employee.first_name,
      last_name: params["last_name"] || @employee.last_name,
      email: params["email"] || @employee.email,
      phone: params["phone"] || @employee.phone,
      job_title: params["job_title"] || @employee.job_title,
      department_id: params["department_id"] || @employee.department_id
    )
    if @employee.save
      render :show
    else
      render json: { errors: @employee.errors.full_messages }, status: 422
    end 
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy 
    render json: { message: "Record destroyed"}
  end



end
