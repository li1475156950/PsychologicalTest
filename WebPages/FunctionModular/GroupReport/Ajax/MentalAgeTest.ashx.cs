﻿using BR_Service;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using WebPages.projrem;
namespace WebPages.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// 心理年龄自测表
    /// </summary>
    public class MentalAgeTest : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "GetReportTitle":   //获取报告标题
                    GetReportTitle(context);
                    break;
                case "GetAmountIntroduce":  //获取报告介绍信息
                    GetAmountIntroduce(context);
                    break;
                case "LoadReportBasicInfo":  //加载报告基本信息
                    LoadReportBasicInfo(context);
                    break;
                case "GetScoreList":   //获取分数集合
                    GetScoreList(context);
                    break;
                case "InitiAverageStateTable":  //常模解释
                    InitiAverageStateTable(context);
                    break;
                case "GetAverageChartData":   //得到分数图表数据
                    GetAverageChartData(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 获取报告标题
        /// </summary>
        /// <param name="context"></param>

        public void GetReportTitle(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var reportTitle = MgrServices.GroupReportService.GetReportTitle(grID);
            context.Session["ReportTitle"] = reportTitle;
            context.Response.Write(reportTitle);

        }
        /// <summary>
        /// 获取报告介绍信息
        /// </summary>
        /// <param name="context"></param>
        public void GetAmountIntroduce(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var amountIntroduce = MgrServices.GroupReportService.GetAmountIntroduce(grID);
            context.Session["AmountIntroduce"] = amountIntroduce;
            context.Response.Write(amountIntroduce);
        }
        /// <summary>
        /// 常模解释
        /// </summary>
        /// <param name="context"></param>
       public void InitiAverageStateTable(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetUsersInnerAgeScore(grID);
            var DateList = MgrServices.GroupReportService.InitiInnerAgeTable(grID);
            var htmlContent = "";
            string strCate = "";
            List<object> ld = new List<object>();
            for (int i = 0; i < DateList.Count; i++)
            {
                htmlContent += "<tr><td>" + DateList[i].Cname + "</td><td>" + DateList[i].Cavg + "</td><td>" + DateList[i].Difference + "</td><td>" + DateList[i].Cmax + "</td><td>" + DateList[i].Cmin + "</td></tr>"; //统计团队平均状态数据

                ld.Add(Convert.ToDecimal(DateList[i].Cavg));  //统计平均值

                if (i == DateList.Count)   //统计项目名称
                {
                    strCate += DateList[i].Cname;
                }
                else
                {
                    strCate += DateList[i].Cname + ",";
                }

            }
            AverageScoreChartModel asc = new AverageScoreChartModel();
            asc.data = ld;
            asc.name = strCate;
            context.Session["AverageScoreChartModel"] = asc;
            context.Response.Write(htmlContent);
        }
        /// <summary>
       /// 加载报告基本信息
        /// </summary>
        /// <param name="context"></param>
        public void LoadReportBasicInfo(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var amountName = MgrServices.GroupReportService.GetReportTitle(grID);
            var reportCreateTime = MgrServices.GroupReportService.GetGroupReportCreateTime(grID);
            var listStr = MgrServices.GroupReportService.GetUserIDListAndAmountCode(grID);//根据GR_ID得到用户ID集合和量表Code
            context.Session["GRInfoList"] = listStr;
            var userIDListTemp = listStr[1];//用户ID集合字符串临时变量
            var dates = listStr[2];
            string[] dateArray = dates.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);//将用户ID集合字符串分割成用户ID数组
            var peopleCount = dateArray.Length;
            List<DateTime> ld = new List<DateTime>();
            for (int i = 0; i < dateArray.Length; i++)
            {
                if (!string.IsNullOrEmpty(dateArray[i]))
                {
                    ld.Add(Convert.ToDateTime(MgrServices.GroupReportService.GetAnswerCreateTimeByUID(Convert.ToInt32(dateArray[i]))));
                }
            }
            var maxTime = ld[0];
            var minTime = ld[0];
            for (int i = 0; i < ld.Count; i++)
            {
                if (maxTime < ld[i])
                {
                    maxTime = ld[i];
                }
                if (minTime > ld[i])
                {
                    minTime = ld[0];
                }
            }
            List<string> ls = new List<string>();
            ls.Add("测试量表：" + amountName);
            ls.Add("测评人数：" + peopleCount);
            ls.Add("生成时间：" + reportCreateTime);
            ls.Add("测评日期：" + minTime.ToString("d") + "-" + maxTime.ToString("d"));
            context.Session["BasicInfoTableData"] = ls;
            var htmlContent = "<tr><td>测试量表：" + amountName + "</td><td>测评人数：" + peopleCount + "</td></tr><tr><td>生成时间：" + Convert.ToDateTime(reportCreateTime).ToString("d") + "</td><td>测评日期：" + minTime.ToString("d") + "-" + maxTime.ToString("d") + "</td>";
            context.Response.Write(htmlContent);
        }
        /// <summary>
        /// 获取分数集合
        /// </summary>
        /// <param name="context"></param>
        public void GetScoreList(HttpContext context)
        {
            var answerIDList = (context.Session["GRInfoList"] as List<string>)[2].Split(',');
            var userIDList = (context.Session["GRInfoList"] as List<string>)[1].Split(',');
            var scoreList = new List<int>();
            var ageList = new List<int>();
            for (int i = 0; i < answerIDList.Length; i++)
            {
                if(!string.IsNullOrEmpty(answerIDList[i]))
                {
                    scoreList.Add(MgrServices.GroupReportService.GetScoreByAnswerID(Convert.ToInt32(answerIDList[i])));
                ageList.Add(Common.CalculateAgeCorrect(Convert.ToDateTime(MgrServices.UserAddService.GetEntitys(Convert.ToInt32(userIDList[i]))._u_birthday),DateTime.Now));
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(new { ScoreList=scoreList,AgeList=ageList}));

        }
        /// <summary>
        /// 得到分数图表数据
        /// </summary>
        /// <param name="context"></param>
        public void GetAverageChartData(HttpContext context)
        {
            var modelJson = context.Session["AverageScoreChartModel"] as AverageScoreChartModel;
            context.Response.Write(JsonConvert.SerializeObject(modelJson));

        }
        //获取比率表横坐标项目名
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}