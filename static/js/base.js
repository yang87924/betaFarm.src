/*$('.selectpicker').selectpicker({
    noneResultsText: '没有符合的选项'
});*/

$(".field_data").click(function(){
    $(".crop_record_child").each(function(){
        $(this).hide(200)
    })
    $(".system_management_child").each(function(){
        $(this).hide(200)
    })
    $(".field_data_child").each(function(){
        if($(this).css("display") == 'list-item'){
            $(this).hide(200)
        }else{
            $(this).show(500)
        }
    })
})

$(".crop_record").click(function(){
    $(".field_data_child").each(function(){
        $(this).hide(200)
    })
    $(".system_management_child").each(function(){
        $(this).hide(200)
    })
    $(".crop_record_child").each(function(){
        if($(this).css("display") == 'list-item'){
            $(this).hide(200)
        }else{
            $(this).show(500)
        }
    })
})

$(".system_management").click(function(){
    $(".field_data_child").each(function(){
        $(this).hide(200)
    })
    $(".crop_record_child").each(function(){
        $(this).hide(200)
    })
    $(".system_management_child").each(function(){
        if($(this).css("display") == 'list-item'){
            $(this).hide(200)
        }else{
            $(this).show(500)
        }
    })
})

$(function(){
    var pathname = location.pathname.split("/")[1];
    $("#btn-"+pathname).css("background-color","#007979")
    $("#btn-"+pathname+" .sidebar-link").css("color","#ffffff")
    if(pathname != "profile"){
        try{
            $("."+$("#btn-"+pathname).attr("class").split("_child")[0]).click()
        }catch(e){
            return;
        }
    }else{
        return;
    }
})

$(".sidebar_gacp_link").prop("href","/gacp?is_organic="+localStorage.getItem("is_organic"))