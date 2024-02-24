<%-- 
    Document   : rap
    Created on : Apr 29, 2023, 4:40:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rạp Chiếu</title>
        <style>
            .rap {
                font-size: 1.2vw;
                width: 80vw;
                margin: auto;
                padding-top: 3vw;
                padding-bottom: 3vw;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%); 
            }
            .rap a {
                text-decoration: none;
                color:black;
                margin-bottom: 1vw;
            }
            
            .rap .rap_1 {
                border: 0.25vw solid rgb(0, 74, 0);
                height: 20vw;
                width: 80%;
                margin: auto;
                margin-bottom: 1vw;
                margin-top: 1vw;
                border-radius: 1vw;
                
            }
            
            .rap .rap_1 .rap_1_1 {
                width: 40%;
                height: 90%;
                margin: 1vw;
                float:left;
            }
            
            .rap .rap_1 .rap_1_1 img {
                width: 100%;
                height: 100%;
            }
            
            .rap .rap_1 .rap_1_2 {
                width: 50%;
                height: 15vw;
                margin: 1vw;
                float: right;
                text-align: center;
                padding-top: 1vw;
                border: 0.25vw solid #ccc;
            }
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>

        <div class="rap">
            <c:forEach items="${requestScope.rap}" var="c">
                <a href="#">
                    <div class="rap_1">
                        <div class="rap_1_1">
                            <img src="img/img_rap/${c.hinhAnh}" alt="${c.tenRap}"/>
                        </div>
                        <div class="rap_1_2">
                            <h1>${c.tenRap}</h1>
                            <h2>${c.diaChi}</h2>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
