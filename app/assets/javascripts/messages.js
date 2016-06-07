$(document).on('ready',function(){
  $('#message_content').keypress(function(e){
    if(e.which == 13){
      $(this).closest('form').submit();
      $(this).val('')
    }
  });
})