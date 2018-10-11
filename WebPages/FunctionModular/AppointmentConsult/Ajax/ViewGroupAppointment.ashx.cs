using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebPages.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// ViewGroupAppointment 的摘要说明
    /// </summary>
    public class ViewGroupAppointment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "LoadAppointment":  //绑定排班信息列表
                    LoadAppointment(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 绑定排班信息列表
        /// </summary>
        /// <param name="context"></param>
        public void LoadAppointment(HttpContext context)
        {
            var startPageIndex = Convert.ToInt32(Common.GetRequest("startPageIndex"));
            var endPageIndex = Convert.ToInt32(Common.GetRequest("endPageIndex"));
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            //  重新计算开始页码和结束页码
            if (startPageIndex > endPageIndex - startPageIndex)
            {
                startPageIndex = startPageIndex - 1;
                endPageIndex = endPageIndex - startPageIndex;
            }
            PageInfo page = new PageInfo();
            DataSet SourceTemps = new DataSet();
            SourceTemps = MgrServices.AppointmentConsultService.GetViewAppointment(startPageIndex, endPageIndex, distriID);
            DataTable SourceTemp = new DataTable();
            if (SourceTemps != null && SourceTemps.Tables.Count > 0)
            {
                page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                SourceTemp = SourceTemps.Tables[1];
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    int i = 0;
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
                                DTR["ASName"].ToString(),
                                ""
                            };
                        page.data.Add(arr);

                    }

                }
            }
            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
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