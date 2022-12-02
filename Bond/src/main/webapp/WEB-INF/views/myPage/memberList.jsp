<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memList" value="${memMap.memList}"/>
<c:set var="memNo" value="${memMap.loginMember.memberNo}"/>
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
                    <div class="member-invite">멤버 초대하기</div>
                </div>
                <div class="member-serch">
                    <input type="text" placeholder="멤버 검색">
                    <button type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
                    
                </div>
            </div>
            <div class="member-all">
                <div class="member-title">멤버</div>

                <c:forEach var="mem" items="${memList}">
                    <c:if test="${memNo == mem.memberNo}">
                        <c:if test="${mem.leaderYN == 'Y'}">
                            <c:set var="leader" value="1"/>
                        </c:if>
                    </c:if>
                </c:forEach>

                <div class="member-list">
                    <div class="member-image">
                        <c:if test="${empty loginMember.profileImage}">
                            <img src="/resources/images/member/profile/defaultProfile.png">
                        </c:if>
                        <c:if test="${!empty loginMember.profileImage}">
                            <img src="${loginMember.profileImage}" id="profile-img">
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
                    <c:if test="${memNo != memberList.memberNo}">
                        <c:choose>
                            <c:when test="${memberList.leaderYN == 'Y'}">
                                <div class="member-list">
                                    <div class="member-image">
                                        <c:if test="${empty memberList.memberImage}">
                                            <img src="/resources/images/member/profile/defaultProfile.png">
                                        </c:if>
                                        <c:if test="${!empty memberList.memberImage}">
                                            <img src="${memberList.memberImage}" id="profile-img">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${memberList.memberName}<div class="leader"><i class="fa-solid fa-crown"></i>리더</div></div>
                                    
                                    <div class="member-report">
                                        <i class="fa-solid fa-user-slash"></i>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="member-list">
                                    <div class="member-image">
                                        <c:if test="${empty memberList.memberImage}">
                                            <img src="/resources/images/member/profile/defaultProfile.png">
                                        </c:if>
                                        <c:if test="${!empty memberList.memberImage}">
                                            <img src="${memberList.memberImage}" id="profile-img">
                                        </c:if>
                                    </div>
                                    <div class="member-name" name="memberName" id="memberName">${memberList.memberName}</div>
                                    <div class="member-report">
                                        <i class="fa-solid fa-user-slash"></i>
                                    </div>
                                </div>
                            </c:otherwise>

                        </c:choose>
                    </c:if>
                </c:forEach>
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
</body>
</html>