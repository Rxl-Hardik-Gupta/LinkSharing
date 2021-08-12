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

    <g:if test="${flash.message}">
        <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
            <strong>${flash.message}</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </g:if>
    <g:if test="${flash.inviteMessage}">
        <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
            <strong>${flash.inviteMessage}</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </g:if>



    <div class="row d-flex justify-content-around">
        <div class="col-4">
            <div class="mt-5" >
                <div class="card p-3" id="userprofile">
                    <div class="d-flex align-items-center">
                        <div class="image">
                            %{--<img--}%
                            %{--src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"--}%
                            %{--class="rounded img-thumbnail"--}%
                            %{--width="300"--}%
                            %{--/>--}%
                            <asset:image width="300" src="./ProfilePhoto${session ? session.user?.photoPath : ''}"
                                         class="rounded img-thumbnail" alt="Avatar"/>
                        </div>

                        <div class="ml-3 w-100">
                            <h4 class="mb-0 mt-0">${session.user.firstName + " " + session.user.lastName}</h4>
                            <span><strong>Admin:</strong>${session.user.admin}</span>

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
                                    <span class="number">${(session.getAttribute('user') as User).subscriptions.size()}</span>
                                </div>

                                <div class="d-flex flex-column">
                                    <span class="articles">Topics</span>
                                    <span class="number">${(session.getAttribute('user') as User).topics.size()}</span>
                                </div>

                                %{--<div class="d-flex flex-column">--}%
                                    %{--<span class="articles">Rating</span>--}%
                                    %{--<span class="number">8.9</span>--}%
                                %{--</div>--}%
                            </div>

                            <div class="button mt-2 d-flex flex-row align-items-center">
                                %{--<button class="btn btn-sm btn-outline-primary w-100">--}%
                                %{--Chat--}%
                                %{--</button>--}%
                                %{--<button class="btn btn-sm btn-primary w-100 ml-2">--}%
                                %{--Follow--}%
                                %{--</button>--}%
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
                    <g:each in="${ (linksharing.Subscription.findAllByUser(session.getAttribute('user') as linksharing.User)).sort{it.dateCreated}.reverse()}" var="sub" id="subb">
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

                                                <button class="btn btn-link" onclick="unsubscribe(${sub.id})">Unsubscribe</button>
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


                                               <g:if test="${sub.user.id.equals(sub.topic.createdBy.id)}">
                                                       <div class="form-group">
                                                          <select class="custom-select"  onchange="changeVisibility(${sub.topic.id}, this.value)"  name="visibility">
                                                           <g:if test="${(sub.topic.visibility as String).equals("PRIVATE")}">

                                                                   <option value="PRIVATE" selected>Private</option>
                                                                   <option value="PUBLIC">Public</option>
                                                           </g:if>
                                                           <g:else>
                                                                   <option value="PRIVATE" >Private</option>
                                                                   <option value="PUBLIC" selected >Public</option>
                                                           </g:else>
                                                          </select>

                                                       </div>
                                                <button class="btn btn-link" onclick="deleteTopic(${sub.topic.id})">Delete</button>
                                                <button class="btn btn-link" onclick="editTopic(${sub.topic.id})">Edit</button>
                                               </g:if>
                                                %{--<a href="#">Send Invitation</a>--}%
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
                        <h3>Trending Topics</h3>
                    </li>
                    <li class="list-group-item"></li>
                    <g:each in="${session.getAttribute('trending') as List<linksharing.Topic>}" var="tp">
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
                                                <g:if test="${(Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as User)) != null}">
                                                    <button class="btn btn-link" onclick="unsubscribeTopic(${tp.id})">Unsubscribe</button>
                                                </g:if>
                                                <g:else>
                                                    <button class="btn btn-link" onclick="subscribeTopic(${tp.id})">Subscribe</button>
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
                                                <g:if test="${(Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as User)) != null}">
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


                                                    %{--<a href="#">Send Invitation</a>--}%
                                                </g:if>
                                                <g:if test="${tp.createdBy.id.equals((session.getAttribute('user')as User).id)}">
                                                        <div class="form-group">
                                                            <select class="custom-select"  onchange="changeVisibility(${tp.id}, this.value)"  name="visibility">
                                                                <g:if test="${(tp.visibility as String).equals("PRIVATE")}">

                                                                    <option value="PRIVATE" selected>Private</option>
                                                                    <option value="PUBLIC">Public</option>
                                                                </g:if>
                                                                <g:else>
                                                                    <option value="PRIVATE" >Private</option>
                                                                    <option value="PUBLIC" selected >Public</option>
                                                                </g:else>
                                                            </select>
                                                        </div>
                                                </g:if>

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

        <div class="col-6 mt-5" id="">
            <ul class="list-group" id="inbox">
                <li class="list-group-item active">
                    <h3>Inbox</h3>
                </li>
                <g:each in="${session.getAttribute('inbox') as List<linksharing.ReadingItem>}" var="rd">
                    <li class="list-group-item">
                        <div>
                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                                    <div class="image img-thumbnail">
                                        <asset:image width="300" src="./ProfilePhoto${rd.resource.createdBy.photoPath}"  class="rounded img-thumbnail" alt="Avatar"/>

                                    </div>
                                    <div class="ml-3 w-100">
                                        <h4 class="mb-0 mt-0">${rd.resource.createdBy.firstName + " " + rd.resource.createdBy.lastName}</h4>
                                        <span>@ ${rd.resource.createdBy.userName}</span>
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
                                                ${rd.resource.description}
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


                                                <g:if test="${rd.resource.class == LinkResource}">
                                                    <a href="${rd.resource.url}">View Full Site</a>
                                                </g:if>
                                                <g:else>
                                                    <g:link controller="resource" action="download" params="[resId:rd.resource.id]" >Download</g:link>
                                                </g:else>
                                                <button  onclick="markAsRead(${rd.id})"  class="btn btn-link">Mark As Read</button>
                                                <g:link controller="post" action="index" params="[postId:rd.resource.id]" >View Post</g:link>
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