class NoticeMailer < ActionMailer::Base
  def sendmail_topic(topic)
    @topic = topic
    mail to: "yamada.changemylife@gmail.com",
    subject: 'Topicが投稿されました'
  end
end
