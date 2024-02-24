<%-- 
    Document   : header
    Created on : Apr 16, 2023, 3:56:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <style>
            .header {
                width: 80vw;
                padding-bottom: 5%;
                margin: auto;
                position: relative;
                font-size: 1.2vw;
            }
            
            .header .header_con {
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                position: absolute;
                display: flex;
                justify-content: space-between;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            .header .header_con .logo {
                width: 20%;
                height: 100%;
            }
            
            .header .header_con .logo img {
                width: 100%;
                height: 100%;
            }
            
            .header .header_con .search {
                border:0.25vw solid black;
                width: 25%;
                height: 60%;
                margin: 1%;
                border-radius: 1vw;
                text-align: center;
                color: black;
                font-size: 1.7vw;
                
            }
            
            .header .header_con .search input {
                width: 14.6vw;
                height: 2vw;
                display: inline;
                margin-bottom: 0.1vw;
                border: white;
                font-size: 1.5vw;
            }
            
            .header .header_con .search i {
                color: black;
            }
            
            .header .header_con .login {
                width: 15%;
                height: 60%;
                margin: 1%;
            }
            
            .header .header_con .login a {
                text-align: center;
                text-decoration: none;
                display: block;
                height: 100%;
                line-height: 3vw;
                font-size: 1.4vw;
                color: rgb(0, 74, 0);
                border:0.25vw solid rgb(0, 74, 0);
                border-radius: 1vw;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            
            .header .header_con .login a:hover {
                background-color: rgb(0, 74, 0);
                color: white;
            }
            
            .header .header_con .login a.active {
                background-color: rgb(0, 74, 0);
                color: white;
            }
            
            #nguoidung {
                position: absolute;
                top: 5vw;
                right: 0vw;
                width: 16%;
                overflow: auto;
                z-index: 9999;
                display: none;
                border: 0.3vw solid rgb(0, 74, 0);
                border-radius: 1vw;
                background: white;
            }

            #nguoidung ul {
                list-style: none;
                padding: 0;
            }
            
            #nguoidung li {
                text-align: center;
            }
            
            #nguoidung li a {
                display: block;
                text-decoration: none;
                color: black;
                font-weight: bold;
                padding: 0.5vw;
            }
            
            #nguoidung li a:hover {
                background: rgb(211, 248, 216);
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="header_con">
                <div class="logo">
                    <a href="home"><img src="img/img_logo/logo6.png" alt="logo"></a>
                </div>
                <div class="search">
                    <form action="">         
                        <input type="text" placeholder="Search ... " name="key" />
                        <a href="#" onclick="this.form.submit()"><i class="fa-solid fa-magnifying-glass"></i></a>     
                    </form>
                </div>
                
                <c:if test="${sessionScope.account==null}">
                    <div class="login">
                        <a href="dangnhap">
                            <i class="fa-regular fa-user"></i>
                            <b>ĐĂNG NHẬP</b>
                        </a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <c:set value="${sessionScope.account}" var="a"/>
                    <div class="login">
                        <a href="#" class="nut" onclick="openND()">
                            <b>${a.hoTen}</b>
                        </a>
                    </div>
                       
                    <div id="nguoidung">
                        <c:if test="${a.loaiND.ID==1}">
                            <ul>
                                <li><a href="hosond">Hồ sơ của tôi</a></li>
                                <li><a href="adminquanli">Quản lý</a></li>
                                <li><a href="thoat">Thoát</a></li>
                            </ul>
                        </c:if>

                        <c:if test="${a.loaiND.ID==2}">
                            <ul>
                                <li><a href="hosond">Hồ sơ của tôi</a></li>
                                <li><a href="vedamua">Vé đã mua</a></li>
                                <li><a href="thoat">Thoát</a></li>
                            </ul>
                        </c:if>
                    </div>
                </c:if>
                
                <script type="text/javascript">
                    function openND(){
                        var a = document.getElementById("nguoidung");
                        var b = document.querySelector('.nut');
                        if(a.style.display == "none"){
                            a.style.display = "block";
                            b.classList.add('active');
                        } 
                        else {
                            a.style.display = "none";
                            b.classList.remove('active');
                        }
                    }
                </script>
            </div>
        </div>
    </body>
</html>
