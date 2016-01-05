$(document).ready(function(){

// ------- SLIDE OUT SIGN IN FORM -------
var y = 0;
$(function() {
  $("#clicksi").click(function() {
    if (y == 0) {
      $(".signinform").animate({"right": '+=400px'}, 'slow');
    	y = 1;
    } else {
      $(".signinform").animate({"right": '-=400px'}, 'slow');
      y = 0;
    }
  });
});


// ------- OPEN MODALS -------
$(".menubutton").click(function(){
        $(".menulightbox").fadeIn(1000)
    });

$(".menucloseicon").click(function(){
        $(".menulightbox").fadeOut(1000)
    });

$(".button2").click(function(){
        $("#newowner").fadeIn(1000)
        $(".modalbkg").fadeIn(1000)
    });
$(".button1").click(function(){
        $("#newuser").fadeIn(1000)
        $(".modalbkg").fadeIn(1000)
    });
$(".addrev").click(function(){
        var dishId = ($(this).closest('.dishselect').attr("data-dish-id"));
        var userId = ($(this).closest('.dishselect').attr("data-user-id"));
        var userName = ($(this).closest('.dishselect').attr("data-user-name"));
        var dishName = ($(this).closest('.dishselect').attr("data-dish-name"));
        $("#newreview #wrheader").html(dishName);
        $("#newreview img").attr("src", "/img/avatars/" + userId + ".png");
        $("#newreview #wrname").html(userName);
        $("#newreview form").attr("action", "/item/" + dishId + "/review");
        $("#newreview").fadeIn(1000)
        $(".modalbkg").fadeIn(1000)
    });


// ------- CLOSE MODALS -------
$("#nucloseicon").click(function(){
        $(".lightbox").fadeOut(1000)
        $(".modalbkg").fadeOut(1000)
    });
$("#nocloseicon").click(function(){
        $(".lightbox").fadeOut(1000)
        $(".modalbkg").fadeOut(1000)
    });
$(".wrcloseicon").click(function(){
        $(".lightbox").fadeOut(1000)
        $(".modalbkg").fadeOut(1000)
    });
});

