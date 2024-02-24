<%-- 
    Document   : qlphim_them
    Created on : May 22, 2023, 6:49:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm phim chiếu </title>
        <style>
            .themphim {
                width: 65vw;
                margin-left: 25vw;
                margin-top: 2vw;
                margin-bottom: 5vw;
                overflow: auto;
                background: rgb(231, 248, 233);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%); 
            }
            
            .themphim h3 {
                margin: 20px;
                
            }
            
            .themphim h2 a {
                text-decoration: none;
                color:red;
                margin-left: 20px;
            }

            .themphim h2 a:hover{
                color: #cc0033;
            }

            .themphim .td {
                margin: 20px;
                text-align: center;
            }

            .mess_success {
                background-color: rgba(133, 235, 233,0.8); 
                color: white;
                padding: 10px;
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                min-width: 400px;
                min-height: 200px;
                line-height: 200px;
                text-align: center;
                border-radius: 20px;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <%@include file="admin_menu.jsp" %>
        <div class="themphim">
            <br/>
            <h2><a href="adminquanli">Phim</a> >> Thêm</h2>
            <hr/>
            <h2 class="td">THÊM PHIM CHIẾU</h2>
            
            <div class="mess_success" id="message">
                <h1>${requestScope.error}</h1>
            </div>

        <c:if test="${requestScope.error != null}">
            <script type="text/javascript">
                function showMessageSuccess(time){
                    var successMess = document.getElementById('message');
                    successMess.style.display = 'block';
                    setTimeout(function() {
                        successMess.style.display = 'none';

                    }, time);
                }

                showMessageSuccess(2000);
            </script>
        </c:if>
            
            <%@include file="qlphim_phim.jsp" %>
        </div>
    </body>
</html>
