class CliFormat::Presenter
  class Equal < Base
    def text
      @buffer << @header.join(" = ") if @header
      @rows.each do |row|
        @buffer << row.join(" = ")
      end
      @buffer.join("\n")
    end
  end
end
