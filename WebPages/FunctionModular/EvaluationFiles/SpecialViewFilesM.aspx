<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialViewFilesM.aspx.cs" Inherits="WebPages.FunctionModular.EvaluationFiles.SpecialViewFilesM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
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
    </style>
    <style type="text/css">
        .progressA {
            height: 20px;
            overflow: hidden;
        }

        .progress-bar-success {
            background-color: #5cb85c;
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

        .progress-bar-info {
            background-color: #5bc0de;
        }

        .progress-bar-warning {
            background-color: #f0ad4e;
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
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script>
        var navName = '/FunctionModular/EvaluationFiles/EvaluationFiles.aspx';
        var Title = "";
        var categoriedata = [];
        var datas = "";
        var AnswerRs = 0;
        var AnswerR = "";
        var AmountName = "";
        $(function () {

            //动态获取图表
            GetViewFiles();

            function GetViewFiles() {
                var Acode = getUrlParam("Acode");
                var UserName = getUrlVars('names');
                var UserName = decodeURI(UserName.names);
                var types=getUrlParam("types");
                var Sindexs = 0;
                var UID = getUrlParam("UIDs");
                $.ajax({
                    url: "Ajax/EvaluationFiles.ashx?type=GetView",
                    data: { Acode: Acode, UserName: UserName, UIDs: UID },
                    async: true,
                    success: function (msg) {


                        var obj = eval('(' + msg + ')');
                        var sexval = 0;
                        if (obj.UserInfo.Sex == "男") {
                            sexval = 1;
                        } else if (obj.UserInfo.Sex == "女") {
                            sexval = 2;
                        }
                        AmountName = obj.UserInfo.Amount_Name + "测评档案";
                        $("#ReportTitle").html("《" + obj.UserInfo.Amount_Name + "》" + "测评档案");
                        var ageval = obj.UserInfo.Ages;
                        var findtable = $("#pagecontent").find("table");
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(0)").text("登录名：" + obj.UserInfo.LoginName);
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(1)").text("姓名：" + obj.UserInfo.Name);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(0)").text("性别：" + obj.UserInfo.Sex);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(1)").text("部门：" + obj.UserInfo.D_name);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(0)").text("出生日期：" + obj.UserInfo.U_Birthday);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(1)").text("完成次数：" + obj.UserInfo.AllCount);
                        $("#LB").html(obj.UserInfo.AmountIntroduce);
                        AnswerRs = obj.AnswerInfo;
                        Title = obj.UserInfo.Amount_Name;
                        if (types == 4) {
                            TSLB4(Acode, sexval, obj.UserInfo.U_Birthday);                          
                        } else if (types == 802)
                        {
                            TSLB802(Acode, sexval, obj.UserInfo.U_Birthday)
                        } else if (types == 801)
                        {
                            TSLB801(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 14)
                        {
                            TSLB14(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 10)
                        {
                            TSLB10(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 16)
                        {
                            TSLB16(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 7)
                        {
                            TSLB7(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 15)
                        {
                            TSLB15(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 18)
                        {
                            TSLB18(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 19)
                        {
                            TSLB19(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 20)
                        {
                            TSLB20(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 21)
                        {
                            TSLB21(Acode, sexval, obj.UserInfo.U_Birthday);
                        }

                    }

                })

            }

        });        
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返
        }
        function OcExit() {

            window.location.href = "EvaluationFiles.aspx"

        }
        //获取作答记录表

        /*--------------维度解释解析-----------*/
        var OperationList;

        var Slength = "";

        var WdJsonName = "";

        var Slength802 = "";
        var datas802 = "";
        var TSLB802Index = 0;
        var Lengths = 0;
        function TSLB802(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            var NormName = "";//状态
            var NameID = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB802Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB802Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB802Index].AnswerID;
            var Ajson = AnswerRs[TSLB802Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: answer_id,
                    types: 802,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                complete: function (a, b) {
                    TSLB802Index++;
                  
                    NameID = "NormName" + TSLB802Index;
                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB802Index;
                    } else {
                        Slength += "," + TSLB802Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval("(" + msg + ")");
                       ;
                        $.each(msgs.datas, function (index, item) {
                           
                            var Seriesdata = "";
                            var Scores = "";
                            var standard = item.ConversionFormula;//标准分
                            var Originals = item.Score;//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }
                         
                            
                            var Scores0A = "";
                            var ConverScoreA = "";
                            var WDNameA = "";
                            var Scores0B = "";
                            var ConverScoreB = "";
                            var WDNameB = "";
                            var WDNameTypeA = "";
                            var WDNameTypeB = "";
                            WdJsonName += "维度" + SectionToChinese(indexs);
                            var Scores0C = "";
                            var WDNameC = "";
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var zt_Type = "";
                            if ((Scores != null && Scores != "")|| Scores==0 ) {
                               
                                    //循环遍历状态
                                    //var CMScorce = item.Score.toFixed(2);
                                    var Startsorse = "";
                                    var Endsorse = "";
                                    Result = item.Result;
                                    Proposal = item.Proposal;
                                    NormName = item.NormName;                                  
                                    OperationList = item.Tz_List;
                                    Allscore = item.Allscore;
                                    var SectioName = "";
                                    SectioName = "result" + SectionToChinese(index);
                                    SectionValue = item.Result;
                                    WdJsonName += "总评" + ",";                                    
                                    datas802 += "{name:'" + WDName + "',data:'" + Scores + "'},"                                
                                    //状态
                                    var zt_Type = "";
                                    zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName;
                                    var PageHtml = "";
                                    index++;
                                    if (index == 1) {
                                        PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + TSLB802Index + "</td>";//之前是AR
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + EndTime + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";                                     
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + " id=" + NameID + ">" + zt_Type + "</td>";
                                        PageHtml += "</tr>";
                                    } else {
                                        PageHtml += " <tr>";
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                        //PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + "无" + "</td>";
                                        PageHtml += "  </tr>";
                                    }

                                    $("#GetTableID tbody").append(PageHtml);
                                
                            }
                            if (index == msgs.datas.length && Lengths == TSLB802Index) {
                                chartjson(Slength, datas802);
                            }
                        });
                        TSLB802(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength4 = "";
        //var xdatas4 = "";
        //var ydatas4="";
        var datas4 = "";
        var ztype4="";
        var TSLB4Index = 0;
        var Lengths = 0;
        function TSLB4(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB4Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB4Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB4Index].AnswerID;
            var Ajson = AnswerRs[TSLB4Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: getUrlParam("UIDs"),
                    sexval: sexval,
                    AgeVAl: AgeVal,
                    types: 4
                },//要执行查询的数据参数

                complete: function (a, b) {
                    TSLB4Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB4Index;
                    } else {
                        Slength += "," + TSLB4Index;
                    }
                    if (msg != "") {
                        AR++;
                        var msgs = eval("(" + msg + ")");
                        $.each(msgs.datas, function (index, item) {
                           
                                var Seriesdata = "";
                                var Scores = "";
                                var standard = item.Score;//标准分
                                var Originals = item.Score;//原始分
                                if (item.ScoreType == 1) {
                                    if (Seriesdata != null && Seriesdata != "") {
                                        if (Acode == "LB_14810142054270") {
                                            if (item.WD_Name != "总评") {
                                                Seriesdata += "," + standard;
                                            }
                                        } else {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += standard;
                                    }
                                    Scores = standard;
                                } else {
                                    if (Seriesdata != null && Seriesdata != "") {
                                        if (Acode == "LB_14810142054270") {
                                            if (item.WD_Name != "总评") {
                                                Seriesdata += "," + Originals;
                                            }
                                        } else {
                                            Seriesdata += "," + Originals;
                                        }

                                    } else {
                                        if (Acode == "LB_14810142054270") {
                                            if (item.WD_Name != "总评") {
                                                Seriesdata += Originals;
                                            }
                                        } else {
                                            Seriesdata += Originals;
                                        }
                                    }
                                    Scores = Originals;

                                }
                                indexs++;
                                var WDName = "";
                                if (Acode == "LB_14810142054270") {
                                    if (item.WD_Name != "总评") {
                                        WDName = item.WD_Name
                                    }
                                } else {
                                    WDName = item.WD_Name
                                }
                                WDName = "总评";

                                datas4 += "{name:'" + WDName + "',data:'" + Seriesdata + "'},"
                                //   datas4 += "{name:'" + "低于生理年龄" + "," + "等于生理年龄" + "," + "高于生理年龄" + "',data:'" + Seriesdata + "'},"

                                WdJsonName += "维度" + SectionToChinese(indexs);
                                var NormName = "";//状态
                                var Result = "";//结果
                                var Proposal = "";
                                var cmmlists = item.CmmodelList;
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var zt_Type = "";


                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                                NormName = item.NormName;

                                //状态
                                //var zt_Type = "";
                                zt_Type = NormName == "" || NormName == null || NormName.length == 0 ? "无" : NormName;
                                var PageHtml = "";
                                index++;
                                if (indexs == 1) {
                                    PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + 1 + ">" + TSLB4Index + "</td>";//之前是AR
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + 1 + ">" + EndTime + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + "总评" + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                    PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                    PageHtml += "</tr>";
                                } else {
                                    PageHtml += " <tr>";
                                    PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + "总评" + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                    PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                    PageHtml += "  </tr>";
                                }

                                $("#GetTableID tbody").append(PageHtml);

                                xdatas4 = '等于生理年龄' + ',' + '低于生理年龄' + ',' + '高于生理年龄'
                                if (indexs == 1 && Lengths == TSLB4Index) {
                                    //chartjsontype(xdatas4,Slength,ztype4);
                                    chartjson(Slength, datas4);
                                }
                          
                            
                        });
                        TSLB4(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength801 = "";
        var datas801 = "";
        var TSLB801Index = 0;
        var Lengths = 0;
        function TSLB801(Acode, sexval, Birthday) {
            var AR = 0;
            var IndexA = "";
            var IndexB = "";
            var IndexC = "";
            var IndexMax = "";
            var WDName = "";
            var AllScoreJson = "";
            var datas = "";
            Lengths = AnswerRs.length;
           
            if (TSLB801Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB801Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB801Index].AnswerID;
            var Ajson = AnswerRs[TSLB801Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: answer_id,
                    types: 801,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                complete: function (a, b) {
                    TSLB801Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB801Index;
                    } else {
                        Slength += "," + TSLB801Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval("(" + msg + ")");
                        $.each(msgs.datas, function (index, item) {                                                 
                                index++;
                                var Seriesdata = "";
                                var scorejson = "";
                                var Scores = "";
                                var standard = item.ConversionFormula;//标准分
                                var Originals = item.Score;//原始分
                                if (item.ScoreType == 1) {
                                    if (Seriesdata != null && Seriesdata != "") {
                                        if (Acode == "LB_14810142054270") {
                                            if (item.WDName != "总评") {
                                                Seriesdata += "," + standard;
                                            }
                                        } else {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += standard;
                                    }
                                    Scores = standard;
                                } else {
                                    if (Seriesdata != null && Seriesdata != "") {
                                        if (Acode == "LB_14810142054270") {
                                            if (item.WDName != "总评") {
                                                Seriesdata += "," + Originals;
                                            }
                                        } else {
                                            Seriesdata += "," + Originals;
                                        }

                                    } else {
                                        if (Acode == "LB_14810142054270") {
                                            if (item.WDName != "总评") {
                                                Seriesdata += Originals;
                                            }
                                        } else {
                                            Seriesdata += Originals;
                                        }
                                    }
                                    Scores = Originals;

                                }
                                indexs++;
                                var Scores0A = "";

                                var A = 0;
                                var NormName = "";//状态
                                var Result = "";//结果
                                var Proposal = "";
                                var ConverScoreA = "";
                                //循环遍历状态                              
                                NormName = item.zt_Type;
                                ConverScoreA = item.ConverScoreA;
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += item.WDName + ",";
                                datas801 += "{name:'" + item.WDName + "',data:'" + item.ConverScoreA + "'},"
                                WDName = item.WDName
                                if (item.WDName != "" && item.WDName != null) {
                                    var PageHtml = "";
                                    if ((item.IndexA == item.IndexB) && (item.IndexA == item.IndexC)) {
                                        if (index == 1) {
                                            PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"4\">" + TSLB801Index + "</td>";//之前是AR
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"4\">" + EndTime + "</td>";
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + item.IndexA + "</td>";
                                            PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                            PageHtml += "</tr>";
                                        } else {
                                            PageHtml += " <tr>";
                                            PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + item.IndexA + "</td>";
                                            PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                            PageHtml += "  </tr>";
                                        }
                                       
                                        $("#GetTableID tbody").append(PageHtml);
                                    }
                                    else if (item.IndexA == item.IndexB && item.IndexA > item.IndexC) {  //
                                        if (index == 2 || index == 4) {
                                            if (indexs == 2) {

                                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + TSLB801Index + "</td>";//之前是AR
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + EndTime + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + item.IndexA + "</td>";
                                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                                PageHtml += "</tr>";
                                            } else {
                                                PageHtml += " <tr>";
                                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + item.IndexA + "</td>";
                                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                                PageHtml += "  </tr>";
                                            }
                                            $("#GetTableID tbody").append(PageHtml);
                                        }
                                       
                                    }

                                    else {
                                        if (index == 3 || index == 4) {
                                            if (indexs == 3) {
                                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + TSLB801Index + "</td>";//之前是AR
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + EndTime + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                                PageHtml += "</tr>";
                                            } else {
                                                PageHtml += " <tr>";
                                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                                PageHtml += "  </tr>";
                                            }

                                            $("#GetTableID tbody").append(PageHtml);
                                        }
                                       
                                    }
                                }
                                if (indexs == msgs.datas.length && Lengths == TSLB801Index) {
                                    chartjsontype(Slength, datas801);
                                }
                            
                        });
                        TSLB801(Acode, sexval, Birthday);


                    }
                }
            });

        }

        var Slength14 = "";
        var datas14 = "";
        var TSLB14Index = 0;
        var Lengths = 0;
        function TSLB14(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB14Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB14Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB14Index].AnswerID;
            var Ajson = AnswerRs[TSLB14Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: getUrlParam("A_ID"),
                    types: 14,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数

                complete: function (a, b) {
                    TSLB14Index++;
                    var WDScoreA = "";
                    var WDScoreB = "";
                    var AllscoreA = 0;
                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB14Index;
                    } else {
                        Slength += "," + TSLB14Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval("(" + msg + ")");
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Seriesdata = "";
                            var Scores = "";
                            var standard = item.ConversionFormula;//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                           
                            var WDName = "";
                            var NormName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }


                            if (index == 1) {
                              
                                WDScoreA = Originals;
                                AllscoreA += parseInt(Originals);
                            } else if (index == 2)
                            {
                              
                                AllscoreA += parseInt(Originals);
                            }
                            else if (index == 3) {
                                indexs++;
                                AllscoreA += parseInt(Originals);
                                //alert(AllscoreA)
                                WdJsonName += "总评" + ",";
                                WDScoreB = Originals;
                                scorejson += parseFloat(AllscoreA) + ",";
                               
                                NormName = item.NormName;
                                datas14 += "{name:'" + "总评" + "',data:'" + AllscoreA + "'},"
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";


                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                               
                                var PageHtml = "";
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" >" + TSLB14Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + AllscoreA + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                                $("#GetTableID tbody").append(PageHtml);
                            }
                            if (indexs == (msgs.datas.length - 2) && Lengths == TSLB14Index) {
                                chartjson(Slength, datas14);
                            }
                        });
                        TSLB14(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength10 = "";
        var datas10 = "";
        var TSLB10Index = 0;
        var Lengths = 0;
        function TSLB10(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB10Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB10Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB10Index].AnswerID;
            var Ajson = AnswerRs[TSLB10Index].AnswerJson
            var AllScores ="";
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: answer_id,
                    types: 10,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数

                complete: function (a, b) {
                    TSLB10Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB10Index;
                    } else {
                        Slength += "," + TSLB10Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval("(" + msg + ")");
                        $.each(msgs.datas, function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = item.ConversionFormula;//标准分
                            var Originals = item.Score;//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            var NormName = "";
                            var Result = "";//结果
                            var Proposal = "";
                            var TZNumber = 0;
                      
                            NormName = item.NormName;
                            datas10 += "{name:'" + WDName + "',data:'" + Scores + "'},"
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";


                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            if (NormName == null || NormName == "") {
                                NormName = "无";
                            }
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + TSLB10Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgs.datas.length && Lengths == TSLB10Index) {
                                chartjson(Slength, datas10);
                            }
                        });
                        TSLB10(Acode, sexval, Birthday);

                    }
                }
            });

        }


        var Slength16 = "";
        var datas16 = "";
        var TSLB16Index = 0;
        var Lengths = 0;
        function TSLB16(Acode, sexval, Birthday) {
            var L = "";
            var NE = "";
            var PE = "";
            var NC = "";
            var PC = "";
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB16Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB16Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB16Index].AnswerID;
            var Ajson = AnswerRs[TSLB16Index].AnswerJson
            var AllScores = AnswerRs[TSLB16Index].score;
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: answer_id,
                    types: 16,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                complete: function (a, b) {
                    TSLB16Index++;
                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB16Index;
                    } else {
                        Slength += "," + TSLB16Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                       
                        var msgs = eval("(" + msg + ")");
                        var msgsdata = msgs.datas;
                        var temp = msgsdata[0];
                        msgsdata[0] = msgsdata[msgsdata.length - 1];
                        msgsdata[msgsdata.length - 1] = temp;

                        $.each(msgsdata, function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = item.ConversionFormula;//标准分
                            var Originals = item.Score;//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            index++;
                           
                          
                     
                           
                            var cmmlists = item.CmmodelList;
                            var NormName = "";
                      
                            //循环遍历状态
                           
                            var Startsorse = "";
                            var Endsorse = "";
                            NormName = item.NormName;
                            datas16 += "{name:'" + WDName + "',data:'" + Scores + "'},"
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                          
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgsdata.length + ">" + TSLB16Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgsdata.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgsdata.length && Lengths == TSLB16Index) {
                                chartjson(Slength, datas16);
                            }
                        });
                        TSLB16(Acode, sexval, Birthday);

                    }
                }
            });

        }


        var Slength7 = "";
        var datas7 = "";
        var TSLB7Index = 0;
        var Lengths = 0;
        function TSLB7(Acode, sexval, Birthday) {
            var A = "";
            var B = "";
            var C = "";
            var D = "";
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB7Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB7Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB7Index].AnswerID;
            var Ajson = AnswerRs[TSLB7Index].AnswerJson
            var AllScores = AnswerRs[TSLB7Index].score;
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: answer_id,
                    types: 7,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数
                complete: function (a, b) {
                    TSLB7Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB7Index;
                    } else {
                        Slength += "," + TSLB7Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval("(" + msg + ")");
                        $.each(msgs.datas, function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = item.ConversionFormula;//标准分
                            var Originals = item.Score;//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            index++;
                     
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

                            datas7 += "{name:'" + WDName + "',data:'" + Scores + "'},"
                            var cmmlists = item.CmmodelList;
                           
                 
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";


                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";

                            var PageHtml = "";
                            index++;
                            
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + TSLB7Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgs.datas.length && Lengths == TSLB7Index) {
                                chartjson(Slength, datas7);
                            }
                        });
                        TSLB7(Acode, sexval, Birthday);

                    }
                }
            });

        }


        var Slength15 = "";
        var datas15 = "";
        var TSLB15Index = 0;
        var Lengths = 0;
        function TSLB15(Acode, sexval, Birthday) {
            var WDScoreA = "";
            var WDScoreB = "";
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB15Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB15Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB15Index].AnswerID;
            var Ajson = AnswerRs[TSLB15Index].AnswerJson
            var AllScores = AnswerRs[TSLB15Index].score;
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: Ajson,
                    AnswerId: answer_id,
                    types: 15,
                    sexval: sexval,
                    AgeVAl: AgeVal
                },//要执行查询的数据参数

                complete: function (a, b) {
                    TSLB15Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB15Index;
                    } else {
                        Slength += "," + TSLB15Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval("(" + msg + ")");
                        $.each(msgs.datas, function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = item.ConversionFormula;//标准分
                            var Originals = item.Score;//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            index++;                          
                            var IndexMax = "";
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var DataArry = "";
                           
                            var ConverScoreA = "";
                            if (item.WD_Name.indexOf('女性') > -1) {
                              
                                ConverScoreA = item.ConversionFormula;

                                datas15 += "{name:'" + "总评" + "',data:'" + ConverScoreA + "'},"

                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";                            
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                                NormName = item.NormName;
                                var PageHtml = "";
                                index++;
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\">" + TSLB15Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" >" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                                $("#GetTableID tbody").append(PageHtml);
                            }
                            if (indexs == msgs.datas.length && Lengths == TSLB15Index) {
                                chartjson(Slength, datas15);
                            };
                        });
                        TSLB15(Acode, sexval, Birthday);

                    }
                }
            });

        }




        var Slength18 = "";
        var datas18 = "";
        var TSLB18Index = 0;
        var Lengths = 0;      
        var MaxScore18 = 0;
        function TSLB18(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB18Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB18Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB18Index].AnswerID;
            var Ajson = AnswerRs[TSLB18Index].AnswerJson
            var scores = AnswerRs[TSLB18Index].score;
            TSLB18Index++;
            if (Slength == "") {
                Slength += TSLB18Index;
            } else {
                Slength += "," + TSLB18Index;
            }
            datas18 += "{name:'总评',data:'" + scores + "'},"
            var NormName = "";//状态           
            if (scores < 20) {
                NormName = "正常状态";             
            } else if (scores >= 20) {
                NormName = "异常状态";               
            }
            if (TSLB18Index == 1) {
                MaxScore18 = scores;
            } else {
                if (scores > MaxScore18)
                {
                    MaxScore18 = scores;
                }
            }
            var PageHtml = "";
            PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + TSLB18Index + "</td>";//之前是AR
            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + EndTime + "</td>";
            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + scores + "</td>";
            PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
            PageHtml += "</tr>";
            $("#GetTableID tbody").append(PageHtml);
            if (Lengths == TSLB18Index) {
                chartjson(Slength, datas18);
            }
            TSLB18(Acode, sexval, Birthday);
        }

       
        function DrawWD_Analysis(EndTime, AnswerJson, Sindexs, lengths, sexval, AgeVal) {
            var AR = 0;
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: AnswerJson
                },//要执行查询的数据参数
                success: function (msg) {


                }
            });

        }
        function chartjson(Slengths, datas) {
            Slengths = Slengths.split(',')
            var datass = datas;
            var titles = Title
            datas = eval('[' + datas + ']')
            var ED_List = "";
            var JsonList = "";
            JsonList += "";
            $.each(datas, function (index, obj) {
                if (ED_List != "") {
                    if (ED_List.indexOf(obj.name) < 0) {
                        ED_List += "," + obj.name;
                    }
                } else {
                    ED_List += obj.name;
                }
            });

            if (ED_List != "") {

                var ArrED = ED_List.split(',');
                if (ArrED != null && ArrED.length > 0) {

                    var JsonEntity = eval(datas);

                    for (var k = 0; k < ArrED.length; k++) {
                        var SexStr = "";
                        for (var j = 0; j < JsonEntity.length; j++) {

                            if (ArrED[k] == JsonEntity[j].name) {

                                if (SexStr == "" || SexStr == null) {
                                    SexStr += JsonEntity[j].data
                                } else {
                                    SexStr += "," + JsonEntity[j].data;
                                }

                            }

                        }

                        if (k != 0) {
                            JsonList += ",";
                        }
                        JsonList += "{name:\"" + ArrED[k] + "\",data\:[" + SexStr + "]}";
                    }
                }
            }
            JsonList = eval('[' + JsonList + ']')
            //alert(JsonList);
            $('#container').highcharts({
                title: {
                    text: Title,
                    x: -20 //center
                },

                xAxis: {
                    title: {
                        text: "作答次数"
                    },
                    categories: Slengths
                },
                yAxis: {
                    title: {
                        text: "状态"
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '分数'
                }, exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: JsonList
            });
        }
         
        //Highcharts
        function chartjsontype(Slengths, datas) {
            Slengths = Slengths.split(',')
            var datass = datas;
            var titles = Title
            datas = eval('[' + datas + ']')
            var ED_List = "";
            var JsonList = "";
            JsonList += "";
            var Numbers = 0;
            $.each(datas, function (index, obj) {
                if (ED_List != "") {
                    if (ED_List.indexOf(obj.name)<0) {
                        ED_List += "," + obj.name;
                    }
                    if (Numbers <= 0) {
                        if (obj.name == "成熟防御机制") {
                            Numbers++
                            ED_List += "," + obj.name;
                        }
                    }
                } 
                else {
                    ED_List += obj.name;
                }
            });

            if (ED_List != "") {

                var ArrED = ED_List.split(',');
                if (ArrED != null && ArrED.length > 0) {

                    var JsonEntity = eval(datas);

                    for (var k = 0; k < ArrED.length; k++) {
                        var SexStr = "";
                        for (var j = 0; j < JsonEntity.length; j++) {

                            if (ArrED[k] == JsonEntity[j].name) {

                                if (SexStr == "" || SexStr == null) {
                                    SexStr += JsonEntity[j].data
                                } else {
                                    SexStr += "," + JsonEntity[j].data;
                                }

                            }

                        }

                        if (k != 0) {
                            JsonList += ",";
                        }
                        JsonList += "{name:\"" + ArrED[k] + "\",data\:[" + SexStr + "]}";
                    }
                }
            }
            JsonList = eval('[' + JsonList + ']')
            //alert(JsonList);
            $('#container').highcharts({
                title: {
                    text: Title,
                    x: -20 //center
                },

                xAxis: {
                    title: {
                        text: "作答次数"
                    },
                    categories: Slengths
                },
                yAxis: {
                    title: {
                        text: "状态"
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '分数'
                }, exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: JsonList
            });
        }
        //转换大写
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
        function Export() {
            //var svgFirst;

            //chartFirst = $('#container').highcharts();
            //svgFirst = chartFirst.getSVG();
            //$.ajax({
            //    url: "Ajax/EvaluationFiles.ashx?type=SaveImage",
            //    type: "post",
            //    async: false,
            //    data: { svg: svgFirst },
            //    success: function (result) {
            //        var ImageSrc = "Ajax/image/" + result;

            //        var image = new Image();
            //        image.src = ImageSrc;
            //        image.onload = function () {
            //            var base64s = getBase64Image(image);
            //            $("#imagescr").attr("src", base64s);
            //            $("#container").hide();
            //            $("#ContainerImage").show();
            //            $("#pagecontent").wordExport(AmountName);
            //            $("#ContainerImage").hide();
            //            $("#container").show();
            //        }

            //        //WordExport();
            //    }
            //});
            var svgXml = $(".highcharts-container").html()

            var image = new Image();
            image.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgXml))); //给图片对象写入base64编码的svg流
            var base64 = image.src;
            $("#imagescr").attr("src", base64);
            $("#ContainerImage").show();
            $("#container").hide();
            var timeout = window.setTimeout(function () {
                $("#ContainerImage").show();
                $("#container").hide();
                $("#pagecontent").wordExport(AmountName);
                $("#ContainerImage").hide();
                $("#container").show();
                window.clearTimeout(timeout);
            }, 500)
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


            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
        }

        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
        function reti() {
            window.close();
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
       
    </script>
    <div class="col-md-12 col-sm-12" id="Print" style="padding-left: 0px;padding-right: 0px;">
        <div class="well" style="overflow-y: scroll">
            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;" id="pagecontent">
                <div class="col-md-12 col-sm-12  text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700; text-align: center;" id="ReportTitle"></h4>
                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        一、基本信息
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;" id="UserTable">
                        <table class="MsoTableGrid" style="border-collapse: collapse; width: 100%; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt;">
                            <tbody>
                                <tr>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                </tr>
                                <tr>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                </tr>
                                <tr>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        二、量表介绍
                    </div>
                    <div id="LB" style="margin-top: 15px; line-height: 30px; font-size: 12px;text-indent:2em;"></div>

                </div>


                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        三、历次作答记录
                    </div>
                    <div class="col-md-12">
                        <div id="GetTableID" style="margin-top: 15px;">

                            <table class="MsoTableGrid" style="border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%">
                                <tbody>
                                    <tr id="GetTR">
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">序号</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">时间</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">维度</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">得分</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">状态</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        四、心理测评趋势图
                    </div>
                    <div id="container" style="margin-top: 15px;">
                        <div  style="float:right">
                            <span>作答次数</span>
                        </div>
                    </div>
                    <div class="row" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <image id="imagescr" width="600px" height="400px"></image>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-5 col-sm-5 col-xs-5  text-right">
                <button type="button" class="btn btn-sm" style="background-color: orange; color: white" id="export" onclick="Export()">
                    导出 
                </button>
            </div>
            <div class="col-md-3 col-sm-2 col-xs-5 text-center">
                <button type="button" class="btn btn-primary btn-sm"  data-dismiss="modal" onclick="reti()">
                    关闭
                </button>
            </div>
        </div>
    </div>
</asp:Content>
