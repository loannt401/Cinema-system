<%-- 
    Document   : hsND
    Created on : May 3, 2023, 1:00:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hồ sơ của tôi</title>
        <style>
            .hsND {
                width: 80vw;
                overflow: auto;
                margin: auto;
                font-size: 1.5vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(211, 248, 216);
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
            }
            
            .hsND .thongtinND {
                width: 60%;
                overflow: auto;
                border: 0.3vw solid rgb(0, 74, 0);
                margin: auto;
                margin-top: 2vw;
                padding: 3vw;
                background-color: white;
                margin-bottom: 5vw;
            }
            
            .hsND .thongtinND h2 {
                text-align: center;
            }
            
            .hsND .thongtinND label {
                font-weight: bold;
                display: inline-block;
                width: 15vw;
            }
            
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <div class="hsND">
            <div class="thongtinND">
                <c:set value="${requestScope.thongtin}" var="t"/>
                <h2>Hồ sơ của ${t.loaiND.tenLoai}</h2>
                <p>
                    <label>Tên ${t.loaiND.tenLoai}:</label>
                    <span>${t.hoTen}</span>
                </p>
                <p>
                    <label>Số điện thoại:</label>
                    <span>${t.sdt}</span>
                </p>
                <p>
                    <label>Email:</label>
                    <span>${t.email}</span>
                </p>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
