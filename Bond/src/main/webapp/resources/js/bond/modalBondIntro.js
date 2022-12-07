
// 본드 정보 보기 모달창

const modalBondIntro = document.querySelector(".modalBondIntro");

// 앨범에서 밴드 정보 보기
if(document.querySelector(".band-info") != null){
    const viewIntroBtn1 = document.querySelector(".band-info");
    viewIntroBtn1.addEventListener("click", ()=>{
        modalBondIntro.classList.add("show");
        modalBondIntro.classList.remove("hidden");
    });
}

// openYes에서 밴드 정보 보기
if(document.querySelector(".band-setting-section2") != null){
    const viewIntroBtn1 = document.querySelector(".band-setting-section2");
    viewIntroBtn1.addEventListener("click", ()=>{
        modalBondIntro.classList.add("show");
        modalBondIntro.classList.remove("hidden");
    });
}


const modalBondX = document.querySelector(".modalBondX");
modalBondX.addEventListener("click", ()=>{
    modalBondIntro.classList.add("hidden");
    modalBondIntro.classList.remove("show");
});

window.addEventListener("click",e=>{ 
    let ev = e.target; 

    if(ev.classList.contains("show")){
        modalBondIntro.classList.add("hidden");
        modalBondIntro.classList.remove("show");
    }
});

// if(document.querySelector("imageO")!= null){
//     modalBondX.style = "margin : 2px 0 0 150px";
// };
// if(document.querySelector("imageX") != null){
//     modalBondX.style = "margin : 2px 0 0 325px";
// };




