<%-- 
    Document   : qlphim_xem
    Created on : May 22, 2023, 5:35:33 PM
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
                width: 65vw;
                margin-left: 25vw;
                margin-top: 2vw;
                margin-bottom: 5vw;
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
            
            .ctphim h2 a {
                text-decoration: none;
                color:red;
            }
            
            .ctphim h2 a:hover{
                color: #cc0033;
            }
            
        </style>
    </head>
    <body>
        <br/>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="menu.jsp" %>
        <%@include file="admin_menu.jsp" %>
        <div class="ctphim">
            <div class="tenphim">
                <h2><a href="adminquanli">Phim</a> >> ${c.tenPhim}</h2>
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
                
                
            </div>
        </div>
    </body>
</html>
