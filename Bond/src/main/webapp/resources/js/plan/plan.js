// fullcalendar 불러오기
function loadCalendar(){ 
    // document.addEventListener('DOMContentLoaded', () => {

            // 캘린더 예시
        // calendar.addEvent({
        //     title: 'dynamic event',
        //     start: startDate,
        //     end: endDate,
        //     allDay: true,
        //     backgroundColor: 'red'
        // });

        // fullcalendar 관련 js
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: 'ko',
            initialView: 'dayGridMonth',

            headerToolbar : {
                left: 'title',
                right: 'addEventButton'
            },
            // 일정 추가 모달창 열기
            customButtons : {
                addEventButton : {
                    text: '일정 추가하기',
                    click: function() {

                        const insertModal = document.getElementById("insertModal");
                        insertModal.classList.toggle("closed");

                        makeInsertBody();
                    }
                }
            },

            // 일정 조회 모달창 열기
            eventClick: function(info) {
                const thisId = info.event.id;

                const detailModal = document.getElementById("detailModal");
                detailModal.classList.toggle("closed");

                makePlanDetail(thisId);
            }
            
        });

        // 달력에 정보를 뿌리는 함수 getAllPlan
        function getAllPlan(){
            $.ajax({
                url : "/plan/select/list",
                data : {"groupNo": 1},
                type : "POST",
                dataType : "JSON",

                success : (planList) => {
                for(let item of planList) {

                    if(item.planAllday==='Y') { // 시간을 설정 안한경우
                        calendar.addEvent({
                            id: item.planNo,
                            title: item.planTitle,
                            start: item.planStart,
                            end : item.planEnd,
                            allDay: true,
                            backgroundColor: item.planColor,
                        });
                    }

                    if(item.planAllday==='F') { // 시간을 설정한 경우
                        calendar.addEvent({
                            id: item.planNo,
                            title: item.planTitle,
                            start: item.planStart,
                            end : item.planEnd,
                            allDay: false,
                            backgroundColor: item.planColor,
                        });
                    }
                }
                }
            })
        }

        // 처음 이동 시 달력 정보를 전부 가져옴
        (() => {
            getAllPlan()
        })()

    // 캘린더 렌더링
    calendar.render();

    // }); // end full calander
}

(() => {
    loadCalendar();
})()


/* 일정 추가 모달창 js */

// 일정 추가 모달창 닫기
const closeInsertModal = document.getElementById("closeInsertModal");

closeInsertModal.addEventListener("click", () => {
    insertModal.classList.toggle("closed");
    clearInsertBody();
})

// 모달창에서 확인 버튼을 누르면 일정을 업데이트함
const confirmBtn = document.getElementById("confirmBtn");

if(confirmBtn != null) {

    confirmBtn.addEventListener("click", () => {
    
        const inputTitle = document.getElementById("inputTitle").value;
        const inputContent = document.getElementById("inputContent").value;
        let inputStart = document.getElementById("inputStartDate").value;
        let inputEnd = document.getElementById("inputEndDate").value;
        const inputColor = document.querySelector("input[name='planColor']:checked").value;
    
        const inputCheckbox = document.getElementById("inputCheckbox");
        
        let inputAllday = 'Y';

        // 하루종일이 체크되지 않은 경우
        if(!inputCheckbox.checked) {
            const inputStartTime = document.getElementById("inputStartTime").value;
            const inputEndTime = document.getElementById("inputEndTime").value;

            inputStart += "T" + inputStartTime + ":00";
            inputEnd += "T" + inputEndTime + ":00";

            inputAllday = 'F';
        }

        // 비동기로 일정 업데이트(ajax)
        $.ajax({
            url : "/plan/insert",
            data : {
                    "groupNo" : 1,
                    "inputTitle" : inputTitle,
                    "inputContent" : inputContent,
                    "inputStart" : inputStart,
                    "inputEnd" : inputEnd,
                    "inputColor" : inputColor,
                    "inputAllday" :inputAllday
                    },
            type : "POST",
            dataType : "JSON",
    
            success : (message) => {
                loadCalendar();
    
                // 성공 시 화면에 정보를 다시 뿌림
                alert(message);
            },
            error : (message) => {
                alert(message);
            }
        })
    
        // 결과와 상관 없이 모달창을 닫고 초기화함
        insertModal.style.display="none";
        clearInsertBody();
    })

}

