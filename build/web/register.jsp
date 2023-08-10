<%-- 
    Document   : register
    Created on : May 21, 2023, 2:09:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            .all{
                border: 2px solid black;
                width: fit-content;
                padding: 40px;
                text-align: center;
                margin:10% 0 0 40%;
                font-size: 20px;
                margin-bottom: 50px;
            }
            .all button{
                margin-top:5px;
                padding-left: 20px;
                width: 30%;
            }
           
            .up{
                width: 100%;
                display: block;
                border-bottom: 1px solid #999;
                padding: 6px 30px;
                font-family: Poppins;
                box-sizing: border-box;

            }
            .PU{
                padding-left: 20px;
                width: 100%;
            }
            
            
        </style>
    </head>
    <body style="align-items: center;">
        <jsp:include page="header.jsp"/>
        <div class="all">
        <form method="POST" action="register">
             <div>
                <label>Email</label>
                <input type="email" name="email" required="" class="PU">
            </div>
            <div>
                <label>Password</label>
                <input type="password" name="password" required="" class="PU">
            </div>
            <div>
                <label>Full Name</label>
                <input type="text" name="fullname" required="" class="PU">
            </div>
            <div>
                <label>Gender</label>
                <select name="gender">
                    <option value="1" selected="">Male</option>
                    <option value="0">Female</option>
                </select>
            </div>
            <div>
                <label>Address</label>
                <input type="text" name="address" required="" class="PU">
            </div>
            <div>
                <label>Phone Number</label>
                <input type="number" name="phone_number" required="" class="PU">
            </div>

            <button>Register</button>
            <a href="forgotPassword.jsp" class="tm-register">
                    <br><i>Remember me</i>
                </a>
            ${message}
        </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>