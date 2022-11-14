<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 게시물 관리</title>

    <link rel="stylesheet" href="/resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="/resources/css/admin/post-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/searchbar-style.css">
    <link rel="stylesheet" href="/resources/css/admin/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

            <section class="content">
                <div class="content-header">
                    <h3>게시물 제목</h3>
                    <a href="/admin/noticeList" id="list-btn">
                        목록
                    </a>
                </div>
                
                <div class="content-body">
                    
                    <div class="post-detail">
                        <div class="title-area">
                            <div class="postNo">50</div>
                            <div class="groupNo">12345</div>
                            <div class="groupName">여행모임</div>
                            <div class="postDelYN">게시</div>
                        </div>

                        <div class="title-area">
                            <div class="memberNo">1</div>
                            <div class="memberName">김일일</div>
                            <div class="postDate">2022-11-07</div>
                        </div>

                        <div class="content-area">
                            <div class="postContent">내용이 들어갈 영역</div>
                        </div>

                        <div class="img-area">
                            <div class="img-box"><img src="/resources/images/admin/admin-no-images.png"></div>
                            <div class="img-box"></div>
                            <div class="img-box"></div>
                            <div class="img-box"></div>
                            <div class="img-box"></div>
                        </div>
                    </div>
                </div>



            <div class="content-footer">
            </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>