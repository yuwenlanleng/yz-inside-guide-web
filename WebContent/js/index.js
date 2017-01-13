$(function () {
	
	/*在按钮前后加上小图标，例如表示搜索*/
	$('#search_button').button({
		icons : {
			primary : 'ui-icon-search',
			secondary : 'ui-icon-triangle-1-s'
		}
	});
	
	
	//等待对话框
	$('#loading').dialog({
		autoOpen : false,
		modal : true,
		closeOnEscape : false,
		resizable : false,
		draggable : false,
		width : 180,
		height : 50,
	}).parent().parent().find('.ui-widget-header').hide();
	
	

	/**
	 * 添加资源
	 */
	
	$('#reg').dialog({
		title : '添加资源',
		autoOpen : false,
		modal : true,
		resizable : false,
		width : 400,
		height : 560,
		buttons : {
			'提交' : function () {
				$(this).submit();
			},
			'取消': function () {
				$(this).dialog('close')
			}
		}
	}).buttonset().validate({
	
		submitHandler : function (form) {
			$(form).ajaxSubmit({
				url : 'addGuideItem',
				type : 'POST',
				beforeSubmit : function (formData, jqForm, options) {
					$('#loading').dialog('open');
					$('#reg').dialog('widget').find('button').eq(1).button('disable');
				},
				success : function (responseText, statusText) {
					if (responseText) {
						$('#body').load('frontpage');  //成功以后做刷新
						$('#reg').dialog('widget').find('button').eq(1).button('enable');
						$('#loading').css('background', 'url(img/success.gif) no-repeat 20px center').html('数据新增成功...');
						setTimeout(function () {
							$('#loading').dialog('close');
							$('#reg').dialog('close');
							$('#reg').resetForm();
							$('#reg span.star').html('*').removeClass('succ');
							$('#loading').css('background', 'url(img/loading.gif) no-repeat 20px center').html('数据交互中...');
						}, 1000);
						
					}
				},
			});
		},
	
		showErrors : function (errorMap, errorList) {
			var errors = this.numberOfInvalids();
			
			if (errors > 0) {
				$('#reg').dialog('option', 'height', errors * 30 + 540);  //得到错误数*20在原来的高度上相加
			} else {
				$('#reg').dialog('option', 'height', 540);
			}
			
			this.defaultShowErrors();
		},
		
		highlight : function (element, errorClass) {  //错误高亮显示
			$(element).css('border', '1px solid #630');
			$(element).parent().find('span').html('*').removeClass('succ');
		},
		
		unhighlight : function (element, errorClass) {  //正确消除高亮显示
			
			$(element).css('border', '1px solid #ccc');
			$(element).parent().find('span').html('&nbsp;').addClass('succ');
		},
	
		errorLabelContainer : 'ol.resouce_error',
		wrapper : 'li',
	
		rules : {
			"guideItem.name" : {
				required : true,
				minlength : 2,
			},
			"guideItem.guideType" : {
				required : true,
				minlength : 2,
			},
			"guideItem.des" : {
				required : true,
				minlength : 6,
			},
			"guideItem.innerUrl" : {
				required : true,
				url : true,
			},
			"guideItem.outerUrl" : {
				required : true,
				url : true,
			},
		},
		messages : {
			"guideItem.name" : {
				required : '名称不得为空！',
				minlength : jQuery.format('名称不得小于{0}位！'),
			},
			"guideItem.guideType" : {
				required : '类型不得为空！',
				minlength : jQuery.format('类型不得小于{0}位！'),
			},
			"guideItem.des" : {
				required : '描述不得为空！',
				minlength : jQuery.format('描述不得小于{0}位！'),
			},
			"guideItem.innerUrl" : {
				required : '内网入口不得为空！',
				minlength : '请输入正确的网址！',
			},	
			"guideItem.outerUrl" : {
				required : '外网入口不得为空！',
				minlength : '请输入正确的网址！',
			},	
		}
	});
	
	$('#reg_a').click(function(){
		$('#reg').dialog('open');
		
	});
	
	
	$('#member, #logout').hide();
	
	if ($.cookie('user')) {
		$('#member, #logout').show();
		$('#reg_a, #login_a').hide();
		$('#member').html($.cookie('user'));
	} else {
		$('#member, #logout').hide();
		$('#reg_a, #login_a').show();
	}
	
	$('#logout').click(function () {
		$.removeCookie('user');
		$('#body').load('frontpage'); 
	});
	
	
	
	
	/**
	 * 注册用户
	 */
	$('#regUser').dialog({
		title : '注册用户',
		autoOpen : false,
		modal : true,
		resizable : false,
		width : 400,
		height : 560,
		buttons : {
			'提交' : function () {
				$(this).submit();
			},
			'取消': function () {
				$(this).dialog('close')
			}
		}
	}).buttonset().validate({
	
		submitHandler : function (form) {
			$(form).ajaxSubmit({
				url : 'addUser',
				type : 'POST',
				beforeSubmit : function (formData, jqForm, options) {
					$('#loading').dialog('open');
					$('#regUser').dialog('widget').find('button').eq(1).button('disable');
				},
				success : function (responseText, statusText) {
					if (responseText) {
						$('#body').load('frontpage');  //成功以后做刷新
						$('#regUser').dialog('widget').find('button').eq(1).button('enable');
						$('#loading').css('background', 'url(img/success.gif) no-repeat 20px center').html('数据新增成功...');
						$.cookie('user', $('#user').val());
						setTimeout(function () {
							$('#loading').dialog('close');
							$('#regUser').dialog('close');
							$('#regUser').resetForm();
							$('#regUser span.star').html('*').removeClass('succ');
							$('#loading').css('background', 'url(img/loading.gif) no-repeat 20px center').html('数据交互中...');
						}, 1000);
						
					}
				},
			});
		},
	
		showErrors : function (errorMap, errorList) {
			var errors = this.numberOfInvalids();
			
			if (errors > 0) {
				$('#regUser').dialog('option', 'height', errors * 30 + 540);  //得到错误数*20在原来的高度上相加
			} else {
				$('#regUser').dialog('option', 'height', 540);
			}
			
			this.defaultShowErrors();
		},
		
		highlight : function (element, errorClass) {  //错误高亮显示
			$(element).css('border', '1px solid #630');
			$(element).parent().find('span').html('*').removeClass('succ');
		},
		
		unhighlight : function (element, errorClass) {  //正确消除高亮显示
			$(element).css('border', '1px solid #ccc');
			$(element).parent().find('span').html('&nbsp;').addClass('succ');
		},
	
		errorLabelContainer : 'ol.reg_error',
		wrapper : 'li',
	
		rules : {
			"user.userName" : {
				required : true,
				minlength : 2,
				remote : {
					url : 'checkUserName',
					type : 'POST',
				},
			},
			"user.passWord" : {
				required : true,
				minlength : 6,
			},
			"user.email" : {
				required : true,
				email : true,
			},
			"user.date" : {
				date : true,
			},
		},
		messages : {
			"user.userName" : {
				required : '帐号不得为空！',
				minlength : jQuery.format('帐号不得小于{0}位！'),
				remote : '帐号被占用！',
			},
			"user.passWord" : {
				required : '密码不得为空！',
				minlength : jQuery.format('密码不得小于{0}位！'),
			},
			"user.email" : {
				required : '邮箱不得为空！',
				minlength : '请输入正确的邮箱地址！',
			},
		}
	});
	
	$('#date').datepicker({
		changeMonth : true,
		changeYear : true,
		yearSuffix : '',
		maxDate : 0,
		yearRange : '1950:2020',

	});
	
	
	//邮箱自动补全
	$('#email').autocomplete({
		delay : 0,
		autoFocus : true,
		source : function (request, response) {
			
			var hosts = ['qq.com', '163.com', '263.com', 'sina.com.cn','gmail.com', 'hotmail.com'],
				term = request.term,		//获取用户输入的内容
				name = term,				//邮箱的用户名
				host = '',					//邮箱的域名
				ix = term.indexOf('@'),		//@的位置
				result = [];				//最终呈现的邮箱列表
				
				
			result.push(term);
			
			//当有@的时候，重新分别用户名和域名
			if (ix > -1) {
				name = term.slice(0, ix);
				host = term.slice(ix + 1);
			}
			
			if (name) {
				//如果用户已经输入@和后面的域名，
				//那么就找到相关的域名提示，比如bnbbs@1，就提示bnbbs@163.com
				//如果用户还没有输入@或后面的域名，
				//那么就把所有的域名都提示出来
				
				var findedHosts = (host ? $.grep(hosts, function (value, index) {
						return value.indexOf(host) > -1
					}) : hosts),
					findedResult = $.map(findedHosts, function (value, index) {
					return name + '@' + value;
				});
				
				result = result.concat(findedResult);
			}
			
			response(result);
		},	
	});
	
	$('#reg_user').click(function(){
		$('#regUser').dialog('open');
		
	});
	
	
	/**
	 * 登录
	 */
	$('#login').dialog({
		title : '登录',
		autoOpen : false,
		modal : true,
		resizable : false,
		width : 400,
		height : 560,
		buttons : {
			'提交' : function () {
				$(this).submit();
			},
			'取消': function () {
				$(this).dialog('close')
			}
		}
	}).validate({
	
		submitHandler : function (form) {
			$(form).ajaxSubmit({
				url : 'login',
				type : 'POST',
				beforeSubmit : function (formData, jqForm, options) {
					$('#loading').dialog('open');
					$('#login').dialog('widget').find('button').eq(1).button('disable');
				},
				success : function (responseText, statusText) {
					if (responseText) {
						$('#body').load('frontpage');  //成功以后做刷新
						$('#login').dialog('widget').find('button').eq(1).button('enable');
						$('#loading').css('background', 'url(img/success.gif) no-repeat 20px center').html('用户登录成功...');
						if ($('#expires').is(':checked')) {
							$.cookie('user', $('#login_user').val(), {
								expires : 7,
							});
						} else {
							$.cookie('user', $('#login_user').val());
						}
						setTimeout(function () {
							$('#loading').dialog('close');
							$('#login').dialog('close');
							$('#login').resetForm();
							$('#login span.star').html('*').removeClass('succ');
							$('#loading').css('background', 'url(img/loading.gif) no-repeat 20px center').html('用户登录中...');
							$('#member, #logout').show();
							$('#reg_a, #login_a').hide();
							$('#member').html($.cookie('user'));
						}, 1000);
						
					}
				},
			});
		},
	
		showErrors : function (errorMap, errorList) {
			var errors = this.numberOfInvalids();
			
			if (errors > 0) {
				$('#login').dialog('option', 'height', errors * 30 + 540);  //得到错误数*20在原来的高度上相加
			} else {
				$('#login').dialog('option', 'height', 540);
			}
			
			this.defaultShowErrors();
		},
		
		highlight : function (element, errorClass) {  //错误高亮显示
			$(element).css('border', '1px solid #630');
			$(element).parent().find('span').html('*').removeClass('succ');
		},
		
		unhighlight : function (element, errorClass) {  //正确消除高亮显示
			$(element).css('border', '1px solid #ccc');
			$(element).parent().find('span').html('&nbsp;').addClass('succ');
		},
	
		errorLabelContainer : 'ol.login_error',
		wrapper : 'li',
	
		rules : {
			"user.userName" : {
				required : true,
				minlength : 2,
			},
			"user.passWord" : {
				required : true,
				minlength : 6,
				remote : {
					url : 'login',
					type : 'POST',
				},
			},
			
		},
		messages : {
			
			"user.userName" : {
				required : '不得为空！',
				minlength : jQuery.format('密码不得小于{0}位！'),
			},
			"user.passWord" : {
				required : '密码不得为空！',
				minlength : jQuery.format('帐号不得小于{0}位！'),
				remote : '用户名或密码不正确！',
			},
		
		}
	});
	
	$('#login_a').click(function(){
		$('#login').dialog('open');
		
	});

	
	$('#date').datepicker({
		changeMonth : true,
		changeYear : true,
		yearSuffix : '',
		maxDate : 0,
		yearRange : '1950:2020',

	});
	
	
	//邮箱自动补全
	$('#email').autocomplete({
		delay : 0,
		autoFocus : true,
		source : function (request, response) {
			
			var hosts = ['qq.com', '163.com', '263.com', 'sina.com.cn','gmail.com', 'hotmail.com'],
				term = request.term,		//获取用户输入的内容
				name = term,				//邮箱的用户名
				host = '',					//邮箱的域名
				ix = term.indexOf('@'),		//@的位置
				result = [];				//最终呈现的邮箱列表
				
				
			result.push(term);
			
			//当有@的时候，重新分别用户名和域名
			if (ix > -1) {
				name = term.slice(0, ix);
				host = term.slice(ix + 1);
			}
			
			if (name) {
				//如果用户已经输入@和后面的域名，
				//那么就找到相关的域名提示，比如bnbbs@1，就提示bnbbs@163.com
				//如果用户还没有输入@或后面的域名，
				//那么就把所有的域名都提示出来
				
				var findedHosts = (host ? $.grep(hosts, function (value, index) {
						return value.indexOf(host) > -1
					}) : hosts),
					findedResult = $.map(findedHosts, function (value, index) {
					return name + '@' + value;
				});
				
				result = result.concat(findedResult);
			}
			
			response(result);
		},	
	});
	
	$('#reg_user').click(function(){
		$('#regUser').dialog('open');
		
	});
	
});

























