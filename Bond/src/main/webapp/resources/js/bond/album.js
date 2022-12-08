// 양 옆 고정 + 가운데만 스크롤 가능
const leftSide = document.getElementById("info-inner");
const center= document.getElementById("board-list");
// const rightSide = document.getElementById("banner");
// const rightSide = document.getElementById("band-photo-area");
const rightSide2 = document.getElementById("band-soon-plan-area");

const centerWidth = center.offsetWidth;
const leftSideWidth = leftSide.offsetWidth;
const righthideWidth = rightSide2.offsetWidth;

window.addEventListener("load", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    // rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    rightSide2.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("resize", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    // rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    rightSide2.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("scroll", function () {

    if (window.scrollX == 0) {
        leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
        // rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
        rightSide2.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
    else if (window.scrollX > 0) {
        leftSide.style.left = window.scrollX * -1 + "px";
        // rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
        rightSide2.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
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

// 사진 상세조회 모달
(()=>{
    const modal = document.getElementById("imageSelect-modal");
    const closeBtn = document.querySelector(".sModal-closeBtn");
    const image = document.getElementsByClassName("album");

    for(let i of image){
        i.addEventListener("click", ()=>{
            modal.classList.toggle("show");
            // document.body.style.overflow = "hidden";
            // document.querySelector("#postSelect-view > main").scrollTop = 0;
            selectImageDetail(i.getAttribute("id"));
        });
    }

    closeBtn.addEventListener("click",()=>{
        modal.classList.toggle("show");
    });
})();

const imageView = document.getElementById("imageView");
const profileImage = document.querySelector(".uprofile-inner");
const profileName = document.querySelector(".post-info-name");

const selectImageDetail = (imageNo)=>{
    $.ajax({
        url : "/bond/image",
        type : "GET",
        data : {"imageNo" : imageNo},
        dataType : "JSON",
        success : (image)=>{
            imageView.setAttribute("src", image.postImage);
            profileImage.setAttribute("src", image.memberImage);
            profileName.innerText = image.memberName;
        }
    })
};