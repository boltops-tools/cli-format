class CliFormat::Presenter
  class Markdown < Space
    def text
      if @header
        @buffer << format_row(@header, max_widths)
        second_line = @header.map { |h| "---" }
        @buffer << format_row(second_line, max_widths)
      end
      @rows.each do |row|
        @buffer << format_row(row, max_widths)
      end
      @buffer.join("\n")
    end

    # interface method
    def formatted_row_separator
      " | "
    end
  end
end
