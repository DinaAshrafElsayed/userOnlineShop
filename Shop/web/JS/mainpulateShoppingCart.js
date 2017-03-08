
function mainpulate(e) {
    console.log("hjrfe");
    var productID = $(e).attr('id');
    var method = $(e).attr('name');
    console.log(productID);
    var productQuantity = 1;
    $.get("MainpulateShoppingCart?productID=" + productID + "&method=" + method, callback3);
}


function callback3(response, status, xhr)
{
    if (status == "success")
    {
        console.log("laaa found");
        location.reload();
    }
}