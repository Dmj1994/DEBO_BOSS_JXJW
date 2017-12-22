<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container" style="padding-top:20px;width:610px">
    <c:forEach items="${sources}" var="source">
        <div class="col-md-4" style="margin-bottom: 10px">
            <a href="javascript:" style="color:red"
               onclick="fillSource('${source.dictionaryCode}','${source.dictionaryName}')">${source.dictionaryName}</a>

            <hr style="margin:3px 0px"/>
            <c:if test="${fn:length(source.children)>0}">
                <c:forEach items="${source.children}" var="child">
                    <a href="javascript:"
                       onclick="fillSource('${child.dictionaryCode}','${child.dictionaryName}')">${child.dictionaryName}</a> |
                </c:forEach>
            </c:if>
        </div>
    </c:forEach>
</div>
<hr/>
<div class="row" style="padding:0px 20px">
    已选：<span id="choosedTxt" style="font-size:25px" mediaCode=""></span>
    <c:if test="${type!=null}">
        <input class="layui-input" placeholder="如需备注，请在这里输入" id="sourceRemark"/>
    </c:if>
</div>

<script>
    function fillSource(code, name) {
        $("#choosedTxt").text(name);
        $("#choosedTxt").attr("mediaCode", code);

    }
</script>