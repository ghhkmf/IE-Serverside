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
            <li><a href="../TeacherPages/TeacherHome.html" >خانه</a> </li>
            <li> <a href="/student/showProfile" >پروفایل</a>  </li>
            <li> <a href="/teacher/showCoursePage" >دروس  </a></li>
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




<div id="srchCont">

    <form:form action="/Teacher/showCourse" method="POST" id="postForm">

        <table>

            <tr>
                <td>

                    <label><b>ترم : </b></label>
                    <select name="termsel" title="Term" id="termsel">
                        <option value="">ترم را انتخاب کنید</option>
                        <c:if test="${not empty termlist }">
                            <c:forEach items="${termlist}" var="item">  
                        <option value="<c:out value="${item.code}"> </c:out>" > <c:out value="${item.code}"> </c:out> </option>
                       
                            </c:forEach>
                        </c:if>
                    </select>
                </td>

                <td>
                    <input type="submit" name="my-button" value="جستجو" id="my-button"  >

                </td>

            </tr>


        </table>

    </form:form>

</div>

<br><br><br><br><br>




<div  class="WrapperTableInfo" >  
    <!--style="display: none;">-->

    <%--<form:form action="#">--%>
<h1 id='h22'> aaaaaaaaaaaaaaaaaaaaaaa </h1>
        <table id="coursesTable" dir="rtl">
            <thead>
            <tr>
                <th> <b>  نام درس   </b> </th>
                <th> <b> کد درس     </b> </th>
                <th>  <b>  نوع درس  </b> </th>
                <th> <b> تعداد واحد   </b></th>
                <th> <b> جزییات کلاس  </b></th>
                <th> <b> لیست دانشجویان  </b></th>
            </tr>
            </thead>
            
            <tbody>
                <c:if test="${not empty courses}">
                    <c:forEach items="${courses}" var="item2"> 
            <tr>
                   
                <td    data-title="نام درس"> <c:out value="${item2.name}"> </c:out>"</td>
                <td    data-title="کد درس">   <c:out value="${item2.code}"> </c:out>" </td>
                <td   data-title="نوع درس">  <c:out value="${item2.type}"> </c:out>" </td>
                <td   data-title="تعداد واحد">  <c:out value="${item2.unit}"> </c:out>" </td>
                <td  data-title="لیست دانشجویان"> <input  type="button" class="moreInfoButtonClass showListBtn"  name="studentsList" title="لیست دانشجویان" value="لیست دانشجویان" > </td>
                <td  data-title="جزییات کلاس "> <input type="button" class="moreInfoButtonClass moreInfoButtonClass" name="details" title="جزییات کلاس" value="جزییات کلاس"  > </td>
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
            </tr>

<!--            <tr class="moreInfoTr odd close">
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
            </tr>-->
               </c:forEach>
            </c:if>
            
            </tbody>

        </table>

    <%--</form:form>--%>




</div>





<div  id="listWrapper" class="close" style="display: none;">

    <span class=" closeModal "><b>&#10006;</b></span>
    <div class="caption">

        <span><b>ترم 221</b></span>
        <span><b>&nbsp; نیمسال دوم 95-94</b></span><br>
        <span><b>&nbsp; درس 1</b></span>
        <span><b>&nbsp; گروه  1</b></span>

    </div>




    <div  class="WrapperTableInfo"  >

        <form:form action="#">


            <table>

                <thead>

                <tr>

                    <th> <b> شماره سطر  </b> </th>
                    <th> <b>  نام    </b> </th>
                    <th> <b>    نام خانوادگی  </b> </th>
                    <th>  <b>  شماره دانشجویی  </b> </th>
                    <th> <b>نمره  </b></th>


                </tr>


                </thead>

                <tbody>

                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>

                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>
                <tr>

                    <td> <label>1</label> </td>
                    <td    data-title="نام دانشجو">  <input  type="text" name="studentFirstName" title="نام دانشجو" value="دانشجو 1" readonly>  </td>

                    <td    data-title="نام خانوادگی دانشجو">  <input  type="text" name="studentLastName"  title="نام خانوادگی دانشجو" value="نام خانوادگی دانشجو" readonly >  </td>

                    <td   data-title="شماره دانشجویی">  <input  type="text" name="studentId"  title="شماره دانشجویی" value="123456789"   readonly >  </td>

                    <td  data-title="نمره"> <input  type="number" name="markOfCourse" title="نمره"  class="mark" max="20" min="0" > </td>


                </tr>


                <!--

    -->

                </tbody>



            </table>

            <input  type="submit" value="ثبت" id="submitMarks">

        </form:form>


    </div>

    <br><br><br><br><br><br><br><br><br>


