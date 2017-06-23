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
        <ul>
            <li><a href="HeadOfDepartmentHome.jsp" >خانه</a> </li>
            <li> <a href="/student/showProfile" >پروفایل</a>  </li>
            <li><a href="/headOfDepartment" >  ترم ها</a> </li>
            <li  class="currentPage"> <a href="/headOfDepartment/ShowCoursePage"  >دروس </a></li>
            <li> <a href="/headOfDepartment/showInsertCoursePage" >تعریف درس جدید </a></li>
            <li> <a href="/headOfDepartment/showDefineNewTermPage" >ویرایش  ترم جدید </a></li>
            <li> <a href="/headOfDepartment" >ویرایش کلاس های ترم جدید </a></li>
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


<h1 id="sessionIdHidden" style=" display:none "> <c:out value="${sessionId}"> </c:out></h1>

<div id="srchCont">

    <form:form action="/headOfDepartment/showCourseAjax" method="POST" id="postForm">


        <table>

            <tr>
                <td>

                    <label><b>ترم : </b></label>
                    <select name="Term" title="Term"  id="termsel">
                       <option value="">ترم را انتخاب کنید</option>
                        <c:if test="${not empty termlist }">
                            <c:forEach items="${termlist}" var="item">  
                        <option value="<c:out value="${item.code}"> </c:out>" > <c:out value="${item.code}"> </c:out> </option>
                       
                            </c:forEach>
                        </c:if>
                    </select>

                </td>


                <td>
                    <select  name="teacherName" title="نام استاد" id="teachersel">

                       <option value="">استاد را انتخاب کنید</option>
                        <c:if test="${not empty teacherlist }">
                            <c:forEach items="${teacherlist}" var="item">  
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


<div  class="WrapperTableInfo"  dir="rtl">  
    <br> <br> <br>

        <table id="coursesTable" dir="rtl" >
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
      
            
            </tbody>

        </table>

  

</div>



    
<div  id="listWrapper" class="close" style="display: none;">

    <span class=" closeModal "><b>&#10006;</b></span>
   

    <div  class="WrapperTableInfo"  >

       

        <table id="studentTable" dir="rtl"  >

                <thead>
                <tr>
                    <th> <b> شماره سطر  </b> </th>
                    <th> <b>  نام    </b> </th>
                    <th> <b>    نام خانوادگی  </b> </th>
                    <th>  <b>  شماره دانشجویی  </b> </th>
                    <th> <b>نمره ثبت شده  </b></th>
                    <th> <b>نمره جدید  </b></th>
                </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
            
            <br/><br/> <br/>
            
            <input  type="button" value="ثبت" id="submitMarks" >

       

    </div>

    <br><br><br><br><br><br><br><br><br>


</div>

<br><br><br><br><br><br><br><br><br><br>
<div id="responseImg" >

    <img src="${pageContext.request.contextPath}/resources/img/ajaxload.gif">


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


        
         $('#postForm').submit(function (e) {
             
           e.preventDefault();
          var termid = $('#termsel').val();
          var techerid = $('#teachersel').val();
          var test = document.getElementById("sessionIdHidden").innerHTML;
          alert(test +"");
              
        $.ajax({
            url: "/headOfDepartment/showCourseAjax",
            type:'POST',
            dataType: 'json',
            data: {
                termid: termid,
                techerid  : techerid },
            success: function (response) {
                $("#coursesTable").find("tr:gt(0)").remove();
                var table = document.getElementById("coursesTable");
                var count = 0;
                $.each(response, function() {
                    var row = table.insertRow(-1);
                    

                    
                    count++;
                    row.innerHTML += " <td     data-title='شماره سطر'> <lable> " + count +" </lable> </td> "+
                                     " <td     data-title='نام درس'> <input  type='text' name='courseName'  title='نام درس' value='"+ this.name +"' readonly > </td>" +
                                     " <td     data-title='کد درس'>  "+  this.code +"</td>" +
                                     " <td     data-title='نوع درس'> <input  type='text' name='courseType'  title='نوع درس' value='"+  this.type +"' readonly >   </td>" + 
                                     " <td     data-title='تعداد واحد'> <input  type='text' name='courseUnit'  title='تعداد واحد' value='"+  this.unit +"' readonly ></td> " ;
              
                
                    var stdlist = row.insertCell(5);
                    var b = document.createElement("button");
                    b.innerHTML = "لیست دانشجویان";
                    b.onclick= showList;
                    stdlist.appendChild(b);
                    
                });
  	     
  	    },
            error: function () {
                alert("لطفا ترم را انتخاب نمایید");
            }
        });
      
  });
        
        
         function showList(){

         alert("inner showlist");
          var  currentRow = $(this).closest("tr");
          var  lessonid =  parseInt( $(currentRow).find('td:eq(2)').html());
          document.getElementById("thisLessonIdHidden").innerHTML = lessonid;
          var  termid =  parseInt($('#termsel').val());
          var  techerid =  parseInt($('#teachersel').val());
          
          alert(termid+1 +"");
         
        
        $.ajax({
            url: "/headOfDepartment/showStudentsajax",
            type:'POST',
            dataType: 'json',
            data: {
                'lessonidOut' : lessonid ,
                'termidOut' : termid ,
                'techeridOut' : techerid 
             },
            success: function (response) {
                
                alert("success");
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
                    
                    var lastmark = row.insertCell(4);
                    code.setAttribute("id", "code");
                    
                    var mark = row.insertCell(5);
                    //mark.setAttribute("id", "mark");
                  
                   
                    
                    counter.innerHTML = count ++;
                    fName.innerHTML = this.fname;
                    lName.innerHTML = this.lname;
                    code.innerHTML = this.code;
                    lastmark.innerHTML = this.mark;
                    
                    var b = document.createElement("input");
                    b.type = 'number';
                    b.class="mark";
                    b.max="20";
                    b.min="0";    
                
                    mark.appendChild(b);
                    
                   
             });
                                  
            },
             error: function () {
                 
               alert("fail");

            }
        });
      }
      
      $('#submitMarks').click(function (e) {
            var  techerid =  parseInt($('#teachersel').val());
            var  tid = parseInt($('#termsel').val());
            var st = [];
            var tr = [];
            var teacherId = [];
            var ls = [];
            var mr = [];
            var m;
            var thisLessonId = document.getElementById("thisLessonIdHidden").innerHTML;            
            var table = document.getElementById("studentTable");           
            var rows = table.rows;
            for (var i = 1 ; i< rows.length ; i++) {
                m = rows[i].cells[5].children[0].value; //if  not null so post to server
                if( m >= 0  )
                {
                    
                    tr[i-1] = tid;
                    st[i-1] = rows[i].cells[3].innerHTML.toString();
                    ls[i-1] = thisLessonId.toString();
                    mr[i-1] = m;
                    teacherId[i-1] = techerid;
                }
            }
          
            var MarkList = { termid: tr , studentId: st , mark: mr ,  thisLessonId : ls , techerid : teacherId };
                   
           $.ajax({             
                type: 'POST',
                url: '/headOfDepartment/InsertMark',
           
                data: MarkList ,
                success: function (response) { 
                    alert("success :)) ");
                    $('#responseImg').fadeIn('slow').delay(2000).fadeOut('slow');
                    $('#textResponce').html("اطلاعات با موفقیت ثبت شد.");
                    $('#responseWrapper').delay(3000).fadeIn('fast').delay(2000).fadeOut('slow');
                },
                error: function () {
                     alert("fail");
                }       
             });                       
        });
      
      
      

  
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
        
        

    });


</script>






</body>
</html>
