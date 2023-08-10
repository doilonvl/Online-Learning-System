<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js" integrity="sha512-1/RvZTcCDEUjY/CypiMz+iqqtaoQfAITmNSJY17Myp4Ms5mdxPS5UV7iOfdZoxcGhzFbOm6sntTKJppjvuhg4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />     
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="CSS/styles.css" rel="stylesheet" type="text/css"/>

<!-- Login Modal -->
<style>
    #navbarText ul.navbar-nav>li{
        position: relative;
    }

    #navbarText ul.navbar-nav>li>ul{
        position: absolute;
        background-color: white;
        list-style: none;
        left: 20px;
        width: 150px;
        display: none;
        font-size: 13px;
        color: black;
    }

    #navbarText ul.navbar-nav>li:hover>ul{
        display: block;
    }

    #navbarText ul.navbar-nav>li>ul>li{
        padding: 10px;
        border-bottom: 1px solid #fff;
    }
</style>
<div class="modal" id="loginModal" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Login</h5>
                <button type="button" class="close" onclick="hideModal('loginModal')">&times;</button>
            </div>
            <div class="modal-body">
                <form method="POST" action="login" >
                    <div class="form-outline mb-4">
                        <label for="username">Username</label>
                        <input class="form-control" type="text" name="username" required="" placeholder="Enter username">
                    </div>
                    <div class="form-outline mb-4">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password"  required="" placeholder="Enter password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block mb-4">Login</button>
                    <a href="#" class="tm-register" onclick="showDoNotAccountOrLogin('registerModal', 'loginModal')">
                        <i>Haven't have account yet?</i>
                    </a>
                    <a href="forgotPassword.jsp" class="tm-register">
                        <i>Remember me?</i>
                    </a>

                    ${message}
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="hideModal('loginModal')">Close</button>
            </div>
        </div>
    </div>
</div>


<!-- Register Modal -->
<div class="modal" id="registerModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Register</h5>
            </div>
            <div class="modal-body">
                <!--<form method="POST" action="register">-->
                    <div class="form-outline mb-4">
                        <label for="email">Email</label>
                        <input class="form-control" id="email" type="email" name="email" required="" oninput="ValidateEmail(this)" placeholder="Enter email">
                        <p id="emailMessage"></p>
                    </div>
                    <div class="form-outline mb-4">
                        <label for="password">Password</label>
                        <input class="form-control" id="password" type="password" name="password" oninput='checkLength(6, 31)' placeholder="Enter password">
                        <p id='passwordMessage'></p>
                    </div>
                    <div class="form-outline mb-4">
                        <label for="username">Full name</label>
                        <input class="form-control" type="text" id="fullname" name="fullname" oninput="clearMessage()" placeholder="Enter Full Name">
                        <p id='fullnameMessage'></p>
                    </div>
                    <div>
                        <label>Gender</label>
                        <select class="form-select form-select-lg mb-3" id="gender" aria-label=".form-select-lg example" name="gender">
                            <option value="1">Male</option>
                            <option value="0">Female</option>
                        </select>
                    </div>
                    <div class="form-outline mb-4">
                        <label for="username">Address</label>
                        <input class="form-control" type="text" name="address" id="address" oninput="clearMessage()" required="" placeholder="Enter email">
                        <p id='addressMessage'></p>
                    </div>
                    <div class="form-outline mb-4">
                        <label for="username">Phone Number</label>
                        <input class="form-control" type="number" name="phone_number" id="phonenumber" oninput="clearMessage()" required="" placeholder="Enter Phone Number">
                        <p id='phonenumberMessage'></p>
                    </div>
                <button onclick='register()' id='btnRegister' type="button" class="btn btn-primary btn-block mb-4">Register</button>    
                <p id='mess'></p>
                <!--</form>-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="hideModal('registerModal')">Close</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="padding: 10px; background-color: white; box-shadow:0 -4px 25px 0 blue; width: 100%; position: fixed; top: 0; left: 0;">
        <a class="navbar-brand" href="home" style="font-size: 20px; border: 2px solid blue; padding: 5px;">Online Learning</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="margin: auto;">
                <li class="nav-item">
                    <c:if test="${user!=null}"><h1 style="margin-top:23px;">Welcome, ${sessionScope.user.getFull_name()}</h1>
                        <ul>         
                            <c:if test="${user!=null}">
