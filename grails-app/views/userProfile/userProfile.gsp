<%@ page import="linksharing.Resource; linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.User" %>
<%@ page import="linksharing.Resource" %>
<%@ page import="linksharing.LinkResource" %>
<%@ page import="linksharing.DocumentResource" %>

<!doctype html>
<html lang="en" >
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>

    <asset:stylesheet href="dashboard.css"/>
    <asset:stylesheet href="index.css"/>
    <asset:stylesheet  href="navbar.css"  />

    <script >

        var addTopicURL = "${createLink(controller:'topic', action:'createTopic')}"  ;


    </script>


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






    <div class="row d-flex justify-content-around">
        <div class="col-4">
            <div class="mt-5" >
                <div class="card p-3" id="userprofile">
                    <div class="d-flex align-items-center">
                        <div class="image">
                            <asset:image width="300" src="./ProfilePhoto${user?.photoPath}"
                                         class="rounded img-thumbnail" alt="Avatar"/>
                        </div>

                        <div class="ml-3 w-100">
                            <h4 class="mb-0 mt-0">${user.firstName + " " + user.lastName}</h4>
                            <span>@ ${user.userName}</span>

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
                    ">
                                <div class="d-flex flex-column">
                                    <span class="articles">Subscriptions</span>
                                    <span class="number">${(subs.size())}</span>
                                </div>

                                <div class="d-flex flex-column">
                                    <span class="articles">Topics</span>
                                    <span class="number">${topics.size()}</span>
                                </div>


                            </div>

                            <div class="button mt-2 d-flex flex-row align-items-center">

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-5" id="subscriptionss">
                <ul class="list-group" id="totalSubs">
                    <li
                            class="
                  subscriptions
                  list-group-item
                  active
                  d-flex
                  justify-content-xl-around
                ">
                        <h3>Subscriptions</h3>
                        %{--<a href="wwwwerwe" class="btn btn-danger">View All</a>--}%
                    </li>
                    <li class="list-group-item"></li>
                    <g:each in="${subs}" var="sub" id="subb">
                        <li class="list-group-item">
                            <div class="mt-2">
                                <div class="card p-3">
                                    <div class="d-flex">
                                        <div class="image img-responsive">
                                            <asset:image

                                                    src="./ProfilePhoto${sub.topic.createdBy.photoPath}"
                                                    class="rounded img-thumbnail"
                                                    width="140"
                                                    alt="Avatar"/>
                                        </div>

                                        <div class="ml-3 w-75">
                                            <!-- <h4 class="mb-0 mt-0">Some User</h4> -->
                                            <g:link controller="topic" action="openTopic"
                                                    params="[topicId: sub.topic.id]">${sub.topic.topicName}</g:link>

                                            %{--<a href="" class="d-block">${sub.topic.topicName}</a>--}%
                                            <span class="d-block">@${sub.user.userName}</span>
                                            %{--<a href="#">Unsubscribe</a>--}%

                                            %{--<button class="btn btn-link" onclick="unsubscribe(${sub.id})">Unsubscribe</button>--}%
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
                          ">
                                                <div class="d-flex flex-column">
                                                    <span class="articles">Subscriptions</span>
                                                    <span class="number">${sub.topic.subscribers.size()}</span>
                                                </div>

                                                <div class="d-flex flex-column">
                                                    <span class="articles">Post</span>
                                                    <span class="number">${sub.topic.resources.size()}</span>
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
                        ">
                                            <g:if test="${session && (session.getAttribute('user') as User) && (session.getAttribute('user') as User).id == user.id}">
                                                <form method="get" action="">
                                                    <div class="form-group">
                                                        <select class="custom-select" onchange="changeSeriousness(${sub.id}, this.value)" name="seriousness">
                                                            <g:if test="${(sub.seriousness as String).equals("VERY_SERIOUS")}">
                                                                <option  value="SERIOUS">Serious</option>
                                                                <option value="VERY_SERIOUS" selected>VerySerious</option>
                                                                <option value="CASUAL">Casual</option>
                                                            </g:if>
                                                            <g:if test="${(sub.seriousness as String).equals("CASUAL")}">
                                                                <option  value="SERIOUS">Serious</option>
                                                                <option value="VERY_SERIOUS" >VerySerious</option>
                                                                <option value="CASUAL" selected >Casual</option>
                                                            </g:if>
                                                            <g:if test="${(sub.seriousness as String).equals("SERIOUS")}">
                                                                <option  value="SERIOUS" selected>Serious</option>
                                                                <option value="VERY_SERIOUS" >VerySerious</option>
                                                                <option value="CASUAL">Casual</option>
                                                            </g:if>

                                                        </select>
                                                    </div>
                                                </form>
                                            </g:if>



                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>

            <div class="mt-5" id="trending-topics">
                <ul class="list-group">
                    <li
                            class="
                  subscriptions
                  list-group-item
                  active
                  d-flex
                  justify-content-xl-around
                ">
                        <h3>Topics</h3>
                    </li>
                    <li class="list-group-item"></li>
                    <g:each in="${topics}" var="tp">
                        <div id="subs">
                            <li class="list-group-item">
                                <div class="mt-2">
                                    <div class="card p-3">
                                        <div class="d-flex">
                                            <div class="image img-responsive">
                                                <asset:image

                                                        src="./ProfilePhoto${tp.createdBy.photoPath}"
                                                        class="rounded img-thumbnail"
                                                        width="140"
                                                        alt="Avatar"/>
                                            </div>

                                            <div class="ml-3 w-75">
                                                <!-- <h4 class="mb-0 mt-0">Some User</h4> -->
                                                <g:link controller="topic" action="openTopic"
                                                        params="[topicId: tp.id]">${tp.topicName}</g:link>

                                                <span class="d-block">@${tp.createdBy.userName}</span>
                                                <g:if test="${(session && session.getAttribute('user') as User != null) && (session.getAttribute('user') as User).id == user.id  && Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as User) != null}">
                                                    <button class="btn btn-link" onclick="unsubscribeTopic(${tp.id})">Unsubscribe</button>
                                                </g:if>
                                                <g:else>
                                                    <g:if test="${session && session.user != null}">
                                                        <button class="btn btn-link" onclick="subscribeTopic(${tp.id})">Subscribe</button>
                                                    </g:if>
                                                </g:else>
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
                          ">
                                                    <div class="d-flex flex-column">
                                                        <span class="articles">Subscriptions</span>
                                                        <span class="number">${tp.subscribers.size()}</span>
                                                    </div>

                                                    <div class="d-flex flex-column">
                                                        <span class="articles">Post</span>
                                                        <span class="number">${tp.resources.size()}</span>
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
                        ">
                                                <g:if test="${session && session.user != null && user.id == session.user.id && Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as User) != null}">
                                                    <g:set var="subscription" value="${Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as User)}" />
                                                    <div class="form-group">
                                                        <select class="custom-select" onchange="changeSeriousness(${subscription.id}, this.value)" name="seriousness">
                                                            <g:if test="${(subscription.seriousness as String).equals("VERY_SERIOUS")}">
                                                                <option  value="SERIOUS">Serious</option>
                                                                <option value="VERY_SERIOUS" selected>VerySerious</option>
                                                                <option value="CASUAL">Casual</option>
                                                            </g:if>
                                                            <g:if test="${(subscription.seriousness as String).equals("CASUAL")}">
                                                                <option  value="SERIOUS">Serious</option>
                                                                <option value="VERY_SERIOUS" >VerySerious</option>
                                                                <option value="CASUAL" selected >Casual</option>
                                                            </g:if>
                                                            <g:if test="${(subscription.seriousness as String).equals("SERIOUS")}">
                                                                <option  value="SERIOUS" selected>Serious</option>
                                                                <option value="VERY_SERIOUS" >VerySerious</option>
                                                                <option value="CASUAL">Casual</option>
                                                            </g:if>

                                                        </select>
                                                    </div>


                                                <a href="#">Send Invitation</a>
                                                </g:if>

                                                %{--<a href="#">Edit</a>--}%
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

        <div class="col-6 mt-5" id="">
            <ul class="list-group" id="inbox">
                <li class="list-group-item active">
                    <h3>Posts</h3>
                </li>
                <g:each in="${resources}" var="rs">
                    <li class="list-group-item">
                        <div>
                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                                    <div class="image img-thumbnail">
                                        <asset:image width="300" src="./ProfilePhoto${rs.createdBy.photoPath}"  class="rounded img-thumbnail" alt="Avatar"/>

                                    </div>
                                    <div class="ml-3 w-100">
                                        <h4 class="mb-0 mt-0">${rs.createdBy.firstName + " " + rs.createdBy.lastName}</h4>
                                        <span>@ ${rs.createdBy.userName}</span>
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
                                                ${rs.description}
                                            </p>
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


                                                <g:if test="${rs.class == LinkResource}">
                                                    <a href="${rs.url}">View Full Site</a>
                                                </g:if>
                                                <g:else>
                                                    <g:link controller="resource" action="download" params="[resId:rs.id]" >Download</g:link>
                                                </g:else>
                                                %{--<button  onclick="markAsRead(${rd.id})"  class="btn btn-link">Mark As Read</button>--}%
                                                <g:link controller="post" action="index" params="[postId:rs.id]" >View Post</g:link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </g:each>
            </ul>
        </div>
    </div>
</div>


%{--Modals--}%

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