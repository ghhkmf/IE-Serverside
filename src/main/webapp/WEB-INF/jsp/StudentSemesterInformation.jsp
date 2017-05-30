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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MessageResponse.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addCourseCss.css">
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

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div  class="WrapperTableInfo" style="width: 80%; margin: 0 auto;" >

    <form:form action="#">

        <table>

            <thead>

            <tr>

                <th> <b> شماره ترم  </b> </th>
                <th> <b> نام ترم    </b> </th>
                <th> <b> تعداد کل واحد     </b> </th>
                <th> <b> معدل ترم     </b> </th>
                <th>  <b>  مشاهده جزییات </b> </th>

            </tr>


            </thead>

            <tbody>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 1" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td    data-title=" تعداد کل واحد ">  <input  type="text" name="numOfUnits"  title="تعداد کل واحد" value="15" readonly>  </td>
                <td    data-title="معدل ترم  ">  <input  type="text" name="average"  title="معدل ترم" value="19.50" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td    data-title=" تعداد کل واحد ">  <input  type="text" name="numOfUnits"  title="تعداد کل واحد" value="15" readonly>  </td>
                <td    data-title="معدل ترم  ">  <input  type="text" name="average"  title="معدل ترم" value="19.50" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td    data-title=" تعداد کل واحد ">  <input  type="text" name="numOfUnits"  title="تعداد کل واحد" value="15" readonly>  </td>
                <td    data-title="معدل ترم  ">  <input  type="text" name="average"  title="معدل ترم" value="19.50" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td    data-title=" تعداد کل واحد ">  <input  type="text" name="numOfUnits"  title="تعداد کل واحد" value="15" readonly>  </td>
                <td    data-title="معدل ترم  ">  <input  type="text" name="average"  title="معدل ترم" value="19.50" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td    data-title=" تعداد کل واحد ">  <input  type="text" name="numOfUnits"  title="تعداد کل واحد" value="15" readonly>  </td>
                <td    data-title="معدل ترم  ">  <input  type="text" name="average"  title="معدل ترم" value="19.50" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>

            <tr>

                <td    data-title="شماره ترم">  <input  type="text" name="TermId" title="شماره ترم"  value="ترم 321" readonly>  </td>

                <td    data-title="نام ترم  ">  <input  type="text" name="TermName"  title="نام ترم" value="نیم سال اول 95-94" readonly>  </td>
                <td    data-title=" تعداد کل واحد ">  <input  type="text" name="numOfUnits"  title="تعداد کل واحد" value="15" readonly>  </td>
                <td    data-title="معدل ترم  ">  <input  type="text" name="average"  title="معدل ترم" value="19.50" readonly>  </td>
                <td   data-title="مشاهده جزییات"><input type="button" class="moreInfoButtonClass showListBtn" name="details" title="مشاهده جزییات" value="جزییات"  ></td>


            </tr>



            </tbody>


        </table>





    </form:form>

</div>

<br><br><br><br><br><br><br><br><br><br><br><br>






<br><br><br><br><br><br><br><br>
<br><br><br><br>


