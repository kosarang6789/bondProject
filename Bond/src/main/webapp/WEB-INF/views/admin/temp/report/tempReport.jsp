<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>임시 신고 준비 화면</title>
</head>
<body>
    <select id="target">
        <option value="member">회원</option>
        <option value="group">모임</option>
        <option value="post">게시글</option>
    </select>
    <br>
    <span>번호</span>
    <input type="text" id="input">
    <button type="button" id="reportBtn">신고하기</button>




    <script src="/resources/js/admin/tempReport.js"></script>

</body>
</html>