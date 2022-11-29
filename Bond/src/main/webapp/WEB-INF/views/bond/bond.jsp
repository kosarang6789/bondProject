<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="postList" value="${map.postList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groupInfo.groupName} | BOND</title>

    <link rel="stylesheet" href="/resources/css/bond/bond.css">
    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBond.jsp"/> 
        <div id="container">
            <!-- 1번 영역 -->
            <aside id="info">
                <div id="info-inner">
                    <div class="side-cover">
                        <a href="#" class="cover">
                            <c:choose>
                                <c:when test="${not empty groupInfo.groupImage}">
                                    <img src="${groupInfo.groupImage}" id="cover-img">  
                                </c:when>
                                <c:otherwise>
                                    <img src="/resources/images/bond/profile/non-profile.png">
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </div>

                    <div class="band-name">
                        <a href="#" class="uri-text">${groupInfo.groupName}</a>
                    </div>

                    <p class="member">
                        <a href="#" class="member-count">멤버 ${groupInfo.memberCount}</a>
                    </p>

                    <div class="band-info">
                        <p class="band-description">${groupInfo.groupComment}</p>
                        <a href="#" class="more-link">...더보기</a>
                    </div>

                    <div class="btn-box">
                        <button type="button" class="write-button">글쓰기</button>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                    <div class="sidebar-under-icon">
                        <div class="band-setting-section">
                            <a href="#" class="band-setting-link sidebar-font"> 
                                <i class="fa-solid fa-gear sidbar-icon"></i>밴드 설정
                            </a>
                            
                        <div class="band-setting-list">
                            <ul class="band-setting-item">
                                <li>
                                    <a class="report-band sidebar-font" id="reportBtn">
                                        <i class="fa-solid fa-bell sidbar-icon"></i>신고하기
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="leave-band sidebar-font">
                                        <i class="fa-solid fa-person-walking-arrow-right sidbar-icon"></i>탈퇴하기
                                    </a>
                                </li>
                            </ul>
                        </div>  
                        </div>
                    </div>
                </div>
            </aside>

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
                            <button type="button" class="content-button"></button>
                            <div class="content-editor">
                                새로운 소식을 남겨보세요. <br>
                                공개 밴드에 남긴 글은 누구나 볼 수 있습니다.
                            </div>
                        </div>

                        <div class="toolbar-area">
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
                    </div> 

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
                                    <div class="post-wrap">
                                        <div class="content-card">
                                            <div class="post-list-view">
                                                <div class="post-author-view">
                                                    <div class="uprofile">
                                                        <img class="uprofile-inner" src="${post.memberImage}"/>
                                                    </div>

                                                    <div class="post-info">
                                                        <strong class="post-info-name">${post.memberName}</strong>
                                                    
                                                        <div class="post-list-info">
                                                            <a href="#" class="post-info-date">${post.postDate}</a>
                                                        </div>
                                                    </div>    
                                                </div>

                                                <div class="post-body">
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
                                                            <button type="button" class="emotion-view">
                                                                <span class="emotion-wrap">
                                                                    <span class="icon">
                                                                        <i class="fa-regular fa-face-kiss-wink-heart face-icon"></i>
                                                                    </span>
                                                                </span>
                                                                <span class="count"></span>
                                                            </button>
                                                            <button type="button" class="comment">
                                                                댓글 <span class="count">1</span>
                                                            </button>
                                                            <button type="button" class="comment-toggle">
                                                                <i class="fa-solid fa-angle-down"></i>
                                                            </button>
                                                        </span>

                                                        <span class="share-read">
                                                            <span class="gSrOnly">읽음</span>
                                                            <i class="fa-solid fa-eye" style="color: #555;"></i>
                                                            <span class="count">2</span>
                                                        </span>
                                                    </div>

                                                    <div class="post-added">
                                                        <div class="post-add-box">
                                                            <div class="add-col">
                                                                <a href="#" class="emotion-main-btn">
                                                                    <span class="icon-face-emotion">
                                                                        <i class="fa-regular fa-face-smile"></i>
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

            <!-- 3번 영역 -->
            <div id="banner">
                <div id="band-photo-area">
                    <section class="band-photo">
                        <h2 class="tit">최근 사진</h2>
                        <div class="photo-body">
                            <div class="photo-list">
                                <a href="#" class="banner-box">
                                    <img src="/resources/images/bond/banner.jpeg" class="banner-img">
                                </a>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                            </div>
                        </div>
                        <a href="#" class="more-button">더보기</a>
                    </section>
                </div>
            </div>

            <a href="#">
                <button type="button" class="btn-go-to-top">
                    <i class="fa-solid fa-arrow-up go-to-top-icon"></i>
                </button>
            </a>
        </div>
    
    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>
        <%-- message 1회 출력 후 모든 scope에서 message 삭제 --%>
        <c:remove var="message" />
    </c:if>

    <script>
        let cp = 0;
        const groupNo = "${groupNo}"
    
    </script>


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

    <script src="/resources/js/bond/bond.js"></script>
    
</body>