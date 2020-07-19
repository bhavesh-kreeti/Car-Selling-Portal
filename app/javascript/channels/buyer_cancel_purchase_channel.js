import consumer from "./consumer"

consumer.subscriptions.create("BuyerCancelPurchaseChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var el=document.getElementById(`buyer-${data.buyer_id}`)
     el.parentNode.removeChild(el)
  }
});
