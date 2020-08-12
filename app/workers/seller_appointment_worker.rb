class SellerAppointmentWorker
  include Sidekiq::Worker

  def perform(id)
    token = Token.find(id)
    ActionCable.server.broadcast "admin_approval_channel", my_post: ApplicationController.render(partial: 'tokens/mylist',locals: { list: token }), token_id: token.id
  end
end
