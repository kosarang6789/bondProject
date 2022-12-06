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