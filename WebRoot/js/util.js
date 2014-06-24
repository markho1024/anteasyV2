function doLogout() {
	$.messager.confirm('退出确认', '你确认退出吗?', function(bt) {
		if (bt) {
			location.href = './logout.action';
		}
		;
	});
};

jQuery.extend(jQuery.validator.messages, {
	required : "必填字段",
	remote : "请修正该字段",
	email : "请输入正确格式的email地址",
	url : "请输入合法的网址",
	date : "请输入合法的日期",
	dateISO : "请输入合法的日期 (ISO).",
	number : "请输入合法的数字",
	digits : "只能输入整数",
	creditcard : "请输入合法的信用卡号",
	equalTo : "请再次输入相同的值",
	accept : "请输入拥有合法后缀名的字符串",
	maxlength : jQuery.validator.format("请输入一个 长度最多是 {0} 的字符串"),
	minlength : jQuery.validator.format("请输入一个 长度最少是 {0} 的字符串"),
	rangelength : jQuery.validator.format("请输入 一个长度介于 {0} 和 {1} 之间的字符串"),
	range : jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
	max : jQuery.validator.format("请输入一个最大为{0} 的值"),
	min : jQuery.validator.format("请输入一个最小为{0} 的值")
});

// 自定义验证方法

// 验证值必须大于特定值(能等于)
jQuery.validator.addMethod("between", function(value, element, param) {
	var paramV = jQuery(param).val();
	return value >= paramV;
});

// 验证时间必须大于特定值(能等于)
jQuery.validator.addMethod("betweendate", function(value, element, param) {
	var startDate = jQuery(param).val();
	var date1 = new Date(Date.parse(startDate.replace("-", "/")));
	var date2 = new Date(Date.parse(value.replace("-", "/")));
	if (startDate == null || value == null || startDate == "" || value == "") {
		return true;
	} else {
		return date1 <= date2;
	}

}, $.validator.format("输入值必须大于{0}!"));

// 密码不同
jQuery.validator.addMethod("equalnoto", function(value, element, param) {
	var vals = jQuery(param).val();
	if (value == null || value == "" || vals == null || vals == "") {
		return false;
	} else {
		return vals != value;
	}

}, $.validator.format("不能相同!"));

// 身份证号码验证
jQuery.validator
		.addMethod(
				"idcard",
				function(value, element) {
					return this.optional(element)
							|| /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/
									.test(value)
							|| /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/
									.test(value);
				}, "请正确输入您的身份证号码");

// 手机号码验证
jQuery.validator.addMethod("mobile", function(value, element) {
	var length = value.length;
	var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
	if (value == null || value == "") {
		return true;
	} else {
		return this.optional(element) || (length == 11 && mobile.test(value));
	}
}, "请正确填写您的手机号码");

// 电话号码验证
jQuery.validator.addMethod("tel", function(value, element) {
	var tel = /^\d{3,4}-?\d{7,9}$/; // 电话号码格式010-12345678
	if (value == null || value == "") {
		return true;
	} else {
		return this.optional(element) || (tel.test(value));
	}
}, "请正确填写您的电话号码");

// 联系电话(手机/电话皆可)验证
jQuery.validator.addMethod("phone", function(value, element) {
	var length = value.length;
	var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
	var tel = /^\d{3,4}-?\d{7,9}$/;

	if (value == null || value == "") {
		return true;
	} else {
		return this.optional(element)
				|| (tel.test(value) || mobile.test(value));
	}
}, "请正确填写您的联系电话");

// 邮政编码验证
jQuery.validator.addMethod("mailcode", function(value, element) {
	var tel = /^[0-9]{6}$/;
	if (value == null || value == "") {
		return true;
	} else {
		return this.optional(element) || (tel.test(value));
	}
}, "请正确填写您的邮政编码");

// 增加只能是字母和数字的验证
jQuery.validator.addMethod("chrnum", function(value, element) {
	return this.optional(element) || (/^([a-zA-Z0-9]+)$/.test(value));
}, "只能输入数字、字母或者它们的组合");



/**
 * Cookie plugin
 *
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */

/**
 * Create a cookie with the given name and value and other optional parameters.
 *
 * @example $.cookie('the_cookie', 'the_value');
 * @desc Set the value of a cookie.
 * @example $.cookie('the_cookie', 'the_value', { expires: 7, path: '/', domain: 'jquery.com', secure: true });
 * @desc Create a cookie with all available options.
 * @example $.cookie('the_cookie', 'the_value');
 * @desc Create a session cookie.
 * @example $.cookie('the_cookie', null);
 * @desc Delete a cookie by passing null as value. Keep in mind that you have to use the same path and domain
 *       used when the cookie was set.
 *
 * @param String name The name of the cookie.
 * @param String value The value of the cookie.
 * @param Object options An object literal containing key/value pairs to provide optional cookie attributes.
 * @option Number|Date expires Either an integer specifying the expiration date from now on in days or a Date object.
 *                             If a negative value is specified (e.g. a date in the past), the cookie will be deleted.
 *                             If set to null or omitted, the cookie will be a session cookie and will not be retained
 *                             when the the browser exits.
 * @option String path The value of the path atribute of the cookie (default: path of page that created the cookie).
 * @option String domain The value of the domain attribute of the cookie (default: domain of page that created the cookie).
 * @option Boolean secure If true, the secure attribute of the cookie will be set and the cookie transmission will
 *                        require a secure protocol (like HTTPS).
 * @type undefined
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */

/**
 * Get the value of a cookie with the given name.
 *
 * @example $.cookie('the_cookie');
 * @desc Get the value of a cookie.
 *
 * @param String name The name of the cookie.
 * @return The value of the cookie.
 * @type String
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // CAUTION: Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};