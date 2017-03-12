<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='JS/recharge.js'></script>
<script src="JS/mainpulateShoppingCart.js"></script>
<div class="span9">
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
        <li class="active"> SHOPPING CART</li>
    </ul>
    <h3>  SHOPPING CART [ <small> ${sessionScope.cart.getNumberOfItems()}</small>]<a href="index.jsp" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>	
    <hr class="soft">
    <c:if test="${empty sessionScope.user}">
        <table class="table table-bordered">
            <tbody><tr><th> I AM ALREADY REGISTERED  </th></tr>
                <tr> 
                    <td>
                        <form class="form-horizontal" action="Login" method="post">
                            <div class="control-group">
                                <label class="control-label" for="inputUsername">Username</label>
                                <div class="controls">
                                    <input type="text" name ="userEmail"id="inputUsername" placeholder="user email">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputPassword1">Password</label>
                                <div class="controls">
                                    <input type="password" name="userPassword" id="inputPassword1" placeholder="Password">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="hidden" name ="shoppingCart" value="cart">
                                    <button type="submit" class="btn">Sign in</button> OR <a href="registerPage.jsp" class="btn">Register Now!</a>
                                </div>
                            </div>
                        </form>
                    </td>
                </tr>
            </tbody></table>
        </c:if>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Product</th>
                <th>Description</th>
                <th>Quantity/Update</th>
                <th>Price</th>
                <th>Discount</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${!empty sessionScope.cart}">
                <c:forEach items="${sessionScope.cart.getProducts()}" var="item">
                    <tr>
                        <%--<c:out value="${item}"/>--%>
                        <td> <img width="60" src="${item.getMainImageUrl()}" alt=""></td>
                        <td>${item.getProductName()}<br>${item.getDescription()}</td>
                        <td>
                            <div class="input-append"><input class="span1" style="max-width:34px" placeholder="1" id="appendedInputButtons" size="16" value="${item.getQuantity()}" type="text"><button class="btn" type="button" name="decrease" id="${item.getId()}"onclick="mainpulate(this)"><i class="icon-minus"  ></i></button><button class="btn" type="button" name="increase" id="${item.getId()}"onclick="mainpulate(this)"><i class="icon-plus" ></i></button><button class="btn btn-danger" type="button" name="remove" id="${item.getId()}"onclick="mainpulate(this)"><i class="icon-remove icon-white"></i></button>				</div>
                        </td>
                        <td>${item.getPrice()} / Item</td>
                        <td>${item.getDiscount()}%</td>
                        <td>${item.getPrice() * item.getQuantity() *((100-item.getDiscount())/100)}</td>
                    </tr> 
                </c:forEach>
            </c:if>
            <tr>
                <td colspan="6" style="text-align:right">Total Price:	</td>
                <td>$ ${sessionScope.cart.totalPrice()} </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:right">Total Discount:	</td>
                <td>$ ${sessionScope.cart.totalDiscount()}</td>
            </tr>

            <tr>
                <td colspan="6" style="text-align:right"><strong>TOTAL (${sessionScope.cart.totalPrice()} - ${sessionScope.cart.totalDiscount()}) =</strong></td>
                <td class="label label-important" style="display:block"> <strong>$ ${sessionScope.cart.totalPriceWithDiscount()} </strong></td>
            </tr>
        </tbody>
    </table>
    <c:if test="${!empty sessionScope.user}">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td> 
                        <form class="form-horizontal" action="RechargeBalance">
                            <div class="control-group">
                                <label class="control-label"><strong> Recharge CODE: </strong> </label>
                                <div class="controls">
                                    <input type="hidden" name="shoppingCart" value ="cart">
                                    <input type="number" class="input-medium" id="cardNumber2" name="cardNumber" placeholder="CODE" min="1" max="99999999"  >
                                    <button type="submit" class="btn" id="rechargeButton2"> ADD </button>
                                    <div id="validationCard"></div>
                                </div>
                            </div>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>	
    </c:if>
    <a href="index.jsp" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>
    <c:if test="${empty sessionScope.user and sessionScope.cart.getNumberOfItems()>0}">
        <div class ="btn btn-danger btn-large pull-right"><i>you have to sign in to checkout</i></div>
            </c:if>
            <c:if test="${!empty sessionScope.user and sessionScope.cart.getNumberOfItems()>0 }">
        <a href="checkout" class="btn btn-large pull-right">next <i class="icon-arrow-right"></i></a>
        </c:if>
        <c:if test="${ sessionScope.cart.getNumberOfItems() <= 0 }">
                <div class ="btn btn-danger btn-large pull-right"><i>can't check out with any empty cart</i>
                </div>
        </c:if>
        
</div>