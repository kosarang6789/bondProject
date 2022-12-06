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

// 검색을 한 경우 검색창에 검색 key, query 남겨놓기
(() => {
    const select = document.getElementById("search-key");
    const input = document.getElementById("search-query");
    const option = document.querySelectorAll("#search-key > option");

    if(select != null) { 
        const params = new URL(location.href).searchParams;

        const key = params.get("key");
        const query = params.get("query");

        input.value = query;

        for(let op of option){

            if(op.value == key){
                op.selected = true;
            }
        }
    }
})();

// 본드 리스트 무한 스크롤
const option = {
    root: null,
    rootMargin: "0px 0px 0px 0px",
    thredhold: 1,
}

const observer = new IntersectionObserver(selectBoardScroll, option);
const target = document.getElementById("pageTarget");
observer.observe(target);

let flag = true;
function selectBoardScroll(){
    if(cp == 0 ){
        cp++;
    }else{
        if(flag){
            console.log(cp);
            $.ajax({
                url : "/member/search",
                data : {"cp" : ++cp},
                type : "GET",
                dataType : "JSON",
                success : function(map){
                    if( map != null ){
                        console.log(map.groupList);
                        const postWrap = document.querySelector(".list-wrap");
    
                        for(let group of map.groupList){
                            const listWrap = document.createElement("ul");
                            listWrap.classList.add("list-wrap");
                            
                            const listItem = document.createElement("li");
                            listItem.classList.add("list-item");
                            
                            const list = document.createElement("div");
                            list.classList.add("list");
                            
                            const groupNo = document.createElement("a");
                            groupNo.classList.add("group-no");
                            groupNo.innerText = group.groupNo

                            const listCover = document.createElement("div");
                            listCover.classList.add("list-cover");

                            const cover = document.createElement("div");
                            cover.classList.add("cover");

                            const groupImage = document.createElement("img");
                            if(group.groupImage != null){
                                groupImage.setAttribute("src", group.groupImage);
                            } else{
                                groupImage.setAttribute("src","/resources/images/bond/profile/no-profile.png")
                            }
                            groupImage.classList.add("group-image")


                            
                        }
                    } else{ // 실패
                        alert("게시물을 불러올 수 없습니다.");
                    }
                },
                error : function(req, status, error){
                    console.log("에러 발생");
                }
            });
            flag = false;

        }else{
            flag = true;
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
            console.log(myAllPlanList);

            if(myAllPlanList.length != 0) {
                for(plan of myAllPlanList) {

                    // 1. plan을 담을 상자
                    const planBox = document.createElement("a");
                    planBox.setAttribute("href", "/goBondPlan/" + plan.groupNo);
                    planBox.classList.add("planBox");

                    // 2. 왼쪽 파트, 오른쪽 파트 분리
                    const planLeftPart = document.createElement("div");
                    planLeftPart.classList.add("planLeftPart");
                    const planRightPart = document.createElement("div");
                    planRightPart.classList.add("planRightPart");

                    // 3. 왼쪽 파트에 월, 일 저장
                    const planOneDay = document.createElement("div");
                    planOneDay.innerText = plan.planStartDay;

                    const planOneMonth = document.createElement("div");
                    planOneMonth.classList.add("planOneMonth");
                    planOneMonth.innerText = plan.planStartMonth + "월";

                    planLeftPart.append(planOneDay, planOneMonth);

                    // 4. 오른쪽 파트에 모임명, 일정 이름, 기간 저장


                    //
                    const planLinkBox = document.createElement("div");
                    planLinkBox.classList.add('planLinkBox');
                    

                    // 4-1. 모임 이름
                    const planGroupName = document.createElement("div");
                    planGroupName.classList.add("planGroupName")
                    planGroupName.innerText = plan.groupName;

                    // 4-2 일정 제목 및 일정 제목 상자
                    const planTitle = document.createElement("div");
                    planTitle.classList.add("planTitle")
                    planTitle.innerText = plan.planTitle;

                    // 4-3 나누기
                    const palette = document.createElement("div");
                    palette.classList.add("palette");
                    palette.setAttribute("style", "background-color:" + plan.planColor);


                    // 4-3. 모임 이름과 일정 제목을 합침
                    planLinkBox.append(planGroupName, palette, planTitle);
                    
                    // 4. 일정 기간 상자
                    const planPeriodBox = document.createElement("div");
                    planPeriodBox.classList.add('planPeriodBox');

                    const planPeriod = document.createElement('div');
                    if(plan.planStartTime != null) {
                        planPeriod.innerText += plan.planStartTime;
                    }
                    planPeriod.innerText += " ~ " + plan.planEnd;

                    if(plan.planEndTime != null) {
                        planPeriod.innerText += " " + plan.planEndTime;
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
