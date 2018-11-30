class StudentController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end
  
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You have successfully added a new student :)"
      redirect_to @student
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :address, :phone_number, :birthday, :roll_number, :password, :password_confirmation)
  end
end
