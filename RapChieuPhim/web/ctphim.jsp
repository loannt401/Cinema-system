<%-- 
    Document   : ctphim
    Created on : Apr 30, 2023, 11:03:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set value="${requestScope.ctphim}" var="c"/>
        <title>${c.tenPhim}</title>
        <style>
            .ctphim {
                width: 80vw;
                margin: auto;
                overflow: auto;
                background: rgb(231, 248, 233);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%); 
            }

            .ctphim .tenphim {
                margin-left: 5%;
                font-size: 1.5vw;
            }

            .ctphim .ndphim{
            }

            .ctphim .ndphim .hinhanh {
                position: relative;
                width: 30%;
                padding-bottom: 40%;
                margin-top: 5%;
                left: 5%;
                margin-bottom: 5%;
                border: 1px solid black;
                float: left;
            }

            .ctphim .ndphim .hinhanh img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }  

            .ctphim .ndphim .mota {
                box-shadow: 0 1px 2px 0 rgb(60 64 67 / 10%), 0 2px 6px 2px rgb(60 64 67 / 15%); 
                width: 55%;
                padding-bottom: 50%;
                float: right;
                position: relative;
                right: 5%;
                margin-top: 5%;
                margin-bottom: 5%;
            }

            .ctphim .ndphim .mota .mota_con {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                padding: 2%;
                font-size: 1.5vw;
                background:#ffffff;
            }
            
            .ctphim .ndphim .mota .mota_con h3 {
                text-align: center;
            }
            
            .ctphim .ndphim .mota .mota_con label {
                font-weight: bold;
            }

            .clr {
                clear: both;
            }

            .ctphim .ndphim .ctndphim {
                width: 90%;
                margin: auto;
                margin-bottom: 5%;
                overflow: auto;
                font-size: 1.5vw;
            }
            
            .ctphim .ndphim .ctndphim h4 {
                color: #006080;
            }
            
            .clr {
                clear: both;
            }
            
            .ctphim .ndphim .rap .nut{
                width: 20%;
                line-height: 4vw;
                text-align: center;
                font-weight: bold;
                margin: 2vw;
                float: left;
                
                
            }
            
            .ctphim .ndphim .rap .nut a {
                display: block;
                line-height: 4vw;
                border: 0.25vw solid rgb(0, 74, 0);
                color: rgb(0, 74, 0);
                border-radius: 2vw;
            }
            
            .ctphim .ndphim .rap .nut a:hover {
                background: rgb(0, 74, 0);
                color: white;
            }
            
            .ctphim .ndphim .ctndphim .lich {
                width: 80%;
                min-height: 10vw;
                background: white;
                margin: auto;
                display: block;
                overflow: auto;
                padding: 1vw;
            }
            
            .ctphim .ndphim .rap .lich .ngay {
                border-bottom: 0.25vw solid rgb(2, 46, 13);
                width: 10vw;
                text-align: center;
                padding: 0.3vw;
            }
            
            .ctphim .ndphim .rap .lich a {
                text-decoration: none;
                color: black;
                display: block;
            }
            
            .ctphim .ndphim .rap .lich .lichc {
                border: 0.25vw solid rgb(2, 46, 13);
                border-radius: 0.5vw;
                width: 15vw;
                text-align: center;
                padding: 0.3vw;
                margin: 0.5vw;
                float: left;
            }
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <div class="ctphim">
            <div class="tenphim">
                <h2>${c.tenPhim}</h2>
            </div>
            <hr/>
            
            <div class="ndphim">
                <div class="hinhanh"><img src="${pageContext.request.contextPath}/img/img_phim/${c.hinhAnh}" alt="${c.tenPhim}"></div>
                <div class="mota">
                    <div class="mota_con">
                        <h3> ${c.tenPhim}</h3>
                        <c:if test="${c.dichTenPhim != null}">
                            <p>
                                <label>Tên phim: </label>
                                <span> ${c.dichTenPhim} </span>
                            </p>
                        </c:if>
                            <p>
                                <label>Thể loại: </label>
                                <span> ${c.theLoai} </span>
                            </p>
                        <c:if test="${c.nsx != null}">
                            <p>
                                <label>Nhà sản xuất: </label>
                                <span> ${c.nsx} </span>
                            </p>
                        </c:if>
                            
                        <c:if test="${c.daoDien != null}">
                            <p>
                                <label>Đạo diễn: </label>
                                <span> ${c.daoDien} </span>
                            </p>
                        </c:if>
                        
                        <c:if test="${c.dienVien != null}">
                            <p>
                                <label>Diễn viên: </label>
                                <span> ${c.dienVien} </span>
                            </p>
                        </c:if>
                            
                        <c:if test="${c.dienVien != null}">
                            <p>
                                <label>Quốc gia: </label>
                                <span> ${c.quocGia} </span>
                            </p>
                        </c:if>
                            
                        <c:if test="${c.ngayKhoiChieu != null}">
                            <p>
                                <label>Ngày khởi chiếu: </label>
                                <span> ${c.ngayKhoiChieu} </span>
                            </p>
                        </c:if>
                    </div>
                </div>
                <div class="clr"></div>
                <div class="ctndphim">
                    <h3>Nội dung phim:</h3>
                    <hr/>
                    <p>${c.NDPhim}</p>
                </div>
                
                
                <div class="ctndphim rap">
                    <h3>Lịch chiếu: </h3>
                    <hr/>
                    <form name="myForm2" action="" method="post">
                        <input type="hidden" name="phimId" value="${c.ID}"/>
                        <c:forEach items="${requestScope.rap}" var="rap">
                            <div class="nut">
                                <a type="submit" onclick="checkRap(${rap.ID})">${rap.tenRap}</a>
                            </div>
                        </c:forEach>
                    </form>
                        
                    <script type="text/javascript">
                        function checkRap(RapId){
                            document.myForm2.action = "ctphim?rapId="+RapId;
                            document.myForm2.submit();

                        }
                    </script>
                        
                    <div class="clr"></div>
                        
                    <div class="lich">
                        <c:set value="${requestScope.rc}" var="rc"/>
                        <h3>${rc}</h3>
                        <c:forEach items="${requestScope.ngay}" var="ngay">
                            <p class="ngay">${ngay.ngayChieu}<p>
                            <c:forEach items="${requestScope.lich}" var="lich">
                                <c:if test="${lich.ngayId == ngay.ID}">
                                    <a href="ghe?LichChieuId=${lich.ID}">
                                        <p class="lichc">
                                            <span>${lich.batDau}</span>
                                            <span> - </span>
                                            <span>${lich.ketThuc}</span>
                                        </p>
                                    </a>
                                </c:if>

                            </c:forEach>
                        </c:forEach> 
                    </div>
                    
                </div>
                
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
