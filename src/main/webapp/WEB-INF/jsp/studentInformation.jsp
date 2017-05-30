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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssNavigationBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/topSmootScrol.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/informationFormCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MessageResponse.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" > </script>
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
            <li><a href="../StudentPages/studentHome.html" >خانه</a> </li>
            <li> <a href="/student/showProfile" >پروفایل</a>  </li>
            <li><a href="../StudentPages/StudentSemesterInformation.html" >  ترم ها</a> </li>
            <li> <a href="../StudentPages/getCourse.html" >اخذ درس </a></li>
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

    <form:form  action="editProfile"  method="POST">
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
                    <td><input id="firstName" maxlength="50" name="fName" type="text" value=${user.fName}   /></td>
                </tr>

                <tr>
                    <td><label for="lastName"><b>نام خانوادگی  </b> </label></td>
                    <td><input id="lastName" maxlength="50" name="lName" type="text"  value=${user.lName}  /></td>
                </tr>

                <tr>
                    <td><label for="fatherName"><b>نام استاد راهنما </b> </label></td>
                    <td><input id="supervisor" maxlength="50" name="supervisorId" type="text" value=${student.supervisorId} readonly /></td>
                </tr>

                <tr>
                    <td><label for="nationalCode"><b>کد ملی  </b> </label></td>
                    <td><input id="nationalCode" name="nationalCode" type="number"  value=${user.nationalCode} /></td>
                </tr>
                
                <tr>
                    <td><label for="password"><b>رمز عبور  </b> </label></td>
                    <td><input id="password" name="password" type="text"  value=${user.password} /></td>
                </tr>    
                
                
                 <tr>
                    <td><label for="gender"><b>جنسیت  </b> </label></td>
                    <td><input id="gender" name="gender" type="text"  value=${user.gender} readonly/></td>
                </tr>  
                
<!--                <tr>
                    <td><label ><b>جنسیت : </b> </label></td>
                    <td><input   name="gender" type="radio"  value="مونث"  title="جنسیت" checked /><b>زن</b>
                        <input   name="gender" type="radio"  value="مذکر"  title="جنسیت" disabled /><b>مرد</b>
                    </td>

                </tr>-->


<!--                <tr>
                    <td><label ><b>وضعیت تحصیلی :  </b> </label></td>
                    <td>
                        <select name="state" title="وضعیت تحصیلی">
                            <option > مشغول تحصیل </option>
                            <option disabled="disabled" > فارغ التحصیل </option>
                        </select>
                    </td>

                </tr>-->
                <tr>
                    <td><label for="beginSemesterId"><b>نیمسال ورود  </b> </label></td>
                    <td><input id="beginSemesterId" name="beginSemesterId" type="text"  value=${student.beginSemesterId} readonly /></td>
                </tr> 


                <tr>

                    <td> <label for="studentId"><b>شماره دانشجویی  </b></label></td>
                    <td><input type="number" id="studentId"  name="code" value=${user.code}  title= readonly ></td>

                </tr>


                <tr>
                    <td><label for="fieldStudy"><b>رشته تحصیلی  </b></label></td>
                    <td><input id="fieldStudy" maxlength="50" name="orientationId" type="text" value=${student.orientationId} title="رشته" readonly /></td>
                </tr>

                

                <tr>
                    <td><label for="email"><b>آدرس ایمیل  </b></label></td>
                    <td><input id="email" maxlength="50" name="email" type="email" value=${user.email} title="ایمیل" /></td>
                </tr>

                <tr>
                    <td><label for="phonNumber"><b>شماره تلفن  </b></label></td>
                    <td ><input  id="phonNumber" type="tel" name="phone" value=${user.phone}  title="تلفن" ></td>
                </tr>

                </tbody>
            </table>

        <div  id="cont" style="background-color:#f1f1f1">

            <input type="submit"  name="save" value="ثبت"   id="my-button" >
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
            $('#responseImg').fadeIn('slow').delay(3000).fadeOut('slow');
            $('#responseWrapper').delay(4000).fadeIn('fast').delay(2000).fadeOut('slow');


        });


        $('.closeBtn').click(function () {

            $('#responseWrapper').fadeOut('slow');


        });

    });


</script>-->






</body>
</html>