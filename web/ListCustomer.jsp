<%-- 
    Document   : ListCustomer
    Created on : 02-Sep-2016, 09:13:24
    Author     : int303
--%>

<%@page import="java.util.List"%>
<%@page import="sit.int303.demo.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
        <body style="background-color: #F5F5F5">

        <jsp:include page="/WEB-INF/jsp/Header.jsp?title=INT303: C u s t o m e r - L i s t i n g :::"/>
        <br>
        <form action="SearchCustomer" method="post">
            <table class="table" style="background-color: lightgray;width: 98%">
                <tr>
                    <td style="width: 5%"></td>
                    <td>Enter Customer name/id : </td>
                    <td><input type="text" name="searchParam" value="${param.searchParam}" /></td>
                    <td><input type="submit" /></td>
                </tr>
            </table>
        </form>
        <c:if test="${customers != null}">
            <table style="margin-left: 50px" class="table table-striped">
                <tr>
                    <td>No</td>
                    <td>Customer ID</td>
                    <td>Customer Name</td>
                    <td>City</td>
                    <td>State</td>
                    <td>Phone</td>
                    <td>Email</td>
                </tr>
                <c:forEach items="${customers}" var="customer" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${customer.customerId}</td>
                        <td>
                            <a href="SearchCustomer?searchParam=${customer.customerId}">
                                ${customer.name}
                            </a>
                        </td>
                        <td>${customer.city}</td>
                        <td>${customer.state}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.email}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <hr>
        <h3 style="color:red;margin-left: 50px">${message}</h3>
        <hr>
    </body>
</html>
