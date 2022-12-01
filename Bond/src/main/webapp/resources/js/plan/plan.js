// fullcalendar 불러오기
function loadCalendar(){ 
    // document.addEventListener('DOMContentLoaded', () => {

        // fullcalendar 관련 js
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: 'ko',
            initialView: 'dayGridMonth',

            headerToolbar : {
                left: 'title',
                center: 'prev next today',
                right: 'addEventButton'
            },
            customButtons : {
                addEventButton : {
                text: '일정 추가하기',
                click: function() {

                    // 열려라 모달창
                    const modal = document.getElementById("modal");
                    modal.style.display="block";

                    makeWindowBody();
                }
                }
            },
            
        });

        // 달력에 정보를 뿌리는 함수 getAllPlan
        function getAllPlan(){
            $.ajax({
                url : "/plan/list",
                data : {"groupNo": 1},
                type : "POST",
                dataType : "JSON",

                success : (calenderList) => {
                for(let item of calenderList) {
                    console.log(item);
                    calendar.addEvent({
                        title: item.planTitle,
                        start: item.planStart,
                        end : item.planEnd,
                        allDay: true,
                        backgroundColor: item.planColor
                    });
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


// 닫혀라 모달창 함수
const closeModalButton = document.getElementById("closeModalButton");

closeModalButton.addEventListener("click", () => {
    modal.style.display="none";
    clearWindowBody();
})

// 모달창에서 확인 버튼을 누르면 일정을 업데이트함
const confirmButton = document.getElementById("confirmButton");

confirmButton.addEventListener("click", () => {

    const inputTitle = document.getElementById("inputTitle").value;
    const inputContent = document.getElementById("inputContent").value;
    const inputStartDate = document.getElementById("inputStartDate").value;
    const inputStartTime = document.getElementById("inputStartTime").value;
    const inputEndDate = document.getElementById("inputEndDate").value;
    const inputEndTime = document.getElementById("inputEndTime").value;
    const inputColor = document.querySelector("input[name='planColor']:checked").value;

    // 비동기로 일정 업데이트(ajax)
    $.ajax({
        url : "/plan/insert",
        data : {
                "inputTitle" : inputTitle,
                "inputContent" : inputContent,
                "inputStartDate" : inputStartDate,
                "inputStartTime" : inputStartTime,
                "inputEndDate" : inputEndDate,
                "inputEndTime" : inputEndTime,
                "inputColor" : inputColor
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
    modal.style.display="none";
    clearWindowBody();
})




// windowBody 화면 만들기 함수
function makeWindowBody(){

    // 1. titleBox
    const titleBox = document.getElementById("titleBox");
    const inputTitle = document.createElement("input");
    inputTitle.id = 'inputTitle';

    const titleBoxSpan = document.createElement("span");
    titleBoxSpan.innerText = '제목';

    titleBox.append(titleBoxSpan, inputTitle);

    // 2. colorBox
    const colorBox = document.getElementById("colorBox");

    const colorBoxSpan = document.createElement("span");
    colorBoxSpan.innerText = '색깔';

    colorBox.append(colorBoxSpan);
    
    const paletteArr = new Array(); // 색깔 배열
    paletteArr.push("rgb(255,60,45)", "rgb(240,200,55)", "rgb(55,136,216)"); // 색깔을 추가하세요

    for(let i=0; i<paletteArr.length; i++) {
        const label = document.createElement("label");
        const radio = document.createElement("input");
        radio.setAttribute("type", "radio");
        radio.setAttribute("name", "planColor");
        radio.setAttribute("value", paletteArr[i]);

        if(i==0) {
            radio.checked
        }

        const palette = document.createElement("div");
        palette.classList.add("palette");
        palette.setAttribute("style", "background-color:"+ paletteArr[i]);

        label.append(radio, palette);
        colorBox.append(label);
    }

    // 3. startBox
    const startBox = document.getElementById("startBox");

    const inputStartDate = document.createElement("input");
    inputStartDate.setAttribute("type", "date");
    inputStartDate.id = "inputStartDate";

    const inputStartTime = document.createElement("input");
    inputStartTime.setAttribute("type", "time");
    inputStartTime.id = "inputStartTime";

    const startBoxSpan = document.createElement("span");
    startBoxSpan.innerText = '시작날짜';

    startBox.append(startBoxSpan, inputStartDate, inputStartTime);

    // 4. endBox
    const endBox = document.getElementById("endBox");

    const inputEndDate = document.createElement("input");
    inputEndDate.setAttribute("type", "date");
    inputEndDate.id = "inputEndDate";

    const inputEndTime = document.createElement("input");
    inputEndTime.setAttribute("type", "time");
    inputEndTime.id = "inputEndTime";

    const endBoxSpan = document.createElement("span");
    endBoxSpan.innerText = '종료날짜';

    endBox.append(endBoxSpan, inputEndDate, inputEndTime);

    // 5. contentBox
    const contentBox = document.getElementById("contentBox");

    const inputContent = document.createElement("input");
    inputContent.id = "inputContent";

    const contentBoxSpan = document.createElement("span");
    contentBoxSpan.innerText = '내용';

    contentBox.append(contentBoxSpan, inputContent);

}

// windowBody 비우기 함수
function clearWindowBody(){
    const titleBox = document.getElementById("titleBox");
    const colorBox = document.getElementById("colorBox");
    const startBox = document.getElementById("startBox");
    const endBox = document.getElementById("endBox");
    const contentBox = document.getElementById("contentBox");

    titleBox.innerHTML = "";
    colorBox.innerHTML = "";
    startBox.innerHTML = "";
    endBox.innerHTML = "";
    contentBox.innerHTML = "";
}




// 캘린더 예시
// calendar.addEvent({
//     title: 'dynamic event',
//     start: startDate,
//     end: endDate,
//     allDay: true,
//     backgroundColor: 'red'
// });