<%-- 
    Document   : Footer
    Created on : Feb 22, 2021, 8:11:31 AM
    Author     : Hiệu Bùi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Page</title>
        <link href="css/footer.css" rel="stylesheet">
    </head>
    <body>
        <div class="footer">
            <div class="footer-content">
                <a class="link-footer" href="#">Created with SimpleSite</a>
                <div class="footer-page-counter" style="display: block;">
                    <c:forEach items="${view}" var="o">
                        <div class="footer-page-counter-item">${o}</div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
