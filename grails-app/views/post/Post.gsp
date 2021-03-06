<%@ page import="linksharing.ResourceRating; linksharing.Resource; linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.User" %>
<%@ page import="linksharing.Resource" %>
<%@ page import="linksharing.LinkResource" %>
<%@ page import="linksharing.DocumentResource" %>
<html lang="en" >
<head>
    %{--<meta name="layout" content="main"/>--}%
    <title>Dashboard</title>

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

    <style>
    *{
        margin: 0;
        padding: 0;
    }
    .rate {
        float: left;
        height: 46px;
        padding: 0 10px;
    }
    .rate:not(:checked) > input {
        position:absolute;
        top:-9999px;
    }
    .rate:not(:checked) > label {
        float:right;
        width:1em;
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:30px;
        color:#ccc;
    }
    .rate:not(:checked) > label:before {
        content: '★ ';
    }
    .rate > input:checked ~ label {
        color: #ffc700;
    }
    .rate:not(:checked) > label:hover,
    .rate:not(:checked) > label:hover ~ label {
        color: #deb217;
    }
    .rate > input:checked + label:hover,
    .rate > input:checked + label:hover ~ label,
    .rate > input:checked ~ label:hover,
    .rate > input:checked ~ label:hover ~ label,
    .rate > label:hover ~ input:checked ~ label {
        color: #c59b08;
    }

    </style>
</head>


<body >


<div class="container-fluid mt-5">
    <div class="row d-flex justify-content-around">
        <div class="col-6">
            <ul class="list-group">
                <li class="list-group-item active">
                    <h3>Post</h3>
                </li>
                    <li class="list-group-item">
                        <div>
                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                                    <div class="image img-thumbnail">
                                        <asset:image width="300" src="./ProfilePhoto${res.createdBy.photoPath}"  class="rounded img-thumbnail" alt="Avatar" />

                                    </div>



                                    <div class="ml-3 w-100">
                                        <div>
                                            <h4 class="mb-0 mt-0">${res.createdBy.firstName + " " + res.createdBy.lastName}</h4>
                                            <span>@ ${res.createdBy.userName}</span>

                                            <g:if test="${(session.getAttribute('user') != null)}">
                                                <div class="rate" >
                                                    <input type="radio" id="star5" name="rate" value="5" onclick="rate(5, ${res.id})" />
                                                    <label for="star5" title="text">5 stars</label>
                                                    <input type="radio" id="star4" name="rate" value="4" onclick="rate(4, ${res.id})"/>
                                                    <label for="star4" title="text">4 stars</label>
                                                    <input type="radio" id="star3" name="rate" value="3" onclick="rate(3, ${res.id})"/>
                                                    <label for="star3" title="text">3 stars</label>
                                                    <input type="radio" id="star2" name="rate" value="2" onclick="rate(2, ${res.id})"/>
                                                    <label for="star2" title="text">2 stars</label>
                                                    <input type="radio" id="star1" name="rate" value="1" onclick="rate(1, ${res.id})"/>
                                                    <label for="star1" title="text">1 star</label>
                                                </div>
                                            </g:if>
                                        </div>
                                        <div
                                                class="
                          p-2
                          mt-2
                          d-flex
                          justify-content-between
                          rounded
                          stats
                          text-justify
                        "
                                        >
                                            <p class="text-justify">
                                                ${res.description}
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


                                                <g:if test="${res.class == LinkResource}">
                                                    <a href="${res.url}">View Full Site</a>
                                                </g:if>
                                                <g:else>
                                                    <g:link controller="resource" action="download" params="[resId:res.id]" >Download</g:link>
                                                </g:else>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
            </ul>
        </div>

        <div class="col-4">
            <div  id="trending-topics">
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
                    <g:if test="${(session.getAttribute('trending') != null)}">
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
                                                    <g:if test="${(linksharing.Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as linksharing.User)) != null}">
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


                                                        <a href="#">Send Invitation</a>
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
                                                    <a href="#">Delete</a>
                                                    <a href="#">Edit</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </div>
                        </g:each>
                    </g:if>
                    <g:else>
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
                                                    %{--<g:if test="${(linksharing.Subscription.findByTopicAndUser(tp as Topic, session.getAttribute('user') as linksharing.User)) != null}">--}%
                                                        %{--<button class="btn btn-link" onclick="unsubscribeTopic(${tp.id})">Unsubscribe</button>--}%
                                                    %{--</g:if>--}%
                                                    %{--<g:else>--}%
                                                        %{--<button class="btn btn-link" onclick="subscribeTopic(${tp.id})">Subscribe</button>--}%
                                                    %{--</g:else>--}%
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



                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </div>
                        </g:each>
                    </g:else>
                </ul>
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