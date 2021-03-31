class Api::V1::StudentsController < ApplicationController
    #Get
    def index
        @students = Student.order("id DESC")
        render json: @students
    end

    #Get
    def show
        @student = Student.find(params[:id])
        render json: @student
    end
    
    #Post
    def create
        @student = Student.new(student_params)
        if @student.save
            render json: @student, status: :create
        else 
            render json: @student.errors, status: :unprocessable_entity
        end
    end  
    
    def student_params
        params.permit(:name, :cpf, :gender, :payment_method)
    end
end
