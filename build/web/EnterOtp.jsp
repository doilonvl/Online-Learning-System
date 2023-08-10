<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Online Learning</title>
        <link href="CSS/rspassword.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <jsp:include page="header.jsp"/>
            <jsp:include page="siderLeft.jsp" />
            <div class="enter-otp">
                <div class="text">
                    Enter OTP
                </div>
                <img class="image-reponse" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWxaKG6HL-_z88M5D0-zeXZjQHqN33XNtYmA&usqp=CAU">
                <div class="text-notice">
                    Check for email for the OTP
                </div>
                <div class="otp-text"> 
                    <%
                        if(request.getAttribute("message")!=null) {
                            out.print(request.getAttribute("message")+"</p>");
                        }
                    %>
                </div>
                <form id="register-form" action="ValidateOtp" class="form" method="post">
                    <div class="otp-value">
                        <input id="opt" name="otp" placeholder="Enter OTP" type="text">
                    </div>
                    <br>
                    <div class="reset-password">
                        <input name="recover-submit" value="Reset Password" type="submit">
                    </div>
                </form>                                             
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
       
    </body>
</html>