<!--                                <li><a href="userProfile">User profile</a></li>  
                                <li><a href="logout">Logout</a></li>  
                                <li><a href="changePassword.jsp">Change Password</a></li>  -->
                            </c:if>                                                                            
                        </ul>
                    </c:if>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="courses" style="font-size: 20px; margin-left: 20px;">Course</a>
                    <ul>         
                        <c:if test="${user!=null}">
                            <li><a href="myCourse">My Course</a></li>  
                            <li><a href="myRegistration">My Registration</a></li>                             
                            </c:if>                                                                            
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="blog" style="font-size: 20px; margin-left: 20px;">Blog</a>                       
                </li>-->
                <c:if test="${sessionScope.user==null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="showModal('loginModal')" style="font-size: 20px; margin-left: 20px;">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="showModal('registerModal')" style="font-size: 20px; margin-left: 20px;">Register</a>
                    </li>
                </c:if>   

                <c:if test="${sessionScope.user.role_id == 4}">
                    <li class="nav-item">
                        <a class="nav-link" href="subject" style="font-size: 20px; margin-left: 20px;">Subject List</a>
                    </li>

                </c:if>
                <c:if test="${sessionScope.user.role_id==5}">
<!--                    <li class="nav-item">
                        <a class="nav-link" href="userList" style="font-size: 20px; margin-left: 20px;">Manage user</a>
                    </li>                    -->
                </c:if>  
                <c:if test="${sessionScope.user.role_id==5}">
<!--                    <li class="nav-item">
                        <a class="nav-link" href="settingList" style="font-size: 20px; margin-left: 20px;">Manage setting</a>
                    </li>                    -->
                </c:if>  
                <c:if test="${sessionScope.user.role_id == 2}">
<!--                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="changePassword.jsp">Change Password</a>
                    </li>-->
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    function checkLength(min, max){
        var password = document.getElementById("password").value;
        if(password.length < min || password.length > max){
            document.getElementById("passwordMessage").innerHTML = "password must has length in range 6 to 31 characters"; 
            document.getElementById("btnRegister").setAttribute("disabled", "disabled"); 
        }else{
            document.getElementById("passwordMessage").innerHTML = ""; 
            document.getElementById("btnRegister").removeAttribute("disabled"); 
        }
    }
    
    function clearMessage(){
        var fullname = document.getElementById("fullname").value;
        var address = document.getElementById("address").value;
        var phonenumber = document.getElementById("phonenumber").value;
        
        if(fullname.length > 0){
            document.getElementById("fullnameMessage").innerHTML = "";
        }
        
        if(address.length > 0){
            document.getElementById("addressMessage").innerHTML = "";
        }
        
        if(phonenumber.length === 10){
            document.getElementById("phonenumberMessage").innerHTML = "";
        }
        
    }
    
    function ValidateEmail(t)
    {
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if(!t.value.match(mailformat))
        {
            document.getElementById("emailMessage").innerHTML = "invalid email"; 
            document.getElementById("btnRegister").setAttribute("disabled", "disabled"); 
        }
        else
        {
            document.getElementById("emailMessage").innerHTML = ""; 
            document.getElementById("btnRegister").removeAttribute("disabled"); 
        }
    }
    
    async function register(){
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var fullname = document.getElementById("fullname").value;
        var gender = document.getElementById("gender").value;
        var address = document.getElementById("address").value;
        var phonenumber = document.getElementById("phonenumber").value;
        var data = "";

        if(fullname.length === 0){
            document.getElementById("fullnameMessage").innerHTML = "you need to input full name";
        }
        else if(address.length === 0){
            document.getElementById("addressMessage").innerHTML = "you need to input address";
        }
        else if(phonenumber.length !== 10){
            document.getElementById("phonenumberMessage").innerHTML = "phone number must has 10 numbers";
        }
        else{
            data = await doAjax(email, password, fullname, gender, address, phonenumber);

            if(data.includes('email')){
                document.getElementById("mess").innerHTML = ""; 
                document.getElementById("emailMessage").innerHTML = data; 
                document.getElementById("btnRegister").removeAttribute("disabled"); 
            }
            else if(data === 'success')
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Register Successfully',
                    showConfirmButton: false,
                    timer: 1500
                });
                setTimeout(function (){
                    location.href="/SWP391_Project/home";
                }, 1500);
        }  
    }
    
    async function doAjax(email, password, fullname, gender, address, phonenumber) {
        let result;
        document.getElementById("mess").innerHTML = "please wait..."; 
        document.getElementById("btnRegister").setAttribute("disabled", "disabled"); 
        try {
            result = await $.ajax({
                type: "POST",
                url: "/SWP391_Project/register",
                data: {
                    email: email,
                    password: password,
                    fullname: fullname,
                    gender: gender,
                    address: address,
                    phonenumber: phonenumber
                }
            });

            return result;
        } catch (error) {
            console.error(error);
        }
    }
    
    function showModal(modalId) {
        document.getElementById(modalId).style.display = "block";
    }

    function hideModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    function showDoNotAccountOrLogin(modalIdOpen, modalIdClose) {
        hideModal(modalIdClose);
        showModal(modalIdOpen);
    }

</script>