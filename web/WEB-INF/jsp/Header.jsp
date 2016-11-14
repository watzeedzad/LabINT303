<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOrLogout" value="${sessionScope.user==null ? 'Login' : 'Logout'}"/>
<table style="background-color: lightgray">
    <tr>
        <td style="width: 3%"></td>
        <td style="width: 10%"><a href="${pageContext.servletContext.contextPath}/index.jsp">
                <img src="${pageContext.servletContext.contextPath}/logo.png" width="120px"></a></td>
        <td style="width: 1%"></td>
        <td style="width: 70%;font-size: x-large;color: black">${param.title}</td>
        <td style="width: 10%;text-align: center;align-items: center">
            <c:if test="${CART != null}">
                <br><br>
                <a href="ViewCart.jsp" title="View/Update Your Cart">
                    <img src="${pageContext.servletContext.contextPath}/images/cart.png" width="30px"></a><br>
                    <b>&nbsp; (${CART.size})</b>
            </c:if>
        </td>
        <td style="width: 10%">
            <a href="${loginOrLogout}" title="${loginOrLogout}">
                <img src="${pageContext.servletContext.contextPath}/user.png" width="80px"></a><br>
            Hello <c:out value="${user.name}" default="Guest"/>
        </td>
        <td style="width: 3%"></td>
    </tr>
</table>
