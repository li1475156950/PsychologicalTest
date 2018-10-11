using BR_Service;
using CalcExpression;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using Svg;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using WebPages.PersonalReportService;
using WebPages.projrem;
namespace WebPages.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// PersonalReportInfo 的摘要说明
    /// </summary>
    public class PersonalReportInfo : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            string remark = Common.GetRequest("Remark");
            int CreateUID = 0;
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            CreateUID = Convert.ToInt32(_uID);
            switch (remark)
            {
                case "InitPages":
                    InitPages(context);
                    break;
                case "InitWDPages":      // 加载测试结果维度解释明细
                    InitWDPages(context);
                    break;
                case "SaveImage":          //把图表转成图片
                    SaveImage(context);
                    break;
                case "RInsert":   //添加一条数据
                    context.Response.Write(RInsert(CreateUID));
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
        public void InitPages(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            SourceTemp = GetAmountTempByCode();
            if (SourceTemp != null && SourceTemp.Rows.Count > 0)
            {
                string AmountInfo = "";
                string A_Soure = SourceTemp.Rows[0]["Amount_Source"] == DBNull.Value || SourceTemp.Rows[0]["Amount_Source"].ToString() == "" ? "0" : SourceTemp.Rows[0]["Amount_Source"].ToString();
                switch (A_Soure)
                {                  
                    case "1":
                        AmountInfo = SourceTemp.Rows[0]["AmountIntroduce"].ToString();//从授权平台取的量表介绍
                        break;
                    case "2":
                        AmountInfo = SourceTemp.Rows[0]["Amount_Marks"].ToString();
                        break;
                    case "3":
                        AmountInfo = SourceTemp.Rows[0]["Amount_Marks"].ToString();//从量表的表里取的量表介绍
                        break;

                }
                string Answertime = DateTime.Parse(SourceTemp.Rows[0]["Answer_CreateTime"].ToString()).ToString("yyyy-MM-dd");

                String[] arr ={
                                  SourceTemp.Rows[0]["AnswerAdd_ID"].ToString(), //回答ID0
                                  SourceTemp.Rows[0]["AnswerAdd_Record"].ToString(), //答题记录1
                                  //SourceTemp.Rows[0]["AnswerAdd_Code"].ToString(), //答题编码2
                                  SourceTemp.Rows[0]["U_LoginName"].ToString(),
                                  SourceTemp.Rows[0]["Answer_StartTimer"].ToString(), //答题开始时间3
                                  SourceTemp.Rows[0]["Answer_CreateTime"].ToString(), //答题结束时间4
                                  SourceTemp.Rows[0]["AnswerMin_Time"].ToString(), //答题标准时间最小5
                                  SourceTemp.Rows[0]["AnswerMax_Time"].ToString(), //答题标准时间最大6
                                  AmountInfo, //量表介绍 -修改2017.4.10
                                  SourceTemp.Rows[0]["Amount_Code"].ToString(), //量表编码        8
                                  SourceTemp.Rows[0]["Amount_SubjectNum"].ToString(),//量表题干数量9
                                  SourceTemp.Rows[0]["Amount_DisplayName"].ToString(),//量表显示名称10
                                  SourceTemp.Rows[0]["U_Name"
                                  
                                  
                                  ].ToString(), //量表介绍   11
                                  SourceTemp.Rows[0]["U_Sex"].ToString(), //量表编码 12       
                                  SourceTemp.Rows[0]["U_Birthday"].ToString(),//量表题干数量13
                                  SourceTemp.Rows[0]["U_Age"].ToString(),//年龄14
                                  SourceTemp.Rows[0]["AnswerAdd_score"].ToString(),//15
                                   Answertime
                                  
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
                    
                return sourceTemp;

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
            try
            {
               
                int Age = 0;
                int AnswerID = 0;                
                if (Common.GetRequest("Ages") != null && Common.GetRequest("Ages") != "")
                {
                    Age = Convert.ToInt32(Common.GetRequest("Ages"));
                }
                string Acode = Common.GetRequest("A_code");               
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                string AnswerJson = Common.GetRequest("An_json");
                string Result = MgrServices.PresentationService.GetALLInfo(Acode,Age,AnswerID,AnswerJson);
                context.Response.Write(Result);
            }
            catch
            {

            }

        }
        /// <summary>
        /// 把图表转成图片
        /// </summary>
        /// <param name="context"></param>

        public void SaveImage(HttpContext context)
        {
            if (context.Request.Form["svg"] != null)
            {
                string tType = "image/png";
                string tSvg = context.Request.Form["svg"].ToString();
                string tFileName = "";

                Random rand = new Random(24 * (int)DateTime.Now.Ticks);
                tFileName = rand.Next().ToString();

                MemoryStream tData = new MemoryStream(Encoding.UTF8.GetBytes(tSvg));

                MemoryStream tStream = new MemoryStream();
                string tTmp = new Random().Next().ToString();

                string tExt = "";
                string tTypeString = "";

                switch (tType)
                {
                    case "image/png":
                        tTypeString = "-m image/png";
                        tExt = "png";
                        break;
                    case "image/jpeg":
                        tTypeString = "-m image/jpeg";
                        tExt = "jpg";
                        break;
                    case "application/pdf":
                        tTypeString = "-m application/pdf";
                        tExt = "pdf";
                        break;
                    case "image/svg+xml":
                        tTypeString = "-m image/svg+xml";
                        tExt = "svg";
                        break;
                }

                if (tTypeString != "")
                {
                    //string tWidth = context.Request.Form["width"].ToString();
                    //string tWidth = "0";
                    Svg.SvgDocument tSvgObj = SvgDocument.Open(tData);
                    switch (tExt)
                    {
                        case "jpg":
                            tSvgObj.Draw().Save(tStream, ImageFormat.Jpeg);
                            break;
                        case "png":

                            tSvgObj.Draw().Save(tStream, ImageFormat.Png);
                            break;
                        case "pdf":
                            PdfWriter tWriter = null;
                            iTextSharp.text.Document tDocumentPdf = null;
                            try
                            {
                                tSvgObj.Draw().Save(tStream, ImageFormat.Png);
                                tDocumentPdf = new iTextSharp.text.Document(new iTextSharp.text.Rectangle((float)tSvgObj.Width, (float)tSvgObj.Height));
                                tDocumentPdf.SetMargins(0.0f, 0.0f, 0.0f, 0.0f);
                                iTextSharp.text.Image tGraph = iTextSharp.text.Image.GetInstance(tStream.ToArray());
                                tGraph.ScaleToFit((float)tSvgObj.Width, (float)tSvgObj.Height);

                                tStream = new MemoryStream();
                                tWriter = PdfWriter.GetInstance(tDocumentPdf, tStream);
                                tDocumentPdf.Open();
                                tDocumentPdf.NewPage();
                                tDocumentPdf.Add(tGraph);
                                tDocumentPdf.CloseDocument();
                            }
                            catch (Exception ex)
                            {
                                throw ex;
                            }
                            finally
                            {
                                tDocumentPdf.Close();
                                tDocumentPdf.Dispose();
                                tWriter.Close();
                                tWriter.Dispose();
                                tData.Dispose();
                                tData.Close();

                            }
                            break;

                        case "svg":
                            tStream = tData;
                            break;
                    }
                    System.IO.MemoryStream ms = new System.IO.MemoryStream(tStream.ToArray());
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                    string savePath = context.Server.MapPath("image/");

                    if (!Directory.Exists(savePath))
                    {
                        Directory.CreateDirectory(savePath);
                    }
                    savePath += tFileName + "." + tExt;
                    string SavePathImage = tFileName + "." + tExt;
                    context.Session["FirstImage"] = savePath;
                    image.Save(savePath, System.Drawing.Imaging.ImageFormat.Png);
                    image.Dispose();
                    context.Response.Write(tFileName + "." + tExt);
                }
            }
        }
        /// <summary>
        /// 添加一条数据
        /// </summary>
        /// <param name="CreateUID"></param>
        /// <returns></returns>
        public bool RInsert(int CreateUID)
        {
            R_ReportEntity entityInfo = new R_ReportEntity();
            entityInfo._reportjson = Common.GetRequest("Rjson");
            entityInfo._createuid = CreateUID;
            entityInfo._answeid = Convert.ToInt32(Common.GetRequest("AnswerID"));
            entityInfo._r_createdate = DateTime.Now;
            long ss = MgrServices.PersonalReportService.R_ReportInsert(entityInfo);
            if (ss != -1)
            {
                return true;
            }
            else
            {
                return false;
            }
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
        public DataSet GetDimensionTepByACode(string Acode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                //string Acode = Common.GetRequest("A_code");
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                    SourceTemp = MgrServices.PresentationService.GetDimensionTemp(Acode, AnswerID);
                
                return SourceTemp;
            }
            catch
            {
            }
            return SourceTemp;
        }

        /// <summary>
        /// 根据量表编码查询量表信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetAmountTemp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string A_Code = Common.GetRequest("A_code");
                SourceTemp = MgrServices.PresentationService.GetAmountTempByCode(A_Code);
            }
            catch
            {

            }
            return SourceTemp;

        }


        /// <summary>
        /// JSON反序列化
        /// </summary>
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
            T obj = (T)ser.ReadObject(ms);
            return obj;
        }

    }
    public class RecordEntity
    {
        private string _TG_Code;
        /// <summary>
        /// 题干编码
        /// </summary>
        public string TG_Code
        {
            get { return _TG_Code; }
            set { _TG_Code = value; }
        }

        private string _TZ_Code;
        /// <summary>
        /// 题支编码
        /// </summary>
        public string TZ_Code
        {
            get { return _TZ_Code; }
            set { _TZ_Code = value; }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public class DimensionEntity
    {

        private string _WD_Name;
        /// <summary>
        /// 维度名称
        /// </summary>
        public string WD_Name
        {
            get { return _WD_Name; }
            set { _WD_Name = value; }
        }

        private string _D_Code;
        /// <summary>
        /// 维度编码
        /// </summary>
        public string D_Code
        {
            get { return _D_Code; }
            set { _D_Code = value; }
        }


        private double _Score;
        /// <summary>
        /// 维度得分
        /// </summary>
        public double Score
        {
            get { return _Score; }
            set { _Score = value; }
        }



        private List<CMModel> _cmlist;
        public List<CMModel> CmmodelList
        {
            get { return _cmlist; }
            set { _cmlist = value; }
        }

        public string _json;
        /// <summary>
        /// 修改的维度的json
        /// </summary>
        public string Json
        {
            get { return _json; }
            set { _json = value; }
        }
        public string _newjson;
        public string NewJson
        {
            get { return _newjson; }
            set { _newjson = value; }
        }

        private string _NormName;
        /// <summary>
        /// 常模状态
        /// </summary>
        //public string NormName
        //{
        //    get { return _NormName; }
        //    set { _NormName = value; }
        //}
        //private List<TZ> _TGList;
        ////题干编码集合
        //public List<TZ> TGList
        //{
        //    get { return _TGList; }
        //    set { _TGList = value; }
        //}

        private double _conversionScore;//转化分
        /// <summary>
        /// 转化分
        /// </summary>
        public double ConversionScore
        {
            get { return _conversionScore; }
            set { _conversionScore = value; }
        }


        private string _ConversionFormula;
        /// <summary>
        /// 转化公式
        /// </summary>
        public string ConversionFormula
        {
            get { return _ConversionFormula; }
            set { _ConversionFormula = value; }
        }
        private int scoretype;
        public int ScoreType
        {
            get { return scoretype; }
            set { scoretype = value; }
        }

        private List<TZ> tz_List;
        /// <summary>
        /// 题支数据集合
        /// </summary>
        public List<TZ> Tz_List
        {
            get { return tz_List; }
            set { tz_List = value; }
        }

        public int scorelength;
        public int Scorelength
        {
            get { return scorelength; }
            set { scorelength = value; }
        }
        public string endscore;
        public string Endscore
        {
            get { return endscore; }
            set { endscore = value; }
        }
        public string rdeor;
        public string Rdeor
        {
            get { return rdeor; }
            set { rdeor = value; }
        }
        public int maxvalue;
        public int MaxValue
        {
            get { return maxvalue; }
            set { maxvalue = value; }
        }
        public int minvalue;
        public int MinValue
        {
            get { return minvalue; }
            set { minvalue = value; }
        }
        private string formulas;
        public string Formulas
        {
            get { return formulas; }
            set { formulas = value; }
        }
        private string cmallscore;
        public string CMAllScore
        {
            get { return cmallscore; }
            set { cmallscore = value; }

        }
        public string NormName { get; set; }
        public string Result { get; set; }
        public string Proposal { get; set; }
    }

    public class TZ
    {

        private string _tz_Code;
        /// <summary>
        /// 题支编码
        /// </summary>
        public string Tz_Code
        {
            get { return _tz_Code; }
            set { _tz_Code = value; }
        }


        private string _tz_OperationNum;
        /// <summary>
        /// 题支选项编号
        /// </summary>
        public string Tz_OperationNum
        {
            get { return _tz_OperationNum; }
            set { _tz_OperationNum = value; }
        }

        private int _Sort;
        /// <summary>
        /// 排序位置（题干序号）
        /// </summary>
        public int Sort
        {
            get { return _Sort; }
            set { _Sort = value; }
        }
    }


    public class OperationEntity
    {

        private string _OperationCode;
        /// <summary>
        /// 题支编码
        /// </summary>
        public string OperationCode
        {
            get { return _OperationCode; }
            set { _OperationCode = value; }
        }


        private string _OperationContent;
        /// <summary>
        /// 题支内容
        /// </summary>
        public string OperationContent
        {
            get { return _OperationContent; }
            set { _OperationContent = value; }
        }


        private float _OperationFraction;
        /// <summary>
        /// 题支分数
        /// </summary>
        public float OperationFraction
        {
            get { return _OperationFraction; }
            set { _OperationFraction = value; }
        }


        private string _SubjectCode;
        /// <summary>
        /// 题干编码
        /// </summary>
        public string SubjectCode
        {
            get { return _SubjectCode; }
            set { _SubjectCode = value; }
        }

        private string _Amount_Code;
        /// <summary>
        /// 量表编码
        /// </summary>
        public string Amount_Code
        {
            get { return _Amount_Code; }
            set { _Amount_Code = value; }
        }

    }




    /// <summary>
    /// 列表json数组
    /// </summary>
    public class E_CharEntity
    {

        private int[] _jsonArr;

        public int[] JsonArr
        {
            get { return _jsonArr; }
            set { _jsonArr = value; }
        }
    }
    public class CMModel
    {
      
      
       
        private string _NormName;
        public string NormName
        {
            get { return _NormName; }
            set { _NormName = value; }
        }
        private int _normsex;
        public int NormSex
        {
            get { return _normsex; }
            set { _normsex = value; }
        }

        private int _normstartage;
        public int NormStartAge
        {
            get { return _normstartage; }
            set { _normstartage = value; }
        }
        private int _normendage;
        public int NormEndAge
        {
            get { return _normendage; }
            set { _normendage = value; }
        }
        private string cmendScore;
        public string CmendScore
        {
            get { return cmendScore; }
            set { cmendScore = value; }
        }
        private string cmstartScore;
        public string CMstartScore
        {
            get { return cmstartScore; }
            set { cmstartScore = value; }
        }


    }
}