<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memList" value="${memMap.memList}"/>
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
                                    <div class="member-name" name="memberName" id="memberName">${memList.memberName}</div>
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
                                    <div class="member-name" name="memberName" id="memberName">${memList.memberName}</div>
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
                                    <div class="member-name" name="memberName" id="memberName">${memList.memberName}</div>
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
</body>
</html>