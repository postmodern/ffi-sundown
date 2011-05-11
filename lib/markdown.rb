require 'ffi/upskirt/document'

unless Object.const_defined?(:Markdown)
  Object.const_set(:Markdown,FFI::Upskirt::Document)
end
