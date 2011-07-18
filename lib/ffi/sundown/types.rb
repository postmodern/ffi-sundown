require 'ffi'

module FFI
  module Sundown
    extend FFI::Library

    enum :markdown_autolink, [
      :not_autolink,
      :normal,
      :email
    ]

    enum :markdown_extensions, [
      :no_intra_emphasis, (1 << 0),
      :tables, (1 << 1),
      :fenced_code, (1 << 2),
      :autolink, (1 << 3),
      :strikethrough, (1 << 4),
      :lax_html_blocks, (1 << 5),
      :space_headers, (1 << 6)
    ]

    enum :render_mode, [
      :skip_html, (1 << 0),
      :skip_style, (1 << 1),
      :skip_images, (1 << 2),
      :skip_links, (1 << 3),
      :expand_tabs, (1 << 5),
      :safelink, (1 << 7),
      :toc, (1 << 8),
      :hard_wrap, (1 << 9),
      :github_blockcode, (1 << 10),
      :use_xhtml, (1 << 11)
    ]

    # block level callbacks - NULL skips the block
    callback :blockcode_callback, [:pointer, :pointer, :pointer, :pointer], :void
    callback :blockquote_callback, [:pointer, :pointer, :pointer], :void
    callback :blockhtml_callback, [:pointer, :pointer, :pointer], :void
    callback :header_callback, [:pointer, :pointer, :int, :pointer], :void
    callback :hrule_callback, [:pointer, :pointer], :void
    callback :list_callback, [:pointer, :pointer, :int, :pointer], :void
    callback :listitem_callback, [:pointer, :pointer, :int, :pointer], :void
    callback :paragraph_callback, [:pointer, :pointer, :pointer], :void
    callback :table_callback, [:pointer, :pointer, :pointer, :pointer], :void
    callback :table_row_callback, [:pointer, :pointer, :pointer], :void
    callback :table_cell_callback, [:pointer, :pointer, :int, :pointer], :void

    # span level callbacks - NULL or return 0 prints the span verbatim
    callback :autolink_callback, [:pointer, :pointer, :markdown_autolink, :pointer], :int
    callback :codespan_callback, [:pointer, :pointer, :pointer], :int
    callback :double_emphasis_callback, [:pointer, :pointer, :pointer], :int
    callback :emphasis_callback, [:pointer, :pointer, :pointer], :int
    callback :image_callback, [:pointer, :pointer, :pointer, :pointer, :pointer], :int
    callback :linebreak_callback, [:pointer, :pointer], :int
    callback :link_callback, [:pointer, :pointer, :pointer, :pointer, :pointer], :int
    callback :raw_html_tag_callback, [:pointer, :pointer, :pointer], :int
    callback :triple_emphasis_callback, [:pointer, :pointer, :pointer], :int
    callback :strikethrough_callback, [:pointer, :pointer, :pointer], :int

    # low level callbacks - NULL copies input directly into the output
    callback :entity_callback, [:pointer, :pointer, :pointer], :void
    callback :normal_text_callback, [:pointer, :pointer, :pointer], :void

    # header and footer
    callback :doc_header_callback, [:pointer, :pointer], :void
    callback :doc_footer_callback, [:pointer, :pointer], :void
  end
end
