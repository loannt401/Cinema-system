<%-- 
    Document   : phanhoi
    Created on : May 8, 2023, 5:58:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán thất bại</title>
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <style>
            .thanhtoan {
                width: 80vw;
                overflow: auto;
                margin: auto;
                font-size: 1.5vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(211, 248, 216);
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
            }
            
            .thanhtoan .thongtinthanhtoan {
                width: 60%;
                overflow: auto;
                border: 0.3vw solid rgb(0, 74, 0);
                margin: auto;
                margin-top: 2vw;
                padding: 3vw;
                background-color: white;
                margin-bottom: 5vw;
            }
            
            .thanhtoan .thongtinthanhtoan h2 {
                text-align: center;
            }
            
            .thanhtoan .thongtinthanhtoan label {
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
        <c:set value="${sessionScope.thongtinve}" var="c"/>
        <div class="thanhtoan">
            <div class="thongtinthanhtoan">
                <h2>THANH TOÁN THẤT BẠI</h2>
                <form action="thanhtoan" id="frmCreateOrder" method="post"> 
                    <c:set value="${c.nguoiDung}" var="t"/>
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
                    
                    <p>
                        <label>Tổng tiền: </label>
                        <span>${c.tongTien} đ </span>
                    </p>
                    
                    <p>
                        <label>Ngân hàng: </label>
                        <span>Ngân hàng Quốc Dân – NCB</span>
                    </p>
                    <p>
                        <label>Phương thức thanh toán: </label>
                        <span>Thanh toán qua thẻ ATM/Tài khoản nội địa</span>
                    </p>
                </form>
            </div>
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
