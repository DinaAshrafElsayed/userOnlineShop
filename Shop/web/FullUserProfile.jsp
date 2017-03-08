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
        <link href="themes/css/user_profile.css" rel="stylesheet">
        <script src="JS/jquery.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JS/getAllProducts.js"></script>
        <script src="JS/addToShoppingCart.js"></script>
        <script src="JS/userProfile.js"></script>
    </head>
    <body>
        <c:if test="${!empty sessionScope.user}">
            <jsp:include page ='headeruser.jsp'/>
        </c:if> 
        <c:if test="${empty sessionScope.user}">
            <jsp:include page ='headerVisitor.jsp'/>
        </c:if> 
        <div id="mainBody">
            <div class="container" >
                <div class="row">
                    <jsp:include page="sideBar.jsp"/>
                    <jsp:include page="UserProfile.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
    </body>
</html>