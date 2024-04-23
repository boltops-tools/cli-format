require "json"

class CliFormat::Presenter
  class Json < Base
    def text
      json_data = if @header
        @rows.map do |row|
          item = {}
          @header.each_with_index do |header, i|
            item[header] = row[i]
          end
          item
        end
      elsif @rows.first.size == 2
        @rows.each_with_object({}) { |(k, v), h|
          h[k] = v
        }
      else # 1 row
        @rows
      end

      JSON.pretty_generate(json_data)
    end
  end
end
