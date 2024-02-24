<%-- 
    Document   : menu
    Created on : Apr 16, 2023, 4:10:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style>
            .menu {
                width: 80vw;
                padding-bottom: 3%;
                margin: auto;
                position: relative;
                border:0.1vw solid black;
            }
            
            .menu .menu_con {
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                background-color: rgb(0, 74, 0);
                text-align: center;
            }
            
            .menu .menu_con ul {
                display: flex;
                margin: 0;
                justify-content: center;
                padding: 0;
            }
            
            .menu .menu_con li {
                list-style: none;
                width: 10vw;
                height: 2.9vw;
                line-height: 2.9vw;
            }
            
            .menu .menu_con a {
                text-decoration: none;
                font-weight: bold;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-size: 1.5vw;
                color: white;
                display: block;
            }
            
            .menu .menu_con a:hover {
                background-color: rgb(1, 141, 1);
                transition: ease-in 0.3s;
            }
        </style>
    </head>
    <body>
        <div class="menu">
            <div class="menu_con">
                <ul>
                    <li><a href="phim">PHIM</a> </li>
                    <li><a href="lichchieu">ĐẶT VÉ</a></li>
                    <li><a href="rap">RẠP CHIẾU</a></li>
                    <li><a href="#">GIÁ VÉ</a></li>
                    <li><a href="#">HỖ TRỢ </a></li>
                </ul>
            </div>
    </div>
    </body>
</html>
