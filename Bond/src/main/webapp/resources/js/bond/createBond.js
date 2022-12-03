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

// 제출 전 유효성 검사
const createForm = document.getElementById("createForm");

createForm.addEventListener("submit", function(event){
    
    const bondName = document.getElementById("bondName");
    if(bondName.value.trim().length==0){
        alert("밴드 이름을 입력해주세요.");
        bondName.focus();
        event.preventDefault();
        return;
    };
    
    const categoryList = document.getElementsByName("topicCode");
    let countC = 0;
    for(let i=0; i<categoryList.length; i++){
        if(categoryList[i].checked){
            countC += 1;
            console.log(categoryList[i]);
        }
    }
    if(countC==0){
        alert("밴드 카테고리를 선택해주세요.");
        event.preventDefault();
        return;
    }

    const openType = document.getElementsByName("openYN");
    
    let countO = 0;
    for(let item of openType){
        if(item.checked){
            countO +=1;
        }
    }

    if(countO==0){
        alert("밴드 공개여부를 선택해주세요.");
        event.preventDefault();
        return;
    }

});

// 이미지 미리보기
const inputImage = document.getElementById("bandImage-input");
const preview = document.getElementById("select-photo");
const deleteImage = document.getElementById("delete-image");

inputImage.addEventListener("change", e=>{

    if(e.target.files[0]!=undefined){
        const reader = new FileReader();
        reader.readAsDataURL(e.target.files[0]);
        reader.onload = event => {
            preview.setAttribute("src", event.target.result);
        }
    } else {
        preview.removeAttribute("src");
    }
});

deleteImage.addEventListener("click", ()=>{
    preview.setAttribute("src", "/resources/images/bond/profile/select-photo.jpg")
    inputImage.value="";
});