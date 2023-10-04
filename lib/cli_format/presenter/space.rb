class CliFormat::Presenter
  class Space < Base
    extend Memoist

    def text
      @buffer << format_row(@header, max_widths) if @header
      @rows.each do |row|
        @buffer << format_row(row, max_widths)
      end

      @buffer.join("\n")
    end

    def max_widths
      all_rows = [@header, *@rows].compact
      max_widths = Array.new(all_rows[0].size, 0)

      all_rows.each do |row|
        row.each_with_index do |col, idx|
          max_widths[idx] = [max_widths[idx], col.to_s.length].max
        end
      end

      max_widths
    end
    memoize :max_widths

    def format_row(row, max_widths)
      formatted_row = row.each_with_index.map do |col, idx|
        idx == row.size - 1 ? col.to_s : col.to_s.ljust(max_widths[idx])
      end

      formatted_row.join(formatted_row_separator)
    end

    # interface method
    def formatted_row_separator
      " "
    end
  end
end
