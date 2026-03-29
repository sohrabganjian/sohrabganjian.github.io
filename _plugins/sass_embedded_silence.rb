# frozen_string_literal: true

# jekyll-sass-converter 3.x forwards options to sass-embedded but omits
# silence_deprecations. Forward it from _config.yml so theme/vendor @import and
# legacy global built-in noise stays off local builds (see sass: block in _config.yml).

module JekyllSassEmbeddedSilence
  def sass_configs
    h = super
    raw = jekyll_sass_configuration["silence_deprecations"]
    silence = if raw.nil?
                %w[import global-builtin]
              else
                Array(raw).map(&:to_s)
              end
    h[:silence_deprecations] = silence unless silence.empty?
    h
  end
end

Jekyll::Converters::Scss.prepend(JekyllSassEmbeddedSilence)
