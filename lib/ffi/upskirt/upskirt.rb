require 'ffi/upskirt/types'

require 'ffi'

module FFI
  module Upskirt
    extend FFI::Library

    ffi_lib 'upskirt'

    attach_function :bufcasecmp, [:pointer, :pointer], :int
    attach_function :bufcmp, [:pointer, :pointer], :int
    attach_function :bufcmps, [:pointer, :pointer], :int
    attach_function :bufprefix, [:pointer, :pointer], :int
    attach_function :bufdup, [:pointer, :size_t], :pointer
    attach_function :bufgrow, [:pointer, :size_t], :int
    attach_function :bufnew, [:size_t], :pointer
    attach_function :bufnullterm, [:pointer], :void
    attach_function :bufprintf, [:pointer, :pointer, :varargs], :void
    attach_function :bufput, [:pointer, :pointer, :size_t], :void
    attach_function :bufputs, [:pointer, :pointer], :void
    attach_function :bufputc, [:pointer, :char], :void
    attach_function :bufrelease, [:pointer], :void
    attach_function :bufreset, [:pointer], :void
    attach_function :bufset, [:pointer, :pointer], :void
    attach_function :bufslurp, [:pointer, :size_t], :void
    attach_function :buftoi, [:pointer, :size_t, :pointer], :int

    MARKDOWN_LIST_ORDERED = 1
    MARKDOWN_LI_BLOCK = 2
    MARKDOWN_TABLE_ALIGN_L = (1 << 0)
    MARKDOWN_TABLE_ALIGN_R = (1 << 1)
    MARKDOWN_TABLE_ALIGN_CENTER = (
      MARKDOWN_TABLE_ALIGN_L | MARKDOWN_TABLE_ALIGN_R
    )

    attach_function :is_safe_link, [:pointer, :size_t], :int
    attach_function :ups_markdown, [:pointer, :pointer, :pointer, :uint], :void
  end
end
