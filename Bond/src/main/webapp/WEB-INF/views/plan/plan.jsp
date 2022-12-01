<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 연습</title>

    
    
    <!-- css -->
    <link rel="stylesheet" href="/resources/css/plan/plan-style.css">

    <!-- fullcalendar script -->
    <script>


    </script>


  </head>
  
  <body>
    <div id='calendar'></div>

    <jsp:include page="insertModal.jsp" />

    <jsp:include page="viewModal.jsp" />
 

    <%-- CDN --%>

    <!-- fullcalendar CDN 방식으로 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.css,npm/fullcalendar@5.11.3/main.min.css">
    <script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.js,npm/fullcalendar@5.11.3,npm/fullcalendar@5.11.3/locales-all.min.js,npm/fullcalendar@5.11.3/locales-all.min.js"></script>

    <%-- jQuery CDN 방식으로 추가 --%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- JS script -->
    <script src="/resources/js/plan/plan.js"></script>

  </body>
</html>