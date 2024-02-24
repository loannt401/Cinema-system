<%-- 
    Document   : qlphim_them
    Created on : May 22, 2023, 5:50:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .themsua input{
                padding: 5px;
            }
            .themsua .tdphim {
                width: 80%;
                margin-left: 50px;
                font-size: 16px;
                display: flex;
                justify-content: space-between;
            }
            
            .themsua .tdphim label{
                font-size: 18px;
            }
            
            .themsua .tdphim input{
                width: 300px;
                height: 30px;
                border: 2px solid gray;
                border-radius: 7px;
                font-size: 16px;
            }
            
            .themsua .img_phim {
                border: none;
                border-radius: none;
                width: 20%;
                margin-left: 50px;
            }
            
            .themsua .img_phim input{
                width: 300px;
                height: 30px;
                font-size: 16px;
            }
            
            .themsua .ndphim textarea{
                width: 90%;
                height: 300px;
                padding: 10px;
                font-size: 18px;
            }
            
            .themsua .submit {
                text-align: center;
                margin: 50px;
            }

            .themsua .submit input {
                width: 200px;
                height: 50px;
                font-size: 20px;
                font-weight: bold;
                color: white;
                background-color: rgb(2, 159, 202);
                border: rgb(2, 159, 202);
                border-radius: 10px;
            }

            .themsua .submit input:hover {
                background-color: rgb(0, 119, 152);
            }
            
        </style>
    </head>
    <body>
        <c:set value="${requestScope.ctphim}" var="phim"/>
        <div class="themsua">
            <form action="adminthemsuaphim" method="post" enctype="multipart/form-data">
                <h3>Chi tiết phim </h3>
                <div class="tdphim">
                    
                    <div>
                        <label for="TenPhim">Tên phim:*</label><br/>
                        <input type="text" name="TenPhim" value="${phim.tenPhim}"/><br/><br/>
                        <label for="DichTenPhim">Dịch tên phim:</label><br/>
                        <input type="text" name="DichTenPhim" value="${phim.dichTenPhim}"/><br/><br/>
                        <label for="TheLoai">Thể loại:*</label><br/>
                        <input type="text" name="TheLoai" value="${phim.theLoai}"/><br/><br/>
                        <label for="Nsx">Nhà sản xuất: </label><br/>
                        <input type="text" name="Nsx" value="${phim.nsx}"/><br/><br/>
                    </div>
                    <div>
                        <label for="DaoDien">Đạo diễn: </label><br/>
                        <input type="text" name="DaoDien" value="${phim.daoDien}"/><br/><br/>
                        <label for="DienVien">Diễn viên: </label><br/>
                        <input type="text" name="DienVien" value="${phim.dienVien}"/><br/><br/>
                        <label for="QuocGia">Quốc gia: </label><br/>
                        <input type="text" name="QuocGia" value="${phim.quocGia}"/><br/><br/>
                        <label for="NgayKhoiChieu">Ngày khởi chiếu:* </label><br/>
                        <input type="date" name="NgayKhoiChieu" value="${phim.ngayKhoiChieu}"/><br/><br/>
                    </div>
                    
                    
                </div>
                
                <h3> Hình ảnh phim: </h3>
                <div class="img_phim">
                <c:if test="${phim.hinhAnh != null}">
                        <img src="${pageContext.request.contextPath}/img/img_phim/${phim.hinhAnh}" alt="${phim.tenPhim}" width="200px" height="210px">
                    </c:if>    
                    <input type="file" name="HinhAnh"><br/><br/>
                </div>
                
                <h3>Nội dung phim: </h3>
                <div class="ndphim">
                    <textarea rows="20" name="NDPhim">${phim.NDPhim}</textarea><br/>
                </div>
                
                    <c:if test="${requestScope.ctphim != null}">
                        <input type="hidden" name="ID" value="${requestScope.ctphim.ID}"/>
                    </c:if>
                
                <div class="submit">
                    <input type="submit" value="SUBMIT"/>
                </div>
            </form>
        </div>
    </body>
</html>
