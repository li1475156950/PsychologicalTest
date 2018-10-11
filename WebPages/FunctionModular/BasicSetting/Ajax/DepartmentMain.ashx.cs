using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using WebPages.EnterpriseOnlineService;

namespace WebPages.FunctionModular.BasicSetting
{
    /// <summary>
    /// DepartmentMain1 的摘要说明
    /// 创建时间：2016-10-18
    /// 功能介绍：部门管理功能模块一般处理程序
    /// </summary>
    public class DepartmentMain1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            string Remark = Common.GetRequest("Remark");
            string LoginName = "";
            string Encode = "";

            LoginName = Common.GetSessionValue("loginName", context);
            if (LoginName == null)
                return;
            Encode = Common.GetSessionValue("EnterpriseCode", context);
            if (Encode == null)
                return;
            switch (Remark)
            {
                case "OnLoadDep":  //获取当前企业下面的所有部门集合
                    GetDepartmentTemp(LoginName, context);
                    break;
                case "InitDep":  //初始化部门数据集合页面参数格式
                    string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                    if (EnterpriseCode == null)
                        return;
                    InitDepStr(EnterpriseCode, context);
                    break;
                case "DepAdd":  //插入语句
                    string en = Common.GetSessionValue("EnterpriseCode", context);
                    if (en == null)
                        return;
                    DepartmentInsert(en, context);
                    break;
                case "befor_delete": //删除部门之前先删除相关用户
                    BeforDelete(context);
                    break;
                case "de_del":  //删除一条数据到回收站。
                    DepartmentDelete(context);
                    break;
                case "sel_ID":   //按照id查询单个
                    DepartmentAselect(context);
                    break;
                case "DepUp":  //更新一条数据
                    DepartmentD_updeta(context);
                    break;
                case "DepartmentAuthority":  //权限
                    GetDepartmentAuthority(LoginName, context);
                    break;
                case "GetDepartments":  //取当前企业下面的所有部门集合id为o 下拉框显示全部提示语
                    GetDepartments(LoginName, context);
                    break;
                case "GetDepartmentscount": //获取当前企业下面的所有部门集合id为0  下拉框不显示全部提示语
                    GetDepartmentscount(LoginName, context);
                    break;
                case "DepartmentAuthorityRole":  //获取角色名称
                    string RoleTypes = Common.GetRequest("Roletype");
                    GetDepartmentAuthorityRole(LoginName, RoleTypes, context);
                    break;

            }

        }
        private void GetTempTree(int Id, DataTable table, string authtxt, ref PageInfo page, string Encode)
        {
            DataRow[] rows = table.Select(string.Format("D_chiID={0}", Id));

            if (rows.Length > 0)
            {
                foreach (DataRow row in rows)
                {
                    int Count = 0;
                    DepartmentCount(Convert.ToInt32(row["D_ID"]), Encode, ref Count);
                    String[] arr =
                                    {
                                        row["D_ID"].ToString(), //部门ID
                                        row["D_name"].ToString(), //部门名称
                                        row["D_Remark"].ToString(), //部门描述
                                        Count.ToString(),

                                        "",  
                                        row["D_chiID"].ToString(), //部门成员数
                                    };
                    page.data.Add(arr);
                    GetTempTree(Convert.ToInt32(row["D_ID"]), table, authtxt, ref page, Encode);
                }
            }
        }
        /// <summary>
        /// 创建时间：2017-10-24
        /// 功能介绍：获取部门人数
        /// </summary>
        /// <param name="D_ID"></param>
        /// <param name="Encode"></param>
        public void DepartmentCount(int D_ID, string Encode,ref int Count) 
        {
            //获取部门及其直接子级的成员个数
            DataSet ds = MgrServices.Department.DepartmentGroupCount(D_ID, Encode);

            if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0) 
            {
                //循环部门及其直接子级
                 foreach (DataRow row in ds.Tables[0].Rows)
	             {
		             Count+=int.Parse(row["DIDcount"].ToString());
                     int Department_ID=int.Parse(row["Department_ID"].ToString());
                     if (Department_ID != D_ID)
                     {
                         //判断Department_ID的子级个数，如果有子级就重新调用本方法
                         int zjCount = int.Parse(row["ChiCount"].ToString());//MgrServices.Department.Department_ChildCount(int.Parse(row["Department_ID"].ToString()));
                         if(zjCount>0)
                         {
                             //因为下回调用本方法时，Count会二次相加本次值，所以提前减去
                             Count -= int.Parse(row["DIDcount"].ToString());
                             DepartmentCount(Department_ID, Encode,ref Count);
                         }
                     }
	             }
            }
        }
         
        /// <summary>
        /// 创建时间：2016-10-18
        /// 功能介绍：获取当前企业下面的所有部门集合
        /// </summary>
        /// <returns></returns>
        private void GetDepartmentTemp(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.DepartmentsA(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"全部\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(0, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        /// <summary>
        /// 创建时间：2017-1-10
        /// 功能介绍：获取当前企业下面的所有部门集合id为o 下拉框显示全部提示语
        /// </summary>
        /// <returns></returns>
        private void GetDepartments(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.DepartmentsA(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"全部\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        /// <summary>
        /// 创建时间：2017-1-10
        /// 功能介绍：获取当前企业下面的所有部门集合id为0  下拉框不显示全部提示语
        /// </summary>
        /// <returns></returns>
        private void GetDepartmentscount(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.DepartmentsA(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    //str.Append("{\"id\":0,\"text\":\"全部\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }

        /// <summary>
        /// 权限
        /// </summary>
        /// <param name="LoginName"></param>
        /// <param name="context"></param>
        private void GetDepartmentAuthority(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.GetDepartmentAuthority(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
                else
                {
                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"}");

                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        private static string GetTreeString(int Id, DataTable table, string authtxt)
        {
            DataRow[] rows;
            if (Id == -1)
                rows = table.AsEnumerable().Where(x => table.AsEnumerable().Where(y => y["D_ID"].ToString() == (x["D_chiID"].ToString())).Count() == 0).ToArray();
            else
                rows = table.Select(string.Format("D_chiID={0}", Id));
            if (rows.Length == 0) return string.Empty;
            StringBuilder str = new StringBuilder();

            foreach (DataRow row in rows)
            {
                //string d_icon = "../" + (string)row["d_icon"];

                string d_icon = "../../CSS/images/Icon/50.png";

                if (!string.IsNullOrEmpty(authtxt) && authtxt.IndexOf(row["D_ID"].ToString()) == -1 && authtxt != "0")
                    d_icon = "../../CSS/images/Icon/50.png";

                str.Append("{\"id\":" + (int)row["D_ID"] + ",\"text\":\"" + row["D_name"].ToString() + "\",\"d_icon\":\"" + d_icon + "\"");

                if (GetTreeString((int)row["D_ID"], table, authtxt).Length > 0)
                {
                    str.Append(",\"children\":[");
                    str.Append(GetTreeString((int)row["D_ID"], table, authtxt));
                    str.Append("]},");
                }
                else
                {
                    str.Append("},");
                }
            }
            return str[str.Length - 1] == ',' ? str.ToString(0, str.Length - 1) : str.ToString();
        }
        /// <summary>
        /// 创建时间：2016-10-19
        /// 功能介绍：初始化部门数据集合页面参数格式
        /// </summary>
        private void InitDepStr(string Ecode, HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                DataTable SourceTemp = new DataTable();

                System.Diagnostics.Stopwatch sw = new System.Diagnostics.Stopwatch();
                sw.Start();
                SourceTemp = GetDepTemp(Ecode, context);
                sw.Stop();
                TimeSpan timespan = sw.Elapsed; //  获取当前实例测量得出的总时间
                double seconds = timespan.TotalSeconds;  //  总秒数

                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    DataRow[] DTRList = SourceTemp.Select(string.Format("D_chiID={0}", 0));
                    if (DTRList != null && DTRList.Length > 0)
                    {
                        System.Diagnostics.Stopwatch sw1 = new System.Diagnostics.Stopwatch();
                        sw1.Start();
                        foreach (DataRow DTR in DTRList)
                        {
                            int Count = 0;
                            DepartmentCount(Convert.ToInt32(DTR["D_ID"].ToString()), Ecode, ref Count);
                           
                            String[] arr =
                                    {
                                        DTR["D_ID"].ToString(), //部门ID
                                        DTR["D_name"].ToString(), //部门名称
                                        DTR["D_Remark"].ToString(), //部门描述
                                        Count.ToString(),
                                        "",  
                                        DTR["D_chiID"].ToString(), //部门成员数
                                    };
                            page.data.Add(arr);
                            GetTempTree(Convert.ToInt32(DTR["D_ID"].ToString()), SourceTemp, null, ref  page, Ecode);
                        }
                        sw1.Stop();
                        TimeSpan timespan1 = sw1.Elapsed; //  获取当前实例测量得出的总时间
                        double seconds1 = timespan1.TotalSeconds;  //  总秒数
                    }
                }
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            { }
        }
        /// <summary>
        /// 插入语句
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentInsert(string EnterpriseCode, HttpContext context)
        {
            try
            {
                var D_name = context.Request["D_name"].Replace(" ", "");
                var D_Remark = context.Request["D_Remark"];
                var D_chiID = context.Request["D_chiID"];
                D_chiID = D_chiID == "" ? "0" : D_chiID;
                WebPages.DepartmentService.DepartmentEntity de = new DepartmentService.DepartmentEntity();
                de._d_name = D_name;
                de._d_remark = D_Remark;
                de._d_chiid = D_chiID;
                de.d_code = EnterpriseCode;
                string _id = Common.GetSessionValue("UserID", context);
                if (_id == null)
                    return;
                de.create_id = Convert.ToInt32(_id);
                long DResult = MgrServices.Department.DepartmentInsert(de);
                if (DResult > 0)
                {
                    DepartmentLicense_InfoEntity entityInfo = new DepartmentLicense_InfoEntity();
                    //插入授权编码关系表
                    entityInfo._licensecode = Common.GetSessionValue("LicenseCode", context);
                    if (entityInfo._licensecode == null)
                        return;

                    //sesion获取用户的授权编码
                    entityInfo._d_id = Convert.ToInt32(DResult);
                    entityInfo._is_delete = 0;
                    entityInfo._createtime = DateTime.Now;
                    EOInsert(entityInfo);
                    context.Response.Write("1");

                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch
            { }

        }
        /// <summary>
        /// 创建时间：2016-10-19
        /// 功能介绍：获取部门集合
        /// </summary>
        /// <returns></returns>
        public DataTable GetDepTemp(string Ecode, HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                    return null;
                SourceTemp = MgrServices.Department.GetDepTemp(loginName, Ecode);
            }
            catch
            {
            }
            return SourceTemp;
        }
        /// <summary>
        /// 创建时间：2017/6/9
        /// 删除部门之前先删除相关用户
        /// </summary>
        /// <param name="context"></param>
        private void BeforDelete(HttpContext context)
        {
            string result = "0";
            try
            {
                int D_ID =Convert.ToInt32(Common.GetRequest("D_ID"));
                //result = MgrServices.DistributeRecordService.BeforDelete(D_ID)==false?"0":"1";
                MgrServices.DistributeRecordService.BeforDelete(D_ID);
                context.Response.Write("1");
            }
            catch 
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 删除一条数据到回收站。
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentDelete(HttpContext context)
        {
            int D_ID = Convert.ToInt32(Common.GetRequest("D_ID"));
            bool result = MgrServices.Department.UPdataDelete(D_ID);
            if (result)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }
        /// <summary>
        /// 按照id查询单个
        /// </summary>
        /// <param name="context"></param>
        public void DepartmentAselect(HttpContext context)
        {
            try
            {
                WebPages.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
                int D_ID = Convert.ToInt32(Common.GetRequest("UP_D_ID"));
                model = MgrServices.Department.Aselect(D_ID);
                string json = JsonConvert.SerializeObject(model);
                context.Response.Write(json);
            }
            catch
            { }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="context"></param>
        public void DepartmentD_updeta(HttpContext context)
        {
            try
            {
                WebPages.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
                int D_ID = Convert.ToInt32(context.Request["UP_D_IDS"]);
                string D_name = context.Request["D_name"];
                string D_Remark = context.Request["D_Remark"];
                model._d_id = D_ID;
                model._d_remark = D_Remark;
                model._d_name = D_name;
                model._d_chiid = context.Request["ChildID"];
                bool result = MgrServices.Department.updata(model);
                if (result)
                {
                    context.Response.Write("1");
                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch
            {

            }
        }
        /// <summary>
        /// 获取角色名称
        /// </summary>
        /// <param name="LoginName"></param>
        /// <param name="Roletype"></param>
        /// <param name="context"></param>
        private void GetDepartmentAuthorityRole(string LoginName,string Roletype, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                DataTable SourceTemp = new DataTable();
                if (EnterpriseCode == null)
                    return;
                if (Roletype != "3")
                {
                    SourceTemp = MgrServices.Department.GetDepartmentAuthority(LoginName, EnterpriseCode);
                }

                if ((SourceTemp != null && SourceTemp.Rows.Count > 0) || Roletype=="3")
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
                else
                {
                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"}");

                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        /// <summary>
        /// 插入授权编码
        /// </summary>
        /// <param name="entityInfo"></param>
        /// <returns></returns>
        public bool EOInsert(DepartmentLicense_InfoEntity entityInfo)
        {

            try
            {
                long EoID = MgrServices.EnterpriseOnlineService.EOInsert(entityInfo);
                if (EoID > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
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