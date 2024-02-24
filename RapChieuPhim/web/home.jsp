<%-- 
    Document   : home
    Created on : Apr 16, 2023, 1:27:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <style>
            .home {
                width: 80vw;
                margin: auto;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%); 
                overflow: auto;
            }
            .xemthem {
                width: 11vw;
                float: right;
                margin: 3vw;
            }

            .xemthem a{
                display: block;
                text-decoration: none;
                font-size: 20px;
                font-weight: bold;
                border: 0.25vw solid lightgreen;
                height: 2vw;
                padding: 0.5vw;
                line-height: 2vw;
                font-size: 1.4vw;
                color: lightgreen;
            }

            .xemthem a:hover {
                color: white;
                background: lightgreen;
            }
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <br/>
        <%@include file="slideshow.jsp" %>
        <div class="clr"></div>
        <br>
        <jsp:include page="phim.jsp"/>


        <div class="clr"></div>
        <div class="home">
            <div class="xemthem">
                <a href="phim">XEM THÊM <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>
        <div class="clr"></div>
        <%@include file="footer.jsp" %>

    </body>
</html>
