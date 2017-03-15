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
                    <a href="#rechargeModal" role="button" data-toggle="modal" style="padding-right:0">
                        <span class="btn btn-mid" id="userBalance">
                            <c:out value="${sessionScope.user.getCreditCard().getBalance()}"/>
                        </span>
                    </a>
                    <div id="rechargeModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                            <h3>Balance Recharge</h3>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" action="RechargeBalance" method="POST">
                                <div class="control-group">
                                    <input type="text" maxlength="8" onkeyup="checkCardNumberExistance()" id="cardNumber" name="cardNumber" placeholder="Enter 8 digits of card number"  required><div id="CardNumberResult" style="display: inline"></div>
                                </div>
                                <button type="submit" class="btn btn-success" id="rechargeButton" disabled="true">Recharge</button>
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                            </form>

                        </div>
                    </div>

                    <span>£</span>

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
                <a class="brand" href="SearchProduct?category=All"><img style="width: 191px;height: 49px" src="themes/images/logo.png" alt="electricShop"></a>
                <form class="form-inline navbar-search" method="post" action="SearchProduct">
                    <input id="srchFld" name="srchFld"class="srchTxt" placeholder="product name" type="text" style="width:28%">
                    <select class="srchTxt"name="category" id="category" style="width:28%">
                        <option>All</option>
                        <option>CAMERAS </option>
                        <option>COMPUTER </option>
                        <option>MOBILE PHONES </option>
                        <option>SOUND &amp; VISION </option>

                    </select>
                    <input id="slider1" name ="price"type="range" min="0" max="5000" step="200"style="width:20%"onchange="updateTextInput(this.value);"/>
                    <span class ="btn btn-primary" id="rangeVal">0</span>
                    <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                </form>
                <ul id="topMenu" class="nav pull-right">
                    <li class=""><a href="DiscountedProduct">Specials Offer</a></li>

                    <li class=""><a href="FullUserProfile.jsp">Contact</a></li>
                    <li class="">
                        <a href="/Shop/Logout" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-danger">Log Out</span></a>

                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
