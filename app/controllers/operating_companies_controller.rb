class OperatingCompaniesController < ApplicationController
  before_action :set_operating_company, only: [:show, :update, :destroy]
  before_action :set_operating_company_for_create, only: [:create, :validate]

  def index
    @operating_companies = OperatingCompany.all
    render json: @operating_companies
  end

  def show
    render json: @operating_company
  end

  def create
    if @operating_company.save
      render json: @operating_company, status: :created
    else
      render json: @operating_company.errors, status: :unprocessable_entity
    end
  end

  def update
    if @operating_company.update(operating_company_params)
      render json: @operating_company
    else
      render json: @operating_company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @operating_company.destroy
    head :no_content
  end

  def validate
    if @operating_company.valid?
      render json: { valid: true }
    else
      render json: { valid: false, errors: @operating_company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_operating_company
    @operating_company = OperatingCompany.find(params[:id])
  end

  def set_operating_company_for_create
    @operating_company = OperatingCompany.new(operating_company_params)
  end

  def operating_company_params
    params.require(:operating_company).permit(:name, :description) # Update with your permitted parameters
  end
end
