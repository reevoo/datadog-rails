require 'gem_config'

module Datadog
  module Rails
    include GemConfig::Base

    with_configuration do
      has :metric_prefix, classes: String, default: 'rails.performance'
      has :app_name, classes: String, default: ::Rails.application.class.parent_name
      has :environments, classes: Array, default: %w(production)
    end
  end
end

require 'datadog/rails/railtie'
