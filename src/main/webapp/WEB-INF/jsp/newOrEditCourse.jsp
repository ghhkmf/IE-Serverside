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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addCourseCss.css">
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
            <li  ><a href="../ManagerPages/HeadOfDepartmentHome.html" >خانه</a> </li>
            <li > <a href="../ManagerPages/HeadOfDepartmentInformation.html" >پروفایل</a>  </li>
            <li><a href="../ManagerPages/ListTerms.html" >  ترم ها</a> </li>
            <li > <a href="../ManagerPages/CoursesManager.html" >دروس </a></li>
            <li class="currentPage"> <a href="../ManagerPages/newOrEditCourse.html" >تعریف درس جدید </a></li>
            <li > <a href="../ManagerPages/defineNewTerm.html" >ویرایش  ترم جدید </a></li>
            <li > <a href="../ManagerPages/EditSemester.html" >ویرایش کلاس های ترم جدید </a></li>
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

<div id="srchCont">

    <form:form  action="showCourse"  method="POST">

        <table>
            <tr>
                <td>
                    <label><b>نوع درس  : </b></label>
                    <select name="type" title="Term">
                        <option value="all">همه</option>
                        <option value="Public">عمومی</option>
                        <option value="Specialized">تخصصی</option>
                        <option value="basic">پایه</option>

                    </select>
                </td>

                <td>

                    <input type="submit" value="جستجو" id="searcBtnAjax"  >

                </td>

            </tr>


        </table>

    </form:form>

</div>

<br><br><br><br><br><br>





<div  class="WrapperTableInfo">
     <form:form  action="insertCourse"  method="POST">

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
                <td    data-title="نام درس">  <input  type="text" name="name"  maxlength="50" placeholder="نام درس را وارد کنید..." >  </td>
                <td    data-title="کد درس">  <input  type="number" name="code"   placeholder="کد درس را وارد کنید..." >  </td>
                <td   data-title="نوع درس">
                    <select  name="type" title="نوع درس" >
                        <option value="basic">پایه    </option>
                        <option value="Specialized">تخصصی</option>
                        <option value="Public">عمومی</option>
                    </select>
                </td>

                <td  data-title="تعداد واحد درس">
                    <input  type="number" name="unit" max="4" min="0"  placeholder="تعداد واحد درس را وارد کنید..." >
                </td>
              
            </tr>
            
            </tbody>
        </table>
        <div  class="bottumOfFormAdd" style="margin-top: 20px">

            <input type="submit"   name="submit1" value="ثبت" >

        </div>
     </form:form>


    <form:form   action="/headOfDepartment/editCourse" method="POST" id = "postForm">

        <!--<div id="addRow"><b>+</b></div>-->

        <table id="coursesTable">
            <thead>

            <tr>
                <th> &nbsp;</th>
                <th> <b>  نام درس   </b> </th>
                <th> <b> کد درس     </b> </th>
                <th>  <b>  نوع درس  </b> </th>
                <th> <b> تعداد واحد   </b></th>
                <th></th>
            </tr>
            
            </thead>

            <tbody>

             <c:if test="${not empty lesson}">
                <c:forEach items="${lesson}" var="item">  
                    <tr>
                        <td>
                            <input type="radio" id="selectedForEdit" name="selectedForEdit">
                        </td>
            
                        <td data-title="نام درس">
                            <input  type="text" name="name" id="name" maxlength="50" value="<c:out value="${item.name}">
                                </c:out>"> 
                              
                            </input>
                        </td>
                        <td data-title="کد درس">  <input  type="number" name="code" id="code" value="<c:out value="${item.code}">
                                </c:out>"> 
                            
                        </td>
                        <td data-title="نوع درس">
                            <select  id="type" name="type" title="نوع درس" >
                               
                                <option value="basic"  <c:if test="${item.type} == \"basic\""> selected="selected" </c:if>>پایه </option>
                                <option value="Specialized"<c:if test="${item.type} == \"Specialized\""> selected="selected" </c:if>>تخصصی</option>
                                <option value="Public"<c:if test="${item.type} == \"Public\""> selected="selected" </c:if>>عمومی</option>
                            </select>

                        </td>

                        <td  data-title="تعداد واحد درس">
                            <input id="unit" type="number" name="unit" max="4" min="0" value="<c:out value="${item.unit}">
                                </c:out>">
                            
                        </td>
                        <td   class="removRowTable"    onClick="$(this).closest('tr').remove();"  ><span class="removeRow"><b>&#10006;</b></span></td>
                    </tr>                  
                </c:forEach>
            </c:if>
            </tbody>


        </table>

        <br><br><br>

        <div  class="bottumOfFormAdd">

            <input type="submit" name="submit" value="ثبت" >
            <input  type="button"  name="cancleBtn" value="انصراف" >

        </div>

    </form:form>

     

</div>


<script type="text/javascript">

    $("#addRow").addRow();

</script>
<br><br><br><br><br><br><br><br><br><br><br><br>

<script type="text/javascript">
  var selectedTR = null;
  var name = null;
  var code = null;
  var type = null;
  var unit = null;

   $(document).ready(function () { 
  $(document).on('click', 'input:radio[id^="selectedForEdit"]', function (event) {
        selectedTR = $(this).closest('tr');
  
  });
  
    $('#postForm').submit(function (e) { 
    if(selectedTR != null)
    {
        name = selectedTR.find("#name").val();
        code = selectedTR.find("#code").val();
        type = selectedTR.find("#type").find(":selected").text();
        unit = selectedTR.find("#unit").val();
        e.preventDefault();
        
        $.ajax({
            url: "/headOfDepartment/editCourse",
            type:'POST',
//            contentType: 'application/json',
            data: {
                name: name,
                code: code,
                type: type,
                unit: unit
            },
            success: function (response) {
  	      alert("ajax worked response: ");
  	    }
        });
    }
});

    });
</script>

</body>
</html>



