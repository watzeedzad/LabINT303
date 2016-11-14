<%-- 
    Document   : index
    Created on : 14-Oct-2016, 09:23:04
    Author     : int303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INT303: Home</title>
    </head>
    <c:set var="loginOrLogout" value="${sessionScope.user==null ? 'Login' : 'Logout'}"/>
    <body style="background-color: #F5F5F5">
        
        <jsp:include page="/WEB-INF/jsp/Header.jsp?title=INT303: H o m e - P a g e :::"/>
        
        <div style="margin-left: 50px;width: 30%">
            <p> M a i n - Menu (${pageContext.servletContext.contextPath})</p>
            <hr>
            <p>  <a href="member/Page1"> Page #01 </a></p>
            <p>  <a href="member/Page2"> Page #02 </a></p>
            <p>  <a href="member/Page3"> Page #03 </a></p>
            <p>  <a href="member/Page4"> Page #04 </a></p>
            <hr>
            <p><a href="SearchPokemon">Pokemon Index</a></p>
            <hr>
            <p> <a href="SearchCustomer">Search Customer</a></p>
            <p> <a href="SearchProduct">Our Products</a></p>
            <p> <a href="${loginOrLogout}">${loginOrLogout}</a></p>        
            <hr>
        </div>
    </body>
</html>
