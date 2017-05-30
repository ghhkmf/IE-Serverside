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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addCourseCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MessageResponse.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/getCourseCss.css">

    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" > </script>
    <script  src="${pageContext.request.contextPath}/resources/js/HeaderShrink.js" ></script>
    <script  src="${pageContext.request.contextPath}/resources/js/addRemoveRowTable.js" ></script>
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
            <li><a href="../StudentPages/studentHome.html" >خانه</a> </li>
            <li> <a href="../StudentPages/studentInformation.html" >پروفایل</a>  </li>
            <li><a href="../StudentPages/StudentSemesterInformation.html" >  ترم ها</a> </li>
            <li> <a href="../StudentPages/getCourse.html" >اخذ درس </a></li>
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



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<div  class="WrapperTableInfo" >

    <form:form action="#">

        <table id="addCourseTable">

            <thead>

            <tr>

                <th><b>شماره سطر</b></th>
                <th> <b>  نام درس   </b> </th>
                <th> <b> کد درس     </b> </th>
                <th> <b> تعداد واحد   </b></th>
                <th> <b> ساعات ارائه   </b></th>
                <th><b>نوع عملیات</b></th>

            </tr>


            </thead>

            <tbody id="tbody1">

            <tr>

                <td><label>1</label></td>

                     <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

<!--                <td    data-title="نوع عملیات">  <input  type="text" name="actionName" title="نوع عملیات" value="ثبت" >  </td>-->

                <td ALIGN="center" data-title="نوع عملیات" >
                    <select  id="selectTypeAction"  style=" cursor:pointer;" >
                        <option value=""></option>
                        <option value="ثبت">ثبت</option>
                        <option value="انتظار">انتظار</option>
                        <option value="حذف">حذف</option>

                    </select>
                </td>

            </tr>

            <tr>

                <td><label>2</label></td>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

               <!-- <td    data-title="نوع عملیات">  <input  type="text" name="actionName" title="نوع عملیات" value="انتظار" >  </td>
-->
                <td ALIGN="center" data-title="نوع عملیات"  >
                    <select  id="selectType" style=" cursor:pointer;" >
                        <option value=""></option>
                        <option value="ثبت">ثبت</option>
                        <option value="انتظار">انتظار</option>
                        <option value="حذف">حذف</option>

                    </select>
                </td>


            </tr>

            </tbody>

        </table>

    </form:form>

</div>

<br><br>


<!-- fixed button-->
<div class="buttons">
   <button type="submit" class="loginbtn" id="loginBtn" onclick="setTimeout(addToGetTbl,6000);">ثبت اطلاعات</button>
    <a href="getCourse.html" class="refreshbtn">به روزرسانی</a>
</div>



<br><br><br><br><br>


<div  class="WrapperTableInfo">



    <form:form action="#">


        <table>

            <thead>

            <tr>

                <th><b>شماره سطر</b></th>
                <th> <b>  نام درس   </b> </th>
                <th> <b> کد درس     </b> </th>
                <th>  <b>  نوع درس  </b> </th>
                <th> <b> تعداد واحد   </b></th>
                <th> <b> استاد درس </b></th>
                <th> <b> ساعات ارائه   </b></th>
                <th> <b> تاریخ امتحان   </b></th>
                <th> <b> ظرفیت   </b></th>
                <th> <b> ظرفیت باقی مانده  </b></th>
                <th> <b> انتخاب  </b></th>

            </tr>


            </thead>

            <tbody >

            <tr>

                <td><label>1</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add"  id="add1" title="انتخاب درس" onclick="addingCourse()"> <b>+</b></th>


            </tr>



            <tr>
                <td><label>2</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>3</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>4</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>5</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>6</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>7</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>8</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>

            <tr>
                <td><label>9</label></td>
                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>

                <td  data-title="استاد درس"> <input  type="text" name="profOfCourse" title="استاد درس" value="نام استاد"  readonly> </td>

                <td  data-title="ساعت ارائه"> <input  type="text" name="presentDateOfCourse" title="دوشنبه:10-12:30 سه شنبه:10-12:30" value="دوشنبه:10-12:30 سه شنبه:10-12:30"  readonly> </td>

                <td  data-title="تاریخ امتحان"> <input  type="text" name="examDateOfCourse" title="دوشنبه-21/3/96-9:30" value="دوشنبه-21/3/96-9:30"  readonly> </td>

                <td  data-title="ظرفیت"> <input  type="text" name="fullOfCourse" title="ظرفیت" value="30"  readonly> </td>

                <td  data-title="ظرفیت باقی مانده"> <input  type="text" name="freeOfCourse" title="ظرفیت باقی مانده" value="20"  readonly> </td>

                <th class="add" title="انتخاب درس"> <b>+</b></th>

            </tr>


            </tbody>



        </table>

    </form:form>



    <br><br><br><br><br><br><br><br><br><br>
</div>




<div id="responseImg" >

    <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">


</div>


<script type="text/javascript">


    $(document).ready(function () {

        $('#my-button').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
            $('.WrapperTableInfo').delay(6000).slideDown('slow');

        });

        $('#loginBtn').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
            $('.WrapperTableInfo').delay(6000).slideDown('slow');

        });

    });


    function addingCourse() {

        var newRow = " <tr>  " +
            " <td    data-title='شماره سطر'>  <input  type='number' name='courseNumber' title='شماره سطر' value='3' readonly>  </td>" +
            "<td    data-title='نام درس'>  <input  type='text' name='courseName' title='نام درس' value='درس1' readonly>  </td> " +

            "<td    data-title='کد درس'>  <input  type='text'name='courseId'  title='کد درس' value='1234' readonly >  </td>" +

            " <td  data-title='تعداد واحد درس'> <input  type='number' name='unitOfCourse' title='تعداد واحد درس' value='3'  readonly> </td> " +

            " <td  data-title='ساعت ارائه'> <input  type='text' name='presentDateOfCourse' title='دوشنبه:10-12:30 سه شنبه:10-12:30'' value='دوشنبه:10-12:30 سه شنبه:10-12:30'  readonly> </td> " +
            //
            "    <td ALIGN='center' data-title='نوع عملیات'  > <select style=' cursor:pointer;' > " +
            "<option value=''></option>" +
            "<option value='ثبت'>ثبت</option>" +
            "<option value='انتظار'>انتظار</option>" +
            "<option value='حذف'>حذف</option>" +
            "</select> </td> " +
            "</tr>"
        $("#tbody1").append(newRow);
    }


    $("#addCourseRow").addRow();

</script>


<script>

    function addToGetTbl() {

        var selectValue = document.getElementById("selectType").value;

        if (selectValue == "ثبت")
        {
            document.getElementById("selectType").value = "ثبت";
            /*document.getElementById("selectType").style.backgroundColor = "#97af94";*/
        }
        if (selectValue == "حذف")
        {
            document.getElementById("selectType").closest('td').closest('tr').remove();
        }
        if (selectValue == "انتظار")
        {
            document.getElementById("selectType").value = "انتظار";
        }
    }


</script>



</body>
</html>