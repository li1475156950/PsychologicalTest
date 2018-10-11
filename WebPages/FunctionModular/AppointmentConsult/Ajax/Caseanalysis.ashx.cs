using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using WebPages.GroupConsultationService;

namespace WebPages.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// Caseanalysis 的摘要说明
    /// </summary>
    public class Caseanalysis : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "Bind":// 绑定列表
                    Bind(context);
                    break;
                case "Add":  //添加案列分析
                    CAdd(context);
                    break;
            }



        }
        /// <summary>
        /// 案例分析列表 显示
        /// </summary>
        /// <param name="context"></param>
        public void Bind(HttpContext context)
        {
            int startRowIndex = Convert.ToInt32(Common.GetRequest("startRowIndex"));// 行开始下标
            int endRowIndex = Convert.ToInt32(Common.GetRequest("endRowIndex"));// 行结束下标
            //  重新计算开始页码和结束页码
            if (startRowIndex > endRowIndex - startRowIndex)
            {
                startRowIndex = startRowIndex - 1;
                endRowIndex = endRowIndex - startRowIndex;
            }
            DataSet ds = MgrServices.GroupConsultationService.GetCaseanalysisList(startRowIndex, endRowIndex);// 数据源
            DataTable tempDataTable;// 数据源
            try
            {
                // 实例化分页实体
                PageInfo page = new PageInfo();
                // 获取结果集


                // 结果集不为空 或者 为相应结果集数量
                if (ds != null && ds.Tables.Count == 2)
                {

                    // 获取总行数
                    page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0]["total"]);
                    // 获取 问题类型集
                    tempDataTable = ds.Tables[1];
                    int i = 0;
                    foreach (DataRow dr in tempDataTable.Rows)
                    {
                        i++;

                        // 返回参数
                        String[] arr =
                            {  
                              
                                (startRowIndex+i).ToString(),                               
                                dr["CTitle"].ToString(),
                                dr["CPath"].ToString(),                             
                                dr["Qtype"].ToString(),                                                          
                                ""
                               
                            };
                        page.data.Add(arr);
                    }
                }

                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);

            }
            catch (Exception)
            {

                throw;
            }
        }


        /// <summary>
        /// 添加案列分析
        /// </summary>
        /// <param name="context"></param>
        public void CAdd(HttpContext context)
        {
            //获取上传的文件的对象  
            HttpPostedFile img = context.Request.Files["btnfile"];

            //获取上传文件的名称  
            string s = img.FileName;
            //截取获得上传文件的名称(ie上传会把绝对路径也连带上，这里只得到文件的名称)  
            string str = s.Substring(s.LastIndexOf("\\") + 1);
            //给文件添加随机戳  
            string path = "/FunctionModular/AppointmentConsult/Upload/" + Guid.NewGuid() + ".html";

            //保存文件  
            img.SaveAs(context.Server.MapPath(path));
            CaseanalysisModel model = new CaseanalysisModel();
            model.CTitle = Common.GetRequest("Ctitle");
            model.Qtype = Common.GetRequest("Qtype");
            model.CPath = path;
            bool result = MgrServices.GroupConsultationService.InsertCaseanalysis(model);
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