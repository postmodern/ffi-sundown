require 'ffi/sundown/document'

unless Object.const_defined?(:Markdown)
  Object.const_set(:Markdown,FFI::Sundown::Document)
end
