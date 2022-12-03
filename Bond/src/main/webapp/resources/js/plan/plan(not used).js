let planNo = -1;

// function loadCalendar(){ 
document.addEventListener('DOMContentLoaded', () => {

    // fullcalendar 관련 js
    const calendarEl = document.getElementById('calendar');

    const calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ko',
        initialView: 'dayGridMonth',
        headerToolbar : {
            left: 'title',
            center: 'prev,next today',
            right: 'dayGridMonth,listMonth addEventButton'
        },
        // 일정 추가 모달창 열기
        customButtons : {
            addEventButton : {
                text: '일정 추가하기',
                click: function() {
                    const insertModal = document.getElementById("insertModal");
                    insertModal.classList.toggle("closed");
                }
            }
        },

        // 일정 조회 모달창 열기
        eventClick: function(info) {
            planNo = info.event.id;

            selectOne(planNo);

        }
    });

    // 리스트 가져오기
    $.ajax({
        url : "/bond/" + groupNo + "/plan/select/list",
        data : {"groupNo": groupNo},
        type : "GET",
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

// 캘린더 렌더링
calendar.render();

}); // end full calander


/* 일정 추가(insertOne) */
// 하루 종일 체크 시 시간 input 비활성화
const inputCheckbox = document.getElementById("inputCheckbox");
const inputStartTime = document.getElementById('inputStartTime');
const inputEndTime = document.getElementById('inputEndTime');

inputCheckbox.addEventListener('click', () => {
    if(inputCheckbox.checked === true) {
        inputStartTime.disabled = true;
        inputEndTime.disabled = true;
    }

    if(inputCheckbox.checked === false) {
        inputStartTime.disabled = false;
        inputEndTime.disabled = false;
    }
})

// 일정 추가 버튼
const confirmBtn = document.getElementById("confirmBtn");
confirmBtn.addEventListener("click", () => {
    insertOne();

})

// 일정 추가 함수
function insertOne(){

    const inputTitle = document.getElementById("inputTitle").value;
    if(inputTitle.trim().length === 0) {
        alert('제목을 입력해주세요')
        return;
    }
    const inputContent = document.getElementById("inputContent").value;
    
    let inputStart = document.getElementById("inputStartDate").value;
    if(inputStart === '') {
        alert('시작 날짜를 입력해주세요');
        return;
    }
    
    let inputEnd = document.getElementById("inputEndDate").value;
    if(inputEnd === '') {
        alert('종료 날짜를 입력해주세요');
        return;
    }

    if(inputStart > inputEnd) {
        alert('종료 날짜가 시작 날짜보다 빠를 수 없습니다.');
        return;
    }
    
    if(inputEnd === "") {
        inputEnd = inputStart
    }

    const inputColor = document.querySelector("input[name='planColor']:checked").value;
    if(inputColor === '') {
        alert('색깔을 선택해주세요.');
        return;
    }

    const inputCheckbox = document.getElementById("inputCheckbox");

    let inputAllday = 'Y';

    // 하루종일이 체크되지 않은 경우
    if(!inputCheckbox.checked) {
        const inputStartTime = document.getElementById("inputStartTime").value;
        const inputEndTime = document.getElementById("inputEndTime").value;

        if(inputStartTime === '') {
            alert('시작 시간을 입력해주세요.');
            return;
        }

        if(inputEndTime === '') {
            alert('종료 시간을 입력해주세요.');
            return;
        }

        if(inputStart === inputEnd) {
            if(inputStartTime > inputEndTime) {
                alert('종료 시간이 시작 시간보다 빠를 수 없습니다.');
                return;
            }
        }

        inputStart += "T" + inputStartTime + ":00";
        inputEnd += "T" + inputEndTime + ":00";

        inputAllday = 'F';
    }



    // 비동기로 일정 삽입(ajax)
    $.ajax({
        url : "/bond/" + groupNo + "/plan/insert",
        data : {
                "groupNo" : groupNo,
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
            const thisUrl = location.href;
            location = thisUrl;
        },
        error : (message) => {
            alert(message);
        }
    })
}


/* 일정 조회(selectOne) */

