App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data));
    if(document.visibilityState === "visible"){
      $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
        markAsSeen(this);
        hideMessage(this);
        }
      )
    }
    return
  },

  renderMessage: function(data) {
    return "<li id='msg-" + data.id + "' data-seen='false'> <b>" + data.user + ": </b>" + data.message + "</li>";
  }
});