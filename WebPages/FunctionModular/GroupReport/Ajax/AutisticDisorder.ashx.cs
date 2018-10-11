using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPages.projrem;
using System.Web.SessionState;
using System.Text;
using System.Data;
using System.Collections;
namespace WebPages.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// 儿童孤独障碍量表
    /// </summary>
    public class AutisticDisorder : IHttpHandler, IRequiresSessionState
    {
        List<UserDimensionScoreModel<string>> lus = new List<UserDimensionScoreModel<string>>();
        
        string enterpriseCode;

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "GetReportTitle":  //得到团体报告名称
                    GetReportTitle(context);
                    break;
                case "GetAmountIntroduce":  //得到团体报告介绍信息
                    GetAmountIntroduce(context);
                    break;
                case "InitiAverageStateTable":  //得到常模解释集合
                    InitiAverageStateTable(context);
                    break;
                case "GetAverageChartData":  //得到分数图表数据
                    GetAverageChartData(context);
                    break;
                case "LoadReportBasicInfo":  //加载报告基本信息
                    LoadReportBasicInfo(context);
                    break;
                case "GetCategory":  //获取比率表横坐标项目名
                    GetCategory(context);
                    break;
                case "GetScoreList":  //得到分数集合
                    GetScoreLists(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 得到团体报告名称
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
        /// 得到团体报告介绍信息
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
            Dictionary<string, string> dimensionName = new Dictionary<string, string>();//维度Code和维度名称
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetChildrenSolitudeScore(grID, enterpriseCode);
            var DateList = MgrServices.GroupReportService.InitiAverageStateTable(grID, enterpriseCode);
            dimensionName = MgrServices.GroupReportService.dimensionName(grID, enterpriseCode);
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
            context.Session["DimensionName"] = dimensionName;
            context.Response.Write(htmlContent);
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
            if (dates[dates.Length - 1] == ',')
                dates = dates.Remove(dates.Length - 1);

            var maxMinTime = MgrServices.GroupReportService.GetAnswerCreateTimeByUIDList("(" + dates + ")");

            var maxTime = Convert.ToDateTime(maxMinTime[0]);
            var minTime = Convert.ToDateTime(maxMinTime[1]);

            var htmlContent = "<tr><td>测试量表：" + amountName + "</td><td>测评人数：" + peopleCount + "</td></tr><tr><td>生成时间：" + Convert.ToDateTime(reportCreateTime).ToString("d") + "</td><td>测评日期：" + minTime.ToString("d") + "-" + maxTime.ToString("d") + "</td>";
            context.Response.Write(htmlContent);
        }
        /// <summary>
        /// 获取比率表横坐标项目名
        /// </summary>
        /// <param name="context"></param>
        public void GetCategory(HttpContext context)
        {
            context.Response.Write(JsonConvert.SerializeObject(context.Session["DimensionName"]));
        }
        /// <summary>
        /// 获取分数列表
        /// </summary>
        /// <param name="context"></param>
        public void GetScoreLists(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetChildrenSolitudeScore(grID, enterpriseCode);
            var GetScoreList = MgrServices.GroupReportService.GetScoreList(grID, enterpriseCode);
            context.Response.Write(GetScoreList);
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