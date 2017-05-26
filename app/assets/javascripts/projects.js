//= require jquery
//= require jquery_ujs
//= require projects


$(window).scroll(function(){
    var fromTop = $(window).scrollTop();
    $(".scrollify").css('margin', '+' + (50 + fromTop) + 'px 0px 0px 0px');
});
