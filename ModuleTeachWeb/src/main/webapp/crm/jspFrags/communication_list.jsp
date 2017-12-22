<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>
<c:if test="${fn:length(crmCommunicationList)==0}"><p style="padding:10px">暂无数据</p></c:if>
<c:forEach var="comm" items="${crmCommunicationList}">
    <tr commId="${comm.uuid}">
        <td>${comm.creator}</td>
        <td><fmt:formatDate value="${comm.communicationTime}" pattern="yyyy-MM-dd HH:mm"/></td>
        <td>${kf:timeTrans(comm.diffToDistribute)}</td>
        <td>${comm.communicationWay}</td>
        <td align="center">
            <c:if test="${!empty comm.audioLinks}">
                <a href="javascript:void(0);" onclick="playRecord('${comm.uuid}')"><i
                        class="fa fa-play text-navy"></i><i
                        class="connerMins">${comm.audioLengths}</i></a>
            </c:if>
        </td>
    </tr>
</c:forEach>