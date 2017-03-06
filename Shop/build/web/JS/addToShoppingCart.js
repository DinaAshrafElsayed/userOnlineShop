
function addToCart(e) {
    console.log("clicked");
    var productID = $(e).children('i').first().attr('id');
    console.log(productID);
    $.get("AddToShoppingCart?productID=" + productID, callback2);
}


function callback2(response, status, xhr)
{
    if (status == "success")
    {
        console.log("laaa found");
        $("#itemsNumber").html(response +" Items in your cart ");
        $("#shoppingCart").html(response);
    }
}