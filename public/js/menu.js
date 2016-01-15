$(document).ready(function() {

// js/jq for accordion on restaurant menu pages - left side

    //Initialising Accordion
    $(".accordion").tabs(".pane", {
        tabs: '> h2',
        effect: 'slide',
        initialIndex: null
    });

    //The click to hide function - on top
    $(".accordion > h2").click(function() {
        if ($(this).hasClass("current") && $(this).next().queue().length === 0) {
            $(this).next().slideUp();
            $(this).removeClass("current");
        } else if (!$(this).hasClass("current") && $(this).next().queue().length === 0) {
            $(this).next().slideDown();
            $(this).addClass("current");
        }
    });
        //The click to hide function - on body
    $(".accordion > h3").click(function() {
        if ($(this).hasClass("current") && $(this).next().queue().length === 0) {
            $(this).next().slideUp();
            $(this).removeClass("current");
        } else if (!$(this).hasClass("current") && $(this).next().queue().length === 0) {
            $(this).next().slideDown();
            $(this).addClass("current");
        }
    });
    //The click to hide function - on bottom
    $(".accordion > h4").click(function() {
        if ($(this).hasClass("current") && $(this).next().queue().length === 0) {
            $(this).next().slideUp();
            $(this).removeClass("current");
        } else if (!$(this).hasClass("current") && $(this).next().queue().length === 0) {
            $(this).next().slideDown();
            $(this).addClass("current");
        }
    });
    
});