class OperatingCompanyParser
    FIELD_SIZES = {
      record_type: 1,
      date_of_file: 8,
      LDC_name: 60,
      date_from_file: 10,
      date_to_file: 10
    }.freeze
  
    def parse(line)
      parsed_data = {}
      position = 0
  
      FIELD_SIZES.each do |field_name, size|
        parsed_data[field_name] = line[position, size].strip
        position += size
      end
  
      parsed_data
    end
  end
  