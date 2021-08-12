<!doctype html>
<html lang="en" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>



    %{--<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>--}%
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Merienda+One"
    />
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link

            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    %{--<asset:stylesheet src="application.css"/>--}%
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <asset:stylesheet  href="navbar.css"  />

    <script >

        var addTopicURL = "${createLink(controller:'topic', action:'createTopic')}"  ;


    </script>
    <asset:javascript  src="TopicCreation.js"  />


    <g:layoutHead/>

</head>

<body >


<nav class="navbar navbar-expand navbar-light bg-light sticky-top">

    <g:if test="${session && session.getAttribute('user') != null}">
        <g:link controller="dashboard" class="navbar-brand"
        ><i class="fa fa-cube"></i>Link<b>Sharing</b></g:link>
    </g:if>
    <g:else>
        <g:link controller="index" class="navbar-brand"
        ><i class="fa fa-cube"></i>Link<b>Sharing</b></g:link>
    </g:else>

    <button
            type="button"
            class="navbar-toggler"
            data-toggle="collapse"
            data-target="#navbarCollapse"
    >
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Collection of nav links, forms, and other content for toggling -->
    <div
            id="navbarCollapse"
            class="collapse navbar-collapse justify-content-start"
    >
        <form class="navbar-form form-inline">
            <div class="input-group search-box">
                <input
                        type="text"
                        id="search"
                        class="form-control"
                        placeholder="Search by Name"
                />
                <span class="input-group-addon"
                ><i class="material-icons">&#xE8B6;</i></span
                >
            </div>

            %{--//////////////////////--}%

            %{--<g:link controller="afterLogin" action="logout" class="dropdown-item">--}%

                %{--<i class="material-icons">&#xE8AC;</i>--}%
                %{--Logout</g:link>--}%
            %{--///////////////--}%

        </form>

    <g:if test="${session && session.getAttribute('user') }">

        <div class="navbar-nav ml-auto">
            <button data-toggle="modal"
                    data-target="#createTopicModal" class="nav-item nav-link notifications btn btn-light"
            ><i class="fa fa-comments" aria-hidden="true"></i>

                <!-- <span class="badge"> 1</span> -->
            </button>
            <button data-toggle="modal"
                    data-target="#addTopicLink" class="nav-item nav-link notifications btn btn-light"
            ><i class="fa fa-link" aria-hidden="true"></i>

                <!-- <span class="badge"> 1</span> -->
            </button>
            %{--<a href="#" class="nav-item nav-link notifications"--}%
            %{--><i class="fa fa-link" aria-hidden="true"></i>--}%

                %{--<!-- <span class="badge"> 1</span> -->--}%
            %{--</a>--}%
            %{--<a href="#" class="nav-item nav-link messages"--}%
            %{--><i class="fa fa-upload" aria-hidden="true"></i>--}%

                %{--<!-- <span class="badge">10</span> -->--}%
            %{--</a>--}%

        <button data-toggle="modal"
                data-target="#uploadDocument" class="nav-item nav-link notifications btn btn-light"
        ><i class="fa fa-upload" aria-hidden="true"></i>

            <!-- <span class="badge"> 1</span> -->
        </button>

        <button data-toggle="modal"

                data-target="#sendInviteModal" class="nav-item nav-link notifications btn btn-light"
        ><i class="fa fa-mail-forward" aria-hidden="true"></i>

            <!-- <span class="badge"> 1</span> -->
        </button>

            <div class="nav-item dropdown">
                <a
                        href="#"
                        data-toggle="dropdown"
                        class="nav-link dropdown-toggle user-action"
                >

                    <asset:image src="./ProfilePhoto${session ? session.user?.photoPath : ''}"  class="avatar" alt="Avatar"/>

                    %{--<img--}%
                        %{--src="../../assets/images/ProfilePhoto${session.user.photoPath}"--}%
                        %{--class="avatar"--}%
                        %{--alt="Avatar" />--}%
                    ${session ? session.user.firstName + " " + session.user.lastName: ''} <b class="caret"></b
                ></a>
                <div class="dropdown-menu">

                    <g:link controller="profile"  class="dropdown-item">

                        <i class="fa fa-user"></i> Profile</g:link>
                    <div class="dropdown-divider"></div>
                    <g:link controller="user" action="showUsers"  class="dropdown-item">

                        <i class="fa fa-user"></i> Users</g:link>
                    <div class="dropdown-divider"></div>
                    <g:link controller="afterLogin" action="logout" class="dropdown-item">

                        <i class="material-icons">&#xE8AC;</i>
                        Logout</g:link>

            </div>
        </div>






    </g:if>
    </div>
</nav>
 %{-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>...Modlas<<<<<<<<<<<<<<<<<<<,,,,,,,,,,,--}%
<div
        class="modal fade"
        id="createTopicModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title text-white" id="createTopicModalLable">
                    Create A Topic
                </h4>
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                %{--<g:form   controller="topic"   action="createTopic"  method="get">--}%
                    <div class="form-group">
                        <label for="topicName">Topic Name</label>
                        <input
                                type="text"
                                class="form-control"
                                name="topicName"
                                id="topicName"
                                placeholder=""
                        />
                    </div>

                    <div class="form-group">
                        <label for="visibility"></label>
                        <select
                                class="form-control"
                                name="visibility"
                                id="visibility"
                        >
                            <option value="PUBLIC">Public</option>
                            <option value="PRIVATE">Private</option>
                        </select>
                    </div>
                    %{--<button type="submit" id="createTopicFormSubmit"  class="invisible"   onclick="ExistingLogic()" > </button>--}%
                %{--</g:form>--}%
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal"
                >
                    Close
                </button>
                <button  id="createTopicSubmit" class="btn btn-primary"  data-dismiss="modal" >Create Topic</button>

                %{--<button type="submit" id="createTopicSubmit" class="btn btn-primary" onclick="document.getElementById('createTopicFormSubmit').click()" >Create Topic</button>--}%
            </div>
        </div>
    </div>
</div>



%{--//////////////////////////////Share Link Modal//////////////////////////////////////////////////////////////--}%
<g:if test="${session.getAttribute('user') != null}">
    <div
            class="modal fade"
            id="addTopicLink"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h4 class="modal-title text-white" id="shareLinkModalLable">
                        Share A Link
                    </h4>
                    <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <g:form   controller="dashboard"   action="createShareLink"  method="get">
                        <div class="form-group">
                            <label for="linkUrl">Link</label>
                            <input
                                    type="url"
                                    class="form-control"
                                    name="url"
                                    id="linkUrl"
                                    placeholder="Full Link Address"
                            />
                        </div>

                        <div class="form-group">
                            <label for="description"></label>
                            <input
                                    type="text"
                                    class="form-control"
                                    name="description"
                                    id="description"
                                    placeholder="Provide Some Description"
                            />

                        </div>
                        <div class="form-group">
                            <label for="topicSelect"> Topic</label>
                            <select
                                    class="form-control"
                                    name="topic"
                                    id="topicSelect"
                            >

                                <g:each in="${session.user.subscriptions}" var="sub" >
                                    <option value="${sub.topic.id}">${sub.topic.topicName}</option>
                                </g:each>

                            </select>
                        </div>

                        <button type="submit" id="shareLinkSubmitButton"  class="invisible"   onclick="ExistingLogic()" > </button>
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                    >
                        Close
                    </button>
                    <button type="submit" id="shareLinkSubmit" class="btn btn-primary" onclick="document.getElementById('shareLinkSubmitButton').click()" >Share Link</button>
                </div>
            </div>
        </div>
    </div>
</g:if>



%{--/////////////////////////////////////UpdoadDocumentModal///////////////////////////////////////////////--}%

<g:if test="${session.getAttribute('user') != null}">
    <div
            class="modal fade"
            id="uploadDocument"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h4 class="modal-title text-white" id="uploadDocumentHeading">
                        Share Document
                    </h4>
                    <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <g:form   controller="dashboard"  action="shareDocument"  enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="fileUpload">Document</label>
                            <input
                                    type="file"
                                    class="form-control"
                                    name="document"
                                    id="fileUpload"
                                    placeholder="Upload a File"
                            />
                        </div>

                        <div class="form-group">
                            <label for="documentDescription"></label>
                            <input
                                    type="text"
                                    class="form-control"
                                    name="documentDescription"
                                    id="documentDescription"
                                    placeholder="Provide Some Description"
                            />

                        </div>
                        <div class="form-group">
                            <label for="addToTopic"> Topic</label>
                            <select
                                    class="form-control"
                                    name="topic"
                                    id="addToTopic"
                            >

                                <g:each in="${session.user.subscriptions}" var="sub" >
                                    <option value="${sub.topic.id}">${sub.topic.topicName}</option>
                                </g:each>

                            </select>
                        </div>

                        <button type="submit" id="uploadDocumentFormButton"  class="invisible"   onclick="ExistingLogic()" > </button>
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                    >
                        Close
                    </button>
                    <button type="submit" id="uploadDocumentExternalButton" class="btn btn-primary" onclick="document.getElementById('uploadDocumentFormButton').click()" >Share</button>
                </div>
            </div>
        </div>
    </div>
</g:if>


%{--/////////////////////////////////?Send Invite Modal/////////////////////--}%

<g:if test="${session.getAttribute('user') != null}">
    <div
            class="modal fade"
            id="sendInviteModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h4 class="modal-title text-white" id="invite-heading">
                        Send Invite
                    </h4>
                    <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <g:form   controller="topic"  action="sendInvite"  >
                        <div class="form-group">
                            <label for="invite-email">Enter Email</label>
                            <input
                                    type="email"
                                    class="form-control"
                                    name="email"
                                    id="invite-email"
                                    placeholder="Email should Contain A valid Domain And '@'"
                            />
                        </div>


                        <div class="form-group">
                            <label for="invite-topic"> Topic</label>
                            <select
                                    class="form-control"
                                    name="topicId"
                                    id="invite-topic"
                            >

                                <g:each in="${session.user.subscriptions}" var="sub" >
                                    <option value="${sub.topic.id}">${sub.topic.topicName}</option>
                                </g:each>

                            </select>
                        </div>

                        <button type="submit" id="send-invite-button"  class="invisible"   onclick="ExistingLogic()" > </button>
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                    >
                        Close
                    </button>
                    <button type="submit" id="send-invite-external-button" class="btn btn-primary" onclick="document.getElementById('send-invite-button').click()" >Send Invite</button>
                </div>
            </div>
        </div>
    </div>
</g:if>




<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"> </script>
<script
        src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"
></script>
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




















<g:layoutBody/>


<asset:javascript src="application.js"/>

</body>
</html>
