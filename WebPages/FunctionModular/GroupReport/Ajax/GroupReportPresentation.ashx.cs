using BR_Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Collections;
using WebPages.projrem;
using System.IO;
using System.Text;
using System.Drawing.Imaging;
using Svg;
using System.Drawing;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.Web.SessionState;
using Word;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Data;
namespace WebPages.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// 通用量表
    /// </summary>
    public class GroupReportPresentation : IHttpHandler, IRequiresSessionState
    {
        List<UserDimensionScoreModel<string>> lus = new List<UserDimensionScoreModel<string>>();
        string amountCode;

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
            long s;
            switch (operationType)
            {
                case "GetReportTitle":         //得到团体报告名称
                    GetReportTitle(context);  
                    break;
                case "GetAmountIntroduce":       //得到团体报告介绍
                    GetAmountIntroduce(context);
                    break;
                case "InitiAverageStateTable":          //常模解释
                    InitiAverageStateTable(context);  
                    break;
                case "InitialPeopleSpread":
                    InitialPeopleSpread(context);   //人员分布数据
                    break;
                case "GetAverageChartData":        // 取团队平均状态数据
                    GetAverageChartData(context);
                    break;
                case "LoadReportBasicInfo":                //加载报告基本信息
                    LoadReportBasicInfo(context);
                    break;
                case "GetCategory":        //获取比率表横坐标项目名
                    GetCategory(context);
                    break;
                case "GetRateData":  //加载图表数据
                    GetRateData(context);
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
        /// 得到团体报告介绍
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
            var lus = MgrServices.GroupReportService.GetUsersCommDimensionScore(grID,enterpriseCode);
            var DateList = MgrServices.GroupReportService.InitiCommAverageStateTable(grID, enterpriseCode);
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
        /// 人员分布数据
        /// </summary>
        /// <param name="context"></param>
         public void InitialPeopleSpread(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var HtmlContent = MgrServices.GroupReportService.InitialCommSpread(grID, enterpriseCode);
            context.Session["HtmlContent"] = HtmlContent;
            context.Response.Write(context.Session["HtmlContent"]);
        }
        /// <summary>
        /// 获取团队平均状态数据
        /// </summary>
        /// <param name="context"></param>
        public void GetAverageChartData(HttpContext context)
        {
            var modelJson = context.Session["AverageScoreChartModel"] as AverageScoreChartModel;
            context.Session["modelJson"] = modelJson;
            context.Response.Write(JsonConvert.SerializeObject(context.Session["modelJson"]));

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
        /// 加载图表数据
        /// </summary>
        /// <param name="context"></param>
        public void GetRateData(HttpContext context)
        {
             var grID = Convert.ToInt32(Common.GetRequest("grID"));
             var RateList = MgrServices.GroupReportService.GetCommRateData(grID, enterpriseCode);
             context.Response.Write(JsonConvert.SerializeObject(RateList));
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