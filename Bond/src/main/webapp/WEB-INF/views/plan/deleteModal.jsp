<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="deleteModal" class="closed">

  <div id="deleteWindow">
    <span>
        일정을 삭제하시겠습니까?
    </span>

    <div class="deleteWindowBtnArea">
        <button id="cancelDeleteBtn" type="button">취소</button>
        <button id="planDeleteBtn" type="button">확인</button>
    </div>


  </div> <!-- end viewWindow -->

</div>