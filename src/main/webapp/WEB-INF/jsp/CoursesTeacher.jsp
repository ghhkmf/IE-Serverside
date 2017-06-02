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
    <link rel="icon" href='<c:url value="${pageContext.request.contextPath}/resources/css/Font.css" />'/>
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

<h1 id="thisLessonIdHidden" style=" display:none "> </h1>

<h1 id='h22'>  </h1>


<div  class="WrapperTableInfo"  dir="rtl">  
    <!--style="display: none;">-->

    <%--<form:form action="#">--%>


        <table id="coursesTable" dir="rtl">
            <thead>
            <tr>
                <th> <b> شماره سطر  </b> </th>
                <th> <b>  نام درس   </b> </th>
                <th> <b> کد درس     </b> </th>
                <th>  <b>  نوع درس  </b> </th>
                <th> <b> تعداد واحد   </b></th>
                <th> <b> لیست دانشجویان  </b></th>
            </tr>
            </thead>
            
            <tbody>
                <%--<c:if test="${not empty courses}">--%>
                <%--<c:forEach items="${courses}" var="item2">--%> 
<!--            <tr>
                   
                <td    data-title="نام درس">  </td>
                <td    data-title="کد درس">  </td>
                <td   data-title="نوع درس">  </td>
                <td   data-title="تعداد واحد">  </td>
                <td  data-title="لیست دانشجویان"> </td>
                <td  data-title="جزییات کلاس "> </td>
                <td  data-title="جزییات کلاس "> <input type="button" class=" moreInfoButtonClass" name="details" title="جزییات کلاس" value="جزییات کلاس"  > </td>
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
            </tr>-->

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
               <%--</c:forEach>--%>
            <%--</c:if>--%>
            
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

        <%--<form:form action="#">--%>

            <table id="studentTable">

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

                </tbody>
            </table>
            
            <br/><br/> <br/>
            
            <input  type="button" value="ثبت" id="submitMarks" >

        <%--</form:form>--%>


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
        
        
      $('#postForm').submit(function (e) {
          
          var termid = $('#termsel').val();
         
        e.preventDefault();
        
        $.ajax({
            url: "/Teacher/showCourse",
            type:'POST',
            dataType: 'json',
            data: {
                termid: termid },
            success: function (response) {
                $("#coursesTable").find("tr:gt(0)").remove();
//                document.getElementById("h22").innerHTML="success";
                var table = document.getElementById("coursesTable");
                var count = 1;
                $.each(response, function() {
                    var row = table.insertRow(-1);
                    
                    var counter = row.insertCell(0);
                    counter.setAttribute("id", "counter");
                    
                    var name = row.insertCell(1);
                    name.setAttribute("id", "name");

                    var code = row.insertCell(2);
                    code.setAttribute("id", "code");
                    
                    var type = row.insertCell(3);
                    type.setAttribute("id", "type");

                    var unit = row.insertCell(4);
                    unit.setAttribute("id", "unit");
                    
                    var stdlist = row.insertCell(5);
//                    stdlist.setAttribute("id", "stdlist");

                    counter.innerHTML = count ++;
                    name.innerHTML = this.name;
                    code.innerHTML = this.code;
                    type.innerHTML = this.type;
                    unit.innerHTML = this.unit;
                    
                    
                    var b = document.createElement("button");
                    b.innerHTML = "لیست دانشجویان";
                    b.onclick= showList;
                    stdlist.appendChild(b);

                });
  	     
  	    },
            error: function (error) {
                document.getElementById("h22").innerHTML="error";

            }
        });
      
  });

