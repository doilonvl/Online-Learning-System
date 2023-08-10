

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!--phân trang-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <jsp:include page="siderLeft.jsp"/>  
        <input id="size" value="${listL.size()}" hidden=""/>
        <!-- Button to Open the Modal create lesson-->
        <button type="button" style="margin-left: 100px; margin-top: 100px" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            Add New Lesson
        </button>

        <!-- The Modal Create -->
        <div  class="modal" id="myModal">
            <div  class="modal-dialog">
                <div style="width: 700px" class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Create Lesson</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="lessons" method="post">
                            <input name="action" value="create" hidden=""/>
                            <div class="form-group">
                                <label for="email">Name:</label>
                                <input type="text" class="form-control" name="name" required="">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Type:</label>
                                <select name="type" class="form-control">
                                    <c:forEach items="${listType}" var="t">
                                        <option value="${t.id}">${t.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Topic:</label>
                                <select name="topic" class="form-control">
                                    <c:forEach items="${listTopic}" var="t">
                                        <option value="${t.id}">${t.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email">Order:</label>
                                <input type="number" class="form-control" name="order" min="1" required="">
                            </div>
                            <div id="cLink" class="form-group">
                                <label for="email">Link:</label>
                                <input type="text" class="form-control" name="link">
                            </div>
                            <div>
                                <label>Content</label>
                                <textarea id="editor"  name="content"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <!-- The Modal Edit -->
        <div  class="modal" id="editLesson">
            <div  class="modal-dialog">
                <div style="width: 700px" class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Lesson</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="lessons" method="post">
                            <input name="action" value="update" hidden=""/>
                            <input name="id" hidden="" id="id"/>
                            <div class="form-group">
                                <label for="email">Name:</label>
                                <input type="text" class="form-control" name="name" id="name" required="">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Type:</label>
                                <select name="type" class="form-control" id="type">
                                    <c:forEach items="${listType}" var="t">
                                        <option value="${t.id}">${t.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Topic:</label>
                                <select name="topic" class="form-control" id="topic">
                                    <c:forEach items="${listTopic}" var="t">
                                        <option value="${t.id}">${t.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email">Order:</label>
                                <input type="number" class="form-control" name="order" min="1" id="order" required="">
                            </div>
                            <div id="cLink" class="form-group">
                                <label for="email">Link:</label>
                                <input type="text" class="form-control" name="link" id="link">
                            </div>
                            <div>
                                <label>Content</label>
                                <textarea id="editor2"  name="content"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <div id="table-content" style="margin-bottom: 100px; margin-left: 100px;">
            <table class="border border-1 table-striped table-bordered" id="tableData">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Lesson</th>
                    <th>Order</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listL}" var="l">
                    <tr class="data">
                        <td class="childOne">${l.id}</td>
                        <td>${l.name}</td>
                        <td>${l.order}</td>
                        <td>${l.type_name}</td>
                        <td>
                            ${l.status ? "Active" : "InActive"}
                        </td>
                        <td>
                            <input value="${l.type_id}" hidden=""/>
                            <input value="${l.topic_id}" hidden=""/>
                            <input value="${l.videoLink}" hidden=""/>
                            <input value="${l.htmlContent}" hidden=""/>
                            <button
                                    type="button" class="btnEdit m-4 btn btn-primary" data-toggle="modal" data-target="#editLesson">
                                Edit
                            </button>
                            <a href="lessons?action=changeStatus&lessonId=${l.id}"> ${l.status ? "InActive" : "Active"}</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
        <jsp:include page="footer.jsp" />
        <!--phân trang-->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="//cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
        <script>
            $(document).ready(function () {
                $('#tableData').DataTable({
                    pagingType: 'full_numbers',
                    searching: false
                });
                
                $('#table-content').ready( function(){
                    var size = $('#size').val();
                    $('#table-content').css("margin-bottom", size > 5 ? "50px" : "250px");
                });
                
                $('.btnEdit').click(function (){
                    var par = $(this).parent();
                    var parent = par.parent();
                    var id = parent.children().eq(0).text();
                    var name = parent.children().eq(1).text();
                    var order = parent.children().eq(2).text();
                    var typeId = par.children().eq(0).val();
                    var topicId = par.children().eq(1).val();
                    var link = par.children().eq(2).val();
                    var content = par.children().eq(3).val();
                    
                    $('#id').val(id);
                    $('#name').val(name);
                    $('#order').val(order);
                    $('#type').val(typeId);
                    $('#topic').val(topicId);
                    $('#link').val(link);
                    CKEDITOR.instances['editor2'].setData(content);
                });
            });
            CKEDITOR.replace('editor', {

                width: "500px",
                height: "200px"

            });
            CKEDITOR.replace('editor2', {
                width: "500px",
                height: "200px"
            });
            
//            function GetDataLesson(id, name, order, type, topic, link, c){
//                alert(id);
//                document.getElementById("id").value = id;
//                document.getElementById("name").value = "name";
//                document.getElementById("order").value = order;
//                document.getElementById("type").value = type;
//                document.getElementById("topic").value = topic;
//                document.getElementById("link").value = link;
//                CKEDITOR.instances['editor2'].setData(c);
//            }
        </script>
    </body>
</html>