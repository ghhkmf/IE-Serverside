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
    <link rel="icon" href="../../images/GolestanLogo.png">
    <link rel="stylesheet" href="../../cssFiles/Font.css">
    <link rel="stylesheet" href="../../cssFiles/cssNavigationBar.css">
    <link rel="stylesheet" href="../../cssFiles/topSmootScrol.css">
    <link rel="stylesheet" href="../../cssFiles/addCourseCss.css">
    <link rel="stylesheet" href="../../cssFiles/searchCss.css">
    <link rel="stylesheet" href="../../cssFiles/MessageResponse.css">
    <script src="../../jsFiles/jquery-1.11.3.min.js" > </script>
    <script  src="../../jsFiles/HeaderShrink.js" ></script>
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
            <li ><a href="../ManagerPages/HeadOfDepartmentHome.html" >خانه</a> </li>
            <li> <a href="../ManagerPages/HeadOfDepartmentInformation.html" >پروفایل</a>  </li>
            <li><a href="../ManagerPages/ListTerms.html" >  ترم ها</a> </li>
            <li class="currentPage"> <a href="/teacher/showCoursePage"  >دروس </a></li>
            <li> <a href="../ManagerPages/newOrEditCourse.html" >تعریف درس جدید </a></li>
            <li> <a href="../ManagerPages/defineNewTerm.html" >ویرایش  ترم جدید </a></li>
            <li> <a href="../ManagerPages/EditSemester.html" >ویرایش کلاس های ترم جدید </a></li>
            <li><a href="../HomePage.html" >خروج</a> </li>
        </ul>
    </nav>


</header>
<img src="../../images/top_arrow.png" id="topArrow" >

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




<div id="srchCont">

    <form action="#">


        <table>

            <tr>
                <td>

                    <label><b>ترم : </b></label>
                    <select name="Term" title="Term">

                        <option value="T4">آخرین</option>
                        <option value="T4">اولین</option>
                        <option value="T1">نیمسال اول 95-96</option>
                        <option value="T2">نیمسال دوم 95-96</option>
                        <option value="T3">نیمسال اول 95-94</option>
                        <option value="T3">نیمسال دوم 95-94</option>
                        <option value="T3">نیمسال اول 94-93</option>
                        <option value="T3">نیمسال دوم 94-93</option>
                    </select>

                </td>


                <td>
                    <select  name="teacherName" title="نام استاد" id="nameTeacher">

                        <option value=""> نام استاد را انتخاب کنید</option>
                        <option value="Teacher1">استاد 1</option>
                        <option value="Teacher2">استاد 2</option>
                        <option value="Teacher3">استاد 3</option>
                        <option value="Teacher4">استاد 4</option>
                        <option value="Teacher5">استاد 5</option>
                        <option value="Teacher6">استاد 6</option>
                        <option value="Teacher7">استاد 7</option>
                        <option value="Teacher8">استاد 8</option>
                        <option value="Teacher9">استاد 9</option>
                        <option value="Teacher10">استاد 10</option>


                    </select>

                </td>


                <td>
                    <label><b>فقط برای خودم :  </b></label>
                    <input type="checkbox" title="صرفا دروس خودم" id="onlyMySelf">

                </td>




                <td>

                    <input type="submit" value="جستجو" id="my-button"  >

                </td>





            </tr>


        </table>

    </form>

</div>


<br><br><br><br><br>




<div  class="WrapperTableInfo" style="display: none;">




    <form action="#">


        <table>

            <thead>

            <tr>

                <th> <b>  نام درس   </b> </th>
                <th> <b> کد درس     </b> </th>
                <th>  <b>  نوع درس  </b> </th>
                <th> <b> تعداد واحد   </b></th>


            </tr>


            </thead>

            <tbody>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>



            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>

            <tr>

                <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس" value="درس1" readonly>  </td>

                <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="1234" readonly >  </td>

                <td   data-title="نوع درس">  <input  type="text" name="typeOfCourse"  title="نوع درس" value="پایه"  readonly >  </td>

                <td  data-title="تعداد واحد درس"> <input  type="number" name="unitOfCourse" title="تعداد واحد درس" value="3"  readonly> </td>


            </tr>






            </tbody>



        </table>

    </form>




</div>



<br><br><br><br><br><br><br><br><br><br>
<div id="responseImg" >

    <img src="../../images/ajaxload.gif">


</div>


<script type="text/javascript">


    $(document).ready(function() {


        $('#onlyMySelf').change(function () {

            if ($(this).is(":checked")) {
                $('#nameTeacher').prop('disabled','disabled');
            }
            else {
                $('#nameTeacher').prop('disabled',  false );
            }


        } );


        $('#my-button').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
            $('.WrapperTableInfo').delay(6000).slideDown('slow');


        });

    });


</script>






</body>
</html>