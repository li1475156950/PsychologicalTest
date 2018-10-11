using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using WebPages.projrem;
using System.Web.SessionState;
namespace WebPages.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// 生活事件
    /// </summary>
    public class LifeEvent : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "GetReportTitle":  //加载报告报告名称
                    GetReportTitle(context);
                    break;
                case "GetAmountIntroduce":  //加载报告介绍信息
                    GetAmountIntroduce(context);
                    break;
                case "LoadReportBasicInfo":  //加载报告基本信息
                    LoadReportBasicInfo(context);
                    break;
                case "InitiAverageStateTable":  //常模解释
                    InitiAverageStateTable(context);
                    break;
                case "GetScoreList":  //获取分数列表
                    GetScoreList(context);
                    break;
                case "GetAverageChartData":   // 得到分数图表数据
                    GetAverageChartData(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 加载报告报告名称
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
        /// 加载报告介绍信息
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
            var lus = MgrServices.GroupReportService.GetUsersLifeScore(grID);
            var DateList = MgrServices.GroupReportService.InitiLifeAverageStateTable(grID);
            var htmlContent = "";
            string strCate = "";
            List<object> ld = new List<object>();
            for (int i = 0; i < DateList.Count; i++)
            {
                htmlContent += "<tr><td>" + DateList[i].Cname + "</td><td>" + DateList[i].Cavg + "</td><td>" + DateList[i].Difference + "</td><td>" + DateList[i].Cmax + "</td><td>" + DateList[i].Cmin + "</td></tr>"; //统计团队平均状态数据

                ld.Add(DateList[i].Cavg);  //统计平均值

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
        /// 获取分数列表
        /// </summary>
        /// <param name="context"></param>
        public void GetScoreList(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetUsersLifeScore(grID);
            List<decimal> ld = new List<decimal>();
            for (int i = 0; i < lus.Count; i++)
            {
                foreach (var item in lus[i].DimensionAndScore)
                {
                    ld.Add(item.Value);
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(ld));
        }
        /// <summary>
        /// 加载报告基本信息
        /// </summary>
        /// <param name="context"></param>
        public void LoadReportBasicInfo(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var html = MgrServices.GroupReportService.LoadLifeBasicInfo(grID);
            context.Response.Write(html);
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
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}