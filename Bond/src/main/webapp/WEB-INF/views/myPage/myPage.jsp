<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/resources/css/myPage/myPage.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<body>
    <section class="header-area">
        <header>
            <div>
                <!-- 클릭 시 메인으로 이동하는 로고  -->
                <a href="/member/mainPage">
                    <img src="/resources/images/common/home-logo.png"  id="home-logo">
                </a>
            </div>
    
            <div class="profile">
                <!-- 내 정보 사진 -->
                <button type="button" class="box">
                    <img src="images/profile-photo.png" id="profile-photo">
                </button>
            </div>
        </header>
    </section>

    <section class="myPage-layout">
        <aside class="myPage-sidebar">

            <nav class="myPage-menu">
                <p>내 정보 수정</p>
                <ul>
                    <li><a href="/myPage/myPage">- 프로필 수정</a></li>
                    <li><a href="/myPage/myPage-changePw">- 비밀번호 변경</a></li>
                    <li><a href="/myPage/myPage-secession">- 서비스 탈퇴</a></li>
                </ul>
                <a href="#">내 글 조회</a>

            </nav>

        </aside>

        <main class="content-area">
            <div class="content-header">
                <h2>내 정보 수정</h2>
            </div>

            <form action="/myPage/myPage" id="profile" method="post" 
                enctype="multipart/form-data">
                <div class="content-body">
                    <div class="image-area">
                        <label>프로필 이미지</label>
                            <div class="update-image">
                                <c:if test="${!loginMember.profileImage}}">
                                    <img src="/resources/images/member/profile/defaultProfile.png" id="profile-image">
                                </c:if>
                                <c:if test="${loginMember.profileImage}">
                                    <img src="${loginMember.profileImage}" id="profile-image">
                                </c:if>

                            </div>
                            <div class="profile-btn-area">
                                <label for="image-input">이미지 변경</label>
                                <p></p>
                                <!-- accept 속성 : 업로드 가능한 파일 타입을 제한하는 속성 -->
                                <input type="file" name="profileImage" id="image-input" accept="image/*">
                                <button type="button" id="deleteBtn">이미지 삭제</button>
                            </div>
                        
                    </div>
                    
                    <div class="update-profile">
                        <div class="myPage-row">
                            <label>이메일</label>
                            <span>${loginMember.memberEmail}</span>
                        </div>
        
                        <div class="myPage-row">
                            <label>이름</label>
                            <span><input type="text" value="${loginMember.memberName}"></span>
                            <%-- <button>변경</button> --%>
                        </div>
                        

                        <div class="myPage-row">
                            <label>생년월일</label>
                            <span><input type="text" value="${loginMember.memberBirth}"></span>
                            <%-- <button>변경</button> --%>
                        </div>
                        
                        <c:if test="${!empty loginMember.memberTel}">
                            <c:set var="memberTel" value="${loginMember.memberTel}"/>
                        </c:if>

                        <div class="myPage-row">
                            <label>전화번호</label>
                            <span><input type="text" value="+82 ${fn:substring(memberTel, 1, 3)}-${fn:substring(memberTel,3,7)}-${fn:substring(memberTel,7,11)}"></span>
                        </div>
                    </div>
                </div>
                <button class="subBtn">내 정보 수정하기</button>
            </form>
        </main>
    </section>

    <script src="/resources/js/myPage/myPage.js"></script>
</body>
</html>