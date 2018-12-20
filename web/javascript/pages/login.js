$(function(){
	$('#entry').click(function(){
		if($('#adminName').val()==''){
			$('.mask,.dialog').show();
			$('.dialog .dialog-bd p').html('请输入管理员账号！');
		}else if($('#adminPwd').val()==''){
			$('.mask,.dialog').show();
			$('.dialog .dialog-bd p').html('请输入管理员密码！');
		}else if($('#adminName').val()=='admin'&&$('#adminPwd').val()=='123456'){
			$('.mask,.dialog').hide();
			location.href='m_index.html';
		}
		else
		{
			$('.mask,.dialog').show();
			$('.dialog .dialog-bd p').html('账号或密码错误！');
		}
	});
});
