$(document).ready(function(){

var y = 0;
$(function() {
  $("#clicksi").click(function() {
    if (y == 0) {
      $(".signinform").animate({"right": '+=400px'}, 'slow');
    	y = 1;
      $("#signon").hide();
      $("#signout").show();
    } else {
      $(".signinform").animate({"right": '-=400px'}, 'slow');
      y = 0;
      $("#signon").show();
      $("#signout").hide();
    }
  });
});


//  This should be what you are looking for for the session control 
// and then I can or you, add some code to kill the session.

// This will show the proper icon at top on subsequent pages
// if(isset($_SESSION['logged_in'])){
// $("#signon")
// }else{
// $("#signout")
// }

// adding some code in here for click will kill the session
var y = 0;
$(function() {
  $("#clickso").click(function() {
    // $.post("serverpage.php",function(data){
    //     // if you want you can show some message to user here
    //   });
      $(".signinform").animate({"right": '-=400px'}, 'slow');
      y = 0;
      $("#signon").show();
      $("#signout").hide();
  });
});


$(".menubutton").click(function(){
        $(".menulightbox").fadeIn(2000)
    });

$(".menucloseicon").click(function(){
        $(".menulightbox").fadeOut(2000)
    });

$(".button2").click(function(){
        $("#newowner").fadeIn(2000)
    });
$(".button1").click(function(){
        $("#newuser").fadeIn(2000)
    });
$("#nucloseicon").click(function(){
        $(".lightbox").fadeOut(2000)
    });
$("#nocloseicon").click(function(){
        $(".lightbox").fadeOut(2000)
    });

});
