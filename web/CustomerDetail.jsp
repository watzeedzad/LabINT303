<%-- 
    Document   : CustomerDetail.jsp
    Created on : 09-Sep-2016, 10:09:37
    Author     : int303
--%>

<%@page import="sit.int303.demo.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/jsp/Header.jsp?title=INT303: Customer Detail :::"/>
        <table>
            <tr>
                <td>Customer ID: </td>
                <td><input type="text" name="customerId" disabled size="10" value="${customer.customerId}"/></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td ><input type="text" name="customerId"  size="30" value="${customer.name}"/></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td >
                    <textarea name="addressLine1" rows="2" style="width: 450px">${customer.addressLine1}</textarea>
                    <br>
                    <textarea name="addressLine2" rows="2" style="width: 450px">${customer.addressLine2}</textarea>
                </td>
            </tr>
            <tr>
                <td>City: </td>
                <td ><input type="text" name="city"  size="15" value="${customer.city}"/></td>
            </tr>
            <tr>
                <td>State: </td>
                <td><input type="text" name="city"  size="8" value="${customer.state}"/></td>
            </tr>
            <tr>
                <td>Zip: </td>
                <td><input type="text" name="city"  size="12" value="${customer.zip}"/>
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                           <input type="button" style="background-color:bisque" value="back" onclick="history.back()"/>
                </td>
            </tr>
        </table>
    </td>
</table>
<h3 style="color:red">${message}</h3>
</body>
</html>
