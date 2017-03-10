<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page ='head.jsp'/>
    </head>
    <body>
        <c:if test="${!empty sessionScope.user}">
            <jsp:include page ='headeruser.jsp'/>
        </c:if> 
        <c:if test="${empty sessionScope.user}">
            <jsp:include page ='headerVisitor.jsp'/>
        </c:if> 
        <!-- Header End====================================================================== -->
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <jsp:include page ='sideBar.jsp'/>
                    <!-- Sidebar end=============================================== -->
                    <jsp:include page ='orderSummary.jsp'/>
                </div>
            </div>
        </div>
        <!-- MainBody End ============================= -->
        <!-- Footer ================================================================== -->
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
    </body>
</html>