const modalDim = document.getElementById("modalDim");
const modalBox = document.getElementById("modalBox");
const body = document.querySelector("body");
const modal = document.getElementById("modal");

(() => {modalDim.style.display="none"})()

// 모달 함수
function modalView(display,overflow){
    modalDim.style.display=display;
    body.style.overflow=overflow;
}

// 화면 보이기
const openModal = document.getElementById("openModal");
if(openModal != null) {
    openModal.addEventListener("click", () => {
        modalView("block","hidden");
        modalBox.style.top=scrollY + "px";
        modal.focus();
    })
    
    // 화면 가리기
    const closeModal = document.getElementById("closeModal");
    
    closeModal.addEventListener("click", () => {
        modalView("none","visible");
    })
    
    // 외부영역 터치 시 꺼짐
    let closeFL = true;
    
    modal.addEventListener("mouseenter", () => {
        closeFL = false;
    })
    modal.addEventListener("mouseleave", () => {
        closeFL = true;
    })
    
    modalDim.addEventListener("click", () => {
        if(closeFL){
            modalView("none","visible");
        }
    })
    
    // esc 입력 시 꺼짐
    modal.addEventListener("keydown", (e) => {
        if(e.key === 'Escape'){
            modalView("none","visible");
        }
    })
}

// 스크롤 막는 방법
// 1. overflow : hidden(스크롤 가능), clip(코드 입력으로 스크롤 불가)
// 2. position : fixed <- 배치가 틀어질 수 있음
// 3. js를 이용해서 스크롤바 끄기