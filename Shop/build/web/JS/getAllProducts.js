function getAllProducts() {
        $.get("GetAllProducts", callback);
}
function callback(response, status, xhr)
{
    if (status == "success")
    {
        console.log("arraylist found");
        loadProducts();
    }
}
function loadProducts()
{
    $("#sidebar").load('sideBar.jsp');
    $("#products").load('bodyProduct.jsp');
}
function loadSearchField(category, search)
{
    console.log(category);
    $("#category").val(category);
    $("#srchFld").val(search);
}