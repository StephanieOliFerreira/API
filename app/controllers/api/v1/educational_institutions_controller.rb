class Api::V1::EducationalInstitutionsController < ApplicationController
    #GET
    def index 
        @institutions = EducationalInstitution.order("id DESC")
        render json: @institutions
    end

    #GET
    def show
        @institution = EducationalInstitution.find(params[:id])
        render json: @institution
    end

    #Post
    def create
        @institution = EducationalInstitution.new(institutions_params)
        if @institution.save
            render json: @institution, status: :created
        else 
            render json: @institution.errors, status: :unprocessable_entity
        end
    end

    def institutions_params
        params.permit(:name, :cnpj, :institution_type)
    end
end



