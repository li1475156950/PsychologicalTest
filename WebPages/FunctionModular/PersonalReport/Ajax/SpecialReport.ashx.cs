using BR_Service;
using CalcExpression;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using WebPages.projrem;
namespace WebPages.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// SpecialReport 的摘要说明
    /// </summary>
    public class SpecialReport : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            context.Response.ContentType = "text/plain";
            string remark = Common.GetRequest("Remark");
            switch (remark)
            {
                case "InitPages":
                    InitPages(context);
                    break;
                case "InitWDPages":  //加载测试结果维度解释明细
                    InitWDPages(context);
                    break;
                case "TSLBJson":    //获取导入模板里面的json
                    GetAnalyJson(context);
                    break;



            }
        }
        string Scores ="";
        public void InitPages(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            SourceTemp = GetAmountTempByCode();
            Scores = SourceTemp.Rows[0]["AnswerAdd_score"].ToString();
            context.Response.Cookies["ScoresA"].Value = Scores;
            if (SourceTemp != null && SourceTemp.Rows.Count > 0)
            {
                String[] arr ={
                                  SourceTemp.Rows[0]["AnswerAdd_ID"].ToString(), //回答ID0
                                  SourceTemp.Rows[0]["AnswerAdd_Record"].ToString(), //答题记录1
                                  //SourceTemp.Rows[0]["AnswerAdd_Code"].ToString(), //答题编码2
                                  SourceTemp.Rows[0]["U_LoginName"].ToString(),
                                  SourceTemp.Rows[0]["Answer_StartTimer"].ToString(), //答题开始时间4
                                  SourceTemp.Rows[0]["Answer_CreateTime"].ToString(), //答题结束时间5
                                  SourceTemp.Rows[0]["AnswerMin_Time"].ToString(), //答题标准时间最小6
                                  SourceTemp.Rows[0]["AnswerMax_Time"].ToString(), //答题标准时间最大7
                                  SourceTemp.Rows[0]["AmountIntroduce"].ToString(), //量表介绍 -修改2012.12.08  8  
                                  SourceTemp.Rows[0]["Amount_Code"].ToString(), //量表编码   9     
                                  SourceTemp.Rows[0]["Amount_SubjectNum"].ToString(),//量表题干数量 10
                                  SourceTemp.Rows[0]["Amount_DisplayName"].ToString(),//量表显示名称  11
                                  SourceTemp.Rows[0]["U_Name"].ToString(), //量表介绍   12
                                  SourceTemp.Rows[0]["U_Sex"].ToString(), //量表编码        13
                                  SourceTemp.Rows[0]["U_Birthday"].ToString(),//量表题干数量 14
                                  SourceTemp.Rows[0]["U_Age"].ToString(),//年龄 //15
                                  Scores,
                                  
                                 };
                string SourceJson = new JavaScriptSerializer().Serialize(arr);
                context.Response.Write(SourceJson);
            }
            else
            {
                context.Response.Write("");
            }


        }
        public DataTable GetAmountTempByCode()
        {
            DataTable sourceTemp = new DataTable();
            try
            {
                int answerID = Convert.ToInt32(Common.GetRequest("A_ID"));
                sourceTemp = MgrServices.PresentationService.GetAnswerTemp(answerID);

            }
            catch
            {

            }
            return sourceTemp;
        }
        /// <summary>
        /// 加载测试结果维度解释明细
        /// </summary>
        public void InitWDPages(HttpContext context)
        {

            string Acode = Common.GetRequest("A_code");
            int types = Convert.ToInt32(Common.GetRequest("types"));
            if (types == 3)
            {
                TSLB3(Acode, context);//痴呆量表
            }
           
            else if (types == 6)
            {
                TSLB6(Acode,context);
            }
            else if (types == 8)
            {
                TSLB8(Acode, context);
            }
            else if (types == 9 || types == 901 || types==801 ||  types==802 || types==14 || types==10 || types==13 || types==7 || types==16 || types==15 || types==17 || types==4)//艾森克人格问卷
            {
                TSLB9(Acode,types, context);
            }
            else if (types == 11)
            {
                TSLB11(Acode, context);
            }
            else if (types == 1)
            {
                TSLB1(Acode, context);
            }
            
            else if (types == 14)
            {
                TSLB11(Acode,context);
            }
           
           
            else if (types == 15)
            {
                TSLB11(Acode, context);
            }
           
            else if (types == 18)
            {
                TSLB18(Acode, context);
            }
        }
        #region 特殊量表1
        private void TSLB1(string Acode,HttpContext context)
        {

            try
            {
                int AnswerID = 0;
                int Age = 0;
                int sexval = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(1,Acode,AnswerID,AnswerJson,"","",Age,sexval);
                context.Response.Write(result);
            }
            catch
            {
                context.Response.Write(null);
            }
        }
        #endregion
        #region 特殊量表3
        //痴呆简易量表
        public void TSLB3(string Acode,HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                string ScoresA = "";
                int AnswerID =0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                string AnswerIDs = AnswerID.ToString();
                string AR = CommonRepoert.GetAnswerRecordA(AnswerIDs, out ScoresA);
                string result = MgrServices.PresentationService.GetSpecialReport(3, Acode, AnswerID, "", AR, ScoresA,Age,sexval);
                context.Response.Write(result);
            }
            catch
            {

            }
        }
        #endregion
        #region 特殊量表4
        public void TSLB4(string Acode, HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                string ScoresA = context.Response.Cookies["ScoresA"].Value;
                string result = MgrServices.PresentationService.GetSpecialReport(4, Acode, 0, "", "", ScoresA,Age,sexval);
                context.Response.Write(result);
            }
            catch
            {

            }
        }
        #endregion
        # region 特殊量表6
        public void TSLB6(string Acode, HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(6, Acode, AnswerID, AnswerJson, "", "",Age,sexval);
                context.Response.Write(result);
            }
            catch
            {

            }
        }
        #endregion
        #region 特殊量表8
        public void TSLB8(string Acode, HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(8, Acode, AnswerID, AnswerJson, "", "",Age,sexval);
                context.Response.Write(result);
            }
            catch
            {

            }
        }
        #endregion
        #region 特殊量表11
        public void TSLB11(string Acode, HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(11, Acode, AnswerID, AnswerJson, "", "", Age, sexval);
                context.Response.Write(result);
            }
            catch
            {

            }

        }
        #endregion
        #region 特殊量表9
        public void TSLB9(string Acode,int Type, HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                sexval = Convert.ToInt32(Common.GetRequest("sexval"));
                Age = Convert.ToInt32(Common.GetRequest("AgeVAl"));
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(Type, Acode, AnswerID, AnswerJson, "", "", Age, sexval);
                context.Response.Write(result);
            }
            catch
            {

            }
        }
        #endregion
        #region 特殊量表802
        public void TSLB802(string Acode, HttpContext context)
        {
            try
            {
                int Age = 0;
                int sexval = 0;
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(1, Acode, AnswerID, AnswerJson, "", "", Age, sexval);
                context.Response.Write(result);
            }
            catch
            {

            }

        }
        #endregion
      
        #region 特殊量表18
        public void TSLB18(string Acode, HttpContext context)
        {
            try
            {
                int AnswerID = 0;
                int Age = 0;
                int sexval = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                string AnswerJson = Common.GetRequest("An_json");
                string result = MgrServices.PresentationService.GetSpecialReport(18, Acode, AnswerID, AnswerJson, "", "", Age, sexval);
                context.Response.Write(result);
            }
            catch
            {

            }
        }
        #endregion


        /// <summary>
        /// 获取导入模板里面的json
        /// </summary>
        /// <param name="context"></param>
        public void GetAnalyJson(HttpContext context)
        {
            try
            {

                DataTable sourceTemp = new DataTable();
                sourceTemp = GetGetAnalyTemp();
                string AnalyJson = "";
                if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                {
                    AnalyJson = sourceTemp.Rows[0]["AnalyBaseJson"] == DBNull.Value ? "" : sourceTemp.Rows[0]["AnalyBaseJson"].ToString();
                }
                context.Response.Write(AnalyJson);

            }
            catch
            {


            }

        }
        /// <summary>
        /// 获取统计分析的F对比值
        /// </summary>
        /// <returns></returns>
        private DataTable GetGetAnalyTemp()
        {

            DataTable SourceTemp = new DataTable();

            try
            {
                string TSLBType = Common.GetRequest("TSLBType");
                SourceTemp = MgrServices.StatisticalService.GetAnalyBaseTemp(TSLBType);
            }
            catch
            {

            }
            return SourceTemp;
        }


        /// <summary> 
        /// 由中序式转换成后序式，再用栈来进行计算 
        /// </summary> 
        /// <param name="expression">表达式</param> 
        /// <returns></returns> 
        public static float CalcByCalcParenthesesExpression(string expression)
        {
            string result = new CalcParenthesesExpression().CalculateParenthesesExpression(expression);
            return float.Parse(result);
        }
        protected void WriteFile(string errorMesg)
        {
            try
            {
                string Path = "D:/ExceptionLog/" + System.DateTime.Now.ToShortDateString().Replace("/", "-") + ".log";
                if (!System.IO.File.Exists(Path))
                {
                    System.IO.FileStream f = System.IO.File.Create(Path);
                    f.Close();
                }
                System.IO.StreamWriter f2 = new System.IO.StreamWriter(Path, true, System.Text.Encoding.GetEncoding("gb2312"));
                f2.WriteLine(errorMesg);
                f2.Close();
                f2.Dispose();
            }
            catch { }
        }
        /// <summary>
        /// 根据量表编码查询量表对应的维度集合
        /// </summary>
        /// <returns></returns>
      

    
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
    public class HLDModel
    {
        public string HLDname { get; set; }
        public string HLDCode { get; set; }
        public double HLDvalues { get; set; }
    }
}