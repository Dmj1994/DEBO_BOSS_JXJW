<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(schools)==0}"><p style="padding:10px">暂无数据</p></c:if>
<c:forEach var="school" items="${schools}">
    <input type="radio" name="consultIds" lay-skin="primary" title="${school.organizationName}"
           value="school_${school.organizationCode}"
           class="consultIds">
</c:forEach>