module Api
  class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      saved_leads = Lead.all
      render json: saved_leads, status: :ok
    end

    def create
      leads_params = params.require(:lead)

      leads_params.each do |lead_params|
        lead = Lead.new(lead_params.permit(:record_type, :profile_group, :customer_name, :service_address_1, :service_address_2, :service_city, :service_state, :service_postal_code, :billing_address_1, :billing_address_2, :billing_city, :billing_state, :billing_postal_code))

        if lead.save
          Rails.logger.info "Lead saved successfully: #{lead.inspect}"
        else
          Rails.logger.error "Failed to save lead: #{lead.errors.full_messages.join(', ')}"
        end
      end

      render json: { message: 'Leads created successfully.' }, status: :ok
    rescue => e
      Rails.logger.error "An error occurred while creating leads: #{e.message}"
      render json: { error: 'An error occurred while creating leads.' }, status: :unprocessable_entity
    end

    private

    def permit_lead_params(params)
      params.permit(
        :record_type,
        :profile_group,
        :customer_name,
        :service_address_1,
        :service_address_2,
        :service_city,
        :service_state,
        :service_postal_code,
        :billing_address_1,
        :billing_address_2,
        :billing_city,
        :billing_state,
        :billing_postal_code
      )
    end
  end
end
