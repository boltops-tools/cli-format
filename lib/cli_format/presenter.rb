module CliFormat
  class Presenter
    attr_accessor :header, :rows
    def initialize(options)
      @options = options
      @rows = []
    end

    def show
      presenter_class = "CliFormat::Presenter::#{format.classify}".constantize
      presenter = presenter_class.new(@options, @header, @rows)
      presenter.show
    end

    # Formats: tabs, markdown, json, csv, table, etc
    def format
      @options[:format] || ENV['CLI_FORMAT'] || "table"
    end
  end
end
