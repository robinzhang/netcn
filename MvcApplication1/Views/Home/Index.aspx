<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    主页
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Content/nivo-slider/themes/default/default.css" />
    <link type="text/css" rel="stylesheet" href="../../Content/nivo-slider/themes/pascal/pascal.css" />
    <link type="text/css" rel="stylesheet" href="../../Content/nivo-slider/themes/orman/orman.css" />
    <link type="text/css" rel="stylesheet" href="../../Content/nivo-slider/nivo-slider.css" />
    <script type="text/javascript" src="../../Content/nivo-slider/jquery.nivo.slider.js"></script>
    <style>
        .login_btn
        {
            position: relative;
            z-index: 2000;
            float: left;
            width:130px;
            margin-top: -60px;
            margin-right: 300px;
            padding: 10px 20px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            -webkit-animation: fade-in 0.8s linear;
            -webkit-animation-delay: .8s;
            -webkit-animation-fill-mode: both;
            -moz-animation: fade-in 0.8s linear;
            -moz-animation-delay: .8s;
            -moz-animation-fill-mode: both;
            animation: fade-in 0.8s linear;
            animation-delay: .8s;
            animation-fill-mode: both;
            background-color: #ff6c14;
            background-image: -moz-linear-gradient(top, #ff7200, #ff6231);
            background-image: -ms-linear-gradient(top, #ff7200, #ff6231);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ff7200), to(#ff6231));
            background-image: -webkit-linear-gradient(top, #ff7200, #ff6231);
            background-image: -o-linear-gradient(top, #ff7200, #ff6231);
            background-image: linear-gradient(top, #ff7200, #ff6231);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff7200', endColorstr='#ff6231', GradientType=0);
            border-color: #ff6231 #ff6231 #e33600;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:dximagetransform.microsoft.gradient(enabled=false);
            color: #ffffff;
            text-shadow: 0 -2px 0 rgba(0, 0, 0, 0.15);
            border: 1px solid #d03500;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            -webkit-transition: all 0.2s;
            -moz-transition: all 0.2s;
            -ms-transition: all 0.2s;
            -o-transition: all 0.2s;
            transition: all 0.2s;
            border-color: #ccc;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        }
        .login_btn:hover, .login_btn:active, .login_btn.active, .login_btn.disabled, .login_btn[disabled]
        {
            background-color: #ff6231;
        }
        .login_btn:active, .login_btn.active
        {
            background-color: #fd3c00 \9;
        }
        .login_btn:hover
        {
            background: #ff8f00;
            color: #ffffff;
            text-shadow: 0 -2px 0 rgba(0, 0, 0, 0.15);
        }
        .login_btn.active, .button.warning.active, .button.danger.active, .button.success.active, .button.info.active, .button.inverse.active
        {
            color: rgba(255, 255, 255, 0.75);
        }
        .theme-default a.nivo-prevnav
        {
            left: 15px;
        }
        .theme-default #slider
        {
            width: 860px;
            margin: 0 auto;
        }
        .theme-default #slider .nivo-controlNav
        {
            left: 45%;
        }
        .theme-default .nivoSlider
        {
            -webkit-box-shadow: none;
            box-shadow: none;
        }
    </style>
    <script type="text/javascript">
        $(window).load(function () { $('.login_btn').css('left', $('#slider').offset().left + 640); $('.login_btn').bind('click', function (e) { window.location.href = '/Account'; }); $('#slider').nivoSlider({ effect: 'random', slices: 15, animSpeed: 500, pauseTime: 3000 }); });   
    </script>
    <button class="login_btn">
        登 录</button>
    <div class="slider-wrapper theme-default menter" style="margin-top: 100px;">
        <div class="ribbon">
        </div>
        <div id="slider" class="nivoSlider" style="position: relative; width: 820px; height: 540px;
            background-image: url(../../Content/images/1.jpg); background-position: initial initial;
            background-repeat: no-repeat no-repeat;">
            <img src="../../Content/images/2.jpg" alt="" style="display: none;">
            <img src="../../Content/images/3.jpg" alt="" style="display: none;">
            <img src="../../Content/images/4.jpg" alt="" style="display: none;">
            <img src="../../Content/images/5.jpg" alt="" style="display: none;">
            <img src="../../Content/images/6.jpg" alt="" style="display: none;">
            <img src="../../Content/images/7.jpg" alt="" style="display: none;">
        </div>
    </div>
</asp:Content>
