<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
    Document   : BlogList.jsp
    Created on : May 28, 2023, 12:10:28 AM
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>CourseList</title>
        <link rel="stylesheet" href="./CSS/coursesList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <%--<%@include file="header.jsp" %>--%> 
    <jsp:include page="header.jsp"/>  
    <jsp:include page="siderLeft.jsp"/>  
    <c:if test="${param['index']==null }">   
        <c:set var = "index" scope = "page" value = "1"/>
    </c:if>
    <c:if test="${param['index']!=null}">
        <c:set var = "index" scope = "page" value = "${param['index']}"/>
    </c:if>
    <body>

        <div class="container" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-3">
                    <div class="Blog-Nav">
                        <div>
                            <h2 style="text-align: center"> Search Course:</h2>
                            <form method="get" action="courses" style="margin: 10px; width: 100%;">
                                <input type="hidden" name="sortType" value="${param.sortType}">
                                <input type="hidden" name="cid" value="${param.cid}">
                                <input style=" padding: 5px; font-size: 15px; border-radius: 10px;" placeholder="Search by name..." type="text" name="search" value="${param.search}">
                                <button style=" padding: 5px 12px; font-size: 15px; border-radius: 10px;" type="submit" >Go</button>
                            </form>
                        </div>
                        <div>
                            <h2 style="text-align: center"> Categories</h2>
                            <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==""?"font-weight: bold":""}" href="courses?cid=&search=${param.search}&sortType=${param.sortType}"> All</a></ul>
                            <c:forEach var="c" items="${clist}">
                                <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==c.id?"font-weight: bold":""}" href="courses?cid=${c.id}&search=${param.search}&sortType=${param.sortType}"> ${c.name}</a></ul>
                            </c:forEach>   
                        </div>
                        <div>
                            <h2 style="text-align: center">   Featured </h2>
                            <c:forEach var="b" items="${top3}">
                                <div style="width: 100%; padding: 5px 25px;">
                                    <img style="width: 100%;height: auto;" src="${b.image}">
                                    <p style="text-align: center;">${b.user_name} </p>
                                    <P style="text-align: center; color: red;">Price: <del>
                                            <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${b.getOriginal_priceString()}" /> vnd</del></P>
                                    <P style="text-align: center; font-weight: bold;">Sale Price: 
                                        <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${b.getSale_priceString()}" /> vnd </P>

                                    <h3 style="text-align: center"><a style="text-decoration: none;" href="details?courseId=${b.course_id}">${b.title}</a></h3>
                                </div>
                            </c:forEach>   

                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div style="width: 100%; margin-bottom: 10px; margin-left: 20px;">
                        <form method="get" action="courses">
                            <input type="hidden" name="search" value="${param.search}">
                            <input type="hidden" name="cid" value="${param.cid}">
                            <label style="font-size: 15px;">Sort: </label> <select name="sortType" style=" padding: 5px; font-size: 15px; border-radius: 10px;" onchange="this.form.submit()">
                                <option value="" >ALL</option>
                                <option value="1" ${param.sortType=="1"?"selected":""}>Title A-Z</option>
                                <option value="2" ${param.sortType=="2"?"selected":""}>Title Z-A</option>
                                <option value="3" ${param.sortType=="3"?"selected":""}>New release</option>
                            </select>  
                        </form>
                    </div>

                    <section class="store">
                        <div class="container">
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 g-3">
                                <c:forEach var="p" items="${listC}">
                                    <div class="col">
                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <h3 style="text-align: center; height: 42px;">${p.title}</h3>
                                                <img style="width: 100% !important; height: 170px;"  src="${p.image}">
                                                <p style="text-align: center;">${p.user_name} </p>

                                                <P style="text-align: center; color: red;">Price: <del>
                                                        <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${p.getOriginal_priceString()}" /> vnd</del></P>
                                                <P style="text-align: center; font-weight: bold;">Sale Price: 
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${p.getSale_priceString()}" /> vnd </P>
                                                <p class="card-text" style="height: 45px; overflow: hidden;">${p.brief_infor}</p>
                                                <div class="">                           
                                                    <a  href="details?courseId=${p.course_id}">  <button type="button" class="btn btn-primary"><i class="fa fa-info-circle"></i>
                                                             Details</button> </a> 
                                                    <c:if test="${sessionScope.user.role_id==5}">
                                                        <a  href="lessons?courseId=${p.course_id}">  <button type="button" class="btn btn-primary"><i class="fa fa-info-circle"></i>
                                                             Manage Lessons</button> </a>
                                                    </c:if>  
                                                    <!--                                                          
                                                    <a  href="details?courseId=${p.course_id}"><button type="button" class="btn btn-success "><i class='fa fa-registered'></i>
                                                            Register </button> </a>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>  
                            </div>

                        </div>
                    </section>
                    <div  style="margin-left: 40%; padding: 20px;">
                        <div class="pagination-arena">
                            <ul class="pagination">
                                <li class="page-item"><a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=1&search=${param['search']}" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                <li class="page-item">
                                    <a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=${index-2}&search=${param['search']}" class="page-link ${index-2<1?"d-none":""}">${index-2}</a></li>
                                <li class="page-item">
                                    <a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=${index-1}&search=${param['search']}" class="page-link ${index-1<1?"d-none":""}">${index-1}</a></li>
                                <li class="page-item active">
                                    <a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=${index}&search=${param['search']}" class="page-link">${index}</a></li>
                                <li class="page-item">
                                    <a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=${index+1}&search=${param['search']}" class="page-link ${index+1>numberPage?"d-none":""}" >${index+1}</a></li>
                                <li class="page-item">
                                    <a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=${index+2}&search=${param['search']}" class="page-link ${index+2>numberPage?"d-none":""}">${index+2}</a></li>
                                <li><a href="./courses?sortType=${param['sortType']}&cid=${param['cid']}&index=${numberPage}&search=${param['search']}" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>  
                    </div>
                </div>
            </div>  
        </div>

        <jsp:include page="footer.jsp"/>
    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
    </script>
</html>
