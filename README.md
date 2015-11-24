Resque Alarm
===========

Send out an alarm (at this time, just support email) when queue length reach a threshold. 

To use this gem, config in an initializer

      require 'resque/plugins/alarm'
      require 'resque/plugins/alarm_notifier/log_notifier'
      require 'resque/plugins/alarm_notifier/mail_notifier'

      Resque::Plugins::Alarm.configure do |config|
        config.threshold = 10 # Perform notify when queue have more than 10 items
        config.notifier = Resque::Plugins::AlarmNotifier::LogNotifier.new(Rails.logger, :info) # Notify to rails log
        # OR using mail notifier
        config.notifier = Resque::Plugins::AlarmNotifier::MailNotifier.new(
          "from@from.com",
          "to@to.com",
          "Queue length reached alarm", # subject
          ["Resque"] ) # tags, merge with subject to become "[Resque] Queue length reached alarm"
      end

Extend in job:

      require 'resque/plugins/alarm'

      class ResqueDoSomethingJob
        extend Resque::Plugins::Alarm

        @queue = :line1

        def self.perform(params)
          # magic come here
        end

      end

While enqueueing, if any queue has more than 10 items, a log as below will be written to rails log

      {:app=>"app", :source=>"resque", :type=>"queue_too_long", :queues=>{:artwork_file_serve=>11}}

=========
AV
