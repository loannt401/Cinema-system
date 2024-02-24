<%-- 
    Document   : newjsp
    Created on : Apr 29, 2023, 6:51:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .phim {
                font-family: sans-serif;
                width: 80vw;
                margin: auto;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%);    
                overflow: auto;
            }
            .phim .loai {
                line-height: 3vw;
                font-size: 1.3vw;
            }

            .phim a {
                text-decoration: none;
                color: black;
            }

            .phim .loai a {
                width: 15vw;
                display: inline-block;
                text-align: center;
                font-weight: bold;
                color: gray;
            }

            .phim .loai a:hover {
                border-bottom: 0.25vw solid #008CBA;
                color: black;
            }

            .phim .loai a.active{
                border-bottom: 0.25vw solid #008CBA;
                color: black;
            }

            .phim .dsphim .box1 {
                width: 24vw;
                height: 30vw;
                border: 0.25vw solid rgb(0, 74, 0);
                border-radius: 2vw;
                float: left;
                margin: 1vw;
                text-align: center;
                font-size: 1.1vw;
            }

            .phim .dsphim .box1 .img {
                width: 22vw;
                height: 19vw;
                margin: auto;
                margin-top: 1vw;
                margin-bottom: 1vw;
                
            }

            .phim .dsphim .box1 .img img {
                width: 100%;
                height: 100%;
                border-radius: 1vw;
            }
            
            .phim .dsphim .box1 .tenphim {
                height: 4.2vw;
            }

            .phim .dsphim .box1 .tenphim p{
                margin: 0.5vw;
            }

            .phim .dsphim .box1 .nut {
                margin:0.5vw;
                display: flex;
                justify-content: space-between;
            }

            .phim .dsphim .box1 .nut .nut_con {
                width: 45%;
                line-height: 2.5vw;
                margin: 0.5vw;
                border-radius: 1vw;
            }

            .phim .dsphim .box1 .nut .nut_con .nut_con_1 {
                display: block;
                border-radius: 10px;
                border: 0.25vw solid rgb(0, 74, 0);
                color: rgb(0, 74, 0);
                font-weight: bold;
            }

            .phim .dsphim .box1 .nut .nut_con .nut_con_1:hover{
                background: rgb(0, 74, 0);
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="phim">
            <div class="loai">
                <a class="tx_black1 active" onclick="changedDisplay1()">PHIM ĐANG CHIẾU </a>
                <a class="tx_black2 " onclick="changedDisplay2()">PHIM SẮP CHIẾU </a>
            </div>
            <hr/>
            <script type="text/javascript">
                function changedDisplay1(){
                var a = document.getElementById("phim1");
                var b = document.getElementById("phim2");
                var c = document.querySelector('.tx_black1');
                var d = document.querySelector('.tx_black2');
                if(a.style.display === "none"){
                    a.style.display = "block";
                    a.style.borderBottom = "1px dotted green";
                } 
                if(b.style.display === "block"){
                    b.style.display = "none";
                    a.style.borderBottom = "1px dotted white";
                }
                d.classList.remove('active');
                c.classList.add('active');

            }

            function changedDisplay2(){
                var a = document.getElementById("phim1");
                var b = document.getElementById("phim2");
                var c = document.querySelector('.tx_black1');
                var d = document.querySelector('.tx_black2');
                if(a.style.display === "block"){
                    a.style.display = "none";
                } 
                if(b.style.display === "none"){
                    b.style.display = "block";
                }
                c.classList.remove('active');
                d.classList.add('active');
            }

            </script>
            <div class="dsphim">
                <div id="phim1" style="display: block">
                    <c:forEach var="phim" items="${requestScope.phimdangchieu}">
                    <a href="ctphim?ID=${phim.ID}">
                        <div class="box1">
                            <div class="img">
                                <img src="${pageContext.request.contextPath}/img/img_phim/${phim.hinhAnh}" alt="${phim.tenPhim}"/>
                            </div>
                            <div class="tenphim">
                                <p><b>${phim.tenPhim}</b></p>
                                <c:if test="${phim.dichTenPhim != null}">
                                    <p style="color: gray">${phim.dichTenPhim}</p>
                                </c:if>
                            </div>
                            <div class="nut">
                                <div class="nut_con"><a href="ctphim?ID=${phim.ID}" class="nut_con_1">CHI TIẾT PHIM</a></div>
                                <div class="nut_con"><a href="ctphimdatve?ID=${phim.ID}" class="nut_con_1">ĐẶT VÉ</a></div>
                            </div>
                        </div>     
                    </a>
                    </c:forEach>
                </div>

                <div id="phim2" style="display: none">
                    <c:forEach var="phims" items="${requestScope.phimsapchieu}">
                    <a href="ctphim?ID=${phims.ID}">
                        <div class="box1">
                            <div class="img">
                                <img src="${pageContext.request.contextPath}/img/img_phim/${phims.hinhAnh}" alt="${phims.tenPhim}"/>
                            </div>
                            <div class="tenphim">
                                <p><b>${phims.tenPhim}</b></p>
                                <c:if test="${phims.dichTenPhim != null}">
                                    <p style="color: gray">${phims.dichTenPhim}</p>
                                </c:if>
                            </div>
                            <div class="nut">
                                <div class="nut_con"><a href="ctphim?ID=${phims.ID}" class="nut_con_1">CHI TIẾT PHIM</a></div>
                                <div class="nut_con"><a href="#" class="nut_con_1">ĐẶT VÉ</a></div>
                            </div>
                        </div>     
                    </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
