
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/userprofile.css" rel="stylesheet" type="text/css"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <div class="modal" id="editModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit profile</h5>
                        <button type="button" class="close" onclick="hideModal('editModal')">&times;</button>
                    </div>
                    <form action="userdetail" method="post">
                        <input name="userId" value="${u.user_id}" hidden=""/>
                        <div class="modal-body">                     
                            <div class="form-outline mb-4">

                                <label for="username">Role</label>                           
                                <select name="role">                                    
                                    <c:forEach var="r" items="${listR}">
                                        <option value="${r.role_id}" ${r.role_name==u.role.role_name ? "selected":""}>${r.role_name}</option>
                                    </c:forEach>                             
                                </select>  

                            </div>
                            <div class="form-outline mb-4">
                                <label for="password">Status</label>
                                <select name="status">
                                    <option value="0" ${u.status?"":"selected"}>InActive</option>
                                    <option value="1" ${u.status?"selected":""}>Active</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4">Save change</button>  

                        </div>
                    </form> 
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="hideModal('editModal')">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        <div class="container" style="margin-top: 50px;">
            <div class="main-body">             
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="${u.image}" alt="Admin" class="rounded-circle" width="250">                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Full Name:</h6>
                                    <input type="text" class="fullname" value="${u.full_name}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Gender</h6>
                                    <input type="text" class="fullname" value="${u.gender ? "Male" : "Female"}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Email</h6>
                                    <input type="text" class="fullname" value="${u.email}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Phone number</h6>
                                    <input type="text" class="fullname" value="${u.phone_number}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Role</h6>
                                    <input type="text" class="fullname" value="${u.role.role_name}">                                  
                                </div>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Address</h6>
                                    <input type="text" class="fullname" value="${u.address}">
                                </div>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Status</h6>
                                    <input type="text" class="fullname" value="${u.status ? "Active" : "Inactive"}">
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button onclick="showModal('editModal')" style="color: black; padding: 5px; border-radius: 5px;background-color: black; color: red; font-size: 20px;" >Edit profile</button>
                                        <a href="userList" style="margin: 0px 20px; border-radius: 5px; background-color: black; color: green; padding:8px ; font-size: 20px">Back</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="footer.jsp"/>
        <script>
            function showModal(modalId) {
                document.getElementById(modalId).style.display = "block";
            }

            function hideModal(modalId) {
                document.getElementById(modalId).style.display = "none";
            }

            function showDoNotAccountOrLogin(modalIdOpen, modalIdClose) {
                hideModal(modalIdClose)
                showModal(modalIdOpen)
            }
        </script>
    </body>
</html>
