<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div id="detailModal" class="closed modalDim">

    <div id="detailWindow">
        <img src="/resources/images/common/plan-dots.png" id="openDetailModalMenu">
        <div id="detailModalMenu" class="closed">
          <div id="openEditPage">수정하기</div>
          <div id="planDelete">삭제하기</div>
        </div>

        <div id="detailBody"> <!-- 일정 -->
          <div id="headerBox"> <!-- 일정 정보 -->
            
            <div id="headerLeftBox">
              
              <div id="dateBox"> <!-- 일 -->
              
              </div>

              <div id="dayBox"> <!-- 요일 -->

              </div>

            </div>

            <div id="headerRightBox">
              
              <div id="titleBox"> <!-- 제목 상자 -->

              </div>

              <div id="periodBox"> <!-- 기간 상자 -->

              </div>

              <div id="labelBox">

                <div id="selectedColor" class="palette"> <!-- 컬러 상자 -->

                </div>

                <div id="memberNameBox"> <!-- 회원 상자 -->

                </div>

              </div> <!-- end labelBox -->

            </div> <!-- end headerRightBox -->

          </div>
          <div id="contentBox"> <!-- 일정 내용 -->

          </div>
        </div>

        <!-- titleBox, periodBox, colorBox, contentBox,-->


      
    </div> <!-- end viewWindow -->
  

</div> <!-- end modal -->