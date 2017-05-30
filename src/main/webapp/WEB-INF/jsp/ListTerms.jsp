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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addCourseCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MessageResponse.css">
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
            <li><a href="../ManagerPages/HeadOfDepartmentHome.html" >خانه</a> </li>
            <li> <a href="/student/showProfile" >پروفایل</a>  </li>
            <li><a href="../ManagerPages/ListTerms.html" >  ترم ها</a> </li>
            <li> <a href="../ManagerPages/CoursesManager.html" >دروس </a></li>
            <li> <a href="../ManagerPages/newOrEditCourse.html" >تعریف درس جدید </a></li>
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

<div  class="WrapperTableInfo" style="width: 80%; margin: 0 auto;" >

    <form:form action="#">

        <table>

            <thead>

            <tr>

                <th> <b> شماره ترم  </b> </th>
                <th> <b> نام ترم    </b> </th>
                <th>  <b>  مشاهده جزییات </b> </th>

            </tr>


            </thead>

            <tbody>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>


            </tbody>


        </table>





    </form:form>

</div>

<br><br><br><br><br><br><br><br><br><br><br><br>


<div  id="listWrapper" class="close" style="display: none;">

    <span class=" closeModal "><b>&#10006;</b></span>
    <div class="caption">

        <span><b>ترم 221</b></span>
        <span><b>&nbsp; نیمسال دوم 95-94</b></span><br>
        <span><b>&nbsp; مجوع کلاسها : 22</b></span>

    </div>


    <div  id="srchCont">

        <table>




            <tr>
                <td>

                    <label><b> کلاس : </b></label>
                    <select name="Class" title="کلاس">



                        <option value="Class0"></option>
                        <option value="Class1">همه</option>
                        <option value="Class2">آخرین</option>
                        <option value="Class3">اولین</option>
                        <option value="Class4">کلاس شماره 1</option>
                        <option value="Class5">کلاس شماره2</option>
                        <option value="Class6">کلاس شماره 2</option>
                        <option value="Class7">کلاس شماره 3</option>
                        <option value="Class8">کلاس شماره 4</option>
                        <option value="Class9">کلاس شماره 5</option>
                        <option value="Class10">کلاس شماره 6</option>
                        <option value="Class11">کلاس شماره 7</option>
                        <option value="Class12">کلاس شماره 8</option>
                        <option value="Class13">کلاس شماره 9</option>
                        <option value="Class14">کلاس شماره 10</option>
                        <option value="Class15">کلاس شماره 11</option>
                        <option value="Class16">کلاس شماره 12</option>
                        <option value="Class17">کلاس شماره 13</option>
                        <option value="Class18">کلاس شماره 15</option>
                        <option value="Class19">کلاس شماره 16</option>
                        <option value="Class20">کلاس شماره 17</option>
                        <option value="Class21">کلاس شماره 18</option>
                        <option value="Class22">کلاس شماره 19</option>
                        <option value="Class23">کلاس شماره 20</option>
                        <option value="Class24">کلاس شماره 22</option>

                    </select>

                </td>

                <td>

                    <label><b>درس : </b></label>
                    <select name="Course" title="نام درس">


                        <option value="Course0"></option>
                        <option value="Course1">همه</option>
                        <option value="Course2">درس 1</option>
                        <option value="Course3">درس 2</option>
                        <option value="Course4">درس 3</option>
                        <option value="Course5">درس 4</option>
                        <option value="Course6">درس 5</option>
                        <option value="Course6">درس 6</option>
                        <option value="Course7">طراحی زیان های برنامه نویسی </option>
                        <option value="Course8">نظریه زبان ها و ماشین ها</option>

                    </select>

                </td>

                <td>

                    <label><b>استاد :  </b></label>
                    <select  name="teacherName" title="نام استاد" >

                        <option value="Teacher"> </option>
                        <option value="Teacher0">همه </option>
                        <option value="Teacher1">نام و نام خاونوادگی استاد</option>
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

                    <input type="button" value="جستجو" id="my-button2"  >

                </td>





            </tr>


        </table>
    </div>



    <br><br><br><br><br><br><br>


    <div  class="WrapperTableInfo" style="display: none;" >

        <form:form action="#">


            <table>

                <thead>

                <tr>

                    <th>شماره کلاس</th>
                    <th>نام درس</th>
                    <th>گروه درس</th>
                    <th>نام استاد</th>
                    <th>جزییات</th>
                    <th>ویرایش</th>



                </tr>


                </thead>

                <tbody>




                <tr  class="odd">
                    <td data-title="شماره کلاس : ">کلاس شماره 1</td>
                    <td data-title="نام درس : ">درس 1</td>
                    <td data-title="گروه درس : ">گروه 1</td>
                    <td data-title="نام استاد : ">استاد1</td>

                    <td data-title="جزییات :  ">
                        <button class="moreInfoButtonClass">جزییات</button>
                    </td>

                    <td class="moreInfoTd close">

                        <div >
                            <span class="closeBtn "><b>&#10006;</b></span>
                            <span>کد کلاس : 431122113 </span><br><br>
                            <span>روز های کلاس : </span><br>
                            <span> شنبه : 10:30 تا12:00  ، </span><br>
                            <span>دوشنبه : 10:30 تا 12:00</span><br>
                            <br>
                            <span>امتحان : </span><br>
                            <span>شنبه : 1395/3/3</span>
                            <span>ساعت 09:00 تا 12:00 </span>
                        </div>


                    </td>
                    <td data-title="ویرایش : "> <input  type="checkbox" title="انتخاب برای ویرایش"> </td>

                </tr>

                <tr class="moreInfoTr odd close">



                    <td colspan="6">

                        <div >
                            <span class="closeBtn "><b>&#10006;</b></span>
                            <span>کد کلاس : 431122113 </span><br><br>
                            <span>روز های کلاس : </span><br>
                            <span> شنبه : 10:30 تا12:00  ، </span><br>
                            <span>دوشنبه : 10:30 تا 12:00</span><br>
                            <br>
                            <span>امتحان : </span><br>
                            <span>شنبه : 1395/3/3</span>
                            <span>ساعت 09:00 تا 12:00 </span>
                        </div>



                    </td>


                </tr>


                <tr   class="even">
                    <td data-title="شماره کلاس : ">کلاس شماره 1</td>
                    <td data-title="نام درس : ">درس 1</td>
                    <td data-title="گروه درس : ">گروه 1</td>
                    <td data-title="نام استاد : ">استاد1</td>

                    <td data-title="جزییات :  " >
                        <button class="moreInfoButtonClass">جزییات</button>
                    </td>
                    <td  class="moreInfoTd close">

                        <div >
                            <span class="closeBtn "><b>&#10006;</b></span>
                            <span>کد کلاس : 431122113 </span><br><br>
                            <span>روز های کلاس : </span><br>
                            <span> شنبه : 10:30 تا12:00  ، </span><br>
                            <span>دوشنبه : 10:30 تا 12:00</span><br>
                            <br>
                            <span>امتحان : </span><br>
                            <span>شنبه : 1395/3/3</span>
                            <span>ساعت 09:00 تا 12:00 </span>
                        </div>


                    </td>
                    <td data-title="ویرایش : "> <input  type="checkbox" title="انتخاب برای ویرایش"> </td>

                </tr>
                <tr class="moreInfoTr even close">



                    <td colspan="6">

                        <div >
                            <span class="closeBtn "><b>&#10006;</b></span>
                            <span>کد کلاس : 431122113 </span><br><br>
                            <span>روز های کلاس : </span><br>
                            <span> شنبه : 10:30 تا12:00  ، </span><br>
                            <span>دوشنبه : 10:30 تا 12:00</span><br>
                            <br>
                            <span>امتحان : </span><br>
                            <span>شنبه : 1395/3/3</span>
                            <span>ساعت 09:00 تا 12:00 </span>
                        </div>



                    </td>


                </tr>










                </tbody>


            </table>


            <input  type="submit" value="ویرایش" id="submitMarks">

        </form:form>


    </div>

    <br><br><br><br><br><br><br><br><br>


</div>


<div id="responseImg" >

    <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">


</div>


<script type="text/javascript">



    $(document).ready(function() {


        $('.showListBtn').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
            $('body').css('overflow','hidden');
            $('#listWrapper').delay(6000).fadeIn('fast');


        });


        $('.closeBtn').click(function () {

            $(this).closest('.close').fadeOut('slow');


        });


        $('.closeModal').click(function () {

            $(this).closest('.close').fadeOut('slow');
            $('body').css('overflow','auto');
            $('#listWrapper .WrapperTableInfo').fadeOut('fast');


        });




        $('#my-button2').click(function () {


            $('.WrapperTableInfo').slideDown('slow');


        });



        $(window).on('resize', function (){

            if( $(window).width() > 760 ){

                $('.moreInfoTd').css("display" , "none");

            }
            else{

                $('.moreInfoTr').css("display" , "none");

            }



        });




        $('.moreInfoButtonClass').click(  function(){


            if( $(window).width() > 760 ){


                //$(this).closest("tr").next().css("display", "table-row");
                $(this).closest("tr").next().fadeIn('slow');
            }
            else {

                // $(this).closest("td").next().css("display", "block");
                $(this).closest("td").next().fadeIn('slow');

            }



        });





    });


</script>





</body>
</html>