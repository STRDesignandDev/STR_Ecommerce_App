// Mobile Nav

$( ".hamburger" ).on('click touchend', function() {
  $('.mobile_nav_wrapper').animate({height: '100%'});
  $(".hamburger").hide();
  $(".nav_close").show();
  $(".mobile_nav").show(200);
});

$( ".nav_close").on('click touchend', function() {
  $(".nav_close").hide();
  $(".hamburger").show();
  $('.mobile_nav_wrapper').animate({height: '0%'});
  $(".mobile_nav").hide(200);
});
