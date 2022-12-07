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

    <link rel="stylesheet" href="/resources/css/bond/bond.css">
    <link rel="stylesheet" href="/resources/css/bond/Modal-jose.css"><%-- 탈퇴모달 --%>
    <link rel="stylesheet" href="/resources/css/bond/modalBondIntro.css"><%-- 본드 정보 모달 --%>
    <link rel="stylesheet" href="/resources/css/bond/modalMemPro.css"><%-- 게시글 멤버 프로필 상세 모달 --%>
    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBond.jsp"/> 
        <div id="container">
            <!-- 1번 영역 -->
            <aside id="info">
                <div id="info-inner">
                    <div class="side-cover">
                        <a href="#" class="cover-img">
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
                        <a href="#" class="more-link modalInfo">...더보기</a>
                    </div>

                    <div class="btn-box">
                        <button type="button" id="write-button">글쓰기</button>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                    <div class="sidebar-under-icon">
                        <div class="band-setting-section">
                            <c:if test="${groupInfo.leaderNo == loginMember.memberNo}">
                                <a href="/bond/${groupNo}/bond-bondIntro" class="band-setting-link sidebar-font"> 
                                    <i class="fa-solid fa-gear sidbar-icon"></i>밴드 설정
                                </a>
                            </c:if>   
                        <div class="band-setting-list">
                            <ul class="band-setting-item">
                                <c:if test="${loginMember.memberNo != groupInfo.leaderNo}">
                                    <li>
                                        <a href="#" id="reportBtn" class="report-band sidebar-font">
                                            <i class="fa-solid fa-bell sidbar-icon"></i>신고하기
                                        </a>
                                    </li>
                                </c:if>

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
            <main id="board-list">
                <div class="post-write-form">
                    <%-- <div class="board-search">
                        <form action="#" class="search-form">
                            <div class="input-search-form">
                                <label class="gSrOnly" for="input-search" >글 내용, 작성자 검색</label>
                                <input type="text" id="input-search" placeholder="글 내용, 작성자 검색"
                                    maxlength="20">
                                <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass search-icon"></i></button>
                            </div>
                        </form>
                    </div> --%>
                    
                    <div class="main-content">   
                        <div>
                            <button id="postWrite-btn" class="content-button"></button>
                            <div class="content-editor">
                                새로운 소식을 남겨보세요. <br>
                                공개 밴드에 남긴 글은 누구나 볼 수 있습니다.
                            </div>
                        </div>
                    </div> 

                    <%-- 게시물 조회 --%>
                    <div class="post-wrap">
                        
                        <c:choose>
                            <c:when test="${empty postList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <span class="noPost-info">
                                    게시글이 존재하지 않습니다
                                </span>
                            </c:when>

                            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 있다면 -->
                                <c:forEach var="post" items="${postList}">
                                    <div data-viewname="post-list-view" class="post-wrap">
                                        <div class="content-card">
                                            <div class="post-list-view">
                                                <div class="post-author-view">
                                                    <%-- 작성자 프로필 이미지 --%>
                                                    <div class="uprofile" id="${post.memberNo}">
                                                        <c:if test="${empty post.memberImage}">
                                                            <%-- 프로필 이미지가 없을 경우 --%>
                                                            <img class="uprofile-inner" 
                                                            src="/resources/images/member/profile/defaultProfile.png" />
                                                        </c:if>
                                                        <c:if test="${!empty post.memberImage}">
                                                            <%-- 프로필 이미지가 있을 경우 --%>
                                                            <img class="uprofile-inner" src="${post.memberImage}"/>
                                                        </c:if>
                                                    </div>

                                                    <div class="post-info">
                                                        <%-- 작성자 이름 --%>
                                                        <strong class="post-info-name">${post.memberName}</strong>
                                                        <%-- 작성 날짜 --%>
                                                        <div class="post-list-info">
                                                            <a href="#" class="post-info-date">${post.postDate}</a>
                                                        </div>
                                                    </div>    
                                                </div>

                                                <%-- 게시물 내용 --%>
                                                <div class="post-body" id="${post.postNo}">
                                                    <div class="post-text">
                                                        <p class="text-body">
                                                            ${post.postContent}
                                                        </p>
                                                        <a href="#" class="more-link">...더보기</a>
                                                    </div>

                                                </div>

                                                <div class="post-count-view">
                                                    <div class="post-count">
                                                        <span class="face-comment">
                                                            <%-- 좋아요 --%>
                                                            <button type="button" class="emotion-view">
                                                                <span class="emotion-wrap">
                                                                    <span class="icon">
                                                                        <i class="fa-regular fa-thumbs-up"></i>
                                                                    </span>
                                                                </span>
                                                                <span class="count eCount">${post.likeCount}</span>
                                                            </button>
                                                            <%-- 댓글 --%>
                                                            <button type="button" class="comment">
                                                                댓글 <span class="count rCount">${post.replyCount}</span>
                                                            </button>
                                                        </span>
                                                        <%-- 조회수 --%>
                                                        <span class="share-read">
                                                            <span class="gSrOnly">읽음</span>
                                                            <i class="fa-solid fa-eye" style="color: #555;"></i>
                                                            <span class="count vCount">${post.postView}</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div id="pageTarget" style="height:20px"></div>
                </div>
            </main>

            <!-- 3번 영역 -->
            <div id="banner">
                <div id="band-photo-area">
                    <section class="band-photo">
                        <h2 class="tit">최근 사진</h2>
                        <div class="photo-body">
                            <c:if test="${empty recentImages}">
                                <span class="no-image-info">게시된 사진이 없습니다</span>
                            </c:if>
                            <div class="photo-list">
                                <ul>
                                    <c:forEach var="image" items="${recentImages}">
                                        <li class="banner-box">
                                            <img src="${image.postImage}" class="banner-img">
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <a href="/bond/${groupNo}/album" class="more-button">더보기</a>
                    </section>
                </div>

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

                    <!-- 일정 페이지로 이동 버튼 -->
                    <c:if test="${!empty planListSoon}">
                        <a href="/bond/${groupNo}/plan" class="more-button">더보기</a>
                    </c:if>
                </div> <!-- end bond-soon-plan-area -->

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

    <%-- 게시글 작성 페이지 모달(iframe) --%>
    <div id="postWrite-modal">
        <iframe width="620px" height="720px" src="/bond/${groupNo}/postWrite"
        id="postWrite-iframe"></iframe>
        <button class="modal-closeBtn">
            <i class="fa-solid fa-x"></i>
        </button>
    </div>

    <%-- 게시글 수정 페이지 모달(iframe) --%>
    <div id="postUpdate-modal">
        <iframe width="620px" height="720px"
        id="postUpdate-iframe"></iframe>
        <button class="modal-closeBtn">
            <i class="fa-solid fa-x"></i>
        </button>
    </div>

    <%-- 게시글 상세조회 페이지 모달 --%>
    <div id="postSelect-modal">
        <div id="postSelect-view">
            <jsp:include page="/WEB-INF/views/post/postSelect.jsp"/>
        </div>
        <button class="sModal-closeBtn">
            <i class="fa-solid fa-x"></i>
        </button>
    </div>

    <%-- 본드 탈퇴 모달 --%>
    <jsp:include page="/WEB-INF/views/bond/secessionModal.jsp"/>

    <%-- 본드 정보 보기 모달 --%>
    <jsp:include page="/WEB-INF/views/bond/modalBondIntro.jsp"/>
    <script src="/resources/js/bond/modalBondIntro.js"></script>

    <%-- 게시글의 멤버 프로필 선택 시 프로필 상세정보 모달 --%>
    <jsp:include page="/WEB-INF/views/bond/modalMemPro.jsp"/>
    <script src="/resources/js/bond/modalMemPro.js"></script>

    <script>
        let cp = 0;
        const groupNo = "${groupNo}"
        const memberNo = "${loginMember.memberNo}"
        let selectPostNo;
    </script>


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

    <script src="/resources/js/bond/secessionModal.js"></script><%-- 탈퇴 모달 --%>
    <script src="/resources/js/bond/bond.js"></script>
    
</body>
</html>