/////////////////////////////////////////////////

     // function callAjax(e) { 
      function showList(){
         // e.preventDefault();
          var currentRow = $(this).closest("tr");
          var thisLessonId = $(currentRow).find('td:eq(2)').html();
          var  tid = $('#termsel').val();
         
        document.getElementById("thisLessonIdHidden").innerHTML = thisLessonId;
        
        $.ajax({
            url: "/Teacher/showStudents",
            type:'POST',
            dataType: 'json',
            data: {
                thisLessonId : thisLessonId ,
                tid : tid },
            success: function (response) {
                
                $('#responseImg').fadeIn('slow').delay(1000).fadeOut('slow');
                $('body').css('overflow','hidden');
                $('#listWrapper').delay(2000).fadeIn('fast');
                
                $("#studentTable").find("tr:gt(0)").remove();
                
                var table = document.getElementById("studentTable");
                var count = 1;
                $.each(response, function() {
                    
                   // document.getElementById("h22").innerHTML= this.fName;
                   
                    var row = table.insertRow(-1);
                           
                    var counter = row.insertCell(0);
                    counter.setAttribute("id", "counter");
                    
                    var fName = row.insertCell(1);
                    fName.setAttribute("id", "fName");

                    var lName = row.insertCell(2);
                    lName.setAttribute("id", "lName");
                    
                    var code = row.insertCell(3);
                    code.setAttribute("id", "code");
                    
                   var mark = row.insertCell(4);
                  // mark.setAttribute("id", "mark");
                    
                    counter.innerHTML = count ++;
                    fName.innerHTML = this.fName;
                    lName.innerHTML = this.lName;
                    code.innerHTML = this.code;
                    
                    var b = document.createElement("input");
                    b.type = 'number';
                    b.class="mark";
                    b.max="20";
                    b.min="0";               
                    mark.appendChild(b);
                    
                    });
                                  
            },
             error: function (response) {
                alert("Error");
            }
        });
      }

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

        //function submitMark(){
        $('#submitMarks').click(function (e) {
      //     e.preventDefault();
//            $(this).closest('.close').fadeOut('slow');
//            $('body').css('overflow','auto');
//            $('#listWrapper .WrapperTableInfo').fadeOut('fast');
//            alert(mark.innerHTML);
            var  tid = $('#termsel').val();
             // = [] ;
            var st = [];
            var tr = [];
            var ls = [];
            var mr = [];
            var thisLessonId = document.getElementById("thisLessonIdHidden").innerHTML;            
            var table = document.getElementById("studentTable");           

            var rows = table.rows;
            for (var i = 1 ; i< rows.length ; i++) {
                tr[i-1] = tid.toString();
                st[i-1] = rows[i].cells[3].innerHTML.toString();
                ls[i-1] = thisLessonId.toString();
                mr[i-1] = rows[i].cells[4].children[0].value;
              // MarkList[i-1] = {termid: tid , studentId : rows[i].cells[3].innerHTML , thisLessonId: thisLessonId , mark: rows[i].cells[4].innerHTML};               
               // MarkList[i-1] = { id: 1 , status: "me" , mark: rows[i].cells[4].innerHTML  , termLessonTeacherId : 3 , studentId : rows[i].cells[3].innerHTML };               

            }
          
          // MarkList =  { id: 1 , status: "me" , mark: rows[1].cells[4].innerHTML  , termLessonTeacherId : 3 , studentId : rows[1].cells[3].innerHTML };

            var MarkList = { termid: tr , studentId: st , mark: mr ,  thisLessonId : ls };
                   
           $.ajax({             
                type: 'POST',
                url: '/Teacher/InsertMark',
              //  dataType: 'json', 
               // contentType: 'application/json;', // charset=utf-8',
                data: MarkList ,
                success: function (response) { 
                    $('#responseImg').fadeIn('slow').delay(2000).fadeOut('slow');
                    $('#textResponce').html("اطلاعات با موفقیت ثبت شد.");
                    $('#responseWrapper').delay(3000).fadeIn('fast').delay(2000).fadeOut('slow');
                },

                error: function () {
                 //   document.getElementById("h22").innerHTML="error";
                     alert("Error in inserting Mark");
                }       
             });                       
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


</body>
</html>
