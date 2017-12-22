<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="miniTable" style="width:100%;font-size: 12px">
    <thead>
    <th align="left">转量时间</th>
    <th align="left">原咨询师</th>
    <th align="left">现咨询师</th>
    <th align="left">操作人</th>
    </thead>
    <tbody>
    <c:forEach items="${transLogs}" var="transLog">
        <tr class="dataRow">
            <td><fmt:formatDate value="${transLog.transTime}" pattern="yyyy-MM-dd"/></td>
            <td>${transLog.originConsult}</td>
            <td>${transLog.presentConsult}</td>
            <td>${transLog.operator}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
