<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="insertModal" style="display:none">

  <div id="insertWindow">
    <div class="insert-header">
      <h3>일정 추가하기</h3>
      <span id="closeInsertModal">&times;</span>
    </div> <!-- end window-header -->

    <div id="insertBody">

      <div id="titleBox">
      </div> <!-- end titleBox -->

      <div id="colorBox">
      </div> <!-- end colorBox -->

      <div id="dateBox">
        <div class="dateBoxRow" id="startBox">
        </div>
        <div class="dateBoxRow" id="endBox">
        </div>
      </div> <!-- end dateBox -->

      <div id="contentBox">
      </div> <!-- end commentBox -->

      <div id="buttonBox">
        <button type="button" id="confirmButton">확인</button>
      </div> <!-- end buttonBox -->

    </div> <!-- end window-body -->
    

  </div> <!-- end window -->

</div> <!-- end modal -->