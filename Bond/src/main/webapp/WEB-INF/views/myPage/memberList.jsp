<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memList" value="${memMap.memList}"/>
<c:set var="myNo" value="${memMap.loginMember.memberNo}"/>
<c:set var="pagination" value="${memMap.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버 관리 페이지</title>

    <link rel="stylesheet" href="/resources/css/myPage/bondMemberList.css">
    <script src="https://kit.fontawesome.com/785870d879.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>

        <div class="memberMana-area">

            <div class="member-top">
                <div class="member-Toptitle">
                    <div class="member-total">
                        <span>멤버</span><span>${groupInfo.memberCount}</span>
                    </div>
                    <button class="member-invite inviteBtn">멤버 초대하기</button>
                </div>
            </div>
            <div class="member-all">
                <div class="member-title">멤버</div>

                <c:forEach var="mem" items="${memList}">
                    <c:if test="${myNo == mem.memberNo}">
                        <c:if test="${mem.leaderYN == 'Y'}">
                            <c:set var="leader" value="1"/>
                        </c:if>
                    </c:if>
                </c:forEach>

                <div class="member-list">
                    <div class="member-image" id="${myNo}">
                        <c:if test="${empty loginMember.profileImage}">
                            <img src="/resources/images/member/profile/defaultProfile.png" class="memImg">
                        </c:if>
                        <c:if test="${!empty loginMember.profileImage}">
                            <img src="${loginMember.profileImage}" class="memImg">
                        </c:if>
                    </div>
                    <div class="member-name" name="memberName" id="memberName">${loginMember.memberName}
                    
                        <c:if test="${not empty leader}">
                            <div class="leader"><i class="fa-solid fa-crown"></i>리더</div>
                        </c:if>
                    </div>
                    <div class="member-report">
                        <a href="/myPage/myPage"><i class="fa-solid fa-gear sidbar-icon"></i></a>
                    </div>
                </div>              

                <c:forEach var="memberList" items="${memList}">
                    <c:if test="${myNo != memberList.memberNo}">
                        <c:choose>
                            <c:when test="${memberList.leaderYN == 'Y'}">
                                <div class="member-list">
                                    <div class="member-image" id="${memberList.memberNo}">
                                        <c:if test="${empty memberList.memberImage}">
                                            <img src="/resources/images/member/profile/defaultProfile.png" class="memImg">
                                        </c:if>
                                        <c:if test="${!empty memberList.memberImage}">
                                            <img src="${memberList.memberImage}" class="memImg">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${memberList.memberName}<div class="leader"><i class="fa-solid fa-crown"></i>리더</div></div>
                                    
                                    <div class="member-report" id="${memberList.memberNo}">
                                        <i class="fa-solid fa-user-slash userSlash memberReport"></i>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="member-list">
                                    <div class="member-image" id="${memberList.memberNo}">
                                        <c:if test="${empty memberList.memberImage}">
                                            <img src="/resources/images/member/profile/defaultProfile.png"class="memImg">
                                        </c:if>
                                        <c:if test="${!empty memberList.memberImage}">
                                            <img src="${memberList.memberImage}"class="memImg">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${memberList.memberName}</div>
                                    <div class="member-report" id="${memberList.memberNo}">
                                        <i class="fa-solid fa-user-slash userSlash memberReport"></i>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
            <div id="pageTarget"></div>
            </div>
        </div>


        <%-- 모달 --%>
        <div class="modal" id="modal">
            <div class="profile1" id="modalProfile">
                <button type="button" class="clickProfile close-btn">
                    <i class="fa-solid fa-x" id="modalx"></i>
                </button>
                <section class="profile-area">

                    <div class="profile-image" id="modalImgarea">
                    </div>
            
                    <h3 class="memberName" name="memberName" id="modalName"></h3>
                    <section class="member">
                        <div class="leader-yn">
                            <div class="profile-member" id="modalLeader">멤버</div>
                        </div>
                        <div class="join-date" id="modalJoinDate"></div>
                    </section>
            
                    <div class="birth">
                        <div class="birth-title">생일 : </div>
                        <div class="memberBirth" id="modalBirth">
                        </div>
                    </div>

                    <div class="reportBtn" id="modalReport"></div> <%-- 안되면 이거만 지우면 됨. --%>

                </section>
            </div>
        </div>
    </main>
</body>
</html>