module Parser
  module Source
    class Range
      include Comparable

      ##
      # @param [Hash] Endpoint(s) to change, any combination of :begin_pos or :end_pos
      # @return [Range] the same range as this range but with the given end point(s) changed
      # to the given value(s).
      #
      def with(begin_pos: @begin_pos, end_pos: @end_pos)
        Range.new(@source_buffer, begin_pos, end_pos)
      end

      ##
      # @param [Hash] Endpoint(s) to change, any combination of :begin_pos or :end_pos
      # @return [Range] the same range as this range but with the given end point(s) adjusted
      # by the given amount(s)
      #
      def adjust(begin_pos: 0, end_pos: 0)
        Range.new(@source_buffer, @begin_pos + begin_pos, @end_pos + end_pos)
      end

      ##
      # Return `true` iff this range and `other` are disjoint.
      #
      # Two ranges must be one and only one of ==, disjoint?, contains?, contained? or crossing?
      #
      # @param [Range] other
      # @return [Boolean]
      #
      def disjoint?(other)
        if empty? && other.empty?
          @begin_pos != other.begin_pos
        else
          @begin_pos >= other.end_pos || other.begin_pos >= @end_pos
        end
      end

      ##
      # Return `true` iff this range is not disjoint from `other`.
      #
      # @param [Range] other
      # @return [Boolean] `true` if this range and `other` overlap
      #
      def overlaps?(other)
        !disjoint?(other)
      end

      ##
      # Returns true iff this range contains (strictly) `other`.
      #
      # Two ranges must be one and only one of ==, disjoint?, contains?, contained? or crossing?
      #
      # @param [Range] other
      # @return [Boolean]
      #
      def contains?(other)
        (other.begin_pos <=> @begin_pos) + (@end_pos <=> other.end_pos) >= (other.empty? ? 2 : 1)
      end

      ##
      # Return `other.contains?(self)`
      #
      # Two ranges must be one and only one of ==, disjoint?, contains?, contained? or crossing?
      #
      # @param [Range] other
      # @return [Boolean]
      #
      def contained?(other)
        other.contains?(self)
      end

      ##
      # Returns true iff both ranges intersect and also have different elements from one another.
      #
      # Two ranges must be one and only one of ==, disjoint?, contains?, contained? or crossing?
      #
      # @param [Range] other
      # @return [Boolean]
      #
      def crossing?(other)
        return false unless overlaps?(other)
        (@begin_pos <=> other.begin_pos) * (@end_pos <=> other.end_pos) == 1
      end

      ##
      # Compare ranges, first by begin_pos, then by end_pos.
      #
      def <=>(other)
        return nil unless other.is_a?(::Parser::Source::Range) &&
          @source_buffer == other.source_buffer
        (@begin_pos <=> other.begin_pos).nonzero? ||
        (@end_pos <=> other.end_pos)
      end
    end
  end
end
