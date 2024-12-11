(function() {
    'use strict';

    var $ = window.jQuery;
    var string_array = document.getElementsByClassName('hidden-xs');
    var user_name = string_array[0].innerText;
    if(user_name != "admin")
        $("h1").text(user_name+" DashBoard");
})();
