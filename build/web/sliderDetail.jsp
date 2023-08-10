<%-- 
    Document   : sliderDetail
    Created on : Jun 26, 2023, 10:28:07 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        
        <div>
           Title: <p>${slider.title}</p>
           Back link: <p>${slider.backlink}</p>
           
           Image:<div>
               <img src="${slider.image}"/>
           </div>
                <p>Status: ${slider.status}</p>
                <a href="slider">Back</a>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
