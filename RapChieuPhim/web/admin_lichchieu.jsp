<%-- 
    Document   : admin_lichchieu
    Created on : May 22, 2023, 11:18:34 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí</title>
        <style>
            .adminquanli {
                width: 65vw;
                overflow: auto;
                margin: auto;
                margin-left: 25vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(211, 248, 216);
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
                text-align: center;
                padding-bottom: 50px;
            }
            
            .adminquanli h2{
                margin: 20px;
            }

            .adminquanli .button {
                width: 300px;
                margin: auto;
                margin-top: 50px;
            }
            
            .adminquanli .button a {
                border: 1px solid #00cccc;
                display: block;
                height: 50px;
                font-size: 20px;
                line-height: 50px;
                border-radius: 10px;
                text-decoration: none;
                background-color: #00cccc;
                color: white;
                
            }
            
            .adminquanli .button a:hover {
                background-color: #009999;
            }
            
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <br/>
        <%@include file="admin_menu.jsp" %>
        <div class="adminquanli">
            <br/>
            <h2>QUẢN LÝ LỊCH CHIẾU</h2>
        <c:forEach items="${requestScope.dsrap}" var="rap">
            <div class="button"><a href="adminquanlyphongchieu?ID=${rap.ID}"><h3>${rap.tenRap}</h3></a></div>
        </c:forEach>
            
        </div>
        
        
    </body>
</html>
