module Resque
  module Plugins
    module AlarmNotifier
      class MailNotifier < ::ActionMailer::Base
        def initialize(from, to, template = "alarm", subject = "Queue length reached alarm", tags = ["Resque"])
          @from = from
          @to = to
          @template = template
          @subject = subject
          @tags = tags
        end
        def notify(params)
          @params = params
          text = ERB.new(File.read(File.dirname(__FILE__) + "/#{@template}.html.erb")).result()
          subject = "[#{@tags.join('][')}] #{@subject}"
          mail :from => @from, :to => @to, :subject => subject do |format|
            format.html { render :text => text }
          end
        end
      end
    end
  end
end
