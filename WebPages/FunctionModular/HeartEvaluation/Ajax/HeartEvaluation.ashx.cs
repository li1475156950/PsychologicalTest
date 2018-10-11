using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace WebPages.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string Type = Common.GetRequest("type");
            switch (Type)
            {
                case "init":  // 初始化量表数据集合
                    int Amount_TypeID = 0;
                    int Amount_Source = 0;
                    int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));

                    string Amount_Name = Convert.ToString(context.Request["Amount_Name"]);
                    string EnterpriseCode = "";
                    if (Convert.ToInt32(context.Request["Amount_TypeID"]) != 0)
                    {
                        Amount_TypeID = Convert.ToInt32(context.Request["Amount_TypeID"]);
                    }
                    if (Convert.ToInt32(context.Request["Amount_Source"]) != 0)
                    {
                        Amount_Source = Convert.ToInt32(context.Request["Amount_Source"]);
                    }
                    if (context.Session["EnterpriseCode"] != null)
                    {
                        EnterpriseCode = context.Session["EnterpriseCode"].ToString();
                    }
                    InitGaugePages(Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex, EnterpriseCode, context);
                    break;
                case "DelAmount":  //将数据删除到回收站
                    string Acode = Common.GetRequest("ACode");
                    int Aid = Convert.ToInt32(Common.GetRequest("AId"));
                    string Aname = Common.GetRequest("AName");
                    DelAmount(Acode, Aid, Aname, context);
                    break;
                case "JundgeIsAlter":  //得到用户角色类型
                    JundgeIsAlter(context);
                    break;

            }
        }

        /// <summary>
        /// 将数据删除到回收站
        /// </summary>
        public void DelAmount(string Acode, int Aid, string Aname, HttpContext context)
        {
            int result = 0;
            try
            {
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                WebPages.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                model.RBTitle = "删除量表管理-" + Aname; //标题
                model.RBModularID = 14; //对应模块权限ID
                model.RBTableName = "Amount_Info"; //删除的表名
                model.RBFieldName = "Amount_ID"; //删除相对应字段的id
                model.RBFieldValue = Aid.ToString(); //删除列名的id
                model.RBDeleteFieldName = "Is_Delete"; //表的删除字段一般 某某某_Delete
                model.RBDeleteTime = DateTime.Now;
                model.EnterpriseCode = enterpriseCode;
                model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                if (model.RBExcutePerson == null)
                {
                    context.Response.Write(result);
                    return;
                }
                result = MgrServices.RecycleBinService.PutDataInRecycleBin(model) == true ? 1 : 0;
                //int result = MgrServices.AmountService.DisplayAmount(Acode);
                context.Response.Write(result);

            }
            catch
            {
                context.Response.Write(result);
            }
        }

        /// <summary>
        /// 创建时间：2016-09-07
        /// 功能介绍：根据相关的页面参数，查询量表数据集合
        /// </summary>
        /// <param name="Amount_TypeID">量表类型ID</param>
        /// <param name="Amount_Name">量表名称</param>
        /// <param name="Amount_Source">量表来源</param>
        /// <param name="StarPageIndex">开始页码</param>
        /// <param name="EndPageIndex">结束页码</param>
        /// <returns></returns>
        private DataSet GetGaugeTemp(HttpContext context, int Amount_TypeID, string Amount_Name, int Amount_Source, int StarPageIndex, int EndPageIndex)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (LicenseCode == null)
                    return null;
                SourceTemp = MgrServices.AmountService.GetAmountTemp(Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex, LicenseCode);
            }
            catch
            {

            }

            return SourceTemp;
        }

        /// <summary>
        /// 初始化量表数据集合
        /// </summary>
        /// <param name="context"></param>
        private void InitGaugePages(int Amount_TypeID, string Amount_Name, int Amount_Source, int StarPageIndex, int EndPageIndex, string EnterpriseCode, HttpContext context)
        {

            try
            {


                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                //  重新计算开始页码和结束页码
                if (StarPageIndex > EndPageIndex - StarPageIndex)
                {
                    StarPageIndex = StarPageIndex - 1;
                    EndPageIndex = EndPageIndex - StarPageIndex;
                }
                SourceTemps = GetGaugeTemp(context, Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        var Roletype=  "";
                        var IsDelete = "";
                        var loginname="";
                        if (context.Session["role_type"] != null)
                        {
                            Roletype = context.Session["role_type"].ToString();
                        }
                        if(context.Session["loginName"] !=null)
                        {
                            loginname=context.Session["loginName"].ToString();
                        }
                        int i = 0;
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            
                            i++;
                            string SourceName = "";
                            string A_Soure = "";
                            A_Soure = DTR["Amount_Source"] == DBNull.Value || DTR["Amount_Source"].ToString() == "" ? "0" : DTR["Amount_Source"].ToString();
                            
                            double Speed = 0;
                            Speed = 1 + Convert.ToInt32(DTR["Speed"].ToString());
                            //string Createpeple=DTR["Start_ApplyPeoples"].ToString();
                            string Createpeple = DTR["AmountCreatePersonName"].ToString();
                            if (Roletype == "1" || loginname == Createpeple)
                            {
                                IsDelete = "1";
                            }
                            else
                                IsDelete = "";
                            switch (A_Soure)
                            {
                                case "0":
                                    SourceName = "未知";
                                    Speed = 100;
                                    break;
                                case "1":
                                    SourceName = "系统量表";
                                    Speed = 100;
                                    break;
                                case "2":
                                    SourceName = "组合量表";
                                    Speed = (Speed / 3.00) * 100;
                                    break;
                                case "3":
                                    SourceName = "自编量表";
                                    Speed = (Speed / 4.00) * 100;
                                    break;

                            }

                            String[] arr =
                            {
                                DTR["Amount_Code"].ToString(), //量表ID 
                                "", //选框
                                (StarPageIndex+i).ToString(),//序号	
                                DTR["Amount_Name"].ToString(),//量表名称
                                DTR["Amount_DisplayName"].ToString(),//显示名称
                                DTR["AmountType_Name"].ToString(),//量表类别
                                //DTR["Amount_SubjectNum"].ToString(),//题目数量
                                MgrServices.AmountService.GetSubjectCountByAmountCode(DTR["Amount_Code"].ToString()),
                               DTR["Start_ApplyPeoples"].ToString(),//+"-"+ DTR["End_ApplyPeoples"].ToString(),//适用人群 
                                SourceName,//量表来源
                                DTR["AmountCreatePersonName"].ToString(),
                                Speed.ToString(),//量表完成度
                                "",//操作
                                EnterpriseCode,
                                DTR["Amount_ID"].ToString(),//量表ID
                                IsDelete
                            };
                            page.data.Add(arr);


                        }

                        //       <option value="0">不限</option>
                        //<option value="1">系统量表</option>
                        //<option value="2">组合量表</option>
                        //<option value="3">自编量表</option>
                    }
                }
                page.recordsFiltered = page.recordsTotal;
                List<string[]> result = page.data.Distinct().ToList();
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            {

            }
        }
        /// <summary>
        /// 得到用户角色类型
        /// </summary>
        /// <param name="context"></param>
        public void JundgeIsAlter(HttpContext context)
        {
            var loginName = Common.GetSessionValue("loginName", context);
            if (loginName == null)
                return;
            var currentLoginName = Common.GetRequest("loginName");
            string _userID = Common.GetSessionValue("UserID", context);
            if (_userID == null)
                return;
            var currentUserID = Convert.ToInt32(_userID);
            var roleType = Convert.ToInt32(MgrServices.UserAddService.GetUserRoleType(currentUserID));
            if (roleType == 1)
            {
                context.Response.Write(true);
                context.Response.End();
            }
            if (loginName == currentLoginName)
            {
                context.Response.Write(true);
                context.Response.End();
            }
            context.Response.Write(false);
            context.Response.End();
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