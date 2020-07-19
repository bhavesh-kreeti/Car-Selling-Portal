import consumer from "./consumer"

consumer.subscriptions.create("MyAddChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
	var html,newHtml
     console.log(data.my_add)
   var el=document.getElementById(`seller-${data.seller_id}`)
     el.parentNode.removeChild(el)
    document.getElementById("add-post").insertAdjacentHTML('beforeend', data.my_add );
 
  }
});
 