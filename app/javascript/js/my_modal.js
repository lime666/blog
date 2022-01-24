document.addEventListener('turbolinks:load', function () {
    $('#modal_button').hide();
    if ( !window.location.pathname.includes("register") && !window.location.pathname.includes("sign_in")) {
        setTimeout(function () {
            document.getElementById("modal_button").click();
        }, 1000);
    }
});
