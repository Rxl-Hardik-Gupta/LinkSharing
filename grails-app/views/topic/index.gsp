<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Topic Details</title>
    </head>
    <body>
    <div class="container-fluid">


        <div class="row d-flex justify-content-around">
            <div class="col-4">
                <div class="mt-5">
                    <div class="card p-3">
                        <div class="d-flex align-items-center">
                            <div class="image">

                                <asset:image width="300" src="./ProfilePhoto${session ? session.topic.createdBy?.photoPath : ''}"  class="rounded img-thumbnail" alt="Avatar"/>
                            </div>
                            <div class="ml-3 w-100">
                                <h4 class="mb-0 mt-0">${session.topic.topicName} ( ${session.topic.visibility} )</h4>
                                <span><strong>@</strong>${session.topic.createdBy.userName}</span>
                                <div
                                        class="
                      p-2
                      mt-2
                      bg-secondary
                      d-flex
                      justify-content-around
                      rounded
                      text-white
                      stats
                    "
                                >
                                    <div class="d-flex flex-column justify-content-center">
                                        <span class="articles">Subscriptions</span>
                                        <span class="number">     ${session.topic.subscribers.size()}</span>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <span class="articles">Post</span>
                                        <span class="number">${session.topic.resources.size()}</span>
                                    </div>

                                </div>
                                <div class="button mt-2 d-flex flex-row align-items-center">

                                    <button class="btn btn-sm btn-primary w-100 ml-2">
                                        Follow
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-5" id="users">
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
                            <h3>Users: "${session.topic.topicName}"</h3>
                        </li>
                        <li class="list-group-item"></li>
                        <g:each in="${session.topic.subscribers}" var="${sub}">
                            <div id="subs">
                                <li class="list-group-item">
                                    <div class="mt-2">
                                        <div class="card p-3">
                                            <div class="d-flex">
                                                <div class="image img-responsive">

                                                    <asset:image width="300" src="./ProfilePhoto${session ? session.topic.createdBy?.photoPath : ''}"  class="rounded img-thumbnail" alt="Avatar"/>

                                                </div>
                                                <div class="ml-3 w-75">
                                                    <h4 class="mb-0 mt-0">${sub.user.firstName + " " + sub.user.lastName}</h4>
                                                    <span><strong>@</strong>${sub.user.userName}</span>
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
                                                            <span class="number">${sub.user.subscriptions.size()}</span>
                                                        </div>
                                                        <div class="d-flex flex-column">
                                                            <span class="articles">Topic</span>
                                                            <span class="number">${sub.user.topics.size()}</span>
                                                        </div>
                                                    </div>
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
                        <h3>Posts</h3>
                    </li>
                    <g:each in="${session.topic.resources}" var="post">

                        %{--createdBy--}%
                        <li class="list-group-item">
                            <div>
                                <div class="card p-3">
                                    <div class="d-flex align-items-center">
                                        <div class="image img-thumbnail">
                                            <asset:image width="300" src="./ProfilePhoto${post.createdBy.photoPath}"  class="rounded img-thumbnail" alt="Avatar"/>

                                        </div>
                                        <div class="ml-3 w-100">
                                            <h4 class="mb-0 mt-0">${post.createdBy.firstName + " " + post.createdBy.lastName}</h4>
                                            <span>@ ${post.createdBy.userName}</span>
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
                                                    ${post.description}
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

                                                    <a href="#">Download</a>
                                                    <a href="#">View Full Site</a>
                                                    <a href="#">Mark as Read</a>
                                                    <a href="#">View Post</a>
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
    </body>
</html>