App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<li data-seen='false'> <b>" + data.user + ": </b>" + data.message + "</li>";
  }
});