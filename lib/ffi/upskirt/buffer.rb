require 'ffi/upskirt/upskirt'

module FFI
  module Upskirt
    class Buffer < FFI::Struct

      layout :data, :pointer,
             :size, :size_t,
             :asize, :size_t,
             :unit, :size_t,
             :ref, :int

      def to_smartypants
        smart_buffer = Upskirt.bufnew(128)

        Upskirt.upshtml_smartypants(smart_buffer,self)
        result = smart_buffer.data.get_string(0,smart_buffer.size)

        smart_buffer.free
        return result
      end

    end
  end
end
