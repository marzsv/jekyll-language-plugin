module Jekyll
  module Tags
    class LanguageIncludeTag < IncludeTag
      def tag_includes_dir(context)
        context.registers[:site].config['language_includes_dir'].freeze
      end

      def page_language(context)
          context.registers[:page].nil? ? "en" : context.registers[:page]["language"]
      end

      def resolved_includes_dir(context)
        File.join(context.registers[:site].in_source_dir(@includes_dir), page_language(context))
      end
    end
  end
end

Liquid::Template.register_tag('tinclude', Jekyll::Tags::LanguageIncludeTag)