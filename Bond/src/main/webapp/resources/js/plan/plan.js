document.addEventListener('DOMContentLoaded', function() {

// fullcalendar 관련
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
            // 모달 열기 이벤트
            const modal = document.getElementById("modal");
            modal.style.display="block";

            // 모달 닫기 이벤트
            const closeModalButton = document.getElementById("closeModalButton");

            closeModalButton.addEventListener("click", () => {
                modal.style.display="none"
            })

            // 확인 버튼 클릭 시 이벤트
            const confirmButton = document.getElementById("confirmButton");



            confirmButton.addEventListener("click", () => {
                const inputTitle = document.getElementById("inputTitle").value; /* 제목 */
                const inputContent = document.getElementById("inputContent").value; /* 내용 */
                const inputStartDate = document.getElementById("inputStartDate").value; /* 시작 날짜 */
                const inputStartTime = document.getElementById("inputStartTime").value; /* 시작 시간 */
                const inputEndDate = document.getElementById("inputEndDate").value; /* 종료 날짜 */
                const inputEndTime = document.getElementById("inputEndTime").value; /* 종료 시간 */
                const inputColor = document.querySelector("input[name='planColor']:checked").value; /* 종료 시간 */

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
                        alert(message)
                    },
                    error : () => {
                        alert("실패")
                    }
                })

                // // 날짜 형식을 fullcalander에 맞게 변환
                // var startDate = new Date(inputStartDate + 'T' + inputStartTime); // will be in local time
                // var endDate = new Date(inputEndDate + 'T' + inputEndTime); // will be in local time
                
                modal.style.display="none"

            })

        }
        }
    },
    
});

// 캘린더 예시
// calendar.addEvent({
//     title: 'dynamic event',
//     start: startDate,
//     end: endDate,
//     allDay: true,
//     backgroundColor: 'red'
// });

// 달력에 정보 뿌리기...

(() => {
    ajax()
})()

function ajax(){
    $.ajax({
        url : "/plan/list",
        data : {"groupNo": 1},
        type : "POST",
        dataType : "JSON",

        success : (calenderList) => {
        for(let item of calenderList) {
            console.log(calenderList);
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

calendar.render();

});