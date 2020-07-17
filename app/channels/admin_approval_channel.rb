class AdminApprovalChannel < ApplicationCable::Channel
  def subscribed
     stream_from "admin_approval_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
