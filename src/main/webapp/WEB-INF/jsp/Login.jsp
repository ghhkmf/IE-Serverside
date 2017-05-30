<%-- 
    Document   : student
    Created on : Nov 22, 2016, 10:46:20 PM
    Author     : mahdifar424
--%>
<%@page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" 
import="java.sql.*" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>سیستم گلستان دانشگاه شهید بهشتی</title>
<!--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">-->
<!--        <link rel='stylesheet' href='<c:url value="${pageContext.request.contextPath}/resources/css/styles.css" />' type='text/css' /> -->
    <link rel='stylesheet' href='<c:url value="${pageContext.request.contextPath}/resources/css/LoginFormCss.css" />' type='text/css' /> 
    <link rel='stylesheet' href='<c:url value="${pageContext.request.contextPath}/resources/css/HomePageCss.css" />' type='text/css' /> 
    <link rel='stylesheet' href='<c:url value="${pageContext.request.contextPath}/resources/css/buttonHomecss.css" />' type='text/css' /> 
    <link rel='stylesheet' href='<c:url value="${pageContext.request.contextPath}/resources/css/LoginFormCss.css" />' type='text/css' /> 
    <link rel="icon" href='<c:url value="${pageContext.request.contextPath}/resources/img/GolestanLogo.png" />'/>
        <link rel="icon" href='<c:url value="${pageContext.request.contextPath}/resources/css/Font.css" />'/>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" > </script>

</head>
<body> <!--class="fontBody"-->

<div id="container">
    <div>
        <div id="body">
            <img class="logogolclass" id="logogol" src="${pageContext.request.contextPath}/resources/img/logoHome.PNG"/>
            <img class="logogolclass2" src="${pageContext.request.contextPath}/resources/img/logoHome.PNG"/>
        </div>


        <!--            <div class="enterTxt" > ورود به سامانه
                        <button class="enterBtn"></button>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <div class="enterTxt" > راهنمای استفاده از سامانه
                        <button class="help"></button>
                    </div>-->

        <div id='wrapper'>
            <div class='cool_btn1 green'>
                <h1 class='top enter'>ورود به سامانه </h1>
                <!--                    <h2>H</h2>-->
            </div>
            <div class='cool_btn1 teal'>
                <h1 class='top'>راهنما</h1>
                <!--                    <h2>U</h2>-->
            </div>
            <div class='cool_btn1 blue'>
                <h1 class='top'>پرتال دانشگاه</h1>
                <!--                    <h2>G</h2>-->
            </div>
            <div class='cool_btn1 orange'>
                <h1 class='top'>تقویم آموزشی </h1>
                <!--                    <h2>)</h2>-->
            </div>
        </div>





        <div class="slider">
            <div>
                <p>
                    برای دریافت وام دانشجویی به دفتر دانشگاه مراجعه نمایید
                </p>
                <p>
                    ثبت نام کارشناسی ارشد بدون کنکور
                </p>
                <p>
                    تمدید مهلت دفاع دانشجویان کارشناسی
                </p>
                <p>
                    آغاز ثبت نام مقطع دکترا
                </p>
            </div>
        </div>




        <div  class="FormLogin" id="FormContainer">
            <form:form action="login/check" method="POST">
                <div class="container">
                    <label><b>نام کاربری : </b></label>
                    <input type="text" placeholder="نام کاربری خود را وارد کنید..." name="code" required>

                    <label><b>رمز عبور : </b></label>
                    <input type="password" placeholder="رمز عبور خود را وارد کنید..." name="password" required>
                    <input type="checkbox" checked="checked"> مرا به خاطر داشته باش
                    <button type="submit" class='loginbtn sub' id="submitbtn" >ورود</button>
                    <button type="button" class='cancelbtn'>انصراف</button>
                    <span class="psw">فراموشی <a href="#">رمز عبور ؟ </a></span>
                    <br/>
                    <span class="psw"> <a href="#"> تغییر رمز عبور ؟ </a></span>
                </div>
            </form:form>
        </div>
    </div>

</div>

<div class="footer">
    <p>
        تمامی حقوق به دانشگاه شهید بهشتی متعلق می باشد
        <br/>
        021-2990
    </p>

    <img id="logoFooter" src="${pageContext.request.contextPath}/resources/img/SBU.jpg"/>
</div>




<!--    <div id="Captcha">
        <label><b>کد امنیتی مقابل را وارد نمایید</b></label>
        <br/>
        <input id="CaptchaCode" name="CaptchaCode" type="text" style="width: 80px;" maxlength="6">
        <br/>
        <img alt="Web Form Code" style="margin-left: 20px; border: 1px solid #F0F0F0;" id="CaptchaImage" src="http://www.SnapHost.com/captcha/WebForm.aspx?id=QAP85CQKE9T9">
        <br/>
        <a href="#" onclick="return ReloadCaptchaImage('CaptchaImage');">تصویر مجدد</a>
    </div>

    <span>
        <img id="logoHome" src="../images/logoHome.PNG">
    </span>-->

<script>
    $('.enter').click(function(){
        $(this).fadeOut(function(){
            $('.slider').fadeOut();
            $('.cool_btn1 green').fadeOut();
            /* $('.help').fadeOut();*/
            $('.logogolclass').fadeOut();
            $('.logogolclass2').fadeIn();
            $('.FormLogin').fadeIn();
        });
    });

</script>




</body>
</html>