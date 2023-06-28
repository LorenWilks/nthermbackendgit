class OperatingCompany < ApplicationRecord
    validates :LDC_name, presence: true
    def self.find_or_create_by_name(name)
        OperatingCompany.find_by(name: name) || OperatingCompany.create(name: name)
      end
end
