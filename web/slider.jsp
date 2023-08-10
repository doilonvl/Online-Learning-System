<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--                <link href="CSS/slider.css" rel="stylesheet" type="text/css"/>-->

        <style>
            ul, li {
                display: block;
            }

            #body {
                left: 50%;
                width: 609px;
                height: 405px;
                display: block;
                position: absolute;
                margin-left: -305px;
            }

            #body * {
                -webkit-user-select: none;
            }

            #body input {
                display: none;
            }

            #img-fluid {
                top: 0;
                opacity: 0;
                width: 609px;
                height: 405px;
                display: block;
                position: absolute;

                transform: scale(0);
                -moz-transform: scale(0);
                -webkit-transform: scale(0);

                transition: all .7s ease-in-out;
                -moz-transition: all .7s ease-in-out;
                -webkit-transition: all .7s ease-in-out;
            }

            #img-fluid img {
                width: 100%;
                height: 100%;
            }

            #img-fluid:hover ~ label.sb-bignav {
                opacity: 0.5;
            }

            label.sb-bignav:hover {
                opacity: 1;
            }

            .sb-bignav {
                width: 200px;
                height: 100%;
                display: none;
                position: absolute;

                opacity: 0;
                z-index: 9;
                cursor: pointer;

                transition: opacity .2s;
                -moz-transition: opacity .2s;
                -webkit-transition: opacity .2s;

                color: white;
                font-size: 156pt;
                text-align: center;
                line-height: 380px;
                font-family: "Varela Round", sans-serif;
                background-color: rgba(255, 255, 255, .3);
                text-shadow: 0px 0px 15px rgb(119, 119, 119);
            }

            label[title="Next"] {
                right: 0;
            }

            input:checked + li > #img-fluid {
                opacity: 1;

                transform: scale(1);
                -moz-transform: scale(1);
                -webkit-transform: scale(1);

                transition: opacity 1s ease-in-out;
                -moz-transition: opacity 1s ease-in-out;
                -webkit-transition: opacity 1s ease-in-out;
            }

            input:checked + li > label {
                display: block;
            }

        </style>
    </head>
    <body>
        <!-- NOTE: None of the included images are mine and I take no credit for them!! -->
        <ul id="body" >           
            <c:forEach items="${requestScope.sliders}" var="s" varStatus="loop">
                <input type="radio" name="radio-btn" id="img-${s.id}" checked />
                <li id="img-container">
                    <div id="img-fluid">
                        <a href="<%=request.getContextPath()%>/sliderDetail?id=${s.id}"><img src="${s.image}"></a>
                    </div>
                    <label for="img-${s.id-1}" class="sb-bignav" title="Previous">&#x2039;</label>
                    <label for="img-${s.id+1}" class="sb-bignav" title="Next">&#x203a;</label>
                </li>    
            </c:forEach>            
        </ul>
    </body>
</html>