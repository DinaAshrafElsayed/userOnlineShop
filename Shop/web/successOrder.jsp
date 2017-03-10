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
        <jsp:include page ='headerVisitor.jsp'/>
        <!-- Header End====================================================================== -->
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <jsp:include page ='sideBar.jsp'/>
                    <!-- Sidebar end=============================================== -->
                    <div class="span9 ">
                        <center>
                            <i class=" alert-success container" style="font-size:32px; margin: 200px 200px 200px 200px"><strong>Your order was successful</strong></i>
                            <br><br><br><br><br><br><br><br><br><br><br><br>
                        </center> 
                    </div>
                    <a href="index.jsp" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>
                </div>
            </div>
        </div>

        <!-- MainBody End ============================= -->
        <!-- Footer ================================================================== -->
        <jsp:include page ='footer.html'/>
        <jsp:include page ='javascript.jsp'/>
    </body>
</html>