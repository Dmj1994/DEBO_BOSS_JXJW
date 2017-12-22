<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-striped table-hover" style="width:100%" id="adviceList">
    <tbody>
    <c:forEach items="${pager.rows}" var="advice">
        <tr class="dataRow" adContent="${advice.adviceContent}">
            <td>${advice.adviceTitle}</td>
            <td align="right"><span class="label label-primary" title="使用频次">${advice.frequences}</span></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<hr/>
${pager.bootstrapPager}
<script>
    function prePage() {
        if ("${pager.page}" == "1") {
            return;
        }
        $("#page").val("${pager.page-1}");
        loadAdivces()
    }
    function nextPage() {
        if ("${pager.total}" ==${pager.page}) {
            return;
        }
        $("#page").val("${pager.page+1}");
        loadAdivces()
    }
    function goPage(page) {
        $("#page").val(page);
        loadAdivces()
    }
</script>