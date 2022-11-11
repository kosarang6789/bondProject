<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 신고 관리</title>

    <link rel="stylesheet" href="../../../resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="../../../resources/css/admin/report-detail-style.css">
    <link rel="stylesheet" href="../../../resources/css/admin/searchbar-style.css">
    <link rel="stylesheet" href="../../../resources/css/admin/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

            <section class="content">
                <div class="content-header">
                    <h3>게시물 제목</h3>
                </div>
                
                <div class="content-body">
                    <a href="/admin/reportList" id="list-btn">
                        <img src="/resources/images/admin/go-back-list.png">
                        목록
                    </a>

                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>신고번호</label>
                            <div class="detail-info-col2">01</div>
                            <label>신고일</label>
                            <div class="detail-info-col2">2022-11-01</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고 유형</label>
                            <div class="detail-info-col">회원</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고 사유</label>
                            <div class="detail-info-col">마음에 안듦</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고자</label>
                            <div class="detail-info-col">철수</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고 대상</label>
                            <div class="detail-info-col">짱구</div>
                        </div>
                    </div>
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>처리여부</label>
                            <div class="detail-info-col2">N</div>
                            <label>결과선택</label>
                            <div class="detail-info-col2">
                                <select id="resultSelect" name="result">
                                    <option value="suspend">정지</option>
                                    <option value="reject">반려</option>
                                </select>
                                <button id="resultBtn" name="resultBtn">확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>처리일</label>
                            <div class="detail-info-col2">2022-11-11</div>
                            <label>결과</label>
                            <div class="detail-info-col2">7일 정지</div>
                        </div>
                    </div>
                </div>



            <div class="content-footer">
            </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/sidebar.js"></script>
</body>
</html>