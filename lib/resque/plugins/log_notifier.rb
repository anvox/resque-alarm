module Resque
  module Plugins
    module Alarm
      class LogNotifier
        class << self
          attr_accessor :logger

          def configure
            yield self
          end
          def notify(params)
            message = {app: "saleshoodapp", source: "resque", type: "queue_too_long", queues: params}
            self.class.logger.info message
          end
        end
      end
    end
  end
end
