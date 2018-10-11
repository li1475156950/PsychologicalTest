﻿using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.ServiceModel;
using System.ServiceModel.Security;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.SessionState;
using WebPages.BasicSetting_UserInfo;
using WebPages.EnNmberService;
using WebPages.FunctionService;
using WebPages.projrem;
using WebPages.SerialMapServices;
namespace WebPages.FunctionModular.LoginAndRegister.Ajax
{
    /// <summary>
    /// LoginAndRegister 的摘要说明
    /// </summary>
    public class LoginAndRegister : IHttpHandler, IRequiresSessionState
    {
        // UserInfoService.BasicSetting_UserInfoClient bs = new UserInfoService.BasicSetting_UserInfoClient();
        public void ProcessRequest(HttpContext context)
        {
            string operationType = Common.GetRequest("operationType");
           
           
            string loginName;
            string pwd;
            bool rememberPwds;
            string ENameS;
            switch (operationType)
            {
                case "GetVerifyCode":  //获取验证码
                    GetVerifyCode();
                    break;
                case "IsExistsUser": // 判断用户是否存在
                    string userName = Common.GetRequest("loginName");
                    IsExistsUser(userName, context);
                    break;
                case "VerifyCode": // 选中的验证码
                    string verifyCode = Common.GetRequest("verifyCode");
                    CheckVerifyCode(verifyCode, context);
                    break;
                case "CheckUserIsActivate": //判断用户是否激活
                    loginName = Common.GetRequest("loginName");
                    CheckUserIsActivate(loginName, context);
                    break;
                case "LoginUserIsExistsUser":  //判断登录用户是否存在
                    loginName = Common.GetRequest("loginName");
                    LoginUserIsExists(loginName, context);
                    break;
                case "Login": //登录
                    loginName = Common.GetRequest("loginName");
                    bool rememberPwd = Convert.ToBoolean(Common.GetRequest("rememberPwd"));
                    pwd = Common.GetRequest("pwd");

                    Login(loginName, pwd, rememberPwd, context);
                    break;
                case "Register":  //新用户注册

                    U_UserInfoEntity us = new U_UserInfoEntity()
                    {
                        _u_loginname = HttpUtility.UrlDecode(Common.GetRequest("loginName")),
                        _u_password = MD5Helper.Upper32(Common.GetRequest("regPwd")),
                        _u_name = Common.GetRequest("userName"),
                        _u_sex = Common.GetRequest("gender"),
                        _u_birthday = Common.GetRequest("bornDate"),
                        _r_id = MgrServices.UserAddService.SelectR_ID(),
                        _department_id = Common.GetRequest("department"),
                        _u_email = Common.GetRequest("email"),
                        _u_tel = Common.GetRequest("phone"),
                        _u_str = "1",//1表示注册
                        _u_mark_delete = "0",
                        _u_auditstate = "0",
                    };
                    AddRegisterUser(us, context);
                    break;
                case "GetCookie":  // 获取数据缓存
                    GetCookieValue(context);
                    break;
                case "JudgeLogin":  //判断登录状态
                    JudgeLogin(context);
                    break;
                case "LoginOut": //设置登录状态下的缓存值
                    LoginOut(context);
                    break;
                case "userinfo":  //获取用户基本信息
                    userinfo(context);
                    break;
                case "imgs":  //获取头像路径
                    imgs(context);
                    break;
                case "mokuai": //加载用户权限模块
                    mokuai(context);
                    break;
                case "logins":  //用户名称判断角色的名称1是成功0是失败，3是请输入序列号,4是输入的企业账号不对,5是企业账号已停用
                      
                    loginName = context.Request["loginName"];
                    rememberPwds = Convert.ToBoolean(Common.GetRequest("rememberPwd"));
                    ENameS = Common.GetRequest("ENameS");
                    pwd = Common.GetRequest("pwd");
                    LoginS(loginName, pwd, rememberPwds, ENameS, context);
                    break;
                case "login": // 登录
                    loginName = context.Request["loginName"];
                    rememberPwds = Convert.ToBoolean(Common.GetRequest("rememberPwd"));
                    ENameS = Common.GetRequest("ENameS");
                    pwd = Common.GetRequest("pwd");
                    Login(loginName, pwd, rememberPwds, context);
                    break;
                case "YZXLH":  //验证序列号是否，密码是否匹配，如果正确是否激活
                    ValidationSequenceNumber(context);
                    break;
                case "ClearPwd":  //清除密码缓存
                    ClearPwd(context);
                    break;
                case "CheckUseName"://输出当前登录的用户名
                    context.Response.Write(HttpContext.Current.User.Identity.Name);
                    break;
                case "userlogin":  //登录
                    userlogin(context);  
                    break;
                default:
                    break;

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        /// <summary>
        /// 新用户注册
        /// </summary>
        /// <param name="us"></param>
        /// <param name="context"></param>
        public void AddRegisterUser(U_UserInfoEntity us, HttpContext context)
        {
            context.Response.Write(MgrServices.UserAddService.U_UserInfoAdd(us));
        }
        /// <summary>
        /// 激活邮箱
        /// </summary>
        /// <param name="address"></param>
        public void ActivateEmail(string address)
        {
            string activeCode = "1234";
            string email = "wkregister566@163.com";
            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress("13716821353@163.com");
            mailMsg.To.Add(email);
            mailMsg.Subject = "请激活注册";
            StringBuilder contentBuilder = new StringBuilder();
            contentBuilder.Append("请单击以下链接完成激活");
            contentBuilder.Append("<a href='http://localhost:15464/cheng.aspx?activecode=" + activeCode + "&userId=" + 1 + "'>激活</a>");
            mailMsg.Body = contentBuilder.ToString();//拼接字符串 
            mailMsg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            //发件方服务器地址 
            client.Host = "smtp.163.com";
            client.Port = 25;
            client.EnableSsl = true;
            //mailMsg.IsBodyHtml = true; 
            NetworkCredential credetial = new NetworkCredential();
            credetial.UserName = "13716821353";
            credetial.Password = "wss193651";
            client.Credentials = credetial;
            client.Send(mailMsg);
        }
        /// <summary>
        /// 获取验证码
        /// </summary>
        public void GetVerifyCode()
        {
            string randomcode = VerifyCode.CreateRandomCode(4);
            HttpContext.Current.Session["VerifyCode"] = randomcode;
            VerifyCode.CreateImage(randomcode);
        }
        /// <summary>
        /// 判断用户是否存在
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="context"></param>
        public void IsExistsUser(string userName, HttpContext context)
        {
            bool isExists = MgrServices.UserAddService.IsExistsUser(userName);
            Dictionary<string, bool> ds = new Dictionary<string, bool>();
            if (isExists)
            {
                ds.Add("valid", false);
            }
            else
            {
                ds.Add("valid", true);
            }

            context.Response.Write(JsonConvert.SerializeObject(ds));
        }
        /// <summary>
        /// 选中的验证码
        /// </summary>
        /// <param name="verifyCode"></param>
        /// <param name="context"></param>
        public void CheckVerifyCode(string verifyCode, HttpContext context)
        {
            string sessionVerifyCode = context.Session["VerifyCode"].ToString();
            Dictionary<string, bool> ds = new Dictionary<string, bool>();
            if (VerifyCode.ToUpper(sessionVerifyCode) == VerifyCode.ToUpper(verifyCode))
            {
                ds.Add("valid", true);
            }
            else
            {
                ds.Add("valid", false);
            }
            context.Response.Write(JsonConvert.SerializeObject(ds));
        }
        /// <summary>
        ///  判断用户是否激活
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="context"></param>
        public void CheckUserIsActivate(string loginName, HttpContext context)
        {
            context.Response.Write(MgrServices.UserAddService.CheckUserIsActivate(loginName));
        }
        /// <summary>
        /// 判断登录用户是否存在
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="context"></param>
        public void LoginUserIsExists(string loginName, HttpContext context)
        {
            Dictionary<string, bool> ds = new Dictionary<string, bool>();
            if (MgrServices.UserAddService.IsExistsUser(loginName))
            {
                ds.Add("valid", true);
            }
            else
            {
                ds.Add("valid", false);
            }
            context.Response.Write(JsonConvert.SerializeObject(ds));
        }
        /// <summary>
        /// 用用户名称判断角色的名称1是成功0是失败，3是请输入序列号,4是输入的企业账号不对,5是企业账号已停用
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="pwd"></param>
        /// <param name="rememberPwd"></param>
        /// <param name="context"></param>
        public void LoginS(string loginName, string pwd, bool rememberPwd, string EnName, HttpContext context)
        {
            U_UserInfoEntity entity = new U_UserInfoEntity();
            EnterpriseEntity EnNameEntity = new EnterpriseEntity();
            EnNameEntity = MgrServices.EnNmberService.ENumberNames(EnName);//没搜到
            string EnterpriseCode = EnNameEntity.EnterpriseCode;
            
            if (EnterpriseCode != null && EnterpriseCode != "")
            {
               
                if (MgrServices.UserAddService.IsBannedOfCheckEnterpriseCode(EnterpriseCode) == 0)
                {
                    context.Response.Write(5);
                    context.Response.End();
                }
               
                entity = MgrServices.UserAddService.GetEntityInfo(loginName, EnterpriseCode);
               
                int isSuccess = 0;
                if (entity != null)
                {
                    string sss = MD5Helper.Upper32(pwd);
                    context.Session["userInfoEntity"] = entity;
                    if (entity._u_password == MD5Helper.Upper32(pwd))
                    {
                        isSuccess = 1;
                    }
                    else
                    {
                        isSuccess = 0;
                    }


                    if (isSuccess > 0)
                    {
                        context.Session["loginName"] = loginName;
                        context.Session["U_Name"] = entity._u_name;
                        context.Session["UserID"] = entity._u_id;
                        //context.Session["U_Img"] = entity._u_img;
                        if (entity._u_img != null && entity._u_img != "")
                        {
                            context.Session["U_Img"] = entity._u_img;
                        }
                        else { context.Session["U_Img"] = ""; }

                        context.Session["EnterpriseCode"] = entity._enterpriseCode;
                        context.Session["role_type"] = entity._role_types;

                        context.Session["ActivationSNumber"] = entity._activationsnumber;
                        context.Session["ActivatEnterpriseMark"] = entity._activatenterprisemark;
                        SetSessionFunctionByRoleID(Convert.ToInt32(entity._r_id), context);//将对应的权限放到Session里面
                        if (rememberPwd)
                        {
                            CookieHelper.SetCookie("LoginNameCookie", loginName, DateTime.MaxValue);
                            CookieHelper.SetCookie("LoginPwdCookie", pwd, DateTime.MaxValue);
                            CookieHelper.SetCookie("RememberPwd", rememberPwd.ToString(), DateTime.MaxValue);
                        }
                        else
                        {
                            CookieHelper.SetCookie("LoginNameCookie", "@@", DateTime.MaxValue);
                            CookieHelper.SetCookie("LoginPwdCookie", "@@", DateTime.MaxValue);
                        }
                        if (entity._isenterprisemark == 1 && entity._activatenterprisemark == 1)//已经激活标示
                        {
                            context.Response.Write(1);
                        }
                        else if (entity._isenterprisemark == 1 && entity._activatenterprisemark == 0)
                        {
                            context.Response.Write(3);
                        }
                        else
                        {
                            context.Response.Write(1);
                        }
                    }
                    else
                    {
                        CookieHelper.ClearCookie("LoginNameCookie");
                        CookieHelper.ClearCookie("LoginPwdCookie");
                        context.Response.Write(0);
                    }
                    context.Session["SecondMenu"] = null;
                    context.Session["FirstMenu"] = null;
                }
                else
                {
                    CookieHelper.ClearCookie("LoginNameCookie");
                    CookieHelper.ClearCookie("LoginPwdCookie");
                    context.Response.Write(0);
                }

            }
            else
            {
                context.Response.Write(4);
            }
        }
        //验证序列号是否，密码是否匹配，如果正确是否激活
        /// <summary>
        /// 0是失败，1是成功，2是激活码不正确,3是还没有激活
        /// </summary>
        /// <param name="context"></param>
        public void ValidationSequenceNumber(HttpContext context)
        {
            try
            {
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                    return;
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                string XLH = Common.GetRequest("xlhname");
                string PWd = Common.GetRequest("password");
                string ActiveNumber = "";
                if (context.Session["ActivationSNumber"] != null)
                {
                    ActiveNumber = context.Session["ActivationSNumber"].ToString();
                }
                if (XLH == ActiveNumber)
                {
                    SerialMapServiceClient SerialMap = new SerialMapServiceClient();
                    string ISActivates = SerialMap.IsActivate(XLH, PWd);
                    if (ISActivates != null && ISActivates != "")
                    {
                        string ActivatEnterpriseMarks = context.Session["ActivatEnterpriseMark"].ToString();
                        if (ISActivates == "True" && ActivatEnterpriseMarks == "1")
                        {
                            context.Response.Write(1);
                        }
                        else
                        {
                            bool EISActive = MgrServices.UserAddService.UpdateIsEActive(loginName, EnterpriseCode);
                            bool ISEActive = SerialMap.UpdateIsSActive(XLH);
                            if (ISEActive)
                            {
                                context.Response.Write(1);
                            }
                            else
                            {
                                context.Response.Write(0);
                            }
                        }
                    }
                    else
                    {
                        context.Response.Write(2);
                    }
                }
                else
                {
                    context.Response.Write(2);
                }
            }
            catch
            {
                context.Response.Write(0);
            }
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="pwd"></param>
        /// <param name="rememberPwd"></param>
        /// <param name="context"></param>
        public void Login(string loginName, string pwd, bool rememberPwd, HttpContext context)
        {
            int isSuccess = 0;
            string EName = Common.GetRequest("ENameS");
            if (EName=="admin")
            {
                isSuccess = MgrServices.UserAddService.Login(loginName, MD5Helper.Upper32(pwd));
            }
           
            U_UserInfoEntity entity = new U_UserInfoEntity();
            if (isSuccess > 0)
            {

                entity = MgrServices.UserAddService.GetEntity(loginName);

                if (entity != null)
                {

                    context.Session["loginName"] = loginName;
                    context.Session["UserID"] = isSuccess;
                    //context.Session["U_Img"] = entity._u_img;
                    if (entity._u_img != null && entity._u_img != "")
                    {
                        context.Session["U_Img"] = entity._u_img;
                    }
                    else { context.Session["U_Img"] = ""; }

                    context.Session["EnterpriseCode"] = entity._enterpriseCode;
                    context.Session["role_type"] = entity._role_types;
                    context.Session["U_Name"] = entity._u_name;
                    context.Session["UserID"] = entity._u_id;
                    
                    SetSessionFunctionByRoleID(Convert.ToInt32(entity._r_id), context);//将对应的权限放到Session里面
                    GetRoleFuntion(context);
                    if (rememberPwd)
                    {
                        CookieHelper.SetCookie("LoginNameCookie", loginName, DateTime.MaxValue);
                        CookieHelper.SetCookie("LoginPwdCookie", pwd, DateTime.MaxValue);
                        CookieHelper.SetCookie("RememberPwd", rememberPwd.ToString(), DateTime.MaxValue);
                    }
                    else
                    {
                        CookieHelper.SetCookie("LoginNameCookie", "@@", DateTime.MaxValue);
                        CookieHelper.SetCookie("LoginPwdCookie", "@@", DateTime.MaxValue);
                    }
                    context.Response.Write(1);
                    context.Session["SecondMenu"] = null;
                    context.Session["FirstMenu"] = null;
                }
                else
                {
                    context.Response.Write(0);
                }
            }
            else
            {
                CookieHelper.ClearCookie("LoginNameCookie");
                CookieHelper.ClearCookie("LoginPwdCookie");
                context.Response.Write(isSuccess > 0);
            }

        }

        /// <summary>
        /// 创建时间：2016-12-25
        /// 功能介绍：根据角色ID查询角色对应的权限和 全部权限
        /// </summary>
        /// <param name="RoleID">角色ID</param>
        public void SetSessionFunctionByRoleID(int RoleID, HttpContext context)
        {
            try
            {
                List<RF_Entity> RfList = new List<RF_Entity>();
                List<RF_Entity> ALL_RfList = new List<RF_Entity>();

                ALL_RfList = MgrServices.FunctionService.GetRF_AD();//获取的是所有的权限
                RfList = MgrServices.FunctionService.GetRoleAndFunctionByRoleID(RoleID);//获取的是当前按钮的权限
                context.Session["ALL_RfList"] = ALL_RfList;//所有权限的Session
                context.Session["RfList"] = RfList;//当前登陆人权限的Session
            }
            catch
            {


            }
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="context"></param>
        public void userlogin(HttpContext context)
        {
            context.Session["loginName"] = null;
            context.Session["UserID"] = null;
            context.Session["U_Img"] = null;
            context.Session["EnterpriseCode"] = null;
            context.Session["role_type"] = null;
            context.Session["U_Name"] = null;
            context.Session["UserID"] = null;
            string userId = HttpContext.Current.User.Identity.Name;
            if (userId != null && userId != "")
            {
                U_UserInfoEntity model = new U_UserInfoEntity();
                bool result = false;
                WebPages.RoleService.RoleEntity Roles = MgrServices.RoleService.IsRole(3, "sysadmin");
                int DID = MgrServices.Department.GetDepartmentByName("sysadmin");
                if (Roles != null)
                {
                    U_UserInfoEntity entity = new U_UserInfoEntity();
                    var IsUser = MgrServices.UserAddService.IsExistsUser(userId);
                    if (IsUser)
                    {
                        entity = MgrServices.UserAddService.GetEntity(userId);
                        context.Session["loginName"] = userId;
                        context.Session["UserID"] = entity._u_id;
                        if (entity._u_img != null && entity._u_img != "")
                        {
                            context.Session["U_Img"] = entity._u_img;
                        }
                        else { context.Session["U_Img"] = ""; }

                        context.Session["EnterpriseCode"] = entity._enterpriseCode;
                        context.Session["role_type"] = entity._role_types;
                        context.Session["U_Name"] = entity._u_name;
                        context.Session["UserID"] = entity._u_id;
                        context.Response.Write(0);
                    }
                    else
                    {

                        U_UserInfoEntity Umodel = new U_UserInfoEntity();
                        model._department_id = DID.ToString();
                        model._enterpriseCode = "5841638608834";
                        model._u_loginname = userId;
                        model._u_password = MD5Helper.Upper32("123456");
                        model._u_name = userId;
                        model._u_sex = "女";
                        model._student_id = "";
                        model._u_birthday = DateTime.Now.ToString();
                        model._u_email = "";
                        model._u_tel = "";
                        model._u_parentstel = "";
                        model._u_parentsemail = "";
                        model._r_id = Roles.Role_ID.ToString();
                        model._u_age = "0";
                        model._u_remark = "";
                        model._u_addfield = "";
                        model._departmentauthority = "";                     
                        model._u_auditstate ="1";
                        model._u_mark_delete = "0";
                        result = MgrServices.UserAddService.U_UserInfoAdd(model);
                        if (result)
                        {

                            entity = MgrServices.UserAddService.GetEntity(userId);
                            context.Session["loginName"] = userId;
                            context.Session["UserID"] = entity._u_id;
                            if (entity._u_img != null && entity._u_img != "")
                            {
                                context.Session["U_Img"] = entity._u_img;
                            }
                            else { context.Session["U_Img"] = ""; }

                            context.Session["EnterpriseCode"] = entity._enterpriseCode;
                            context.Session["role_type"] = entity._role_types;
                            context.Session["U_Name"] = entity._u_name;
                            context.Session["UserID"] = entity._u_id;
                            SetSessionFunctionByRoleID(Convert.ToInt32(entity._r_id), context);//将对应的权限放到Session里面
                            GetRoleFuntion(context);
                            context.Response.Write(0);
                        }
                        else
                        {
                            context.Response.Write(1);
                        }
                    }
                }
                else
                {
                    context.Response.Write(1);
                }
            }
            else
            {
                context.Response.Write(1);
            }
            
        }
        //判断是否是咨询师
        public void GetRoleFuntion(HttpContext context)
        {
            string Roletype = "";
            int Rolefuntion = 0;
            if (context.Session["role_type"] != null)
            {
                Roletype = context.Session["role_type"].ToString();
            }
            if (Roletype == "2")
            {
                var currentUserID = context.Session["UserID"].ToString();
                var sessionUserID = "";
                if (context.Session["CurrentUserID"] != null)
                {
                    sessionUserID = context.Session["CurrentUserID"].ToString();
                }
                if (context.Session["SecondMenu"] != null && context.Session["FirstMenu"] != null)
                {
                    var tempFirstMenu = context.Session["FirstMenu"] as List<FunctionService.FunctionEntity>;
                    foreach (var item in tempFirstMenu)
                    {
                        if (item.Fun_Name == "预约咨询")
                        {
                            Rolefuntion = 2;
                        }
                    }
                }
            }
            context.Session["GetRoleType"] = Rolefuntion;
        }

        /// <summary>
        /// 获取数据缓存
        /// </summary>
        /// <param name="context"></param>
        public void GetCookieValue(HttpContext context)
        {
            List<string> aa=new List<string>();
            string loginNameCookie = CookieHelper.GetCookieValue("LoginNameCookie");
            string loginPwdCookie = CookieHelper.GetCookieValue("LoginPwdCookie");
            JsonConvert.SerializeObject(aa);
            if (!string.IsNullOrEmpty(loginNameCookie))
            {
                context.Response.Write(JsonConvert.SerializeObject(new { loginNameCookie = loginNameCookie, loginPwdCookie = loginPwdCookie }));
            }
        }
        /// <summary>
        /// 判断登录状态
        /// </summary>
        /// <param name="context"></param>
        public void JudgeLogin(HttpContext context)
        {
            if (context.Session["loginName"] == null)
            {

                context.Response.Write(true);
            }

        }
        /// <summary>
        /// 设置登录状态下的缓存值
        /// </summary>
        /// <param name="context"></param>
        public void LoginOut(HttpContext context)
        {
            if (context.Session["loginName"] != null)
            {
                context.Session["loginName"] = null;
                context.Session["Userinfoentity"] = null;
                context.Session["FirstMenu"] = null;
                context.Session["SecondMenu"] = null;
            }
            context.Response.Write(true);
        }
        /// <summary>
        ///  获取用户基本信息
        /// </summary>
        /// <param name="context"></param>
        public void userinfo(HttpContext context)
        {
            string result = "";
            string EnterpriseCode = "";
            string Roletype = "";
            if (context.Session["loginName"] != null && context.Session["loginName"].ToString() != "" && context.Session["loginName"].ToString() != "null")
            {
                result = Convert.ToString(context.Session["loginName"]);
                EnterpriseCode = context.Session["EnterpriseCode"].ToString();
                Roletype = context.Session["role_type"].ToString();
                context.Response.Write(JsonConvert.SerializeObject(new { loginName = result, EnterpriseCode = EnterpriseCode,RoleType=Roletype }));
            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new { loginName = result, EnterpriseCode = EnterpriseCode, RoleType = Roletype }));
            }
        }
        /// <summary>
        /// 获取头像路径
        /// </summary>
        /// <param name="context"></param>
        public void imgs(HttpContext context)
        {
            string result = "";
            if (context.Session["U_Img"] != null && context.Session["U_Img"].ToString() != "" && context.Session["U_Img"].ToString() != "null")
            {
                result = Convert.ToString(context.Session["U_Img"]);
                context.Response.Write(result);
            }
            else
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 加载用户权限模块
        /// </summary>
        /// <param name="context"></param>
        public void mokuai(HttpContext context)
        {
            int result = 0;
            if (Convert.ToInt32(context.Session["role_type"]) > 0)
            {
                result = Convert.ToInt32(context.Session["role_type"]);
                context.Response.Write(result);
            }
            else
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 清除密码缓存
        /// </summary>
        /// <param name="context"></param>
        public void ClearPwd(HttpContext context)
        {
            var loginName = Common.GetRequest("loginName");
            var pwd = CookieHelper.GetCookieValue("LoginPwdCookie");
            var rememberPwd = Convert.ToBoolean(CookieHelper.GetCookieValue("RememberPwd"));
            if (rememberPwd && string.IsNullOrEmpty(pwd))
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = pwd }));
            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
            }
        }
    }
}