// 일정 조회 함수
function selectOne(thisId){
    let planNo = thisId;

    $.ajax({
        url : "/bond/" + groupNo + "/plan/select/detail",
        data : {"planNo":planNo},
        type : "POST",
        dataType : "JSON",

        success : (plan) => {
            planNo = plan.planNo;

            // 시작 날짜
            const dateBox = document.getElementById('dateBox');
            const startDay = plan.planStart.substring(8, 10);
            dateBox.innerText = startDay;

            // 요일
            const dayBox = document.getElementById('dayBox');
            dayBox.innerText = plan.planStartDate;

            // 2. 제목 상자
            const titleBox = document.getElementById('titleBox');
            titleBox.innerText = plan.planTitle;

            // 3. 기간 상자
            const periodBox = document.getElementById('periodBox');

            // 기간 변수 조립하기
            let period = "";

            // 시작 연도
            const startYear = plan.planStart.substring(0, 4) + '년';

            // 시작 월
            const startMonth = plan.planStart.substring(5, 7) + '월';
            
            // 시작 일
            // startDay 사용함

            // 기간에 시작 날짜까지 추가
            period = startYear + " " + startMonth + " " + startDay + "일";

            // 시작 시간
            let startMeridiem = "";
            let startHour = "";
            let startMinute = "";

            if(plan.planStart.length > 10) {
                
                startHour = plan.planStart.substring(11, 13);

                if(startHour > 12) {
                    startMeridiem = "오후";
                    startHour -= 12;
                    startHour = '0' + startHour;
                } else {
                    startMeridiem = "오전";
                }
                
                // 시작 분
                startMinute = plan.planStart.substring(14, 16);

                period += " " + startMeridiem + " " + startHour + ":" + startMinute;

            }

            if(!(plan.planStart === plan.planEnd)) {

                // 종료 연도
                const endYear = plan.planEnd.substring(0, 4) + '년';

                // 종료 월
                const endMonth = plan.planEnd.substring(5, 7) + '월';

                // 종료 일
                const endDay = plan.planEnd.substring(8, 10) + '일';

                // 종료 시간
                let endMeridiem = "";
                let endHour = "";
                let endMinute = "";

                period += " - " + endYear + " " + endMonth + " " + endDay + " ";

                if(plan.planEnd.length > 10) {

                    endHour = plan.planEnd.substring(11, 13);

                    if(endHour > 12) {
                        endMeridiem = "오후";
                        endHour -= 12;
                        endHour = '0' + endHour;
                    } else {
                        endMeridiem = "오전";
                    }

                    // 종료 분
                    endMinute = plan.planEnd.substring(14, 16);

                    period += endMeridiem + " " + endHour + ":" + endMinute;
                }
            }

            periodBox.innerText = period;
            
            // 4. 색깔 상자
            const colorBox = document.getElementById('selectedColor');
            colorBox.setAttribute("style", "background-color:" + plan.planColor);

            // 5. 작성자 상자
            const memberNameBox = document.getElementById('memberNameBox');
            memberNameBox.innerHTML = "&nbsp;&nbsp;&#183;&nbsp;&nbsp;" + plan.memberName;


            // 6. 내용 상자
            const contentBox = document.getElementById('contentBox');
            const content = plan.planContent;
            contentBox.innerText = content;
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
    })
    const detailModal = document.getElementById('detailModal');
    detailModal.classList.toggle('closed');


} // end makePlanDetail


/* 일정 수정(update) */
const editBtn = document.getElementById('editBtn');
editBtn.addEventListener('click', () => {
    updateOne();
})

// 일정 수정 함수
function updateOne(){

    const input2Title = document.getElementById("input2Title").value;

    if(input2Title.trim().length === 0) {
        alert('제목을 입력해주세요')
        return;
    }

    const input2Content = document.getElementById("input2Content").value;


    let input2Start = document.getElementById("input2StartDate").value;

    if(input2Start === '') {
        alert('시작 날짜를 입력해주세요');
        return;
    }
    
    let input2End = document.getElementById("input2EndDate").value;

    if(input2End === '') {
        alert('종료 날짜를 입력해주세요');
        return;
    }

    if(input2Start > input2End) {
        alert('종료 날짜가 시작 날짜보다 빠를 수 없습니다.');
        return;
    }

    if(input2End === "") {
        input2End = input2Start
    }

    const input2Color = document.querySelector("input[name='planColor']:checked").value;

    if(input2Color === '') {
        alert('색깔을 선택해주세요.');
        return;
    }

    const input2Checkbox = document.getElementById("input2Checkbox");
    
    let input2Allday = 'Y';

    // 하루종일이 체크되지 않은 경우
    if(!input2Checkbox.checked) {
        const input2StartTime = document.getElementById("input2StartTime").value;
        const input2EndTime = document.getElementById("input2EndTime").value;

        if(input2StartTime === '') {
            alert('시작 시간을 입력해주세요.');
            return;
        }

        if(input2EndTime === '') {
            alert('종료 시간을 입력해주세요.');
            return;
        }

        if(input2Start === input2End) {
            if(input2StartTime > input2EndTime) {
                alert('종료 시간이 시작 시간보다 빠를 수 없습니다.');
                return;
            }
        }

        input2Start += "T" + input2StartTime + ":00";
        input2End += "T" + input2EndTime + ":00";

        input2Allday = 'F';
    }
    
    $.ajax({
        url : "/bond/" + groupNo + "/plan/update",
        data : {
                "planNo" : planNo,
                "inputTitle" : input2Title,
                "inputContent" : input2Content,
                "inputStart" : input2Start,
                "inputEnd" : input2End,
                "inputColor" : input2Color,
                "inputAllday" :input2Allday
                },
        type : "POST",
        dataType : "JSON",

        success : (message) => {
            alert(message);

            const thisUrl = location.href;
            location = thisUrl;
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
        
    })


}

// 일정 수정 화면 열기
const openEditPage = document.getElementById("openEditPage");

openEditPage.addEventListener("click", () => {
    const updateModal = document.getElementById("updateModal");
    updateModal.classList.toggle("closed");
    fillUpdateModal();
})

function fillUpdateModal(){
    // 제목 상자 input
    const input2Title = document.getElementById("input2Title");
    const titleBox = document.getElementById('titleBox');
    input2Title.value = titleBox.innerText;

    // 컬러 팔레트 배열
    const paletteRadio = document.getElementsByClassName('paletteRadio');


    for(let i=0; i<paletteRadio.length; i++) {
        const selectedColor = document.getElementById('selectedColor').getAttribute('style').substring(17);

        if(paletteRadio[i].getAttribute('value') === selectedColor) {
            paletteRadio[i].checked = true;
        }
    }

    const period = document.getElementById('periodBox').innerText;

    const input2StartDate = document.getElementById('input2StartDate');
    const input2StartTime = document.getElementById('input2StartTime');

    const input2EndDate = document.getElementById('input2EndDate');
    const input2EndTime = document.getElementById('input2EndTime');
    

    // 2022년 12월 06일 길이 13
    // 2022년 12월 07일 - 2022년 12월 24일 29;
    // 2022년 12월 20일 오전 06:06 - 2022년 12월 29일 오후 08:06 47;
    if(period.length === 13) {
        const year = period.substring(0, 4);
        const month = period.substring(6, 8);
        const day = period.substring(10, 12);
        input2StartDate.value = '' + year + '-' + month + '-' + day;
        input2EndDate.value = input2StartDate.value;
    }

    if(period.length === 29) {
        const year = period.substring(0, 4);
        const month = period.substring(6, 8);
        const day = period.substring(10, 12);
        input2StartDate.value = '' + year + '-' + month + '-' + day;

        const year2 = period.substring(16, 20);
        const month2 = period.substring(22, 24);
        const day2 = period.substring(26, 28);
        input2EndDate.value = '' + year2 + '-' + month2 + '-' + day2;
    }

    if(period.length === 47) {
        const year = period.substring(0, 4);
        const month = period.substring(6, 8);
        const day = period.substring(10, 12);
        input2StartDate.value = '' + year + '-' + month + '-' + day;

        let hour = period.substring(17, 19);
        const minute = period.substring(20, 22);
        const meridiem = period.substring(15, 17);
        if(meridiem === '오후') hour = (Number)(hour) + 12;
        input2StartTime.value = '' + hour + ':' + minute;

        const year2 = period.substring(25, 29);
        const month2 = period.substring(31, 33);
        const day2 = period.substring(35, 37);
        input2EndDate.value = '' + year2 + '-' + month2 + '-' + day2;

        let hour2 = period.substring(42, 44);
        const minute2 = period.substring(45, 47);
        const meridiem2 = period.substring(39, 41);
        if(meridiem2 === '오후') hour2 = (Number)(hour2) + 12;
        input2EndTime.value = '' + hour2 + ':' + minute2;
    }


    const input2Checkbox = document.getElementById('input2Checkbox');

    input2Checkbox.addEventListener("change", () => {
        if(input2Checkbox.checked==true) {
            input2StartTime.disabled = true;
            input2EndTime.disabled = true;
            return;
        }

        if(input2Checkbox.checked==false) {
            input2StartTime.disabled = false;
            input2EndTime.disabled = false;
            return;
        }

    })
    
    if(input2StartTime.value === '') {
        input2Checkbox.checked = true;

        input2StartTime.disabled = true;

        input2EndTime.disabled = true;
    }

    const contentBox = document.getElementById('contentBox');
    const input2Content = document.getElementById('input2Content');
    input2Content.value = contentBox.innerText;

}


/* 일정 삭제(delete) */
const planDeleteBtn = document.getElementById("planDeleteBtn");

planDeleteBtn.addEventListener("click", () => {

    $.ajax({
        url : "/bond/" + groupNo + "/plan/delete",
        data : {"planNo":planNo},
        type : "POST",
        dataType : "JSON",

        success : (message) => {
            alert(message);

            const thisUrl = location.href;
            location = thisUrl;
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
    })

})



/* 모달창 여닫기 */
/* 모달창 통합 닫기 (esc 버튼 클릭 시) */
addEventListener("keydown", (e) => {
    const insertModal = document.getElementById("insertModal");
    const detailModal = document.getElementById("detailModal");
    const detailModalMenu = document.getElementById("detailModalMenu");
    const updateModal = document.getElementById("updateModal");
    const deleteModal = document.getElementById("deleteModal");

    if(e.key === 'Escape'){
        if(!deleteModal.classList.contains("closed")) { // 삭제 모달이 열려 있으면
            deleteModal.classList.toggle("closed");
            return;
        }

        if(!updateModal.classList.contains("closed")) {
            updateModal.classList.toggle("closed");
            return;
        }

        if(!detailModal.classList.contains("closed")) {
            detailModal.classList.toggle("closed");

            if(!detailModalMenu.classList.contains("closed")) {
                detailModalMenu.classList.toggle("closed");
            }
            
            return;
        }

        if(!insertModal.classList.contains("closed")) {
            insertModal.classList.toggle("closed");
            return;
        }
    }
})

/* 모달창 닫기(외부영역 클릭 시) */
const detailModal = document.getElementById("detailModal");

detailModal.addEventListener("click", e => {
    const evTarget = e.target;

    if(evTarget.classList.contains("modalDim")){
        evTarget.classList.toggle("closed");

        const detailModalMenu = document.getElementById("detailModalMenu");
        if(!detailModalMenu.classList.contains("closed")) {
            detailModalMenu.classList.toggle("closed");
        }
        return;
    }
    
})

// 일정 삭제 모달창 열기(open #deleteModal)
const planDelete = document.getElementById("planDelete");

planDelete.addEventListener("click", () => {
    const deleteModal = document.getElementById("deleteModal");
    deleteModal.classList.toggle("closed");
})

// 일정 삭제 모달창 취소(닫기)(cancel #deleteModal)
const cancelDeleteBtn = document.getElementById("cancelDeleteBtn");

cancelDeleteBtn.addEventListener("click", () => {
    const deleteModal = document.getElementById("deleteModal");
    deleteModal.classList.toggle("closed");
})

// 일정 추가 모달창 닫기(close #insertModal)
const closeInsertModal = document.getElementById("closeInsertModal");

closeInsertModal.addEventListener("click", () => {
    insertModal.classList.toggle("closed");
})

// 일정 상세 조회 모달창 열기(open #detailModal)
const openDetailModalMenu = document.getElementById("openDetailModalMenu");

openDetailModalMenu.addEventListener("click", () => {
    const detailModalMenu = document.getElementById("detailModalMenu");
    detailModalMenu.classList.toggle("closed");
})

// 일정 수정 모달창 닫기
const closeUpdateModal = document.getElementById('closeUpdateModal');

closeUpdateModal.addEventListener('click', () => {
    const updateModal = document.getElementById('updateModal');
    updateModal.classList.toggle('closed');
})