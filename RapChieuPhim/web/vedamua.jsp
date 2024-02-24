<%-- 
    Document   : vedamua
    Created on : May 4, 2023, 1:02:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vé đã mua</title>
        <style>
            .vedamua {
                width: 80vw;
                overflow: auto;
                margin: auto;
                font-size: 1.2vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(211, 248, 216);
                padding-bottom: 5vw;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
            }
            
            .vedamua h1 {
                text-align: center;
            }
            
            .vedamua .vedamua_1 {
                display: flex;
                padding: 2vw;
                justify-content: space-between;
            }
            
            .vedamua .vedamua_1 .dsvedat {
                overflow: auto;
                width: 50%;
                border:0.3vw solid rgb(0, 74, 0);
                background: white;
                text-align: center;
                padding: 1vw;
            }
            
            .vedamua .vedamua_1 .dsvedat table {
                width: 100%;
            }
            
            .vedamua .vedamua_1 .dsvedat table, th, td {
                border: 0.2vw solid black;
                border-collapse: collapse;
                padding: 0.3vw;
            }
            
            .vedamua .vedamua_1 .chitietve {
                width: 40%;
                border:0.3vw solid rgb(0, 74, 0);
                background: white;
                margin-left: 3vw;
                border-radius: 3vw;
                padding: 1vw;
            }
            
            .vedamua .vedamua_1 .chitietve h3 {
                text-align: center;
            }
            
            .vedamua .vedamua_1 .chitietve label {
                font-weight: bold;
                display: inline-block;
                width: 10vw;
            }
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <div class="vedamua">
            <h1>VÉ ĐÃ MUA </h1>
            <div class="vedamua_1">
                <div class="dsvedat">
                    <h3>Danh sách vé </h3>
                    <table>
                        <tr>
                            <th>STT</th>
                            <th>Ngày đặt</th> 
                            <th>Tổng tiền</th>
                            <th>Thông tin chi tiết</th>
                        </tr>
                        <c:set value="0" var="idx"/>
                        <c:forEach items="${requestScope.dsve}" var="dsve">
                            <c:set value="${idx+1}" var="idx"/>
                            <tr>
                                <td>${idx}</td>
                                <td>${dsve.ngay}</td>
                                <td>${dsve.tongTien}</td>
                                <td><a href="vedamua?STT=${idx}&ID=${dsve.ID}">Xem chi tiết</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="chitietve">
                    <c:if test="${requestScope.vedachon != null}">
                        <h3>Xem chi tiết vé ${requestScope.STT}</h3>
                        <c:set value="${requestScope.vedachon}" var="vedachon"/>
                        <label>Tên phim: </label>
                        <span>${vedachon.tenPhim}</span><br/>
                        <label>Tên rạp: </label>
                        <span>${vedachon.tenrap}</span><br/>
                        <label>Phòng: </label>
                        <span>${vedachon.tenPhong}</span><br/>
                        <label>Ngày đặt: </label>
                        <span>${vedachon.ngayDat}</span><br/>
                        <label>Ngày chiếu: </label>
                        <span>${vedachon.ngayChieu}</span><br/>
                        <label>Thời gian: </label>
                        <span>${vedachon.batdau}</span>
                        <span> - </span>
                        <span>${vedachon.ketThuc}</span><br/>
                        <br/>
                    </c:if>
                    
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
