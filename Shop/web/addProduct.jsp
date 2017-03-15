<%@include file="AdminHead.jsp" %>
<%@include file="AdminUp.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w3-panel w3-blue" style="display: none;" id="openModal">
    <span class="w3-closebtn" onclick="this.parentElement.style.display = 'none'">X</span>
    <p>Added successfully</p>
</div>
<div class="w3-panel w3-red" style="display: none;" id="invalid">
    <span class="w3-closebtn" onclick="this.parentElement.style.display = 'none'">X</span>
    <p>The product is already exist</p>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <form role="form" enctype="multipart/form-data"  method="post" action="servletAddProduct">
            <div class="form-group">
                <label for="name">Product Name</label><input id="name" name="name" type="text" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="description">Product Description </label>
                <textarea style="height: 75px;" name="description" id="description" rows="10" class="form-control" required></textarea>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label><input id="quantity" min="0" name="quantity" type="number" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="discount">discount</label><input id="discount" min="0" max="90" name="discount" type="number" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="price">Product Price </label><input type="number" min="0" name="price" class="form-control" id="price" required/>
            </div>
            <div class="form-group">
                <label for="category">Category Name </label>
                <select  class="form-control" name="category" id="category">


                    <option value="MOBILE PHONES">MOBILE PHONES</option>
                    <option value="CAMERAS">CAMERAS</option>
                    <option value="SOUND & VISION">SOUND & VISION</option>
                    <option value="COMPUTER">COMPUTER</option>


                </select>
            </div>


            <div class="form-group">
                <label for="file">image 1</label><input type="file" name="file"  id="file" required/>
                <label for="file2">image 2</label><input type="file" name="file2"  id="file1" required/>
                <label for="file3">image 3</label><input type="file" name="file3"  id="file2" required/>
            </div>
            <button type="submit"  class="btn btn-default">Submit</button>
        </form>
    </div>
    <div id="modal_popup">
    </div>


</div>


<c:if test="${!empty requestScope.valid}"> 
    <script>
        document.getElementById("openModal").style.display = "block";
    </script>
</c:if>
<c:if test="${!empty requestScope.invalid}"> 
    <script>
        document.getElementById("invalid").style.display = "block";
    </script>
</c:if>



<%@include file="AdminDown.jsp" %>
