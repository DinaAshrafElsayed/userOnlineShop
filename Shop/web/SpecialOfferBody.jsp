<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="span9">
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
        <li class="active">Special offers</li>
    </ul>
    <h4>Discount Special offer<small class="pull-right"> <c:out value="${requestScope.discountedProductsSize}"></c:out> products are available </small></h4>	
    <hr class="soft"/>
    <div id="myTab" class="pull-right">
        <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
        <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
    </div>
    <br class="clr"/>
    <div class="tab-content">
        <div class="tab-pane" id="listView">
        <c:forEach items="${requestScope.discountedProducts}" var="discountedItem">
            <div class="row">	  
                <div class="span2">
                    <img src="${discountedItem.getMainImageUrl()}" alt=""/>
                </div>
                <div class="span4">
                    <h3>New | Available</h3>				
                    <hr class="soft"/>
                    <h5><c:out value="${discountedItem.getProductName()}"/></h5>
                    <a class="btn btn-small pull-right" href="GetProduct?id=${discountedItem.getId()}">View Details</a>
                    <br class="clr"/>
                </div>
                <div class="span3 alignR">
                    <form class="form-horizontal qtyFrm">
                        <h3> <c:out value="${discountedItem.getPrice()}"/></h3>
                        <c:if test="${discountedItem.getQuantity()>0}">
                        <a href="GetProduct?id=${discountedItem.getId()}" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                        <a href="GetProduct?id=${discountedItem.getId()}" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                        </c:if>
                        <c:if test="${discountedItem.getQuantity()==0}">
                        <h4 style="text-align:center;color: red;">SoldOut</h4>    
                        </c:if>
                    </form>
                </div>
            </div>
            </c:forEach>
            <hr class="soft"/>
        </div>

        <div class="tab-pane  active" id="blockView">
            <ul class="thumbnails">
                <c:forEach items="${requestScope.discountedProducts}" var="discountedItem">
                <li class="span3">
                    <div class="thumbnail">
                        <a href="GetProduct?id=${discountedItem.getId()}"><img src="${discountedItem.getMainImageUrl()}" alt=""/></a>
                        <div class="caption">
                            <h5><c:out value="${discountedItem.getProductName()}"/></h5>
                            <c:if test="${discountedItem.getQuantity()>0}">
                            <h4 style="text-align:center"><a class="btn" href="GetProduct?id=${discountedItem.getId()}"> <i class="icon-zoom-in"></i></a> <a class="btn " href="#" onclick="addToCart(this)">Add to <i class="icon-shopping-cart" id='${discountedItem.getId()}'></i></a> <a class="btn btn-primary" href="#"><c:out value="${discountedItem.getPrice()}$"/></a></h4>
                            </c:if>
                        <c:if test="${discountedItem.getQuantity()==0}">
                        <h4 style="text-align:center;color: red;">SoldOut  <label class="btn btn-primary"><c:out value="${item.getPrice()}$"/></label></h4>    
                        </c:if>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
            <hr class="soft"/>
        </div>
    </div>
    <br class="clr"/>
</div>