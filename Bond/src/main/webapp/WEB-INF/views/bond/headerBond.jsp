<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>headerBond 페이지</title>

    <link rel="stylesheet" href="/resources/css/bond/headerBond.css">

</head>
<body>
<section class="header-area">
    <header>
        <div>
            <!-- 클릭 시 메인으로 이동하는 로고  -->
            <a href="/member/mainPage">
                <img src="/resources/images/bond/home-logo-white.png" id="home-logo">
            </a>
        </div>

        <div class="header-widget-area">
            <ul class="widget-list">
                <li class="widget-item bell-icon">
                    <!-- 알림 -->
                    <a href="#">
                        <i class="fa-solid fa-bell bell-icon"  style="color: #999;"></i>
                    </a>
                </li>

                <%-- <li class="widget-item chat-icon">
                    <!-- 채팅 -->
                    <a href="#">
                        <i class="fa-solid fa-comment-dots chat-icon" style="color: #999;"></i>
                    </a>
                </li> --%>

                <li class="widget-item">
                    <!-- 내 정보 사진 -->
                    <div class="dropdown">
                        <button type="button" class="dropbtn" onclick="dropDown()">
                            <c:if test="${empty loginMember.profileImage}">
                                <span>
                                    <div class="profile"><i class="fa-solid fa-user" id="profile-photo"></i></div>
                                </span>
                            </c:if>
                            <c:if test="${!empty loginMember.profileImage}"> 
                                <span>
                                    <img src="${loginMember.profileImage}" id="login-profile-photo">
                                </span>
                            </c:if>
                            <i class="fa-solid fa-caret-down caret-icon" id="triangle-icon"></i>
                        </button> 
                        
                        <div id="myDropdown" class="dropdown-content">
                            <c:if test="${loginMember.authority.equals('1')}">
                                    <a href="/admin/mainPage">관리자 홈</a>
                            </c:if>
                            <c:if test="${loginMember.authority.equals('0')}">
                                    <a href="/myPage/myPage">내정보</a>
                            </c:if>
                            <a href="/logout">로그아웃</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </header>
</section>

<nav class="bg nav-fixed">
    <div id="list-nav">
        <ul id="myDiv">
            <li><a class="btn active" href="/bond/${groupNo}">게시글</a></li>
            <li><a class="btn" href="/bond/${groupNo}/album">사진첩</a></li>
            <li><a class="btn" href="/bond/${groupNo}/bondMemberList">멤버</a></li>
            <li><a class="btn" href="/bond/${groupNo}/plan">일정</a></li>
            <%-- <li><a href="/bond/${groupNo}/chatting">채팅</a></li> --%>
        </ul>
    </div>
</nav>
    
</body>
</html>

<script>
    var header = document.getElementById("myDIV");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
    });
}
</script>


<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>