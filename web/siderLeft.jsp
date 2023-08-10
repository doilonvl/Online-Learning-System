<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
<link href="CSS/sidebar.css" rel="stylesheet" type="text/css"/>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<body>
    <div class="sidebar">
        <div class="logo_details">
            <i class="bx bxl-audible icon"></i>
            <div class="logo_name">Online Learning</div>
            <i class="bx bx-menu" id="btn"></i>
        </div>

        <ul class="nav-list">
            <li>
                <a href="home">
                    <i class="bx bx-home"></i>
                    <span class="link_name">Home</span>
                </a>
                <span class="tooltip">Home</span>
            </li>            
            <c:if test="${sessionScope.user.role_id == 1}">
                <li>
                    <a href="myCourse">
                        <i class="bx bx-grid-alt"></i>
                        <span class="link_name">My Course</span>
                    </a>
                    <span class="tooltip">My Course</span>
                </li>
                <li>
                    <a href="myRegistration">
                        <i class="bx bx-pie-chart-alt-2"></i>
                        <span class="link_name">My Registration</span>
                    </a>
                    <span class="tooltip">My Registration</span>
                </li>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <li>
                    <a href="userProfile">
                        <i class="bx bx-user"></i>
                        <span class="link_name">User Profile</span>
                    </a>
                    <span class="tooltip">User Profile</span>
                </li>
            </c:if>

            <li>
                <a href="blog">
                    <i class="bx bx-chat"></i>
                    <span class="link_name">Blog</span>
                </a>
                <span class="tooltip">Blog</span>
            </li>
            <li>
                <a href="courses">
                    <i class="bx bxl-discourse"></i>
                    <span class="link_name">Course</span>
                </a>
                <span class="tooltip">Course</span>
            </li>
            <c:if test="${sessionScope.user.role_id == 2}">
                <li>
                    <a href="slider">
                        <i class="bx bx-cart-alt"></i>
                        <span class="link_name">Manage Slider</span>
                    </a>
                    <span class="tooltip">Manage Slider</span>
                </li>
            </c:if>
            <c:if test="${sessionScope.user.role_id == 3}">
                <li>
                    <a href="manageRegistration">
                        <i class="bx bx-cog"></i>
                        <span class="link_name">Manage Registration</span>
                    </a>
                    <span class="tooltip">Manage Registration</span>
                </li>
            </c:if>
            <c:if test="${sessionScope.user.role_id == 4 || sessionScope.user.role_id == 5}">
                <li>
                    <a href="settingList">
                        <i class="bx bx-cog"></i>
                        <span class="link_name">Manage Setting</span>
                    </a>
                    <span class="tooltip">Manage Setting</span>
                </li>
                <li>
                    <a href="userList">
                        <i class="bx bx-folder"></i>
                        <span class="link_name">Manage User</span>
                    </a>
                    <span class="tooltip">Manage User</span>
                </li>
            </c:if>
            <c:if test="${sessionScope.user.role_id != null}">
                <li>
                    <a href="changePassword.jsp">
                        <i class="bx bx-reset"></i>
                        <span class="link_name">Change Password</span>
                    </a>
                    <span class="tooltip">Change Password</span>
                </li>
                <li>
                    <a href="logout">
                        <i class="bx bx-log-out-circle"></i>
                        <span class="link_name">Logout</span>
                    </a>
                    <span class="tooltip">Logout</span>
                </li>
            </c:if>

        </ul>
    </div>
</body>

<div class="container px-4 px-lg-5">
    <!-- Call to Action-->
    <script>window.onload = function () {
            const sidebar = document.querySelector(".sidebar");
            const closeBtn = document.querySelector("#btn");
            const searchBtn = document.querySelector(".bx-search")

            closeBtn.addEventListener("click", function () {
                sidebar.classList.toggle("open")
                menuBtnChange()
            })

            searchBtn.addEventListener("click", function () {
                sidebar.classList.toggle("open")
                menuBtnChange()
            })

            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right")
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu")
                }
            }
        };</script>
</div>