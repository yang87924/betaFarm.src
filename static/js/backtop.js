function back_to_top(){
    $('html,body').animate({scrollTop:0}, 333);
}

var back_to_top_change = false
var back_to_top_changed = false

$(window).scroll(function() {
    let bottom_range = $(document).height() - $(window).height() - $(window).scrollTop();
    let footer_height = $(".main-footer").height()
    let top = $(this).scrollTop()
    if (top>400){
        back_to_top_change = true
    }
    if ((bottom_range > footer_height) ){
        $('.back_to_top').stop().animate({bottom:"5px"},0)
    }else if((bottom_range <= (footer_height))){
        $('.back_to_top').animate({bottom:$(".main-footer").outerHeight()+5+"px"},0)
    }
    if (back_to_top_change&&!back_to_top_changed){
        $('.back_to_top').show()
        back_to_top_changed = true
        back_to_top_change = false
    }
})