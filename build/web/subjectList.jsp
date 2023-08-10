<%-- 
    Document   : subjectList
    Created on : Jun 17, 2023, 7:01:03 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject List Page - Online Learning</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="boots.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
    <link href="CSS/subjectList.css" rel="stylesheet" type="text/css"/>
</head>


<%@include file="header.jsp" %>
<jsp:include page="siderLeft.jsp"/>
<body >

    <div class="container" style="margin-bottom: 100px; font-size: 20px">
        <div class="row " >  
            <div class="col-md-3">
                <form method="get" action="subject" >
                    <input type="hidden" name="sortCate" value="${param.sortCate}">
                    <input type="hidden" name="sortStatus" value="${param.sortStatus}">
                    Search Subject: <input placeholder="Search by name..." type="text" name="search" value="${param.search}">
                    <button class="btn btn-primary "> <i class="fa fa-search"></i> Search</button>
                </form>
            </div>
            <div class="col-md-3"> 
                <form method="GET" action="subject"  >
                    Filter Category:    
                    <input type="hidden" name="search" value="${param.search}" >
                    <input type="hidden" name="sortStatus" value="${param.sortStatus}" >
                    <select name="sortCate" onchange="this.form.submit()">
                        <option value=""> all</option>
                        <c:forEach var="sc" items="${requestScope.subjectSC}">
                            <option value="${sc.id}" ${param.sortCate == sc.id ? "selected" : ""} >${sc.name}</option>
                        </c:forEach>
                    </select>     
                </form>
            </div>
            <div class="col-md-3"> 
                <form method="GET" action="subject"  >
                    Filter Status:   
                    <input type="hidden" name="search" value="${param.search}" >
                    <input type="hidden" name="sortCate" value="${param.sortCate}" >
                    <select name="sortStatus" onchange="this.form.submit()">
                        <option value="" > all</option>
                        <option value="1" ${param.sortStatus == "1" ? "selected" : ""} >Active</option>
                        <option value="0" ${param.sortStatus == "0" ? "selected" : ""} >Deactive</option>
                    </select>     
                </form>
            </div>
            <div class="col-md-3" >
                <a  href="subjects?action=create" class="btn btn-success float-right">
                    <i class="fa fa-plus"></i> New subject
                </a>
            </div>
        </div> 


        <div class="row">    
            <table id="tableData" class="table table-striped table-hover">
                <!--<table class="table custom-table table-bordered table-hover">-->
                <thead>
                    <tr>
                        <th>ID</th> 
                        <th>Name</th>
                        <th>Category </th>
                        <th>Number of lessons</th>
                        <th>Owner</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${requestScope.subjectC}" >
                        <tr>
                            <td>${s.course_id}</td>
                            <td>${s.name}</td>
                            <td>${s.cateName}</td>
                            <td>${s.lessons}</td>
                            <td>${s.user_name}</td>
                            <td>${s.status ? "Active" : "Deactive" }</td>
                            <td><a href="subjects?action=update&subjectId=${s.course_id}">Edit </a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="row " >

            <ul class="pagination justify-content-center" >

                <li  class="disabled"><a  class="page-link" href="#">First</a></li>
                <li class="disabled"><a class="page-link" href="#">Previous</a></li>
                    <c:forEach begin="1" end="${totalPage}" var="i">
                    <li class="page-item" ><a class="page-link text-dark ${i == param.index ? "aactive " : ""}" href="subject?search=${param.search}&sortCate=${param.sortCate}&sortStatus=${param.sortStatus}&index=${i}">${i}</a></li>
                    </c:forEach>
                <li class="disabled"><a class="page-link" href="#">Next</a></li>
                <li class="disabled"><a class="page-link" href="#">Last</a></li>

            </ul>
        </div>
    </div>
</body>
<jsp:include page="footer.jsp"/>

</html>


