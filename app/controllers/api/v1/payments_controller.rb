class Api::V1::PaymentsController < ApplicationController
    #GET
    def index
        @payments = Payment.order("id DESC")
        render json: @payments
    end
    #GET
    def show
        @payment = Payment.find(params[:id])
        render json: @payment
    end
    #POST
    def create
        @payment = Payment.new(payment_params)
        if @payment.save
            render json: @payment, status: :create
        else
            render json: @payment.errors, status: :unprocessable_entity
        end
    end

    def payment_params
        params.permit(:enrollment, :payment_value, :due_date, :status)
    end
end
