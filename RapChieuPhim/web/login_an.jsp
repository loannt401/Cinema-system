<%-- 
    Document   : login_an
    Created on : Apr 30, 2023, 1:09:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
                display: none;
            }

            #login-window {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                padding: 20px;
                background-color: white;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <a href="#" onclick="openLoginWindow()">
                <b>ĐĂNG NHẬP</b>
            </a>
        </div>
        <div id="login-overlay" class="overlay">
            <div id="login-window">
              <h2>Đăng nhập</h2>
              <form action="#" method="#">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password">
                <button type="submit">Đăng nhập</button>
                <button id="close-login-window">Đóng</button>
              </form>
            </div>
        </div>
        <script type="text/javascript">
            function openLoginWindow() {
                var loginOverlay = document.getElementById("login-overlay");
                loginOverlay.style.display = "block";
            }
            
            document.getElementById("close-login-window").onclick = function() {
                closeLoginWindow();
            }

            function closeLoginWindow() {
                var loginOverlay = document.getElementById("login-overlay");
                loginOverlay.style.display = "none";
            }
        </script>
    </body>
</html>
