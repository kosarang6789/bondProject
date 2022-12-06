// 차트 연습

// 통계 내면 좋은게 뭐가 있을까?
// 1. 실시간 통계(회원 수, 모임 수, 게시글 수)
// 2. 일일 통계(회원 가입, 회원 탈퇴, 게시글 작성 수)
// 3. 모임 카테고리 비율
// 4. 주간 회원 추이
// 회원 수 애니메이션

// 카운트 함수
function counter(targetId, end){
    const target = document.getElementById(targetId);

    let num = end;

    const timer = setInterval(function(){
        target.innerText = Math.ceil(end - num);

        num = num - (num / 10);

        if(num >= end) {
            clearInterval(timer);
        }

    }, 40);
}

// 이름 넣는 함수
function insertText(targetId, str) {
    const target = document.getElementById(targetId);
    target.innerText = str;
}


(()=>{
    // counter("numbers", 12345)
})()

/* 차트 이용 함수 */
 function topicDoughnutChart(){
     $.ajax({
         url : "/admin/statistic/topic/doughnut",
         type : "GET",
         dataType : "JSON",
         success : (topicDoughnutList) => {

            console.log(topicDoughnutList[1].groupCount);
            let topicNameArr = [];

            for(let i=0; i<topicDoughnutList.length; i++) {
                topicNameArr[i] = topicDoughnutList[i].topicName;
            }

            let topicCountArr = [];

            let hotTopicCount = -1;
            let hotTopicIndex = -1;

            let coldTopicCount = 10000;
            let coldTopicIndex = -1;

            for(let i=0; i<topicDoughnutList.length; i++) {
                topicCountArr[i] = topicDoughnutList[i].groupCount;

                // 인기토픽 찾기
                if(hotTopicCount <= topicDoughnutList[i].groupCount) {
                    hotTopicCount = topicDoughnutList[i].groupCount;
                    hotTopicIndex = i;
                }

                // 비인기토픽 찾기
                if(coldTopicCount > topicDoughnutList[i].groupCount) {}
                    coldTopicCount = topicDoughnutList[i].groupCount;
                    coldTopicIndex = i;
                }
            
            // 인기토픽
            counter("hotNumber", hotTopicCount);
            insertText("hotUnit", topicDoughnutList[hotTopicIndex].topicName);

            // 비인기토픽
            counter("coldNumber", coldTopicCount);
            insertText("coldUnit", topicDoughnutList[coldTopicIndex].topicName);


            new Chart(document.getElementById("doughnut"), {
                type: 'doughnut',
                data: {
                    labels: topicNameArr,
                      datasets: [{
                        label: 'My First Dataset',
                        data: topicCountArr,
                        backgroundColor: [
                            'rgb(255, 99, 132)', 
                            'rgb(255, 159, 64)', 
                            'rgb(255, 205, 86)', 
                            'rgb(75, 192, 192)', 
                            '#b8997C', 
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            '#bff850',
                            '#0087A3',
                            '#F9BDC7',
                            'rgb(54, 162, 235)',
                            'dimgray'
                        ],
                        hoverOffset: 4
                      }]
                    
                } //{
                // labels: topicDoughnutArr,
                // datasets: [{ 
                //     data: groupCountArr,
                //     backgroundColor: "black"
                //     }
                // ]
                // },

               });
         },
         error : () => {
             alert("데이터 전송에 실패하였습니다 : 모임 통계")
         }
    })
 }

// 주간 게시글 작성 수 차트
function weekelyPostChart(){
    $.ajax({
        url : "/admin/statistic/weekely/post",
        type : "GET",
        dataType : "JSON",
        success : (weekelyPostList) => {

            let postCountArr = []; 

            for(let i=0; i<weekelyPostList.length; i++) {
                postCountArr[i] = weekelyPostList[i].postCount;
            }

            let weekelyDateArr = [];

            for(let i=0; i<weekelyPostList.length; i++) {
                weekelyDateArr[i] = weekelyPostList[i].weekelyDate;
            }

            new Chart(document.getElementById("bar"), {
                type: 'bar',
                data: {
                  labels: weekelyDateArr,
                  datasets: [{ 
                      barThickness: 20,
                      data: postCountArr,
                      label: "주간 게시글 작성 수",
                      backgroundColor: "#00AAFF",
                      hoverBackgroundColor: "#00AAFF70",
                      fill: true
                    }
                  ],
                },
                options: {
                //   title: {
                //     display: true,
                //     text: 'World population per region (in millions)'
                //   }
                    scales: {
                        y: {
                            ticks: {
                                // Include a dollar sign in the ticks
                                callback: function(value, index, ticks) {
                                    return value + '개'
                                }
                            }
                        }
                    }
                }
              });

        },
        error : () => {
            alert("오류")
        },
    })


}

(() => {
    // 도넛 차트 실행
    topicDoughnutChart();

    weekelyPostChart();
})()




