;(function ($, window) {
    $.extend({
        addCookie: function (key, value, day, path, domain) {

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
        },

        getCookie: function (key) {
            var res = document.cookie.split(";");
            if (key) {
                for (var i = 0; i < res.length; i++) {
                    var temp = res[i].split("=");
                    if (temp[0].trim() === key) {
                        return temp[1];
                    }
                }
            }else{
                return res[res.length-1].split("=")[0].trim();
            }
        },

        delCookie: function (key) {
            addCookie(key, getCookie(key), -1);
        }
    });
})
(jQuery, window);