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

    <link rel="stylesheet" href="/resources/css/admin/layout/layout-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/post-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/add/searchbar-style.css">
    <link rel="stylesheet" href="/resources/css/admin/add/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/add/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
	<jsp:include page="/WEB-INF/views/admin/add/sidebar.jsp" />

            <section class="content">
                <div class="content-header">
                    <h3>게시물 제목</h3>
                    <a href="/admin/notice/list" id="list-btn">
                        목록
                    </a>
                </div>
                
                <div class="content-body">
                    
                    <div class="post-detail">
                        <div class="title-area">
                            <div class="postNo">${post.postNo}</div>
                            <div class="groupNo">${post.groupNo}</div>
                            <div class="groupName">${post.groupName}</div>
                            <div class="postDelYN">${post.postDelYN}</div>
                        </div>

                        <div class="title-area">
                            <div class="memberNo">${post.memberNo}</div>
                            <div class="memberName">${post.memberName}</div>
                            <div class="postDate">${post.postDate}</div>
                        </div>

                        <div class="content-area">
                            <div class="postContent">${post.postContent}</div>
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