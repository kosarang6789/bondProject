<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 모임 관리</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/layout/layout-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/group-detail-style.css">
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
                    <h3>모임 정보</h3>
                    <a href="/admin/group/list" id="list-btn">
                        목록
                    </a>
                </div>

                <div class="content-body">

                        <div style="width: 900px; height: 900px;">
                         <!--차트가 그려질 부분-->
                            <canvas id="myChart"></canvas>
                        </div>

                </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    
    
    <script src="/resources/js/admin/chart.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>