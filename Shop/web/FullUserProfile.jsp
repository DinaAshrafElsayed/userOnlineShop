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
        
        <link href="themes/css/user_profile.css" rel="stylesheet">
        <script src="JS/jquery.js"></script>
        
        <script src="JS/jquery.min.js"></script>
        <!-- jQuery library -->
        <!-- Latest compiled JavaScript -->
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/getAllProducts.js"></script>
        <script src="JS/addToShoppingCart.js"></script>
        <script src="JS/userProfile.js"></script>
        <jsp:include page ='head.jsp'/>
    </head>
    <body>
            <jsp:include page ='headeruser.jsp'/>
        <div id="mainBody">
            <div class="container">
                <div class="row" id="includeBody">
                    <jsp:include page="UserProfile.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
    </body>
</html>