// InsertBody 화면 만들기 함수
function makeInsertBody(){

    // 1. titleBox
    const titleBox = document.createElement("div");
    titleBox.id = "titleBox";

    // 제목 상자 input
    const inputTitle = document.createElement("input");
    inputTitle.id = 'inputTitle';

    // 제목 상자 text
    const titleBoxText = document.createElement("div"); 
    titleBoxText.innerText = '제목'; 

    // 제목 상자에 input, text 추가
    titleBox.append(titleBoxText, inputTitle);

    // 2. colorBox
    const colorBox = document.createElement("div");
    colorBox.id = "colorBox";

    // 컬러 상자 text
    const colorBoxText = document.createElement("div");
    colorBoxText.innerText = '색깔';

    // 컬러 상자에 text 추가
    colorBox.append(colorBoxText);
    
    // 컬러 팔레트 배열
    const paletteArr = new Array();

    // 추가하고 싶은 색의 RGB값 넣기
    paletteArr.push("rgb(255,60,45)", "rgb(240,200,55)", "rgb(55,136,216)");

    // 반복문 : 컬러 input(radio) 생성 및 컬러 상자에 추가
    for(let i=0; i<paletteArr.length; i++) {
        const label = document.createElement("label");
        const radio = document.createElement("input");
        radio.setAttribute("type", "radio");
        radio.setAttribute("name", "planColor");
        radio.setAttribute("value", paletteArr[i]);

        if(i==0) {
            radio.checked = true;
        }

        const palette = document.createElement("div");
        palette.classList.add("palette");
        palette.setAttribute("style", "background-color:"+ paletteArr[i]);

        label.append(radio, palette);
        colorBox.append(label);
    }

    // 3-1. startBox
    const startBox = document.createElement("div");
    startBox.classList.add("dateBoxRow");
    startBox.id = "startBox";

    // 시작 날짜 상자 date
    const inputStartDate = document.createElement("input");
    inputStartDate.setAttribute("type", "date");
    inputStartDate.id = "inputStartDate";

    // 시작 날짜 상자 time
    const inputStartTime = document.createElement("input");
    inputStartTime.setAttribute("type", "time");
    inputStartTime.id = "inputStartTime";

    // 시작 날짜 상자 text
    const startBoxText = document.createElement("div");
    startBoxText.innerText = '시작날짜';

    // 시작 날짜 상자에 text, date, time 추가
    startBox.append(startBoxText, inputStartDate, inputStartTime);



    // 3-2. endBox
    const endBox = document.createElement("div");
    endBox.classList.add("dateBoxRow");
    endBox.id = "endBox";

    // 종료 날짜 상자 date
    const inputEndDate = document.createElement("input");
    inputEndDate.setAttribute("type", "date");
    inputEndDate.id = "inputEndDate";
    
    // 종료 날짜 상자 time
    const inputEndTime = document.createElement("input");
    inputEndTime.setAttribute("type", "time");
    inputEndTime.id = "inputEndTime";

    // 종료 날짜 상자 text
    const endBoxText = document.createElement("div");
    endBoxText.innerText = '종료날짜';

    // 종료 날짜 상자에 text, date, time 추가
    endBox.append(endBoxText, inputEndDate, inputEndTime);


    // 3-3. allDayBox
    const allDayBox = document.createElement("div");
    allDayBox.classList.add("dateBoxRow");
    allDayBox.id = "allDayBox";

    // 하루종일 상자 input(checkbox)
    const inputCheckbox = document.createElement("input");
    inputCheckbox.setAttribute("type", "checkbox");
    inputCheckbox.id = "inputCheckbox";

    inputCheckbox.addEventListener("change", () => {
        if(inputCheckbox.checked==true) {
            inputStartTime.disabled = true;
            inputEndTime.disabled = true;
            return;
        }

        if(inputCheckbox.checked==false) {
            inputStartTime.disabled = false;
            inputEndTime.disabled = false;
            return;
        }

    })

    // 하루종일 상자 text
    const allDayBoxText = document.createElement("div");
    allDayBoxText.innerText = '하루종일';

    // 하루종일 상자에 input, text 추가
    allDayBox.append(inputCheckbox, allDayBoxText);

    // 3 < 3-1, 3-2, 3-3. dateBox
    // 날짜 상자에 시작 날짜 상자, 종료 날짜 상자, 하루종일 상자 추가
    const dateBox = document.createElement("div");
    dateBox.id = "dateBox";
    dateBox.append(startBox, endBox, allDayBox);



    // 4. contentBox
    const contentBox = document.createElement("div");
    contentBox.id = "contentBox";

    // 내용 상자 input
    const inputContent = document.createElement("input");
    inputContent.id = "inputContent";

    // 내용 상자 text
    const contentBoxText = document.createElement("div");
    contentBoxText.innerText = '내용';

    // 내용 상자에 text, input 추가
    contentBox.append(contentBoxText, inputContent);

    // insertBody에 전부 추가
    const insertBody = document.getElementById("insertBody");
    insertBody.append(titleBox, colorBox, dateBox, contentBox);

}

// InsertBody 비우기 함수
function clearInsertBody(){
    const insertBody = document.getElementById("insertBody");
    insertBody.innerHTML = "";
}


/* 일정 조회 모달창 js */

// // 일정 조회 모달창 닫기
// const closeDetailModal = document.getElementById("closeDetailModal");

// closeDetailModal.addEventListener("click", () => {
//     detailModal.style.display="none";
// })


const openDetailModalMenu = document.getElementById("openDetailModalMenu");

openDetailModalMenu.addEventListener("click", () => {
    detailModalMenu.classList.toggle("closed")
})

// 일정 열면 데이터를 가져옴
function makePlanDetail(planNo){

    $.ajax({
        url : "plan/select/detail",
        data : {"planNo":planNo},
        type : "POST",
        dataType : "JSON",

        success : (plan) => {
            // plan.planNo, plan.planTitle, plan.planContent, plan.planStart, plan.planEnd, plan.planColor
            console.log(plan.planNo);
            console.log(plan.planTitle);
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
    })
}

// 일정 수정 관련
function updatePlan(planNo){

    $.ajax({
        url : "plan/update",
        data : {
                "planNo" : planNo,
                "inputTitle" : inputTitle,
                "inputContent" : inputContent,
                "inputStart" : inputStart,
                "inputEnd" : inputEnd,
                "inputColor" : inputColor,
                "inputAllday" :inputAllday
                },
        type : "POST",
        dataType : "JSON",

        success : (message) => {
            alert(message);
            loadCalendar();
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
        
    })


}

/* 일정 삭제 관련 js */

function deletePlan(planNo){

    $.ajax({
        url : "plan/delete",
        data : {"planNo":planNo},
        type : "POST",
        dataType : "JSON",

        success : (message) => {
            alert(message);
            loadCalendar();
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
    })
}