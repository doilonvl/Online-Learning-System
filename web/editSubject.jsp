<%-- 
    Document   : subjectDetails
    Created on : Jul 5, 2023, 1:14:50 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!--phân trang-->
        <!--<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>-->
    </head>

    <body class="fs-3">
        <%@include file="header.jsp" %>
<jsp:include page="siderLeft.jsp" />
        <div style="height: 500px; margin: 50px 0px;">
            <ul style="width: 550px" class="row" role="tablist">
                <span class="col-md-4 nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Overview</button>
                </span>
                <span class="col-md-4 nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Dimension</button>
                </span>
                <span class="col-md-3 nav-item" role="presentation">
                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"> Package</button>
                </span>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h2>Overview</h2>
                    <h3>Name: ${course.name}</h3>
                    <p>${course.title}</p>
                    <img style="width: 170px !important; height: 170px;" src="${course.image}">
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <h2>Dimension</h2>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add New
                    </button>

                    <!--Create Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add Dimension</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="subjects" method="post">
                                    <input name="action" value="createDimension" hidden=""/>
                                    <div class="modal-body">
                                        <div>
                                            <label>Name:</label>
                                            <input type="text" name="name" required=""/>
                                        </div>
                                        <div>
                                            <label>Type:</label>
                                            <select name="type">
                                                <c:forEach items="${listT}" var="t">
                                                    <option value="${t.id}">${t.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label>Description</label>
                                            <textarea name="description"></textarea>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>    
                            </div>
                        </div>
                    </div>
                    
                    
                    <!--Edit Dimension Modal -->
                    <div class="modal fade" id="editDimension" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Dimension</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="subjects" method="post">
                                    <input name="action" value="updateDimension" hidden=""/>
                                    <input name="id" hidden="" id="dimensionId"/>
                                    <div class="modal-body">
                                        <div>
                                            <label>Name:</label>
                                            <input type="text" name="name" id="dimension_name" required=""/>
                                        </div>
                                        <div>
                                            <label>Type:</label>
                                            <select name="type" id="dimension_type">
                                                <c:forEach items="${listT}" var="t">
                                                    <option value="${t.id}">${t.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label>Description</label>
                                            <textarea id="dimension_description" name="description"></textarea>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>    
                            </div>
                        </div>
                    </div>
                    
                    <table class="table table-light table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Dimension</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listD}" var="d">
                                <tr>
                                    <td>${d.id}</td>
                                    <td>${d.type.name}</td>
                                    <td>${d.name}</td>
                                    <td>
                                        <button onclick="GetData('${d.id}', '${d.name}', '${d.type.id}', '${d.description}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editDimension">
                                            Edit
                                        </button>
                                        <a href="">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    <h2>Price Package</h2>
                    <p></p>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pricepackage">
                        Add New
                    </button>
                    <!--Create Modal -->
                    <div class="modal fade" id="pricepackage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add Price Package</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="subjects" method="post">
                                    <input name="action" value="createPricePackage" hidden=""/>
                                    <div class="modal-body">
                                        <div>
                                            <label>Name:</label>
                                            <input type="text" name="name" required=""/>
                                        </div>
                                        <div>
                                            <label>Duration:</label>
                                            <input type="number" name="duration" required=""/>
                                        </div>
                                        <div>
                                            <label>Price:</label>
                                            <input type="number" name="price" required=""/>
                                        </div>
                                        <div>
                                            <label>Sale:</label>
                                            <input type="number" name="sale" required=""/>
                                        </div>
                                        <div>
                                            <label>Status:</label>
                                            <select name="status">
                                                <option value="1">Active</option>
                                                <option value="0">InActive</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>    
                            </div>
                        </div>
                    </div>
                    
                    
                    <!--Edit Dimension Modal -->
                    <div class="modal fade" id="editPricePackage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Price Package</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="subjects" method="post">
                                    <input name="action" value="updatePricePackage" hidden=""/>
                                    <input name="id" hidden="" id="pricePackageId"/>
                                    <div class="modal-body">
                                        <div>
                                            <label>Name:</label>
                                            <input type="text" id="pName" name="name" required=""/>
                                        </div>
                                        <div>
                                            <label>Duration:</label>
                                            <input type="number" name="duration" id="duration" required=""/>
                                        </div>
                                        <div>
                                            <label>Price:</label>
                                            <input type="number" name="price" id="price" required=""/>
                                        </div>
                                        <div>
                                            <label>Sale:</label>
                                            <input type="number" name="sale" id="sale" required=""/>
                                        </div>
                                        <div>
                                            <label>Status:</label>
                                            <select name="status" id="statusP">
                                                <option value="1">Active</option>
                                                <option value="0">InActive</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>    
                            </div>
                        </div>
                    </div>
                    
                    
                    <table class="table table-light table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Price</th>
                                <th>Sale</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="p">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.name}</td>
                                    <td>${p.duration}</td>
                                    <td>${p.price}</td>
                                    <td>${p.sale}</td>
                                    <td>${p.status}</td>
                                    <td>
                                        <button onclick="GetPricePackage('${p.id}','${p.name}','${p.duration}','${p.price}','${p.sale}','${p.status}')" 
                                                type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editPricePackage">
                                            Edit
                                        </button>
                                        <a href="subjects?action=changeStatus&pid=${p.id}">${p.status ? "DeActive" : "Active"}</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"/>
        <script>
            function GetData(id, name, type, description){
                document.getElementById("dimensionId").value = id;
                document.getElementById("dimension_name").value = name;
                document.getElementById("dimension_type").value = type;
                document.getElementById("dimension_description").value = description;
            }
            
            function GetPricePackage(id, name, duration, price, sale, status){
                document.getElementById("pricePackageId").value = id;
                document.getElementById("pName").value = name;
                document.getElementById("duration").value = duration;
                document.getElementById("price").value = price;
                document.getElementById("sale").value = sale;
                document.getElementById("statusP").value = status=='true'?'1':'0';
            }
        </script>
    </body>
</html>
