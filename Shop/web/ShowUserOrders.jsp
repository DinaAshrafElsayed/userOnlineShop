<%-- 
    Document   : ShowAllUsers
    Created on : Mar 5, 2017, 4:16:01 PM
    Author     : Samir
--%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHead.jsp" %>
<%@include file="AdminUp.jsp" %>

<table class="table table-bordered">

    <c:forEach items="${requestScope.userOrdersList}" var="order">
        <table class="table table-bordered">
            <tr style="background-color: #000303"> 
                <th style="color: #FFF">Order Date</th>
                <td style="color: #FFF" colspan="5"><c:out value="${order.date}"/></td>
            </tr>
            <tr style="background-color: #eeeeee">
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Discount</th>
                <th>Category</th>
            </tr>
            <tr>
                <c:forEach items="${order.orderedProducts}" var="product">
                <tr>
                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.productName}"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td><c:out value="${product.quantity}"/></td>
                    <td><c:out value="${product.discount}"/></td>
                    <td><c:out value="${product.categoryName}"/></td>
                </tr>

            </c:forEach>
            </tr>
        </table>
    </c:forEach>

</table>
<form action="UsersHasOrders" method="POST">
    <input class="btn btn-primary" type="submit" value="Back"/>
</form>

<%@include  file="AdminDown.jsp" %>