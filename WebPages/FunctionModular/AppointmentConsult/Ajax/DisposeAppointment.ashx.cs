using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebPages.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// DisposeAppointment 的摘要说明
    /// </summary>
    public class DisposeAppointment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "LoadAppointment":   //得到预约信息列表
                    LoadAppointment(context); 
                    break;
                case "GetAppointmentInfo":  //得到处理预约中的查看信息
                    GetAppointmentInfo(context);
                    break;
                case "AcceptApply":        // 获取预约人数和处理预约人数
                    AcceptApply(context);
                    break;
                case "RefuseApply":        //拒绝预约
                    RefuseApply(context);
                    break;
                case "GetAppointmentHeaderInfo":  //得到预约的表头信息
                    GetAppointmentHeaderInfo(context);
                    break;
                case "GetAwaitStateAppointment":  //据排班信息获取用户ID 和预约ID
                    GetAwaitStateAppointment(context);
                    break;
                case "GetServiceUserCount":  //根据排班ID 获取排班服务用户数量
                    GetServiceUserCount(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 得到预约信息列表
        /// </summary>
        /// <param name="context"></param>
        public void LoadAppointment(HttpContext context)
        {
            var startPageIndex = Convert.ToInt32(Common.GetRequest("startPageIndex"));
            var endPageIndex = Convert.ToInt32(Common.GetRequest("endPageIndex"));
            if (startPageIndex > endPageIndex - startPageIndex)
            {
                startPageIndex = startPageIndex - 1;
                endPageIndex = endPageIndex - startPageIndex;
            }
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            PageInfo page = new PageInfo();
            DataSet SourceTemps = new DataSet();
            SourceTemps = MgrServices.AppointmentConsultService.GetAppointment(startPageIndex, endPageIndex, distriID);
            DataTable SourceTemp = new DataTable();
            if (SourceTemps != null && SourceTemps.Tables.Count > 0)
            {
                page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                SourceTemp = SourceTemps.Tables[1];
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    var i = 0;
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        i++;
                        String[] arr =
                            {   
                                "<input type='checkbox' class='childCheck' data-appID = '"+DTR["APPID"]+"' data-userID='"+DTR["UserID"]+"'/>",
                                (startPageIndex+i).ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["U_Sex"].ToString(),
                                DTR["D_name"].ToString(),
                                DTR["QTName"].ToString(),
                                "",//操作
                                DTR["ASName"].ToString()
                            };
                        page.data.Add(arr);

                    }

                }
            }
            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
        }
        /// <summary>
        /// 得到处理预约中的查看信息
        /// </summary>
        /// <param name="context"></param>
        public void GetAppointmentInfo(HttpContext context)
        {
            var appID = Convert.ToInt32(Common.GetRequest("appID"));
            var model = MgrServices.AppointmentConsultService.GetAppointmentInfo(appID);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        /// <summary>
        /// 获取预约人数和处理预约人数
        /// </summary>
        /// <param name="context"></param>
        public void AcceptApply(HttpContext context)
        {
            var appIDArray = Common.GetRequest("appID").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var peopleCount = MgrServices.AppointmentConsultService.GetAppointmentPeopleCount(distriID);
            var serviceUserCount = MgrServices.AppointmentConsultService.GetExpectationServicePeopleCount(distriID);
            var length = appIDArray.Length;
            var throughtCreditPeopleCount = 0;
            var result = 0;
            var isSuccess = true;
            if (length > peopleCount&&peopleCount!=0&&serviceUserCount!=0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "选择人数超过剩余名额" }));
                context.Response.End();
            }
            for (int i = 0; i < length; i++)
            {
                result = MgrServices.AppointmentConsultService.AcceptApply(distriID,Convert.ToInt32(appIDArray[i]));
                if (result > 0)
                {
                    throughtCreditPeopleCount = MgrServices.AppointmentConsultService.GetThroughtCreditPeopleCount(distriID);
                }
                else
                {
                    isSuccess = false;
                    break;
                }
            }
            if (isSuccess)
            {


                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = serviceUserCount-throughtCreditPeopleCount, ServiceUserCount = serviceUserCount }));

            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "未知原因引发的错误，可能只成功了部分人的请求，请刷新页面后再处理" }));
            }


        }
        /// <summary>
        /// 拒绝预约的方法
        /// </summary>
        /// <param name="context"></param>
        public void RefuseApply(HttpContext context)
        {
            var appID = Convert.ToInt32(Common.GetRequest("appID"));
            var refuseReason = Common.GetRequest("refuseReason");
            var result = MgrServices.AppointmentConsultService.RefuseApply(appID, refuseReason);
            if (result > 0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
        }
        /// <summary>
        /// 得到预约的表头信息
        /// </summary>
        /// <param name="context"></param>
        public void GetAppointmentHeaderInfo(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var model = MgrServices.AppointmentConsultService.GetAppointmentHeaderInfo(distriID);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        /// <summary>
        /// 根据排班信息获取用户ID 和预约ID
        /// </summary>
        /// <param name="context"></param>
        public void GetAwaitStateAppointment(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var tempList = MgrServices.AppointmentConsultService.GetAwaitStateAppointment(distriID);
            context.Response.Write(JsonConvert.SerializeObject(tempList));
        }
        /// <summary>
        /// 根据排班ID 获取排班服务用户数量
        /// </summary>
        /// <param name="context"></param>
        public void GetServiceUserCount(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var serviceUserCount = MgrServices.AppointmentConsultService.GetExpectationServicePeopleCount(distriID);
            context.Response.Write(serviceUserCount);
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