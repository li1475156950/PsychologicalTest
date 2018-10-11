using BasicsServiceUtility;
using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.SessionState;
namespace WebPages.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// ExcelImport 的摘要说明
    /// </summary>
    public class ExcelImport : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int Type = Convert.ToInt32(Common.GetRequest("type"));
            string Name = Common.GetSessionValue("loginName", context);
            if (Name == null)
                return;
            if (Type == 1)  //NPOI 导入
            {
                string fileName = context.Request["filename"];    //文件路径
                fileName = fileName.Substring(fileName.LastIndexOf('\\') + 1);

                HttpPostedFile uploadFile = context.Request.Files[0];
                //Upload(uploadFile, context);
                context.Response.Write(Upload(uploadFile, Name, context));
            }
            if (Type == 2) //EXCEL  导入
            {
                DownloadFile(context);
            }


        }
        /// <summary>
        /// NPOI 导入
        /// </summary>
        /// <param name="fileUpload"></param>
        /// <param name="Name"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public string Upload(HttpPostedFile fileUpload, string Name, HttpContext context)
        {
            string json = "";
            if (fileUpload == null)
            {
                return json;
            }
            try
            {
                //string sheetname = "Sheet1";
                //string tmpRootDir =context.Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
                //string UploadPath = context.Server.MapPath("/FunctionModular/BasicSetting/SaveFile/");
                //string path = UploadPath.Replace(tmpRootDir, "");
                //path = path.Replace(@"\", @"/");
                //string filename = Common.Upload(fileUpload, UploadPath);
                ////将硬盘路径转化为服务器路径的文件流    
                //var ip = "192.168.1.130:1007";
                ////string imagesurl2 = filename.Replace(UploadPath, ""); //转换成相对路径
                //string imagesurl2 = "20171219194958497.xls"; //转换成相对路径
                //string url = "" + ip + "/" + path + "" + imagesurl2 + "";
                //string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                //if (EnterpriseCode == null)
                //    return null;


                string sheetname = "Sheet1";
                string UploadPath = context.Server.MapPath("/FunctionModular/BasicSetting/SaveFile/");
                string filename = Common.Upload(fileUpload, UploadPath);
                //将硬盘路径转化为服务器路径的文件流      

                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return null;

                DataTable newdt = new DataTable();
                newdt =ExceTable(filename);
                newdt.TableName = "什么鬼";
                DataTable dt = MgrServices.UserAddService.Exceldt(newdt);
                //NPOI得到EXCEL的第一种方法                        
                string GetExcel = MgrServices.UserAddService.ExcelImport(dt, Name, EnterpriseCode);
                json = JsonConvert.SerializeObject(GetExcel);
                return json;

            }
            catch
            {
                return json;
            }


        }
        /// <summary>
        /// EXCEL  导入
        /// </summary>
        /// <param name="context"></param>
        public static void DownloadFile(HttpContext context)
        {
            string physicalFilePath = context.Server.MapPath("批量导入成员信息 .xls");
            FileStream stream = null;
            try
            {
                stream = new FileStream(physicalFilePath, FileMode.Open, FileAccess.Read, FileShare.Read);
                int bufSize = (int)stream.Length;
                byte[] buf = new byte[bufSize];

                int bytesRead = stream.Read(buf, 0, bufSize);
                HttpContext.Current.Response.ContentType = "application/octet-stream ";
                HttpContext.Current.Response.AppendHeader("Content-Disposition ", "attachment;filename= " + System.IO.Path.GetFileName(physicalFilePath));
                HttpContext.Current.Response.OutputStream.Write(buf, 0, bytesRead);
                HttpContext.Current.Response.End();
            }
            finally
            {
                stream.Close();
            }
        }
        private DataTable ExceTable(string path)
        {
            DataTable dt = ExcelHelper.ExcelSheetImportToDataTable(path);
            return dt;

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