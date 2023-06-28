class OhioServiceDeliveryPointsParser
  FIELD_SIZES_TYPE_1 = {
    record_type: 1,
    date_of_file: 8,
    LDC_name: 60,
    date_from_file: 10,
    date_to_file: 10
  }.freeze

  FIELD_SIZES_TYPE_2 = {
    record_type: 1,
    profile_group: 8,
    customer_name: 35,
    service_address_1: 55,
    service_address_2: 55,
    service_city: 20,
    service_state: 2,
    service_postal_code: 9,
    billing_address_1: 35,
    billing_address_2: 35,
    billing_city: 20,
    billing_state: 2,
    billing_postal_code: 9,
  }.freeze

  def parse(content)
    lines = content.split("\n")
    parsed_data_array = []

    lines.each do |line|
      record_type = line[0]

      if record_type == '1'
        parsed_data_array << parse_type_1(line)
      elsif record_type == '2'
        parsed_data_array << parse_type_2(line)
      end
    end

    parsed_data_array
  end

  private

  def parse_type_1(line)
    parsed_data = {}
    position = 0

    FIELD_SIZES_TYPE_1.each do |field_name, size|
      parsed_data[field_name] = line[position, size].strip
      position += size
    end

    parsed_data
  end

  def parse_type_2(line)
    parsed_data = {}
    position = 0

    FIELD_SIZES_TYPE_2.each do |field_name, size|
      parsed_data[field_name] = line[position, size].strip
      position += size
    end

    parsed_data
  end
end
