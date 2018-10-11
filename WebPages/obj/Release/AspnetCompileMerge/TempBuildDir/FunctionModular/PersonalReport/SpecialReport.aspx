
<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialReport.aspx.cs" Inherits="WebPages.FunctionModular.PersonalReport.SpecialReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />

    <%-- <script src="../../JS/jquery.jqprint-0.3.js"></script>--%>
    <style>
        .groupbox {
            margin: 15px;
            border: thin solid #09C;
            padding: 10px;
            border-radius: 5px;
        }

        .grouptitle {
            display: block;
            margin-top: -24px;
            margin-left: 20px;
            width: 150px;
            text-align: center;
            background-color: #09C;
        }

        .groupfoot {
            display: block;
            margin-bottom: -24px;
            float: right;
            margin-right: 20px;
            width: 80px;
            text-align: center;
            background-color: RGB(245,248,253);
        }

        .heng_s {
            border-bottom: 1px solid #ccc;
            height: 100px;
            position: relative;
            color: white;
        }

        .heng_z {
            position: absolute;
            bottom: 0;
            width: 180px;
        }

            .heng_z:nth-child(1) {
                left: 40px;
            }

            .heng_z:nth-child(2) {
                left: 320px;
            }

            .heng_z:nth-child(3) {
                left: 600px;
            }

        .zz1 {
            left: 40px;
        }
        /*ie8*/
        .spans {
            margin-top: -23px;
            display: inline-block;
            position: absolute;
            right: 11px;
        }

        .hengs {
            height: 30px;
            background: #009966;
            float: left;
            border-bottom: none;
            bottom: 0px;
        }

            .hengs span {
                margin-top: -23px;
                display: inline-block;
                position: absolute;
                right: 11px;
            }

        .heng_xia {
            overflow: hidden;
            zoom: 1;
        }

        .fen_j {
            float: left;
        }
        /*.fen_j:nth-child(1){ margin-left:40px;}
.fen_j:nth-child(2){ margin-left:30px;}
.fen_j:nth-child(3){ margin-left:30px;}*/
        .jj1 {
            margin-left: 40px;
        }
        /*ie8*/
        .jj2 {
            margin-left: 30px;
        }

        .jj3 {
            float: right;
        }

        .progress-barA {
            float: left;
            width: 0;
            height: 100%;
            font-size: 12px;
            color: #fff;
            text-align: center;
            background-color: #428bca;
            -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
            box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
            -webkit-transition: width .6s ease;
            transition: width .6s ease;
        }

        .markerA {
            background: #555;
            width: 2px;
            height: 40px;
            position: absolute;
            left: 250px;
            /*top: 50%;*/
            margin-top: -50px;
        }

        .red {
            background: #cd6668;
        }

        .progress-barB {
            float: left;
            width: 0;
            height: 100%;
            font-size: 12px;
            color: #121212;
            text-align: center;
        }

        .progressA {
            height: 20px;
            overflow: hidden;
        }
    </style>
    <%-- <div style="float:left;margin-top:10px;margin-right:10px;">
                <button type="button" onclick="print()"> 
                    导出
                </button>
            </div>--%>
    <div style="text-align: right; margin-top: 10px; margin-right: 0px; margin-bottom: 5px;">
        <%--   <button  type="button" class="btn btn-danger" onclick="Edite()" id="Edite">修改</button>
                     <button type="button" class="btn btn-danger" onclick="recovery()" style="display:none" id="recovery">回复默认</button>--%>
    </div>
    <div class="col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px;">

        <div class="well" id="Print" style="overflow-x: auto;">

            <div class="row" style="margin-left: auto; margin-right: auto; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12 text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700; text-align: center;" id="ReportTitle">《中学生考试焦虑影响因素问卷》测评报告</h4>
                </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                    <table class="MsoTableGrid" style="border-collapse: collapse; width: 498.1000pt; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%; line-height: 30px;">
                        <tbody>
                            <tr>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="loginName"></td>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="Uname"></td>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="sex"></td>
                            </tr>
                            <tr>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="birdth"></td>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="Createtime" colspan="2"></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        一、测验简介
                    </div>
                    <div id="Introduce" style="margin-top: 15px; text-indent: 2em; line-height: 30px;"></div>

                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        二、测试结果
                    </div>

                    <div id="AnalysisChart" style="margin-top: 15px;"></div>
                    <div class="col-md-12 col-sm-12 col-xs-12" id="container" style="height: 400px">
                    </div>
                    <div class="row" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <image id="imagescr" width="600px" height="400px"></image>
                    </div>
                </div>

            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">

                <div id="GeneralMessage" style="margin-top: 15px; width: 100%">
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div class="" style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        三、原始答卷
                    </div>
                    <div class="" id="AnswerRecord" style="min-width: 310px; margin-top: 15px;">
                        <table class="MsoTableGrid" style="border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%" id="tableid">
                        </table>
                    </div>

                </div>
                <div id="dictionary">
                </div>
                  
             <%--   <div class="row" style="margin-top: 15px; margin-bottom: 10px; text-align: center;" id="My">
                    <div class="col-md-12">
                        <button class="btn btn-warning btn-sm" onclick="addRow()" id="NewInfo" style="display: none"><i></i>新增内容</button>
                        <button class="btn btn-warning btn-sm" id="Newdelete" onclick="remove(this)" style="display: none"><i></i>删除</button>
                    </div>
                </div>--%>
            </div>
        </div>
        <div class="row" style="text-align: center; margin-bottom: 10px;">

            <button type="button" class="btn btn-sm" style="background-color: orange; color: white" id="export">导出</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-sm" style="color: white" onclick="Exits()">返回</button>

            <button type="button" id="SaveID" class="btn btn-info" onclick="Add()" style="display: none">保存</button>
        </div>

    </div>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/highcharts-more.js"></script>
    <%-- <script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/highcharts-more.js"></script>--%>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
       <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
   <%-- <script src="../../JS/word/jquery.wordexport.js"></script>--%>
    <script src="../../JS/SpecialJS.js"></script>
    <script>

        /*------------根据量表ID查询量表基本信息--------------*/
        //var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        //var navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';

        var navName = "";
        var AmountName = "";
        var Types = getUrlParam("type");
        var AmountTypes = getUrlParam("AmountType");
        if (Types == 1 && AmountTypes == 1) {
            navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
            $("#recovery").hide();
        } else if (AmountTypes == 0) {
            PersonTypes = 2//预警
            navName = '/FunctionModular/Warning/CrisisWarning.aspx';
            $("#recovery").hide();
        }
        else {
            navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
            $("#recovery").show();
        }
        var Acodes = "";
        var Request = new Object();
        var filename = "";
        Request = GetRequest();
        /*获取浏览器网址参数*/
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }
        InitPages();
        /*-----根据答题ID加载报告信息-------*/
        var AnswerJson = "";//测试人答题的Json
        var AmountCode = "";//答题的量表编码
        var SubjectTotal = 0;//量表题干数量
        //var 
        function InitPages() {

            var answer_id = Request["A_ID"];
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitPages",
                    A_ID: answer_id
                },//要执行查询的数据参数
                success: function (msg) {
                    var sexval = 0;
                    var AgeVal = 0;
                    if (msg != "") {
                        var obj = eval(msg);
                        if (obj != null && obj.length > 0) {
                            filename = obj[10] + "-" + obj[11];
                            AmountName = obj[10];
                            $("#Introduce").html(obj[7]);
                            $("#ReportTitle").html("《" + obj[10] + "》" + "测评报告");
                            AnswerJson = obj[1];//答案Json数据集合
                            AmountCode = obj[8];//量表编码
                            SubjectTotal = obj[9];//量表题干数量

                            $("#loginName").html("登录名：" + (obj[2]) + "</br>");
                            $("#Uname").html("姓名：" + obj[11] + "</br>");
                            $("#sex").html("性别：" + (obj[12]) + "</br>");
                            //$("#Codenumber").html("编号:" + (obj[2]) + "</br>");
                            $("#birdth").html("出生日期：" + obj[13] + "</br>");
                            $("#Createtime").html("完成时间：" + obj[4] + "</br>");
                            if (obj[12] == "男") {
                                sexval = 1;
                            } else if (obj[12] == "女") {
                                sexval = 2;
                            }
                            var AllscoreA = obj[15];
                            var StartTimeA = obj[4];
                            var EndtimeA = obj[13];
                            AgeVal = DateDiff(StartTimeA, EndtimeA);
                            var GetType = getUrlParam("types");
                            Acodes = AmountCode;
                            if (GetType == 3) {
                                TSLB3(AmountCode, answer_id, sexval, AgeVal, GetType);//加载维度总评
                            }                         
                            else if (GetType == 6) {
                                TSLB6(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 8) {
                                TSLB8(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 9) {
                                TSLB9(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 901) {
                                TSLB901(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 801) {
                                TSLB801(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 802) {
                                TSLB802(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            }
                            else if (GetType == 14) {
                                TSLB14(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 10) {
                                TSLB10(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            }
                        }

                    }
                }
            });

        }

        /*-----将时间转换成时分秒*/
        function formatSeconds(value) {
            var theTime = parseInt(value);// 秒 
            var theTime1 = 0;// 分 
            var theTime2 = 0;// 小时          
            if (theTime > 60) {
                theTime1 = parseInt(theTime / 60);
                theTime = parseInt(theTime % 60);
                if (theTime1 > 60) {
                    theTime2 = parseInt(theTime1 / 60);
                    theTime1 = parseInt(theTime1 % 60);
                }
            }
            var result = "" + parseInt(theTime) + "秒";
            if (theTime1 > 0) {
                result = "" + parseInt(theTime1) + "分" + result;
            }
            if (theTime2 > 0) {
                result = "" + parseInt(theTime2) + "小时" + result;
            }
            return result;
        }


        /*-------------报告解析-----------*/
        function AnalysisResult(json) {

            var JsonArr = eval("[" + json + "]");
            if (JsonArr != null && JsonArr.length > 0) {
                //InitWDPages

            }
        }

        /*--------------维度解释解析-----------*/
        var OperationList;
        var Allscore = "";
        var strjson = "";
        var NewJson = "";
        var WdJsonName = "";

        var scorejson = "";
        function TSLB3(Acode, answer_id, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    answer_id: answer_id,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = item.Score.toFixed(2);

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            scorejson += item.Score + ",";

                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var num2 = 0;
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLength = eval(100 / MaxScore);
                           
                            if (item.Score == null || item.Score == "") {
                                item.Score = "--";
                            }
                            CMNumber += "<div class=\"progress-barB \"style=\"width: " + 0 + "%; float:\"left\"; width: \"0\"; height: \"100%\"; font-size: \"12px\";color: \"#121212\";text-align: \"center\">" + MinScore + "</div>";
                            CMNumber += "<div class=\"progress-barB \"style=\"width: " + 100 + "%;text-align:right\">" + MaxScore + "</div>";
                            CmHtmls += "<div class=\"progress-barA \"style=\"width: " + 100 + "%" + ";background-color:#FA8072\" aria-valuemax=\"100\"></div>";
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">总评</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";

                        

                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + item.Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + item.Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";                       
                            PageHtml += " </td> </tr>";


                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });

                        DrawChart(WdJsonName, scorejson, MinScore, 80);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录                          
                    }
                }
            });

        }
    
        function TSLB6(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                    sexval: sexval,
                    AgeVAl: AgeVal,
                },//要执行查询的数据参数
                success: function (msg) {
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(Math.floor(eval(item.ConversionFormula)));
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                                          

                            } else {
                                Score = Math.floor(item.Score);
                                scorejson += parseFloat(Math.floor(item.Score)) + ",";

                            }

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
              function (a, b) {
                  return (a.CMstartScore - b.CMstartScore);
              });
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CMNumber = "";
                            var CmHtmls = "";
                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                          
                            Allscore = item.Allscore;
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            var zt_Type = "";
                            var Yscores = Math.floor(item.Score);
                            var Cscores = Math.floor(eval(item.ConversionFormula));
                            zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName
                            Result = item.Result == "" || item.Result == null || item.Result.length == 0 ? "无" : item.Result;
                            Proposal = item.Proposal == "" || item.Proposal == null || item.Proposal.length == 0 ? "无" : item.Proposal;
                            if (item.Score == null || item.Score == "") {
                                Yscores = "--";
                            }
                            if (Cscores == null || Cscores == "") {
                                Cscores == "--";
                            }
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";


                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Cscores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            //  PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });

                        DrawChartA(WdJsonName, scorejson, MinScore, MaxScore);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        //tests(WdJsonName, msgs.rdeor, msgs.minmaxs);
                        //DrawChart(WdJsonName, WdJson);
                    }
                }
            });

        }
        //霍兰德代码--需要修改
        function TSLB8(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                    sexval: sexval,
                    AgeVAl: AgeVal,
                },//要执行查询的数据参数
                success: function (msg) {
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var MaxminScor = "";
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        MaxminScor = msgs.MaxminScore;
                     
                        var scores01 = 0;
                        var scores02 = 0;
                        var scores03 = 0;
                        var ZHCode = ""; //组合代码：比如4              
                        var NameZH = "";//组合名称
                        var ZHCodeA = "";//组合代码A
                        var ZHCodeB = "";
                        var ZHCodeC = "";
                        var ALlCodeA = "";//最终组合代码
                        var NameA = "";
                        var NameB = "";
                        var NameC = "";
                        
                        NameA = MaxminScor[0].NameA;
                        ALlCodeA = MaxminScor[0].ALlCodeA;
                        NameZH = MaxminScor[0].NameZH;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            Score = Math.floor(item.Score);
                            WdJsonName += item.WD_Name + ",";
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            scorejson += parseFloat(Math.floor(item.Score)) + ",";
                            if (cmmlists.length > 0) {

                                if (cmmlists[0].NormName.indexOf(NameA) > -1) {
                                    NormName = cmmlists[0].NormName;
                                    Result = cmmlists[0].Result;
                                    Proposal = cmmlists[0].Proposal;
                                    Startsorse = cmmlists[0].StartScore.replace("Scores", Math.floor(item.Score));

                                    OperationList = item.Tz_List;
                                    Allscore = item.Allscore;
                                    var SectioName = "";
                                    SectioName = "result" + SectionToChinese(index);
                                    SectionValue = item.Result;

                                    var zt_Type = "";
                                    zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                                    var PageHtml = "";
                                    PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                                    PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                    PageHtml += " <tr>";
                                    PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                    PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                    PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                    PageHtml += "</td> </tr>";

                                    PageHtml += " <tr>";
                                    PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                    PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                    PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                    PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                    PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                                    PageHtml += " </td> </tr>";
                                    PageHtml += " <tr>";
                                    PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                    PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                    PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                    PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";

                                    PageHtml += "</td>";
                                    PageHtml += "  </tr>";
                                    PageHtml += "  </table>";
                                    PageHtml += "</div>";
                                    PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                                    $("#GeneralMessage").append(PageHtml);
                                }


                            }//

                        });


                        if (ALlCodeA != null) {
                            ALlCodeA = ALlCodeA.split(',');
                            $.each(ALlCodeA, function (index, value) {
                                var HLDResult = TSLBHLD(value);
                                var HLDTitle = "如上图，您的霍兰德代码是" + value + "(" + NameZH + ")"


                                var PageHtml = "";
                                PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-top:10pt\"> ";
                                PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                PageHtml += " <tr>";
                                PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + HLDTitle + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";


                                PageHtml += " <tr>";
                                PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + HLDResult + "</p></span>";
                                PageHtml += " </td> </tr>";


                                PageHtml += "  </table>";
                                PageHtml += "</div>";

                                $("#GeneralMessage").append(PageHtml);
                            });


                        }
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录    
                        DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                    }
                }
            });

        }
        function TSLB9(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                    sexval: sexval,
                    AgeVAl:AgeVal,
                },//要执行查询的数据参数
                success: function (msg) {
                    var ScoreName = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;

                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = item.ConversionFormula;
                            if (item.ConversionFormula == null || item.ConversionFormula == "")
                            {
                                Score = "--";
                            }
                           
                             var NormName = "";//状态
                             var Result = item.Result;//结果
                             var Proposal = item.Proposal;
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            if (index == 4)
                            {
                                scorejson = item.scorejson;
                            } 
                            NormName = item.NormName;
                            if (item.Result == null || item.Result=="")
                            { Result = "--" }
                            if (item.Proposal == null || item.Proposal == "")
                            { Proposal = "--"}
                           
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            //Score = item.ConversionFormula;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "维度" + SectionToChinese(index) + ",";
                            var zt_Type = "";
                            var Yscore = item.Score;
                            if (item.Score == null || item.Score == "") {
                                Yscore = "--";
                            }
                            zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";

                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });
                        HightsTSLB9(scorejson);
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录  
                    }
                }
            });

        }
        function TSLB901(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;

                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = item.ConversionFormula;
                            if (index == 4) {
                                scorejson = item.scorejson;
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                         
                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "维度" + SectionToChinese(index) + ",";
                            var YScore = item.Score
                            if (item.Score == null || item.Score == "") {
                                YScore = "--";

                            }
                            if (Score == null || Score == "") {
                                Score = "--";
                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\"  style=\"margin-bottom:30pt\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";




                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                         
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });
                        HightsTSLB9(scorejson);
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录  
                    }
                }
            });

        }//之前的--
        //防御方式问卷
        function TSLB801(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            var IndexA = "";
            var IndexB = "";
            var IndexC = "";
            var IndexMax = "";
            var WDName = "";
            var TSResult="";
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 801,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";
                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;                      
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            if (item.WDName !="") {
                                var Score = "";
                                if (item.ScoreType == 1) {
                                    Score = item.ConversionFormula;
                                } else {
                                    Score = item.Score;
                                }
                                var A = 0;
                                var NormName = "";//状态
                                var Result = "";//结果
                                var Proposal = "";
                                var ConverScoreA = item.ConverScoreA;


                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var CmHtmls = "";//颜色div拼接
                                var CMNumber = "";//数字div拼接
                                var CMLengthNew = "";
                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;

                                var zt_Type = "";
                                if (index == 4) {
                                    scorejson = item.scorejson
                                    WdJsonName = item.WdJsonName; alert(WdJsonName);
                                }
                                WDName = item.WDName;

                                WDName = item.WDName;
                                IndexA = item.IndexA;
                                IndexB = item.IndexB;
                                IndexC = item.IndexC;
                                Score = item.Score; 
                               
                                zt_Type = item.NormName == "" || item.NormName == null || item.NormName.length == 0 ? "无" : item.NormName
                                Result = item.Result == "" || item.Result == null || item.Result.length == 0 ? "无" : item.Result
                                Proposal = item.Proposal == "" || item.Proposal == null || item.Proposal.length == 0 ? "无" : item.Proposal
                                Score = item.Score == "" || item.Score.length == 0 ? "无" : item.Score
                                var YScoreA = item.Score
                                var CScoreA = item.ConversionFormula
                                if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                    YScoreA = "--";
                                    CScoreA = "--";
                                }

                                if ((IndexA == IndexB) && (IndexA == IndexC)) {
                                    if (index == 1 || index == 2 || index == 3 || index == 4) {

                                        TSLB801Html(WDName, Score, IndexA, zt_Type, Result, Proposal)
                                    }
                                }
                                else if (IndexA == IndexB && (IndexA > IndexC)) {
                                    if (index == 1 || index == 2 || index == 4) {
                                        TSLB801Html(WDName, Score, IndexA, zt_Type, Result, Proposal)
                                    }
                                } else if (IndexA == IndexC && IndexA > IndexB) {
                                    if (index == 1 || index == 3 || index == 4) {
                                        TSLB801Html(WDName, Score, IndexC, zt_Type, Result, Proposal)
                                    }
                                } else if (IndexB == IndexC && IndexB > IndexA) {
                                    if (index == 2 || index == 3 || index == 4) {
                                        TSLB801Html(WDName, Score, IndexB, zt_Type, Result, Proposal)
                                    }
                                } else {
                                    if (index == 3 || index == 4) {
                                        TSLB801Html(WDName, Score, ConverScoreA, zt_Type, Result, Proposal)
                                    }
                                }
                                //最大值和最小值
                            }
                        });
                       
                        DrawChartA(WdJsonName, scorejson, 0,10);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        function TSLB802(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var DataArry = [];

            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 802,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                                var Forms = item.Formulas;

                            } else {
                                Score = item.Score.toFixed(2);

                            }
                            WdJsonName = item.WdJsonName + ",";
                            scorejson = item.scorejson + ",";
                            if (item.WD_Name.indexOf('合理化') > -1) {
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var CmHtmls = "";//颜色div拼接
                                var CMNumber = "";//数字div拼接
                                var CMLengthNew = "";
                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                              
                                var WDName = "";
                                if (WDlength == 1) {
                                    WDName = item.WD_Name;
                                }
                                else {
                                    WDName = "维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;

                                }
                                var zt_Type = "";
                                zt_Type = item.NormName == "" || item.NormName == null || item.NormName.length == 0 ? "无" : item.NormName
                                Result = item.Result == "" || item.Result == null || item.Result.length == 0 ? "无" : item.Result
                                Proposal = item.Proposal == "" || item.Proposal == null || item.Proposal.length == 0 ? "无" : item.Proposal
                                Score = item.Result == "" || item.Score.length == 0 ? "无" : item.Score
                                var YScoreA = item.Score.toFixed(2);
                                var CScoreA = eval(item.ConversionFormula).toFixed(2);
                                if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                    YScoreA = "--";
                                    CScoreA = "--";
                                }
                                var PageHtml = "";
                                PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                                PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                PageHtml += " <tr>";
                                PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";
                                PageHtml += " <tr>";
                                PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                                // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td> </tr>";

                                PageHtml += " <tr>";
                                PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                                // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                                PageHtml += "</td>";
                                PageHtml += "  </tr>";
                                PageHtml += "  </table>";
                                PageHtml += "</div>";
                                PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                                $("#GeneralMessage").append(PageHtml);
                            }
                        });
                        
             
                        DrawChartA(WdJsonName, scorejson, 0, 1.1);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        function TSLB14(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 14,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {
                    var WDScoreA = "";
                    var WDScoreB = "";
                    var AllscoreA = 0;
                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                               

                            } else {
                                Score = item.Score.toFixed(2);
                                
                            }
                            var IndexA = "";
                            var IndexB = "";
                            var IndexC = "";
                            var IndexMax = "";
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var DataArry = "";

                            if (index == 3) {
                              
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var CmHtmls = "";//颜色div拼接
                                var CMNumber = "";//数字div拼接
                                var CMLengthNew = "";

                                Result = item.Result;
                                Proposal = item.Proposal;
                                NormName = item.NormName;
                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                AllscoreA = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                                scorejson += item.scorejson + ",";
                                var WDName = "";
                                WDName = "总评";
                                var zt_Type = "";
                                zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                                var YScoreA = item.Score;
                                var CScoreA = item.ConversionFormula
                                if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                    YScoreA = "--";
                                    CScoreA = "--";
                                }
                                var PageHtml = "";
                                PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                                PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                PageHtml += " <tr>";
                                PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";

                                PageHtml += "  <tr style=\"height:27.2500pt;\">";
                                PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td>";
                                PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td>";
                                PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                                PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td></tr>";

                                PageHtml += " <tr>";
                                PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                                // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td> </tr>";

                                PageHtml += " <tr>";
                                PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                                // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                                PageHtml += "</td>";
                                PageHtml += "  </tr>";
                                PageHtml += "  </table>";
                                PageHtml += "</div>";
                                PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                                $("#GeneralMessage").append(PageHtml);

                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }

                            }
                        });

                        DrawChartA(WdJsonName, scorejson, 0, 52);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        function TSLB10(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AllscoreA = "";
            var NormName = "";//状态
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 10,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {
                    var WDScoreA = "";
                    var WDScoreB = "";
                    $("#GeneralMessage").html("");
                    var WdJsonName = "";
                    WdJsonName += "总评" + ",";
                    var scorejson = "";

                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        AllscoreA = msgs.datas[0].Score;
                        scorejson += AllscoreA + ",";
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        var Result = "";//结果
                        var Proposal = "";
                        var TZNumber = 0;
                        Result = msgs.datas[0].Result;
                        Proposal = msgs.datas[0].Proposal;
                        NormName = msgs.datas[0].NormName;
                       
                        var PageHtml = "";
                        PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                        PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                        PageHtml += " <tr>";
                        PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                        PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                        PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">总评</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td> </tr>";



                        PageHtml += "  <tr style=\"height:27.2500pt;\">";
                        PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td>";
                        PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                        PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td>";
                        PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                        PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + NormName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td></tr>";

                        PageHtml += " <tr>";
                        PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                        PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                        // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td> </tr>";

                        PageHtml += " <tr>";
                        PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                        // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                        PageHtml += "</td>";
                        PageHtml += "  </tr>";
                        PageHtml += "  </table>";
                        PageHtml += "</div>";
                        //PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                        $("#GeneralMessage").append(PageHtml);


                        DrawChartA(WdJsonName, scorejson, 10, 65);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        /*-------------------阿拉伯转汉字-----------------*/

        var chnNumChar = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        var chnUnitSection = ["", "万", "亿", "万亿", "亿亿"];
        var chnUnitChar = ["", "十", "百", "千"];

        function SectionToChinese(section) {
            var strIns = '', chnStr = '';
            var unitPos = 0;
            var zero = true;
            while (section > 0) {
                var v = section % 10;
                if (v === 0) {
                    if (!zero) {
                        zero = true;
                        chnStr = chnNumChar[v] + chnStr;
                    }
                } else {
                    zero = false;
                    strIns = chnNumChar[v];
                    strIns += chnUnitChar[unitPos];
                    chnStr = strIns + chnStr;
                }

                unitPos++;
                section = Math.floor(section / 10);

            }
            if (chnStr.indexOf("一十") >= 0 && chnStr.length <= 3) {
                chnStr = chnStr.replace("一十", "十");
            }
            return chnStr;
        }


        function InitAnswerRecord(AR) {

            if (AR != null && AR != "") {
                //创建表格
                ARLength=AR.length;
                //ARLength = ARLength - 1;
                var rowCount = Math.ceil(ARLength / 10);

                var windowHeight = window.innerWidth;
                var columnCount = 10;
                if (windowHeight < 768)
                    columnCount = 6;
                else if (windowHeight)
                    columnCount = 10;

                var table = $("#tableid");
                var trm = -1;
                for (var i = 0; i < rowCount; i++) {
                    var tr = $("<tr></tr>");
                    tr.appendTo(table);

                    for (var j = 1; j < columnCount+1; j++) {
                        var td = "";
                        trm++;
                        if (ARLength > trm) {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\" id=" + parseInt(trm + 1) + "  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
                        } else {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\"><span></span></td>");
                        }

                        td.appendTo(tr);
                    }
                }
            }
            var Indexs = 0;
            //循环遍历数据
            $.each(AR, function (index, value) {
                Indexs++;
                var Inputtd = $("#tableid").find("#" + Indexs + "");
                Inputtd.find("span").text(value);
            });


        }
        function getJsonObjLength(jsonObj) {
            var Length = 0;
            for (var item in jsonObj) {
                Length++;
            }
            return Length;
        }
        function InitAnswerRecordA(AR) {

            if (AR != null && AR != "") {
                //创建表格
                ARLength = AR.length;
                ARLength = getJsonObjLength(AR);
                var rowCount = Math.ceil(ARLength / 10);

                var windowHeight = window.innerWidth;
                var columnCount = 10;
                if (windowHeight < 768)
                    columnCount = 6;
                else if (windowHeight)
                    columnCount = 10;

                var table = $("#tableid");
                var trm = -1;
                for (var i = 0; i < rowCount; i++) {
                    var tr = $("<tr></tr>");
                    tr.appendTo(table);

                    for (var j = 1; j < columnCount+1; j++) {
                        var td = "";
                        trm++;
                        if (ARLength > trm) {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\" id=" + parseInt(trm + 1) + "  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
                        } else {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\"><span></span></td>");
                        }

                        td.appendTo(tr);
                    }
                }
            }
            var Indexs = 0;
            //循环遍历数据
            $.each(AR, function (index, value) {
                Indexs++;
                var Inputtd = $("#tableid").find("#" + Indexs + "");
                Inputtd.find("span").text(value);
            });


        }

      
        //退出
        function Exits() {
            var param = fnGetUrlParam("type");
            var usr = "";
            // 设置地址连接
            switch (param) {
            case "1":
                //usr = "http:/" + tiaoarr[1] + "/" + tiaoarr[2] + "/" + tiaoarr[3] + "/heartevaluation/ViewResult.aspx";
                usr = "/FunctionModular/HeartEvaluation/ViewResult.aspx";
                break;
            case "3":
                usr = "/FunctionModular/Warning/CrisisWarning.aspx";
                break;
            default:
                usr = "/FunctionModular/PersonalReport/PersonalReport.aspx";
                break;
            }
            // 设置返回页码参数
            param = fnGetUrlParam("p");
            if (param != "" && param != "1") {
                usr = usr + "?p=" + param;
            }

            window.location.href = usr;
        }

        // 获取地址栏参数
        function fnGetUrlParam(paramName) {
            var result = "";

            var usr = window.location.href;
            var ul = usr.toString().split('?');
            if (ul.length == 2) {
                var params = ul[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var param = params[i].split('=');
                    if (param.length == 2) {
                        if (param[0] + "" == paramName) {
                            result = param[1];
                            break;
                        }
                    }
                }
            }

            return result;
        }



        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }




        function valueReplace(v) {
            v = v.toString().replace(new RegExp('(["\"])', 'g'), "\\\"");
            return v;
        }
        //打印
        function printHtml(html) {
            document.body.innerHTML = html;
            window.print();
        }
        function onprint() {
            var html = $("#Print").html();
            printHtml(html);
        }
        //随机获取颜色
        function randomColor() {

            var colorStr = Math.floor(Math.random() * 0xFFFFFF).toString(16).toUpperCase();

            return "#" + "000000".substring(0, 6 - colorStr) + colorStr;

        }
     
        function DrawChartA(Names, jsons, minsjon, maxsjoin) {
            var min = minsjon;
            var max = maxsjoin;
            //var Interval = (max - min) / 10;
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")")
            /*---------------普通类型的----------------*/
            var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
            var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
            var serieslist = [{
                name: "分数",
                data: jsons
            }];
            $('#container').highcharts({
                chart: {
                    polar: false,
                    type: "bar"
                },
                title: {
                    text: AmountName,
                    x: -20 //center
                },
                xAxis: {
                    categories: Names,
                    tickmarkPlacement: 'on',
                    lineWidth: 1,
                    //tickInterval: Interval,
                    labels: {
                        style: {
                            'fontSize': '14px'
                        }
                    },
                },
                yAxis: {
                    min: minsjon,
                    max: maxsjoin,
                    gridLineInterpolation: 'polygon',
                    lineWidth: 1,
                  
                    title: {
                        text: '分数 (分)'
                    },
                    labels: {
                        style: {
                            'fontSize': '14px'
                        }
                    },
                },
                tooltip: {
                    valueSuffix: '分'
                },
                plotOptions: {
                    series: {
                        pointWidth: 10 //柱子的宽度值 单位为px
                    }
                },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0,
                    enabled: false,
                },
                series: serieslist,
            });

        }
        //图表
        function DrawChart(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")")
            /*---------------普通类型的----------------*/
            var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
            var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
            var serieslist = [{
                name: "分数",
                data: jsons
            }];
            $('#container').highcharts({
                chart: {
                    polar: true,
                    type: "area"
                },
                title: {
                    text: AmountName,
                    x: -20 //center
                },
                xAxis: {
                    categories: Names,
                    tickmarkPlacement: 'on',
                    lineWidth: 1,
                    labels: {
                        style: {
                            'fontSize': '14px'
                        }
                    },
                },
                yAxis: {

                    min: minsjon,
                    max: maxsjoin,
                    gridLineInterpolation: 'polygon',
                    lineWidth: 1,

                    title: {
                        text: '分数 (分)'
                    },
                    labels: {
                        style: {
                            'fontSize': '14px'
                        }
                    },
                }, exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                tooltip: {
                    valueSuffix: '分'
                },
                plotOptions: {
                    series: {
                        pointWidth: 5 //柱子的宽度值 单位为px
                    }
                },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0,
                    enabled: false,
                },
                series: serieslist,
            });

        }
        var containerWith = 0;
        var containerHeight = -200;
        function HightsTSLB9(jsons) {

            $(window).resize(function () {
                containerWith = ($('#container').width() - 100) / 2 * -1;
                containerHeight = ($('#container').height() - 100) / 2 * -1;
            })
            containerWith = ($('#container').width() - 100) / 2 * -1;
            containerHeight = ($('#container').height() - 100) / 2 * -1;
            containerHeight = -150;
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")")
            jsons = '[[' + jsons[0] + ',' + jsons[1] + ']]';
            jsons = eval("(" + jsons + ")")
            $('#container').highcharts({
                title: {
                    text: AmountName,
                    x: -20 //center
                },
                chart: {
                    type: 'scatter',
                    zoomType: 'xy',
                    marginTop: 50,
                    marginBottom: 50,
                    marginLeft: 50,
                    marginRight: 50
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br>',
                    pointFormat: '{point.x}, {point.y}'
                },
                xAxis: {
                    offset: containerHeight,
                    opposite: false,
                    showEmpty: false,
                    lineWidth: 1,
                    tickWidth: 1,
                    tickPositions: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100],
                    min: 0,
                    max: 100,
                    minTickInterval: 2,
                    title: {//纵轴标题  
                        text: 'E维度（内外倾向性）',
                        x: containerWith * -1,
                        floating: true
                    },
                    plotLines: [{
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 38.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2              //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 43.3,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2            //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2             //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 61.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2             //标示线的宽度，2px
                    }]
                },
                labels: {//在报表上显示的一些文本  
                    items: [{
                        html: '内向、不稳定抑郁质',
                        style: { left: '30px', top: '30px' }
                    }, {
                        html: '外向、不稳定胆汁质',
                        style: { left: '500px', top: '30px' }
                    }, {
                        html: '内向、稳定粘液质',
                        style: { left: '30px', top: '280px' }
                    }, {
                        html: '外向、稳定多血质',
                        style: { left: '500px', top: '280px' }
                    }]
                },
                yAxis: {
                    offset: containerWith,
                    gridLineWidth: 0,
                    title: null,
                    tickWidth: 1,
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }],
                    lineWidth: 1,
                    tickWidth: 1,
                    tickPositions: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95],
                    title: {//纵轴标题  
                        text: 'N维度（情绪稳定性）',
                        x: 30,
                        y: -160,
                        rotation: -360
                    },
                    plotLines: [{
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 38.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2                //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 43.3,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2             //标示线的宽度，2px
                    },
                    {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2            //标示线的宽度，2px
                    },
                {
                    color: '#e6e6e6',            //线的颜色，定义为红色
                    dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                    value: 61.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                    width: 2            //标示线的宽度，2px
                }]
                },
                plotOptions: {
                    series: {
                        marker: {
                            fillColor: '#FF0000',
                            lineWidth: 1,
                            lineColor: '#FF0000' // inherit from series
                        }
                    }
                },
                series: [{
                    name: '分数',
                    data: jsons
                }]
              , legend: {
                  layout: 'vertical',
                  align: 'right',
                  verticalAlign: 'middle',
                  borderWidth: 0,
                  enabled: false
              },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
            });
        }
        //导出
        function Export() {
            var svgFirst;

            chartFirst = $('#container').highcharts();
            svgFirst = chartFirst.getSVG();
            $.ajax({
                url: "Ajax/PersonalReportInfo.ashx?Remark=SaveImage",
                type: "post",
                async: false,
                data: { svg: svgFirst },
                success: function (result) {
                    var ImageSrc = "Ajax/image/" + result;

                    var image = new Image();
                    image.src = ImageSrc;
                    image.onload = function () {
                        var base64 = getBase64Image(image);
                        //$("#sss").attr("src", base64);
                        $("#imagescr").attr("src", base64);
                        $("#ContainerImage").show();
                        $("#container").hide();
                        $("#Print").wordExport(filename);
                        $("#ContainerImage").hide();
                        $("#container").show()
                    };
                    //$("#imagescr").attr("src", ImageSrc);
                }
            })
        }
        //导出

        $("#export").click(function (event) {
        
            var svgXml = $(".highcharts-container").html()
            var Allcount = ""; var Numbers = ""; var z = "";
            var Allcount = fnGetUrlParam("Allcount");
            var Numbers = fnGetUrlParam("Numbers");
            if (Allcount != null && Allcount != "") {
                var z = parent.getZip();
            }
            var image = new Image();
            image.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgXml))); //给图片对象写入base64编码的svg流
            var base64 = image.src;
            $("#imagescr").attr("src", base64);
            $("#ContainerImage").show();
            $("#container").hide();
            var timeout = window.setTimeout(function () {
                $("#ContainerImage").show();
                $("#container").hide();
                $("#Print").wordExport(filename + "_" + Numbers, Allcount, Numbers, z, "个体报告批量导出");
                $("#ContainerImage").hide();
                $("#container").show();
                window.clearTimeout(timeout);
            }, 500)


        });
        //计算年月日天数
        function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式

            var aDate, oDate1, oDate2, iDays;
            aDate = sDate1.split("-");
            oDate1 = new Date(sDate1.replace("-", "/").replace("-", "/"));  //转换为yyyy-MM-dd格式
            aDate = sDate2.split("-");
            oDate2 = new Date(sDate2.replace("-", "/").replace("-", "/"));
            var IDays = parseInt(Math.abs(oDate1 - oDate2));
            var results = getDifference(IDays);



            return results;

        }

        function getDifference(period) {
            var yearLevelValue = 365 * 24 * 60 * 60 * 1000;
            var monthLevelValue = 30 * 24 * 60 * 60 * 1000;
            var dayLevelValue = 24 * 60 * 60 * 1000;
            var hourLevelValue = 60 * 60 * 1000;
            var minuteLevelValue = 60 * 1000;
            var secondLevelValue = 1000;
            /*******计算出时间差中的年、月、日、天、时、分、秒*******/
            var year = parseInt(getYear(period));
            var month = parseInt(getMonth(period - year * yearLevelValue));
            var result = 0;
            if (year != 0) {
                result = year;
            }

            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
        }
        function getBase64Image(img) {
            var canvas = document.createElement("canvas");
            canvas.width = img.width;
            canvas.height = img.height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0, img.width, img.height);
            var ext = img.src.substring(img.src.lastIndexOf(".") + 1).toLowerCase();
            var dataURL = canvas.toDataURL("image/" + ext);
            return dataURL;
        }
        function TSLB801Html(WDName, Score, ConverScoreA, zt_Type, Result, Proposal)
        {
            var PageHtml = "";
            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
            PageHtml += " <tr>";
            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td> </tr>";



            PageHtml += "  <tr style=\"height:27.2500pt;\">";
            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td>";
            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + ConverScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td>";
            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td></tr>";

            PageHtml += " <tr>";
            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
            PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td> </tr>";

            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' >" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";
            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" />";
            $("#GeneralMessage").append(PageHtml);
        }
    </script>
</asp:Content>
