<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="postList" value="${map.postList}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${member.groupName} | BOND</title>

    <link rel="stylesheet" href="/resources/css/bond//openYes.css">
    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBondX.jsp"/>    

        <div id="container">
            <!-- 1번 영역 -->
            <aside id="info">
                <div id="info-inner">
                    <div class="side-cover">
                    <c:forEach var="{member" items="${member}">
                        <li class="group">
                            <a href="/bond/${member.groupNo}">
                                <div class="group-img">
                                    <c:choose>
                                        <c:when test="${not empty member.groupImage}">
                                            <img src="${member.groupImage}" id="cover-img">  
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/resources/images/bond/profile/no-profile.png" id="cover-img">
                                        </c:otherwise>
                                    </c:choose>
                                    <%-- <img src="/resources/images/member/main2/group-recommend/group-english.jpg"> --%>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    </div>

                    <div class="band-name">
                        <a href="#" class="uri-text">${member.groupName}</a>
                    </div>

                    <p class="member">
                        <a href="#" class="member-count">멤버 ${member.memberCount}</a>
                    </p>

                    <div class="share">
                        <a href="#" class="share-address">
                            <i class="fa-solid fa-arrow-up-right-from-square"></i>
                            밴드 링크 복사
                        </a>
                    </div>    
                
                    <div class="btn-box">
                        <button type="button" class="write-button">밴드 가입하기</button>
                        <div class="sidebar-under-icon">
                            <div class="band-setting-section">
                                <a href="#" class="band-setting-link sidebar-font"> 
                                    밴드 정보 보기 >
                                </a>
                            </div>
                        </div>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                </div>
            </aside>

            <!-- 2번 영역 -->
            <div class="band-intro-list">
                <div class="band-intro">
                    <h2 class="band-intro-title">밴드 소개</h2>
                    <div class="band-intro-detail">
                        <p class="desc">${member.groupComment}</p>
                        <div class="intro-option">
                            <div class="intro-option-box">
                                <ul class="select-keyword-list">
                                    <li class="select-keyword-item">취미</li>
                                    <li class="select-keyword-item">심리학</li>
                                    <li class="select-keyword-item">운세</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <ul class="intro-photo collage">
                        <li class="collage-photo">
                            <a href="#">
                                <img src="/resources/images/bond/intro-photo1.PNG">
                            </a>
                        </li>
                        <li class="collage-photo">
                            <a href="#">
                                <img src="/resources/images/bond/intro-photo2.PNG">
                            </a>
                        </li>
                        <li class="collage-photo">
                            <a href="#">
                                <img src="/resources/images/bond/intro-photo3.PNG">
                            </a>
                        </li>
                        <li class="collage-photo">
                            <a href="#">
                                <img src="/resources/images/bond/intro-photo4.PNG">
                            </a>
                        </li>
                    </ul>

                    <div class="intro-option-statics">
                        <h2 class="intro-title">이 밴드의 활동 정보</h2>
                        <div class="intro-info-wrap">
                            <p class="intro-desc">
                                개설일
                                <span class="intro-desc-data">${member.groupDate}</span>
                            </p>
                            <p class="intro-desc">
                                최근 새글
                                <span class="intro-desc-data">1건</span>
                            </p>
                            <p class="intro-desc">
                                최근 가입
                                <span class="intro-desc-data">10명</span>
                            </p>
                        </div>
                    </div>

            <!-- 2번 영역 -->
            <main id="board-list">
                <div class="post-write-form">
                    <div class="board-search">
                        <form action="#" class="search-form">
                            <div class="input-search-form">
                                <label class="gSrOnly" for="input-search" >글 내용, 작성자 검색</label>
                                <input type="text" id="input-search" placeholder="글 내용, 작성자 검색"
                                    maxlength="20">
                                <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass search-icon"></i></button>
                            </div>
                        </form>
                    </div>
                    
                    <div class="main-content">   
                        <div>
                            <button id="postWrite-btn" class="content-button"></button>
                            <div class="content-editor">
                                새로운 소식을 남겨보세요. <br>
                                공개 밴드에 남긴 글은 누구나 볼 수 있습니다.
                            </div>
                        </div>

                        <%-- <div class="toolbar-area">
                            <ul class="toolbar">
                                <li class="toolbaritem">
                                    <i class="fa-solid fa-image board-icon"></i>
                                </li>
                                <li class="toolbaritem">
                                    <i class="fa-solid fa-check-to-slot board-icon"></i>
                                </li>
                                <li class="toolbaritem">
                                    <i class="fa-solid fa-divide board-icon"></i>
                                </li>
                            </ul>
                        </div>
                    </div>  --%>

                    <%-- 게시물 조회 --%>
                    <div class="post-wrap">
                        
                        <c:choose>
                            <c:when test="${empty postList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <tr>
                                    <th colspan="6">게시글이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>

                            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 있다면 -->
                                <c:forEach var="post" items="${postList}">
                                    <div data-viewname="post-list-view" class="post-wrap">
                                        <div class="content-card">
                                            <div class="post-list-view">
                                                <div class="post-author-view">
                                                    <%-- 작성자 프로필 이미지 --%>
                                                    <div class="uprofile">
                                                        
                                                        <c:if test="${empty post.memberImage}">
                                                            <%-- 프로필 이미지가 없을 경우 --%>
                                                            <img class="uprofile-inner" 
                                                            src="/resources/images/member/profile/defaultProfile.png" />
                                                        </c:if>
                                                        <c:if test="${!empty post.memberImage}">
                                                            <%-- 프로필 이미지가 있을 경우 --%>
                                                            <img class="uprofile-inner" src="${post.memberImage}"/>
                                                        </c:if>
                                                    </div>

                                                    <div class="post-info">
                                                        <%-- 작성자 이름 --%>
                                                        <strong class="post-info-name">${post.memberName}</strong>
                                                        <%-- 작성 날짜 --%>
                                                        <div class="post-list-info">
                                                            <a href="#" class="post-info-date">${post.postDate}</a>
                                                        </div>
                                                    </div>    
                                                </div>

                                                <%-- 게시물 내용 --%>
                                                <div class="post-body" id="${post.postNo}">
                                                    <div class="post-text">
                                                        <p class="text-body">
                                                            ${post.postContent}
                                                        </p>
                                                        <a href="#" class="more-link">...더보기</a>
                                                    </div>

                                                </div>

                                                <div class="post-count-view">
                                                    <div class="post-count">
                                                        <span class="face-comment">
                                                            <%-- 좋아요 --%>
                                                            <button type="button" class="emotion-view">
                                                                <span class="emotion-wrap">
                                                                    <span class="icon">
                                                                        <i class="fa-regular fa-thumbs-up"></i>
                                                                    </span>
                                                                </span>
                                                                <span class="count eCount">${post.likeCount}</span>
                                                            </button>
                                                            <%-- 댓글 --%>
                                                            <button type="button" class="comment">
                                                                댓글 <span class="count rCount">${post.replyCount}</span>
                                                            </button>
                                                            <%-- 댓글 더보기 --%>
                                                            <button type="button" class="comment-toggle">
                                                                <i class="fa-solid fa-angle-down"></i>
                                                            </button>
                                                        </span>
                                                        <%-- 조회수 --%>
                                                        <span class="share-read">
                                                            <span class="gSrOnly">읽음</span>
                                                            <i class="fa-solid fa-eye" style="color: #555;"></i>
                                                            <span class="count vCount">${post.postView}</span>
                                                        </span>
                                                    </div>

                                                    <div class="post-added">
                                                        <div class="post-add-box">
                                                            <div class="add-col">
                                                                <a href="#" class="emotion-main-btn">
                                                                    <span class="icon-face-emotion">
                                                                        <i class="fa-regular fa-thumbs-up"></i>
                                                                    </span>
                                                                    <span class="post-text">좋아요</span>
                                                                </a>
                                                            </div>
                                                            <div class="add-col">
                                                                <a href="#" class="comment-main-btn">
                                                                    <span class="comment">
                                                                        <span class="icon-comment">
                                                                            <i class="fa-regular fa-message"></i>
                                                                        </span>
                                                                        <span class="post-text">댓글쓰기</span>
                                                                    </span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>


                    </div>

                    <div id="pageTarget" style="height:20px"></div>
                </div>
            </main>
                </div>
            </div>

            <a href="#">
                <button type="button" class="btn-go-to-top">
                    <i class="fa-solid fa-arrow-up go-to-top-icon"></i>
                </button>
            </a>
        </div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

    <script src="/resources/js/bond/bond.js"></script>

</body>