const selectBtn = document.getElementById("selectBtn");
const contentBody = document.querySelector(".content-body");
const listBody = document.querySelector(".list-body");


// 화면 이동 시 즉시 실행 함수
(() => {
    ajax("", 2)
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

        ajax(keyword.value, opt.value);

    } else {
        alert("숫자만 입력해주세요.")
        opt.focus();
    }
})

// ajax 실행 함수
function ajax(keywordValue, optValue){
    $.ajax({
        url : "/admin/post/list", // 요청 주소
        data : {"keyword": keywordValue, "opt": optValue}, // 파라미터
        type : "GET",
        dataType : "JSON",

        success : (postList) => {

            for(let item of postList) {

                // 폼
                const frm = document.createElement("form");
                frm.classList.add("list-frm");

                // 왜 주소를 따로 입력하면 안될까? 
                // frm.setAttribute("action","/admin/selectMember/{memberNo}");

                const thisPath = "/admin/post/" + item.postNo;
                frm.setAttribute("action", thisPath);
                frm.setAttribute("method", "GET");
                frm.setAttribute("name", "postInfo");
                
                // 버튼
                const bt = document.createElement("button");
                bt.classList.add("list-btn");
    
                // 번호
                const row1 = document.createElement("span");
                row1.classList.add("postNo");
                row1.setAttribute("name","postNo");
                row1.innerText = item.postNo;
    
                // 회원 번호
                const row2 = document.createElement("span");
                row2.classList.add("memberNo");
                row2.innerText = item.memberNo;
    
                // 모임 번호
                const row3 = document.createElement("span");
                row3.classList.add("groupNo");
                row3.innerText = item.groupNo;
    
                // 글 내용
                const row4 = document.createElement("span");
                row4.classList.add("postContent");
                row4.innerText = item.postContent;
    
                // 작성일
                const row5 = document.createElement("span");
                row5.classList.add("postDate");
                row5.innerText = item.postDate;

                // 상태
                const row6 = document.createElement("span");
                row6.classList.add("postDelYN");
                row6.innerText = item.postDelYN;
    
                // 버튼에 번호 ~ 가입 상태 추가
                bt.append(row1, row2, row3, row4, row5);
    
                // 폼에 버튼 추가
                frm.append(bt);
    
                // content-body에 폼 추가
                listBody.append(frm);
            }

        },
        error : () => {
            console.log("회원 리스트 검색 실패")
        }
    });

}