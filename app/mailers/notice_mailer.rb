class NoticeMailer < ActionMailer::Base
   default from: "from@example.com"
  def sendmail_topic(topic)
    @topic = topic
    mail to: "yamada.changemylife@gmail.com",
    subject: 'Topicが投稿されました'
  end
end
