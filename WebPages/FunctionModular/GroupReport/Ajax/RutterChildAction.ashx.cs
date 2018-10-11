using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using WebPages.projrem;
using System.Text;
namespace WebPages.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// Rutter儿童行为调查表
    /// </summary>
    public class RutterChildAction : IHttpHandler, IRequiresSessionState
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
                case "GetAmountIntroduce":   //获取介绍信息
                    GetAmountIntroduce(context);
                    break;
                case "LoadReportBasicInfo":  //加载报告基本信息
                    LoadReportBasicInfo(context);
                    break;
                case "GetUsersDimensionScore":   //加载图表数据
                    GetUsersDimensionScore(context);
                    break;
                case "GetRateData":      //获取分布比率数据
                    GetRateData(context);
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
        /// 获取介绍信息
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
        /// 加载图表数据
        /// </summary>
        /// <param name="context"></param>
        public void GetUsersDimensionScore(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetRutterChildrensDimensionScore(grID);
            context.Response.Write(lus);
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
        /// 获取分布比率数据
        /// </summary>
        /// <param name="context"></param>
        public void GetRateData(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetRutterChildrensDimensionScore(grID);
            decimal normalCount = 0;
            decimal actionOfACount = 0;
            decimal actionOfNCount = 0;
            decimal actionOfMCount = 0;
            for (int i = 0; i < lus.Count; i++)
            {
                decimal totalScore = 0;
                foreach (var item in lus[i].DimensionAndScore)
                {
                    totalScore += item.Value;
                }
                if (totalScore < 9)
                {
                    normalCount++;
                }
                if (totalScore >= 9 && (lus[i].DimensionAndScore["WD_14811918318088"] > lus[i].DimensionAndScore["WD_14811918557098"]))
                {
                    actionOfACount++;
                }
                if (totalScore >= 9 && (lus[i].DimensionAndScore["WD_14811918318088"] < lus[i].DimensionAndScore["WD_14811918557098"]))
                {
                    actionOfNCount++;
                }
                if (totalScore >= 9 && (lus[i].DimensionAndScore["WD_14811918318088"] == lus[i].DimensionAndScore["WD_14811918557098"]))
                {
                    actionOfMCount++;
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(new { NormalRate = normalCount / (decimal)lus.Count, ActionOfARate = actionOfACount / (decimal)lus.Count, ActionOfNRate = actionOfNCount / (decimal)lus.Count, ActionOfMRate = actionOfMCount / (decimal)lus.Count, NormalCount = normalCount, ActionOfACount = actionOfACount, ActionOfNCount = actionOfNCount, ActionOfMCount = actionOfMCount }));
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}