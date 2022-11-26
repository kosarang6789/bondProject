<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="header-area">
    <header>
        <div>
            <!-- 클릭 시 메인으로 이동하는 로고  -->
            <a href="#">
                <img src="/resources/images/common/home-logo.png" id="home-logo">
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

                <li class="widget-item chat-icon">
                    <!-- 채팅 -->
                    <a href="#">
                        <i class="fa-solid fa-comment-dots chat-icon" style="color: #999;"></i>
                    </a>
                </li>

                <li class="widget-item">
                    <!-- 내 정보 사진 -->
                    <div class="dropdown">
                        <button type="button" class="dropbtn" onclick="dropDown()">
                            <span>
                                <div class="profile"> 
                                    <i class="fa-solid fa-user" id="profile-photo"> </i>
                                </div>
                            </span>
                            <i class="fa-solid fa-caret-down caret-icon" id="triangle-icon"></i>
                        </button> 
                        
                        <div id="myDropdown" class="dropdown-content">
                            <a href="#">내정보</a>
                            <a href="/logout">로그아웃</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </header>
</section>