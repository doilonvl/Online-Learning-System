<%-- 
    Document   : Test
    Created on : 09-06-2023, 07:45:34
    Author     : Huy Linh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Learning</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style: none;
                text-decoration: none;
                font-family: 'Josefin Sans', sans-serif;
            }

            body{
                background-color: #f3f5f9;
            }

            .wrapper{
                display: flex;
                position: relative;
            }

            .wrapper .sidebar{
                width: 200px;
                height: 100%;
                background: white;
                padding: 30px 0px;
                position: fixed;
            }

            .wrapper .sidebar h2{
                color: black;
                text-transform: uppercase;
                text-align: center;
                margin-bottom: 30px;
            }

            .wrapper .sidebar ul li{
                padding: 15px;
                border-bottom: 1px solid #bdb8d7;
                border-bottom: 1px solid rgba(0,0,0,0.05);
                border-top: 1px solid rgba(255,255,255,0.05);
            }

            .wrapper .sidebar ul li a{
                color: black;
                display: block;
            }

            .wrapper .sidebar ul li a .fas{
                width: 25px;
            }

            .wrapper .sidebar ul li:hover{
                background-color: #594f8d;
            }

            .wrapper .sidebar ul li:hover a{
                color: #fff;
            }

            .wrapper .sidebar .social_media{
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
            }

            .wrapper .sidebar .social_media a{
                display: block;
                width: 40px;
                background: #594f8d;
                height: 40px;
                line-height: 45px;
                text-align: center;
                margin: 0 5px;
                color: #bdb8d7;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
            }

            @media (max-height: 500px){
                .social_media{
                    display: none !important;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp" />
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

        <div class="wrapper">
            <div class="sidebar">                
                <h2>Sider</h2>
                <ul>
                    <li><a href="home"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="userProfile.jsp"><i class="fas fa-user"></i>Profile</a></li>
                    <li><a href="#"><i class="fas fa-address-card"></i>About</a></li>
                    <li><a href="blog"><i class="fas fa-blog"></i>Blogs</a></li>
                    <li><a href="#"><i class="fas fa-address-book"></i>Contact</a></li>
                </ul> 
                <div class="social_media">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </body>
</html>
