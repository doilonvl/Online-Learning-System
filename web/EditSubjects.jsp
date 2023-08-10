<%-- 
    Document   : AddNewSubject
    Created on : Jun 19, 2023, 11:24:02 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/AddNewSubject.css" type="text/css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Learning</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp" />
        <div style="margin-left: 500px; margin-top: 100px" class="wrapper ">
            <%--<%@include file="components/navbar.jsp" %>--%>
            <div id="content">
                <%--<%@include file="components/CusHeader.jsp"%>--%>
                <h1 style="font-size:35px">Update SUBJECT</h1>
                <form action="subjects" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <input value="update" name="action" hidden=""/>
                    <input name="id" value="${course.course_id}" hidden=""/>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="subjectName" class="form-label">Subject Name</label>
                            <input type="text" class="form-control" id="subjectName" name="name" value="${course.name}" required>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Category</label>
                            <select class="form-select" id="category" name="category" required>
                                <option value="" hidden>Select a category</option>
                                <c:forEach var="list_sc" items="${list_sc}">

                                    <option value="${list_sc.getId()}" ${list_sc.getId()==course.cate_id?"selected":""}>${list_sc.getName()}</option>

                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Owner</label>
                            <select class="form-select" id="owner" name="owner" required>
                                <option value=""hidden>Select an owner</option>
                                <c:forEach var="list_expert" items="${list_expert}">

                                    <option value="${list_expert.getUser_id()}" ${list_expert.getUser_id()==course.user_id?"selected":""}>${list_expert.getFull_name()}</option>

                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="status1" value="1" ${course.status?"checked":""}>
                                <label class="form-check-label" for="status1">Active</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="status2" value="0" ${course.status?"":"checked"}>
                                <label class="form-check-label" for="status2">Inactive</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="4" maxlength="200" required="">${course.brief_infor}</textarea>
                        </div>
                            <input name="old-img" value="${course.image}" hidden=""/>
                            <label for="imageUpload">
                                <img id="imagePreview" src="${course.image}" width="150" height="150" class="img-fluid">
                                <!--<span class="btn btn-primary">Upload Image</span>-->
                            </label>
                        <input type="file" name="thumbnail" id="imageUpload" accept="image/*"  onchange="loadFile(event)"/>
                        <button >Submit</button>
                        <a href="subject"><button type="button" >Cancel</button></a>
                </form>


            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                        function validateForm() {
                            var imageUpload = document.getElementById('imageUpload');
                            if (imageUpload.files.length == 0) {
                                alert('Please select an image.');
                                return false; // Prevent form submission
                            }
                            return true; // Proceed with form submission
                        }
            </script>
            <script>
                var loadFile = function (event) {
                    var output = document.getElementById('imagePreview');
                    output.src = URL.createObjectURL(event.target.files[0]);
                    output.onload = function () {
                        URL.revokeObjectURL(output.src) // free memory
                    }
                };
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#sidebarCollapse').on('click', function () {
                        $('#sidebar').toggleClass('active');
                    });
                });
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
