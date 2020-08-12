class SellerPostWorker
  include Sidekiq::Worker

  def perform(id)
    token = Token.find(id)
    my_add= token.seller
    ActionCable.server.broadcast "my_post_channel", my_add: ApplicationController.render(partial: 'posts/post',locals: { seller: my_add }), seller_id: my_add.id
  end
end
