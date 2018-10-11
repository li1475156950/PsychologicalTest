﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebPages.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script src="JS/layer.js"></script>
    <link href="Font-Awesome/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        .div-square {
            padding: 5px;
            border: 3px double #e1e1e1;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            margin: 5px;
        }

        .hidden-input {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        input[type=checkbox] + span {
            /* your style goes here */
            display: inline-block;
            height: 1em;
            width: 1em;
            border-radius: 4px;
            background-color: gray;
        }

        /* active style goes here */
        input[type=checkbox]:checked + span {
            background-color: #428BCA;
        }

        .groupbox {
            margin: 15px;
            border: thin solid #09C;
            padding: 10px;
        }

        .grouptitle {
            display: block;
            margin-top: -24px;
            margin-left: 20px;
            width: 150px;
            text-align: center;
            border-radius: 4px;
            color: #ffffff;
        }
    </style>
    <script>
        var navName = "";
        var test = "";
        ImgShow();
        window.setInterval(data, 1000);
        window.setInterval(InitWeleome, 3600);
        function data() {
            var d = new Date();
            var s = d.getFullYear()
               + "年" + (d.getMonth() + 1)
               + "月" + d.getDate()
               + "日&nbsp;" + (d.getHours().toString().length == 1 ? "0" + d.getHours().toString() : d.getHours().toString())
               + ":" + (d.getMinutes().toString().length == 1 ? "0" + d.getMinutes().toString() : d.getMinutes().toString())
               + ":" + (d.getSeconds().toString().length == 1 ? "0" + d.getSeconds().toString() : d.getSeconds().toString())
               + "&nbsp;星期" + getday(d.getDay());
            $("#HTML_Date").html(s);
        }

        function getday(obj) {

            switch (obj) {
                case 1:
                    obj = "一";
                    break;
                case 2:
                    obj = "二";
                    break;
                case 3:
                    obj = "三";
                    break;
                case 4:
                    obj = "四";
                    break;
                case 5:
                    obj = "五";
                    break;
                case 6:
                    obj = "六";
                    break;
                case 0:
                    obj = "日";
                    break;

            }
            return obj;
        }

        /*-----加载模块-----*/
        InitModel();
        var HTML_Var = "";
        function InitModel() {
            //边缘弹出
            //layer.open({
            //    type: 1
            //  , title: '系统维护升级通知'
            //  , offset: 'rb' //具体配置参考：offset参数项
            //  , content: '<div style="padding: 20px 20px;">&nbsp;&nbsp;&nbsp;尊敬的用户，您好，系统将于2017年8月30日18:00-23：00进行统一升级，期间可能会出现系统无法使用的情况，给您造成的不便，敬请理解。</div>'
            //  , btn: '关闭全部'
            //  , btnAlign: 'c' //按钮居中
            //  , shade: 0 //不显示遮罩
            //  , yes: function () {
            //      layer.closeAll();
            //  }
            //});
            $.ajax({
                type: "POST",
                url: "FunctionModular/Index/data/Index.ashx",
                data: "Remark=SetModel",//要执行查询的数据参数
                async: false,
                success: function (msg) {
                    $("#SetModelPanle").empty();
                    var JsonList = eval(msg);
                    if (JsonList != null && JsonList != "") {
                        $.each(JsonList, function (index, item) {
                            var Modular = ""
                            if (item.Model_ParentID == 0) {
                                //if (item.Model_Name != "问卷调查") {
                                    //if (item.Model_Name != "心理咨询") {
                                        if (item.Model_Name != "网站管理") {
                                            Modular = Modular + "<div class=\"groupbox\">"
                                            Modular = Modular + "   <span class=\"grouptitle\">" + item.Model_Name + "</span>"
                                            Modular = Modular + "   <div class=\"panel-body easypiechart-panel\">"

                                            $.each(JsonList, function (index2, item2) {

                                                HTML_Var = item2._Fun_Class;
                                                if (item2.Model_ParentID == item.Model_ID) {
                                                    if (item2.Model_Name != "综合档案") {
                                                        if (item2.Model_Name != "系统设置") {
                                                            if (item2.Model_Name != "数据备份") {
                                                                Modular = Modular + "       <div style='height: 103px;' class=\"col-lg-4 col-md-4 col-sm-4 col-xs-6\">"
                                                                Modular = Modular + "       <div style=\"margin-bottom: -35px; margin-right: 10px; float: right;\">"
                                                                Modular = Modular + "       <label>"
                                                                if (item2.IfSet == 1) {
                                                                    Modular = Modular + "     <input type=\"checkbox\" name=\"Modular_CK\" value=\"" + item2.Model_ID + "\" checked=\"checked\"  class=\"hidden-input\" />"
                                                                } else {
                                                                    Modular = Modular + "<input type=\"checkbox\" name=\"Modular_CK\" value=\"" + item2.Model_ID + "\" class=\"hidden-input\" />"
                                                                }
                                                                Modular = Modular + "  <span class=\"your style about checkbox\"></span>"
                                                                Modular = Modular + "  </label>"
                                                                Modular = Modular + " </div>"
                                                                Modular = Modular + " <div class=\"div-square\">"

                                                                Modular = Modular + "  <i class='" + HTML_Var + "' style=\"font-size: 2em;\"></i>"

                                                                Modular = Modular + "  <h4>" + item2.Model_Name + "</h4>"
                                                                Modular = Modular + "   </div>"
                                                                Modular = Modular + "  </div>"
                                                            }
                                                        }
                                                    }
                                                }
                                            });

                                            Modular = Modular + "   </div>"
                                            Modular = Modular + "</div>";


                                        }
                                    //}
                                //}
                            }
                            $("#SetModelPanle").append(Modular);
                        });
                      
                        //window.location.href = "/FunctionModular/HeartEvaluation/MyTest.aspx";
                    }
                    $('#CustomLink_Model').modal('show');
                  

                }
            });

        }
        function ImgShow()
        {
            
        }
       
     

        var Hid_SetVule = "";
        /*保存自定义快捷入口按钮*/
        function SaveModelSet() {
            if (Hid_SetVule != undefined) {
                Hid_SetVule = Hid_SetVule.substring(0, Hid_SetVule.length - 1);
            }
            GetModular();
            $.ajax({
                type: "POST",
                url: "FunctionModular/Index/data/Index.ashx",
                data: "Remark=SaveSetModel&ModularStr=" + Hid_SetVule,//要执行查询的数据参数
                success: function (msg) {

                    if (msg == 1) {

                        Hid_SetVule = "";
                        layer.msg("常用功能修改成功！", { time: 2000, icon: 1 })
                        $('#CustomLink_Model').modal('hide');
                        OnloadModular();//加载常用模块

                    } else if (msg == 2) {
                        Hid_SetVule = "";
                        layer.msg("常用功能设置成功！", { time: 2000, icon: 1 })
                        $('#CustomLink_Model').modal('hide');
                        OnloadModular();//加载常用模块
                    } else {

                        Hid_SetVule = "";
                        layer.msg("常用功能设置失败！", { time: 2000, icon: 2 })
                        $('#CustomLink_Model').modal('hide');
                        OnloadModular();//加载常用模块
                    }

                }
            });

        }



        function OnloadModular() {
            //LoadModular
            $.ajax({
                type: "POST",
                url: "FunctionModular/Index/data/Index.ashx",
                data: "Remark=LoadModular",//要执行查询的数据参数
                success: function (msg) {
                    if (msg=="") {
                        $("#QuickBtn").hide();
                    }
                    else {
                        $("#QuickBtn").empty();
                        //QuickBtn
                        $.each(eval(msg), function (index, item) {

                            var ModularObj = "";
                            ModularObj = ModularObj + "  <div style='height: 145px;' class=\"col-lg-2 col-md-2 col-sm-2 col-xs-6\">";
                            ModularObj = ModularObj + "     <div class=\"div-square\">";
                            ModularObj = ModularObj + "         <a href=\"" + item.HtmlUrl + "\">";
                            ModularObj = ModularObj + "             <i class='" + item._Fun_Class + " fa-5x'></i>";
                            ModularObj = ModularObj + "             <h4>" + item.Model_Name + "</h4>";
                            ModularObj = ModularObj + "         </a>";
                            ModularObj = ModularObj + "     </div>";
                            ModularObj = ModularObj + " </div>";
                            $("#QuickBtn").show();
                            $("#QuickBtn").append(ModularObj);
                        });
                    }
                }
            });
        }


        function GetModular() {
            Hid_SetVule = "";
            var objs = $("[name='Modular_CK']");
            if (objs != null) {
                for (var i = 0; i < objs.length; i++) {
                    if (objs[i].checked) {
                        Hid_SetVule += objs[i].value + ",";
                    }
                }

            }
        }


        function InitWeleome() {
            $.ajax({
                type: "POST",
                url: "FunctionModular/Index/data/Index.ashx",
                data: "Remark=InitWelcome",//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $("#IndexWelcome").empty();
                        var welcomeV = msg + ',' + OnloadTM();
                        $("#IndexWelcome").html(welcomeV);
                    }
                }
            });
        }

        function OnloadTM() {
            var hello = "";
            var now = new Date(), hour = now.getHours();
            if (hour < 6) { hello = "凌晨好！"; }
            else if (hour < 9) { hello = "早上好！"; }
            else if (hour < 12) { hello = "上午好！"; }
            else if (hour < 14) { hello = "中午好！"; }
            else if (hour < 17) { hello = "下午好！"; }
            else if (hour < 19) { hello = "傍晚好！"; }
            else if (hour < 22) { hello = "晚上好！"; }
            else { hello = "夜里好！"; }
            return hello;
        }
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
    </script>
    <ol class="breadcrumb">
        <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">我的主页</a></li>
    </ol>
    <input  type="hidden" id="ECode"/>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <label id="HTML_Date" style="font-size: 12px; float: right; margin: 30px 0px;"></label>
                </div>

            </div>
        </div>



    </div>

    <div class="row">
        <div class="col-lg-12 ">
            <div class="alert" style="color: #31708f;">
                <div class="media">
                    <div class="pull-left">
                        <img src="/assets/images/gallery/userimg.jpg" style="max-width: 80px; max-height: 100px; border-radius: 10px;" class="img-responsive" />
                    </div>
                    <div class="media-body">
                        <div class="media-heading" style="border-bottom: 10px; font-size: 26px" id="IndexWelcome">
                        </div>
                        <label>欢迎使用心理测评档案管理系统！</label>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">

            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading" style="color: #31708f;">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4">
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: center;">
                            常用功能  
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                            <a href="#" data-rel="reload" id="SetCustomLinks" onclick="return SetCustomLink();"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-rel="collapse" onclick="OnloadModular();"><i class="glyphicon glyphicon-refresh"></i></a>
                        </div>
                    </div>
                </div>
                <div class="panel-body" style="background-color: #fafafa;">
                    <div class="row text-center pad-top" id="QuickBtn">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="CustomLink_Model" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="ModalLabel">常用功能设置
                    </h4>
                </div>
                <div class="modal-body" id="SetModelPanle">
                </div>
                <div class="modal-footer">


                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-5 text-right">
                            <button type="button" class="btn btn-sm" style="background-color: orange; color: white" onclick="SaveModelSet()">
                                确认设置
                            </button>
                        </div>
                        <div class="col-sm-2 col-xs-4  text-right">
                            <button type="button" class="btn btn-sm" style="background-color: RGB(66,139,203); color: white" data-dismiss="modal">
                                关闭
                            </button>

                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>







    <script>
        OnloadModular();//加载常用模块
        //CustomLink_Model
        function SetCustomLink() {


            InitModel();

            //$('#CustomLink_Model').modal('show');
            return false;
            // $('#CustomLink_Model').modal('hide');
        }
       
        img();
        function img() {
            $.ajax({
                url: "FunctionModular/LoginAndRegister/Ajax/LoginAndRegister.ashx?operationType=imgs",
                //dataType: "post",
                success: function (result) {
                    if (result == "") {
                        $(".img-responsive").attr("src", "/assets/images/gallery/userimg.jpg")
                    }
                    else {
                        $(".img-responsive").attr("src", result)
                    }


                }
            })

        }
        //mokuai();
        //function mokuai() {

        //    $.ajax({
        //        url: "FunctionModular/LoginAndRegister/Ajax/LoginAndRegister.ashx?operationType=mokuai",
        //        //dataType: "post",
        //        success: function (result) {
        //            if (result == 3) {
        //                $('#SetCustomLinks').css('visibility', 'hidden');
        //            }
        //            else{
        //                $('#SetCustomLinks').css('visibility', 'block');
        //            }
        //        }
        //    })

        //}
        InitWeleome();//加载欢迎用户语
    </script>

</asp:Content>
