<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <span>멤버</span><span>N</span>
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
                <div class="member-list">
                    <div class="member-image">
                        <c:if test="${empty loginMember.profileImg}">
                            <img src="/resources/images/user.png">
                        </c:if>
                        <c:if test="${!empty loginMember.profileImg}">
                            <img src="${loginMember.profileImg}" id="profile-img">
                        </c:if>
                    </div>
                    <div class="member-name" name="memberName" id="memberName">${loginMember.memberName}</div>
                    <div class="member-report">
                        <i class="fa-solid fa-user-slash"></i>
                    </div>
                </div>
                <div class="member-list">
                    <div class="member-image">
                        <img src="/resources/images/user.png" alt="">
                    </div>
                    <div class="member-name" name="memberName" id="memberName">${loginMember.memberName}
                        <div class="leader"><i class="fa-solid fa-crown"></i>리더</div>

                    </div>
                    <div class="member-report">
                        <i class="fa-solid fa-user-slash"></i>
                    </div>
                </div>
            </div>
            
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