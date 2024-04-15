module CliFormat
  class Presenter
    attr_accessor :header, :rows
    def initialize(options = {})
      @options = options
      @rows = []
    end

    delegate :text,
      :empty_message,
      :empty_message=,
      :header,
      :header=,
      :show,
      to: :strategy

    def strategy
      return @strategy if @strategy
      strategy_class = begin
        "CliFormat::Presenter::#{format.camelize}".constantize
      rescue NameError => e
        default = CliFormat.default_format
        puts "WARN: format not found: #{format}. Using default format: #{default}"
        "CliFormat::Presenter::#{default.camelize}".constantize
      end
      @strategy = strategy_class.new(@options, @header, @rows)
    end

    # Formats: tabs, markdown, json, csv, table, etc
    def format
      @options[:format] || ENV["CLI_FORMAT"] || CliFormat.default_format # table
    end
  end
end
