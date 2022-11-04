<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="searchbar" action="#" method="GET">

    <select name="type">
        <option value="">분류1</option>
        <option value="">분류2</option>
        <option value="">분류3</option>
    </select>

    <div class="keyword-box">
        <div class="input-box"><input type="text" name="keyword"></div>
        <button class="btn">검색</button>
    </div>

    <select name="number">
        <option value="">50</option>
        <option value="">100</option>
        <option value="">200</option>
    </select>

</form> <!-- end .searchbar -->