<%-- 
    Document   : admin_lichphong
    Created on : May 23, 2023, 1:34:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí lịch chiếu</title>
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
            }
            
            .adminquanli h2{
                margin: 20px;
            }
            
            .adminquanli .td {
                text-align: start;
                margin: 5px;
            }
            
            .adminquanli h2 a {
                text-decoration: none;
                color:red;
                margin-left: 20px;
            }

            .adminquanli h2 a:hover{
                color: #cc0033;
            }

            .adminquanli .timkiem {
            }

            .adminquanli .timkiem .timkiem_sp {
                width: 300px;
                height: 40px;
                font-size: 16px;
                border: 2px solid black;
                border-radius: 5px;
            }

            .adminquanli .timkiem .timkiem_sm {
                width: 80px;
                height: 40px;
                font-size: 14px;
                background-color: blue;
                color: white;
                border: blue;
                border-radius: 5px;

            }

            .adminquanli .timkiem .timkiem_sm:hover {
                background-color: rgb(3, 3, 193);
            }
            
            .adminquanli .themphim {
                margin: 20px;
                width: 150px;
                float: right;
                margin-right: 60px;
            }
            
            .adminquanli .themphim a {
                border: 1px solid rgb(2, 159, 202);
                background-color: rgb(2, 159, 202);
                border-radius: 5px;
                display: block;
                padding: 5px;
                font-weight: bold;
                text-decoration: none;
                color: white;
            }
            
            .adminquanli .themphim a:hover {
                background-color: rgb(0, 119, 152);
            }
            
            .adminquanli .dsphim table{
                border-collapse: collapse;
                width: 90%;
                margin: auto;
                margin-top: 50px;
                margin-bottom: 50px;
                background-color: white;
            }
            
            .adminquanli .dsphim tr {
                border-bottom: 1px solid #ddd;
            }
            
            .adminquanli .dsphim tr:hover{
                background-color: #e2f7f9;
            }
            
            .adminquanli .dsphim .thaotac ul {
                list-style: none;
                padding: 0;
            }
            
            .adminquanli .dsphim .thaotac li {
                display: inline-block;
                width: 50px;
            }
            
            .adminquanli .dsphim .thaotac .thaotac_1 {
                width: 110px;
            }
            
            .adminquanli .dsphim .thaotac a {
                display: block;
                padding: 3px;
                text-decoration: none;
                color: white;
                border-radius: 5px;
            }
            
            .adminquanli .dsphim .thaotac .color_1{
                border: 1px solid rgb(19, 162, 218);
                background-color: rgb(19, 162, 218);
            }
            
            .adminquanli .dsphim .thaotac .color_1:hover{
                background-color: rgb(15, 131, 177);
            }
            
            .adminquanli .dsphim .thaotac .color_2{
                border: 1px solid rgb(1, 42, 179);
                background-color: rgb(1, 42, 179);
            }
            
            .adminquanli .dsphim .thaotac .color_2:hover{
                background-color: rgb(0, 28, 119);
            }
            
            .adminquanli .dsphim .thaotac .color_3{
                border: 1px solid rgb(229, 54, 54);
                background-color: rgb(229, 54, 54);
            }
            
            .adminquanli .dsphim .thaotac .color_3:hover{
                background-color: rgb(187, 42, 42);
            }
            
            .adminquanli .dsphim img {
                display: block;
                width: 70px;
                height: 80px;
                border: 1px solid black;
                margin: 10px;
            }
            
            .mess_success {
                background-color: rgba(133, 235, 233,0.8); 
                color: white;
                padding: 10px;
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                min-width: 400px;
                min-height: 200px;
                line-height: 200px;
                text-align: center;
                border-radius: 20px;
                transform: translate(-50%, -50%);
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
            <h2 class="td"><a href="adminquanlylichchieu">Lịch chiếu</a> >> ${requestScope.rap.tenRap}</h2>
            <hr/>
            <br/>
            <h2>QUẢN LÝ LỊCH CHIẾU RẠP ${requestScope.rap.tenRap}</h2>
            
            <div class="themphim">
                <a href="adminthemlichchieu?ID=${requestScope.rap.ID}">Thêm lịch chiếu</a>
            </div>
            
            <div class="dsphim">
                <table>
                    <tr>
                        <th style="width: 5%;">STT</th>
                        <th style="width: 15%">Phòng chiếu</th>
                        <th style="width: 15%">Ngày chiếu</th>
                        <th style="width: 15%">Bắt đầu</th>
                        <th style="width: 15%">Kết thúc</th>
                        <th>Phim</th>
                    </tr>
                    <c:set value="1" var="i"/>
                    <c:forEach items="${requestScope.dslich}" var="lich">
                        <tr>
                            <td>${i}</td>
                            <c:set value="${i+1}" var="i"/>
                        <c:forEach items="${requestScope.dsphong}" var="phong">
                            <c:if test="${lich.phongId == phong.ID}">
                                <td>${phong.tenPhong}</td>
                            </c:if>
                            
                        </c:forEach>
                                
                        <c:forEach items="${requestScope.dsngay}" var="ngay">
                            <c:if test="${lich.ngayId == ngay.ID}">
                                <td>${ngay.ngayChieu}</td>
                            </c:if>
                            
                        </c:forEach>
                            
                            <td>${lich.batDau}</td>
                            <td>${lich.ketThuc}</td>
                         <c:forEach items="${requestScope.dsphim}" var="phim">
                            <c:if test="${lich.phimId == phim.ID}">
                                <td>${phim.tenPhim}</td>
                            </c:if>
                            
                        </c:forEach>
                        </tr>
                    </c:forEach>
                    
                </table>
            </div>
        </div>
        </div>
        
        <div class="mess_success" id="message">
                    <h1>${sessionScope.success}</h1>
                </div>
                
                    <c:if test="${sessionScope.success != null}">
                        <script type="text/javascript">
                            function showMessageSuccess(time){
                                var successMess = document.getElementById('message');
                                successMess.style.display = 'block';
                                setTimeout(function() {
                                    successMess.style.display = 'none';

                                }, time);
                            }

                            showMessageSuccess(2000);
                        </script>
                        
                        <% session.removeAttribute("success"); %>
                    </c:if>
    </body>
</html>
