
$(document).on('ready', function(){

  // mark as seen on page load -- WORKING
  $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
    markAsSeen(this);
    hideMessage(this);
  })

  // mark as seen after message submit
  $('form#new_message').on('submit', function(){
    // add in mark as seen and hidemessage logic
    setTimeout(function() {
       $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
          markAsSeen(this);
          hideMessage(this);
      })
    }, 100);

  })

  // $('div#messages').on('change', function(){
  //   // add in mark as seen and hidemessage logic

  //   markAsSeen(this);
  //   hideMessage(this);
  // })

  // mark as seen after page focus -- WORKING
  $(window).on('focus', function(){
    // Find all elements on page, filter out the ones seen
    $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
      markAsSeen(this);
      hideMessage(this);
      }
    )
  })

  // mark as seen on page load
  $(document).on('scroll', function(){
    // Find all elements on page, filter out the ones seen
    $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
      markAsSeen(this);
      hideMessage(this);
      }
    )
  })

})


function markAsSeen(elem){
  $(elem).attr('data-seen', 'true')
  // alert($(elem).attr('id') + ' is seen')
  // this is where the ajax call would go
  $.ajax({
    url: '/message_views',
    method: 'post',
    data: {
      message_id: $(elem).attr('id')
    }
  })

}

function hideMessage(elem){
  setTimeout(function() {
    $(elem).fadeOut('fast');
  }, 3000);
}

function shouldBeMarkedAsSeen(){
    var $elem = $(this);
    var $window = $(window);

    var docViewTop = $window.scrollTop();
    var docViewBottom = docViewTop + $window.height();

    var elemTop = $elem.offset().top;
    var elemBottom = elemTop + $elem.height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}