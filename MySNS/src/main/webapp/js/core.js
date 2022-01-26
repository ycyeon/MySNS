var AJAX = {
    call: function (url, params, func, isfd) {
	    var callobj = {
            url: url, 
            type: "post", 
            data: params, 
            dataType: "text",
            success: func,
            error: function (xhr, status, error) {
                if (xhr.status == 0) {
                    alert("네트워크 접속이 원할하지 않습니다.");
                }
                else {
                    console.log(xhr.responseText);
                    alert("에러가 발생하였습니다. 관리자에게 문의해주세요.");
                }
            },
        };
        if (isfd) {
            callobj.processData = false;
            callobj.contentType = false;
        }
        jQuery.ajax(callobj);
    }
};

var Page = {
    init: function (cbfunc, url) {
        AJAX.call("jsp/session.jsp", null, function(data) {
            var uid = data.trim();
            if (uid == "null") {
                alert("로그인이 필요한 서비스 입니다.");
                window.location.href = "login.html";
            }
            else {
                if (cbfunc != null) cbfunc(uid);
            }
        });
    },
    
    go: function(url, param) {
        Session.set(url, param);
        window.location.href = url;
    },
    
    getUsrobj: function (cbfunc) {
        AJAX.call("jsp/session.jsp", null, function(data){
            var ustr = data.trim();
            var usrobj = (ustr == "null") ? null : JSON.parse(ustr);
            cbfunc(usrobj);
        });
    },
};

var Session = {
    set: function (name, val) {
        sessionStorage["mysns>"+name] = JSON.stringify(val);
    },
    
    get: function (name) {
        var str = sessionStorage["mysns>" + name];
        return (str == null || str == "null") ? null : JSON.parse(str);
    },
    
    clear: function (name) {
        sessionStorage["mysns>"+name] = null;
    },
};

