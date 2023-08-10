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
        <jsp:include page="siderLeft.jsp"/>
        <form action="forgotPassword" method="post">
            <div class="forgot-password">
            <div class="title-text">
                Forgot your password?
            </div>
            <p>
                Change your password in three easy steps. This will 
                help you to secure your password!
            </p>

            <ol class="step-reset">
                <li>
                    1. Enter your email address below.
                </li>

                <li>
                    2. Our system will send you an OTP to your email.
                </li>

                <li>
                    3. Enter the OTP on the next page.
                </li>
            </ol>
        </div>
        </form>
        
 
        <div class="email-password"  style="margin-bottom: 100px;">
            <form action="forgotPassword" method="POST">
                <label >Enter your email address</label> 
                <br>
                <input class="enter-email" type="text" name="email">
                <small class="form-text text-muted">
                    Enter the email address you used during the 
                    registration. Then we'll email a OTP to this address.
                </small>
                <br>
                <hr>
                <div class="submit-password">
                    <button class="get-password" type="submit">
                        <span class="ps">
                            Get New Password
                        </span>
                    </button>
                    <button class="back-login" type="submit">
                        <span class="lg">
                            Back to Login
                        </span>
                    </button>
                    <h2 style="color: red">${message}</h2>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>