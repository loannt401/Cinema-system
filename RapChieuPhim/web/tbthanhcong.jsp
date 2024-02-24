<%-- 
    Document   : tbthanhcong
    Created on : May 4, 2023, 12:17:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận vé</title>
         <style>
            .xacnhanve {
                width: 80vw;
                overflow: auto;
                margin: auto;
                font-size: 1.5vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(211, 248, 216);
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
            }
            
            .xacnhanve .thongtinVe {
                width: 60%;
                overflow: auto;
                border: 0.3vw solid rgb(0, 74, 0);
                margin: auto;
                margin-top: 2vw;
                padding: 3vw;
                background-color: white;
                margin-bottom: 5vw;
            }
            
            .xacnhanve .thongtinVe h2 {
                text-align: center;
            }
            
            .xacnhanve .thongtinVe label {
                font-weight: bold;
                display: inline-block;
                width: 15vw;
            }
            
            .xacnhanve .thongtinVe .sp {
                border: 0.1vw solid black;
                display: inline-block;
                width: 3vw;
                margin-top: 1vw;
                margin-right: 0.5vw;
                text-align: center;
            }
            

        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <c:set value="${requestScope.xacnhanve}" var="c"/>
        <div class="xacnhanve">
            <div class="thongtinVe">
                <c:set value="${c.nguoiDung}" var="t"/>
                <h2>ĐẶT VÉ THÀNH CÔNG</h2>
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
                <c:set value="${c.phim}" var="phim"/>
                <c:set value="${c.lichChieu}" var="lich"/>
                <c:set value="${c.phongChieu.tenPhong}" var="phong"/>
                <p>
                    <label>Tên phim:</label>
                    <span>${phim.tenPhim}</span>
                </p>
                <p>
                    <label>Lịch chiếu:</label>
                    <span>${lich.batDau} - ${lich.ketThuc}</span>
                </p>
                <p>
                    <label>Tên phòng:</label>
                    <span>${phong}</span>
                </p>
                <p>
                    <label>Ghế đã chọn:</label>
                    <c:forEach items="${c.dsGhe}" var="dsghe">
                        <span class="sp">${dsghe.hangGhe}${dsghe.STT}</span>
                    </c:forEach>
                </p>
                <p>
                    <label>Tổng tiền: </label>
                    <span>${c.tongTien} đ </span>
                </p>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
