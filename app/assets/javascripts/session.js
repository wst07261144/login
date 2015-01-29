function sign_in() {
    var user = {account: $('#account').val(), password: $('#password').val()};
    $.ajax({
        url: '/session/create',
        type: 'POST',
        data: {user: user},
        success: function(response){
            if(response.user_id){
                window.location.pathname = '/users/' + response.user_id
            }
        } ,
        error:  {}
    });
}

function logout() {
    $.ajax({
        url: '/session/logout',
        type: 'GET',
        success: function(response){
        } ,
        error:  {}
    });
}