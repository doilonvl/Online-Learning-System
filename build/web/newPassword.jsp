<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Online Learning</title>
        <link href="CSS/rspassword.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="change-password"> 
            Enter your new password below.       
            <form class="form-ps" action="newPassword" method="POST">
                <br>
                <div class="new-password">
                    <h4 class="text-password">
                        New Password:
                    </h4>
                    <input type="text" name="password">
                    <div id="passwordError"></div>
                </div>
                <div class="confirm-password" >
                    <h4 class="text-password">
                        Confirm Password:
                    </h4>
                    <input type="password" name="newpassword">
                    <div id="repasswordError"></div>
                </div>
                <br>
                <div class="note-text">
                    Hint: To maker password is stronger, user
                    upper and lower case <br> letters, numbers, and
                    symbols like !"? $ % ^ &).
                </div>
                <div class="reset">
                    <br>
                    <input type="submit" value="Reset Password" id="submitButton">
                </div>
                <br>
                <div class="notice-message">
                    <h1>${status}</h1>
                    <h1>${errorMessage}</h1>
                </div>
        </div>              
        <jsp:include page="footer.jsp"/>

    </body>
</html>
