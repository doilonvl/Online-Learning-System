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
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">-->

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp" />
        <div class="wrapper">
            <%--<%@include file="components/navbar.jsp" %>--%>
            <div id="content">
                <%--<%@include file="components/CusHeader.jsp"%>--%>
                <h1 style="font-size:35px">NEW SUBJECT</h1>

                <div class="container">
                    <div class="form-container">
                        <div class="row">
                            <form action="subjects" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <input name="action" value="create" hidden=""/>

                                <!--<div class="col-md-12">-->
                                    <!--<div class="mb-3">-->
                                        <label for="subjectName" class="form-label">Subject Name</label>
                                        <input type="text" class="form-control" id="subjectName" name="name" required>
                                    <!--</div>-->
                                    <!--<div class="mb-3">-->
                                        <label for="category" class="form-label">Category</label>
                                        <select class="form-select" id="category" name="category" required>
                                            <option value="" hidden>Select a category</option>
                                            <c:forEach var="list_sc" items="${list_sc}">

                                                <option value="${list_sc.getId()}">${list_sc.getName()}</option>

                                            </c:forEach>
                                        </select>
                                    <!--</div>-->
                                    <!--<div class="mb-3">-->
                                        <label class="form-label">Owner</label>
                                        <select class="form-select" id="owner" name="owner" required>
                                            <option value=""hidden>Select an owner</option>
                                            <c:forEach var="list_expert" items="${list_expert}">

                                                <option value="${list_expert.getUser_id()}">${list_expert.getFull_name()}</option>

                                            </c:forEach>
                                        </select>
                                    <!--</div>-->
                                    <!--<div class="mb-3">-->
                                        <label class="form-label">Status</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="status" id="status1" value="1" checked>
                                            <label class="form-check-label" for="status1">Active</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="status" id="status2" value="0">
                                            <label class="form-check-label" for="status2">Inactive</label>
                                        </div>
                                    <!--</div>-->
                                    <!--<div class="mb-3">-->
                                        <label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" id="description" name="description" rows="4" maxlength="200" required=""></textarea>
                                    <!--</div>-->
                                    <!--                                    <div class="form-check mb-3">
                                                                            <input class="form-check-input" type="checkbox" id="featured" name="featured">
                                                                            <label class="form-check-label" for="featured">Featured</label>
                                                                        </div>-->
                                    
                                    <div class="image-upload">
                                        <input type="file" name="thumbnail" id="imageUpload" accept="image/*"  onchange="loadFile(event)">
                                        <label for="imageUpload">
                                            <img id="imagePreview" src="uploads/" cslass="img-fluid">
                                            <!--<span class="btn btn-primary">Upload Image</span>-->
                                        </label>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" value="Submit"/>
                                        <button><a href="./subject"> Cancel</a> </button> 
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div> 
                </div>



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
            <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>-->
    </body>
</html>
