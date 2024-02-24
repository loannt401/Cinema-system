<%-- 
    Document   : admin_themlc
    Created on : May 23, 2023, 2:25:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm lịch chiếu </title>
        <style>
            .themphim {
                width: 65vw;
                margin-left: 25vw;
                margin-top: 2vw;
                margin-bottom: 5vw;
                overflow: auto;
                background: rgb(231, 248, 233);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%); 
                text-align: center;
            }
            
            .themphim h3 {
                margin: 20px;
                
            }
            
            .themphim h2 a {
                text-decoration: none;
                color:red;
                margin-left: 20px;
            }

            .themphim h2 a:hover{
                color: #cc0033;
            }

            .themphim .td {
                margin: 20px;
                text-align: start;
                margin: 5px;
            }
            
            .themphim input {
                width: 300px;
                height: 30px;
                border: 2px solid gray;
                border-radius: 7px;
                font-size: 16px;
            }
            
            .themphim select {
                width: 200px;
                height: 30px;
                border: 2px solid gray;
                border-radius: 7px;
                font-size: 16px;
            }
            
            .themphim .submit {
                text-align: center;
                margin: 50px;
            }

            .themphim .submit input {
                width: 200px;
                height: 50px;
                font-size: 20px;
                font-weight: bold;
                color: white;
                background-color: rgb(2, 159, 202);
                border: rgb(2, 159, 202);
                border-radius: 10px;
            }

            .themphim .submit input:hover {
                background-color: rgb(0, 119, 152);
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
        <%@include file="admin_menu.jsp" %>
        <div class="themphim">
            <br/>
            <h2 class="td"><a href="adminquanlylichchieu">Lịch chiếu</a> >> <a href="adminquanlyphongchieu?ID=${requestScope.rap.ID}">${requestScope.rap.tenRap}</a> >>  Thêm</h2>
            <hr/>
            <br>
            <h2>THÊM LỊCH CHIẾU CHO RẠP ${requestScope.rap.tenRap}</h2>
            
            <form action="adminthemlichchieu" method="post">
                <div class="chonphim">
                    <h3>Chọn phim chiếu</h3>
                    <select name="PhimId">
                        <option value="0" selected disabled>--Chọn phim chiếu--</option>
                    <c:forEach items="${requestScope.dsphim}" var="phim">
                        <option value="${phim.ID}">${phim.tenPhim}</option>
                    </c:forEach>
                    </select>
                </div>
                
                <div class="chonphong">
                    <h3>Chọn phòng chiếu</h3>
                    <select name="PhongId">
                        <option value="0" selected disabled>--Chọn phòng chiếu--</option>
                    <c:forEach items="${requestScope.dsphong}" var="phong">
                        <option value="${phong.ID}">${phong.tenPhong}</option>
                    </c:forEach>
                    </select>
                </div>
                
                <div class="chonngay">
                    <h3>Chọn ngày chiếu</h3>
                    <input type="date" name="NgayChieu"/>
                </div>
                
                <div class="chongio">
                    <h3>Chọn giờ chiếu</h3>
                    <label for="BatDau">Giờ bắt đầu:</label><br/><input type="time" name="BatDau"/><br>
                    <label for="KetThuc">Giờ bắt đầu:</label><br/><input type="time" name="KetThuc"/><br/>
                </div>
                
                <div class="submit">
                    <input type="submit" value="SUBMIT"/>
                </div>
            </form>
            
            
            
            <div class="mess_success" id="message">
                <h1>${requestScope.error}</h1>
            </div>

        <c:if test="${requestScope.error != null}">
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
        </c:if>
            
        </div>
    </body>
</html>
