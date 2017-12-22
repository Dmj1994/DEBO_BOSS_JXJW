<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<b>校区</b>
<hr/>
<c:if test="${fn:length(allSchools)==0}"><p style="padding:10px">暂无数据</p></c:if>
<c:forEach var="school" items="${allSchools}">
    <input type="radio" name="consultIds" lay-skin="primary" title="${school.organizationName}"
           value="school!${school.organizationCode}"
           class="consultIds">
</c:forEach>
<hr/>

<b>咨询小组</b>
<hr/>
<c:if test="${fn:length(allTeams)==0}"><p style="padding:10px">暂无数据</p></c:if>
<c:forEach var="team" items="${allTeams}">
    <input type="radio" name="consultIds" lay-skin="primary" title="${team.teamName}" value="team!${team.uuid}"
           class="consultIds">
</c:forEach>
<hr/>

<b>咨询师</b>
<hr/>
<c:if test="${fn:length(allConsults)==0}"><p style="padding:10px">暂无数据</p></c:if>
<c:forEach var="consult" items="${allConsults}">
    <input type="radio" name="consultIds" lay-skin="primary" title="${consult.userName}" value="consults!${consult.uuid}"
           class="consultIds">
</c:forEach>
<hr/>