<%-- 
    Document   : HomePage
    Created on : Feb 22, 2021, 8:03:19 AM
    Author     : Hiệu Bùi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Front Page</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main-content">
                <div class="content-and-share">
                    <div class="content-panel">
                        <div class="view-gallery-panel">
                            <c:forEach items="${pageList}" var="o">
                                <div class="gallery-item">
                                    <div class="image-gallery">
                                        <img class="img-gallery" src="images/${o.pageImage}">
                                    </div>
                                    <div class="title-gallery">
                                        <a href="${o.pageUrl}">${o.pageName}</a>
                                    </div>
                                    <div class="content-gallery">
                                        <p>${o.pageDes}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div>
                            <img class="image" src="images/${welcome.image}" />
                        </div>
                        <div class="about-me">
                            <div class="title-about">Welcome</div>
                            <div class="content-about">
                                <p>${welcome.des}</p>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
            <hr>
            <jsp:include page="Footer.jsp"/>
        </div>
    </body>
</html>
