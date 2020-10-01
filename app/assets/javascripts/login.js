$(document).ready(function(){
    $("#login-form").on("click", function(event){
        event.preventDefault();
        url = $(this).attr('action');
        $.ajax({
            url: '/login',
            type: "POST",
            data : {
                session: {username: $('#username-login').val(),
                          password: $('#password-login').val()}
                // session: {password: $('#password-login').val()}

                // username: $('#username-login').val(),
                // password: $('#password-login').val()
           
            },
            success: function(result){
                console.log(result.user);
                var name = result.user;
                
                window.location = '/home'
            },
            dataType: 'json'
        })
    });
});
// $(function(){
//     $("form").submit(function(event){
//     // loại bỏ mặc định của event submit
//     url = $(this).attr('action');
//       event.preventDefault();
//       $.ajax({
//         url: '/create',
//         type: "POST",
//         data : {
//         username: $('#username-login').val(),
//         password: $('#password-login').val()
//         },
//         success: function(result){
//             console.log("sdhfag");
//         },
//         dataType: 'json'
//         }) 
//     });
//   });
function frm_login(){
    try{
        var user_id = document.getElementById('username').value;
        var pass = document.getElementById('password').value;
    }catch(ex){
        alert(ex);
        return;
    }
}