<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<aside class="sidebar">

    <article class="admin-info"> <!-- admin-info  -->
        <div class="info-image-area">
            <img id="info-image" src="${loginMember.profileImage}">
        </div>
        <span id="admin-name">${loginMember.memberName}</span>
        <div class="profile-btn-area">
            <a href="/member/mainPage" id="home">본드 홈</a>
            <a href="/logout" id="logout">로그아웃</a>
        </div>
    </article> <!-- admin-profile end -->
    
    <nav class="admin-menu">

        <ul class="drop-down">
            <div class="top-menu">
                <a href="/admin/statistic">대시보드</a>
            </div>
        </ul>
            
        <ul class="drop-down"> 
            <div class="top-menu">밴드 관리</div>
            <li><a class="sub-menu hide" href="/admin/member/list">회원</a></li>
            <li><a class="sub-menu hide" href="/admin/group/list">소모임</a></li>
            <li><a class="sub-menu hide" href="/admin/post/list">게시글</a></li>
        </ul>

        <ul class="drop-down report-menu">
            <div id="alarmDot"></div>
            <div class="top-menu">
                <a href="/admin/report/list">신고</a>
            </div>
        </ul>

    </nav>
    
</aside>