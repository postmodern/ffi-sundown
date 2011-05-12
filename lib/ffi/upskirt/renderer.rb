require 'ffi/upskirt/upskirt'

module FFI
  module Upskirt
    class Renderer < FFI::Struct

      layout :blockcode, :blockcode_callback,
             :blockquote, :blockquote_callback,
             :blockhtml, :blockhtml_callback,
             :header, :header_callback,
             :hrule, :hrule_callback,
             :list, :list_callback,
             :listitem, :listitem_callback,
             :paragraph, :paragraph_callback,
             :table, :table_callback,
             :table_row, :table_row_callback,
             :table_cell, :table_cell_callback,
             :autolink, :autolink_callback,
             :codespan, :codespan_callback,
             :double_emphasis, :double_emphasis_callback,
             :emphasis, :emphasis_callback,
             :image, :image_callback,
             :linebreak, :linebreak_callback,
             :link, :link_callback,
             :raw_html_tag, :raw_html_tag_callback,
             :triple_emphasis, :triple_emphasis_callback,
             :strikethrough, :strikethrough_callback,
             :entity, :entity_callback,
             :normal_text, :normal_text_callback,
             :doc_header, :doc_header_callback,
             :doc_footerm, :doc_footer_callback,
             :opaque, :pointer

      #
      # Creates a new HTML renderer.
      #
      # @param [Integer] flags
      #   Render flags for the new renderer.
      #
      # @yield [renderer]
      #   The given block will be passed the new renderer.
      #
      # @yieldparam [Renderer] renderer
      #   The new renderer.
      #
      # @return []
      #   After the given block has returned, the renderer will be freed.
      #
      def Renderer.html(flags)
        renderer = new
        Upskirt.upshtml_renderer(renderer,flags)

        yield renderer

        Upskirt.upshtml_free_renderer(renderer)
      end

      #
      # Creates a new Table of Contents (TOC) renderer.
      #
      # @param [Integer] flags
      #   Render flags for the new renderer.
      #
      # @yield [renderer]
      #   The given block will be passed the new renderer.
      #
      # @yieldparam [Renderer] renderer
      #   The new renderer.
      #
      # @return []
      #   After the given block has returned, the renderer will be freed.
      #
      def Renderer.toc
        renderer = new
        Upskirt.upshtml_toc_renderer(renderer)

        yield renderer

        Upskirt.upshtml_free_renderer(renderer)
      end

    end
  end
end
