# frozen_string_literal: true

# Emit responsive WebP <source srcset> only when jekyll-imagemagick has produced
# every width variant under site.dest (see _includes/figure.liquid). Avoids 404s
# and broken-link warnings when conversion did not run or failed.

module Jekyll
  module ResponsiveWebpFilter
    def responsive_webp_complete(base_path)
      site = @context.registers[:site]
      config = site.config["imagemagick"] || {}
      return false unless config["enabled"]

      widths = config["widths"] || []
      base = base_path.to_s.strip.sub(%r{\A/+}, "")
      return false if base.empty?

      widths.all? do |w|
        fp = File.join(site.dest, "#{base}-#{w}.webp")
        File.file?(fp)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ResponsiveWebpFilter)
