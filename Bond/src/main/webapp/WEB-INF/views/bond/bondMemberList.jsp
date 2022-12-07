<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="memList" value="${memMap.memList}"/>
<c:set var="memNo" value="${memMap.loginMember.memberNo}"/>
<c:set var="pagination" value="${memMap.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groupInfo.groupName} | BOND</title>

    <link rel="stylesheet" href="/resources/css/bond/samplePage.css">
    <link rel="stylesheet" href="/resources/css/myPage/bondMemberList.css">
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

                    <div class="sidebar-under-icon"></div>
                </div>
            </aside>

            <!-- 2번 영역 -->
            <main id="board-list">
                <jsp:include page="/WEB-INF/views/myPage/memberList.jsp"/>
            </main>

            <!-- 3번 영역 -->
            <div id="banner">
                <div id="band-photo-area"></div>
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
        <c:remove var="message" />
    </c:if>

    <%-- 본드 정보 보기 모달 --%>
    <jsp:include page="/WEB-INF/views/bond/modalBondIntro.jsp"/>
    <script src="/resources/js/bond/modalBondIntro.js"></script>

    <script>
        let cp = 0;
        const groupNo = "${groupNo}";
        const myNo = "${memMap.loginMember.memberNo}";
    </script>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

    <script src="/resources/js/bond/bondMemberList.js"></script>
    
</body>
</html>