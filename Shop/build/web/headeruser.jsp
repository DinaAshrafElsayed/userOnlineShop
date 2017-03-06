<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dto.User"%>
<div id="header">
    <div class="container">
        <div id="welcomeLine" class="row">
            <div class="span6" id="userName">Welcome <strong>
                    <c:out value="${sessionScope.user.getFirstName()}"/>
                </strong></div>
            <div class="span6">
                <div class="pull-right">
                    
                    <!-- samir start -->
                    
                    <span><font><b>balance</b></font></span>
                    <span class="btn btn-mid" id="userBalance">
                        <c:out value="${sessionScope.user.getCreditCard().getBalance()}"/>
                    </span>
                    <span class="">£</span>
                    
                    <!-- samir end -->
                    
                    <a href="ShoppingCart.jsp"><span class="btn btn-mid btn-primary" id="cart"><i class="icon-shopping-cart icon-white"></i>
                            <i id="shoppingCart"> 
                                <c:if test="${!empty sessionScope.cart}">
                                    ${sessionScope.cart.getNumberOfItems()}
                                </c:if> 
                                <c:if test="${empty sessionScope.cart}">
                                    0
                                </c:if> 
                            </i></span> </a>
                </div>
            </div>
        </div>
        <!-- Navbar ================================================== -->
        <div id="logoArea" class="navbar">
            <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-inner">
                <a class="brand" href="index.jsp"><img src="themes/images/logo.png" alt="Bootsshop"></a>
                <form class="form-inline navbar-search" method="post" action="SearchProduct">
                    <input id="srchFld" name="srchFld"class="srchTxt" type="text">
                    <select class="srchTxt"name="category" id="category">
                        <option>All</option>
                        <option>CAMERAS </option>
                        <option>COMPUTER </option>
                        <option>MOBILE PHONES </option>
                        <option>SOUND &amp; VISION </option>

                    </select>
                    <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                </form>
                <ul id="topMenu" class="nav pull-right">
                    <li class=""><a href="DiscountedProduct">Specials Offer</a></li>

                    <li class=""><a href="contact.html">Contact</a></li>
                    <li class="">
                        <a href="/Shop/Logout" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-danger">Log Out</span></a>

                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
