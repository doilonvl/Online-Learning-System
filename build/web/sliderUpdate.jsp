<%-- 
    Document   : sliderUpdate
    Created on : Jun 23, 2023, 3:00:53 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
        
<link href="../CSS/styles.css" rel="stylesheet" type="text/css"/>
<link href="../CSS/sidebar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        <div style="margin-left: 100px; margin-top: 100px; width: 500px; height: 600px">
        <form method="post" action="update" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${slider.id}">
            <div>
                <label>Title</label>
                <input type="text" name="title" value="${slider.title}">
            </div>
            <div>
                <label>Back link</label>
                <input type="text" name="backlink" value="${slider.backlink}">
            </div>
            <div>
                <label>Status</label>
                <select name="status">
                    <option value="1" ${slider.status?"selected":""}>Active</option>
                    <option value="0" ${!slider.status?"selected":""}>Deactive</option>
                </select>
            </div>
            <div>
                <label>Image</label>
                <input name="old_img" value="${slider.image}" id="old-image" hidden=""/>
                <img src="../${slider.image}" width="100" height="100" id="img-preview"/>
                <input accept="image/*" type="file" name="file" id="file-input"/>
            </div>   
            <button>Update</button>
        </form>
    </div>
        <jsp:include page="footer.jsp"/>
        <script>
            const input = document.getElementById('file-input');
            const image = document.getElementById('img-preview');

            input.addEventListener('change', (e) => {
                if (e.target.files.length) {
                    const src = URL.createObjectURL(e.target.files[0]);
                    image.src = src;
                } else {
                    image.src = document.getElementById('old-image').value;
                }
            });
        </script>
    </body>
</html>
