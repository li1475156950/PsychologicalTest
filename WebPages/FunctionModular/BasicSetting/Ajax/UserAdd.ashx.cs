using BR_Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPages.projrem;
using System.Web.SessionState;
using WebPages.BasicSetting_UserInfo;

namespace WebPages.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// UserAdd 的摘要说明
    /// </summary>
    public class UserAdd : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            bool result = false;
            try
            {
                U_UserInfoEntity model = new U_UserInfoEntity();
                model._department_id = context.Request["Department_ID"];
                model._enterpriseCode = context.Request["EnterpriseCode"];
                model._u_loginname = context.Request["U_LoginName"];
                model._u_password = context.Request["U_Password"];
                model._u_name = context.Request["U_Name"];
                model._u_sex = context.Request["U_Sex"];
                model._student_id = context.Request["Student_ID"];
                model._u_birthday = Convert.ToDateTime(context.Request["U_Birthday"]).ToString("yyyy-MM-dd");
                model._u_email = context.Request["U_EMail"];
                model._u_tel = context.Request["U_Tel"];
                model._u_parentstel = context.Request["U_ParentsTel"];
                model._u_parentsemail = context.Request["U_ParentsEMail"];
                model._r_id = context.Request["R_ID"];
                model._u_age = ages(model._u_birthday);
                model._u_remark = context.Request["U_Remark"];
                model._u_addfield = context.Request["U_AddField"];
                model._departmentauthority = context.Request["DA"];
                model._enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (model._enterpriseCode == null)
                    return;
                model.u_createperson = Common.GetSessionValue("loginName", context);
                if (model.u_createperson == null)
                    return;
                result = Adduser(model,context);
            }
            catch
            { }

            context.Response.Write(result);

        }
        /// <summary>
        /// 添加用户信息
        /// </summary>
        /// <param name="model"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public bool Adduser(U_UserInfoEntity model,HttpContext context)
        {
            int GetFuntionType = 0;
          
            bool result = false;
            if (Common.GetRequest("GetFuntionType") != null)
            {
                GetFuntionType = Convert.ToInt32(Common.GetRequest("RFType"));
            }
            BasicSetting_UserInfoClient bsuf = new BasicSetting_UserInfoClient();

            model._u_password = MD5Helper.Upper32(model._u_password);
            if (model._u_sex == "0")
            {
                model._u_sex = "男";
            }
            else if (model._u_sex == "1")
            {
                model._u_sex = "女";
            }
            model._u_auditstate = "1";
            model._u_mark_delete = "0";
            model._u_str = "0";


         
            if (GetFuntionType == 4)
            {
                CounselorModel CounselorModels = new CounselorModel();
                CounselorModels.CouIntroduce = Common.GetRequest("U_Consult");
                CounselorModels.CouSkilledField = Common.GetRequest("GoodField");
                CounselorModels.CounseType = GetFuntionType;
                result = MgrServices.UserAddService.U_UserInfoAddTwo(model, CounselorModels);
            }
            else
            {
                result = MgrServices.UserAddService.U_UserInfoAdd(model);
            }
            return result;

        }

        public string ages(string U_Birthday)
        {
            string m_Str = U_Birthday;
            int m_Y1 = DateTime.Parse(m_Str).Year;
            int m_Y2 = DateTime.Now.Year;
            string m_Age = Convert.ToString(m_Y2 - m_Y1);
            return m_Age;
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