using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using BR_Service;
using WebPages.projrem;
using Newtonsoft.Json;
using System.Configuration;
using System.Net;
using System.Net.Sockets;

namespace WebPages.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// ConsultingOnline 的摘要说明
    /// </summary>
    public class ConsultingOnline : IHttpHandler, IRequiresSessionState
    {
        #region # 属性

        public bool IsReusable { get { return false; } }
        private HttpContext Context { get; set; }
        private string EnterpriseCode;

        #endregion

        public void ProcessRequest(HttpContext context)
        {
            Context = context;
            EnterpriseCode = Common.GetSessionValue("EnterpriseCode", Context);
            if (EnterpriseCode == null)
                return;
            // 操作类型
            string operationType = Common.GetRequest("operationType");

            switch (operationType)
            {
                case "GetParams":// 绑定列表
                    string userID = Common.GetSessionValue("UserID", Context);
                    if (userID == null)
                        return;
                    GetParams(userID);
                    break;
                case "GetConsultantAbout":  // 获取咨询师相关信息（在线咨询右侧信息
                    GetConsultantAbout();
                    break;
                case "GetVisitorAbout":  //获取来访者相关信息
                    GetVisitorAbout();
                    break;
                case "GetGroupAbout":  //获取咨询信息
                    GetGroupAbout();
                    break;
            }
        }
        /// <summary>
        /// 获取咨询信息
        /// </summary>
        private void GetGroupAbout()
        {
            string roomID = Common.GetRequest("roomID");//排班ID
            DataTable result;
            result = MgrServices.ConsultingOnlineService.GetGroupAbout(roomID);

            if (result.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("{");
                sb.Append("\"Subject\":\"" + result.Rows[0]["CSName"].ObjToString() + "\"");
                sb.Append(",\"Content\":\"" + result.Rows[0]["CSContent"].ObjToString() + "\"");
                sb.Append(",\"Condition\":\"" + result.Rows[0]["CSApplyCondition"].ObjToString() + "\"");
                sb.Append(",\"QType\":\"" + result.Rows[0]["QTName"].ObjToString() + "\"");
                sb.Append(",\"Num\":\"" + result.Rows[0]["Count"].ObjToString() + "\"");
                sb.Append("}");
                Context.Response.Write(sb.ToString());
            }
        }
        /// <summary>
        /// 获取来访者相关信息
        /// </summary>
        private void GetVisitorAbout()
        {
            string roomID = Common.GetRequest("roomID");//排班ID
            DataTable result;
            result = MgrServices.ConsultingOnlineService.GetVisitorAbout(roomID);

            if (result.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("{");
                sb.Append("\"userName\":\"" + result.Rows[0]["U_Name"].ObjToString() + "\"");
                sb.Append(",\"loginName\":\"" + result.Rows[0]["U_LoginName"].ObjToString() + "\"");
                sb.Append(",\"sex\":\"" + result.Rows[0]["U_Sex"].ObjToString() + "\"");
                sb.Append(",\"QType\":\"" + result.Rows[0]["QTName"].ObjToString() + "\"");
                sb.Append(",\"questionDescribe\":\"" + result.Rows[0]["QuestionDescribe"].ObjToString() + "\"");
                sb.Append("}");
                Context.Response.Write(sb.ToString());
            }
        }
        /// <summary>
        /// 获取咨询师相关信息（在线咨询右侧信息
        /// </summary>

        private void GetConsultantAbout()
        {
            string roomID = Common.GetRequest("roomID");//排班ID
            string isFriend = Common.GetRequest("isFriend");//排班ID
            DataTable result;
            result = MgrServices.ConsultingOnlineService.GetConsultantAbout(roomID, isFriend);
            if (result.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("{");
                sb.Append("\"userName\":\"" + result.Rows[0]["U_Name"].ObjToString() + "\"");
                sb.Append(",\"uID\":\"" + result.Rows[0]["U_ID"].ObjToString() + "\"");
                sb.Append(",\"loginName\":\"" + result.Rows[0]["U_LoginName"].ObjToString() + "\"");
                sb.Append(",\"sex\":\"" + result.Rows[0]["U_Sex"].ObjToString() + "\"");
                sb.Append(",\"territory\":\"" + result.Rows[0]["CouSkilledField"].ObjToString() + "\"");
                sb.Append(",\"abstract\":\"" + result.Rows[0]["CouIntroduce"].ObjToString() + "\"");
                sb.Append(",\"QType\":\"" + result.Rows[0]["QTName"].ObjToString() + "\"");
                sb.Append("}");
                Context.Response.Write(sb.ToString());
            }
        }
        /// <summary>
        /// 获取在线咨询服务IP+端口
        /// </summary>
        /// <param name="userID"></param>
        private void GetParams(string userID)
        {
            //获取用户最近的一次排班，该排班是大于当前时间，且距当前时间最近的一次排班
            //返回的数据为长度固定3的数组，【0】是排班ID，【1】是开始时间【2】是结束时间
            string role_type = Common.GetSessionValue("role_type", Context);
            role_type = role_type == null ? "" : role_type;
            string U_Img = Common.GetSessionValue("U_Img", Context);
            U_Img = U_Img == null ? "/assets/images/gallery/userimg.jpg" : U_Img;

            string userName = Common.GetSessionValue("U_Name", Context);
            userName = userName == null ? "" : userName;
            string serviceIP = "";
            try
            {
                //serviceIP = MgrServices.ConsultingOnlineService.GetServiceIPAndPort();
                string port = "8073";
                string HostName = Dns.GetHostName(); //得到主机名
                IPHostEntry IpEntry = Dns.GetHostEntry(HostName);
               serviceIP = IpEntry.AddressList.Where(x => x.AddressFamily == AddressFamily.InterNetwork).First().ToString() + ":" + port;

            }
            catch
            {

            }
            StringBuilder sb = new StringBuilder();

            List<string> tempParams = MgrServices.ConsultingOnlineService.GetAppDateByID(userID, role_type);
            if (tempParams == null)
            {
                sb.Append("{");
                sb.Append("\"RoomID\":\"" + "" + "\"");
                sb.Append(",\"StartDate\":\"" + "" + "\"");
                sb.Append(",\"EndDate\":\"" + "" + "\"");
                sb.Append(",\"IP\":\"" + "" + "\"");
                sb.Append(",\"UserName\":\"" + userName + "\"");
                sb.Append(",\"ID\":\"" + userID + "\"");
                sb.Append(",\"RoleID\":\"" + role_type + "\"");
                sb.Append(",\"Avatar\":\"" + U_Img + "\"");
                sb.Append(",\"HasApp\":\"" + "false" + "\"");
                sb.Append(",\"Type\":\"" + "friend" + "\"");
                sb.Append(",\"Time\":\"" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\"");
                sb.Append("}");

                Context.Response.Write(sb.ToString());
                return;
            }
            sb.Append("{");
            sb.Append("\"RoomID\":\"" + tempParams[0] + "\"");
            sb.Append(",\"StartDate\":\"" + tempParams[1] + "\"");
            sb.Append(",\"EndDate\":\"" + tempParams[2] + "\"");
            sb.Append(",\"IP\":\"" + serviceIP + "\"");
            sb.Append(",\"UserName\":\"" + userName + "\"");
            sb.Append(",\"ID\":\"" + userID + "\"");
            sb.Append(",\"RoleID\":\"" + role_type + "\"");
            sb.Append(",\"Avatar\":\"" + U_Img + "\"");
            sb.Append(",\"HasApp\":\"" + "true" + "\"");
            sb.Append(",\"Type\":\"" + tempParams[3] + "\"");
            sb.Append(",\"Time\":\"" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\"");
            sb.Append("}");
            Context.Response.Write(sb.ToString());
        }
    }
}