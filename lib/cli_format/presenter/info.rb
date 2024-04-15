class CliFormat::Presenter
  class Info < Base
    # This format probably works best for 2 columns, though it can
    # support an arbitrary number of columns.
    # It produces aligned text output. Example:
    #
    #   Name          demo
    #   Description   demo-dev-ci
    #   Source        GITHUB
    #
    def text
      column_widths = []
      @rows.each do |row|
        next if skip?(row)
        row.each_with_index do |cell, i|
          column_widths[i] = [column_widths[i].to_i, cell.to_s.length].max
        end
      end

      spacing = @options[:spacing] || "   "
      lines = @rows.map do |row|
        items = []
        next if skip?(row)
        row.each_with_index do |cell, i|
          items << cell.to_s.ljust(column_widths[i]) unless cell.nil?
        end
        items.join(spacing)
      end
      lines.compact.join("\n")
    end

    # special rule to skip when second column is blank
    def skip?(row)
      column_size == 2 && row[1].blank?
    end

    def column_size
      @rows.first.size
    end
  end
end
