using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.SessionState;
using WebPages.BasicSetting_UserInfo;
using WebPages.projrem;

namespace WebPages.FunctionModular.PersonalInfo.Ajax
{
    /// <summary>
    /// PersonalInfo 的摘要说明
    /// </summary>
    public class PersonalInfo : IHttpHandler, IRequiresSessionState
    {


        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "SaveFile":  //保存文件
                    SaveFile(context);  
                    break;
                case "LoadUserInfo":  //加载用户信息
                    LoadUserInfo(context);
                    break;
                case "LoadUserPic":  //加载用户头像
                    LoadUserPic(context);
                    break;
                case "Update":  //修改
                    Update(context);
                    break;
                case "CheckCurrentPwd":  //记住当前登录的密码
                    CheckCurrentPwd(context);
                    break;
                case "AlterPwd":  // 修改密码
                    AlterPwd(context);
                    break;
                case "LoadDepartmentFun":  //看当前用户是否为管理员,并返回其所拥有的权限
                    LoadDepartmentFun(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 保存文件
        /// </summary>
        /// <param name="context"></param>
        public void SaveFile(HttpContext context)
        {
            string basePath = "/upload/";
            string name;
            basePath = System.Web.HttpContext.Current.Server.MapPath(basePath);
            HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            if (!System.IO.Directory.Exists(basePath))
            {
                System.IO.Directory.CreateDirectory(basePath);
            }
            var suffix = files[0].ContentType.Split('/');
            //获取文件格式  
            //var _suffix = suffix[1].Equals("jpeg", StringComparison.CurrentCultureIgnoreCase) ? "" : suffix[1];
            var _suffix = suffix[1] + "" + DateTime.Now.Ticks;
            var _temp = DateTime.Now.Ticks + System.Web.HttpContext.Current.Request["name"];
            //如果不修改文件名，则创建随机文件名  
            if (!string.IsNullOrEmpty(_temp))
            {
                name = _temp;
            }
            else
            {
                Random rand = new Random(24 * (int)DateTime.Now.Ticks);
                name = rand.Next() + "." + _suffix;
            }
            
            var full = basePath + name;
            files[0].SaveAs(full);
            context.Session["U_Img"] = full;
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;

            string ip = ConfigurationManager.AppSettings["IISPath"].ToString();  // 获取服务器IP
            us._u_img = "/upload/" + name + "";   // 保存相对路径到服务器
            //us._u_img = "../../../upload/" + name;
            //context.Session["U_Img"] = "../../../upload/" + name;
            MgrServices.UserAddService.UpdateUserInfo(us);
            context.Session["userInfoEntity"] = us;
            var _result = "{\"jsonrpc\" : \"2.0\", \"result\" : null, \"id\" : \"" + name + "\"}";
            System.Web.HttpContext.Current.Response.Write(_result);

        }
        /// <summary>
        /// 加载用户信息
        /// </summary>
        /// <param name="context"></param>
        public void LoadUserInfo(HttpContext context)
        {
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            U_UserInfoEntity wu = MgrServices.UserAddService.GetEntityInfo(context.Session["loginName"].ToString(), EnterpriseCode);
            context.Session["userInfoEntity"] = wu;
            context.Response.Write(JsonConvert.SerializeObject(wu));
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="context"></param>
        public void Update(HttpContext context)
        {
            var RFType = 0;
            if (Common.GetRequest("RFType") != null)
            {
                RFType = Convert.ToInt32(Common.GetRequest("RFType"));
            }
            var isSave = true;
            List<SelfDefinedInfo> sd = JsonConvert.DeserializeObject<List<SelfDefinedInfo>>(Common.GetForm("strJson"));
            for (int i = 0; i < sd.Count; i++)
            {
                if (sd[i] == null)
                {
                    sd.Remove(sd[i]);
                }
            }
            U_UserInfoEntity beforeUS = context.Session["userInfoEntity"] as U_UserInfoEntity;
            U_UserInfoEntity us = beforeUS;
            us._u_name = Common.GetForm("userName");
            us._u_sex = Common.GetForm("gender");
            us._u_birthday = Common.GetForm("bornDate");
            us._student_id = Common.GetForm("stuID");
            us._u_email = Common.GetForm("email");
            us._u_tel = Common.GetForm("phone");
            us._u_remark = Common.GetForm("memberDescribe");
            us._u_parentsemail = Common.GetForm("parentsEmail");
            us._u_parentstel = Common.GetForm("parentsPhone");
            us._u_audittime = Common.GetForm("bornDate");
            us._u_addfield = JsonConvert.SerializeObject(sd);
            if (sd.Count == 0)
            {
                beforeUS._u_addfield = JsonConvert.SerializeObject(sd);
            } 
            if (isSave)
            {
                //修改
                if (RFType == 4)
                {
                    CounselorModel CounselorModels = new CounselorModel();
                    CounselorModels.CouIntroduce = Common.GetRequest("GoodField");
                    CounselorModels.CouSkilledField = Common.GetRequest("U_Consult");
                    CounselorModels.CounseType = 4;
                    bool result = MgrServices.UserAddService.UpdateUserInfoTwo(us, CounselorModels);
                    if (result)
                    {
                        context.Session["userInfoEntity"] = us;
                        context.Response.Write(JsonConvert.SerializeObject(new { State = true }));
                    }
                    else
                    {
                        context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
                    }
                }
                else
                {
                    if (MgrServices.UserAddService.UpdateUserInfo(us))
                    {
                        context.Session["userInfoEntity"] = us;
                        context.Response.Write(JsonConvert.SerializeObject(new { State = true }));
                    }
                    else
                    {
                        context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
                    }
                }
            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false, Error = "个人信息未变更，此次更改属无效操作" }));
            }

        }
        /// <summary>
        /// 创建时间:2016/9/28
        /// 功能介绍:根据类型和属性名称得到属性值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <param name="propertyname"></param>
        /// <returns></returns>
        public string GetObjectPropertyValue<T>(T t, string propertyname)
        {
            Type type = typeof(T);

            PropertyInfo property = type.GetProperty(propertyname);

            if (property == null) return string.Empty;

            object o = property.GetValue(t, null);

            if (o == null) return string.Empty;

            return o.ToString();
        }
        /// <summary>
        /// 加载用户头像
        /// </summary>
        /// <param name="context"></param>
        public void LoadUserPic(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            context.Response.Write(context.Session["U_Img"]);
        }
        /// <summary>
        /// 记住当前登录的密码
        /// </summary>
        /// <param name="context"></param>
        public void CheckCurrentPwd(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            Dictionary<string, bool> ds = new Dictionary<string, bool>();
            if (us._u_password != MD5Helper.Upper32(Common.GetRequest("currentPwd")))
            {
                ds.Add("valid", false);
            }
            else
            {
                ds.Add("valid", true);
            }
            context.Response.Write(JsonConvert.SerializeObject(ds));
            context.Response.End();
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="context"></param>
        public void AlterPwd(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            us._u_password = MD5Helper.Upper32(Common.GetRequest("newPwd"));
            bool isSuccess = MgrServices.UserAddService.updetapwds(us);
            if (isSuccess)
            {
                context.Session["userInfoEntity"] = us;
            }
            context.Response.Write(isSuccess);
            context.Response.End();
        }
        /// <summary>
        /// 创建时间:2016/10/28
        /// 功能介绍:查看当前用户是否为管理员,并返回其所拥有的权限
        /// </summary>
        public void LoadDepartmentFun(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            if (us == null)
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                    return;
                us = MgrServices.UserAddService.GetEntityInfo(loginName, EnterpriseCode);
            }
            if (Convert.ToInt32(us._r_id) != 1)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = JsonConvert.SerializeObject(MgrServices.FunctionService.GetAdminFunByUserID(Convert.ToInt32(us._u_id))) }));

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