<%-- 
    Document   : sliderList
    Created on : Jun 21, 2023, 9:50:09 PM
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
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        <div style="margin-top: 100px;"></div>
        <div style="margin-left: 120px;">
            <div style="font-size: 20px;" >
                <form method="get" action="slider" >
                    <label>Filter</label>
                    <label>Status: </label>
                    <select name="status_filter">
                        <option value="true">Active</option>
                        <option value="false">DeActive</option>
                    </select>
                    <button>Filter</button>
                </form>
            </div>

            <div style="font-size: 20px;">
                <form method="get" action="slider">
                    <label>Search: </label>
                    <input type="text" name="title_search">
                    <button>Search</button>
                </form>
            </div>
            <c:if test="${sliders.size() eq 0}">NOT FOUND ANY SLIDES</c:if>
            <c:if test="${sliders.size() ne 0}"> 
                <table id="tableData" style="font-size: 20px;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Image</th>
                            <th>Back Link</th>
                            <th>Status</th>
                            <th>Display(Hide/Show)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.sliders}" var="s" varStatus="loop">
                            <tr>
                                <td>${s.id}</td>
                                <td>${s.title}</td>
                                <td><img src="${s.image}" alt="alt" width="175px"/></td>
                                <td><a href="${s.backlink}">Enter slide</a></td>
                                <td><c:if test="${s.status}">Active</c:if>
                                    <c:if test="${!s.status}">Deactive</c:if></td>
                                    <td>
                                        <form method="get" action="updateStatusSlider">
                                        <c:if test="${s.status}"><button>Hide</button></c:if>
                                        <c:if test="${!s.status}"><button>Show</button></c:if> 
                                        <input type="hidden" name="sliderId" value="${s.id}">
                                        <input type="hidden" name="status" value="${s.status}">
                                    </form>
                                </td>
                                <td><button><a href="<%=request.getContextPath()%>/slider/update?id=${s.id}">Update</a></button>
                                    <button onclick="ShowMessage('${s.id}')">Delete</button>
                                    <a href="<%=request.getContextPath()%>/sliderDetail?id=${s.id}"><button>Detail</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table></c:if>
            </div>
            <div style=" margin-top: 55px;"></div>
        <jsp:include page="footer.jsp"/>
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


                                        function ShowMessage(id) {
                                            if (confirm('Do you want to delete?') === true) {
                                                window.location.href = "deleteSlider?id=" + id;
                                            }
                                        }
        </script>
    </body>
</html>