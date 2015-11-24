module Resque
  module Plugins
    module AlarmNotifier
      class MailNotifier
        def initialize(from, to, template = "alarm", subject = "Queue length reached alarm", tags = ["Resque"])
          @from = from
          @to = to
          @template = template
          @subject = subject
          @tags = tags
        end
        def notify(params)
          @params = params
          text = ERB.new(File.read(File.dirname(__FILE__) + "/#{@template}.html.erb")).result(binding)
          subject = "[#{@tags.join('][')}] #{@subject}"
          MailNotifierMailer.mail_notifier_mailer(@from, @to, subject, text).deliver!
        end
      end

      class MailNotifierMailer < ::ActionMailer::Base
        def mail_notifier_mailer(from, to, subject, body)
          mail :from => from, :to => to, :subject => subject do |format|
            format.html { render :text => body }
          end
        end
      end
    end
  end
end
