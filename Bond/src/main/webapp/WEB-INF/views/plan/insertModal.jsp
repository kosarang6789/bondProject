<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="insertModal" class="closed">

  <div id="insertWindow">
    <div class="insert-header">
      <h3>일정 만들기</h3>
      <span id="closeInsertModal">&times;</span>
    </div> <!-- end window-header -->

    <div id="insertBody">
      <div id="inputTitleBox">
        <input type="text" id="inputTitle" placeholder="일정 제목">
      </div>

      <div id="inputContentBox">
        <textarea id="inputContent" placeholder="일정 설명"
        rows="5" maxlength="300"></textarea>
      </div>

      <div id="inputDateBox">
        
        <div id="startBox" class="dateBoxRow">
          <div id="startBoxText">시작</div>
          <input type="date" id="inputStartDate">
          <input type="time" id="inputStartTime">
        </div>

        <div id="endBox" class="dateBoxRow">
          <div id="endBoxText">종료</div>
          <input type="date" id="inputEndDate">
          <input type="time" id="inputEndTime">
        </div>

        <div id="allDayBox" class="dateBoxRow">
          <input type="checkbox" id="inputCheckbox">
          <div id="allDayBoxText">하루종일</div>
        </div>

      </div>

      <div id="inputColorBox">
        <div id="colorBoxText">캘린더 색깔</div>
        
        <label> <!-- 빨강 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(255,60,45)" checked>
          <div class="palette" style="background-color:rgb(255,60,45)"></div>
        </label>

        <label> <!-- 주황 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(250,170,35)">
          <div class="palette" style="background-color:rgb(250,170,35)"></div>
        </label>

        <label> <!-- 노랑 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(240,200,55)">
          <div class="palette" style="background-color:rgb(240,200,55)"></div>
        </label>

        <label> <!-- 초록 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(30,180,70)">
          <div class="palette" style="background-color:rgb(30,180,70)"></div>
        </label>

        <label> <!-- 파랑 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(55,136,216)">
          <div class="palette" style="background-color:rgb(55,136,216)"></div>
        </label>

        <label> <!-- 남색 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(0,20,160)">
          <div class="palette" style="background-color:rgb(0,20,160)"></div>
        </label>

        <label> <!-- 보라 -->
          <input type="radio" class="paletteRadio" name="planColor" value="rgb(180,140,245)">
          <div class="palette" style="background-color:rgb(180,140,245)"></div>
        </label>
          
      </div>

      
    </div> <!-- end insertBody -->
    
    <div id="insertFoot">
      <button type="button" id="confirmBtn">완료</button>
    </div>

  </div> <!-- end window -->

</div> <!-- end modal -->