require 'ffi'

module FFI
  module Upskirt
    class Buffer < FFI::Struct

      layout :data, :pointer,
             :size, :size_t,
             :asize, :size_t,
             :unit, :size_t,
             :ref, :int

    end
  end
end
