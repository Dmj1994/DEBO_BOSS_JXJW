<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tr>
    <td width="90">关注点</td>
    <td align="left">${comm.studentFocus}</td>
</tr>
<tr>
    <td>背景补充</td>
    <td align="left">${comm.backgroundAttach}</td>
</tr>
<tr>
    <td>沟通内容</td>
    <td align="left">${comm.communicationContent}</td>
</tr>

<tr>
    <td>邀约理由</td>
    <td align="left">${comm.inviteReason}</td>
</tr>

<tr>
    <td>当面咨询师</td>
    <td align="left">${comm.sceneConsult}</td>
</tr>
<tr>
    <td>下次沟通</td>
    <td align="left">${comm.nextCommunication}</td>
</tr>
<tr>
    <td>下次时间</td>
    <td align="left"><fmt:formatDate value="${comm.nextTime}" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
<tr>
    <td>下次计划</td>
    <td>${comm.nextPlan}</td>
</tr>