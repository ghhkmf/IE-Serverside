<%-- 
    Document   : student
    Created on : Nov 22, 2016, 10:46:20 PM
    Author     : mahdifar424
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Spring MVC Form Handling</title>
    </head>
    <body>
        
        <h2>Student Information</h2>
        <form:form method="POST" action="./addStudent">
            <table>

                <tr>
                    <td><label id="name">Name<label></td>
                    <td><input name="name"/></td>
                </tr>
                <tr>
                    <td><label id="age">Name<label></td>
                    <td><input name="age"/></td>
                </tr>
                <tr>
                    <td><label id="id">id</label></td>
                    <td><input name="id" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Submit"/>
                    </td>
                </tr>
            </table>  
        </form:form>
    </body>
</html>
