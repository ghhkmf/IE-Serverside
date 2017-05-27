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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pannel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssNavigationBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/topSmootScrol.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" > </script>
    <script  src="${pageContext.request.contextPath}/resources/js/HeaderShrink.js" ></script>



</head>
<body>

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
            <li class="currentPage"><a href="#" >خانه</a> </li>
            <li> <a href="/student/showProfile" >پروفایل</a>  </li>
            <li> <a href="../TeacherPages/CoursesTeacher.html" >دروس  </a></li>
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


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div class="pannelClass" id="pannelId">
    <br><br><br><br><br><br><br>

</div>
<!--<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>-->
<!--<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>-->

</body>
</html>