$(document).ready(function(){

    $(window).scroll(function() {
      var hT = $('.about-flex').offset().top,
          hH = $('.about-flex').outerHeight(),
          wH = $(window).height(),
          wS = $(this).scrollTop();
      if (wS > (hT+hH/2-wH)){
          $("#img-home-team").animate({left: '52%'}, 'slow');
      }
   });

   $(window).scroll(function() {
      var hT = $('.team-flex').offset().top,
          hH = $('.team-flex').outerHeight(),
          wH = $(window).height(),
          wS = $(this).scrollTop();
      if (wS > (hT+hH/2-wH)){
          $("#img-home-chi").animate({right: '12%'}, 'slow');
      }
   });
});