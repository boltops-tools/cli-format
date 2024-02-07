module CliFormat
  class Presenter
    attr_accessor :header, :rows
    def initialize(options={})
      @options = options
      @rows = []
    end

    delegate :text, :show, :emtpy_message, :empty_message=, to: :presenter

    def presenter
      return @presenter if @presenter
      presenter_class = begin
        "CliFormat::Presenter::#{format.camelize}".constantize
      rescue NameError => e
        default = CliFormat.default_format
        puts "WARN: format not found: #{format}. Using default format: #{default}"
        "CliFormat::Presenter::#{default.camelize}".constantize
      end
      @presenter = presenter_class.new(@options, @header, @rows)
    end

    # Formats: tabs, markdown, json, csv, table, etc
    def format
      @options[:format] || ENV['CLI_FORMAT'] || CliFormat.default_format # table
    end
  end
end
