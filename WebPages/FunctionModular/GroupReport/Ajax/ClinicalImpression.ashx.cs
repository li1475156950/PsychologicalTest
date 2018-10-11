                                                                 using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using WebPages.projrem;
namespace WebPages.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// 临床总体印象量表（CGI）
    /// </summary>
    public class ClinicalImpression : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            
            string operationType = context.Request["operationType"].ToString();

            System.Reflection.MethodInfo methodInfo = this.GetType().GetMethod(operationType);
            if (methodInfo != null)
            {
                methodInfo.Invoke(this, new object[] { context });
            } 
        }
        /// <summary>
        /// 得到报告名称
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
        /// 得到报告的介绍信息
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
        ///  常模解释
        /// </summary>
        /// <param name="context"></param>
        public void InitiAverageStateTable(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetClinicalScore(grID);
            var DateList = MgrServices.GroupReportService.InitiClinicalAverageStateTable(grID);
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
        /// 获取比率表横坐标项目名
        /// </summary>
        /// <param name="context"></param>
        public void GetRateData(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var lus = MgrServices.GroupReportService.GetClinicalScore(grID);
            var GetScoreList = MgrServices.GroupReportService.GetClinicalData(grID);
            context.Response.Write(GetScoreList);
        }
        /// <summary>
        /// 获取图表基础数据
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