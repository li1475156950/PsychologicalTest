using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace WebPages.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// ShowRights 的摘要说明
    /// </summary>
    public class ShowRights : IHttpHandler, IRequiresSessionState
    {
        FunctionService.FunctionServiceClient fs = new FunctionService.FunctionServiceClient();
        public void ProcessRequest(HttpContext context)
        {
            //string isTimeOut = Common.GetSessionValue("UserID", context);
            //if (isTimeOut == null)
            //    return;

            string operationType = Common.GetRequest("operationType");
            
            switch (operationType)
            {
                case "LoadFirstFun":  //获取权限信息
                    LoadFirstFun(context);
                    break;
                case "LoadSecondFun":  //获取权限信息
                    LoadSecondFun(context);
                    break;
                case "LoadThirdFun":  //获取权限信息
                    LoadThirdFun(context);
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
        public void LoadFirstFun(HttpContext context) 
        {
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetFunByFunType(1)));
        }
        public void LoadSecondFun(HttpContext context)
        {
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetFunByFunType(2)));
        }
        public void LoadThirdFun(HttpContext context)
        {
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetFunByFunType(3)));
        }
    }
}