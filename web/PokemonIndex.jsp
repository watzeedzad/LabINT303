<%-- 
    Document   : PokemonIndex
    Created on : 11-Nov-2016, 09:54:55
    Author     : int303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Pokedex</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Header.jsp?title=INT303: Pokemon Index :::"/>
        <br>
        <table class="table">
            <tr>
                <td>
                    <form action='SearchPokemon' method='post'>
                        &nbsp;&nbsp;&nbsp;&nbsp;Search pokemon by name: 
                        <input type='text' name='searchParam' value='' />
                        <input type='submit'/>
                    </form>
                </td>
            </tr>
        </table>

        <c:if test="${pokemons != null}">
            <table class="table">
                <c:forEach items="${pokemons}" var="p" varStatus="vs">
                    ${vs.count%5==1 ? "<tr>": ""}
                    <td align='center'>
                        #${p.id < 10 ? "00" : p.id < 100 ? "0" : ""}${p.id} <br>
                        <img src='go/${p.name}.png' height=80>
                        <br> ${p.name}<br><br></td>
                        ${vs.count%5==0 ? "<tr>": ""}
                    </c:forEach>

            </table><br><p><hr>
            <c:if test="${param.serachParam!=null}">
                <h3 style='color:red'> ${param.searchParam}% DOES NOT EXIST !!! ... Try Again</h3>
            </c:if>
        </c:if>
    </body>
</html>
