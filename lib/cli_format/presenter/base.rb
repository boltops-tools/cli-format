class CliFormat::Presenter
  class Base
    attr_accessor :header, :rows
    attr_writer :empty_message
    def initialize(options, header, rows)
      @options, @header, @rows = options, header, rows
      @empty_message = "No items found"
      @buffer = []
    end

    def show
      if @rows.empty?
        puts @empty_message
      else
        puts text
      end
    end
  end
end
