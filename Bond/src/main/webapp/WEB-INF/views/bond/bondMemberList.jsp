<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="memList" value="${memMap.memList}"/>
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

                    <div class="btn-box">
                        <button type="button" class="write-button">글쓰기</button>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                    <div class="sidebar-under-icon">
                        <div class="band-setting-section">
                            <a href="/bond-bondIntro" class="band-setting-link sidebar-font"> 
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
            <main id="board-list">
                <%-- <jsp:include page="/WEB-INF/views/myPage/memberList.jsp"/> --%>
                <div class="memberMana-area">

            <div class="member-top">
                <div class="member-Toptitle">
                    <div class="member-total">
                        <span>멤버</span><span>${groupInfo.memberCount}</span>
                    </div>
                    <div class="member-invite">멤버 초대하기</div>
                </div>
                <div class="member-serch">
                    <input type="text" placeholder="멤버 검색">
                    <button type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
                    
                </div>
            </div>

            <div class="member-all">
                <div class="member-title">멤버</div>
                <c:forEach var="memberList" items="${memList}">
                    
                        <c:if test="{loginMember.memberNo == groupMemberList.memberNo}">
                            <c:when test="groupMemberList.leaderYN == 'Y'">
                                <div class="member-list">
                                    <div class="member-image">
                                        <c:if test="${empty GroupMemberList.memberImage}">
                                            <img src="/resources/images/user.png">
                                        </c:if>
                                        <c:if test="${!empty GroupMemberList.memberImage}">
                                            <img src="${GroupMemberList.memberImage}" id="profile-img">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${groupMemberList.memberName}</div>
                                    <div class="leader"><i class="fa-solid fa-crown"></i>리더</div>
                                    <div class="member-report">
                                        <i class="fa-solid fa-gear sidbar-icon"><a href="/bond-bondIntro"></a></i>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="member-list">
                                    <div class="member-image">
                                        <c:if test="${empty groupMemberList.memberImage}">
                                            <img src="/resources/images/user.png">
                                        </c:if>
                                        <c:if test="${!empty groupMemberList.memberImage}">
                                            <img src="${groupMemberList.memberImage}" id="profile-img">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${groupMemberList.memberName}</div>
                                    <div class="member-report">
                                        <i class="fa-solid fa-gear sidbar-icon"><a href="/bond-bondIntro"></a></i>
                                    </div>
                                </div>

                            </c:otherwise>
                        </c:if>
                                <div class="member-list">
                                    <div class="member-image">
                                        <c:if test="${empty groupMemberList.memberImage}">
                                            <img src="/resources/images/user.png">
                                        </c:if>
                                        <c:if test="${!empty groupMemberList.memberImage}">
                                            <img src="${groupMemberList.memberImage}" id="profile-img">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${groupMemberList.memberName}</div>
                                    <div class="member-report">
                                        <i class="fa-solid fa-user-slash"></i>
                                    </div>
                                </div>
                        
                    
                </c:forEach>


                <%-- <div class="member-list">
                    <div class="member-image">
                        <img src="/resources/images/user.png" alt="">
                    </div>
                    <div class="member-name" name="memberName" id="memberName">${loginMember.memberName}
                        <div class="leader"><i class="fa-solid fa-crown"></i>리더</div>

                    </div>
                    <div class="member-report">
                        <i class="fa-solid fa-user-slash"></i>
                    </div>
                </div> --%>
            </div>

            <div id="pageTarget" style="height:10px"></div>
            
            <div class="member-invite-bottom">
                <div class="invite-icon"><i class="fa-solid fa-user-plus"></i></div>
                <div class="member-invite-btn">
                    <button>멤버 초대하기</button>
                </div>
            </div>
        </div>
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

    <script src="/resources/js/bond/bondMemberList.js"></script>
    
</body>
</html>