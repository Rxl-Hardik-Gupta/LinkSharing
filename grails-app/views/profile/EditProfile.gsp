<%@ page import="linksharing.Resource; linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.User" %>
<%@ page import="linksharing.Resource" %>
<%@ page import="linksharing.LinkResource" %>
<%@ page import="linksharing.DocumentResource" %>

<!DOCTYPE html>
<html lang="en">
<head>
    %{--<meta name="layout" content="main"/>--}%
    <title>Edit Profile</title>

    <asset:stylesheet href="dashboard.css"/>
    <asset:stylesheet href="index.css"/>
    <asset:stylesheet  href="navbar.css"  />
    <meta name="layout" content="main"/>



    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"/>

    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"/>
    <link
            rel="stylesheet"
            href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Merienda+One"/>
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link

            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="row d-flex justify-content-center mt-5">
        <div class="col-6">
            <div>
                <g:set var="user" value="${session.getAttribute('user') as User}" />
                <h3 class="list-group-item active">Edit Profile</h3>
                <g:form

                        class="list-group-item"
                        controller="profile"
                        action="updateProfile"
                        enctype="multipart/form-data"
                >
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input
                                type="text"
                                class="form-control"
                                id="firstName"
                                name="firstName"
                                value="${user.firstName}"
                                required/>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input
                                type="text"
                                class="form-control"
                                id="lastName"
                                name="lastName"
                                value="${user.lastName}"/>
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input
                                type="text"
                                class="form-control"
                                id="userName"
                                name="userName"
                                value="${user.userName}"
                                required/>
                    </div>







                    <div class="form-group">
                        <label for="photo">Photo</label>
                        <input
                                type="file"
                                class="form-control-file align-content-center"
                                id="photo"
                                name="photoPath"/>

                    </div>

                    <button type="submit" class="btn  btn-outline-primary">Update Profile</button>
                </g:form>
            </div>
        </div>


    </div>
    <div class="row d-flex justify-content-center mt-5">
        <div class="col-6">
                <div>
                    <h3 class="list-group-item active">Change Password</h3>
                    <g:form

                            class="list-group-item"
                            controller="profile"
                            action="updatePassword"
                            enctype="multipart/form-data"
                            oninput='confirmPassword.setCustomValidity(password.value != confirmPassword.value ? "Passwords do not match." : "")'>



                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input
                                    type="password"
                                    class="form-control"
                                    id="exampleInputPassword1"
                                    name="password"
                                    value="${user.password}"
                                    required/>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input
                                    type="password"
                                    class="form-control"
                                    id="confirmPassword"
                                    name="confirmPassword"
                                    value="${user.password}"/>
                        </div>


                        <button type="submit" class="btn btn-danger">Update Password</button>
                    </g:form>
                </div>
            </div>

    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"> </script>
%{--<script--}%
%{--src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--}%
%{--integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--}%
%{--crossorigin="anonymous"--}%
%{--></script>--}%
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"
></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"
></script>
<asset:javascript  src="TopicCreation.js"  />
</body>
</html>