<div  id="listWrapper" class="close" style="display: none;">

    <span class=" closeModal "><b>&#10006;</b></span>
    <div class="caption">

        <span><b>ترم 2</b></span>
        <span><b>&nbsp; نیمسال دوم 95-94</b></span><br>

    </div>



    <div id="srchCont">

        <form:form action="#">


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

                        <input type="submit" value="جستجو" id="anotherTerm">

                    </td>

                </tr>


            </table>

        </form:form>

    </div>


    <br><br><br><br><br>
    <div  class="wrapperImageLoding">

        <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">

    </div>


    <div  class="WrapperTableInfo" >

        <div>   ترم 1 <br>  <br> <br>    </div>


        <form:form action="#">



            <table>

                <thead>

                <tr>

                    <th> <b>  نام درس   </b> </th>
                    <th> <b> کد درس     </b> </th>
                    <th>  <b>  نوع درس  </b> </th>
                    <th> <b> تعداد واحد   </b></th>
                    <th><b>نام استاد  </b></th>
                    <th><b>نمره درس  </b></th>

                </tr>


                </thead>

                <tbody>

                <tr>

                    <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس"  value="درس1" readonly>  </td>

                    <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="43112020311" readonly>  </td>
                    <td   data-title="نوع درس"><input  type="text" name="typeOfCourse" title="نوع درس" value="تخصصی" readonly></td>




                    <td  data-title="تعداد واحد درس">  <input  type="text" name="unitOfCourse" title="تعداد واحد درس" value="3" readonly > </td>
                    <td  data-title="نام استاد">  <input  type="text" name="techerName" title="نام استاد" value="استاد1 " readonly > </td>
                    <td  data-title="نمره">  <input  type="text" name="markCourse" title="نمره درس" value="18 " readonly > </td>

                </tr>
                <tr>

                    <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس"  value="درس1" readonly>  </td>

                    <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="43112020311" readonly>  </td>
                    <td   data-title="نوع درس"><input  type="text" name="typeOfCourse" title="نوع درس" value="تخصصی" readonly></td>




                    <td  data-title="تعداد واحد درس">  <input  type="text" name="unitOfCourse" title="تعداد واحد درس" value="3" readonly > </td>
                    <td  data-title="نام استاد">  <input  type="text" name="techerName" title="نام استاد" value="استاد1 " readonly > </td>
                    <td  data-title="نمره">  <input  type="text" name="markCourse" title="نمره درس" value="نامشخص " readonly > </td>

                </tr>
                <tr>

                    <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس"  value="درس1" readonly>  </td>

                    <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="43112020311" readonly>  </td>
                    <td   data-title="نوع درس"><input  type="text" name="typeOfCourse" title="نوع درس" value="تخصصی" readonly></td>




                    <td  data-title="تعداد واحد درس">  <input  type="text" name="unitOfCourse" title="تعداد واحد درس" value="3" readonly > </td>
                    <td  data-title="نام استاد">  <input  type="text" name="techerName" title="نام استاد" value="استاد1 " readonly > </td>
                    <td  data-title="نمره">  <input  type="text" name="markCourse" title="نمره درس" value="نامشخص " readonly > </td>

                </tr>
                <tr>

                    <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس"  value="درس1" readonly>  </td>

                    <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="43112020311" readonly>  </td>
                    <td   data-title="نوع درس"><input  type="text" name="typeOfCourse" title="نوع درس" value="تخصصی" readonly></td>




                    <td  data-title="تعداد واحد درس">  <input  type="text" name="unitOfCourse" title="تعداد واحد درس" value="3" readonly > </td>
                    <td  data-title="نام استاد">  <input  type="text" name="techerName" title="نام استاد" value="استاد1 " readonly > </td>
                    <td  data-title="نمره">  <input  type="text" name="markCourse" title="نمره درس" value="17 " readonly > </td>

                </tr>
                <tr>

                    <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس"  value="درس1" readonly>  </td>

                    <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="43112020311" readonly>  </td>
                    <td   data-title="نوع درس"><input  type="text" name="typeOfCourse" title="نوع درس" value="تخصصی" readonly></td>




                    <td  data-title="تعداد واحد درس">  <input  type="text" name="unitOfCourse" title="تعداد واحد درس" value="3" readonly > </td>
                    <td  data-title="نام استاد">  <input  type="text" name="techerName" title="نام استاد" value="استاد1 " readonly > </td>
                    <td  data-title="نمره">  <input  type="text" name="markCourse" title="نمره درس" value="19" readonly > </td>

                </tr>
                <tr>

                    <td    data-title="نام درس">  <input  type="text" name="courseName" title="نام درس"  value="درس1" readonly>  </td>

                    <td    data-title="کد درس">  <input  type="text" name="courseId"  title="کد درس" value="43112020311" readonly>  </td>
                    <td   data-title="نوع درس"><input  type="text" name="typeOfCourse" title="نوع درس" value="تخصصی" readonly></td>




                    <td  data-title="تعداد واحد درس">  <input  type="text" name="unitOfCourse" title="تعداد واحد درس" value="3" readonly > </td>
                    <td  data-title="نام استاد">  <input  type="text" name="techerName" title="نام استاد" value="استاد1 " readonly > </td>
                    <td  data-title="نمره">  <input  type="text" name="markCourse" title="نمره درس" value="20 " readonly > </td>

                </tr>




                </tbody>


            </table>



            <table>


                <thead>
                <tr>

                    <th> <b> مجموع واحد ها</b></th>
                    <th>  <b>معدل ترم </b> </th>

                </tr>
                </thead>
                <tbody>

                <tr>
                    <td  data-title=" مجموع واحد ها">  <input  type="text" name="totalUnits" title="مجموع واحد ها"  value="16 " readonly > </td>
                    <td  data-title="معدل ترم">  <input  type="text" name="averageSemester" title="معدل ترم"  value="19 " readonly > </td>
                </tr>

                </tbody>

            </table>



        </form:form>

        <br>

        <div  id="nextBackArrows">

            <img src="${pageContext.request.contextPath}/resources/img.png" id="backArrow" title="ترم قبل">
            <img src="${pageContext.request.contextPath}/resources/img/nextArrow.png" id="nextArrow" title="ترم بعد">



        </div>
    </div>

<br><br><br><br><br>
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




        $('#anotherTerm').click(function (e) {


            e.preventDefault();
            $('#listWrapper .WrapperTableInfo').slideUp('slow').delay(2000).slideDown('slow');

        });






    });


</script>





<!--

<script type="text/javascript">


    $(document).ready(function() {

        $('#my-button').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
           /* $('.WrapperTableInfo').delay(6000).slideDown();
*/

        });

    });


</script>


-->

<br><br>





</body>
</html>