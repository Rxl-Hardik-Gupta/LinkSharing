<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 27/7/21
  Time: 4:39 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<h1>You Are Logged In</h1>

 <p>${session.getAttribute('user')}</p>
</body>
</html>