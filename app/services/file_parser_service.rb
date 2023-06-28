class FileParserService
    def parse(line)
      record_type = line[0]
      parser = get_parser_for(record_type)
      parsed_data = parser.parse(line)
  
      parsed_data
    end
  
    def get_parser_for(record_type)
      case record_type
      when '1'
        OperatingCompanyParser.new
      when '2'
        OhioServiceDeliveryPointsParser.new
      else
        raise "No parser found for record type: #{record_type}"
      end
    end
  end