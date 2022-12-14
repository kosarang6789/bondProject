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
    <link rel="stylesheet" href="/resources/css/bond/modalBondIntro.css">
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
                                    <img src="/resources/images/bond/profile/no-profile.png" id="cover-img">
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

                    <div class="sidebar-under-icon">
                        <%-- <div class="band-setting-section">
                            <c:if test="${groupInfo.leaderNo == loginMember.memberNo}">
                                <a href="/bond/${groupNo}/bond-bondIntro" class="band-setting-link sidebar-font"> 
                                    <i class="fa-solid fa-gear sidbar-icon"></i>밴드 설정
                                </a>
                            </c:if> --%>
                    </div>
                </div>
            </aside>

            <!-- 2번 영역 -->
            <%-- <main id="boardPlan"> --%>
            <main id="board-list">
                <!-- fullcalendar -->
                <div id='calendar'></div>
            </main>

            <!-- 3번 영역 -->
            <div id="banner">

                <!-- 다가오는 일정창 -->
                <div id="band-soon-plan-area">
                    <section class="band-soon-plan">
                        <h2 class="tit">다가오는 일정</h2>
                        <div class="soon-plan-body">

                            <c:if test="${!empty planListSoon}"> <!-- 조건문 : 만약 다가오는 일정 리스트가 있으면 -->

                                <!-- 반복문으로 일정 출력 -->
                                <c:forEach var="plan" items="${planListSoon}">
                                    <div class="soon-plan-one">

                                        <div class="left-part">
                                            <div class="oneDay"> <!-- 해당 일정의 날짜(일) -->
                                                ${plan.planStartDay}
                                            </div>
                                            <div class="oneMonth"> <!-- 해당 일정의 날짜(월) -->
                                                ${plan.planStartMonth}월
                                            </div>
                                        </div> <!-- end left-part -->

                                        <div class="right-part">
                                            <div class="oneTitle"> <!-- 해당 일정의 제목 -->
                                                ${plan.planTitle}
                                            </div> <!-- end oneTitle(해당 일정의 제목) -->

                                            <div class="onePeriod"> <!-- 해당 일정의 기간 -->
                                                <c:if test="${!empty plan.planStartTime}"> <!-- 시작 시간이 있으면 시작 시간 출력 -->
                                                    ${plan.planStartTime}
                                                    &nbsp;-&nbsp;
                                                </c:if>
                                                ${plan.planEnd} <!-- 종료 기간 -->
                                                <c:if test="${!empty plan.planEndTime}"> <!-- 종료 시간이 있으면 종료 시간 출력 -->
                                                    ${plan.planEndTime}
                                                </c:if> 
                                            </div> <!-- end onePeriod(해당 일정의 기간) -->
                                        </div> <!-- end right-part -->

                                    </div> <!-- end soon-plan-one -->
                                </c:forEach> <!-- 반복문 종료 -->

                            </c:if> <!-- 조건문 종료 -->
                            
                            <c:if test="${empty planListSoon}"> <!-- 조건문 : 만약 다가오는 일정 리스트가 없으면 -->

                                <div class="soon-plan-empty">
                                    일주일 내 일정이 없습니다.
                                </div>

                            </c:if> <!-- 조건문 종료 -->
                        </div> <!-- end soon-plan-body -->
                    </section> <!-- end bond-soon-plan -->

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

<%-- 본드 정보 보기 모달 --%>
<jsp:include page="/WEB-INF/views/bond/modalBondIntro.jsp"/>
<script src="/resources/js/bond/modalBondIntro.js"></script>


<!-- fullcalendar CDN 방식으로 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

</body>
</html>