using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace WebPages.FunctionModular.RecycleBin.Ajax
{
    /// <summary>
   
    /// 创建日期:2016/11/8
    /// 处理程序阐述:创建处理回收站业务逻辑一般处理程序
    /// </summary>
    public class RecycleBin : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "Bind":  //:创建初始化回收站表格的方法
                    Bind(context);
                    break;
                case "LoadModularName":  //创建加载模块名称的方法
                    LoadModularName(context);
                    break;
                case "DeleteRecycleBin":  //创建回收站数据删除方法
                    DeleteRecycleBin(context);
                    break;
                case "RestoreData":  //创建回收站数据还原的方法
                    RestoreData(context);
                    break;
                case "recydelete":  //清空回收站
                    recydelete(context);
                    break;
                case "counts":  //获取回收站总行数
                    counts(context);
                    break;
            }
        }
        /// <summary>
        /// 创建日期:2016/11/8
        /// 方法阐述:创建初始化回收站表格的方法
        /// </summary>
        /// <param name="context"></param>
        public void Bind(HttpContext context)
        {
            var pageStartIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
            var pageEndIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
            //  重新计算开始页码和结束页码
            if (pageStartIndex > pageEndIndex - pageStartIndex)
            {
                pageStartIndex = pageStartIndex - 1;
                pageEndIndex = pageEndIndex - pageStartIndex;
            }
            var modularID = Convert.ToInt32(Common.GetRequest("modularID"));
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                string enterpriseCode=Common.GetSessionValue("EnterpriseCode", context);
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                var userID = Convert.ToInt32(_uID);
                SourceTemps = MgrServices.RecycleBinService.InitiRecyleBinTable(userID, modularID,enterpriseCode, pageStartIndex, pageEndIndex);
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
                                "<input class='checkRecycleBin' data-id='"+DTR["RBID"]+"' data-tableName='"+DTR["RBTableName"]+"' data-fieldName='"+DTR["RBFieldName"]+"' data-fieldValue='"+DTR["RBFieldValue"]+"' data-fieldNameDelete='"+DTR["RBDeleteFieldName"]+"' type='checkbox'>",
                                (pageStartIndex+i).ToString(),
                                DTR["RBTitle"].ToString(),
                                DTR["RBExcutePerson"].ToString(),
                                DTR["Fun_Name"].ToString(),
                                DTR["RBDeleteTime"].ToString(),
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
        ///// <summary>
        ///// 创建日期:2016/11/8
        ///// 方法阐述:创建加载模块名称的方法
        ///// </summary>
        public void LoadModularName(HttpContext context)
        {
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            string role_type = Convert.ToString(_uID);

            string json = JsonConvert.SerializeObject(MgrServices.FunctionService.SelectRoleName(role_type));
            context.Response.Write(json);
        }
        /// <summary>
        /// 创建日期:2016/11/11
        /// 方法阐述:创建回收站数据删除方法
        /// </summary>
        /// <param name="context"></param>
        public void DeleteRecycleBin(HttpContext context)
        {
            var isSuccess = true;

            string[] str = Common.GetRequest("rBID").Split(',');

            for (int i = 0; i < str.Length; i++)
            {
                if (!string.IsNullOrEmpty(str[i]))
                {
                    if (!MgrServices.RecycleBinService.DeleteRecycleBinByRBID(Convert.ToInt32(str[i])))
                    {
                        isSuccess = false;
                        break;
                    }
                }
            }
            context.Response.Write(isSuccess);
        }
        /// <summary>
        /// 创建日期:2016/11/11
        /// 方法阐述:创建回收站数据还原的方法
        /// </summary>
        /// <param name="context"></param>
        public void RestoreData(HttpContext context)
        {
            bool result = false;
            try
            {
                var json = Common.GetRequest("DataJson");
                if (json.IndexOf("[") == -1)
                {
                    if (json.IndexOf("ArchivesMeasurement") == -1) //没有找到
                    {
                        RestoreModel model = JsonConvert.DeserializeObject<RestoreModel>(json);
                        result = MgrServices.RecycleBinService.RestoreData(model.RBID, model.TableName, model.FieldName, model.FieldValue, model.FieldNameDelete);
                    }
                    if (json.IndexOf("ArchivesMeasurement") >= 1) //找到了
                    {
                        RestoreModel model = JsonConvert.DeserializeObject<RestoreModel>(json);
                        result = MgrServices.RecycleBinService.InsertData(model.RBID, model.TableName, model.FieldName, model.FieldValue, model.FieldNameDelete);
                    }
                }
                else
                {
                    List<RestoreModel> model = JsonConvert.DeserializeObject<List<RestoreModel>>(json);
                    for (int i = 0; i < model.Count; i++)
                    {
                        result = MgrServices.RecycleBinService.RestoreData(model[i].RBID, model[i].TableName, model[i].FieldName, model[i].FieldValue, model[i].FieldNameDelete);
                    }
                }
                context.Response.Write(result);
            }
            catch (Exception ex)
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 清空回收站
        /// </summary>
        /// <param name="context"></param>
        public void recydelete(HttpContext context)
        {
            string userID = Common.GetSessionValue("UserID", context);
            if (userID == null)
                return;
            bool result = MgrServices.RecycleBinService.recydelete(userID);
            context.Response.Write(result);
        }
        /// <summary>
        /// 获取回收站总行数
        /// </summary>
        /// <param name="context"></param>
        public void counts(HttpContext context)
        {
            string Encode = Common.GetSessionValue("UserID", context);
            if (Encode == null)
                return;
            int result = MgrServices.RecycleBinService.counts(Encode);
            context.Response.Write(result);
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