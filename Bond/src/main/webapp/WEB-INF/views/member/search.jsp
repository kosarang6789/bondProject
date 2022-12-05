<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 검색 | 본드</title>

    <link rel="stylesheet" href="/resources/css/member/search.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />

    <%-- 검색을 진행한 경우 --%>
    <c:if test="${not empty param.key}">
        <%-- /board/1?cp=3&key=t&query=테스트 --%>
        <c:set var="sURL" value="&key=${param.key}&query=${param.key}"/>
    
    </c:if>
    
    <div class="search-area">
        <h2>검색 결과</h2>
        <ul class="list-wrapper">
            <li class="list-item">
                <c:choose>
                    <c:when test="${empty grouplist}">
                        <h3>본드가 존재하지 않습니다. </h3>
                    </c:when>
                    
                    <c:otherwise>
                        <c:forEach var="group" items="${groupList}">
                            <div class="list">
                                <div class="list-cover">
                                    <div class="cover">
                                        <img src="/resources/images/bond/profile/no-profile.png">
                                    </div>
                                </div>
                                <div class="list-bond">
                                    <div class="bond-name">
                                        <a href="/bond/${groupNo}">${group.groupName}</a>
                                    </div>
                                    <div class="bond-comment">${group.groupComment}</div>
                                    <div class="bond-count">멤버 5 리더 관리자</div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>

    <!-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> -->
    <script src="/resources/js/member/mainPage.js"></script>

</body>
</html>