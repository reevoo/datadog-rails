require 'statsd'
require 'socket'

module Datadog
  module Rails
    class Railtie < ::Rails::Railtie
      initializer 'datadog.configure_rails_initialization' do |app|
        $statsd = Statsd.new

        ActiveSupport::Notifications.subscribe /process_action.action_controller/ do |*args|
          if Datadog::Rails.configuration.environments.include?(Rails.env)
            event = ActiveSupport::Notifications::Event.new(*args)
            tags = event_tags(event)
            send_statsd_histogram('response.total.time', event.duration, tags)
            send_statsd_histogram('response.db.time', event.payload[:db_runtime], tags)
            send_statsd_histogram('response.view.time', event.payload[:view_runtime], tags)
          end
        end


        def event_tags(event)
          controller_name = event.payload[:controller].underscore
          format = event.payload[:format]
          {
            app:        Datadog::Rails.configuration.app_name,
            host:       Socket.gethostname,
            controller: controller_name,
            action:     "#{controller_name}.#{event.payload[:action]}",
            status:     event.payload[:status],
            format:     (format.nil? || format == '*/*') ? 'all' : format
          }
        end


        def send_statsd_histogram(metric_name, value, tags = {})
          key = "#{Datadog::Rails.configuration.metric_prefix}.#{metric_name}"
          statsd_tags = tags.map { |(key, value)| "#{key}:#{value}" }
          $statsd.histogram(key, value, tags: statsd_tags)
        end
      end
    end
  end
end
