<%-- 
    Document   : index
    Created on : Mar 2, 2017, 11:55:43 AM
    Author     : BOSHA
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page ='head.jsp'/>
        <script src="JS/jquery.js"></script>
        <script src="JS/getAllProducts.js"></script>
         <script src="JS/addToShoppingCart.js"></script>
    </head>
    <body>
        <c:if test="${!empty sessionScope.user}">
            <jsp:include page ='headeruser.jsp'/>
        </c:if> 
        <c:if test="${empty sessionScope.user}">
            <jsp:include page ='headerVisitor.jsp'/>
        </c:if> 
        <div id="mainBody">
            <div class="container">
                <div class="row" id="includeBody">
                    <jsp:include page="sideBar.jsp"/>
                    <jsp:include page="productDetails.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
    </body>
</html>