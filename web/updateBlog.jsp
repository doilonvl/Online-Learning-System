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
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        <div style="border: 1px solid black; width: fit-content; text-align: center; margin: auto;
             margin-bottom: 50px; padding: 20px; margin-top: 100px; font-size: 20px; ">
            <h1 style="font-family: sans-serif; font-size: 40px">Update Blog</h1>
            <br/>
        <form action="updateBlog" method="post" enctype="multipart/form-data">
            <input name="blog_id" value="${b.blog_id}" hidden="" required=""/>
            <div class="TTT">
                <label style="position: relative; font-family: sans-serif; font-size: 20px; right: 93px">Title</label>
                <input name="title" style="margin-bottom: 20px " value="${b.title}"/>
            </div>
            
            <div class="TTT">
                <label style="position: relative; font-family: sans-serif; font-size: 20px; left: -47px; bottom: 35px">Brief Info</label>
                <textarea name="brief_info" style="margin-bottom: 10px; margin-right: 85px" value="${b.brief_info}" required="">${b.brief_info}</textarea>
            </div>
            <div class="TTT"> 
                <label style="position: relative; font-family: sans-serif; font-size: 20px; left: -15px; bottom: 20px">Blog Content</label>
                <textarea name="blog_content"  value="${b.blog_content}" required="" style="margin-right: 115px">${b.blog_content}</textarea>
            </div>
            <div>
                <label for="category_id" style="position: relative; font-family: sans-serif; font-size: 20px; right: 50px">Category</label>                           
                <select name="category_id" style="margin-right: 117px">                                    
                    <c:forEach var="c" items="${category}">
                        <option value="${c.id}" ${c.id==b.cate_id ? "selected":""}>${c.name}</option>
                    </c:forEach>
                </select>  
            </div>
            <br/>
            <div>
                <label for="status" style="position: relative; font-family: sans-serif; font-size: 20px; right: 76px">Status</label> 
                <select name="status" style="margin-right: 155px">                                    
                    <option value="0" ${b.status?"":"selected"}>InActive</option>
                    <option value="1" ${b.status?"selected":""}>Active</option>
                </select>  
            </div>
            <br/>
            <div>
                <label style="position: relative; font-family: sans-serif; font-size: 20px; right: 95px">Flag</label>
                <select name="flag" style="margin-right: 175px">
                    <option value="ON" ${b.flag=="ON"?"selected":""}>ON</option>
                    <option value="OFF" ${b.flag=="OFF"?"selected":""}>OFF</option>
                </select>
            </div>
                <br/>
            <div>
                <label style="position: relative; font-family: sans-serif; font-size: 20px; right: -97px">Image</label>
                <input id="old-image" name="old_image" value="${b.image}" hidden=""/>
                <img style="margin-left: 124px" src="${b.image}" id="img-preview" width="50" height="50"/>
                <input accept="image/*" id="file-input" name="file" type="file"/>
            </div>
                <br/>
                <button style="border-radius: 10px; background-color: #EEEEEE; color: red" type="submit">Update</button>
                <a href="blogdetail?bid=${b.blog_id}" style="border-radius: 10px; background-color: #EEEEEE; font-size: 24px;color: blue" target="target">Back</a>
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
                }else{
                    image.src = document.getElementById('old-image').value;
                }
            });
        </script>
    </body>
</html>