class StatusBroadcastJob < ApplicatonJob
	queue_as :default

	def perform
		ActionCable.server.broadcast "UpdateChannel", status_update: render_status()
	end

	private 
	def render_status

	
end