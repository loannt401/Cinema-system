<%-- 
    Document   : footer
    Created on : Apr 16, 2023, 4:04:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style>
            #footer {
                font-family:sans-serif;
                width: 80vw;
                overflow: auto;
                margin: auto;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
                font-size: 1.5vw;
            }

            #footer .box1{
                display: flex;
                justify-content: center;
                background-color: rgb(231, 248, 233);
            }

            #footer .box1_x{
                padding: 1vw;
                margin-left: 3vw;
                margin-right: 3vw;
            }

            #footer .box1_x ul {
                list-style: none;
                padding: 0px;
            }

            #footer .box1_x h4{
                padding-left: 1vw;
                border-left: 0.25vw solid #008CBA;
            }

            #footer .box1_x a {
                text-decoration: none;
                color: black;
            }

            #footer .box2 {
                text-align: center;
                font-size: 1.2vw;
                background-color: rgb(211, 248, 216);
            }
        </style>
    </head>
    <body>
    <center>
        <div id="footer">
        <div class="box1">
            <div class="box1_x">
                <h4><b>GIỚI THIỆU </b></h4>
                <ul>
                    <li><a href="#">Về chúng tôi </a></li>
                    <li><a href="#">Thỏa thuật sử dụng</a></li>
                    <li><a href="#">Quy chế hoạt động</a></li>
                </ul>
            </div>
            <div class="box1_x">
                <h4>HỖ TRỢ </h4>
                <ul>
                    <li><a href="#">Góp ý </a></li>
                    <li><a href="#">Rạp </a></li>
                    <li><a href="#">Giá vé</a></li>
                </ul>
            </div>
            <div class="box1_x">
                <h4>CHÍNH SÁCH </h4>
                <ul>
                    <li><a href="#">Chính sách bảo mật</a></li>
                    <li><a href="#">Quy định thanh toán</a></li>
                    <li><a href="#">Bảo vệ thông tin người dùng </a></li>
                </ul>
            </div>
        </div>
        <div class="box2">
            <br>
            <p>Công Ty Cổ Phần Phim NTL, Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội</p>
            <img src="img/img_logo/trade.png" alt="trade" width="80px">
        </div>
    </div>
    </center>
    </body>
</html>
