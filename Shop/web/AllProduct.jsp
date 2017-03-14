<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="AdminHead.jsp" %>
<%@include file="AdminUp.jsp" %>
<table class="table table-hover">
    <tr>
        <td>Product</td>
        <td>Quantity</td>
        <td>price</td>
        <td>Category</td>
        <td>Discount</td>
        <td><a>update</a></td>

    </tr>

    <c:forEach var="product" items="${requestScope.products}">  
        <tr id="${product.id}">
            <td>${product.productName}</td>
            <td>${product.quantity}</td>
            <td>${product.price}</td>
            <td>${product.categoryName}</td>
            <td>${product.discount}</td>
            <td><a href="updateProduct.jsp?id=${product.id}">update</a></td>

        </tr>
    </c:forEach>  
</table>
<%@include  file="AdminDown.jsp" %>