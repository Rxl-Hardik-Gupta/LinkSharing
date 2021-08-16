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
    <title>Reset Your Password</title>

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

    <div class="container-fluid mt-5">
        <div class="row d-flex justify-content-center mt-5">
            <div class="col-6">
                <div>
                    <h3 class="list-group-item active">Change Password</h3>
                    <g:form

                            class="list-group-item"
                            controller="forgotPassword"
                            action="fetchAccount"
                            enctype="multipart/form-data"
                            oninput='confirmPassword.setCustomValidity(password.value != confirmPassword.value ? "Passwords do not match." : "")'>



                        <div class="form-group">
                            <label for="exampleInputPassword1">Enter Your Email</label>
                            <input
                                    type="email"
                                    class="form-control"
                                    id="exampleInputPassword1"
                                    name="email"

                                    required/>
                        </div>




                        <button type="submit" class="btn btn-danger"> Send Password Reset Link</button>
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