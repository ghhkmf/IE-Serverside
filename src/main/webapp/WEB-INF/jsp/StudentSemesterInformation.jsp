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
    <h2 id="test">just for check</h2>
    <form>

        <table  id="semestersInfoTable">

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



       
       
      
        



            </tbody>


        </table>





    </form>

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

        <form:form>


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


        <form:form >



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

                <tbody id="detailsTable">




                </tbody>


            </table>



            <table>


                <thead>
                <tr>

                    <th> <b> مجموع واحد ها</b></th>
                    <th>  <b>معدل ترم </b> </th>

                </tr>
                </thead>
                <tbody id="overallInfo">

                <tr>
                    <td  data-title=" مجموع واحد ها">  <input id="totalUnits" type="text" name="totalUnits" title="مجموع واحد ها" readonly > </td>
                    <td  data-title="معدل ترم">  <input id="AVG" type="text" name="averageSemester" title="معدل ترم" readonly > </td>
                </tr>

                </tbody>

            </table>



        </form:form>

        <br>

        <div  id="nextBackArrows">

            <img src="${pageContext.request.contextPath}/resources/img/img.png" id="backArrow" title="ترم قبل">
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
         $(document).on("click","#showListBtn", function (e) {
             e.preventDefault();
             
            var selectedTR = $(this).closest('tr');
            var termid = selectedTR.find("#code").text();
            document.getElementById("test").innerHTML=termid;


            $.ajax({
            url: '/student/loadDetails',
            type:'POST',
            data:{
                termid: termid
            },
            dataType: 'json',
            success: function (response) {
               

                 var table = document.getElementById("detailsTable");
                 var totalUnits = 0.0;
                 var termAVG = 0.0;
                 
                $.each(response, function() {
                    var row = table.insertRow(-1);
                    var courseName = row.insertCell(0);
                    courseName.setAttribute("id", "courseName");

                    var courseCode = row.insertCell(1);
                    courseCode.setAttribute("id", "courseCode");
                    
                    var courseType = row.insertCell(2);
                    courseType.setAttribute("id", "courseType");

                    var courseCredit = row.insertCell(3);
                    courseCredit.setAttribute("id", "courseCredit");
                    
                    var teacherName = row.insertCell(4);
                    teacherName.setAttribute("id", "teacherName");
                    
                    var courseMark = row.insertCell(5);
                    courseMark.setAttribute("id", "courseMark");
                             
                    courseName.innerHTML = this.courseName;
                    courseCode.innerHTML = this.courseCode;
                    courseType.innerHTML = this.courseType;
                    courseCredit.innerHTML = this.courseCredit;
                    teacherName.innerHTML = this.teacherName;
                    courseMark.innerHTML = this.courseMark;
                    
                    totalUnits += this.courseCredit;
                    termAVG += (this.courseCredit * this.courseMark);
                });
                document.getElementById("AVG").value = termAVG/totalUnits;
                document.getElementById("totalUnits").value = totalUnits;

  	    },
            error: function (error) {
                    document.getElementById("test").innerHTML="failesss;";

            }
            });
                       
            $('#responseImg').fadeIn('slow').delay(2000).fadeOut('slow');
            $('body').css('overflow','hidden');
            $('#listWrapper').delay(1000).fadeIn('fast');


        });
        $.ajax({
            url: "/student/loadSemestersInfo",
            type:'GET',
            dataType: 'json',
            success: function (response) {
               
                 var table = document.getElementById("semestersInfoTable");

                $.each(response, function() {
                    var row = table.insertRow(-1);
                    var code = row.insertCell(0);
                    code.setAttribute("id", "code");

                    var name = row.insertCell(1);
                    name.setAttribute("id", "name");
                    
                    var sumOfUnits = row.insertCell(2);
                    sumOfUnits.setAttribute("id", "sumOfUnits");

                    var avg = row.insertCell(3);
                    avg.setAttribute("id", "avg");
                    
                    var details = row.insertCell(4);
                    
                    code.innerHTML = this.termId;
                    var str = "";
                     if((parseInt(this.termId)% 10) == 1)
                        str+= "نیمسال اول ";
                    else if((parseInt(this.termId) % 10) == 2)
                        str+= "نیمسال دوم ";
                     document.getElementById("test").innerHTML=str;

                    str += Math.floor(this.termId / 10);
                   

                    
                    name.innerHTML = str;
                    sumOfUnits.innerHTML = this.passedUnits;
                    avg.innerHTML = this.avg;
                    
                    var b = document.createElement("button");
                    b.innerHTML = "جزییات";
                    b.setAttribute("id", "showListBtn");
                    details.appendChild(b);
                });

  	     
  	    },
            error: function (error) {
                    document.getElementById("test").innerHTML="failesss;";

            }
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
