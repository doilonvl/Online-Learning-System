<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS/userprofile.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="siderLeft.jsp"/>
        <div class="container" style="margin-top: 10%">
            <div class="main-body">             
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <form action="userProfile" method="post" enctype="multipart/form-data">
                                    <input name="action" value="updateImage" hidden=""/>
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <input type="text" hidden='' name="email"  value="${userProfile.email}">
                                        <img src="${userProfile.image}" id="img-preview" alt="Admin" class="rounded-circle" width="250">  
                                        <!--https://bootdey.com/img/Content/avatar/avatar7.png-->
                                    </div>
                                    <input id="old-image" name="old_image" value="${userProfile.image}" hidden=""/>
                                    <input accept="image/*" id="file-input" name="file" type="file"/>
                                    <button type="submit" class="btn btn-info">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <form action="userProfile" method="post">
                                <input value="updateInfo" name='action' hidden=""/>
                                <div class="card-body">
                                    <div class="row">
                                        <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Full Name:</h6>
                                        <input type="text" class="fullname" name="fullname" value="${userProfile.full_name}">
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Email</h6>
                                        <input type="text" class="fullname" name="email" readonly="" value="${userProfile.email}">
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Phone</h6>
                                        <input type="text" class="fullname" name="phone" value="${userProfile.phone_number}">

                                    </div>
                                    <hr>
                                    <div class="row">
                                            <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Gender</h6>
                                            <select class='form-control fs-3 ml-4 pl-4' name="gender">
                                                <option value="1" ${userProfile.gender?"selected":""}>Male</option>
                                                <option value="0" ${userProfile.gender?"":"selected"}>Female</option>
                                            </select>
                                    </div>
                                    <hr>
                                    <div class="row">
                                            <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Address</h6>
                                            <input type="text" name="address" class="fullname" value="${userProfile.address}">
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-info" style="font-size: 20px">Save change</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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