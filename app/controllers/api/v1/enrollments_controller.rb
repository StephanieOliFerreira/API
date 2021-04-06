class Api::V1::EnrollmentsController < ApplicationController
    #GET
    def index
        @enrollments = Enrollment.order("id DESC")
        render json: @enrollments
    end

    #GET
    def show
        @enrollment = Enrollment.find(params[:id])
        render json: @enrollment
    end

    #POST
    def create
        @enrollment = Enrollment.new(enrollment_params)
        if @enrollment.save
            render json: @enrollment, status: :create
        else
            render json: @enrollment.errors, status: :unprocessable_entity
        end
    end

    def enrollment_params
        params.permit(:value_total, :installments, :due_date, :course_name, :educational_institution, :student)
    end
end
