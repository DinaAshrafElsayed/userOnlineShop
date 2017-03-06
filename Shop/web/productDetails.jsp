<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="span9">
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
        <li><a href="products.html">Products</a> <span class="divider">/</span></li>
        <li class="active">product Details</li>
    </ul>	
    <div class="row">	  
        <div id="gallery" class="span3">
            <c:set var="item" scope="session" value="${sessionScope.selectedProduct}"/>
            <a href="${item.getMainImageUrl()}">
                <img src="${item.getMainImageUrl()}" style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera">
            </a>
            <div id="differentview" class="moreOptopm carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <c:forEach items="${sessionScope.selectedProduct.otherImagesUrls.imagesUrl}" var="itemImage">
                            <a href="${itemImage}"> <img style="width:29%" src="${itemImage}" alt=""></a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <c:if test="${!empty sessionScope.products}">
                <c:set var="product" scope="session" value="${sessionScope.selectedProduct}"/>
                <h3><c:out value="${product.getProductName()}"/></h3>
                <hr class="soft">
                <form class="form-horizontal qtyFrm">
                    <div class="control-group">
                        <label class="control-label"><span><c:out value="${product.getPrice()} $"/></span> </label>
                        <div class="controls">
                            <input type="number" id="productQuantity" value="1" class="span1" placeholder="Qty." min="1" max ="${product.getQuantity()}">
                            <button type="button" class="btn btn-large btn-primary pull-right" onclick="addToCart(this)"> Add to cart <i class="icon-shopping-cart" id='${item.getId()}'></i></i></button>
                        </div>
                    </div>
                </form>
                <hr class="soft">
                <h4>${product.getQuantity()} items in stock</h4>
                <hr class="soft clr">
                <p>
                    <strong>Description :</strong><br>
                    ${product.getDescription()}
                </p>
                <br class="clr">
                <hr class="soft">
            </c:if>
        </div>
    </div>
</div>