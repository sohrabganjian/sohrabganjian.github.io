# frozen_string_literal: true

# Downgrade jekyll-imagemagick's info line when the generator is disabled (e.g. Windows
# safeguard sets imagemagick.enabled false) so routine local builds stay quiet.

return unless defined?(JekyllImagemagick::ImageGenerator)

JekyllImagemagick::ImageGenerator.class_eval do
  unless method_defined?(:generate_before_quiet_disabled)
    alias_method :generate_before_quiet_disabled, :generate

    def generate(site)
      cfg = JekyllImagemagick::DEFAULTS.merge(site.config["imagemagick"] || {})
      unless cfg["enabled"]
        Jekyll.logger.debug(JekyllImagemagick::LOG_PREFIX, "Disabled in site.config")
        return
      end

      generate_before_quiet_disabled(site)
    end
  end
end
