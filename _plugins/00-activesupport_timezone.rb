# frozen_string_literal: true

# Quiet ActiveSupport 8.x deprecation: "`to_time` will always preserve the receiver
# timezone..." during Jekyll runs (triggered via Jekyll / jekyll-scholar stack).
begin
  require "active_support"
  if ActiveSupport.respond_to?(:to_time_preserves_timezone=)
    ActiveSupport.to_time_preserves_timezone = :zone
  end
rescue LoadError
end
