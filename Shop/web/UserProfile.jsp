<%-- 
    Document   : UserProfile
    Created on : Mar 7, 2017, 10:10:59 PM
    Author     : Ahmed labib
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<div class="span9">
    <c:set var="userprofile" scope="session" value="${sessionScope.user}"/>    
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><c:out value="${userprofile.getFirstName()}"/> <c:out value="${userprofile.getLastName()}"/></h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                    <table class="table table-user-information">
                        <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><c:out value="${userprofile.getFirstName()}"/></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><c:out value="${userprofile.getLastName()}"/></td>
                            </tr>
                            <tr>
                                <td>Date of Birth</td>
                                <td><c:out value="${userprofile.getbDate()}"/></td>
                            </tr>
                            <tr>
                            <tr>
                                <td>Gender</td>
                                <td><c:out value="${userprofile.getGender()}"/></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><c:out value="${userprofile.getAddress()}"/></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><c:out value="${userprofile.getEmail()}"/></td>
                            </tr>
                            <tr>
                                <td>Credit Card</td>
                                <td><c:out value="${userprofile.creditCard.creditCardNumber}"/></td>
                            </tr>
                        <td>Phone Number</td>
                        <td><c:out value="${userprofile.getPhone()}"/></td>
                        </tbody>
                    </table>
                    <!--<a href="#" class="btn btn-primary">My Sales Performance</a>-->
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <a href="EditUserProfile.jsp" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning">Edit Profile</a>
        </div>
    </div>


</div>

<!-- end of user profile body -->
