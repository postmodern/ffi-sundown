require 'ffi/upskirt/types'

require 'ffi'

module FFI
  module Upskirt
    extend FFI::Library

    ffi_lib 'upskirt'

    attach_function :bufcasecmp, [:pointer, :pointer], :int
    attach_function :bufcmp, [:pointer, :pointer], :int
    attach_function :bufcmps, [:pointer, :string], :int
    attach_function :bufprefix, [:pointer, :string], :int
    attach_function :bufdup, [:pointer, :size_t], :pointer
    attach_function :bufgrow, [:pointer, :size_t], :int
    attach_function :bufnew, [:size_t], :pointer
    attach_function :bufnullterm, [:pointer], :void
    attach_function :bufprintf, [:pointer, :string, :varargs], :void
    attach_function :bufput, [:pointer, :buffer_in, :size_t], :void
    attach_function :bufputs, [:pointer, :string], :void
    attach_function :bufputc, [:pointer, :char], :void
    attach_function :bufrelease, [:pointer], :void
    attach_function :bufreset, [:pointer], :void
    attach_function :bufset, [:pointer, :pointer], :void
    attach_function :bufslurp, [:pointer, :size_t], :void
    attach_function :buftoi, [:pointer, :size_t, :pointer], :int

    MKD_LIST_ORDERED = 1
    MKD_LI_BLOCK = 2
    MKD_TABLE_ALIGN_L = (1 << 0)
    MKD_TABLE_ALIGN_R = (1 << 1)
    MKD_TABLE_ALIGN_CENTER = (MKD_TABLE_ALIGN_L | MKD_TABLE_ALIGN_R)

    attach_function :is_safe_link, [:pointer, :size_t], :int
    attach_function :ups_markdown, [:pointer, :pointer, :pointer, :uint], :void
    attach_function :ups_version, [:pointer, :pointer, :pointer], :void

    attach_function :upshtml_renderer, [:pointer, :uint], :void
    attach_function :upshtml_toc_renderer, [:pointer], :void
    attach_function :upshtml_free_renderer, [:pointer], :void
    attach_function :upshtml_smartypants, [:pointer, :pointer], :void

    #
    # Returns the version of the installed `libupskirt`.
    #
    # @return [String]
    #   The version string.
    #
    def Upskirt.version
      ints = FFI::MemoryPointer.new(:int,3)

      ups_version(ints[0],ints[1],ints[2])

      return ints.get_array_of_int(0,3).join('.')
    end
  end
end
