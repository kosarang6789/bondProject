<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="detailModal" class="closed">

  <div id="detailWindow">
      <span id="openDetailModalMenu">...</span>
      <div id="detailModalMenu" class="closed">
        <div id="planUpdate">수정하기</div>
        <div id="planDelete">삭제하기</div>
      </div>

      <div id="detailBody">
        <jsp:include page="deleteModal.jsp" />
      </div>

      
  </div> <!-- end viewWindow -->
  

</div> <!-- end modal -->
