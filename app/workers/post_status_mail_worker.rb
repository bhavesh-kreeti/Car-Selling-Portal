class PostStatusMailWorker
  include Sidekiq::Worker

  def perform(id)
    token = Token.find(id)
    AdminMailer.admin_mail(token.user.email,token.status ).deliver
  end
end
