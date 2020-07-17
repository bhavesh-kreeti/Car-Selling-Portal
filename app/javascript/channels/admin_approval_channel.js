import consumer from "./consumer"

consumer.subscriptions.create("AdminApprovalChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var html,newHtml
     console.log(data.my_post)
    //   html= '<table><tbody><tr><td>%id%</td><td>%phoneno%</td><td>%status%</td></tr></tbody></table>'
    //   newHtml = html.replace('%id%',data.my_post.id)
    //   newHtml = newHtml.replace('%phoneno%',data.my_post.phoneno)
    //   newHtml = newHtml.replace('%status%',data.my_post.status)
     var el=document.getElementById(`token-${data.token_id}`)
     el.parentNode.removeChild(el)
    console.log(data.my_post)
    document.getElementById("message").insertAdjacentHTML('beforeend', data.my_post );
  }
}); 