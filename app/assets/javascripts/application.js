//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require_tree ./app


// Please do not put any code in here. Create a new .js file in
// app/assets/javascripts/app instead, and put your code there


var display_backtotop = 300; // Scrolled pixels from top until the link appears

$(document).ready(function() {
  $(window).scroll(function() {
    if ($(this).scrollTop() > display_backtotop) {
      $(".scroll-top").fadeIn();
    } else {
      $(".scroll-top").fadeOut();
    }
  });

  $(document).on("click", ".scroll-top", function(e) {
    $("html, body").animate({scrollTop: 0});

    e.preventDefault();
  });
});