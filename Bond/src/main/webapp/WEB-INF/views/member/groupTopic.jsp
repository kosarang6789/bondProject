<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 카테고리 | 본드</title>

    <link rel="stylesheet" href="/resources/css/member/groupTopic.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />
    
    <div class="search-area">
        <h2>${topicName}</h2>

        <ul class="list-wrapper">
            <li class="list-item">
                <c:forEach var="group" items="${groupTopic}">
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
                                <a href="/bond/${group.groupNo}" class="bond-name-a">${group.groupName}</a>
                            </div>
                            <c:choose>
                                <c:when test="${not empty group.groupComment}">
                                    <div class="bond-comment">${group.groupComment}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="bond-comment">소개글이 없습니다.</div> 
                                </c:otherwise>
                            </c:choose>
                            <div class="bond-count-leader">
                                <c:choose>
                                    <c:when test="${group.memberCount}">
                                        <div class="bond-count">멤버 ${group.memberCount} </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="bond-count">멤버 0</div> 
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${not empty group.leaderName}">
                                        <div class="bond-leader">리더 ${group.leaderName} </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="bond-leader">리더 관리자 </div> 
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </li>
        </ul>
        <div id="pageTarget" style="height:20px"></div>
    </div>

    <script>
        let cp = 0;
        let key = "${param.key}";
    </script>


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    
    <!-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> -->
    <script src="/resources/js/member/mainPage.js"></script>

</body>
</html>