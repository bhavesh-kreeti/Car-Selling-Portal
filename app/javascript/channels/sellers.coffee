jQuery(document).on 'turbolinks:load', ->

	status = $('#status')
	if status.length > 0
	App.global_chat = App.cable.subscription.create{
	channel: 'UpdateChannel'
	user_id: status.data('user-id')
	},
	connected: ->
	disconnected: ->
	received: (data) ->
		status.append data['status_update']
		send_status: ->
		@perform 'send_status'