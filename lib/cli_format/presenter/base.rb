class CliFormat::Presenter
  class Base
    def initialize(options, header, rows)
      @options, @header, @rows = options, header, rows
      @buffer = []
    end

    def show
      puts text
    end
  end
end
