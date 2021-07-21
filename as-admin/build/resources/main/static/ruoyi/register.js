
$(function() {
    validateRule();
    $('.imgcode').click(function() {
        var url = ctx + "captcha/captchaImage?type=" + captchaType + "&s=" + Math.random();
        $(".imgcode").attr("src", url);
    });
});

$.validator.setDefaults({
    submitHandler: function() {
    	register();
    }
});

function register() {
    $.modal.loading($("#btnSubmit").data("loading"));
    var username = $.common.trim($("input[name='username']").val());
    var password = $.common.trim($("input[name='password']").val());
    var validateCode = $("input[name='validateCode']").val();
    $.ajax({
        type: "post",
        url: ctx + "register",
        data: {
            "loginName": username,
            "password": password,
            "validateCode": validateCode
        },
        success: function(r) {
            if (r.code == web_status.SUCCESS) {
            	layer.alert("<font color='red'>" + i18n('user.register.congratulations') + "【" +  username + "】" + i18n('user.register.successful') + "</font>", {
            	    icon: 1,
            	    title: i18n('home.system.info')
            	},
            	function(index) {
            	    //关闭弹窗
            	    layer.close(index);
            	    location.href = ctx + 'login';
            	});
            } else {
            	$.modal.closeLoading();
            	$('.imgcode').click();
            	$(".code").val("");
            	$.modal.msg(r.msg);
            }
        }
    });
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#registerForm").validate({
        rules: {
            username: {
                required: true,
                minlength: 2
            },
            password: {
                required: true,
                minlength: 6
            },
            confirmPassword: {
                required: true,
                equalTo: "[name='password']"
            }
        },
        messages: {
            username: {
                required: icon + i18n('user.register.plz.name'),
                minlength: icon + i18n('user.register.name.not.le.two')
            },
            password: {
            	required: icon + i18n('user.register.plz.pwd'),
                minlength: icon + i18n('user.register.pwd.not.le.six'),
            },
            confirmPassword: {
                required: icon + i18n('user.register.plz.pwd.again'),
                equalTo: icon + i18n('user.register.pwd.not.same')
            }
        }
    })
}
