<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar ================================================== -->
<div id="sidebar" class="span3">
    <div class="well well-small">
        <a id="myCart" href="ShoppingCart.jsp"><img src="themes/images/ico-cart.png" alt="cart">
            <div id="itemsNumber">
                <c:if test="${!empty sessionScope.cart}">
                    ${sessionScope.cart.getNumberOfItems()}
                </c:if> 
                <c:if test="${empty sessionScope.cart}">
                    0 
                </c:if>
                Items in your cart
            </div><!--<span class="badge badge-warning pull-right" id="cartPrice">$155.00</span>--></a>
    </div>
    <ul id="sideManu" class="nav nav-tabs nav-stacked">
        <form class="subMenu open" method="post" action="SearchProduct"><a href="SearchProduct?category=All"> ELECTRONICS</a>
            <ul>
                <li><a class="active" href="SearchProduct?category=CAMERAS"><i class="icon-chevron-right"></i>Cameras</a></li>
                <li><a href="SearchProduct?category=COMPUTER"><i class="icon-chevron-right"></i>Computers</a></li>
                <li><a href="SearchProduct?category=MOBILE PHONES"><i class="icon-chevron-right"></i>Mobile Phone</a></li>
                <li><a href="SearchProduct?category=SOUND & VISION"><i class="icon-chevron-right"></i>Sound & Vision</a></li>
            </ul>
        </form>

    </ul>
    <br/>

    <div class="thumbnail">
        <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
        <div class="caption">
            <h5>Payment Methods</h5>
        </div>
    </div>
</div>
<!-- Sidebar end=============================================== -->