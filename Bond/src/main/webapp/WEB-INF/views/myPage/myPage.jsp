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
    <%-- <link rel="stylesheet" href="/resources/css/member/mainPage.css"> --%>
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />

    <section class="myPage-layout">
        <aside class="myPage-sidebar">

            <nav class="myPage-menu">
                <p>내 정보 수정</p>
                <ul>
                    <li><a href="/myPage/myPage">- 프로필 수정</a></li>
                    <li><a href="/myPage/myPage-changePw">- 비밀번호 변경</a></li>
                    <li><a href="/myPage/myPage-secession">- 서비스 탈퇴</a></li>
                </ul>
            </nav>

        </aside>

        <main class="content-area">
            <div class="content-header">
                <h2>내 정보 수정</h2>
            </div>

                <div class="content-body">
                    <form action="/myPage/myPageImage" id="imgFrm" method="post" 
                        enctype="multipart/form-data" onsubmit = "return profileValidate()">
                            <div class="image-area">
                                <label>프로필 이미지</label>
                                    <div class="update-image">
                                        <c:if test="${empty loginMember.profileImage}">
                                            <img src="/resources/images/member/profile/defaultProfile.png" id="profile-image">
                                        </c:if>
                                        <c:if test="${!empty loginMember.profileImage}">
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
                            <button class="imageBtn">이미지 수정하기</button>
                    </form>

                    <div class="line"></div>
                    
                    <form action="/myPage/myPageProfile" id="profileFrm" method="post" onsubmit="return checkValidate()">
                        <div class="update-profile">
                            <div class="myPage-row">
                                <label>이메일</label>
                                <span>${loginMember.memberEmail}</span>
                            </div>
            
                            <div class="myPage-row">
                                <label>이름</label>
                                <span><input type="text" name="memberName" value="${loginMember.memberName}" id="name"></span>
                            </div>
                            

                            <div class="myPage-row">
                                <label>생년월일</label>
                                <span><input type="date" name="memberBirth" value="${loginMember.memberBirth}" id="birth"></span>
                            </div>
                            
                            <c:if test="${!empty loginMember.memberTel}">
                                <c:set var="memberTel" value="${loginMember.memberTel}"/>
                            </c:if>
                            
                            <div class="myPage-row">
                                <label>전화번호</label>
                                <span><input type="text" name="memberTel" id="tel" value="${loginMember.memberTel}" maxlength="11"></span>
                            </div>
                            <div id="confirmMessage"> </div>
                            <button class="subBtn">내 정보 수정하기</button>
                        </div>
                    </form>
                </div>

        </main>
    </section>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>

        <c:remove var="message"/>
    </c:if>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/mainPage.js"></script>
    <script src="/resources/js/myPage/myPage.js"></script>
</body>
</html>