using BR_Service;
using MyExection;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPages.DistributeRecordService;
using WebPages.projrem;

namespace WebPages.FunctionModular.PersonalReport
{
    public partial class PersonalReport1 : System.Web.UI.Page
    {
        public int Auserid;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_import_07_click(object sender, EventArgs e)
        {
            //try
            //{
              
                List<UserExportInfo> lu = JsonDeserialize<List<UserExportInfo>>(Request["userInfoList"]);
                List<string> ls = JsonDeserialize<List<string>>(Request["amountNameList"]);
                for (int i = 0; i < ls.Count; i++)  //外循环是循环的次数
                {
                    for (int j = ls.Count - 1; j > i; j--)  //内循环是 外循环一次比较的次数
                    {

                        if (ls[i] == ls[j])
                        {
                            ls.RemoveAt(j);
                        }
                    }
                }
                List<FileInfo> li = new List<FileInfo>();
                //string AUserID = "110,108";
                string fileName = "";
                string path = "";
               
                for (int i = 0; i < ls.Count; i++)
                {
                    List<UserExportInfo> luTemp = lu.Where(m => m.AmountName == ls[i]).ToList();
                    string aae = lu[i].AnswerID.ToString();
                    StringBuilder builder = new StringBuilder();
                    FileInfo file = null;
                    StreamWriter sw;
                    if (ls[i].IndexOf("Rutter儿童行为问卷") > -1)
                    {
                        GetToWordS(luTemp, out fileName, out path, out builder, out file, out sw);
                    }
                    else
                    {
                        
                        GetToWord(luTemp, out fileName, out path, out builder, out file, out sw, li.Count + 1);
                    }
                    sw.Write(builder);
                    sw.Close();
                    li.Add(file);
                }
                fileName = DateTime.Now.ToString("yyyyMMddhhmm") + "_Download.zip";//重新赋值为zip文件名称
                path = Server.MapPath("~/xls_down/" + fileName + ".xls");
                FileCompression.Compress(li, path, 5, 5);//压缩
                Response.Clear();
                Response.Buffer = true;
                this.EnableViewState = false;
                Response.Charset = "utf-8";
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(path);
                Response.Flush();
                //Response.Close();
                HttpContext.Current.Response.End(); 
            //}
            //catch (Exception ex)
            //{
            //    Response.End();
              
            //}
            //finally
            //{
            //    HttpContext.Current.Response.End(); 
            //}


        }
        void downloadfile(string s_path)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(s_path);
            HttpContext.Current.Response.ContentType = "application/ms-download";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Type", "application/octet-stream");
            HttpContext.Current.Response.Charset = "utf-8";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + System.Web.HttpUtility.UrlEncode(file.Name, System.Text.Encoding.UTF8));
            HttpContext.Current.Response.AddHeader("Content-Length", file.Length.ToString());
            HttpContext.Current.Response.WriteFile(file.FullName);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.End();
        }

        public void Export()
        {

            List<UserExportInfo> lu = JsonDeserialize<List<UserExportInfo>>(Common.GetRequest("userInfoList"));
            List<string> ls = JsonDeserialize<List<string>>(Common.GetRequest("amountNameList"));
            for (int i = 0; i < ls.Count; i++)  //外循环是循环的次数
            {
                for (int j = ls.Count - 1; j > i; j--)  //内循环是 外循环一次比较的次数
                {

                    if (ls[i] == ls[j])
                    {
                        ls.RemoveAt(j);
                    }
                }
            }
            List<FileInfo> li = new List<FileInfo>();
            //string AUserID = "110,108";
            string fileName = "";
            string path = "";
            for (int i = 0; i < ls.Count; i++)
            {
                List<UserExportInfo> luTemp = lu.Where(m => m.AmountName == ls[i]).ToList();
                string aae = lu[i].AnswerID.ToString();
                StringBuilder builder;
                FileInfo file;
                StreamWriter sw;
                GetToWord(luTemp, out fileName, out path, out builder, out file, out sw, li.Count + 1);
                sw.Write(builder);
                sw.Close();
                li.Add(file);
            }
            fileName = DateTime.Now.ToString("yyyyMMddhhmm") + "_Download.zip";//重新赋值为zip文件名称
            path = Server.MapPath("~/xls_down/" + fileName + ".xls");
            FileCompression.Compress(li, path, 5, 5);//压缩
            Response.Clear();
            Response.Buffer = true;
            this.EnableViewState = false;
            Response.Charset = "utf-8";
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
            Response.ContentType = "application/octet-stream";
            Response.WriteFile(path);
            Response.Flush();
            Response.Close();
            Response.End();


        }

        public void GetToWord(List<UserExportInfo> lu, out string fileName, out string path, out StringBuilder builder, out FileInfo file, out StreamWriter sw, int lenght)
        {

            //AnswerID = "110";
            string StrJson = "";
            string Scorehtml = "";
            string ConvertScoreHtml = "";
            int AnswerID = 0;
             string AName = "";
            DataSet dataset = new DataSet();
            for (int i = 0; i < lu.Count; i++)
            {
                DataSet datasetTemp = MgrServices.PersonalReportService.ReportExport(lu[i].AnswerID.ToString());
                AName = lu[i].AmountName;
                dataset.Merge(datasetTemp, true, MissingSchemaAction.AddWithKey);
            }

            DataTable dt = new DataTable();
            DataTable UserInfodt = new DataTable();
            if (dataset.Tables.Count > 0)
            {
                dt = dataset.Tables[0];
                UserInfodt = dataset.Tables[1];
            }

            List<SpecialReportReport> lr = new List<SpecialReportReport>();
            DateTime RCreatetime = DateTime.Now;
            #region 非空
            if (dt.Rows.Count != 0)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        SpecialReportReport ReportObj = new SpecialReportReport();
                        StrJson = dt.Rows[j]["ReportJson"].ToString();
                        AnswerID = Convert.ToInt32(dt.Rows[j]["AnsweID"].ToString());
                        if (StrJson != null && StrJson != "")
                        {
                            ReportObj = JsonDeserialize<SpecialReportReport>(StrJson);
                            if (ReportObj.DimensionEntitys != null)
                            {
                                lr.Add(ReportObj);
                            }
                            else
                            {
                                AnswerAddEntity AEntity = MgrServices.DistributeRecordService.GetAnswerAddEntity(AnswerID);
                                string strjosn = "";
                                string Acodes = AEntity._amount_code;
                                string AnswerJson = AEntity._answeradd_record;
                                string Record = AnswerJson;
                                int Scores = AEntity._answeradd_score;
                                UpdateReportInsert(Acodes, AnswerJson, Record, AName, Scores, out strjosn);
                                ReportObj = JsonDeserialize<SpecialReportReport>(strjosn);
                                lr.Add(ReportObj);//修改
                            }

                        }
                        else
                        {
                            AnswerAddEntity AEntity = MgrServices.DistributeRecordService.GetAnswerAddEntity(AnswerID);
                            string strjosn = "";
                            string Acodes = AEntity._amount_code;
                            string AnswerJson = AEntity._answeradd_record;
                            string Record = AnswerJson;
                            int Scores = AEntity._answeradd_score;
                            UpdateReportInsert(Acodes, AnswerJson, Record, AName, Scores, out strjosn);
                            ReportObj = JsonDeserialize<SpecialReportReport>(strjosn);
                            lr.Add(ReportObj);//修改
                        }
                        RCreatetime = DateTime.Parse(dt.Rows[j]["R_CreateDate"].ToString());
                    }
                }

                builder = new StringBuilder();
                //存储路径  rtManager.Items[0].FindControl("check_Item")
                // fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + new Random(DateTime.Now.Second).Next(10000);
                fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + "_" + lenght.ToString();
                path = Server.MapPath("~/xls_down/" + fileName + ".xls");
                file = new FileInfo(path);
                //创建字符输出流
                sw = new StreamWriter(path, true, System.Text.UnicodeEncoding.UTF8);

                //需要导出的内容
                builder.Append("<html><head></head><body><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width='98%' >");
                //获取的量表维度         
                if (lr[0].DimensionEntitys.Count > 0)
                {
                    builder.Append("<tr><td colspan=\"" + (lr[0].DimensionEntitys.Count * 2 + 6) + "\" align=\"center\">" + lr[0].DimensionEntitys[0].AName + "的报告详细</td></tr>");
                }
                else
                {
                    builder.Append("<tr><td colspan=\"" + (0 * 2 + 6) + "\" align=\"center\">" + lr[0].DimensionEntitys[0].AName + "的报告详细</td></tr>");
                }
                string Acode = lr[0].DimensionEntitys[0].Acodes;
                //生成表格标题栏  --获取所有该量表的所有维度名称
                builder.Append("<tr><td align=\"center\" rowspan=\"2\">用户名</td><td align=\"center\" rowspan=\"2\">真实姓名</td><td align=\"center\" rowspan=\"2\">性别</td><td align=\"center\" rowspan=\"2\">年龄</td><td align=\"center\" rowspan=\"2\">部门</td>");

                if (lr[0].DimensionEntitys != null)
                {
                    if (Acode == "LB_14808297050440")
                    {
                        lr[0].DimensionEntitys.Add(lr[0].DimensionEntitys[0]);
                        lr[0].DimensionEntitys.RemoveAt(0);
                    }
                    if (Acode == "LB_14809330635970")
                    {
                        builder.Append("<td align=\"center\" colspan=\"2\">总评</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                    }
                    else
                    {
                        for (int i = 0; i < lr[0].DimensionEntitys.Count; i++)
                        {
                            builder.Append("<td align=\"center\" colspan=\"2\">" + lr[0].DimensionEntitys[i].WD_Name + "</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                        }
                    }
                    builder.Append("</tr>");
                    builder.Append("<tr>");
                    if (Acode == "LB_14809330635970")
                    {
                        builder.Append("<td align=\"center\">原始分</td><td align=\"center\">标准分</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                    }
                    else
                    {
                        for (int k = 0; k < lr[0].DimensionEntitys.Count; k++)
                        {
                            builder.Append("<td align=\"center\">原始分</td><td align=\"center\">标准分</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                        }
                    }
                    builder.Append("</tr>");
                    if (UserInfodt.Rows.Count > 0)
                    {
                        for (int k = 0; k < UserInfodt.Rows.Count; k++)
                        {
                            int Ages = 0;
                            string Birthday = UserInfodt.Rows[k]["U_Birthday"].ToString();
                            if (Birthday != null && Birthday != "")
                            {
                                DateTime U_Birthday = DateTime.Parse(UserInfodt.Rows[k]["U_Birthday"].ToString());
                                Ages = CalculateAgeCorrect(U_Birthday, RCreatetime);
                            }
                            else
                            {
                                Ages = 0;
                            }

                            if (Acode == "LB_14808297050440")
                            {
                                if (k > 0)
                                {
                                    lr[k].DimensionEntitys.Add(lr[k].DimensionEntitys[0]);
                                    lr[k].DimensionEntitys.RemoveAt(0);
                                }
                            }
                            builder.Append("<tr><td align=\"center\" >" + UserInfodt.Rows[k]["U_LoginName"] + "</td><td align=\"center\">" + UserInfodt.Rows[k]["U_Name"] + "</td><td align=\"center\">" + UserInfodt.Rows[k]["U_Sex"] + "</td><td align=\"center\">" + Ages + "</td><td align=\"center\">" + UserInfodt.Rows[k]["D_name"] + "</td>" + Scorehtml + "");
                            builder.Append(GetScoreHtml(lr[k]));
                            builder.Append("</tr>");
                        }

                    }

                }


                builder.Append("</table></body></html>");
            }
            else
            {
                builder = new StringBuilder();
                fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + "_" + lenght.ToString();
                path = Server.MapPath("~/xls_down/" + fileName + ".xls");
                file = new FileInfo(path);
                //创建字符输出流
                sw = new StreamWriter(path, true, System.Text.UnicodeEncoding.UTF8);
                //需要导出的内容
                builder.Append("<html><head></head><body><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width='98%' >");
                builder.Append("<tr><td>暂无数据</td></tr>");
                builder.Append("</table></body></html>");
            }
            #endregion
            
        }
        public string GetScoreHtml(SpecialReportReport lr)
        {
            string ConvertScoreHtml = "";
            ConvertScoreHtml=  MgrServices.DistributeRecordService.GetScoreHtml(lr);
            return ConvertScoreHtml;
        }
        public string GetScoreHtmlS(SpecialReportReport lr)
        {
            string ConvertScoreHtml = "";
            ConvertScoreHtml = MgrServices.DistributeRecordService.GetScoreHtmlS(lr);
            return ConvertScoreHtml;
        }
        public void GetToWordS(List<UserExportInfo> lu, out string fileName, out string path, out StringBuilder builder, out FileInfo file, out StreamWriter sw)
        {

            //AnswerID = "110";
            string StrJson = "";
            string Scorehtml = "";
            string ConvertScoreHtml = "";

            DataSet dataset = new DataSet();
            for (int i = 0; i < lu.Count; i++)
            {
                DataSet datasetTemp = MgrServices.PersonalReportService.ReportExport(lu[i].AnswerID.ToString());
                dataset.Merge(datasetTemp, true, MissingSchemaAction.AddWithKey);
            }

            DataTable dt = new DataTable();
            DataTable UserInfodt = new DataTable();
            if (dataset.Tables.Count > 0)
            {
                dt = dataset.Tables[0];
                UserInfodt = dataset.Tables[1];
            }

            List<SpecialReportReport> lr = new List<SpecialReportReport>();
            DateTime RCreatetime = DateTime.Now;
            if (dt.Rows.Count > 0)
            {
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    SpecialReportReport ReportObj = new SpecialReportReport();
                    StrJson = dt.Rows[j]["ReportJson"].ToString();
                    if (StrJson != null && StrJson != "")
                    {
                        ReportObj = JsonDeserialize<SpecialReportReport>(StrJson);
                        lr.Add(ReportObj);
                    }
                    RCreatetime = DateTime.Parse(dt.Rows[j]["R_CreateDate"].ToString());
                }
            }

            builder = new StringBuilder();
            //存储路径  rtManager.Items[0].FindControl("check_Item")
            fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + new Random(DateTime.Now.Second).Next(10000);
            path = Server.MapPath("~/xls_down/" + fileName + ".xls");
            file = new FileInfo(path);
            //创建字符输出流
            sw = new StreamWriter(path, true, System.Text.UnicodeEncoding.UTF8);

            //需要导出的内容
            builder.Append("<html><head></head><body><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width='98%' >");
            //获取的量表维度 
            if (lr != null && lr[0].DimensionEntitys!=null)
            {
                if (lr[0].DimensionEntitys != null )
                {
                    builder.Append("<tr><td colspan=\"" + (lr[0].DimensionEntitys.Count * 2 + 6) + "\" align=\"center\">" + lr[0].DimensionEntitys[0].AName + "的报告详细</td></tr>");
                }
                else
                {
                    builder.Append("<tr><td colspan=\"" + (0 * 2 + 6) + "\" align=\"center\">" + lr[0].DimensionEntitys[0].AName + "的报告详细</td></tr>");
                }
                string Acode = lr[0].DimensionEntitys[0].Acodes;
                //生成表格标题栏  --获取所有该量表的所有维度名称
                builder.Append("<tr><td align=\"center\" rowspan=\"2\">用户名</td><td align=\"center\" rowspan=\"2\">真实姓名</td><td align=\"center\" rowspan=\"2\">性别</td><td align=\"center\" rowspan=\"2\">年龄</td><td align=\"center\" rowspan=\"2\">部门</td>");

                if (lr[0].DimensionEntitys != null)
                {
                    builder.Append("<td align=\"center\" colspan=\"2\">总评</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                    builder.Append("</tr>");
                    builder.Append("<tr>");
                    for (int k = 0; k < 1; k++)
                    {
                        builder.Append("<td align=\"center\">原始分</td><td align=\"center\">标准分</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                    }
                    builder.Append("</tr>");
                    if (UserInfodt.Rows.Count > 0)
                    {
                        for (int k = 0; k < UserInfodt.Rows.Count; k++)
                        {
                            int Ages = 0;
                            string Birthday = UserInfodt.Rows[k]["U_Birthday"].ToString();
                            if (Birthday != null && Birthday != "")
                            {
                                DateTime U_Birthday = DateTime.Parse(UserInfodt.Rows[k]["U_Birthday"].ToString());
                                Ages = CalculateAgeCorrect(U_Birthday, RCreatetime);
                            }
                            else
                            {
                                Ages = 0;
                            }
                           
                            builder.Append("<tr><td align=\"center\" >" + UserInfodt.Rows[k]["U_LoginName"] + "</td><td align=\"center\">" + UserInfodt.Rows[k]["U_Name"] + "</td><td align=\"center\">" + UserInfodt.Rows[k]["U_Sex"] + "</td><td align=\"center\">" + Ages + "</td><td align=\"center\">" + UserInfodt.Rows[k]["D_name"] + "</td>" + Scorehtml + "");
                            builder.Append(GetScoreHtmlS(lr[k]));
                            builder.Append("</tr>");
                        }
                    }

                }
            }

            builder.Append("</table></body></html>");
        }

        public void UpdateReportInsert(string Acode, string AnswerJson, string Record, string AName, int Score, out string strjosn)
        {

            WebPages.projrem.PersonReport obj = new PersonReport(Acode, AnswerJson, Record, AName, Score);
            WebPages.PersonalReportService.R_ReportEntity entityInfos = new WebPages.PersonalReportService.R_ReportEntity();
            strjosn = JsonConvert.SerializeObject(obj);
            entityInfos._reportjson = strjosn;
            //entityInfos._createuid = UID;
            ////entityInfo._answeradd_id = answerid;
            //entityInfos._answeid = answerid;
            entityInfos._r_createdate = DateTime.Now;
            long ss = -1;
            if (obj.UserINfos != null && obj.DimensionEntitys != null)
            {
                ss = MgrServices.PersonalReportService.R_ReportInsert(entityInfos);

            }
            else
            {
                throw new CustomException("更新出错", " UpdateReportInsert", "更新我数据导出");
            }

        }
        //根据提交日期和出生日期算年龄
        public int CalculateAgeCorrect(DateTime birthDate, DateTime RCreatime)
        {
            int age = RCreatime.Year - birthDate.Year;
            if (RCreatime.Month < birthDate.Month || (RCreatime.Month == birthDate.Month && RCreatime.Day < birthDate.Day)) age--;
            return age;
        }
        /// <summary>
        /// 反序列化json
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="jsonString"></param>
        /// <returns></returns>
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString)))
            {
                return (T)ser.ReadObject(ms);
            }
        }
    }
    public class Report
    {
        /// <summary>
        /// 维度的详细信息
        /// </summary>
        public class DimensionEntity
        {
            /// <summary>
            /// 维度名称
            /// </summary>
            public string WD_Name { get; set; }

            /// <summary>
            /// 维度编码
            /// </summary>
            public string D_Code { get; set; }
            /// <summary>
            /// 维度得分-原始分
            /// </summary>
            public double Score;
            //public List<CMModel> CMlist { get; set; }

            /// <summary>
            /// 常模状态
            /// </summary>
            public string _NormName { get; set; }
            /// <summary>
            /// 转化分
            /// </summary>
            public double ConversionScore { get; set; }//转化分

            /// <summary>
            /// 转化公式
            /// </summary>
            public string ConversionFormula { get; set; }

            public int scoretype { get; set; }

            public string Rdeor { get; set; }

            public string Formulas { get; set; }
            public string Acodes { get; set; }
            public string AName { get; set; }

        }
        public class UserInfo
        {
            public double MaxValue { get; set; }
            public double MinValue { get; set; }
            public string AnswerRecord { get; set; }

        }
        [DataMember]
        public List<UserInfo> UserINfos { get; set; }
        [DataMember]
        public List<DimensionEntity> DimensionEntitys { get; set; }
    }

}