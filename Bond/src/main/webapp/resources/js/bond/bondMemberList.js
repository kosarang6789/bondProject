// 양 옆 고정 + 가운데만 스크롤 가능
const leftSide = document.getElementById("info-inner");
const center= document.getElementById("board-list");
const rightSide = document.getElementById("band-photo-area");

const centerWidth = center.offsetWidth;
const leftSideWidth = leftSide.offsetWidth;
const righthideWidth = rightSide.offsetWidth;

window.addEventListener("load", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("resize", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("scroll", function () {

    if (window.scrollX == 0) {
        leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
        rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
    else if (window.scrollX > 0) {
        leftSide.style.left = window.scrollX * -1 + "px";
        rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
});

// 프로필 드롭다운
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


// 무한스크롤

const option = {
    root: null,
    rootMargind: "0px 0px 0px 0px",
    thredhold: 1
}

const observer = new IntersectionObserver(selectBoardScroll, option);
const target = document.getElementById("pageTarget");
observer.observe(target);

let flag = true;
function selectBoardScroll (){
    if(cp==0){ cp++; }
    else{
        if(flag){
            $.ajax({
                url : "/bondMemberList",
                data : {"cp":++cp},
                dataType : "JSON",
                success : function(memMap){
                    if(memMap != null){
                        console.log(memMap);
                        
                            const memberAll = document.querySelector("memberAll");

                        for(let mem of memMap.memList){
                            const memberList = document.createElement("div");
                            memberList.classList.add(".member-image");

                            const memberImage = document.createElement("div");
                            memberImage.classList.add(".member-image");

                            const memberName = document.createElement("div");
                            memberName.classList.add(".member-name");

                            const memberReport = document.createElement("div");
                            memberReport.classList.add("member-report");

                            
                        }
                        
                    }
                },
                error : ()=>{
                    alert("ajax 통신 오류");
                }
            })
        }
    }
} 