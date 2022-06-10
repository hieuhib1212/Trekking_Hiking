<%-- 
    Document   : TrekkingLink
    Created on : Mar 6, 2021, 1:04:28 PM
    Author     : Hiệu Bùi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main-content">
                <div class="content-and-share">
                    <div class="content-panel">
                        <div class="content-panel-title">
                            <p>Trekking Links</p>
                        </div>
                        <c:forEach items="${listLink}" var="o">
                            <div class="diary">
                                <div class="diary-title">
                                    <a href="${o.url}">${o.title}</a>
                                </div>
                                <div class="diary-content">
                                    <p>${o.content}</p>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>
                        <div class="paging">
                            <c:if test="${endPage < 1}">
                                <h3>Not Found!!</h3>
                            </c:if>
                            <c:if test="${endPage > 1}">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <a class="${i==index?"active":""}" href="LinksController?index=${i}">${i}</a>
                                </c:forEach>
                            </c:if>
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
