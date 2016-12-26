/**
 * Created by 牛洧鹏 on 2016/12/18.
 */
function turning(currentPage,num){
        if(currentPage  <= 0) {currentPage = 1;} //如果上一页到头
        if(currentPage  >= num ){currentPage = num;} //如果下一页到头
        var cur=document.getElementById("currentPage");
        cur.value = currentPage;
        var form = document.getElementById("form");
        form.submit();
}

function subform(){
        var cur=document.getElementById("currentPage");
        cur.value = 1;
        var form = document.getElementById("form");
        form.submit();
}

