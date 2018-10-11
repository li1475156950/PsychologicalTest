using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;
using WebPages.projrem;
namespace WebPages.FunctionModular.HeartEvaluation_DistributionRecord.Ajax
{
    /// <summary>
    /// DistributionRecord 的摘要说明
    /// </summary>
    public class DistributionRecord : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "LoadAmountName":  //查询授权的量表名称
                    LoadAmountName(context);
                    break;
                case "LoadAnswerStatusName":  //得到所有的审核状态
                    LoadAnswerStatusName(context);
                    break;

                case "Bind":  //初始化分配记录列表
                    InitiDistributeRecordTable(context);
                    break;
                case "DeleteDistributeRecord": //删除分配记录
                    DeleteDistributeRecord(context);
                    break;
                case "RemindByEmail":  //设置邮件提醒语
                    RemindByEmail(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 查询授权的量表名称
        /// </summary>
        /// <param name="context"></param>
        public void LoadAmountName(HttpContext context)
        {
            //string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
            //if (LicenseCode == null)
            //    return;
            //context.Response.Write(JsonConvert.SerializeObject(MgrServices.AmountService.GetAmountNameByE(LicenseCode)));
            string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (LicenseCode == null)
                return;
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.AmountService.GetAmountName()));
        }
        /// <summary>
        /// 得到所有的审核状态
        /// </summary>
        /// <param name="context"></param>
        public void LoadAnswerStatusName(HttpContext context)
        {
            try
            {
                context.Response.Write(JsonConvert.SerializeObject(MgrServices.AnswerStatusService.GetAllAnswerStatus()));
            }
            catch (Exception)
            {

                throw;
            }

        }
        /// <summary>
        /// 初始化分配记录列表
        /// </summary>
        /// <param name="context"></param>
        public void InitiDistributeRecordTable(HttpContext context)
        {
            int startPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
            int endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
            int amountID = Convert.ToInt32(Common.GetRequest("amountID"));
            int departmentID = Convert.ToInt32(Common.GetRequest("departmentID"));
            int ansID = Convert.ToInt32(Common.GetRequest("ansID"));
            string loginName = string.Empty;
            //  重新计算开始页码和结束页码
            if (startPageIndex > endPageIndex - startPageIndex)
            {
                startPageIndex = startPageIndex - 1;
                endPageIndex = endPageIndex - startPageIndex;
            }
            if (!string.IsNullOrEmpty(Common.GetRequest("loginName")))
            {
                loginName = Common.GetRequest("loginName");
            }
            DateTime? distriStartTime = null;
            if (!string.IsNullOrEmpty(Common.GetRequest("distriStartTime")))
            {
                distriStartTime = Convert.ToDateTime(Common.GetRequest("distriStartTime"));
            }
            else
            {
                distriStartTime = Convert.ToDateTime("1753-1-1");
            }
            DateTime? distriEndTime = null;
            if (!string.IsNullOrEmpty(Common.GetRequest("distriEndTime")))
            {
                distriEndTime = Convert.ToDateTime(Common.GetRequest("distriEndTime"));
            }
            else
            {
                distriEndTime = Convert.ToDateTime("1753-1-1");
            }
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                var userID = Convert.ToInt32(_uID);

                SourceTemps = MgrServices.DistributeRecordService.InitiDistributeRecordTable(userID, amountID, loginName, departmentID, distriStartTime, distriEndTime, ansID, startPageIndex, endPageIndex);
                if (SourceTemps.Tables[1].Rows.Count == 0)
                {
                    SourceTemps = MgrServices.DistributeRecordService.InitiDistributeRecordTable(userID, amountID, loginName, departmentID, distriStartTime, distriEndTime, ansID, startPageIndex, endPageIndex);
                }

                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    int i = 0;
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            i++;
                            string state = "";//1是未作答，2是已经作答
                            string AnswerEndTime = "";
                            if (DTR["Answer_states"].ToString() == null || DTR["Answer_states"].ToString() == "")
                            {
                                state = "未作答";
                            }
                            if (DTR["Answer_states"].ToString() == "1")
                            {
                                state = "未作答";
                            }
                            if (DTR["Answer_states"].ToString() == "2")
                            {
                                state = "已作答";
                            }
                            if (DTR["AnswerEndTime"].ToString() != null && DTR["AnswerEndTime"].ToString() != "" && DTR["AnswerEndTime"].ToString() != "1000/1/1 0:00:00")
                            {
                                AnswerEndTime = DTR["AnswerEndTime"].ToString();
                            }
                            
                            String[] arr =
                            {
                                "",
                                "<input class='checkDistri' data-uid='"+DTR["U_ID"]+"' type='checkbox' data-name='"+DTR["U_LoginName"]+"' id ='"+DTR["DistributionSetID"]+"'>",
                                (startPageIndex+i).ToString(),
                                DTR["Amount_DisplayName"].ToString(),
                                //DTR["Amount_DisplayName"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["D_name"].ToString(),
                                DTR["CreateTime"].ToString(),//分配时间
                                AnswerEndTime,
                                state,
                                ""//操作
                            };
                            page.data.Add(arr);

                        }


                    }
                }
                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            {
            }
        }
        /// <summary>
        /// 删除分配记录
        /// </summary>
        /// <param name="context"></param>
        public void DeleteDistributeRecord(HttpContext context)
        {
            var isSuccess = true;
            string[] str = Common.GetRequest("distriID").Split(',');
            for (int i = 0; i < str.Length; i++)
            {
                if (!string.IsNullOrEmpty(str[i]))
                {
                    if (!MgrServices.DistributeRecordService.DeleteDistributeRecord(Convert.ToInt32(str[i])))
                    {
                        isSuccess = false;
                        break;
                    }
                }
            }
            context.Response.Write(isSuccess);
        }
        /// <summary>
        /// 设置邮件提醒语
        /// </summary>
        /// <param name="context"></param>
        public void RemindByEmail(HttpContext context)
        {
            bool state = true;
            string[] receiveID = Common.GetRequest("receveid").Split(',');

            string content = "您有测评未进行测试！";
            if (Common.GetRequest("content") != null && Common.GetRequest("content") != "")
                content = "您有一个新的问卷未进行作答，请及时作答！";

            string subject = "测评提醒";
            string promptContent = "";
            for (int i = 0; i < receiveID.Length; i++)
            {
                if (!string.IsNullOrEmpty(receiveID[i]))
                {
                    string email = MgrServices.UserAddService.GetUserEmailByUserID(Convert.ToInt32(receiveID[i]));
                    if (email != null && email != "")
                    {
                        EmailHelper.SendEmail(email, subject, content);

                    }
                    else
                    {
                        var loginName = MgrServices.UserAddService.GetEntitys(Convert.ToInt32(receiveID[i]))._u_loginname;
                        if (i == receiveID.Length - 1)
                        {
                            promptContent += loginName;
                        }
                        else
                        {
                            promptContent += loginName + "、";
                        }
                        state = false;
                    }
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = state, Error = promptContent }));
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