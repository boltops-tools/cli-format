require "json"

class CliFormat::Presenter
  class Json < Base
    def text
      json_data = @rows.map do |row|
        item = {}
        @header.each_with_index do |header, i|
          item[header] = row[i]
        end
        item
      end
      JSON.pretty_generate(json_data)
    end
  end
end
