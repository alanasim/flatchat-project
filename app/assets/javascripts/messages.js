$(document).on('ready',function(){
  $('#message_content').keypress(function(e){
    if(e.which == 13){
      $(this).closest('form').submit();
      $(this).val('')
    }
  });
})


function createMessageView() {
    alert("test");
  // $.ajax({
  //   url: '/message_views',
  //   method: 'post',
  //   data: {
  //     message_id: $(this).attr('id')
  //   }
  // })
}

