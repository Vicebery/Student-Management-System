/*Author: Vicebery
*Date: 20161115
*About: ddlist change
*验证不合法情况，
*/

function valueChange() {
    alert("成功跳转");
    var week1 = document.getElementById("week1");
    var week2 = document.getElementById("week2");
    var error = document.getElementById("error_msg");

    if (week1.value>week2.value)
        error.innerHTML = "周次选择错误！";

        //alert("成功跳转");
    return true;
    //alert("ddddddddd成功跳转");
}