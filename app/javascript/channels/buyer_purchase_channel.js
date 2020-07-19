import consumer from "./consumer"

consumer.subscriptions.create("BuyerPurchaseChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

 var html,newHtml,current_user_id
     console.log(data.purchase)
   console.log(data.buyer_id) 
      // console.log(data.username.email)
      current_user_id = document.getElementById("buy-car").getAttribute('value')
      if (data.user_id == parseInt(current_user_id)) {
               document.getElementById("buy-car").insertAdjacentHTML('beforeend', data.purchase );
      }

  }
});
