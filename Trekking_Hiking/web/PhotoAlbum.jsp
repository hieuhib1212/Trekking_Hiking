<%-- 
    Document   : Gallery
    Created on : Feb 22, 2021, 8:10:22 AM
    Author     : Hiệu Bùi 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="script.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <!-- end-nav-bar -->
            <!--main content-->
            <div class="main-content">
                <div class="content-and-share">
                    <div class="content-panel">
                        <div class="album">
                            <div class="heading">
                                <p>Photo Album</p>
                            </div>
                            <div class="content">
                                <div class="slideshow-container">
                                    <c:forEach items="${listPhoto}" var="o">
                                        <div class="mySlides fade">
                                            <img src="${imagePath}/${o.image_url}" style="width:100%">
                                        </div>
                                    </c:forEach>
                                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                                </div>
                                <hr>
                                <div class="slide">
                                    <c:forEach items="${listPhoto}" var="o" varStatus="loop">
                                        <div class="thumbnail">
                                            <a onclick="currentSlide(${loop.index + 1})"><img src="${imagePath}/${o.image_url}"  alt="slide_image"></a>
                                        </div>
                                    </c:forEach>

                                </div>
                                <div class="paging">
                                    <c:if test="${endPage < 1}">
                                        <h3>Not Found!!</h3>
                                    </c:if>
                                    <c:if test="${endPage > 1}">
                                        <c:forEach begin="1" end="${endPage}" var="i">
                                            <a class="${i==index?"active":""}" href="AlbumController?index=${i}">${i}</a>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                    </div>
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>

            <hr>
            <!-- end main content -->
            <jsp:include page="Footer.jsp"/>
        </div>
    </body>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);
        setInterval(function(){ showSlides(++slideIndex); }, 3000);
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }
        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            if (n > slides.length) {
                slideIndex = 1;
            }
            if (n < 1) {
                slideIndex = slides.length;
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }
    </script>
</html>
