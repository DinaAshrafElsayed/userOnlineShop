<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="span9">
    <c:set var="userprofile" scope="session" value="${sessionScope.user}"/>
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
        <li class="active">Profile</li>
    </ul>
    <h3> <c:out value="${userprofile.getFirstName()}"/> <c:out value="${userprofile.getLastName()}"/></h3>	
    <div class="well">
        <form class="form-horizontal " action="EditUserProfile" method="POST">
            <h4>Edit Your personal information</h4>

            <div class="control-group">
                <label class="control-label" for="inputFname1">First name <sup>*</sup></label>
                <div class="controls">
                    <input type="text" id="firstName" name="firstName" value="<c:out value="${userprofile.getFirstName()}"/>"placeholder="First Name" required>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
                <div class="controls">
                    <input type="text" id="lastName" name="lastName"value="<c:out value="${userprofile.getLastName()}"/>"name="lastName" placeholder="Last Name" required>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="input_email">Email <sup>*</sup></label>
                <div class="controls">
                    <input type="text" id="email" name="email"value="<c:out value="${userprofile.getEmail()}"/>"name="emial" placeholder="Email"  onblur="validEmail()" required >
                    <span>
                        <div class="alert  alert-error fade in custome-error" id="email_error">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Email must be in form xyz@xxx.com</strong>
                        </div>
                    </span>
                </div>
            </div> -->
            <div class="control-group">
                <label class="control-label">Date of Birth<sup>*</sup></label>
                <div class="controls">
                    <input type="date" id="DateOfBirth" name="DateOfBirth"value="<c:out value="${userprofile.getbDate()}"/>"name="DateOfBirth" required/> 
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="gender">Gender<sup>*</sup></label>
                <div class="controls">
                    <select id="gender" name="gender" >
                        <option value="male">Male</option><option value="female">Female</option>
                    </select>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="address">Address</label>
                <div class="controls">
                    <input type="text" id="address"name="address" value="<c:out value="${userprofile.getAddress()}"/>"name="address" placeholder="Adress"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="mobile">Mobile Phone<sup>*</sup>	</label>
                <div class="controls">
                    <input type="tel"  name="mobile" id="mobile" value="<c:out value="${userprofile.getPhone()}"/>"placeholder="Mobile Phone" onblur="validPhone()" required /> 
                    <span>
                        <div class="alert  alert-error fade in custome-error" id="mobile_error">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>phone must be in form 0(1-2)(0-9) 11 digit</strong>
                        </div>
                    </span>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <input type="hidden" name="email_create" value="1">
                    <input type="hidden" name="is_new_customer" value="1">
                    <input class="btn btn-large btn-success" type="submit" value="Save"/>
                </div>
            </div>		
        </form>
    </div>

</div>
