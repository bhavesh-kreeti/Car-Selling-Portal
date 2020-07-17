class UpdateBroadcastJob < ApplicationJob
	queue_as :dafault

	def perform(token)
  ActionCable.server.broadcast "admin_approval_channel", my_post: post_render(token), token_id: token.id
   end 

   private
   def post_render(post)
      ApplicationController.renderer.render(partial: 'mylist',locals: { list: post } )
    end
end