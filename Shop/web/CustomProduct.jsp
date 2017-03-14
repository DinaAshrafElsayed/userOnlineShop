<%@include file="AdminHead.jsp" %>
<%@include file="AdminUp.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<table class="table table-hover">
    <tr>
        <td>Product</td>
        <td>Quantity</td>
        <td>price</td>
        <td>Category</td>
        <td><a>update</a></td>

    </tr>

    <c:forEach var="product" items="${requestScope.name}">  
        <tr id="${product.id}">
            <td>${product.productName}</td>
            <td>${product.price}</td>
            <td>${product.categoryName}</td>
            <td>${product.discount}</td>
            <td><a href="updateProduct.jsp?id=${product.id}">update</a></td>

        </tr>
    </c:forEach>  
</table>
<%@include file="AdminDown.jsp" %>
