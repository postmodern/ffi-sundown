require 'ffi/sundown/sundown'

module FFI
  module Sundown
    class Buffer < FFI::Struct

      layout :data, :pointer,
             :size, :size_t,
             :asize, :size_t,
             :unit, :size_t,
             :ref, :int

      #
      # Creates a new empty buffer.
      #
      # @param [Integer] size
      #   The size of the new buffer.
      #
      # @yield [buffer]
      #   The given block will be passed the new buffer.
      #
      # @yieldparam [Buffer] buffer
      #   The new buffer.
      #
      # @return []
      #   Once the block has returned, the buffer will be released.
      #
      def self.create_empty(size)
        buffer = new(Sundown.bufnew(size))

        yield buffer

        Sundown.bufrelease(buffer)
      end

      #
      # Creates a new buffer.
      #
      # @param [String] text
      #   The text to populate the buffer with.
      #
      # @yield [buffer]
      #   The given block will be passed the new buffer.
      #
      # @yieldparam [Buffer] buffer
      #   The new buffer.
      #
      # @return []
      #   Once the block has returned, the buffer will be deallocated.
      #
      def self.create_from(text)
        data = FFI::MemoryPointer.new(:char,text.length + 1)
        data.put_string(0,text)

        buffer = new()
        buffer[:size] = text.length
        buffer[:data] = data

        yield buffer

        data.free
      end

      #
      # Increases the size of the buffer.
      #
      # @param [Integer] length
      #   The length to increase the buffer by.
      #
      def grow(length)
        Sundown.bufgrow(self,length)
      end

      #
      # The contents of the buffer.
      #
      # @return [String]
      #   The data within the buffer.
      #
      def to_s
        self[:data].get_string(0,self[:size])
      end

      #
      # Applies smartypants rendering to the buffer.
      #
      # @return [String]
      #   The smartypants rendered contents of the buffer.
      #
      def to_smartypants
        result = nil

        Buffer.create_empty(128) do |smart_buffer|
          Sundown.upshtml_smartypants(smart_buffer,self)

          result = self.to_s
        end

        return result
      end

    end
  end
end
