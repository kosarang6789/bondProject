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

    <link rel="stylesheet" href="/resources/css/bond/samplePage.css">
    <link rel="stylesheet" href="/resources/css/bond/modalBondIntro.css">
    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBond.jsp"/> 
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
                <jsp:include page="/WEB-INF/views/myPage/bondIntro.jsp"/>
            </main>

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


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

    <script src="/resources/js/myPage/bondIntro.js"></script>
    
</body>
</html>