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

// const observer = new IntersectionObserver(searchPageScroll, option);
// const target = document.getElementById("pageTarget");
// observer.observe(target);

// let flag = true;
// function searchPageScroll(){
//     if(cp == 0 ){
//         cp++;
//     }else{
//         if(flag){
//             console.log(cp);
//             $.ajax({
//                 url : "/member/search",
//                 data : {"cp" : ++cp, "key" : key},
//                 type : "POST",
//                 dataType : "JSON",
//                 success : function(map2){
//                         console.log(map2);
//                         if( map2 != null ){
//                         const listWrapper = document.querySelector(".list-wrapper");
    
//                         for(let group of map2.allGroupList.groupList){
//                             const h3 = document.createElement("h3");
//                             const listItem = document.createElement("li");
//                             listItem.classList.add("list-item");
                            
//                             if(group == null){
//                                 h3.innerText = "본드가 존재하지 않습니다.";
//                                 h3.classList.add("h3");
//                             } else{
                                
//                                 const list = document.createElement("div");
//                                 list.classList.add("list");
                                
//                                 const groupNo = document.createElement("a");
//                                 groupNo.classList.add("group-no");
    
//                                 const listCover = document.createElement("div");
//                                 listCover.classList.add("list-cover");
    
//                                 const cover = document.createElement("div");
//                                 cover.classList.add("cover");
    
//                                 const groupImage = document.createElement("img");
//                                 if(group.groupImage != null){
//                                     groupImage.setAttribute("src", group.groupImage);
//                                 } else{
//                                     groupImage.setAttribute("src","/resources/images/bond/profile/no-profile.png")
//                                 }
//                                 groupImage.classList.add("group-image")
    
//                                 cover.append(groupImage);
//                                 listCover.append(cover);
//                                 groupNo.append(listCover);
    
//                                 const listBond = document.createElement("div");
//                                 listBond.classList.add("list-bond");
    
//                                 const bondName = document.createElement("div");
//                                 bondName.classList.add("bond-name");
    
//                                 const bondNameA = document.createElement("a");
//                                 bondNameA.classList.add("bond-name-a");
//                                 bondNameA.innerText = group.groupName;
    
//                                 const bondComment = document.createElement("div");
//                                 if(group.memberCount != null){
//                                     bondComment.innerText = group.groupComment
//                                 } else{
//                                     bondComment.innerText = "소개글이 없습니다.";
//                                 }
//                                 bondComment.classList.add("bond-comment");
    
//                                 const bondCountLeader = document.createElement("div");
//                                 bondCountLeader.classList.add("bond-count-leader");
    
//                                 const bondCount = document.createElement("div");
//                                 if(bondCount != 0){
//                                     bondCount.innerText = group.groupCount;
//                                 } else{
//                                     bondCount.innerText = "멤버 0"
//                                 }
//                                 bondCount.classList.add("bond-count");
    
//                                 const bondLeader = document.createElement("div");
//                                 if(group.groupLeader != null){
//                                     bondLeader.innerText = "리더" + group.leaderName;
//                                 } else{
//                                     bondLeader.innerText = "리더 관리자";
//                                 }
//                                 bondLeader.classList.add("bond-leader");
    
    
//                                 bondCountLeader.append(bondCount,bondLeader);
//                                 bondName.append(bondNameA)
//                                 listBond.append(bondName, bondComment, bondCountLeader);
//                                 list.append(groupNo, listBond);
//                                 listItem.append(h3, list);
//                                 listWrapper.append(listItem);

//                             }
                            
                            

//                         }
//                     } else{ // 실패
//                         alert("본드를 불러올 수 없습니다.");
//                     }
//                 },
//                 error : function(req, status, error){
//                     console.log("에러 발생");
//                 }
//             });
//             flag = false;

//         }else{
//             flag = true;
//         }
//     }
// };


// 가입중인 모든 모임의 일정 목록을 가져오는 ajax 함수
function myAllPlans(){

    const schedule = document.querySelector(".schedule");

    if(schedule != null){

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


}

// 함수 실행
(() => {
    myAllPlans();
})()
