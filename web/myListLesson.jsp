
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
        <jsp:include page="siderLeft.jsp" />
        <div style="margin-top: 70px"></div>
        <input id="content" value="${content}" hidden=""/>
        <div style="height: 500px; margin-left: 90px; margin-bottom: 200px" class="row">
            <div class="col-md-3">
                <ul class="">
                    <c:forEach items="${listL}" var="l">
                        <li class="nav-item border shadow p-3 mb-2 bg-body-tertiary rounded">
                            <a class="nav-link" href="myListLesson?lessonId=${l.id}">
                                <h4>${l.name}</h4> <a href="${l.videoLink}" class="btn btn-primary">Link Video</a>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="lessonContent" style="width: 500px; height: 550px" class="col-md-8 shadow p-3 mb-5 bg-body-tertiary rounded overflow-auto">
                
            </div>
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
                var content = $('#content').val();
                $('#lessonContent').html(content);
            });
            
        </script>
    </body>
</html>
