// // 양 옆 고정 + 가운데만 스크롤 가능
// const leftSide = document.getElementById("info-inner");
// // const center= document.getElementById("board-list");

// // const centerWidth = center.offsetWidth;
// const leftSideWidth = leftSide.offsetWidth;

// window.addEventListener("load", function () {
//     leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
// });

// window.addEventListener("resize", function () {
//     leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
// });

// window.addEventListener("scroll", function () {

//     if (window.scrollX == 0) {
//         leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
//     }
//     else if (window.scrollX > 0) {
//         leftSide.style.left = window.scrollX * -1 + "px";
//     }
// });


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


// 멤버 초대하기 - 본드 주소 복사
const href = location.href.toString();
const reAddress = href.substring(0, href.lastIndexOf("/"));

document.querySelector(".share").addEventListener("click", ()=>{
    const copyAdd = document.createElement("textarea");
    document.body.append(copyAdd);
    copyAdd.textContent = href;
    copyAdd.select();
    document.execCommand('copy');
    copyAdd.remove();
    alert("주소가 복사되었습니다.");
});

