<%-- 
    Document   : Header
    Created on : Feb 22, 2021, 8:11:24 AM
    Author     : Hiệu Bùi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="title">
            <div class="title-main">
                <div class="text">
                    <div class="photo-link"><a href="FrontController">Trekking and hikking</a></div>
                    <div class="welcome-text">Welcome to our website</div>
                </div>
            </div>
        </div>
        <div class="nav-bar">
            <div class="content-bar">
                <div class="item ${active=="Front Page"?"activeMenu":""}">
                    <a href="FrontController">Front Page</a>
                </div>
                <c:forEach items="${pageList}" var="o" >
                    <div class="item ${active==o.pageName?"activeMenu":""}">
                        <a href="${o.pageUrl}">${o.pageName}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
