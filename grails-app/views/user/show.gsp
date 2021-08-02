<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>


    <h1>ouhfwjngknwlg</h1>

    <ol class="list-group list-group-flush">
        <g:each in="${users}" var="user">

            <li class="list-group-item">
                ${user}

            </li>

        </g:each>

    </ol>

    </body>
</html>
