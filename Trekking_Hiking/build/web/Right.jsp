<%-- 
    Document   : Right
    Created on : Feb 22, 2021, 8:11:44 AM
    Author     : Hiệu Bùi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/right.css" rel="stylesheet">
    </head>
    <body>
        <div class="share-panel">
            <div class="title-share">Share this page
            </div>
            <div class="content-share">
                <ul>
                    <c:forEach items="${sharePanel}" var="o">
                        <li>
                            <img src="images/${o.icon_source}"><a class="share-fb" href="${o.link}">${o.title}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </body>
</html>
