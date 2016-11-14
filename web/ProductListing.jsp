<%-- 
    Document   : ProductListing
    Created on : 21-Oct-2016, 09:03:13
    Author     : int303
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sit.int303.demo.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Product Listing</title>
    </head>
    <body style="background-color: #F5F5F5" onload="changeSearchText()">
        <script>
            function changeSearchText() {
                var txt1 = document.getElementById('txt1');
                var txt2 = document.getElementById('txt2');
                var cat = document.getElementById('category');
                var label = document.getElementById('caption1');    // add 1
                //txt2.value =  cat.options[cat.selectedIndex].value;
                var selectedValue = cat.options[cat.selectedIndex].value;

                if (selectedValue === 'price') {
                    txt2.hidden = false;
                    txt2.type = 'number';
                    txt2.min = 0;
                    txt2.size = '10';

                    txt1.size = '10';
                    txt1.type = 'number';
                    txt1.min = 0;
                    label.innerHTML = '&nbsp; Price Range : &nbsp;'; // add 2
                } else if (selectedValue === 'name') {
                    txt2.hidden = true;
                    txt1.type = 'text';
                    txt1.size = '30';
                    label.innerHTML = '&nbsp; Prouduct Name/Type : &nbsp;'; // add 3
                } else {
                    txt2.hidden = true;
                    txt1.type = 'number';
                    txt1.min = 0;
                    txt1.size = '10';
                    label.innerHTML = '&nbsp; Enter product ID: &nbsp;'; // add 4
                }
            }
        </script>


        <jsp:include page="/WEB-INF/jsp/Header.jsp?title=INT303: Product  - L i s t i n g :::"/>
        <br>

        <form action="SearchProduct" method="post">
            <table style="margin-left: 50px">
                <tr><td>Category : </td>
                    <td>
                        <select name="searchCategory" onchange="changeSearchText()" id="category">
                            <option value="name" ${param.searchCategory=='name' ? 'selected': ''}>Product Description</option>
                            <option value="price" ${param.searchCategory=='price' ? 'selected': ''}>Price Range</option>
                            <option value="id" ${param.searchCategory=='id' ? 'selected': ''}>Product ID</option>
                        </select>
                    </td>
                    <td id="caption1">&nbsp;</td>
                    <td><input type="text" name="searchText1" id="txt1" value="${param.searchText1}" /></td>
                    <td id="caption2">&nbsp;</td>
                    <td><input type="text" name="searchText2" id="txt2" value="${param.searchText2}" /></td>
                    <td>&nbsp; &nbsp; &nbsp; </td><td> View : 
                        <select name="viewBy">
                            <option value="column" ${param.viewBy=='column' ? 'selected': ''}>Gallery View</option>
                            <option value="row" ${param.viewBy=='row' ? 'selected': ''}>List View</option>
                        </select>
                    </td>
                    <td>&nbsp; &nbsp; &nbsp;</td>
                    <td><input type="submit" value="Go"/></td>
                </tr>
            </table>
        </form>

        <c:if test="${! empty message}">
            <table class="table" style="width: 98%;background-color: yellow;color:red;margin-left: 50px">
                <tr><td><h3>::: ${message} :::</td></tr>
            </table>
        </c:if>

        <c:if test="${products != null}">
            <form action="AddToCart" method="post">
                <input type="hidden" name="searchCategory" value="${param.searchCategory}"/>
                <input type="hidden" name="viewBy" value="${param.viewBy}"/>
                <input type="hidden" name="searchText1" value="${param.searchText1}"/>
                <input type="hidden" name="searchText2" value="${param.searchText2}"/>
                <c:choose>
                    <c:when test="${param.viewBy=='row'}">
                        <table class="table" style="margin-left: 50px; width: 95%">
                            <tr><td><input type="submit" value="Add to Cart"/> </td></tr>
                                    <c:forEach items="${products}" var="p" varStatus="vs">
                                <tr>
                                    <td>
                                        <table style="width: 100%">
                                            <tr style="background-color: ${vs.count%2==1? '#CCCCCC' : '#EEEEEE'}">
                                                <td><img src="images/${p.productId}.jpg" width="200" height="160"></td>
                                                <td style="width: 50px"> &nbsp;</td>
                                                <td style="width: 75%"> ${p.productId} ( ${p.productType} ) <br>
                                                    ${p.description}<br>
                                                    Price: <fmt:formatNumber value="${p.price}" type="currency" /><br>
                                                    <input type="checkbox" name="pid" value="${p.productId}" title="Add ${p.description} to Your Cart"/>
                                                    Add to Cart
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <table class="table" style="margin-left: 50px; width: 95%">
                            <tr><td colspan="2"></td><td><input type="submit" value="Add to Cart"/> </td></tr>
                                    <c:forEach items="${products}" var="p" varStatus="vs">
                                        ${vs.count%3==1 ? "<tr>" : ""}
                                <td>
                                    <input type="checkbox" name="pid" value="${p.productId}" title="Add ${p.description} to Your Cart"/><br>
                                    <img src="images/${p.productId}.jpg" width="160" height="120"><br>
                                    ${p.productId} ( ${p.productType} ) <br>
                                    ${p.description}<br>
                                    Price: <fmt:formatNumber value="${p.price}" type="currency" />
                                </td>
                                ${vs.count%3==0 ? "</tr>" : ""}
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </form>
        </c:if>
    </body>
</html>
