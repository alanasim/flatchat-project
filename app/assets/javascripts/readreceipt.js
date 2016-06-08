$(document).on('ready', function(){

  $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
    markAsSeen(this)
  })

  $(document).on('scroll', function(){
    // Find all elements on page, filter out the ones seen
    $('[data-seen=false]').filter(shouldBeMarkedAsSeen).each(function(){
      markAsSeen(this)
      }
    )
    
  })
})


function markAsSeen(elem){
  $(elem).attr('data-seen', 'true')
  alert($(elem).attr('id') + ' is seen')
  // this is where the ajax call would go
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