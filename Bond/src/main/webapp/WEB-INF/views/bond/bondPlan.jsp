<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="postList" value="${map.postList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groupInfo.groupName} | BOND</title>

    <link rel="stylesheet" href="/resources/css/bond/bondPlan-style.css">
    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBond.jsp"/> 

    <jsp:include page="/WEB-INF/views/plan/insertModal.jsp" />

    <jsp:include page="/WEB-INF/views/plan/selectModal.jsp" />

    <jsp:include page="/WEB-INF/views/plan/updateModal.jsp" />

    <jsp:include page="/WEB-INF/views/plan/deleteModal.jsp" />
        <div id="container">

            <!-- 1번 영역 -->
            <aside id="info">
                <div id="info-inner">
                    <div class="side-cover">
                        <a href="#" class="cover">
                            <c:choose>
                                <c:when test="${not empty groupInfo.groupImage}">
                                    <img src="${groupInfo.groupImage}" id="cover-img">  
                                </c:when>
                                <c:otherwise>
                                    <img src="/resources/images/bond/profile/non-profile.png">
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </div>

                    <div class="band-name">
                        <a href="#" class="uri-text">${groupInfo.groupName}</a>
                    </div>

                    <p class="member">
                        <a href="#" class="member-count">멤버 ${groupInfo.memberCount}</a>
                    </p>

                    <div class="band-info">
                        <p class="band-description">${groupInfo.groupComment}</p>
                        <a href="#" class="more-link">...더보기</a>
                    </div>

                    <div class="btn-box">
                        <button type="button" class="write-button">글쓰기</button>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                    <div class="sidebar-under-icon">
                        <div class="band-setting-section">
                            <a href="#" class="band-setting-link sidebar-font"> 
                                <i class="fa-solid fa-gear sidbar-icon"></i>밴드 설정
                            </a>
                            
                        <div class="band-setting-list">
                            <ul class="band-setting-item">
                                <li>
                                    <a href="#" class="report-band sidebar-font">
                                        <i class="fa-solid fa-bell sidbar-icon"></i>신고하기
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="leave-band sidebar-font">
                                        <i class="fa-solid fa-person-walking-arrow-right sidbar-icon"></i>탈퇴하기
                                    </a>
                                </li>
                            </ul>
                        </div>  
                    </div>
                </div>
            </aside>

            <!-- 2번 영역 -->
            <main id="boardPlan">
                <!-- fullcalendar -->
                <div id='calendar'></div>
            </main>

            <!-- 3번 영역 -->
            <div id="banner">
                <div id="band-photo-area">
                    <section class="band-photo">
                        <h2 class="tit">최근 사진</h2>
                        <div class="photo-body">
                            <div class="photo-list">
                                <a href="#" class="banner-box">
                                    <img src="/resources/images/bond/banner.jpeg" class="banner-img">
                                </a>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                            </div>
                        </div>
                        <a href="#" class="more-button">더보기</a>
                    </section>
                </div>

                <!-- 다가오는 일정창 -->
                <div id="band-soon-plan-area">
                    <section class="band-soon-plan">
                        <h2 class="tit">다가오는 일정</h2>
                        <div class="soon-plan-body">
                            <!-- 반복 -->
                            <c:if test="${!empty planListSoon}">

                                <c:forEach var="plan" items="${planListSoon}">
                                    <div class="soon-plan-one">
                                        <div class="left-part">
                                            <div class="oneDay">
                                                ${plan.planStartDay}
                                            </div>
                                            <div class="oneMonth">
                                                ${plan.planStartMonth}월
                                            </div>
                                        </div>
                                        <div class="right-part">
                                            <div class="oneTitle">
                                                ${plan.planTitle}
                                            </div>
                                            <div class="onePeriod">
                                                <c:if test="${!empty plan.planStartTime}">
                                                    ${plan.planStartTime}
                                                    &nbsp;-&nbsp;
                                                </c:if>
                                                ${plan.planEnd}
                                                <c:if test="${!empty plna.planEndTime}">
                                                    &nbsp;
                                                    ${plan.planEndTime}
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </c:if>
                            <!-- 반복 끝 -->
                            <c:if test="${empty planListSoon}">
                                <div class="soon-plan-empty">
                                    일주일 내 일정이 없습니다
                                </div>
                            </c:if>
                        </div>
                    </section>
 
                </div>
            </div>

            <a href="#">
                <button type="button" class="btn-go-to-top">
                    <i class="fa-solid fa-arrow-up go-to-top-icon"></i>
                </button>
            </a>
        </div>
    
    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>
        <%-- message 1회 출력 후 모든 scope에서 message 삭제 --%>
        <c:remove var="message" />
    </c:if>

    <script>
        let cp = 0;
        const groupNo = "${groupNo}"
    </script>



<script src="/resources/js/bond/bondPlan.js"></script>
<script src="/resources/js/plan/useFullcalendar.js"></script>

<!-- fullcalendar CDN 방식으로 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

</body>
</html>