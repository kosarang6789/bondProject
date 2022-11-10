<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header-fixed">
    <section class="header-section">
        <!-- 클릭 시 메인으로 이동하는 로고  -->
        <a href="/">
            <img src="images/home-logo-white.png" id="home-logo">
        </a>

        <div class="header-widget-area">
            <ul class="widget-list">
                <li class="widget-item bell-icon">
                    <!-- 알림 -->
                    <a href="#">
                        <i class="fa-solid fa-bell bell-icon"  style="color: #999;"></i>
                    </a>
                </li>

                <li class="widget-item chat-icon">
                    <!-- 채팅 -->
                    <a href="#">
                        <i class="fa-solid fa-comment-dots chat-icon" style="color: #999;"></i>
                    </a>
                </li>

                <li class="widget-item">

                    <c:choose>
                        <%-- 로그인 X인 경우 --%>
                        <c:when test="${empty sessionScope.loginMember}">
                        <a href="/"> 메인 페이지 </a>
                        |
                        <a href="/member/login"> 로그인 </a>            
                        
                        </c:when>

                        <%-- 로그인 O인 경우 --%>
                        <!-- 내 정보 사진 -->
                        <c:otherwise>
                        <label for="header-menu-toggle">
                            <button type="button" class="box">
                                <img src="images/profile-photo.png" id="profile-photo">
                            </button> 
                            
                            <i class="fa-solid fa-caret-down caret-icon"></i>
                            <input type="checkbox" id="header-menu-toggle">
                            <div id="header-menu">
                                <a href="#">내정보</a>
                                <a href="#">로그아웃</a>
                            </div>
                        </label>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </section>
</header>

<nav class="bg nav-fixed">
    <div id="list-nav">
        <ul>
                <li><a href="/bond/meetingAfterLogin">게시글</a></li>
                <li><a href="/bond/album">사진첩</a></li>
                <li><a href="#">일정</a></li>
                <li><a href="#">멤버</a></li>
            </ul>
    </div>
</nav>
    