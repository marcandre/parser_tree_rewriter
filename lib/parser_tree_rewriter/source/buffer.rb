module Parser
  module Source
    class Buffer
      def source_range
        @source_range ||= Range.new(self, 0, source.size)
      end
    end
  end
end
