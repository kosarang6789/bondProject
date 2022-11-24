const selectBtn = document.getElementById("selectBtn");
const contentBody = document.querySelector(".content-body");
const listBody = document.querySelector(".list-body");

// 최초 이동 시 화면
(() => {
    ajax("", 2);
})()

// 목록 검색
selectBtn.addEventListener("click", () => {

    const keyword = document.getElementById("keyword");
    const opt = document.getElementById("opt");
    
    regEx = /^\d+$/;

    let fL = 1;

    if(opt.value == 1) {
        if(!regEx.test(keyword.value)) {
            fL = 2;
        }
    }

    if(fL == 1) {
    
        listBody.innerHTML = "";
        
        ajax(keyword.valuem, opt.value);

    } else {
        alert("숫자만 입력해주세요.");
        opt.focus();
    }

})


// ajax 함수
function ajax(keywordValue, optValue){
    $.ajax({
        url : "/admin/group/list", // 요청 주소
        data : {"keyword": keywordValue, "opt": optValue}, // 파라미터
        type : "GET",
        dataType : "JSON",

        success : (groupList) => {

            for(let item of groupList) {

                // 폼
                const frm = document.createElement("form");
                frm.classList.add("list-frm");

                const thisPath = "/admin/group/" + item.groupNo;

                frm.setAttribute("action", thisPath);
                frm.setAttribute("method", "GET");
                frm.setAttribute("name", "groupInfo");
                
                // 버튼
                const bt = document.createElement("button");
                bt.classList.add("list-btn");
    
                // 번호
                const row1 = document.createElement("span");
                row1.classList.add("groupNo");
                row1.setAttribute("name","groupNo");
                row1.innerText = item.groupNo;
    
                // 주제코드
                const row2 = document.createElement("span");
                row2.classList.add("topicCode");
                row2.innerText = item.topicName;
    
                // 이름
                const row3 = document.createElement("span");
                row3.classList.add("groupName");
                row3.innerText = item.groupName;
    
                // 모임 생성일
                const row4 = document.createElement("span");
                row4.classList.add("groupDate");
                row4.innerText = item.groupDate;
    
                // 공개 여부
                const row5 = document.createElement("span");
                row5.classList.add("openYN");
                row5.innerText = item.openYN;

                // 모임 상태
                const row6 = document.createElement("span");
                row6.classList.add("groupStatus");
                row6.innerText = item.groupStatus;
                
                // 버튼에 번호 ~ 가입 상태 추가
                bt.append(row1, row2, row3, row4, row5, row6);
    
                // 폼에 버튼 추가
                frm.append(bt);
    
                // content-body에 폼 추가
                listBody.append(frm);
            }

        },
        error : () => {
            console.log("모임 리스트 검색 실패")
        }
    });
}