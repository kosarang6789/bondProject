<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<aside class="sidebar">

    <article class="admin-info"> <!-- admin-info  -->
        <div class="info-image-area">
            <img id="info-image" src="/resources/images/admin-profile-icon.png">
        </div>
        <span>관리자1</span>
        <div class="profile-btn-area">
            <a href="#" id="home">밴드 홈</a>
            <a href="/logout" id="logout">로그아웃</a>
        </div>
    </article> <!-- admin-profile end -->
    
    <nav class="admin-menu">
        <ul>
            <a href="#">공지사항</a>
        </ul>
            
        <ul> 밴드 관리
            <li><a href="/admin/memberList">- 회원</a></li>
            <li><a href="/admin/groupList">- 소모임</a></li>
            <li><a href="/admin/postList">- 게시글</a></li>
        </ul>

        <ul>
            <a href="#">신고</a>
        </ul>

    </nav>
    
</aside>