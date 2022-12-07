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
    <div class="topic-name-wrap">
        <div class="topic-name">
            <h2>${groupTopic[0].topicName}</h2>
        </div>
    </div>

    <section class="nav-area">
        <nav>
            <div class="mainPage-menu">
                <div class="topic-nav">
                    <a href="/member/groupTopic/1">운동</a>
                    <a href="/member/groupTopic/2">공예</a>
                    <a href="/member/groupTopic/3">게임</a>
                    <a href="/member/groupTopic/5">문화/예술</a>
                    <a href="/member/groupTopic/12">자기계발</a>
                    <a href="/member/groupTopic/7">여행/캠핑</a>
                    <a href="/member/groupTopic/10">사진</a>
                    <a href="/member/groupTopic/6">자연/귀농</a>
                </div>
                <div class="topic-nav">
                    <a href="/member/groupTopic/4">팬클럽</a>
                    <a href="/member/groupTopic/8">요리</a>
                    <a href="/member/groupTopic/9">경제/재태크</a>
                    <a href="/member/groupTopic/11">인테리어</a>
                    <a href="/member/groupTopic/11">애완동물</a>
                    <a href="/member/groupTopic/11">맛집탐방</a>
                    <a href="/member/groupTopic/11">어학/외국어</a>
                    <a href="/member/groupTopic/11">일상/이야기</a>
                </div>
            </div>
        </nav>
    </section>


        <c:choose>
            <c:when test="${empty groupTopic}">
                <h3 class="h3">본드가 존재하지 않습니다.</h3>
            </c:when>

            <c:otherwise>
                <c:forEach var="group" items="${groupTopic}">
                    <div class="list-wrap">
                    <ul class="list-wrapper">
                        <li class="list-item">
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
                                            <c:when test="${not empty group.memberCount}">
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
                        </li>
                    </ul>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <div id="pageTarget" style="height:20px"></div>
    </div>

    <script>
        let cp = 0;
    </script>


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    
    <!-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> -->
    <script src="/resources/js/member/groupTopic.js"></script>

</body>
</html>