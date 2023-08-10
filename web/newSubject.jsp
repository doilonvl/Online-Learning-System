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
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div id="content">
                <%--<%@include file="components/CusHeader.jsp"%>--%>
                <h1 style="font-size:35px; margin-top: 50px">NEW SUBJECT</h1>


                <div class="container" >
                    <div class="form-container">
                        <form action="subjects" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <input name="action" value="create" hidden=""/>
                            <div class="row">

                                
                                <div class="">

                                    <div class="mb-3">
                                        <label for="subjectName" class="form-label">Subject Name</label>
                                        <input type="text" class="form-control" id="subjectName" name="name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="category" class="form-label">Category</label>
                                        <select class="form-select" id="category" name="category" required>
                                            <option value="" hidden>Select a category</option>
                                            <c:forEach var="list_sc" items="${list_sc}">

                                                <option value="${list_sc.getId()}">${list_sc.getName()}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Owner</label>
                                        <select class="form-select" id="owner" name="owner" required>
                                            <option value=""hidden>Select an owner</option>
                                            <c:forEach var="list_expert" items="${list_expert}">

                                                <option value="${list_expert.getUser_id()}">${list_expert.getFull_name()}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="status" id="status1" value="1" checked>
                                            <label class="form-check-label" for="status1">Active</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="status" id="status2" value="0">
                                            <label class="form-check-label" for="status2">Inactive</label>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" id="description" name="description" rows="4" maxlength="200" required=""></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Featured</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="featured" id="status1" value="on" checked>
                                            <label class="form-check-label" for="status1">On</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="featured" id="status2" value="off">
                                            <label class="form-check-label" for="status2">Off</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                    <div class="image-upload">
                                        <input type="file" name="thumbnail" id="imageUpload" accept="image/*"  onchange="loadFile(event)">
                                        <label for="imageUpload">
                                            <img id="imagePreview" src="uploads/" class="img-fluid" width="50" height="50">
                                            <span class="btn btn-primary">Upload Image</span>
                                        </label>
                                    </div>
                                </div>
                                    <div class="mb-3">
                                        <button type="submit" >Submit</button>
                                        <a href="subject" > <button type="button">Cancel</button> </a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>



            </div>
            <%--<jsp:include page="footer.jsp"/>--%>
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
