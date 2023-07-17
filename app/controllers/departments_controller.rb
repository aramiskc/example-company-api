class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    render :index 
  end

  def show
    @department = Department.find_by(id: params[:id])
    render :show
  end

  def create 
    @department = Department.create(
      name: params["name"],
      manager: params["manager"],
      code: params["code"],
    )
    if @department.save
      render :show
    else
      render json: { errors: @department.errors.full_messages }, status: 422
    end
  end

  def update
    @department = Department.find_by(id: params[:id])
    @department.update(
      name: params["name"] || @department.name,
      manager: params["manager"] || @department.manager,
      code: params["code"] || @department.code,
    )
   
    if @department.save 
      render :show
    else
      render json: { errors: @department.errors.full_messages }, status: 422
    end
    
  end

  def destroy
    @department = Department.find_by(id: params[:id])
    @department.destroy 
    render json: { message: "Record destroyed"}
  end

  
end

