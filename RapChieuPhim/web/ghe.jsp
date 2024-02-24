<%-- 
    Document   : ghe
    Created on : Apr 30, 2023, 10:03:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <style>
            .ghe {
                width: 80vw;
                overflow: auto;
                margin: auto;
                font-size: 1.5vw;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);
            }
            
            .ghe .tieude {
                width: 80%;
                margin: auto;
            }
            
            .ghe .tieude .tieude_1 {
                float: left;
            }
            
            .ghe .tieude .tieude_2 {
                float: right;
            }
            
            .ghe .ghedachon {
                width: 80%;
                min-height: 10vw;
                margin: auto;
                margin-bottom: 2vw;
                display: flex;
                
            }
            
            .ghe .ghedachon h4 {
                margin: 0;
            }
            
            .ghe .ghedachon .thongtinve {
                width: 45%;
                height: 10vw;
                border: 0.25vw solid rgb(0, 74, 0);
                border-radius: 2vw;
                padding: 1vw;
                margin: 0.5vw;
                overflow: auto;
            }
            
            .ghe .ghedachon .thongtinve label {
                font-weight: bold;
            }
            
            .ghe .ghedachon .dsghechon {
                
            }
            
            .ghe .ghedachon .sp{
                border: 0.1vw solid black;
                display: inline-block;
                width: 3vw;
                margin-top: 1vw;
                margin-right: 0.5vw;
                text-align: center;
            }
            
            .ghe .thongtinghe {
                width: 80%;
                height: 3vw;
                margin: auto;
                display: flex;
                justify-content: center;
            }
            
            .ghe .thongtinghe .maughe {
                margin-left: 1vw;
                margin-right: 1vw;
            }
            
            .ghe .thongtinghe .maughe .mau {
                width: 2vw;
                height: 2vw;
                border: 0.3vw solid black;
            }
            
            .ghe .thongtinghe .maughe .xam {
                background: gray;
                color: gray;
            }
            
            .ghe .thongtinghe .maughe .do {
                background: red;
                color: red;
            }
            
            .ghe .thongtinghe .maughe .xanh {
                background: aquamarine;
                color: aquamarine;
            }
            
            .ghe .thongtinghe .maughe .vang {
                background: khaki;
                color: khaki;
            }
            
            .ghe .chonghe {
                width: 80%;
                min-height: 20vw;
                border: 0.1vw solid black;
                text-align: center;
                margin: auto;
                overflow: auto;
                padding: 2vw;
            }
           
     
            .ghe .chonghe .ghe_id {
                display: inline-block;
                width: 5vw;
                margin: 0.3vw;
            }
            
            .ghe .chonghe .ghe_id a {
                text-decoration: none;
                color: black;
                font-weight: bold;
                display: block;
                border: 0.3vw solid black;
            }
            
            .clr {
                clear: both;
            }
            
            <c:forEach begin="1" end="30" var="i">
                .ghe .chonghe .ghe_id .id${i} {
                    color: black;
                    background: aquamarine;
                }
            </c:forEach>
                
            <c:forEach begin="31" end="${requestScope.phong.soLuongGhe}" var="i">
                .ghe .chonghe .ghe_id .id${i} {
                    color: black;
                    background: khaki;
                }
            </c:forEach>
            
            <c:forEach items="${requestScope.listghe}" var="listghe">
                .ghe .chonghe .ghe_id .id${listghe.ID} {
                    color: white;
                    background: gray;
                }
            </c:forEach>
                
            <c:forEach items="${sessionScope.dsghe}" var="ds">
                .ghe .chonghe .ghe_id .id${ds.ID} {
                    color: white;
                    background: red;
                }
            </c:forEach>
            
             
            .nut {
                display: flex;
                justify-content: space-between;
                margin:auto;
            }
                
            .nut .tiep {
                width: 11vw;
                margin: 3vw;
            }

            .nut .tiep a{
                display: block;
                text-decoration: none;
                font-size: 20px;
                font-weight: bold;
                border: 0.25vw solid lightgreen;
                height: 2vw;
                padding: 0.5vw;
                line-height: 2vw;
                font-size: 1.4vw;
                color: lightgreen;
            }

            .nut .tiep a:hover {
                color: white;
                background: lightgreen;
            }
             
            .datve .datve_2 {
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
        <div class="ghe">
            <div class="tieude">
                <div class="tieude_1"><h3>CHỌN GHẾ</h3></div>
                <c:if test="${sessionScope.dsghe != null}">
                    <c:set value="${requestScope.tongtien}" var="tongtien"/>
                    <div class="tieude_2"><h3>Tổng tiền: ${tongtien} đ </h3></div>
                </c:if>
            </div>
            
            <div class="clr"></div>
            
            <div class="ghedachon">
                <div class="thongtinve">
                    <h4>Thông tin vé:</h4>
                    <c:set value="${requestScope.phim}" var="phim"/>
                    <c:set value="${requestScope.lich}" var="lich"/>
                    <c:set value="${requestScope.phong.tenPhong}" var="phong"/>
                    <p>
                        <label>Tên phim:</label>
                        <span>${phim.tenPhim}</span>
                        <br/>
                        <label>Lịch chiếu:</label>
                        <span>${lich.batDau} - ${lich.ketThuc}</span>
                        <br/>
                        <label>Tên phòng:</label>
                        <span>${phong}</span>
                    </p>
                </div>
                <div class="thongtinve dsghechon">
                    <h4>Ghế đã chọn:</h4>
                    <c:forEach items="${sessionScope.dsghe}" var="dsghe">
                        <span class="sp">${dsghe.hangGhe}${dsghe.STT}</span>
                    </c:forEach>
                </div>
            </div>
                    
                    
            <div class="thongtinghe">
                <div class="maughe"><span class="mau xam">dfg</span><span>   Ghế đã chọn</span></div>
                <div class="maughe"><span class="mau do">dfg</span><span>   Ghế đang chọn</span></div>
                <div class="maughe"><span class="mau xanh">dfg</span><span>   Ghế thường</span></div>
                <div class="maughe"><span class="mau vang">dfg</span><span>   Ghế vip</span></div>
            </div>
            
            <div class="chonghe">
                <h3 style="color: red">${requestScope.error}</h3>
                <form name="myFrom3" action="" method="post">
                    <input type="hidden" value="${requestScope.lich.ID}" name="LichChieuId"/>
                    <c:set value="${requestScope.phong.soLuongGhe}" var="c"/>
                    <c:set value="${requestScope.hang}" var="h"/>
                    <c:set value="0" var="idx"/>
                    <c:set value="0" var="hidx"/>
                    <c:forEach var="i" begin="1" end="${c}">
                        <c:if test="${idx == 10}">
                            <c:set var="idx" value="0"/>
                            <c:set value="${hidx+1}" var="hidx"/>
                            <br/>
                        </c:if>
                        <div class="ghe_id">
                            <a href="#" type="submit" class="id${i}" onclick="check(${i})">${h[hidx]}${idx}</a>
                        </div>
                    <c:set var="idx" value="${idx+1}"/>
                    </c:forEach>
                </form>
                
            </div>
                    
            <div class="clr"></div>
            <div class="nut">
                <div class="tiep">
                    <a href="lichchieu"><i class="fa-solid fa-arrow-left"></i> QUAY LẠI</a>
                </div>
                <div class="tiep">
                    <a href="xacnhanve?LichChieuId=${requestScope.lich.ID}&tongtien=${requestScope.tongtien}">TIẾP THEO <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="clr"></div>

                
        </div>
        <%@include file="footer.jsp" %>
        
        <script type="text/javascript">
            function check(idx){
                document.myFrom3.action = "ghe?GheId="+idx;
                document.myFrom3.submit();
            }


        </script>
    </body>
</html>
