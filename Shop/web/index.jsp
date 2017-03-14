<%-- 
    Document   : index
    Created on : Mar 2, 2017, 11:55:43 AM
    Author     : BOSHA
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page ='head.jsp'/>
        <script src="JS/jquery.js"></script>
        <script src="JS/getAllProducts.js"></script>
        <script src="JS/addToShoppingCart.js"></script>
        <script>
            document.getElementById("success").style.display = "none";
        </script>
    </head>
    <body>
        <!-- beshoy edit -->
        <div class="invalidlogin alert  alert-error fade in" style="display: none;" id="success">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Invalid username or password</strong>
        </div>
        <c:if test="${!empty requestScope.invalid}">
            <script>
                document.getElementById("success").style.display = "block";
            </script>
            <c:remove var="invalid" scope="request"/>
        </c:if>
        <!-- beshoy edit end -->

        <c:if test="${!empty sessionScope.user}">
            <jsp:include page ='headeruser.jsp'/>
        </c:if> 
        <c:if test="${empty sessionScope.user}">
            <jsp:include page ='headerVisitor.jsp'/>
            <jsp:include  page="slider.jsp" />
        </c:if> 
        <%--<%@include file="headerVisitor.html" %>--%>

        <div id="mainBody">
            <div class="container">
                <div class="row" id="includeBody">
                    <div id="sidebar"><jsp:include page ='sideBar.jsp'/></div>
                    <div id="products"></div>
                </div>
            </div>
        </div>
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
        <c:if test="${empty sessionScope.products and sessionScope.products.size() != 0 }">
            <script>getAllProducts();</script>
        </c:if>
        <c:if test="${!empty sessionScope.products and sessionScope.products.size() != 0 }">
            <script>loadProducts();</script>
        </c:if>
        <c:if test="${!empty param.name or !empty param.category}">
            <c:if test="${!empty param.name and !empty param.category}">
                <script>loadSearchField("${param.category}", "${param.name}")</script>
            </c:if>
            <c:if test="${!empty param.name and empty param.category}">
                <script>loadSearchField("All", "${param.name}")</script>
            </c:if>
            <c:if test="${empty param.name and !empty param.category}">
                <script>loadSearchField("${param.category}", "")</script>
            </c:if>
        </c:if>
    </body>
</html>