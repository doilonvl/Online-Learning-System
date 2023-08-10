<%-- 
    Document   : settingList.jsp
    Created on : Jun 20, 2023, 9:37:21 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="CSS/myRegis.css" rel="stylesheet" type="text/css"/>            
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--phân trang-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    </head>
    <body>

        <jsp:include page="header.jsp" />   
        <jsp:include page="siderLeft.jsp" />
        <div style="padding: 10px;"></div>
       <div style="border: 1px solid black; width: fit-content; text-align: center; margin: auto;
             margin-bottom: 50px; padding: 20px; margin-top: 100px; font-size: 20px; background-color: #EEEEEE">
            <div class="table-wrapper" >
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-3">
                            <h2>Setting List</h2>                                
                        </div> 
                        <br><div class="col-sm-9">
                            <form action="searchSettingList" method="post">
                                Search: <input type="text" name="value" style="color: black;" placeholder="Search by value" required="">
                                <button style="color: black; padding: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>             
                            Add new: <a href="addNewSetting"><button style="color: black; border-radius: 4px">Click to add new</button></a>
                            <!--                            <form action="sortSetting" method="post">
                                                            <select name="opU" onchange="this.form.submit()" style="color: black;">
                                                                <option value="all">All</option>
                                                                <option value="op1">ID</option>
                                                                <option value="op2">Type</option>
                                                                <option value="op3">Value</option>
                                                                <option value="op4">Order</option>
                                                                <option value="op5">Status</option>
                                                            </select>(Sort) 
                                                        </form>-->
                        </div>
                        <div>
                            <form action="filterSetting" method="post">
                                Type: <select name="type" style="color: black">
                                    <option value="-1">All Type</option>
                                    <c:forEach items="${listR}" var="r">
                                        <option value="${r.role_id}">${r.role_name}</option>
                                    </c:forEach>
                                </select>
                                Status: <select name="status" style="color: black">
                                    <option value="-1">All</option>
                                    <option value="1">Active</option>
                                    <option value="0">Deactive</option>
                                </select>
                                <button style="color: black" type="submit">Filter</button>
                            </form>
                        </div>
                    </div>
                </div>
                <c:if test="${message != null}">
                    <p>${message}</p>
                </c:if>
                <c:if test="${message == null}">    
                    <form method="post" action="settingList">
                        <table id="tableData" class="table table-striped table-hover">
                            <thead>
                                <tr>                            
                                    <th>ID</th>
                                    <!--<th>Name</th>-->
                                    <th>Type</th>
                                    <th>Value</th>
                                    <th>Order</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody><!--
                                <c:forEach var="u" items="${listS}">
                                    -->                            <tr>                               
                                        <td>${u.setting_id}</td>
                                        <!--<td>${u.setting_name}</td>-->
                                        <td>${u.role_name}</td>
                                        <td>${u.value}</td>
                                        <td>${u.order}</td>
                                        <td>${u.status ? "Active" : "Deactive"}</td>
                                        <td><a  href="updateSetting?sid=${u.setting_id}"><button type="button" class="btn btn_detail" style="font-size: 20px">Detail
                                                </button> </a>
                                        </td>
                                    </tr><!--
                                </c:forEach>                           
                                -->                    </tbody>
                        </table>  
                    </form>
                </c:if>           
            </div>
        </div> 
        <jsp:include page="footer.jsp" />
        <!--phân trang-->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#tableData').DataTable({
                    pagingType: 'full_numbers',
                    searching: false
                });
            });
        </script>
    </body>
</html>