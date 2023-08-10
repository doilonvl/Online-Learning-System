<%-- 
    Document   : updateSetting
    Created on : Jun 26, 2023, 11:26:26 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting Detail - Online Learning</title>
        <!--<link rel="stylesheet" href="./CSS/userStyle.css"/>-->
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        <div style="border: 1px solid black; width: fit-content; text-align: center; margin: auto;
             margin-bottom: 50px; padding: 20px; margin-top: 100px; font-size: 20px; ">

            <form action="updateSetting" method="post">
                <h1 style="opacity: 0.4; font-weight: bold; font-size: 35px">Update Setting</h1>
                <br/>
                <input name="setting_id" value="${s.setting_id}"  hidden=""/>
                <div class="input-field">
                    <label style="position: relative; right: 82px">Type</label>
                    <select name="type" style="height: 100%; margin-right: 116px">
                        <c:forEach items="${listR}" var="r">
                            <option value="${r.role_id}" ${s.role_name==r.role_name?"selected":""}>${r.role_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 72px">Value</label>
                    <input name="value" value="${s.value}"  style="height: 100%;  margin-right: 1px" required="" />
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 73px">Order</label>
                    <input name="order" type="number" value="${s.order}"  style="height: 100%;" required="" />
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; top: -50px;">Description</label>

                    <textarea name="description" style="width: 320px; padding: 40px; padding-left: 10px; padding-top: 5px; margin-left: 20px" value="${s.description}" required="" >${s.description}</textarea>
                </div>
                <br/>
                <div class="input-field">
                    <label style="position: relative; right: 70px" ">Status</label>
                    <select name="status" style="height: 100%; margin-right: 138px">
                        <option value="0" ${s.status?"":"selected"}>Deactive</option>
                        <option value="1" ${s.status?"selected":""}>Active</option>
                    </select>
                </div>
                <br/>
                <button style="border-radius: 10px; background-color: white; color: red" type="submit">Update Setting</button>
                <a href="settingList" style="border-radius: 10px; border: 1px solid black ;background-color: white; color: green; padding: 4px" >Back</a>

            </form>
        </div>















        <!--        <div style="text-align: center; border: 1px solid black; padding: 80px; width: 100%; position: relative; font-size: 20px;">
                    <form action="updateSetting" method="post">
                        <h1 style="font-size: 50px;">Setting Detail</h1>
                        <input name="setting_id" value="${s.setting_id}"  hidden=""/>
                        <div class="input-field">
                            <label>Type</label>
                            <select name="type" style="height: 100%;">
        <c:forEach items="${listR}" var="r">
            <option value="${r.role_id}" ${s.role_name==r.role_name?"selected":""}>${r.role_name}</option>
        </c:forEach>
    </select>
</div>
<div class="input-field">
    <label >Value</label>
    <input name="value" value="${s.value}"  style="height: 100%;" required="" />
</div>
<div class="input-field">
    <label>Order</label>
    <input name="order" type="number" value="${s.order}"  style="height: 100%;" required="" />
</div>
<div class="input-field">
    <label style="position: relative; top: -50px;">Description</label>

    <textarea name="description" style="width: 320px; padding: 40px; padding-left: 10px; padding-top: 5px;" value="${s.description}" required="" >${s.description}</textarea>
</div>
<div class="input-field">
    <label ">Status</label>
    <select name="status" style="height: 100%;">
        <option value="0" ${s.status?"":"selected"}>Deactive</option>
        <option value="1" ${s.status?"selected":""}>Active</option>
    </select>
</div>
<div>
    <button style="margin: 0px 660px; border-radius: 5px; color: red" type="submit">Save</button>
    <a href="settingList" style="margin: 0px 660px; border-radius: 5px; color: green">Back</a>
</div> 

</form>
</div>-->

        <jsp:include page="footer.jsp"/>
    </body>
</html>
