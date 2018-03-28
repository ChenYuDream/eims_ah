<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ChenYu
  Date: 2017-10-20
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="nav-content">
        <div class="logo"><img width="189" height="50" alt="安华" src="${baseInfo.fileServerPath}${config.logoUrl}"/>
        </div>
        <ul class="nav">
            <c:forEach items="${navContents}" var="nc">
                <li id="${nc.tag}">
                    <a href="${ctx}/page/${nc.tag}">${nc.navName}</a>
                    <div class="itemBox">
                        <ul>
                            <c:forEach items="${nc.branchList}" var="br">
                                <li><a href="${ctx}/page/${nc.tag}/${br.id}">${br.title}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script>
    $(function () {
        var path = window.location.pathname;
        $('.nav li').each(function (index) {
            var tag = $(this).attr("id");
            if (path.indexOf(tag) != -1) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
        $("#branch").click(function (ev) {
            console.log("");
            var e = ev || event;
            e.target = e.target || e.srcElement;
            if (e.preventDefault) {
                e.preventDefault();
            } else {
                e.returnValue = 'false';//IE..
            }
            $(this).addClass("active").siblings().removeClass("active");
            $('.itemBox').toggle();
        });
        $('.itemBox').on('click', 'li', function () {
            var href=$(this).find("a").attr("href");
            window.location.href = href;
        });

    });
</script>
