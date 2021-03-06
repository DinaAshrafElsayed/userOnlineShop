<%@page import="java.sql.ResultSet"%>

<%@include file="AdminHead.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function addProduct()
    {
        var id = document.getElementById("id").value;
        var n = document.getElementById("name").value;
        var d = document.getElementById("description").value;
        var p = document.getElementById("price").value;
        var cus = document.getElementById('cat');
        var custid = cus.options[cus.selectedIndex].value;

        var xmlhttp = new XMLHttpRequest();// to create new object from XMLHTTPReqest 
        xmlhttp.open("GET", "servletUpdateProduct?id=" + id + "&cat=" + custid + "&price=" + p + "&name=" + n + "&desc=" + d, true);
        xmlhttp.send(null);
        xmlhttp.onreadystatechange = function ()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById("done").style.visibility = "visible";
                //document.getElementById("form").reset();
                $("#form")[0].reset();
            }
        }


    }

</script>
<%@include file="AdminUp.jsp" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <form role="form" enctype="multipart/form-data"  method="post" action="servletAddProduct" id="form">
            <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
                               url="jdbc:mysql://localhost/onlineshopping"  
                               user="root"  password=""/>  
            <sql:query dataSource="${db}" var="rs">  
                SELECT product_id,productname,description,quantity,price,discount,categoryname from products where product_id=${param.id};  
            </sql:query>  
            <c:forEach var="product" items="${rs.rows}"> 
                <div class="form-group">
                    <input type="hidden" id="id" value="${product.product_id}">
                    <label for="exampleInputEmail1">Product Name</label><input id="name" name="name" value="${product.productname}" type="text" class="form-control" required/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Product Description </label>
                    <textarea style="height: 100px" name="description" id="description" rows="10" class="form-control" required>${product.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Product Price </label><input type="number" name="price" value="${product.price}" class="form-control" id="price" required/>
                </div>


                <div class="form-group">

                    <label for="exampleInputFile">Category</label>
                    <select  class="form-control" id="cat">


                        <option value="MOBILE PHONES">MOBILE PHONES</option>
                        <option value="CAMERAS">CAMERAS</option>
                        <option value="SOUND & VISION">SOUND & VISION</option>
                        <option value="COMPUTER">COMPUTER</option>


                    </select>

                </div>

                <button type="button" onclick="addProduct()"  class="btn btn-default">Submit</button>

            </form>



        </c:forEach>  


    </div>
</div>
<br>
<div class="form-group">
    <div class="alert alert-success alert-dismissable" id="done">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
        <h4>
            done!
        </h4>  your product has been updated . <a href="#" class="alert-link"></a>
    </div>


</div>
<%@include file="AdminDown.jsp" %>
