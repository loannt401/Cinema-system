<%-- 
    Document   : dangki
    Created on : May 3, 2023, 1:48:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
        <style>
            .dangnhap {
                width: 80vw;
                overflow: auto;
                margin: auto;
                font-size: 1.5vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(211, 248, 216);
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
            }

            .dangnhap .login {
                width: 40%;
                overflow: auto;
                border: 0.3vw solid rgb(0, 74, 0);
                margin: auto;
                margin-top: 2vw;
                padding: 3vw;
                background-color: white;
            }

            .dangnhap .login .td{
                display: flex;
                justify-content: space-between;
            }

            .dangnhap .login .td .nut {
                /* border: 0.1vw solid black; */
                width: 15vw;
                text-align: center;
                color: rgb(0, 74, 0);
            }

            .dangnhap .login .td .nut a {
                text-decoration: none;
                color: gray;
                display: block;
            }
            
            .dangnhap .login .td .nut a:hover{
                color: black;
                border-bottom: 0.3vw solid rgb(0, 74, 0);
            }

            .dangnhap .login .td .nut a.active {
                color: black;
                border-bottom: 0.3vw solid rgb(0, 74, 0);
            }

            .dangnhap .login .khung {
                /* border: 0.1vw solid black; */
                margin-top: 2vw;
            }

            .dangnhap .login .khung label {
                font-size: 1.5vw;
                line-height: 3vw;
                font-weight: bold;
            }

            .dangnhap .login .khung .nhap {
                margin: auto;
                width: 30vw;
                height: 3vw;
                font-size: 1.2vw;
                border: 0.2vw solid black;
            }

            .dangnhap .login .khung .sm {
                width: 12vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-weight: bold;
                margin: 3vw;
                font-size: 1.2vw;
                padding: 1vw;
                border: 0.3vw solid rgb(0, 74, 0);
                border-radius: 1vw;
                background: white;
                color: rgb(0, 74, 0);
                margin-left: 30%;
            }

            .dangnhap .login .khung .sm:hover{
                background-color: rgb(0, 74, 0);
                color:white;
            }

        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <div class="dangnhap">
            <div class="login">
                <div class="td">
                    <div class="nut"><a href="dangnhap" class="nut_dn"><h3>ĐĂNG NHẬP</h3></a></div>
                    <div><h3>/</h3></div>
                    <div class="nut"><a class="nut_dk active"><h3>ĐĂNG KÍ</h3></a></div>
                </div>

                <div class="khung">
                    <c:set value="${requestScope.error}" var="error"/>
                    <c:set value="${requestScope.success}" var="success"/>
                    <h3 style="color: red">${error}</h3>
                    <h3 style="color: aquamarine">${success}</h3>
                    <form action="dangki" method="post">
                        <label>Họ và tên:</label><br/>
                        <input class="nhap" type="text" placeholder="Họ và tên" name="ten"/><br/>
                        <label>Số điện thoại:</label><br/>
                        <input class="nhap" type="text" placeholder="Số điện thoại" name="sdt"/><br/>
                        <label>Email:</label><br/>
                        <input class="nhap" type="text" placeholder="Email" name="email"/><br/>
                        <label>Mật khẩu:</label><br/>
                        <input class="nhap" type="password" placeholder="Mật khẩu" name="password"/><br/>
                        <label>Xác nhận mật khẩu:</label><br/>
                        <input class="nhap" type="password" placeholder="Mật khẩu" name="password2"/><br/>
                        <input class="sm" type="submit" value="ĐĂNG KÍ"/>
                    </form>
                </div>

            </div>
            <br/>
            <br/>
            <br/>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
