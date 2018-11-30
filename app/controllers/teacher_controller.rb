class TeacherController < ApplicationController
  
  def show
    @teacher = Teacher.find(params[:id])
  end

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = "You have successfully added a new teacher :)"
      redirect_to @teacher
    else
      render 'new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :address, :phone_number, :birthday, :password, :password_confirmation)
  end
end
