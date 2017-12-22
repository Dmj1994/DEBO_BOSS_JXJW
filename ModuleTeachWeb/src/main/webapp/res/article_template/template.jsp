<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<section class="editor selected">
    <section style="margin-top: 20px; border: 0px none; padding: 0px;">
        <section
                style="height: 8px; margin-left: 48px; display: inline-block; padding: 4px 0px 6px; width: 85%; color: inherit; background-color: rgb(254, 254, 254);">
            <section class="96wx-bdc"
                     style="border: 1px solid rgb(226, 86, 27); box-sizing: border-box; padding: 0px; color: inherit;"></section>
        </section>
        <section style="text-align: center; box-sizing: border-box; padding: 0px; margin-top: -12px; color: inherit;">
            <section class="96wx-bgc"
                     style="display: inline-block; padding: 5px 10px; box-sizing: border-box; margin: 0px; color: rgb(255, 255, 255); background-color: rgb(226, 86, 27);">
                <section class="96wx-color" style="color: inherit; font-size: 16px;">
                    ${article.articleTitle}
                </section>
            </section>
        </section>
        <section class="96wx-bdc"
                 style="width: 50px; height: 50px; border-radius: 50%; border: 2px solid rgb(226, 86, 27); padding: 9px; margin-left: 15px; margin-top: -60px; color: inherit;">
            <section class="96wx-bdc"
                     style="width: 30px; height: 30px; border-radius: 50%; border: 2px solid rgb(226, 86, 27); padding: 7px; color: inherit;">
                <section class="96wx-bgc"
                         style="width: 10px; height: 10px; border-radius: 50%; color: rgb(255, 255, 255); background-color: rgb(226, 86, 27);"></section>
            </section>
        </section>
        <section class="96wx-bdc"
                 style="width: 35px; height: 35px; border-radius: 50%; border: 2px solid rgb(226, 86, 27); padding: 6px; margin-top: -20px; color: inherit; background-color: rgb(254, 254, 254);">
            <section class="96wx-bdc"
                     style="width: 20px; height: 20px; border-radius: 50%; border: 2px solid rgb(226, 86, 27); padding: 5px; color: inherit;">
                <section class="96wx-bgc"
                         style="width: 6px; height: 6px; border-radius: 50%; color: rgb(255, 255, 255); background-color: rgb(226, 86, 27);"></section>
            </section>
        </section>
    </section>
</section>
<section class="editor">
    <section style="border:none;margin: 5px 0 0;padding: 10px;background: none;border-style: none;">
        <img src="http://newcdn.96weixin.com/c/mmbiz.qlogo.cn/mmbiz/wyice8kFQhf5geQK3gu2FUugjB8iaSGpjOwTCicEOIzAjhyFYzReiaBBVeO4ic3iawLdKUSAMYOdSn0Odibia2XM82KebQ/0?wx_fmt=png"
             style="width: 100%;  margin: 0 auto; display: block;"/>
    </section>
</section>
<div style="padding:60px">
    ${article.articleContent}
</div>

</body>
<script src="../js/jquery.min.js?v=2.1.4"></script>
<!-- 自定义js -->
<script src="../js/content.js?v=1.0.1"></script>
<script>

</script>
</html>