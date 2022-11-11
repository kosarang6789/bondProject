<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 공지사항</title>

    <link rel="stylesheet" href="/resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="/resources/css/admin/notice-detail-style.css">
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
                    <h3>공지사항</h3>
                </div>
                
                <div class="content-body">
                    <a href="noticeList.html" id="list-btn">
                        <img src="/resources/images/admin/go-back-list.png">
                        목록
                    </a>
                    
                    <div class="notice-detail">
                        <h3 id="noticeTitle">개인정보는 누구에게도 알려주지 마세요.</h3>
                        <span id="noticeDate">2022년 10월 22일</span>
                        <span id="noticeStatus">공개</span>
                        <form action="#" id="noticeEdit">
                            <button >수정</button>
                        </form>
                        <form action="#" id="noticeDel">
                            <button>삭제</button>
                        </form>
                        <p>
                            아이디, 비밀번호를 요구하지 않습니다.
                            내용을 적는 곳입니다. 내용을 적어주세요.
                        </p>
                    </div>

                </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/sidebar.js"></script>
</body>
</html>