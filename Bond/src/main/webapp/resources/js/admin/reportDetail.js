// 목록 버튼 입력 시 페이지네이션 유지
// 버튼 선언
const listBtn = document.getElementById("list-btn");

// 이벤트 추가
listBtn.addEventListener("click", () => {
    const pathname = location.pathname;
    const queryString = location.search;
    console.log(pathname);
    console.log(queryString);

    location.href = "admin/report";
})

// const goToListBtn = document.getElementById("goToListBtn");

// goToListBtn.addEventListener("click", () => {

//     // location은 window, dom, bom 중 bom에 있는 객체
//     // location : 주소, 주소창과 관련된 내장 객체
//     // location.href : 현재 주소(전체)
//     // location.href = "주소" : 작성된 주소를 요청
//     // location.pathname : 현재 요청 주소만을 반환(프로토콜, ip, 포트 제외)
//     // location.search : 쿼리스트링만 반환

//     const pathname = location.pathname; // /board/1/1500

//     const queryString = location.search; // ?cp=7

//     const url = pathname.substring(0, pathname.lastIndexOf("/")) + queryString; // /board/1?cp=7

//     location.href = url;

// })