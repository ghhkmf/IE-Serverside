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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addSemesterTable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MessageResponse.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addCourseCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/js-persian-cal.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" > </script>
    <script src="${pageContext.request.contextPath}/resources/js/js-persian-cal.min.js"></script>
    <script  src="${pageContext.request.contextPath}/resources/js/HeaderShrink.js" ></script>
</head>
<body>


<header>
    <nav class="navigationBar">

        <div id="DateTime"  >
            <script  id="date" src="http://jalali.toolsir.com/date.class.php?timestamp=&zone=Asia/Tehran&lang=fa&date= l، j M Y" type="text/javascript"></script> <br>
            <!--<div id="date"> </div>-->
            <div id="time"> </div>
        </div>


        <div id="itemOfMenuBar" >

            <a href="#" >&#9776;</a>

        </div>
        <ul >
            <li ><a href="../ManagerPages/HeadOfDepartmentHome.html" >خانه</a> </li>
            <li> <a href="../ManagerPages/HeadOfDepartmentInformation.html" >پروفایل</a>  </li>
            <li><a href="../ManagerPages/ListTerms.html" >  ترم ها</a> </li>
            <li > <a href="../ManagerPages/CoursesManager.html" >دروس </a></li>
            <li> <a href="../ManagerPages/newOrEditCourse.html" >تعریف درس جدید </a></li>
            <li class="currentPage"> <a href="../ManagerPages/defineNewTerm.html" >ویرایش  ترم جدید </a></li>
            <li> <a href="../ManagerPages/EditSemester.html" >ویرایش کلاس های ترم جدید </a></li>
            <li><a href="../HomePage.html" >خروج</a> </li>
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


<div style="width: 100% ;height: 345px; margin: 0; padding: 0; border: 0;  clear: both; ">  </div>




<div  id="WrapperTableOfNewClass" >


    <div class="WrapperHead">

        <span class="faculityName">دانشکده مهندسی و علوم کامپیوتر</span>
        <span class="semesterCount"><b>ترم 321</b></span>


    </div>

    <form action="insertTerm" method="POST">

        <table>
            <tbody>

            <tr>
                <td>
                    <label><b> سال: </b></label>
                </td>
                
                <td>
                    <select  name="termYear" title="نام درس" >
                        <option value=""> سال را انتخاب کنید</option>
                        <option value="96">۱۳۹۶</option>
                        <option value="97">۱۳۹۷</option>
                        <option value="98">۱۳۹۸</option>
                        <option value="99">۱۳۹۹</option>
                        <option value="100">۱۴۰۰</option>
                        <option value="101">۱۴۰۱</option>
                        <option value="102">۱۴۰۲</option>
                        <option value="103">۱۴۰۳</option>
                        <option value="104">۱۴۰۴</option>
                        <option value="105">۱۴۰۵</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    <label><b>نیم سال: </b></label>
                </td>

                <td>
                    <select  name="semester" title="نیمسال" >
                        <option value="1">نیم سال اول</option>
                        <option value="2">نیم سال دوم</option>
                        <option value="3">تابستانی</option>
                    </select>
                </td>
                
            </tr>
            <tr>
                 <td>
                    <label><b>نوع ترم: </b></label>
                </td>
                 <td>
                    <select  name="type" title="نوع ترم" >
                        <option value="summer">تابستان</option>
                        <option value="ordinary">عادی</option>
                    </select>
                </td>
            </tr>

            </tbody>
        </table>

        <div class="buttons">
            <input  type="reset"   value="تنظیم مجدد" >
            <input  type="submit"  value="ثبت"  id="my-button">
            <input  type="button"  value="انصراف" >
            <input  type="button"  value=" حذف " id="deletTerm">
        </div>

    </form>

</div>




<div id="responseImg" >

    <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">


</div>



<div id="responseWrapper" class="close">

    <div id="response" >

        <span class="closeBtn "><b>&#10006;</b></span>

        <div id="textResponce">

            اطلاعات با موفقیت ثبت شد

        </div>




        <img src="${pageContext.request.contextPath}/resources/img/tick-icon.png">


    </div>



</div>



<script type="text/javascript">



    $(document).ready(function() {




//        $('#my-button').click(function (e) {
//
//            e.preventDefault();
//            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
//            $('#responseWrapper').delay(6000).fadeIn('fast').delay(2000).fadeOut('slow');
//
//
//        });


        $('#deletTerm').click(function (e) {

            e.preventDefault();
            $('#textResponce').html("حذف با موفقیت انجام شد");
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
            $('#responseWrapper').delay(6000).fadeIn('fast').delay(2000).fadeOut('slow');


        });




    });


</script>




<br><br><br>



</body>
</html>




