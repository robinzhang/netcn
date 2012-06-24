<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    注册新用户
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="content">
            <div id="form_wrapper" class="form_wrapper">
                <% using (Html.BeginForm("Index", "Account", FormMethod.Post, new { @class = "register" }))
                   { %>
                <%: Html.ValidationSummary(true, "登录不成功。请更正错误并重试。") %>
                <h3>
                    注册</h3>
                <div>
                    <label>
                        用户:</label>
                    <input name="reg_name" type="text" />
                    <span class="error">输入格式不正确</span>
                </div>
                <div>
                    <label>
                        密码:
                    </label>
                    <input name="reg_pwd" type="password" />
                    <span class="error">输入格式不正确</span>
                </div>
                <div>
                    <label>
                        重复密码:
                    </label>
                    <input name="reg_repwd" type="password" />
                    <span class="error">输入格式不正确</span>
                </div>
                <div class="bottom">
                    <div class="remember">
                    </div>
                    <input type="submit" tag='reg' value="注册" />
                    <a href="#" rel="login" class="linkform">已经注册过? 点击这里登陆 </a>
                    <div class="clear">
                    </div>
                </div>
                <% } %>
                <form class="login  active ">
                <h3>
                    登录</h3>
                <div>
                    <label>
                        用户:</label>
                    <input name='login_name' type="text" />
                    <span class="error">输入格式不正确</span>
                </div>
                <div>
                    <label>
                        密码:
                    </label>
                    <input name='login_pwd' type="password" />
                    <span class="error">输入格式不正确</span>
                </div>
                <div class="bottom">
                    <div class="remember">
                    </div>
                    <input type="submit" tag='login' value="登录"></input>
                    <a href="#" rel="register" class="linkform">还没有注册过? 点击这里注册</a>
                    <div class="clear">
                    </div>
                </div>
                </form>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <!-- The JavaScript --> 
    <script type="text/javascript">
        $(function () {
            //the form wrapper (includes all forms)
            var $form_wrapper = $('#form_wrapper'),
			$currentForm = $form_wrapper.children('form.active'),
			$linkform = $form_wrapper.find('.linkform');
            //get width and height of each form and store them for later						
            $form_wrapper.children('form').each(function (i) {
                var $theForm = $(this);
                if (!$theForm.hasClass('active'))
                    $theForm.hide();
                $theForm.data({
                    width: $theForm.width(),
                    height: $theForm.height()
                });
            });

            //set width and height of wrapper (same of current form)
            setWrapperWidth();


            $linkform.bind('click', function (e) {
                var $link = $(this);
                var target = $link.attr('rel');
                $currentForm.fadeOut(400, function () {
                    //remove class active from current form
                    $currentForm.removeClass('active');
                    //new current form
                    $currentForm = $form_wrapper.children('form.' + target);
                    //animate the wrapper
                    $form_wrapper.stop()
									 .animate({
									     width: $currentForm.data('width') + 'px',
									     height: $currentForm.data('height') + 'px'
									 }, 500, function () {
									     //new form gets class active
									     $currentForm.addClass('active');
									     //show the new form
									     $currentForm.fadeIn(400);
									 });
                });
                e.preventDefault();
            });

            function setWrapperWidth() {
                $form_wrapper.css({
                    width: $currentForm.data('width') + 'px',
                    height: $currentForm.data('height') + 'px'
                });
            }
            $form_wrapper.find('input[type="submit"]')
							 .click(function (e) {
							     var tag = $(this).attr('tag');
							     if (tag == 'reg') {
							         if ($('[name="reg_name"]').val().length == 0) {
							             $('[name="reg_name"]').next().css('visibility', 'visible');
							             $('[name="reg_name"]').next('.error').html('注册用户名不能为空');
							             return false;
							         }
							         else {
							             $('[name="reg_name"]').next().css('visibility', 'hidden');
							         }
							         if ($('[name="reg_pwd"]').val().length == 0) {
							             $('[name="reg_pwd"]').next().css('visibility', 'visible');
							             $('[name="reg_pwd"]').next('.error').html('注册密码不能为空');
							             return false;
							         }
							         else {
							             $('[name="reg_pwd"]').next().css('visibility', 'hidden');
							         }
							         if ($('[name="reg_repwd"]').val().length == 0) {
							             $('[name="reg_repwd"]').next().css('visibility', 'visible');
							             $('[name="reg_repwd"]').next('.error').html('重复密码不能为空');
							             return false;
							         }
							         else {
							             if ($('[name="reg_repwd"]').val() != $('[name="reg_pwd"]').val()) {
							                 $('[name="reg_repwd"]').next().css('visibility', 'visible');
							                 $('[name="reg_repwd"]').next('.error').html('两次密码输入不一致');
							                 return false;
							             }
							             $('[name="reg_pwd"]').next().css('visibility', 'hidden');
							         }
							         $.ajax({
							             type: 'POST',
							             url: '/Account/Register',
							             data: { reg_name: $('[name="reg_name"]').val(), reg_pwd: $('[name="reg_pwd"]').val(), reg_repwd: $('[name="reg_repwd"]').val() },
							             success: function (res) {
							                 if (res == 0) {
							                     alert('注册成功点击确定登录！');
							                     $currentForm.fadeOut(400, function () {
							                         //remove class active from current form
							                         $currentForm.removeClass('active');
							                         //new current form
							                         $currentForm = $form_wrapper.children('form.login');
							                         //animate the wrapper
							                         $form_wrapper.stop()
									             .animate({
									                 width: $currentForm.data('width') + 'px',
									                 height: $currentForm.data('height') + 'px'
									             }, 500, function () {
									                 //new form gets class active
									                 $currentForm.addClass('active');
									                 //show the new form
									                 $currentForm.fadeIn(400);
									             });
							                     });
							                 }
							                 else if (res == 6) {
							                     alert('要注册的用户已经存在!');
							                 }
							                 else {
							                     alert('注册用户失败!');
							                 }
							             },
							             dataType: 'json'
							         });
							     }
							     else {
							         if ($('[name="login_name"]').val().length == 0) {
							             $('[name="login_name"]').next().css('visibility', 'visible');
							             $('[name="login_name"]').next('.error').html('用户名不能为空');
							             return false;
							         }
							         else {
							             $('[name="login_name"]').next().css('visibility', 'hidden');
							         }
							         if ($('[name="login_pwd"]').val().length == 0) {
							             $('[name="login_pwd"]').next().css('visibility', 'visible');
							             $('[name="login_pwd"]').next('.error').html('密码不能为空');
							             return false;
							         }
							         else {
							             $('[name="login_pwd"]').next().css('visibility', 'hidden');
							         }
							         $.ajax({
							             type: 'POST',
							             url: '/Account/Logon',
							             data: { login_name: $('[name="login_name"]').val(), login_pwd: $('[name="login_pwd"]').val() },
							             success: function (res) {
							                 if (res) {
							                     alert('登陆成功点击确定进入首页！');
							                     window.location.href = '/';
							                 }
							                 else {
							                     alert('登陆失败!');
							                 }
							             },
							             dataType: 'json'
							         });
							     }
							     return false;
							 });
        });
    </script>
    <script type="text/javascript">
        Cufon.replace('h1', { textShadow: '1px 1px #fff' });
        Cufon.replace('h2', { textShadow: '1px 1px #fff' });
    </script>
</asp:Content>
