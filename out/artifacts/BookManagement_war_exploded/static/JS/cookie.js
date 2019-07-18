// addCookie("gender", "male");
// addCookie("949578388","LBW,061898",1,"/ajax","localhost");
// alert(document.cookie);

function addCookie(key, value, day, path, domain) {

    //1.处理默认保存的路径
    //找到最后一个/出现的位置
    var index = window.location.pathname.lastIndexOf("/");
    //切割字符串
    var currentPath = window.location.pathname.slice(0, index);
    path = path || currentPath;

    //2.处理默认保存的域名domain
    domain = domain || document.domain;

    //3.处理默认的过期时间
    if (!day) {
        document.cookie = key + "=" + value + ";path=" + path + ";domain=" + domain + ";";
    } else {
        var date = new Date();
        date.setDate(date.getDate() + day);
        document.cookie = key + "=" + value + ";expires=" + date.toGMTString() + ";path=" + path + ";domain=" + domain + ";";
        // alert(document.cookie);
    }
}

// 获取当前文件的路径
// console.log(window.location.pathname);
// 找到最后一个/出现的位置
// var index = window.location.pathname.lastIndexOf("/");
// 切割字符串
// var currentPath = window.location.pathname.slice(0,index);
// console.log(currentPath);

//获取当前的域名
// console.log(document.domain);

function getCookie(key) {
    var res = document.cookie.split(";");
    for (var i = 0; i < res.length; i++) {
        var temp = res[i].split("=");
        if (temp[0].trim() === key) {
            return temp[1];
        }
    }
}

// console.log(getCookie("949578388"));

function delCookie(key) {
    addCookie(key, getCookie(key), -2,"/");
}

// delCookie("gender");
