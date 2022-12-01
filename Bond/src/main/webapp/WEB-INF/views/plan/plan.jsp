<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 연습</title>

    <!-- fullcalendar cdn -->
    <script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.js,npm/fullcalendar@5.11.3,npm/fullcalendar@5.11.3/locales-all.min.js,npm/fullcalendar@5.11.3/locales-all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.css,npm/fullcalendar@5.11.3/main.min.css">
    
    <!-- css -->
    <link rel="stylesheet" href="/resources/css/plan/plan-style.css">

    <!-- fullcalendar script -->
    <script>


    </script>


  </head>
  
  <body>
    <div id='calendar'></div>

    <div id="modal" style="display:none">

      <div id="window">
        <div class="window-header">
          <h3>일정 추가하기</h3>
          <span id="closeModalButton">&times;</span>
        </div> <!-- end window-header -->

        <div class="window-body">

          <div id="titleBox">
            제목 : <input type="text" id="inputTitle">
          </div> <!-- end titleBox -->

          <div id="colorBox">
            색깔
            <label>
              <input type="radio" name="planColor" value="rgb(255,60,45)">
              <div class="palette" style="background-color:rgb(255,60,45)"></div>
            </label>

            <label>
              <input type="radio" name="planColor" value="rgb(240,200,55)">
              <div class="palette" style="background-color:rgb(240,200,55)"></div>
            </label>

            <label>
              <input type="radio" name="planColor" value="rgb(55,136,216)">
              <div class="palette" style="background-color:rgb(55,136,216)"></div>
            </label>

          </div>
  
          <div id="dateBox">
            <div class="dateBoxRow">
              시작 날짜 <input type="date" id="inputStartDate"> <input type="time" id="inputStartTime">
            </div>
            <div class="dateBoxRow">
              종료 날짜 <input type="date" id="inputEndDate">   <input type="time" id="inputEndTime">
            </div>
          </div> <!-- end dateBox -->
  
          <div id="contentBox">
            내용 : <input type="text" id="inputContent">
          </div> <!-- end commentBox -->
  
          <div id="buttonBox">
            <button type="button" id="confirmButton">확인</button>
          </div> <!-- end buttonBox -->

        </div> <!-- end window-body -->
        

      </div> <!-- end window -->

    </div> <!-- end modal -->

    <%-- jQuery CDN 방식으로 추가 --%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- script -->
    <script src="/resources/js/plan/plan.js"></script>
  </body>
</html>