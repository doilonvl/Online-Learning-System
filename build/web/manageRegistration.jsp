<%-- 
    Document   : manageRegistration
    Created on : Jul 25, 2023, 10:47:39 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--phân trang-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    </head>
    
    <jsp:include page="header.jsp"/>
    <jsp:include page="siderLeft.jsp"/>  
    <body>
        <div id="data" style="margin-top: 100px; margin-left: 100px; margin-bottom: 150px">
            <input id="mess10" value="${message}" hidden=""/>
            <table id="tableData">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Course</th>
                        <th>Price Package</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listR}" var="r">
                        <tr>
                            <td>${r.registration_id}</td>
                            <td>${r.user_id.full_name}</td>
                            <td>${r.course_id.name}</td>
                            <td>${r.price_package_id.price}/${r.price_package_id.duration}</td>
                            <td>${r.created}</td>
                            <td>${r.regis_status}</td>
                            <td>
                                <a href="manageRegistration?action=accept&rid=${r.registration_id}">Accept</a>
                                <a href="manageRegistration?action=cancel&rid=${r.registration_id}">Cancel</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                var m = $("#mess10").val();
                if(m != "")
                    Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: m,
                    showConfirmButton: false,
                    timer: 1500
                });
            });
            
            
        </script>
    </body>
</html>
