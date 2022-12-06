<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="groupList" value="${map.groupList}"/>
<c:set var="bondCount" value="${map.bondCount}"/>

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
    
    <div class="search-area">
        <c:choose>
            <c:when test="${not empty bondCount}">
                <h2>검색 결과 ${bondCount}</h2>
            </c:when>
            <c:otherwise>
                <h2>검색 결과 0</h2>
            </c:otherwise>
        </c:choose>

        <ul class="list-wrapper">
            <li class="list-item">
                <c:choose>
                    <c:when test="${empty groupList}">
                        <h3>본드가 존재하지 않습니다. </h3>
                    </c:when>
                    
                    <c:otherwise>
                        <c:forEach var="group" items="${groupList}">
                            <div class="list">
                                <a href="/bond/${group.groupNo}" class="group-no">
                                    <div class="list-cover">
                                        <div class="cover">
                                        <c:choose>
                                            <c:when test="${not empty group.groupImage}">
                                                <img src="${group.groupImage}" class="group-image">  
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/resources/images/bond/profile/no-profile.png" class="group-image">
                                            </c:otherwise>
                                        </c:choose>

                                        </div>
                                    </div>
                                </a>    
                                <div class="list-bond">
                                    <div class="bond-name">
                                        <a href="/bond/${group.groupNo}">${group.groupName}</a>
                                    </div>
                                    <div class="bond-comment">${group.groupComment}</div>
                                    <div class="bond-count">멤버 ${group.memberCount} 
                                        <c:choose>
                                            <c:when test="${not empty group.leaderName}">
                                                리더 ${group.leaderName} 
                                            </c:when>
                                            <c:otherwise>
                                                리더 관리자
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    
    <!-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> -->
    <script src="/resources/js/member/mainPage.js"></script>

</body>
</html>