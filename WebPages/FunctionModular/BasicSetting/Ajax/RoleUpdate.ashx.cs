using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPages.projrem;
using WebPages.RoleService;
using System.Web.SessionState;
using WebPages.BasicSetting_UserInfo;
namespace WebPages.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// RoleUpdate 的摘要说明
    /// </summary>
    public class RoleUpdate : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            U_UserInfoEntity model = new U_UserInfoEntity();

            int Type = Convert.ToInt32(Common.GetRequest("type"));
            int RoleIDs = 2;
            string LoginName = "";
            int U_CreatePerson = 1;
            model.u_createperson = Common.GetSessionValue("loginName", context);
            if (model.u_createperson == null)
                return;
            int U_ID = Convert.ToInt32(context.Request["U_ID"]);
            switch (Type)
            {
                case 1:  //用户详细信息
                    string result = select(U_ID);
                    context.Response.Write(result);
                    break;
                case 2: //更新咨询师信息
                    model.role_type = context.Request["Role_Type"];
                    model._u_loginname = context.Request["U_LoginName"];
                    model._department_id = context.Request["Department_IDs"];
                    model._enterpriseCode = context.Request["EnterpriseCode"];
                    model._u_name = context.Request["U_Names"];
                    model._u_sex = context.Request["Sexs"];
                    model._student_id = context.Request["StudentIDs"];
                    model._u_birthday = Convert.ToDateTime(context.Request["birthdays"]).ToString("yyyy-MM-dd");
                    model._u_email = context.Request["Emails"];
                    model._u_tel = context.Request["tels"];
                    model._u_remark = context.Request["Remarks"];
                    model._u_parentsemail = context.Request["P_Emails"];
                    model._u_parentstel = context.Request["P_Tels"];
                    model._r_id = context.Request["RoleID"];
                    var data = DateTime.Now;
                    string da = data.ToString("yyyy-MM-dd");
                    model.u_createtime = da;
                    model._u_addfield = context.Request["U_AddField"];
                    model._u_id = Convert.ToInt32(context.Request["U_ID"]);
                    model._departmentauthority = context.Request["DA"];

                    model._enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                    if (model._enterpriseCode == null)
                        return;
                    string U_Age = ages(model._u_birthday);
                    bool resulres = userupdeta(model);
                    context.Response.Write(resulres);
                    break;
                case 3:  //修改得到成员信息
                    string results = selects(U_ID);
                    context.Response.Write(results);
                    break;
                case 4:  //判断是否开启功能
                    int IsOpen = Convert.ToInt32(context.Request["IsOpen"]);
                    context.Response.Write(UpdateRIsOpen(RoleIDs, IsOpen));
                    break;
                case 5:  //获取开启功能
                    context.Response.Write(GetIsOpen(model.u_createperson));
                    break;


            }

        }
        /// <summary>
        /// 添加年级
        /// </summary>
        /// <param name="birthdays"></param>
        /// <returns></returns>
        public string ages(string birthdays)
        {
            string m_Str = birthdays;
            int m_Y1 = DateTime.Parse(m_Str).Year;
            int m_Y2 = DateTime.Now.Year;
            string m_Age = Convert.ToString(m_Y2 - m_Y1);
            return m_Age;
        }
        /// <summary>
        /// 用户详细信息
        /// </summary>
        /// <param name="U_ID"></param>
        /// <returns></returns>
        public string select(int U_ID)
        {
            U_UserInfoEntity Model = new U_UserInfoEntity();
            U_UserInfoEntity ds = MgrServices.UserAddService.GetUserList(U_ID);
            //部门id
            Model._u_id = U_ID;
            if (ds._r_id != null && ds._r_id != "")
            {
                Model._r_id = ds._r_id;
            }
            Model._u_loginname = ds._u_loginname;
            Model._u_name = ds._u_name;
            Model._u_sex = ds._u_sex;
            Model._u_birthday = ds._u_birthday;
            Model._department_id = ds._department_id;
            Model._enterpriseCode = ds._enterpriseCode;
            Model._student_id = ds._student_id;
            Model._u_birthday = ds._u_birthday;
            Model._u_email = ds._u_email;
            Model._u_tel = ds._u_tel;
            Model._u_remark = ds._u_remark;    //成员描述
            Model._u_parentsemail = ds._u_parentsemail;
            Model._u_parentstel = ds._u_parentstel;
            Model.role_type = ds.role_type;
            Model.role_describe = ds.role_describe;
            Model._u_addfield = ds._u_addfield;
            Model._departmentauthority = ds._departmentauthority;
            Model._CouIntroduce = ds._CouIntroduce;
            Model._CouSkilledField = ds._CouSkilledField;
            Model._RFtype = ds._RFtype;
            string json = JsonConvert.SerializeObject(Model);
            return json;

        }
        /// <summary>
        /// 修改得到成员信息
        /// </summary>
        /// <param name="U_ID"></param>
        /// <returns></returns>
        public string selects(int U_ID)
        {
            U_UserInfoEntity Model = new U_UserInfoEntity();
            U_UserInfoEntity ds = MgrServices.UserAddService.GetEntitys(U_ID);
            //部门id
            Model._u_id = U_ID;
            Model._r_id = ds._r_id;
            Model._u_loginname = ds._u_loginname;
            Model._u_name = ds._u_name;
            Model._u_sex = ds._u_sex;
            Model._u_birthday = ds._u_birthday;
            Model._department_id = ds._department_id;
            Model._enterpriseCode = ds._enterpriseCode;
            Model._student_id = ds._student_id;
            Model._u_birthday = ds._u_birthday;
            Model._u_email = ds._u_email;
            Model._u_tel = ds._u_tel;
            Model._u_remark = ds._u_remark;    //成员描述
            Model._u_parentsemail = ds._u_parentsemail;
            Model._u_parentstel = ds._u_parentstel;
            Model.role_type = "";
            Model.role_describe = "";

            string json = JsonConvert.SerializeObject(Model);
            return json;

        }
        /// <summary>
        /// 更新咨询师信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static bool userupdeta(U_UserInfoEntity model)
        {
            bool result = false;
            // WebPages.UserInfoService.BasicSetting_UserInfoClient bsuf = new UserInfoService.BasicSetting_UserInfoClient();
            int GetFuntionType = 0;
            var RFType = 0;
            if (Common.GetRequest("GetFuntionType") != null)
            {
                GetFuntionType = Convert.ToInt32(Common.GetRequest("GetFuntionType"));
            }
            if (Common.GetRequest("RFType") != null)
            {
                RFType = Convert.ToInt32(Common.GetRequest("RFType"));
            }

            if (RFType == 2)
            {
                //一直都是咨询师
                CounselorModel CounselorModels = new CounselorModel();
                CounselorModels.CouIntroduce =Common.GetRequest("U_Consult") ;
                CounselorModels.CouSkilledField =Common.GetRequest("GoodField");
                CounselorModels.CounseType = GetFuntionType;
                result = MgrServices.UserAddService.UpdateUserInfoTwo(model, CounselorModels);
            }
            if (RFType == 3)
            {
                //之前是普通用户,现在是咨询师
                CounselorModel CounselorModels = new CounselorModel();
                CounselorModels.CouIntroduce = Common.GetRequest("U_Consult");
                CounselorModels.CouSkilledField = Common.GetRequest("GoodField");
                CounselorModels.CounseType = GetFuntionType;
                result = MgrServices.UserAddService.UpdateInsert(model, CounselorModels);
            }
            else if (RFType == 4)
            {
                //之前是咨询师角色,现在是普通用户或者其他管理员
                result = MgrServices.UserAddService.UpdateDelete(model);
            }
            else
            {
                //值更新用户详细信息表--一直都是用户
                result = MgrServices.UserAddService.UpdateUserInfo(model);
            }
            return result;
        }
        /// <summary>
        /// 判断是否开启功能
        /// </summary>
        /// <param name="RoleIDs"></param>
        /// <param name="IsOpen"></param>
        /// <returns></returns>
        public bool UpdateRIsOpen(int RoleIDs, int IsOpen)
        {
            WebPages.RoleService.RoleServiceClient brc = new WebPages.RoleService.RoleServiceClient();

            return brc.UpdateRIsOpen(RoleIDs, IsOpen);
        }
        /// <summary>
        /// 获取开启功能
        /// </summary>
        /// <param name="LoginName"></param>
        /// <returns></returns>


        public string GetIsOpen(string LoginName)
        {
            GetRoleModel model = new GetRoleModel();
            try
            {
                WebPages.RoleService.RoleServiceClient brc = new WebPages.RoleService.RoleServiceClient();
                RoleService.RoleEntity ds = brc.GetIsOpen(LoginName);
                if (ds.Role_Type != null)
                {
                    model.Role_Name = ds.Role_Name;
                }
                model.IsOpen = ds.Role_ID;
                string json = JsonConvert.SerializeObject(model);
                return json;
            }
            catch
            {
                string json = JsonConvert.SerializeObject(model);
                return json;
            }


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