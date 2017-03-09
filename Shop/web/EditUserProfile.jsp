<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <style type="text/css">
            .custome-error{
                display: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page ='headeruser.jsp'/>
        <!-- Header End====================================================================== -->
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <jsp:include page ='sideBar.jsp'/>
                    <!-- Sidebar end=============================================== -->
                    <jsp:include page ='EditProfilePageBody.jsp'/>
                </div>
            </div>
        </div>

        <!-- MainBody End ============================= -->
        <!-- Footer ================================================================== -->
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
    </body>
</html>