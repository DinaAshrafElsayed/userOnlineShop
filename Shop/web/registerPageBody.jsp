<div class="span9">
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
        <li class="active">Registration</li>
    </ul>
    <h3> Registration</h3>	
    <div class="well">
        <form class="form-horizontal " action="register" method="POST">
            <h4>Your personal information</h4>

            <div class="control-group">
                <label class="control-label" for="inputFname1">First name <sup>*</sup></label>
                <div class="controls">
                    <input type="text" id="firstName" name="firstName" placeholder="First Name" required>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
                <div class="controls">
                    <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="input_email">Email <sup>*</sup></label>
                <div class="controls">
                    <input type="email" id="email" name="emial" placeholder="Email"  onblur="checkUserAlreadySignedUp()" required >
                    <span>
                        <div class="alert  alert-error fade in custome-error" id="email_error">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>This Email Already Has Account</strong>
                        </div>
                    </span>
                </div>

            </div>
            <div class="control-group">
                <label class="control-label" for="password">Password <sup>*</sup></label>
                <div class="controls">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
            </div>	
            <div class="control-group">
                <label class="control-label" for="confirmPassword">Confirm Password <sup>*</sup></label>
                <div class="controls">
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password " onblur="validatePasswordggg()" required>
                    <span>
                        <div class="alert  alert-error fade in custome-error" id="password_error">
                            <strong>password doesn't matched</strong>
                        </div>
                    </span> 
                </div>
            </div> 
            <div class="control-group">
                <label class="control-label">Date of Birth<sup>*</sup></label>
                <div class="controls">
                    <input type="date" id="DateOfBirth" name="DateOfBirth" required/> 
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
                    <input type="text" id="address" name="address" placeholder="Adress"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="mobile">Mobile Phone<sup>*</sup>	</label>
                <div class="controls">
                    <input type="tel"  name="mobile" id="mobile" placeholder="Mobile Phone" onblur="validPhone()" required /> 
                    <span>
                        <div class="alert  alert-error fade in custome-error" id="mobile_error">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>phone must be in form 0(1-2)(0-9) 11 digit</strong>
                        </div>
                    </span>
                </div>
            </div>

            <h4>Credit Card Information</h4>
            <div class="control-group">
                <label class="control-label" for="creditCardNumber">Number</label>
                <div class="controls">
                    <input  class="form-control" type="number" id="creditCardNumber" 
                            name="creditCardNumber" placeholder="Enter credit Card Number" 
                            pattern="^4[0-9]{12}(?:[0-9]{3})?$" max="9999999999999999" min="1000000000000000" title="4(15 digit)" 
                            onblur="checkCreditCardNumberUniqueness()"required/>
                    <span>
                        <div class="alert  alert-error fade in custome-error" id="credit_error">
                            <strong>Oops! this Card Number attached to another account</strong>
                        </div>
                    </span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="creditCardExpireDate">Expire Date </label>
                <div class="controls">
                    <input type="date" id="creditCardExpireDate" name="creditCardExpireDate" required/> 
                </div>
            </div>

            <p><sup>*</sup>Required field</p>

            <div class="control-group">
                <div class="controls">
                    <input type="hidden" name="email_create" value="1">
                    <input type="hidden" name="is_new_customer" value="1">
                    <input id="registerButton" class="btn btn-large btn-success" type="submit" value="Register"/>
                </div>
            </div>		
        </form>
    </div>

</div>
