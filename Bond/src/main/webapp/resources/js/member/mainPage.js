const myDropdown = document.getElementById("myDropdown");
const icon = document.getElementById("triangle-icon");

function dropDown(){
    myDropdown.classList.toggle("show1");
    icon.classList.toggle("rotate");
};

window.onclick=function(e){
    if(!e.target.matches(".dropbtn, .dropbtn *")){

        if(myDropdown.classList.contains("show1")){
            myDropdown.classList.remove("show1");
            icon.classList.remove("rotate");
        }   
    }
};



// 가입중인 모든 모임의 일정 목록을 가져오는 ajax 함수
function myAllPlans(){

    const schedule = document.querySelector(".schedule");
    schedule.innerHTML = "";

    $.ajax({
        url:"/myAllPlans",
        type:"GET",
        dataType:"JSON",

        success : (myAllPlanList) => {
            let limit = 0;

            if(myAllPlanList.length != 0) {
                if(myAllPlanList.length > 10) {
                    limit = 10;
                } else {
                    limit = myAllPlanList.length;
                }

                for(let i=0; i<limit; i++) {
                    // 1. plan을 담을 상자
                    const planBox = document.createElement("a");
                    planBox.setAttribute("href", "/goBondPlan/" + myAllPlanList[i].groupNo);
                    planBox.classList.add("planBox");
    
                    // 2. 왼쪽 파트, 오른쪽 파트 분리
                    const planLeftPart = document.createElement("div");
                    planLeftPart.classList.add("planLeftPart");
                    const planRightPart = document.createElement("div");
                    planRightPart.classList.add("planRightPart");
    
                    // 3. 왼쪽 파트에 월, 일 저장
                    const planOneDay = document.createElement("div");
                    planOneDay.innerText = myAllPlanList[i].planStartDay;
    
                    const planOneMonth = document.createElement("div");
                    planOneMonth.classList.add("planOneMonth");
                    planOneMonth.innerText = myAllPlanList[i].planStartMonth + "월";
    
                    planLeftPart.append(planOneDay, planOneMonth);
    
                    // 4. 오른쪽 파트에 모임명, 일정 이름, 기간 저장
    
    
                    //
                    const planLinkBox = document.createElement("div");
                    planLinkBox.classList.add('planLinkBox');
                    
    
                    // 4-1. 모임 이름
                    const planGroupName = document.createElement("div");
                    planGroupName.classList.add("planGroupName")
                    planGroupName.innerText = myAllPlanList[i].groupName;
    
                    // 4-2 일정 제목 및 일정 제목 상자
                    const planTitle = document.createElement("div");
                    planTitle.classList.add("planTitle")
                    planTitle.innerText = myAllPlanList[i].planTitle;
    
                    // 4-3 나누기
                    const palette = document.createElement("div");
                    palette.classList.add("palette");
                    palette.setAttribute("style", "background-color:" + myAllPlanList[i].planColor);
    
    
                    // 4-3. 모임 이름과 일정 제목을 합침
                    planLinkBox.append(planGroupName, palette, planTitle);
                    
                    // 4. 일정 기간 상자
                    const planPeriodBox = document.createElement("div");
                    planPeriodBox.classList.add('planPeriodBox');
    
                    const planPeriod = document.createElement('div');
                    if(myAllPlanList[i].planStartTime != null) {
                        planPeriod.innerText += myAllPlanList[i].planStartTime;
                    }
                    planPeriod.innerText += " ~ " + myAllPlanList[i].planEnd;
    
                    if(myAllPlanList[i].planEndTime != null) {
                        planPeriod.innerText += " " + myAllPlanList[i].planEndTime;
                    }
    
                    planPeriodBox.append(planPeriod);
    
                    planRightPart.append(planLinkBox, planPeriodBox);
    
                    // 조립하기
                    planBox.append(planLeftPart, planRightPart);
    
                    // 스케줄에 조립한 상자 넣기
                    schedule.append(planBox);

                }
            } else {
                const nonePlanBox = document.createElement("div");
                nonePlanBox.id="nonePlanBox";
                nonePlanBox.innerText = "일정이 없습니다. 모임에서 일정을 추가해보세요!";

                schedule.append(nonePlanBox);
            }
                
        },
        error : () => {

        }
    })


}

// 함수 실행
(() => {
    myAllPlans();
})()