</div>


<br><br><br><br><br><br><br><br><br><br>
<div id="responseImg" >

    <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">


</div>
<div id="responseWrapper" class="close">

    <div id="response" >

        <span class="closeBtnResponseWrapper closeBtn"><b>&#10006;</b></span>

        <div id="textResponce">

            اطلاعات با موفقیت ثبت شد

        </div>




        <img src="${pageContext.request.contextPath}/resources/img/tick-icon.png">


    </div>



</div>

<script type="text/javascript">


    $(document).ready(function() {
    var termid = null;
      $('#postForm').submit(function (e) { 
      termid = $('#termsel').val();
        e.preventDefault();
        
        $.ajax({
            url: "/Teacher/showCourse",
            type:'POST',
            dataType: 'json',
            data: {
                termid: termid },
            success: function (response) {
                document.getElementById("h22").innerHTML="success";
                var table = document.getElementById("coursesTable");

                $.each(response, function() {
                    var row = table.insertRow(-1);
                    var name = row.insertCell(0);
                    name.setAttribute("id", "name");

                    var code = row.insertCell(1);
                    code.setAttribute("id", "code");
                    
                    var type = row.insertCell(2);
                    type.setAttribute("id", "type");

                    var unit = row.insertCell(3);
                    unit.setAttribute("id", "unit");

                    name.innerHTML = this.name;
                    code.innerHTML = this.code;
                    type.innerHTML = this.type;
                    unit.innerHTML = this.unit;

                });
  	     
  	    },
            error: function (error) {
                document.getElementById("h22").innerHTML="errror";

            }
        });
      
  });





        $('#onlyMySelf').change(function () {

            if ($(this).is(":checked")) {

                var v =  $('#nameTeacher');
                v.val("");
                v.prop('disabled','disabled');
            }
            else {
                $('#nameTeacher').prop('disabled',  false );
            }


        } );


//        $('#my-button').click(function (e) {
//
//            e.preventDefault();
//            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
//            $('.WrapperTableInfo').delay(6000).slideDown('slow');
//
//
//        });



//        $('.showListBtn').click(function (e) {
//
//            e.preventDefault();
//            $('#responseImg').fadeIn('slow').delay(5000).fadeOut('slow');
//            $('body').css('overflow','hidden');
//            $('#listWrapper').delay(6000).fadeIn('fast');
//
//
//        });


        $('.closeBtn').click(function () {

            $(this).closest('.close').fadeOut('slow');


        });


        $('.closeModal').click(function () {

            $(this).closest('.close').fadeOut('slow');
            $('body').css('overflow','auto');
            $('#listWrapper .WrapperTableInfo').fadeOut('fast');


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


        $('#submitMarks').click(function (e) {

            e.preventDefault();
            $('#responseImg').fadeIn('slow').delay(2000).fadeOut('slow');
            $('#textResponce').html("اطلاعات با موفقیت ثبت شد.");
            $('#responseWrapper').delay(3000).fadeIn('fast').delay(2000).fadeOut('slow');



        });





        $('.closeBtnResponseWrapper').click(function () {

            $('#responseWrapper').fadeOut('slow');


        });




        $('.mark').each(function () {

            $(this).change(function () {

                if($(this).val() > 20 || $(this).val() < 0 ){

                    $('#textResponce').html("نمره ی وارد شده صحیح نمی باشد ، نمره باید بین 0 تا 20 باشد.");
                    $('#responseWrapper').fadeIn('fast');
                }

            });



        });








    });





</script>




<!--ajax  script-->




</body>
</html>
