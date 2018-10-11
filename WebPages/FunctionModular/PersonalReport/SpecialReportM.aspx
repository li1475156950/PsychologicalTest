
<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialReportM.aspx.cs" Inherits="WebPages.FunctionModular.PersonalReport.SpecialReportM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <%--<link href="Css/Presentation.css" rel="stylesheet" />--%>

    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />

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

        .progressA {
            height: 20px;
            overflow: hidden;
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
    </style>
    <div style="text-align: right; margin-top: 10px; margin-right: 0px; margin-bottom: 5px;">
        <%-- <button type="button" class="btn btn-danger" onclick="Exits()">退出</button>--%>
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

                    <%-- <div id="AnalysisChart" style="margin-top: 15px;">图表先放一放，找出合适的在生成</div>--%>
                    <div id="container" class="col-md-12 col-sm-12 col-xs-12" style="height: 400px;">
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <image id="imagescr" width="600px" height="400px"></image>
                    </div>
                </div>

            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12" style="margin-top: 25px;">
                </div>
                <div id="GeneralMessage" style="margin-top: 15px; width: 100%">
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;" id="Answersheet">
                        三、原始答卷
                    </div>
                    <div id="AnswerRecord" style="margin-top: 15px; min-width: 310px;">
                        <table class="MsoTableGrid" style="border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%" id="tableid">
                          
                        </table>
                    </div>

                </div>
                <div id="dictionary">
                </div>
                <div class="row" style="margin-top: 15px; margin-bottom: 10px; text-align: center;" id="My">
                    <%-- <div class="col-md-12">
                  <button class="btn btn-warning btn-sm" onclick="addRow()" id="NewInfo" style="display:none"><i></i>新增内容</button>
                            <button class="btn btn-warning btn-sm" id="Newdelete" onclick="remove(this)" style="display:none"><i></i>删除</button>
			               </div>--%>
                </div>
                 
            </div>
        </div>
        <div class="row" style="text-align: center; margin-bottom: 10px;">
            <%--  <button type="button" id="SaveID" class="btn btn-info" onclick="Add()"  style="display:none">保存</button>  --%>
            <button type="button" class="btn btn-sm" style="background-color: orange; color: white" id="export">
                导出
            </button>
            <button type="button" class="btn btn-sm" style="color: white" onclick="Exits()">返回</button>
        </div>

    </div>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
       <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
  <%--  <script src="../../JS/word/jquery.wordexport.js"></script>--%>

    <script>
        // var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        /*------------根据量表ID查询量表基本信息--------------*/
        var navName = "";
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
        var AmountName = "";
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
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitPages",
                    A_ID: answer_id
                },//要执行查询的数据参数
                success: function (msg) {
                    var sexval = 0;
                    var AgeVal = 0;
                    var HZBScore = 0;
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
                            ////$("#Codenumber").html("编号:" + (obj[2]) + "</br>");
                            $("#birdth").html("出生日期：" + obj[13] + "</br>");
                            $("#Createtime").html("完成时间：" + obj[4] + "</br>");
                            if (obj[12] == "男") {
                                sexval = 1;
                            } else if (obj[12] == "女") {
                                sexval = 2;
                            }
                            var StartTimeA = obj[16];//作答完的时间
                            var EndtimeA = obj[13];//出生日期
                            AgeVal = DateDiff(StartTimeA, EndtimeA);
                            var AllscoreA = obj[15];;
                            if (AgeVal)
                                HZBScore = obj[15];
                            Acodes = AmountCode;
                            var GetType = getUrlParam("types");
                            Acodes = AmountCode;
                            if (GetType == 18)
                            {
                                $("#Answersheet").hide();
                            }
                            else
                            {
                                $("#Answersheet").show();
                            }
                            if (GetType == 11) {
                                $("#container").css("height", "700px");
                                TSLB11(AmountCode, AnswerJson, sexval, AgeVal, GetType);//加载维度总评
                            } else if (GetType == 1) {

                                TSLB1(AmountCode, HZBScore, sexval, AgeVal, GetType);
                            } else if (GetType == 13) {
                                TSLB13(AmountCode, AnswerJson, sexval, AgeVal, GetType);//加载维度总评
                            } else if (GetType == 4) {
                                TSLB4(AmountCode, AnswerJson, sexval, AgeVal, GetType)
                            } else if (GetType == 7) {
                                TSLB7(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 16) {
                                TSLB16(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 15) {
                                TSLB15(AmountCode, AnswerJson, sexval, AgeVal, GetType, AllscoreA);
                            } else if (GetType == 17) {
                                TSLB17(AmountCode, AnswerJson, sexval, AgeVal, GetType, AllscoreA);
                            } else if (GetType == 18)
                            {
                                TSLB18(AmountCode, AnswerJson, sexval, AgeVal, GetType, AllscoreA);
                            } else if (GetType == 19)
                            {
                                TSLB19(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 20)
                            {
                                TSLB20(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 21)
                            {
                                TSLB21(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            }
                        }

                    }
                }
            });

        }
        function GetDate(date) {
            var datetime = date.getFullYear()
                    + "-"// "年"
                    + ((date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : "0"
                            + (date.getMonth() + 1))
                    + "-"// "月"
                    + (date.getDate() < 10 ? "0" + date.getDate() : date
                            .getDate());
            return datetime;
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
        function TSLB11(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 11,
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
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                           
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            NormName = item.NormName;
                           
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            if (index <= 16) {
                                WdJsonName += item.WD_Name + ",";
                                
                                scorejson += item.ConversionFormula + ","
                            }
                            var Yscore = item.Score;
                            var CScores = item.ConversionFormula;
                            if (item.Score == null || item.Score == "") {
                                Yscore = "--";

                            }
                            if (CScores == null || CScores == "") {
                                CScores = "--";
                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName;
                            Result = item.Result == "" || item.Result == null || item.Result.length == 0 ? "无" : item.Result;
                            Proposal = item.Proposal == "" || item.Proposal == null || item.Proposal.length == 0 ? "无" : item.Proposal;
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\"  style=\"margin-bottom:15pt;\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";

                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                        DrawChartKTR(WdJsonName, scorejson, 0.72, 11.57);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    }
                }
            });

        }


        //瑞文
        var TJFZ_Json = "";//统计分析F对比值
        var ConverScore = "";
        var ConverScores = 0;
        function TSLB1(Acode, HZBScore, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "TSLBJson",
                    TSLBType: "TSLBRW"
                },
                success: function (msg) {
                    TJFZ_Json = msg;
                    var Numbers=0;
                    var Types = 0;
                    if (TJFZ_Json != "") {
                        HZBScore = eval(HZBScore);
                        var TJFZ_List = eval(TJFZ_Json);
                        for (var t = 0; t < TJFZ_List.length; t++) {

                            var HZBShScore = eval(TJFZ_List[t].Valie);
                            if (AgeVal < 17) {
                                if (TJFZ_List[t].ZZB == AgeVal) {
                                    Numbers++;
                                }
                                if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == AgeVal) {
                                    ConverScore = TJFZ_List[t].HZB;//从数据库取的相应年龄段的分数
                                    ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                    Types = 2;
                                    break;
                                } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                    ConverScores = TJFZ_List[t].HZB;
                                    Types = 1;
                                    break;
                                }
                                if (Numbers == 7) {
                                    if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    }
                                }
                            }else {
                                if (17 <= AgeVal && AgeVal < 20) {
                                    if (TJFZ_List[t].ZZB == 17) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 17) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        Types = 2;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                        if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == 17) {
                                            ConverScore = eval(TJFZ_List[t].HZB);
                                            ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                            Types = 2;
                                            break;
                                        }
                                   }
                                } else if (20 <= AgeVal && AgeVal < 30) {
                                    if (TJFZ_List[t].ZZB == 20) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 20) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                       if (HZBScore> HZBShScore &&  TJFZ_List[t].ZZB == 20) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore+ 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                        }
                                   }
                                } else if (30 <= AgeVal && AgeVal < 40) {
                                    if (TJFZ_List[t].ZZB == 30) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 30) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                       if (HZBScore> HZBShScore &&  TJFZ_List[t].ZZB == 30) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore+ 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                        }
                                   }
                                } else if (40 <= AgeVal && AgeVal < 50) {
                                    if (TJFZ_List[t].ZZB == 40) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 40) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                       if (HZBScore> HZBShScore &&  TJFZ_List[t].ZZB == 40) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore+ 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                        }
                                   }
                                } else if (50 <= AgeVal && AgeVal < 60) {
                                    if (TJFZ_List[t].ZZB == 50) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore &&  TJFZ_List[t].ZZB==50) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if (Numbers == 7) {
                                        if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == 50) {
                                            ConverScore = eval(TJFZ_List[t].HZB);
                                            ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                            Types = 2;
                                            break;
                                        }
                                    }

                                } else if (60 <= AgeVal && AgeVal < 70) {
                                    if (TJFZ_List[t].ZZB == 60) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 60) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if (Numbers == 7) {
                                        if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == 60) {
                                            ConverScore = eval(TJFZ_List[t].HZB);
                                            ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                            Types = 2;
                                            break;
                                        }
                                    }
                                }
                            }

                        }
                        TSLB1_RW(Acode, ConverScores, HZBScore, Types)

                    }
                }
            });
        }
        var WdJsonNames = "";
        var scorejsons = "";
        function TSLB1_RW(Acode, ConverScores, HZBScore, TypeA) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    AnswerId: getUrlParam("A_ID"),
                    types: 1,
                  
                },//要执行查询的数据参数
                success: function (msg) {
                    var msgs = eval("(" + msg + ")");
                    var CMNumber = "";
                    var CmHtmls = "";
                    var NormName = "";//状态
                    var Result = "";//结果
                    var Proposal = "";
                    var cmmlists = msgs.datas;
                    WdJsonNames = "总评" + ",";
                    //scorejsons += ConverScores + ",";
                    var CMLength = 100 / cmmlists.length
                    var sageOrder = cmmlists.sort(
            function (a, b) {
                return (a.CMstartScore - b.CMstartScore);
            });
                    if (cmmlists.length > 0) {
                        CMNumber += "<div class=\"progress-barB \"style=\"width: " + 0 + "%; float:\"left\"; width: \"0\"; height: \"100%\"; font-size: \"12px\";color: \"#121212\";text-align: \"center\">" + 0 + "</div>";
                        for (var i = 0; i < cmmlists.length; i++) {                     
                            Startsorse = cmmlists[i].StartScore.replace("Scores", ConverScores);
                            Endsorse = cmmlists[i].EndScore.replace("Scores", ConverScores);
                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                            var TsStart = eval(Startstr);
                            var Tsend = eval(Endstr);
                            if (TsStart && Tsend) {
                                NormName = cmmlists[i].NormName;
                                Result = cmmlists[i].Result;
                                Proposal = cmmlists[i].Proposal;
                            }
                        }

                        var ConverscorsA = "";
                        if (TypeA == 1) {
                            ConverscorsA = ConverScores;
                        } else if (TypeA == 2) {
                            ConverscorsA = "--";
                        }
                        if (HZBScore == "" && HZBScore == null) {
                            HZBScore = "--";
                        }
                        CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength + "%;text-align:right\">" + 100 + "</div>";
                        var zt_Type = "";
                        zt_Type = NormName == "" || NormName==null|| NormName.length == 0 ? "无" : NormName
                        if (zt_Type.indexOf('智力缺陷') > -1) {
                            scorejsons += 5 + ",";
                        } else if (zt_Type.indexOf('智力中下') > -1) {
                            scorejsons += 25 + ",";
                        } else if (zt_Type.indexOf('智力中等') > -1) {
                            scorejsons += 75 + ",";
                        } else if (zt_Type.indexOf('智力良好') > -1) {
                            scorejsons += 95 + ",";
                        } else if (zt_Type.indexOf('智力优秀') > -1) {
                            scorejsons += 100 + ",";
                        }
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
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + HZBScore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td>";
                        PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                        PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + ConverscorsA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                        PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                        // PageHtml += "   <span class='results'style='display:none'><textarea type='text'  value='" + Result + "' style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td> </tr>";


                        PageHtml += "  </table>";
                        PageHtml += "</div>";
                        //PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                        $("#GeneralMessage").append(PageHtml);
                    }
                    DrawChartRW(WdJsonNames, scorejsons, 0, 95);
                    InitAnswerRecordA(msgs.AnswerR);//加载答题记录  
                }
            })

        }
        function TSLB4(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    sexval: sexval,
                    AgeVAl: AgeVal,
                    types:4
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";
                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    var Conversage = "";
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
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }

                            } else {
                                Score = item.Score.toFixed(2);
                                scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                            }

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                        


                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";                         
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            var zt_Type = "";
                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            zt_Type = NormName == "" || NormName == null|| NormName.length == 0 ? "无" : NormName
                            Result = item.Result == ""||item.Result ==null  || item.Result.length == 0 ? "无" : item.Result;
                            Proposal = item.Proposal == "" || item.Proposal==null || item.Proposal.length == 0 ? "无" : item.Proposal;
                            var Yscores = item.Score.toFixed(2);
                            if (item.Score == null || item.Score == "" || Score == null || Score == "") {
                                Yscores = "--";
                                Score = "--";
                            }                          
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
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        DrawChart(WdJsonName, scorejson, MinScore, 76);//图表显示有误是最大值和最小值为小
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    }
                }
            });

        }
        //Achenbach儿童行为量表
        function TSLB13(Acode, _AnswerJson, sexval, AgeVal, GetType) {
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
                            if (item.ConversionFormula != null) {
                                var Agealtype = "";
                                index++;
                                var Score = item.Score;
                                var Yscore = Score.toFixed(2);
                                if (Yscore == null || Yscore == "") {
                                    Yscore = "--";
                                    Score = "--";
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
                               
                                WdJsonName += item.WD_Name + ",";
                                scorejson += item.ConversionFormula + ",";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                //WdJsonName += "维度" + SectionToChinese(index) + ",";
                                var zt_Type = "";

                                zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName
                                TSLB13Html(item.WD_Name, item.Score, item.ConversionFormula, item.NormName, item.Result, item.Proposal);
                            }
                        });
                        DrawChart(WdJsonName, scorejson, 0, 100);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录  





                    }
                }
            });

        }
       
        function TSLB7(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var A = "";
            var B = "";
            var C = "";
            var D = "";
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 7,
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

                       
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
                function (a, b) {
                    return (a.CMstartScore - b.CMstartScore);
                });

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
                            WdJsonName += item.WD_Name + ",";
                            scorejson += item.ConversionFormula + ",";
                            var WDName = "";
                            if (WDlength == 1) {
                                WDName = item.WD_Name;
                            }
                            else {
                                WDName = "维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;

                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var YScoreA = "";
                            if (item.WD_Name.indexOf('总评') > -1) {
                                YScoreA = "--";
                            }
                            else {
                                YScoreA = item.Score.toFixed(2);
                            }

                            var CScoreA = item.ConversionFormula;
                            if (YScoreA == null || YScoreA == "" || CScoreA == null || CScoreA == "") {
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
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                        DrawChart(WdJsonName, scorejson, 0, 48);
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录                           
                    }
                }
            });

        }
        function TSLB16(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 16,
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
                        msgs.datas
                        var temp = msgs.datas[0];
                        msgs.datas[0] = msgs.datas[msgs.datas.length - 1];
                        msgs.datas[msgs.datas.length - 1] = temp;
                      
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                       
                        var L = "";
                        var NE = "";
                        var PE = "";
                        var NC = "";
                        var PC = "";
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";

             
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
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";

                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                         
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            scorejson += item.Score+",";
                            var WDName = "";
                            if (WDlength == 1) {
                                WDName = item.WD_Name;
                            }
                            else {
                                WDName = "维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;

                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var YScoreA = "";
                            var CScoreA = item.ConversionFormula;
                            if (item.WD_Name.indexOf('总评') > -1) {
                                YScoreA = "--";
                                CScoreA = item.ConversionFormula;
                            }
                            else {
                                YScoreA = item.Score
                                if (CScoreA == null && CScoreA == "" || CScoreA == 0) {
                                    CScoreA = item.Score
                                } else {
                                    CScoreA = "--";
                                }
                            }

                            
                            if (YScoreA != null && YScoreA != "" || YScoreA == 0) {
                               
                                YScoreA = item.Score
                            } else {
                                YScoreA = "--";
                            }
                            if (item.WD_Name.indexOf('总评') > -1)
                            {
                                YScoreA = "--";
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
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                        if (MinScore < 0) {
                            MinScore = -5
                        } else {
                            MinScore = 0;
                        }
                        DrawChart(WdJsonName, scorejson, MinScore, 115);
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        //内容
        function TSLB15(Acode, _AnswerJson, sexval, AgeVal, recoverys, AllscoreA) {
            var AnswerIDs = getUrlParam("A_ID");
            var WDScoreA = "";
            var WDScoreB = "";
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 15,
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
                            if (index == 2) {
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var CmHtmls = "";//颜色div拼接
                                var CMNumber = "";//数字div拼接
                                var CMLengthNew = "";

                                NormName = item.NormName;
                                Result = item.Result;
                                Proposal = item.Proposal;
                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                                scorejson += item.Score + ",";
                                var WDName = "";
                                if (WDlength == 1) {
                                    WDName = "总评";
                                }
                                else {
                                    WDName = "总评";

                                }
                                var zt_Type = "";
                                zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName
                                var YScoreA = item.Score
                                var CScoreA = item.ConversionFormula;
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
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td>";
                                PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                            }
                            
                        });

                        DrawChart(WdJsonName, scorejson,10, 115);

                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        function TSLB17(Acode, _AnswerJson, sexval, AgeVal, recoverys, AllscoreA) {
            var n = "";
            var d = "";
            var y = "";
            var o = "";
            var P = "";
            var B = "";
            var ScorejsonA = "";
            var AnswerIDs = getUrlParam("A_ID");

            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 17,
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
                            if (index == 4) {
                                var Score = "";
                                if (item.ScoreType == 1) {
                                    Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                                    var Forms = item.Formulas;
                                    if (Forms != null && Forms != "") {
                                        MinScore = Forms.replace("Score", Mins);
                                        MaxScore = Forms.replace("Score", Maxs);
                                        MinScore = eval(MinScore).toFixed(2);
                                        MaxScore = eval(MaxScore).toFixed(2);
                                    }

                                } else {
                                    Score = item.Score.toFixed(2);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";
                                }

                                var A = 0;
                                var NormName = "";//状态
                                var Result = "";//结果
                                var Proposal = "";
                                var DataArry = "";

                                var WDScoreB = "";
                                var ConverScoreA = "";
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
                                P = item.P;
                                B = item.B;
                                var WDName = "";
                                if (WDlength == 1) {
                                    WDName = "总评";
                                }
                                else {
                                    WDName = "总评";

                                }
                                NormName = item.NormName;
                                Result = item.Result;
                                Proposal = item.Proposal;
                                var zt_Type = "";
                                zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName
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
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";



                                PageHtml += "  <tr style=\"height:27.2500pt;\">";
                                PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td>";
                                PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">P=" + item.P + ";B=" + item.B + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                            }
                        });
                        ScorejsonA += P + "," + B + ",";
                        //DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                        QIUS(ScorejsonA)
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        //生活事件
        function TSLB18(Acode, _AnswerJson, sexval, AgeVal, recoverys, AllscoreA)
        {
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: AllscoreA,
                    AnswerId: getUrlParam("A_ID"),
                    types: 18,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                success: function (msg) {
                    var msg = eval(msg)
                    $.each(eval(msg), function (index, item) {
                        var NormName = "";
                        var Result = "";
                        var Proposal = "";
                        NormName = item.NormName;
                        Result = item.Result;
                        Proposal = item.Proposal;
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
                        PageHtml += " </td> </tr>";
                        PageHtml += " <tr>";
                        PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";

                        PageHtml += "</td>";
                        PageHtml += "  </tr>";
                        PageHtml += "  </table>";
                        PageHtml += "</div>";

                        $("#GeneralMessage").append(PageHtml);
                    });
                }
            });
            DrawChart("总评"+",", AllscoreA+",", 0);
            //InitAnswerRecord(msgs.AnswerR);
           
        }
       

       
        //end
        var states = "";
        function jsonstr(strjson) {
            if (strjson != null && strjson != "") {
                states = 1;//更新
                //var obj2 = eval('(' + strjson + ')');
                $.each(strjson, function (name, value) {
                    $("#" + name).html(value);
                    $("#" + name).val(value);
                });
            } else {
                states = 0;//添加
            }

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
            return chnStr;
        }


        function InitAnswerRecord(AR) {
            if (AR != null && AR != "") {
                //创建表格
                var rowCount = Math.ceil(AR.length / 10);

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
                        if (AR.length > trm) {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\" id=" + parseInt(trm + 1) + "  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
                        } else {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\"><span></span></td>");
                        }

                        td.appendTo(tr);
                    }
                }
            }
            //循环遍历数据
            $.each(AR, function (index, value) {
                var Inputtd = $("#tableid").find("#" + parseInt(index + 1) + "");
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
                if (AmountCode == "LB_14814373314360")
                {
                    ARLength = 60;
                }
                else
                {
                    ARLength = getJsonObjLength(AR);
                    ARLength = ARLength - 1;
                }
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
        //修改
        var EInt = 0;
        function Edite() {
            EInt++;
            $(".nameid").show();
            //$(".nameid").show();
            $("#NewInfo").show();
            $("#Newdelete").show();
            $(".resultp").hide();
            $(".results").show();
            $("#Edite").hide();
            $("#recovery").show();
            $(".Newname").hide();
            $(".moretexts").show();
            $("#SaveID").show();
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

        //回复默认
        function recovery() {
            $(".nameid").hide();
            $("#NewInfo").hide();
            $("#Newdelete").hide();
            $(".resultp").show();
            $(".results").hide();
            $("#Edite").show();
            $("#recovery").hide();
            $(".Newname").show();
            $(".moretexts").hide();
            $("#SaveID").hide();
        }
        //保存
        function Add() {
            var operationTypes = "";
            if (states == 0) {
                operationTypes = "PRAdd";
            } else {
                operationTypes = "UpdatePR";
            }
            var d1 = {};
            var t1 = $("#GeneralMessage").find("textarea").serializeArray();//
            $.each(t1, function () {
                d1[this.name] = this.value

            });
            var InputJson = JSON.stringify(d1);
            var fields = $("[data-name=field]");
            var value = $("[data-name=value]");
            var strJson = [];
            if (fields.length > 0) {
                for (var i = 0; i < fields.length; i++) {
                    if (i == fields.length - 1 && $(fields[i]).val() == "" && $(fields[i]).text() == "") {
                        break;
                    }
                    if ($(fields[i]).val() == "" && $(fields[i]).text() != "") {
                        var field = $(fields[i]).text().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                    }
                    if ($(fields[i]).val() != "") {
                        var field = $(fields[i]).val().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                    }

                    strJson.push(str);
                }
            }

            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReport.ashx",
                data: {
                    operationType: operationTypes,
                    InputJson: InputJson,
                    ACode: Acodes,
                    state: states,
                    AID: getUrlParam("A_ID"),
                    NewJsons: JSON.stringify(strJson),
                },

                success: function (msg) {
                    if (msg == "True") {

                        //NewJsonstr(strJson);
                        //DrawWD_Analysis(Acodes, AnswerJson);
                        $(".nameid").hide();
                        $(".resultp").show();
                        $(".results").hide();
                        $("#Edite").show();
                        $("#recovery").hide();
                        $(".moretexts").hide();
                        $("#NewInfo").hide();
                        $("#Newdelete").hide();
                        $("#SaveID").hide();
                        layer.msg('保存成功！', { icon: 1 });
                        window.location.reload();
                    } else {
                        layer.msg('保存失败！', { icon: 1 });
                    }
                }
            });
        }
        var count = 1;
        function addRow() {
            var html = '<div class="row moretexts"  style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">';
            html += ' <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;"><input type="text" class="form-control" data-name="field" placeholder="请输入标题"></div>';
            html += ' <div  class="nameid" style="margin-top: 15px;"><input class="form-control" data-name="value" placeholder="请输入内容" ></div>';
            html += '</div>';

            $('#dictionary').append(html);
        }
        function detele(obj) {
            var newobj = obj.parentNode;
            newobj.remove();
        }

        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        //获取新的值
        function NewJsonstr(newjson) {
            if (newjson != null && newjson != "") {
                //var strjson = eval('(' + newjson + ')');
                $.each(newjson, function (index, item) {
                    var html = '<div class="row moretext" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">';
                    html += '<div class="Newname"><div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">' + item["Field"] + '</div>';
                    html += '<div  style="margin-top: 15px;">' + item["Value"] + '</div> </div>';
                    html += '<div  class="nameid" style="display:none"><div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;"><input type="text" class="form-control" value=' + item["Field"] + ' data-name="field"  placeholder="请输入标题"></div>';
                    html += '<div  style="margin-top: 15px;"><input class="form-control" value=' + item["Value"] + ' data-name="value" placeholder="请输入内容" ></div></div></div>'
                    $('#dictionary').append(html);
                });
            }

        }
        //删除最后一行
        function remove(obj) {
            if ($("#dictionary .moretexts:last").length == 0) {
                $("#dictionary .moretext:last").remove();
            } else {
                $("#dictionary .moretexts:last").remove();
            }

        }
        //图表
        function DrawChart(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
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

        //卡特尔图表
        function DrawChartKTR(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            var categorieslist = ["乐群性", "聪慧性", "稳定性", "恃强性", "兴奋性", "有恒性", "敢为性", "敏感性", "怀疑性", "幻想性", "世故性", "忧虑性", "实验性", "独立性", "自律性", "紧张性", ]
            var w = 650;
            var h = 750;
            //左右空隙，用来放高分低分特征说明文字
            var margin = 100;
            if (w == null || w.length < 1) { w = "100%"; } else { w = w[1] + "px"; } //宽度，默认100%
            //x轴上标签的宽度
            var x_label_w = 75;
            //创建剖析图容器
            $('#container').highcharts({

                title: {
                    text: AmountName,
                    x: -20 //center
                },
                chart: {
                    style: { fontFamily: "'微软雅黑', Verdana, '宋体'" }, //字体
                    type: 'line', //平滑曲线
                    inverted: true, //xy轴反转
                    marginLeft: margin + x_label_w + 5,
                    marginRight: margin + 5
                },
                xAxis: {
                    categories: categorieslist,
                    gridLineWidth: 1, //x轴上网格线（默认没有）
                    offset: margin + 5
                },
                yAxis: {
                    title: null,
                    max: maxsjoin,
                    min: minsjon,
                    tickInterval: 1, //刻度间隔
                    plotLines: [{ //竖直中线
                        label: { text: '中线' },
                        color: 'red',
                        value: 5.5,
                        width: 1
                    }]
                },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0,
                    enabled: false
                },
                series: [{
                    name: '人格因素',
                    data: jsons,
                    dataLabels: {
                        enabled: true, //显示数据标签
                        align: 'left', //数据标签左对齐，控制xy坐标位置
                        x: 5,
                        y: 10
                    }
                }, ]
            }, function (chart) { // 画图完成后写两边的文字
                var low = "沉默孤独|迟钝、学识浅薄|迟钝、情绪激动|谦逊顺从|严肃谨慎|权宜敷衍|畏怯退缩|理智、注重实际|信赖随和|现实、合乎常规|坦白直率、天真|安详沉着、有自信心|保守、附庸传统|依赖、随群附众|矛盾冲突、不明大体|心平气和".split("|");
                var high = "乐群外向|聪慧、富有才识|情绪稳定|好强固执|轻松兴奋|有恒负责|冒险敢为|敏感、感情用事|怀疑刚愎|幻想、狂荡不羁|精明能干、世故|忧虑抑郁、烦恼多端|自由、批评激进|自立、当机立断|知己知彼、自律谨严|紧张困扰".split("|");

                //为字符串对象增加一个右边截取方法
                String.prototype.rightStr = function (n) { return this.substring(this.length - n, this.length); };

                for (var i = 0; i < low.length; i++) {
                    chart.renderer.text(("　　　　　　　" + low[i]).rightStr(9), x_label_w, i * (h - 100) / 17.3 + 80).css({ fontSize: "11px" }).add();
                    chart.renderer.text(high[i], $('#container').width() - margin, i * (h - 100) / 17.3+ 80).css({ fontSize: "11px" }).add();
                }
            });
        }
        /*--------------------表格绘制-----------------*/
        function DrawChartRW(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            /*---------------普通类型的----------------*/
            var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
            var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
            var serieslist = [{
                name: "注释:0-5 智力缺陷,5-25 智力中下,25-75 智力中等,75-95 智力良好,95-100 智力优秀",
                data: jsons
            }];
            $('#container').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: AmountName
                },

                xAxis: {
                    categories: ['总评']
                },
                yAxis: {
                    title: {
                        text: '分数 (分)'
                    },
                    tickPositioner: function () {
                        var min = 0, max = 95;
                        return [0, 5, 25, 75, 95];
                    },
                    tickInterval: 10,
                },
                plotOptions: {
                    series: {
                        pointWidth: 10 //柱子的宽度值 单位为px
                    }
                },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                series: serieslist
            });
            //test()
        }
        function test() {
            $(".highcharts-yaxis-labels").find("tspan").eq(1).text(5);
            $(".highcharts-yaxis-labels").find("tspan").eq(2).text(25);
            $(".highcharts-yaxis-labels").find("tspan").eq(3).text(75);
            $(".highcharts-yaxis-labels").find("tspan").eq(4).text(95);
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
            if (month >= 3) {
                result = parseInt(year + 0.5);
            } else if (month >= 9) {
                result = parseInt(year + 1);
            }

            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
        }

        //随机获取颜色
        function randomColor() {

            var colorStr = Math.floor(Math.random() * 0xFFFFFF).toString(16).toUpperCase();

            return "#" + "000000".substring(0, 6 - colorStr) + colorStr;

        }
        //图片
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

        function QIUS(jsons) {
            var width = $('#container').width();
            var yoffset = (width - 100) / 2 * -1;
            var xoffset = ((width / 4 * 3) - 100) / 2 * -1;
            $('#container').height((width / 4 * 3));
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            jsons = '[[' + jsons[1] + ',' + jsons[0] + ']]';
            jsons = eval("(" + jsons + ")");
            var tname = "QIUS在校学生气质量表（QTS）";
            $('#container').highcharts({
                title: {
                    text: tname,
                    x: 0 //center
                },
                chart: {
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
                    offset: xoffset,
                    opposite: false,
                    showEmpty: false,
                    lineWidth: 1,
                    lineColor: 'black',
                    tickWidth: 1,
                    labels: {
                        formatter: function () {
                            if (this.value < 20 && this.value > -20) {
                                return "";
                            }
                            else
                                return this.value;
                        }
                    },
                    tickPositions: [-60, -55, -50, -45, -40, -35, -30, -25, -20, '', '', '', ' ', '', '', '', 20, 25, 30, 35, 40, 45, 50, 55, 60],
                    min: -60,
                    max: 60,
                    minTickInterval: 2,
                    title: {//横轴标题  
                        text: 'B维度',
                        x: -yoffset,
                        y: -10,
                        floating: true
                    }
                },
                yAxis: {
                    offset: yoffset,
                    gridLineWidth: 0,
                    title: null,
                    lineColor: 'black',
                    tickWidth: 1,
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }],
                    labels: {
                        formatter: function () {
                            if (this.value < 20 && this.value > -20) {
                                return "";
                            }
                            else
                                return this.value;
                        }
                    },
                    lineWidth: 1,
                    tickWidth: 1,
                    tickPositions: [-60, -55, -50, -45, -40, -35, -30, -25, -20, '', '', '', ' ', '', '', '', 20, 25, 30, 35, 40, 45, 50, 55, 60],
                    title: {//纵轴标题  
                        text: 'P维度',
                        x: 50,
                        y: -(xoffset - 15),
                        rotation: -360
                    }
                },
                series: [
                    {
                        type: 'scatter',
                        color: 'red',
                        name: '分数',
                        data: jsons
                    }
                    , {
                        enableMouseTracking: false,
                        color: "black",
                        marker: {
                            enabled: false,
                            symbol: "none"
                        },
                        data: [
                            [42, 60],
                            [42, 42],
                            [60, 42]
                        ]
                    }, {
                        enableMouseTracking: false,
                        color: "black",
                        marker: {
                            enabled: false,
                            symbol: "none"
                        },
                        data: [
                            [-42, 60],
                            [-42, 42],
                            [-60, 42]]
                    },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [42, -60],
                 [42, -42],
                 [60, -42]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-42, -60],
                 [-42, -42],
                 [-60, -42]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             dashStyle: 'Dot',
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-20, 20],
                 [20, 20],
                 [20, -20],
                 [-20, -20],
                 [-20, 20]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [20, 60],
                 [20, 20],
                 [60, 20]
             ]
         }, {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-20, 60],
                 [-20, 20],
                 [-60, 20]]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [20, -60],
                 [20, -20],
                 [60, -20]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-20, -60],
                 [-20, -20],
                 [-60, -20]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型胆汁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-52, 55]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型多血质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [50, 57]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型抑郁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-52, -55]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型粘液质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [50, -57]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般胆汁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, 25]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般多血质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, 25]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般抑郁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, -38]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般粘液质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, -38]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "胆汁-抑郁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, 5]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "多血-粘液质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, 5]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "抑郁-胆汁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, -17]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "粘液-多血质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, -17]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "胆<br>汁<br>-<br>多<br>血<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-10, 60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "多<br>血<br>-<br>胆<br>汁<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [10, 60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "粘<br>液<br>-<br>抑<br>郁<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [10, -60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "抑<br>郁<br>-<br>粘<br>液<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-10, -60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "多项气质混合型",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [0, 0]
             ]
         }
                ]
              , exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0,
                    enabled: false
                },
            });
        }
        //Achenbach儿童行为量表
        function TSLB13Html(WD_Name, Yscore, Score, zt_Type, Result, Proposal) {
            var PageHtml = "";
            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\"  style=\"margin-bottom:30pt\"> ";
            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
            PageHtml += " <tr>";
            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
            PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td> </tr>";

            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' >" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
            //   PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";
            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" />";
            $("#GeneralMessage").append(PageHtml);
        }
        function TSLBDZ(StateType, obj)
        {
            var NormName = "";
            var Result = "";
            var Proposal = "";
            var State = "";
            if (StateType == 1)
            {
                if (obj == "胆汁质")
                {
                    State = 1;
                } else if (obj == "多血质")
                {
                    State = 2;
                }
                else if (obj == "粘液质")
                {
                    State = 3;
                }
                else if (obj == "抑郁质")
                {
                    State = 4;
                }
                
            } else if (StateType == 2)
            {
                if (obj == "胆汁质-多血质" || obj == "多血质-胆汁质")
                {
                    State = 5;
                } else if (obj == "多血质-粘液质" || obj == "粘液质-多血质")
                {
                    State = 6;
                } else if (obj == "粘液质-抑郁质" || obj == "抑郁质-粘液质")
                {
                    State = 7;
                } else if (obj == "胆汁质-抑郁质" || obj == "抑郁质-胆汁质")
                {
                    State = 8;
                }
            } else if (StateType == 3)
            {
                if (obj == "胆汁质-多血质-粘液质" || obj == "胆汁质-粘液质-多血质")
                {
                    State = 9;
                } else if (obj == "多血质-粘液质-抑郁质" || obj == "多血质-抑郁质-粘液质")
                {
                    State = 10;
                } else if (obj == "胆汁质-多血质-抑郁质" || obj == "胆汁质-抑郁质-多血质")
                {
                    State = 11;
                } else if (obj == "胆汁质-粘液质-抑郁质" || obj == "胆汁质-抑郁质-粘液质")
                {
                    State = 12;
                }
            } else if (StateType == 4)
            {
                State = 13;
            }
            switch (State)
            {
                case 1:
                    NormName = "胆汁质";
                    Result = " 测试结果显示，您的主要气质类型为胆汁质。胆汁质的主要特征为：精力旺盛，反应迅速，情感体验强烈，情绪发生快而强，易冲动但平息也快，直率爽快，开朗热情，外向，但急躁易怒，往往缺乏自制力，有顽强的拼劲和果敢性，但缺乏耐心。概括起来，以精力旺盛，表里如一、刚强、易感情用事为主要特征，整个心理活动充满着迅速而突变的色彩。";
                    Proposal += "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    break;
                case 2:
                    NormName = "多血质";
                    Result = " 测试结果显示，您的主要气质类型为多血质。多血质的主要特征为：活泼好动，反应迅速，行动敏捷、思维灵活；注意力易转移，情绪发生快而多变，易适应环境，喜欢交往，做事粗枝大叶，表情丰富、外向，易动感情且体验不深，往往不求甚解，华而不实为特征。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    break;
                case 3:
                    NormName = "粘液质";
                    Result = "测试结果显示，您的主要气质类型为粘液质。粘液质的主要特征为：安静、沉着、反应较慢，自我控制能力和持久性较强；不易习惯新工作，情绪不易外露，善于忍耐，具有内倾型；但易因循守旧，不易改变旧习惯去适应新环境；坚韧、执拗、淡漠；概括起来，较稳重但灵活不足，踏实但有些死板，沉着冷静但缺乏生气。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    break;
                case 4:
                    NormName = "抑郁质";
                    Result = "测试结果显示，您的主要气质类型为抑郁质。抑郁质的主要特征为：敏锐稳重，聪明而富于想象，自制力强，情感体验深刻、持久、少流露，行动迟缓，胆小、孤僻，不善交往，生活比较单调，多愁善感，内向，谨慎小心，遇困难或挫折易畏缩。有较强的敏感性，具有内倾型，容易体察到一般人不易觉察的事件，外表温柔、怯懦、孤独、行动缓慢为特征。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 5:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了胆汁质和多血质的特点，既热情豪爽，亦不乏机灵敏捷；思维言语动作快而机巧，情绪外显，多好交际，果敢善变；精力旺盛，富于生气，但有时显得急躁和轻率，对单一事物的注意力不够持久。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += " &nbsp;&nbsp根据您的测试结果，可以参考胆汁质和多血质的职业特点和职业列表：";
                    Proposal += "胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    break;
                case 6:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了多血质和粘液质的特征，既有外向活动的适应力，也有冷静沉思的内向心理特点；易形成多层次的人格品质：浮躁与坚韧，热情与冷漠、敏捷与迟缓交织在一起，但皆不十分突出。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += " &nbsp;&nbsp根据您的测试结果，可以参考多血质和粘液质的职业特点和职业列表：";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    break;
                case 7:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了粘液质和抑郁质的特征，主要表现为：孤僻寡欢，谦虚慎言，犹豫不前，固执拘谨，耐心有序，内心不外显；有时稍有自信，有时又显自卑，从容与胆怯，自制与消沉，细心与迟缓相杂；时有沉思的踏实，时有敏感的困惑，皆倾于自我内心，使人不易明察。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考粘液质和抑郁质的职业特点和职业列表：粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 8:
                    NormName = obj;
                    Result = "测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了胆汁质和抑郁质的特征，主要表现为：时而精力充沛，时而情绪低落，时而孤僻自守，时而激动难抑；感受性灵敏细微或粗疏简陋，两级跳跃幅度较大；在学习过程中，易养成细心认真和热情充沛的良好品质，但也可能过敏和激动不安以致学习困难。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质和抑郁质的职业特点和职业列表：";
                    Proposal += " 胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。"
                    Proposal += " 抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 9:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、多血质和粘液质的职业特点和职业列表：";
                    Proposal += " 胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += " 多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    break;
                case 10:
                    NormName = obj;
                    Result = "测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考多血质、粘液质和抑郁质的职业特点和职业列表：";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 11:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、多血质和抑郁质的职业特点和职业列表：";
                    Proposal += "胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 12:
                    NormName = obj;
                    Result = "  测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、粘液质和抑郁质的职业特点和职业列表：";
                    Proposal += "胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 13:
                    NormName = obj;
                    Result = "测试结果显示，您的主要气质类型为" + obj + "的混合型。" + obj + "的综合了四种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、多血质、粘液质和抑郁质的职业特点和职业列表：";
                    Proposal += " 胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
              
            }
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
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td>";
            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
            PageHtml += " </td> </tr>";

            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";          
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";          
            $("#GeneralMessage").append(PageHtml);
        }
    </script>
</asp:Content>
