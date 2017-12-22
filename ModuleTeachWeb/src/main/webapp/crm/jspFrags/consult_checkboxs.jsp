<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(consults)==0}"><p style="padding:10px">暂无数据</p></c:if>
<c:forEach var="consult" items="${consults}">
    <input type="checkbox" name="consultIds" lay-skin="primary" title="${consult.userName}" value="${consult.uuid}"
           class="consultIds">
</c:forEach>