class CliFormat::Presenter
  class Tab < Base
    def text
      @buffer << @header.join("\t") if @header
      @rows.each do |row|
        @buffer << row.join("\t")
      end
      @buffer.join("\n")
    end
  end
end
