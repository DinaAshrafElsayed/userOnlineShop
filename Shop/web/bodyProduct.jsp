<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="span9">
    <div class="well well-small">
        <h4>Featured Products <small class="pull-right">featured products</small></h4>
        <div class="row-fluid">
            <div id="featured" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <ul class="thumbnails">
                            <c:if test="${!empty sessionScope.products}">
                                <c:forEach items="${sessionScope.products}" var="item" varStatus="loop" end="3">
                                    <li class="span3">
                                        <div class="thumbnail">
                                            <i class="tag"></i>
                                            <a href="GetProduct?id=${item.getId()}"><img src="${item.getMainImageUrl()}" alt=""></a>
                                            <div class="caption">
                                                <h5><c:out value="${item.getProductName()}"/></h5>
                                                <h4 style="text-align:center"> <a class="btn " href="#" onclick="addToCart(this)">Add to <i class="icon-shopping-cart" id='${item.getId()}'></i></a> <a class="btn btn-primary" href="#"><c:out value="${item.getPrice()}$"/></a></h4>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                    <c:if test="${!empty sessionScope.products}">
                        <c:forEach items="${sessionScope.products}" var="item" varStatus="loop" begin="4">                           
                            <c:if test="${loop.index % 4 == 0}">                               
                                <div class="item">
                                    <ul class="thumbnails">
                                    </c:if>
                                    <li class="span3">
                                        <div class="thumbnail">
                                            <i class="tag"></i>
                                            <a href="GetProduct?id=${item.getId()}"><img src="${item.getMainImageUrl()}" alt=""></a>
                                            <div class="caption">
                                                <h5><c:out value="${item.getProductName()}"/></h5>
                                                <h4 style="text-align:center"> <a class="btn " href="#" onclick="addToCart(this)">Add to <i class="icon-shopping-cart" id='${item.getId()}'></i></a> <a class="btn btn-primary" href="#"><c:out value="${item.getPrice()}$"/></a></h4>
                                            </div>
                                        </div>
                                    </li>
                                    <c:if test="${(loop.index+1) % 4 == 0 or loop.last }">
                                    </ul>
                                </div>
                            </c:if>
                             
                        </c:forEach>
                    </c:if>
                </div>
                <a class="left carousel-control" href="#featured" data-slide="prev"> &lt </a>
                <a class="right carousel-control" href="#featured" data-slide="next"> &gt </a>
            </div>
        </div>
    </div>
    <h4>Latest Products </h4>
    <ul class="thumbnails">
        <c:if test="${!empty sessionScope.products}">
            <c:forEach items="${sessionScope.products}" var="item">
                <li class="span3">
                    <div class="thumbnail">
                        <a href="GetProduct?id=${item.getId()}"><img src="${item.getMainImageUrl()}" alt=""></a>
                        <div class="caption">
                            <h5>
                                <c:out value="${item.getProductName()}"/>
                            </h5>
                            <p> <c:out value="${item.getDescription()}"/></p>
                            <h4 style="text-align:center"><a class="btn" href="GetProduct?id=${item.getId()}"> <i class="icon-zoom-in"></i></a> <a class="btn " href="#" onclick="addToCart(this)">Add to <i class="icon-shopping-cart" id='${item.getId()}'></i></a> <a class="btn btn-primary" href="#"><c:out value="${item.getPrice()}$"/></a></h4>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </c:if>
    </ul>
</div>