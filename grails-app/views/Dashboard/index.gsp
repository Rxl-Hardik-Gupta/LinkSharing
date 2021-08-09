<!doctype html>
<html lang="en">
    <head>
        <meta name="layout" content="main" />
        <title> Dashboard </title>

        <asset:stylesheet href="dashboard.css" />

        <link
                rel="stylesheet"
                href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
                integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous"
        />

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
    </head>


<body>

<div class="container-fluid">

    <g:if test="${flash.message}">
        <h5>${flash.message}</h5>
    </g:if>

    <div class="row d-flex justify-content-around">
        <div class="col-4">
            <div class="mt-5">
                <div class="card p-3">
                    <div class="d-flex align-items-center">
                        <div class="image">
                            %{--<img--}%
                                    %{--src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"--}%
                                    %{--class="rounded img-thumbnail"--}%
                                    %{--width="300"--}%
                            %{--/>--}%
                            <asset:image width="300" src="./ProfilePhoto${session ? session.user?.photoPath : ''}"  class="rounded img-thumbnail" alt="Avatar"/>
                        </div>
                        <div class="ml-3 w-100">
                            <h4 class="mb-0 mt-0">${session.user.firstName + " " + session.user.lastName}</h4>
                            <span><strong>Admin: </strong>${session.user.admin}</span>
                            <div
                                    class="
                      p-2
                      mt-2
                      bg-secondary
                      d-flex
                      justify-content-between
                      rounded
                      text-white
                      stats
                    "
                            >
                                <div class="d-flex flex-column">
                                    <span class="articles">Subscriptions</span>
                                    <span class="number">38</span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="articles">Topics</span>
                                    <span class="number">980</span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="articles">Rating</span>
                                    <span class="number">8.9</span>
                                </div>
                            </div>
                            <div class="button mt-2 d-flex flex-row align-items-center">
                                <button class="btn btn-sm btn-outline-primary w-100">
                                    Chat
                                </button>
                                <button class="btn btn-sm btn-primary w-100 ml-2">
                                    Follow
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-5" id="subscription">
                <ul class="list-group">
                    <li
                            class="
                  subscriptions
                  list-group-item
                  active
                  d-flex
                  justify-content-xl-around
                "
                    >
                        <h3>Subscriptions</h3>
                        <a href="wwwwerwe" class="btn btn-danger"> View All</a>
                    </li>
                    <li class="list-group-item"></li>
                    <g:each in="${session.user.subscriptions}" var="${sub}">
                        <div id="subs">
                            <li class="list-group-item">
                                <div class="mt-2">
                                    <div class="card p-3">
                                        <div class="d-flex">
                                            <div class="image img-responsive">
                                                <img
                                                        src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                                        class="rounded img-thumbnail"
                                                        width="140"
                                                />
                                            </div>
                                            <div class="ml-3 w-75">
                                                <!-- <h4 class="mb-0 mt-0">Some User</h4> -->
                                                <g:link controller="topic" action="openTopic" params="[topicId: sub.topic.id]">${sub.topic.topicName}</g:link>

                                                %{--<a href="" class="d-block">${sub.topic.topicName}</a>--}%
                                                <span class="d-block">@${sub.user.userName}</span>
                                                %{--<a href="#">Unsubscribe</a>--}%
                                                <g:link controller="dashboard" action="unsubscribe" params="[subId: sub.id]">Unsubscribe</g:link>
                                                <div
                                                        class="
                            p-2
                            mt-2
                            bg-secondary
                            d-flex
                            justify-content-between
                            rounded
                            text-white
                            stats
                          "
                                                >
                                                    <div class="d-flex flex-column">
                                                        <span class="articles">Subscriptions</span>
                                                        <span class="number">38</span>
                                                    </div>
                                                    <div class="d-flex flex-column">
                                                        <span class="articles">Post</span>
                                                        <span class="number">980</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <div
                                                    class="
                          Options
                          p-2
                          mt-1
                          d-flex
                          justify-content-between
                          align-items-center
                          w-100
                        "
                                            >
                                                <form method="get" action="">
                                                    <div class="form-group">
                                                        <select class="custom-select" name="seriousness" >
                                                            <option selected value="SERIOUS">Serious</option>
                                                            <option value="VERY_SERIOUS" selected>VerySerious</option>
                                                            <option value="CASUAL">Casual</option>
                                                        </select>
                                                    </div>
                                                </form>
                                                <form method="get" action="">
                                                    <div class="form-group">
                                                        <select class="custom-select" name="visibility">
                                                            <option value="PRIVATE" selected>Private</option>
                                                            <option value="PUBLIC">Public</option>
                                                        </select>
                                                    </div>
                                                </form>
                                                <a href="#">Send Invitation</a>
                                                <a href="#">Delete</a>
                                                <a href="#">Edit</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                    </g:each>
                </ul>
            </div>
        </div>
        <div class="col-6 mt-5">
            <ul class="list-group">
                <li class="list-group-item active">
                    <h3>Inbox</h3>
                </li>
                <li class="list-group-item">
                    <div>
                        <div class="card p-3">
                            <div class="d-flex align-items-center">
                                <div class="image img-thumbnail">
                                    <img
                                            src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                            class="rounded"
                                            width="140"
                                    />
                                </div>
                                <div class="ml-3 w-100">
                                    <h4 class="mb-0 mt-0">Some User</h4>
                                    <span>Job Title</span>
                                    <div
                                            class="
                          p-2
                          mt-2
                          d-flex
                          justify-content-between
                          rounded
                          stats
                        "
                                    >
                                        <p>
                                            Lorem ipsum dolor sit amet consectetur, adipisicing
                                            elit. Voluptate libero vero pariatur eum est animi.
                                            Dignissimos maxime sint et at.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div>
                        <div class="card p-3">
                            <div class="d-flex align-items-center">
                                <div class="image img-thumbnail">
                                    <img
                                            src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                            class="rounded"
                                            width="140"
                                    />
                                </div>
                                <div class="ml-3 w-100">
                                    <h4 class="mb-0 mt-0">Some User</h4>
                                    <span>Job Title</span>
                                    <div
                                            class="
                          p-2
                          mt-2
                          d-flex
                          justify-content-between
                          rounded
                          stats
                        "
                                    >
                                        <p>
                                            Lorem ipsum dolor sit amet consectetur, adipisicing
                                            elit. Voluptate libero vero pariatur eum est animi.
                                            Dignissimos maxime sint et at.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div>
                        <div class="card p-3">
                            <div class="d-flex align-items-center">
                                <div class="image img-thumbnail">
                                    <img
                                            src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                            class="rounded"
                                            width="140"
                                    />
                                </div>
                                <div class="ml-3 w-100">
                                    <h4 class="mb-0 mt-0">Some User</h4>
                                    <span>Job Title</span>
                                    <div
                                            class="
                          p-2
                          mt-2
                          d-flex
                          justify-content-between
                          rounded
                          stats
                        "
                                    >
                                        <p>
                                            Lorem ipsum dolor sit amet consectetur, adipisicing
                                            elit. Voluptate libero vero pariatur eum est animi.
                                            Dignissimos maxime sint et at.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>


%{--Modals--}%


%{-->>>>>>>>>>>>>>>>>>>>>>>>>>>>Create Topic Modal<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--}%
%{--<div--}%
        %{--class="modal fade"--}%
        %{--id="createTopicModal"--}%
        %{--tabindex="-1"--}%
        %{--role="dialog"--}%
        %{--aria-labelledby="exampleModalLabel"--}%
        %{--aria-hidden="true"--}%
%{-->--}%
    %{--<div class="modal-dialog" role="document">--}%
        %{--<div class="modal-content">--}%
            %{--<div class="modal-header bg-primary">--}%
                %{--<h4 class="modal-title text-white" id="createTopicModalLable">--}%
                    %{--Create A Topic--}%
                %{--</h4>--}%
                %{--<button--}%
                        %{--type="button"--}%
                        %{--class="close"--}%
                        %{--data-dismiss="modal"--}%
                        %{--aria-label="Close"--}%
                %{-->--}%
                    %{--<span aria-hidden="true">&times;</span>--}%
                %{--</button>--}%
            %{--</div>--}%
            %{--<div class="modal-body">--}%
                %{--<form action="" method="post">--}%
                    %{--<div class="form-group">--}%
                        %{--<label for="invitationEmail">Topic Name</label>--}%
                        %{--<input--}%
                                %{--type="email"--}%
                                %{--class="form-control"--}%
                                %{--name="topicName"--}%
                                %{--id="topicName"--}%
                                %{--placeholder=""--}%
                        %{--/>--}%
                    %{--</div>--}%

                    %{--<div class="form-group">--}%
                        %{--<label for="visibilityEnum"></label>--}%
                        %{--<select--}%
                                %{--class="form-control"--}%
                                %{--name="visibility"--}%
                                %{--id="visibilityEnum"--}%
                        %{-->--}%
                            %{--<option value="0">Public</option>--}%
                            %{--<option value="1">Private</option>--}%
                        %{--</select>--}%
                    %{--</div>--}%
                %{--</form>--}%
            %{--</div>--}%
            %{--<div class="modal-footer">--}%
                %{--<button--}%
                        %{--type="button"--}%
                        %{--class="btn btn-secondary"--}%
                        %{--data-dismiss="modal"--}%
                %{-->--}%
                    %{--Close--}%
                %{--</button>--}%
                %{--<button type="button" class="btn btn-primary">Create Topic</button>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%
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





</body>
</html>