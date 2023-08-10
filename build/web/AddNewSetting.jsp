<%-- 
    Document   : AddNewSetting
    Created on : Jun 26, 2023, 4:00:26 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Learning</title>
        <!--<link rel="stylesheet" href="./CSS/userStyle.css"/>-->
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp" />
        <div style="border: 1px solid black; width: fit-content; text-align: center; margin: auto;
             margin-bottom: 15px; padding: 20px; margin-top: 100px; font-size: 20px; ">

            <form action="addNewSetting" method="post">
                <h1 style="opacity: 0.4; font-weight: bold">Add New Setting</h1>
                <div class="input-field">
                    <label>Setting Name</label>
                    <input name="setting_name"  style="height: 100%; margin-left: 65px" required=""/>
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 150px">Type</label>
                    <select name="type"  style="height: 100%; margin-right:-30px">
                        <c:forEach items="${listR}" var="r">
                            <option value="${r.role_id}" style="margin-left: ">${r.role_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 140px">Value</label>
                    <input name="value"  style="height: 100%; margin-right: -146px" required="" />
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 140px">Order</label>
                    <input name="order"  style="height: 100%; margin-right: -145px" type="number" required="" />
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 83px; bottom: 50px">Description</label>
                    <textarea name="description" style="padding: 20px; width: 250px; margin-right: -88px" required="" ></textarea>
                </div>
                <br/>
                <div class="input-field" style="margin-right: 270px">
                    <label style="position: relative; right: 130px">Status</label>
                    <select name="status"  style="height: 100%; margin-right: -256px ">
                        <option value="1">Active</option>
                        <option value="0">InActive</option>
                    </select>
                </div>
                <br/>
                <button style="border-radius: 10px; background-color: black; color: red" type="submit">Add New</button>
                <a href="settingList" style="border-radius: 10px; background-color: black; color: green; padding: 4px" >Back</a>

            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
