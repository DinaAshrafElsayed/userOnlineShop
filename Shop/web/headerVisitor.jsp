<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
    <div class="container">
        <div id="welcomeLine" class="row">
            <div class="span6" id="userName"></div>
            <div class="span6">
                <div class="pull-right">
                    <span><font><b>balance</b></font></span>
                    <span class="btn btn-mid" id="userBalance">0</span>
                    <span class="">£</span>
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
                <a class="brand" href="SearchProduct?category=All"><img src="themes/images/logo.png" alt="Bootsshop"></a>
                <form class="form-inline navbar-search" method="post" action="SearchProduct">
                    <input id="srchFld" name="srchFld" placeholder="product name"class="srchTxt" type="text" style="width:28%">
                    <select class="srchTxt" name="category" id="category" style="width:28%">
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

                    <li class="">
                        <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>

                        <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                <h3>Login Block</h3>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal loginFrm" action="Login" method="post">
                                    <div class="control-group">
                                        <input type="text" name="userEmail" placeholder="Email" required="">
                                    </div>
                                    <div class="control-group">
                                        <input type="password" name="userPassword" placeholder="Password" required="">
                                    </div>

                                    <br>
                                    <button type="submit" class="btn btn-success">Sign in</button>
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    <br><br>
                                    <span style="display: none;width: 250px;height: 15px;padding: 3px;text-align: center;font-size: 14px;font-family: cursive;" class="label label-success" id="hint">invalid login try Again</span>
                                </form>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

