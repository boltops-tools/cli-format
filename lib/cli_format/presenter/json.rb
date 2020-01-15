require "json"

class CliFormat::Presenter
  class Json < Base
    def text
      json_data = {
        header: @header,
        data: @rows
      }
      JSON.pretty_generate(json_data)
    end
  end
end
