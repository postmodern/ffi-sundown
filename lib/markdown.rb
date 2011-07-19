unless defined?(:Markdown)
  require 'ffi/sundown/document'

  Markdown ||= FFI::Sundown::Document
end
