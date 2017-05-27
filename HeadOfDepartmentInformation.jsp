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
    <meta charset="UTF-8">
    <title>سیستم گلستان دانشگاه شهید بهشتی</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/GolestanLogo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Font.css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssNavigationBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/topSmootScrol.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/informationFormCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MessageResponse.css">
    <script  src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" > </script>
    <script  src="${pageContext.request.contextPath}/resources/js/HeaderShrink.js" ></script>
</head>
<body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<header>
    <nav class="navigationBar">
        <div id="DateTime"  >
            <script  id="date" src="http://jalali.toolsir.com/date.class.php?timestamp=&zone=Asia/Tehran&lang=fa&date= l، j M Y" type="text/javascript"></script> </br>
            <!--<div id="date"> </div>-->
            <div id="time"> </div>
        </div>


        <div id="itemOfMenuBar" >

            <a href="#" >&#9776;</a>

        </div>
        <ul >
            <li  ><a href="../ManagerPages/HeadOfDepartmentHome.html" >خانه</a> </li>
            <li class="currentPage"> <a href="/student/showProfile" >پروفایل</a>  </li>
            <li><a href="../ManagerPages/ListTerms.html" >  ترم ها</a> </li>
            <li > <a href="../ManagerPages/CoursesManager.html" >دروس </a></li>
            <li> <a href="../ManagerPages/newOrEditCourse.html" >تعریف درس جدید </a></li>
            <li > <a href="../ManagerPages/defineNewTerm.html" >ویرایش  ترم جدید </a></li>
            <li > <a href="../ManagerPages/EditSemester.html" >ویرایش کلاس های ترم جدید </a></li>
            <li><a href="/login/logout" >خروج</a> </li>
        </ul>
    </nav>


</header>
<img src="${pageContext.request.contextPath}/resources/img/top_arrow.png" id="topArrow" >

<script type="text/javascript">

    setInterval(updateTime , 1000);
    function updateTime(){

        var dt = new Date();
        document.getElementById("time").innerHTML= dt.getHours() + " : " + dt.getMinutes() + " : " + dt.getSeconds();
        document.getElementById("date").innerHTML= dt.getFullYear() + " / " + dt.getMonth() + " / " + dt.getDay();

    }


    $("header").shrinkNav();
    $(".navigationBar").slideMenuBar();



</script>




<div  id="FormContainer">

    <form:form action="editProfile"  method="POST">
        <div class="imgcontainer">
            <img src="${pageContext.request.contextPath}/resources/img/femaleicon2.png" alt="Avatar" class="avatar">
        </div>

        <!--
                <div  id="tableContiner" style="overflow-x:auto;">  </div>

            -->
        <table border="0" align="center">
            <tbody>

<tr>
                <td><label for="firstName"><b>نام  </b></label></td>
                <td><input id="fName" maxlength="50" name="fName" type="text" value=${user.fName}   /></td>
            </tr>

            <tr>
                <td><label for="lastName"><b>نام خانوادگی  </b> </label></td>
                <td><input id="lName" maxlength="50" name="lName" type="text"  value=${user.lName}  /></td>
            </tr>

            <tr>
                <td><label for="nationalCode"><b>کد ملی </b> </label></td>
                <td><input id="nationalCode" maxlength="50" name="nationalCode" type="text" value=${user.nationalCode}  /></td>
            </tr>

            <tr>
                <td><label for="password"><b>رمز عبور </b> </label></td>
                <td><input id="password" name="password" type="number"  value=${user.password}/></td>
            </tr>

            <tr>
                <td><label for="gender"><b>جنسیت  </b> </label></td>
                <td><input id="gender" name="gender" type="text"  value=${user.gender} readonly/></td>
            </tr> 


            <tr>
                <td><label for="beginSemesterId"><b>نیمسال شروع به تدریس  </b> </label></td>
                <td><input id="beginSemesterId" name="beginSemesterId" type="text"  value=${teacher.beginSemesterId} readonly /></td>
            </tr> 

            <tr>
                
            <tr>

                <td> <label for="teacher"><b>شماره استادی </b></label></td>
                <td><input type="number" id="studentId"  name="code" value=${user.code}  title="شماره_استادی" readonly ></td>

            </tr>


                <tr>
                    <td><label for="fieldStudy"><b>گرایش </b></label></td>
                    <td><input id="fieldStudy" maxlength="50" name="orientationId" type="text" value=${teacher.eduGroup} title="گرایش" readonly /></td>
                </tr>


                <tr>
                    <td><label for="degree"><b>سمت فعلی </b></label></td>
                    <td><input id="degree" maxlength="50" name="degree" type="text" value=${teacher.degree} title="سمت" readonly /></td>
                </tr>               
                
            <tr>
                <td><label for="email"><b>آدرس ایمیل  </b></label></td>
                <td><input id="email" maxlength="50" name="email" type="email" value=${user.email} title="ایمیل" /></td>
            </tr>


            <tr>
                <td><label for="phonNumber"><b>شماره تلفن  </b></label></td>
                <td ><input  id="phonNumber" type="tel" name="phoneNumber" value=${user.phone}  title="تلفن"></td>
            </tr>

            </tbody>
        </table>



        <div  id="cont" style="background-color:#f1f1f1">

            <input type="submit"  name="submit" value="ثبت"   id="my-button" >
            <input type="reset"  class="cancelbtn" value="تنظیم مجدد" >
            <input type="button" class="cancelbtn" value="انصراف">


        </div>


    </form:form>


</div>


<div id="responseImg" >

    <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">


</div>



<div id="responseWrapper" >

    <div id="response" >

        <span class="closeBtn"><b>&#10006;</b></span>

        <div id="textResponce">

            اطلاعات با موفقیت ثبت شد

        </div>




        <img src="${pageContext.request.contextPath}/resources/img/tick-icon.png">


    </div>



</div>



<!--<script type="text/javascript">


    $(document).ready(function() {

        $('#my-button').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
            $('#responseWrapper').delay(6000).fadeIn('fast').delay(2000).fadeOut('slow');


        });


        $('.closeBtn').click(function () {

            $('#responseWrapper').fadeOut('slow');


        });

    });


</script>-->




</body>
</html>