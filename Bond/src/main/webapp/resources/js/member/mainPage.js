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