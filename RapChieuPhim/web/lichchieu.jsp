<%-- 
    Document   : lichchieu
    Created on : Apr 13, 2023, 11:22:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt vé</title>
        <style>
            
            .lichchieu {
                width: 80vw;
                margin: auto;
                margin-bottom: 2vw;
                margin-top: 2vw;
                overflow: auto;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
                font-size: 1.5vw;
            }
            
            .lichchieu .box {
                float: left;
                width: 40%;
                overflow: auto;
                border: 0.25vw solid rgb(2, 46, 13);
                text-align: center;
                background-color: rgb(231, 248, 233);
                border-radius: 2vw;
                margin: 1vw;
            }
            
            .lichchieu .box h3 {
                margin-bottom: 0.5vw;
                margin-top: 1vw;
            }
            
            .lichchieu .chon {
                width: 90%;
                height: 3vw;
                font-size: 1.7vw;
                border: 0.25vw solid rgb(2, 46, 13);
            }
            
            .lichchieu .submit {
                border: 0.25vw solid rgb(2, 46, 13);
                border-radius: 0.5vw;
                width: 12vw;
                height: 3vw;
                text-align: center;
                font-size: 1.5vw;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: auto;
                margin-top: 1.5vw;
                margin-bottom: 2vw;
            }

            .lichchieu .submit a {
                text-decoration: none;
                display: block;
                line-height: 3vw;
                color:  rgb(0, 74, 0);
                font-weight: bold;
            }

            .lichchieu .submit a:hover {
                background-color: rgb(0, 74, 0);
                color: white;
            }
            
            .lichchieu .box2 {
                width: 50%;
                min-height: 40vw;
                overflow: auto;
                float: right;
                padding: 1vw;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
                margin: 1vw;
                margin-bottom: 5vw;
            }
            
            .lichchieu .box2 h2 {
                text-align: center;
            }
            
            .lichchieu .box2 h4 {
                color: red;
            }
            
            .lichchieu .box2 .ngay {
                border-bottom: 0.25vw solid rgb(2, 46, 13);
                width: 10vw;
                text-align: center;
                padding: 0.3vw;
            }
            
            .lichchieu .box2 a {
                text-decoration: none;
                color: black;
            }
            
            .lichchieu .box2 .lich {
                border: 0.25vw solid rgb(2, 46, 13);
                border-radius: 0.5vw;
                width: 15vw;
                text-align: center;
                padding: 0.3vw;
                margin: 0.5vw;
                float: left;
            }
            
            .clr {
                clear: both;
            }
            
            .datve .datve_1 {
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
        <div class="lichchieu">
            <form name="MyForm" action="lichchieu" method="post" class="box">
                <h2> CHỌN PHIM VÀ RẠP CHIẾU </h2>
                <label><h3>CHỌN PHIM </h3></label>
                <br/>
                <select name="phim" class="chon">
                    <option value="0" disabled selected>Chọn phim </option>
                    <c:forEach var="phim" items="${requestScope.phim}">
                        <option value="${phim.ID}">${phim.tenPhim}</option>
                    </c:forEach>
                </select>
                <br/>
                <label><h3>CHỌN RẠP</h3> </label>
                <br/>
                <select name="rap" class="chon">
                    <option value="0" disabled selected>Chọn rạp </option>
                    <c:forEach var="rap" items="${requestScope.rap}">
                        <option value="${rap.ID}">${rap.tenRap}</option>
                    </c:forEach>
                </select>
                <br/>
                <div class="submit">
                    <a href="#" type="submit" onclick="chon()">LỊCH CHIẾU </a>
                </div> 
            </form>
            
            
            
            
            <div class="box2">
                <h2>LỊCH CHIẾU</h2>
                <hr>
                <c:set value="${requestScope.p}" var="p"/>
                <c:set value="${requestScope.r}" var="r"/>
                <c:if test="${p != null}">
                    <h4>Tên phim: ${p}</h4>
                    <h4>Tên rạp: ${r}</h4>
                    <hr/>
                    <c:forEach items="${requestScope.ngay}" var="ngay">
                        <p class="ngay">${ngay.ngayChieu}<p>
                        <c:forEach items="${requestScope.lich}" var="lich">
                            <c:if test="${lich.ngayId == ngay.ID}">
                                <a href="ghe?LichChieuId=${lich.ID}">
                                    <p class="lich">
                                        <span>${lich.batDau}</span>
                                        <span> - </span>
                                        <span>${lich.ketThuc}</span>
                                    </p>
                                </a>
                            </c:if>
                            
                        </c:forEach>
                    </c:forEach>
                    
                </c:if>
            </div>
            
        </div>
                
        <%@include file="footer.jsp" %>
        
        <script type="text/javascript">
            function chon(){
                document.MyForm.submit();
            }
        </script>
    </body>
</html>
