<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
<link href="CSS/sidebar.css" rel="stylesheet" type="text/css"/>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <jsp:include page="siderLeft.jsp"/>    
<div class="container px-4 px-lg-5">
    <!-- Call to Action-->

<!--    <div class="card bg-secondary my-5 py-4 ">
        <div class="card-body"><h1 class="text-white m-0" style="font-size: 50px;">Hot post</h1></div>
    </div>-->
    <div style="margin-top: 450px; background-color: black; padding: 1px; width: 100%;"></div>
<div  class="row gx-4 gx-lg-5" >
        <c:forEach var="p" items="${listB}">
                <div class="col-md-6 mb-5">
                <div class="card h-100">
                    <div class="card-body">
                        <div style="background-color: #ff3333; text-align: center;"><h1>Hot blog</h1></div>
                        <h2 class="card-title">${p.title}</h2>
                        <p class="card-text">${p.brief_info}</p>                     
                        Created: <p class="card-text">${p.createDate}</p>
                        <div class="col-lg-7"><img class="img-fluid mb-4 mb-lg-0" src="${p.image}" alt="..." /></div>      
                    </div>
                    <a  href="blogdetail?bid=${p.blog_id}"><button type="button" class="btn btn_detail "><i class="fa fa-info-circle"></i>
                                                           Blog Details </button> </a>                    
                </div>
            </div>
        </c:forEach>

    </div>
    <div class="card text-white bg-secondary my-5 py-4 text-center">
        <div class="card-body"><h1 class="text-white m-0" style="font-size: 50px;">New release course</h1></div>
    </div>

    <div class="row gx-4 gx-lg-5">
        <c:forEach items="${listC}" var="o">
            
            <div class="col-md-3 mb-5">
                <div class="card h-100">
                    <div class="card-body">
                        <h2 class="card-title">${o.name}</h2>
                        <p class="card-text">${o.brief_infor}</p>
                        Created: <p class="card-text">${o.course_date}</p>
                        <div class="col-lg-7"><img class="img-fluid mb-4 mb-lg-0" src="${o.image}" alt="..." /></div>      
                    </div>
                    <div class="card-footer"><a class="btn btn-primary btn-sm" href="details?courseId=${o.course_id}">More Info</a></div>                    
                </div>
            </div>
        </c:forEach> 
    </div>     
    
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