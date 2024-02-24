require "text-table"

class CliFormat::Presenter
  class Table < Base
    def text
      table = Text::Table.new
      table.head = @header if @header
      table.rows = @rows
      table
    end
  end
end
