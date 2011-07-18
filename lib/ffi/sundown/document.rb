require 'ffi/sundown/types'
require 'ffi/sundown/buffer'
require 'ffi/sundown/renderer'

module FFI
  module Sundown
    class Document

      # The `render_mode` enum
      RENDER_MODES = Sundown.enum_type(:render_mode)

      # The `markdown_extensions` enum
      EXTENSIONS = Sundown.enum_type(:markdown_extensions)

      # Valid options for {#initialize}
      VALID_OPTIONS = RENDER_MODES.symbols + EXTENSIONS.symbols

      attr_accessor :no_intra_emphasis

      attr_accessor :tables

      attr_accessor :fenced_code

      attr_accessor :autolink

      attr_accessor :strikethrough

      attr_accessor :lax_html_blocks

      attr_accessor :space_headers

      attr_accessor :skip_html

      attr_accessor :skip_style

      attr_accessor :skip_images

      attr_accessor :skip_links

      attr_accessor :expand_tabs

      attr_accessor :safelink

      attr_accessor :toc

      attr_accessor :hard_wrap

      attr_accessor :github_blockcode

      attr_accessor :use_xhtml

      attr_accessor :smart

      #
      # Creates a new Document.
      #
      # @param [String] source
      #   The markdown source of the document.
      #
      # @param [Hash] options
      #   Additional options.
      #
      # @option options [Boolean] :smart
      #   Enables additional smartypants rendering.
      #
      def initialize(source='',options={})
        @source = source
        @smart = options.delete(:smart)

        (VALID_OPTIONS & options.keys).each do |key|
          instance_variable_set("@#{key}",options[key])
        end
      end

      #
      # Converts the Markdown Document to HTML.
      #
      # @return [String]
      #   The rendered HTML.
      #
      def to_html
        result = nil

        Renderer.html(render_flags) do |renderer|
          result = render(renderer)
        end

        return result
      end

      #
      # Creates a Table of Contents (TOC) of the document.
      #
      # @return [String]
      #   The rendered Table of Contents.
      #
      def to_toc
        result = nil

        Renderer.toc do |renderer|
          result = render(renderer)
        end

        return result
      end

      protected

      #
      # The enabled markdown extensions flags.
      #
      # @return [Integer]
      #   The combined flags as an unsigned integer.
      #
      def extensions
        flags = 0

        EXTENSIONS.symbols.each do |name|
          if instance_variable_get("@#{name}")
            flags |= EXTENSIONS[name]
          end
        end

        return flags
      end

      #
      # The enabled rendering flags.
      #
      # @return [Integer]
      #   The combined flags as an unsigned integer.
      #
      def render_flags
        flags = 0

        RENDER_MODES.symbols.each do |name|
          if instance_variable_get("@#{name}")
            flags |= RENDER_MODES[name]
          end
        end

        return flags
      end

      #
      # Renders the markdown source.
      #
      # @param [Renderer] renderer
      #   The renderer to use.
      #
      # @return [String]
      #   The rendered output.
      #
      def render(renderer)
        result = nil

        Buffer.create_from(@source) do |input_buffer|
          Buffer.create_empty(128) do |output_buffer|
            output_buffer.grow(@source.length * 1.2)

            Sundown.ups_markdown(output_buffer,input_buffer,renderer,extensions)

            result = if @smart
                       output_buffer.to_smartypants
                     else
                       output_buffer.to_s
                     end
          end
        end

        return result
      end

    end
  end
end
