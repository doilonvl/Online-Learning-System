<%-- 
    Document   : addNewUser
    Created on : Jun 26, 2023, 8:54:14 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <link rel="stylesheet" href="./CSS/userStyle.css"/>-->
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp" />
        <%--<jsp:include page="siderLeft.jsp" />--%>
        <div style="border: 1px solid black; width: fit-content; text-align: center; margin: auto;
             margin-bottom: 220px; padding: 5px; margin-top: 80px; font-size: 20px; ">
            <h1>Add New User</h1>
            <form action="addNewUser" method="post">
                <div class="input-field">
                    <label>Email</label>
                    <input name="email" required="" style="height: 100%; margin-left: 41px;" type="email"/>
                    <p>${message}</p>
                </div>
                <br/>
                <div class="input-field">
                    <label>Password</label>
                    <input name="password" required="" style="height: 100%;" type="password" minlength="6" maxlength="31"/>
                </div>
                <br/>
                <div class="input-field">
                    <label>Full Name</label>
                    <input name="fullname" required="" style="height: 100%;" type="text"/>
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 24px">Gender</label>
                    <select name="gender" style="height: 100%; margin-right: 124px">
                        <option value="1" selected>Male</option>
                        <option value="0">Female</option>
                    </select>
                </div>
                <br/>
                <div class="input-field">
                    <label>Address</label>
                    <input name="address" required=""  style="height: 100%; margin-left: 20px"type="text"/>
                </div>
                <br/>
                <div class="input-field">
                    <label>Phone</label>
                    <input name="phone_number" required="" style="height: 100%; margin-left: 40px" type="number" minlength="10" maxlength="11"/>
                </div>
                <br/>
                <button type="submit" style="border-radius: 7px">Add New</button>
                <a href="userList" style="border-radius: 7px">Back to user list</a>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
