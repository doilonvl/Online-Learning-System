<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="CSS/changepassword.css" rel="stylesheet" type="text/css"/>
<link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
<link href="CSS/userprofile.css" rel="stylesheet" type="text/css"/>
<html>
    <head>
    <head>
        <title>Change Password</title>
    </head>
</head>
<body>
    <jsp:include page="header.jsp"/>   
    <jsp:include page="siderLeft.jsp" />
    <div class="container" style="margin-top: 10%">
        <div class="main-body">             
            <div class="row gutters-sm">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="card mb-3">
                        <form action="changepassword" method="post">
                            <div class="card-body">
                                <div class="row">
                                    <h6 class="mb-0 change2">Change Password</h6>
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0 change">Old Password</h6>
                                    <input type="password" class="fullname" name="oldpass">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0 change">New Password</h6>
                                    <input type="password" class="fullname" name="newpass">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0 change">Confirm Password</h6>
                                    <input type="password" class="fullname" name="renewpass">
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">                                       
                                        <input type ="submit" style="padding: 5px; font-size: 16px" value="Save Change">
                                    </div>
                                </div>                           
                            </div>
                            <div class="notice-message">
                                <h1>${status}</h1> 
                                <h1>${errorMessage}</h1>  
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>

</html>
