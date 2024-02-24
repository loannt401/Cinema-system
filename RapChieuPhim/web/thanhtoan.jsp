<%-- 
    Document   : thanhtoan
    Created on : May 8, 2023, 4:35:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            
            .thanhtoan .thongtinthanhtoan .sm {
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
                margin-left: 40%;
            }
            
            .thanhtoan .thongtinthanhtoan .sm:hover{
                background-color: rgb(0, 74, 0);
                color:white;
            }
            
            .datve .datve_4 {
                border-bottom: 0.3vw solid black;
                color: black;
            }
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <%@include file="datve.jsp" %>
        <c:set value="${sessionScope.thongtinve}" var="c"/>
        <div class="thanhtoan">
            <div class="thongtinthanhtoan">
                <h2>THANH TOÁN</h2>
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
                    <input type="hidden" value="${c.tongTien}" name="tongtien"/>
                    <button type="submit" class="sm" href>Thanh toán</button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>  
    </body>
</html>
