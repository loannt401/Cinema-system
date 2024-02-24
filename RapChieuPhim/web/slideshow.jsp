<%-- 
    Document   : slideshow
    Created on : Apr 30, 2023, 2:54:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .slideshow {
                width: 80vw;
                height: 26.5vw;
                margin: auto;
                overflow: hidden;
            }
            
            .slideshow img{
                width: 80vw;
                height: 26.5vw;
            }
            
            .slide-wrapper {
                width: 240vw;
                -webkit-animation: slide 14s ease infinite;
            }
            
            .slide {
                float: left;
                height: 26.5vw;
                width: 80vw;
            }
            
            @-webkit-keyframes slide {
                20% {margin-left: 0px;}
                30% {margin-left: -80vw;}
                50% {margin-left: -80vw;}
                60% {margin-left: -160vw;}
                80% {margin-left: -160vw;}
            }
        </style>
    </head>
    <body>
        <div class="slideshow">
            <div class="slide-wrapper">
                <div class="slide">
                    <img src="img/img_slideshow/hinh1.jpg">
                </div>
                <div class="slide">
                    <img src="img/img_slideshow/hinh2.jpg">
                </div>
                <div class="slide">
                    <img src="img/img_slideshow/hinh3.jpg">
                </div>
            </div>
        </div>
    </body>
</html>
