function userLogin() {
    document.getElementById("hint").style.display = "none";
    console.log("1111");
    user = document.getElementById('userEmail').value;
    password = document.getElementById('userPassword').value;
    // $.get("login?user="+user+"&password="+password, function(data,status){
    // 	if (status=="success") {
    // 		if (data=="exist") {


    // 		}
    // 		else{

    // 		}
    // 	}
    // });
    // body...
    if (user != "" && password != "") {
        if (user == "besho" && password == "1234") {
            $('#login').modal('hide');
            console.log("1254");
        } else {
            $("#hint").css("display", "block");
        }
    }
}