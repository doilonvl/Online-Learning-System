<%-- 
    Document   : dashboard
    Created on : Jul 9, 2023, 7:54:51 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--phân trang-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
         <style>
            @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style: none;
                text-decoration: none;
            }

            body{
                background-color: #f3f5f9;
            }

            .wrapper{
                display: flex;
                position: relative;
                margin-top: 100px;
            }

            .wrapper .sidebar{
                width: 200px;
                height: 100%;
                background: white;
                padding: 30px 0px;
                position: fixed;
            }

            .wrapper .sidebar h2{
                color: black;
                text-transform: uppercase;
                text-align: center;
                margin-bottom: 30px;
            }

            .wrapper .sidebar ul li{
                padding: 15px;
                border-bottom: 1px solid #bdb8d7;
                border-bottom: 1px solid rgba(0,0,0,0.05);
                border-top: 1px solid rgba(255,255,255,0.05);
            }

            .wrapper .sidebar ul li a{
                color: black;
                display: block;
            }

            .wrapper .sidebar ul li a .fas{
                width: 25px;
            }

            .wrapper .sidebar ul li:hover{
                background-color: #594f8d;
            }

            .wrapper .sidebar ul li:hover a{
                color: #fff;
            }

            .wrapper .sidebar .social_media{
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
            }

            .wrapper .sidebar .social_media a{
                display: block;
                width: 40px;
                background: #594f8d;
                height: 40px;
                line-height: 45px;
                text-align: center;
                margin: 0 5px;
                color: #bdb8d7;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
            }
            #navbarText ul.navbar-nav{
                
            }
            #navbarText ul.navbar-nav>li{
                position: relative;                     
            }
            #navbarText ul.navbar-nav>li:nth-child(1){
                margin-bottom: -30px;               
            }
            #navbarText ul.navbar-nav>li:nth-child(2){
                margin-bottom: -37px;               
            }

            #navbarText ul.navbar-nav>li>ul{
                position: absolute;
                background-color: white;
                list-style: none;
                left: 20px;
                width: 150px;
                display: none;
                font-size: 13px;
                color: black;           
            }

            #navbarText ul.navbar-nav>li:hover>ul{
                display: block;
            }

            #navbarText ul.navbar-nav>li>ul>li{
                padding: 10px;
                border-bottom: 1px solid #fff;
               
            }
        </style>
    </head>
    <body class="fs-3">
        <jsp:include page="header.jsp" />  
        <div style="margin-top: 50px"></div>
         <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>   
    </body>
    
    <body>
        
        <div class="container"  style=" margin-left: 100px;">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <b>Registration</b>
                            <form action="searchRCourse" method="post">
                            <div style="display: flex;">
                                <input type="text" name="searchRCourse" placeholder="Course name" style="width: 85%;">
                                <button><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                        </div>                       
                    </div>
                </div>
        <table id="tableData" class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Registration Time</th>
                    <th>Course</th>
                    <th>Package</th>
                    <th>Cost</th>
                    <th>Status</th>
                    <th>Valid From</th>
                    <th>Valid To</th>
                    <th>Update By</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listR}" var="r">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.email}</td>
                    <td>${r.registration_time}</td>
                    <td>${r.course_name}</td>
                    <td>${r.pricePackage.name}</td>
                    <td>${r.pricePackage.sale}</td>
                    <td>
                        ${r.status==0?"Submitted": "Done"}
                    </td>
                    <td>${r.valid_from}</td>
                    <td>${r.valid_to}</td>
                    <td>${r.update_by}</td>
                    <td>
                        <c:if test="${r.status==0}">
                            <a href="myRegistrations?action=cancel&rid=${r.id}">Cancel</a>
                        </c:if>
                      
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
                 </div>
        </div>
    
        <div style="margin-bottom: 200px"></div>
        <jsp:include page="footer.jsp" />
        <!--phân trang-->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            var numQ = 0;
            $(document).ready(function () {
                $('#tableData').DataTable({
                    pagingType: 'full_numbers',
                    searching: false
                });
            });
        </script>
    </body>
</html>
