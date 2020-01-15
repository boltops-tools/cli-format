require 'csv'

class CliFormat::Presenter
  class Csv < Base
    def text
      CSV.generate do |csv|
        csv << @header if @header
        @rows.each do |row|
          csv << row
        end
      end
    end
  end
end
