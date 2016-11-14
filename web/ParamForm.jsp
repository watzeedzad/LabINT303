<%-- 
    Document   : ParamForm
    Created on : 07-Oct-2016, 09:04:44
    Author     : int303
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Map<String, String> subjects = new HashMap();
            subjects.put("int102", "Java Programming 1");
            subjects.put("int105", "Java Programming 2");
            subjects.put("int303", "Web Programming");
            subjects.put("gen101", "Physical Education");
            subjects.put("lng101", "General English");
            subjects.put("int107", "Computing Platform Technology");
            application.setAttribute("subjects", subjects);
            Map<String, String> faculty = new HashMap();
            faculty.put("sit", "School of Information Technology");
            faculty.put("eng", "Faculty of Engineering");
            faculty.put("sci", "Faculty of Science");
            application.setAttribute("faculty", faculty);
        %>
        <h1>Student Form ::</h1> <hr>
        <form action="ViewParam.jsp?programId=1457995" method="post">
            Student ID: <input type="text" name="sid" value="${param.sid}"/> <br><br>
            Student Name: <input type="text" name="sname" value="${param.sname}"/> <br><br>
            Faculty: <select name="faculty">
                <option value="sit">${faculty.sit}</option>
                <option value="eng">${faculty.eng}</option>
                <option value="sci">${faculty.sci}</option>
            </select> <br><br>
            Favourite Subjects: <br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" name="subjects" value="int102"/>Java Programming 1<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" name="subjects" value="int105"/>Java Programming 2<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" name="subjects" value="int303"/>Web Programming<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" name="subjects" value="gen101"/>Physical Education<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" name="subjects" value="lng101"/>General English<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" name="subjects" value="int107"/>Computing Platform Technology<br><br>
            <input type="submit"/>
        </form>
    </body>
</html>
