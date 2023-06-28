class ServiceDeliveryPointsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    service_delivery_points = ServiceDeliveryPoint.all
    render json: service_delivery_points, status: :ok
  end

  def show
    service_delivery_point = ServiceDeliveryPoint.find(params[:id])
    render json: service_delivery_point, status: :ok
  end

  def preview
    begin
      state_parser = get_parser_for(params[:state])
      file_content = params[:document].read
      utf8_encoded_content = file_content.encode('UTF-8', invalid: :replace, undef: :replace, replace: '')
      parsed_data = state_parser.parse(utf8_encoded_content)

      parsed_data_array = []
      parsed_data.each do |data|
        parsed_data_array << data
      end

      render json: parsed_data_array
    rescue => e
      render json: { error: "An error occurred while processing the document: #{e.message}" }, status: :unprocessable_entity
    end
  end

  def submit
    begin
      state_parser = get_parser_for(params[:state])
      file_content = params[:document].read
      utf8_encoded_content = file_content.encode('UTF-8', invalid: :replace, undef: :replace, replace: '')
      parsed_data = state_parser.parse(utf8_encoded_content)

      data_to_save = []
      parsed_data.each do |data|
        if data[:record_type] == "2"
          data_to_save << data.except(:isSelectedForDatabase)
        end
      end

      errors = []
      data_to_save.each do |data|
        sdp = ServiceDeliveryPoint.new(data)

        if sdp.save
          Rails.logger.info "Successfully saved ServiceDeliveryPoint: #{sdp.inspect}"
        else
          Rails.logger.error "Failed to save ServiceDeliveryPoint: #{sdp.errors.full_messages.join(', ')}"
          errors << { error: "Failed to save ServiceDeliveryPoint: #{sdp.errors.full_messages.join(', ')}" }
        end
      end

      if errors.empty?
        render json: { message: 'Data from document saved successfully.' }, status: :ok
      else
        render json: { errors: errors }, status: :unprocessable_entity
      end

    rescue => e
      render json: { error: "An error occurred while processing the document." }, status: :unprocessable_entity
    end
  end

  private

  def get_parser_for(state)
    case state
    when 'OH'
      OhioServiceDeliveryPointsParser.new
    when 'MI'
      MichiganServiceDeliveryPointsParser.new
    else
      raise "No parser found for state: #{state}"
    end
  end

  def service_delivery_point_params
    params.require(:service_delivery_point).permit(:name, :description, :operating_company_id)
  end
end
