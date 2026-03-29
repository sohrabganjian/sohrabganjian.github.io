# frozen_string_literal: true

# On Windows, PATH often resolves `convert` to System32's unrelated utility instead
# of ImageMagick. jekyll-imagemagick shells to `convert`, so every resize fails and
# floods the build log. Skip generation in that case; CI (Linux) still runs normally.

module Jekyll
  class ImagemagickWindowsSkip < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      cfg = site.config["imagemagick"] || {}
      return unless cfg["enabled"]
      return unless Gem.win_platform?

      first = first_executable_on_path("convert")
      return unless first

      return unless first.tr("\\", "/").downcase.include?("system32/convert")

      site.config["imagemagick"] ||= {}
      site.config["imagemagick"]["enabled"] = false
      Jekyll.logger.debug(
        "Imagemagick:",
        "Skipping WebP generation: Windows `convert` is System32 (not ImageMagick). " \
        "CI/Linux still generates WebPs; figure.liquid omits srcset until files exist."
      )
    end

    private

    def first_executable_on_path(name)
      exts = ENV["PATHEXT"]&.split(File::PATH_SEPARATOR) || [".exe", ".EXE", ".bat", ".BAT", ".cmd", ".CMD"]
      ENV["PATH"].to_s.split(File::PATH_SEPARATOR).each do |dir|
        next if dir.nil? || dir.empty?

        exts.each do |ext|
          path = File.join(dir, "#{name}#{ext}")
          return File.expand_path(path) if File.file?(path)
        end
      end
      nil
    end
  end
end
