﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.AmountService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Amount_InfoEntity", Namespace="http://schemas.datacontract.org/2004/07/JSBR.Model.BaseTable.Entity")]
    [System.SerializableAttribute()]
    public partial class Amount_InfoEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string _amount_codeField;
        
        private string _amount_displaynameField;
        
        private string _amount_guidanceField;
        
        private long _amount_idField;
        
        private string _amount_jianpinField;
        
        private string _amount_marksField;
        
        private string _amount_nameField;
        
        private string _amount_pinyinField;
        
        private int _amount_sourceField;
        
        private int _amount_subjectnumField;
        
        private long _amount_typeidField;
        
        private decimal _completeamountField;
        
        private System.DateTime _createtimeField;
        
        private string _end_applypeoplesField;
        
        private int _is_deleteField;
        
        private string _start_applypeoplesField;
        
        private int _u_idField;
        
        private int amountCreatePersonField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_code {
            get {
                return this._amount_codeField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_codeField, value) != true)) {
                    this._amount_codeField = value;
                    this.RaisePropertyChanged("_amount_code");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_displayname {
            get {
                return this._amount_displaynameField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_displaynameField, value) != true)) {
                    this._amount_displaynameField = value;
                    this.RaisePropertyChanged("_amount_displayname");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_guidance {
            get {
                return this._amount_guidanceField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_guidanceField, value) != true)) {
                    this._amount_guidanceField = value;
                    this.RaisePropertyChanged("_amount_guidance");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public long _amount_id {
            get {
                return this._amount_idField;
            }
            set {
                if ((this._amount_idField.Equals(value) != true)) {
                    this._amount_idField = value;
                    this.RaisePropertyChanged("_amount_id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_jianpin {
            get {
                return this._amount_jianpinField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_jianpinField, value) != true)) {
                    this._amount_jianpinField = value;
                    this.RaisePropertyChanged("_amount_jianpin");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_marks {
            get {
                return this._amount_marksField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_marksField, value) != true)) {
                    this._amount_marksField = value;
                    this.RaisePropertyChanged("_amount_marks");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_name {
            get {
                return this._amount_nameField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_nameField, value) != true)) {
                    this._amount_nameField = value;
                    this.RaisePropertyChanged("_amount_name");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _amount_pinyin {
            get {
                return this._amount_pinyinField;
            }
            set {
                if ((object.ReferenceEquals(this._amount_pinyinField, value) != true)) {
                    this._amount_pinyinField = value;
                    this.RaisePropertyChanged("_amount_pinyin");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _amount_source {
            get {
                return this._amount_sourceField;
            }
            set {
                if ((this._amount_sourceField.Equals(value) != true)) {
                    this._amount_sourceField = value;
                    this.RaisePropertyChanged("_amount_source");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _amount_subjectnum {
            get {
                return this._amount_subjectnumField;
            }
            set {
                if ((this._amount_subjectnumField.Equals(value) != true)) {
                    this._amount_subjectnumField = value;
                    this.RaisePropertyChanged("_amount_subjectnum");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public long _amount_typeid {
            get {
                return this._amount_typeidField;
            }
            set {
                if ((this._amount_typeidField.Equals(value) != true)) {
                    this._amount_typeidField = value;
                    this.RaisePropertyChanged("_amount_typeid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public decimal _completeamount {
            get {
                return this._completeamountField;
            }
            set {
                if ((this._completeamountField.Equals(value) != true)) {
                    this._completeamountField = value;
                    this.RaisePropertyChanged("_completeamount");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public System.DateTime _createtime {
            get {
                return this._createtimeField;
            }
            set {
                if ((this._createtimeField.Equals(value) != true)) {
                    this._createtimeField = value;
                    this.RaisePropertyChanged("_createtime");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _end_applypeoples {
            get {
                return this._end_applypeoplesField;
            }
            set {
                if ((object.ReferenceEquals(this._end_applypeoplesField, value) != true)) {
                    this._end_applypeoplesField = value;
                    this.RaisePropertyChanged("_end_applypeoples");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _is_delete {
            get {
                return this._is_deleteField;
            }
            set {
                if ((this._is_deleteField.Equals(value) != true)) {
                    this._is_deleteField = value;
                    this.RaisePropertyChanged("_is_delete");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _start_applypeoples {
            get {
                return this._start_applypeoplesField;
            }
            set {
                if ((object.ReferenceEquals(this._start_applypeoplesField, value) != true)) {
                    this._start_applypeoplesField = value;
                    this.RaisePropertyChanged("_start_applypeoples");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _u_id {
            get {
                return this._u_idField;
            }
            set {
                if ((this._u_idField.Equals(value) != true)) {
                    this._u_idField = value;
                    this.RaisePropertyChanged("_u_id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int amountCreatePerson {
            get {
                return this.amountCreatePersonField;
            }
            set {
                if ((this.amountCreatePersonField.Equals(value) != true)) {
                    this.amountCreatePersonField = value;
                    this.RaisePropertyChanged("amountCreatePerson");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AmountDimensionEntity", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.AmountModel")]
    [System.SerializableAttribute()]
    public partial class AmountDimensionEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private System.DateTime _createtimeField;
        
        private string _dimensioncodeField;
        
        private long _dimensionidField;
        
        private string _dimensionnameField;
        
        private int _is_deleteField;
        
        private int _scoringmodeField;
        
        private int _sortField;
        
        private int _subjectnumField;
        
        private long _u_idField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public System.DateTime _createtime {
            get {
                return this._createtimeField;
            }
            set {
                if ((this._createtimeField.Equals(value) != true)) {
                    this._createtimeField = value;
                    this.RaisePropertyChanged("_createtime");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _dimensioncode {
            get {
                return this._dimensioncodeField;
            }
            set {
                if ((object.ReferenceEquals(this._dimensioncodeField, value) != true)) {
                    this._dimensioncodeField = value;
                    this.RaisePropertyChanged("_dimensioncode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public long _dimensionid {
            get {
                return this._dimensionidField;
            }
            set {
                if ((this._dimensionidField.Equals(value) != true)) {
                    this._dimensionidField = value;
                    this.RaisePropertyChanged("_dimensionid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _dimensionname {
            get {
                return this._dimensionnameField;
            }
            set {
                if ((object.ReferenceEquals(this._dimensionnameField, value) != true)) {
                    this._dimensionnameField = value;
                    this.RaisePropertyChanged("_dimensionname");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _is_delete {
            get {
                return this._is_deleteField;
            }
            set {
                if ((this._is_deleteField.Equals(value) != true)) {
                    this._is_deleteField = value;
                    this.RaisePropertyChanged("_is_delete");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _scoringmode {
            get {
                return this._scoringmodeField;
            }
            set {
                if ((this._scoringmodeField.Equals(value) != true)) {
                    this._scoringmodeField = value;
                    this.RaisePropertyChanged("_scoringmode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _sort {
            get {
                return this._sortField;
            }
            set {
                if ((this._sortField.Equals(value) != true)) {
                    this._sortField = value;
                    this.RaisePropertyChanged("_sort");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _subjectnum {
            get {
                return this._subjectnumField;
            }
            set {
                if ((this._subjectnumField.Equals(value) != true)) {
                    this._subjectnumField = value;
                    this.RaisePropertyChanged("_subjectnum");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public long _u_id {
            get {
                return this._u_idField;
            }
            set {
                if ((this._u_idField.Equals(value) != true)) {
                    this._u_idField = value;
                    this.RaisePropertyChanged("_u_id");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="AmountService.IAmountService")]
    public interface IAmountService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountTemp", ReplyAction="http://tempuri.org/IAmountService/GetAmountTempResponse")]
        System.Data.DataSet GetAmountTemp(int Amount_TypeID, string Amount_Name, int Amount_Source, int StarPageIndex, int EndPageIndex, string LicenseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetGRAmountNameList", ReplyAction="http://tempuri.org/IAmountService/GetGRAmountNameListResponse")]
        System.Data.DataSet GetGRAmountNameList(string enterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountName", ReplyAction="http://tempuri.org/IAmountService/GetAmountNameResponse")]
        System.Data.DataTable GetAmountName();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAllAmountName", ReplyAction="http://tempuri.org/IAmountService/GetAllAmountNameResponse")]
        System.Collections.Generic.List<WebPages.AmountService.Amount_InfoEntity> GetAllAmountName();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/InsertAmount", ReplyAction="http://tempuri.org/IAmountService/InsertAmountResponse")]
        int InsertAmount(WebPages.AmountService.Amount_InfoEntity Amount_Info, ref string AmountCode, string LicenseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountDimensionTemp", ReplyAction="http://tempuri.org/IAmountService/GetAmountDimensionTempResponse")]
        System.Data.DataTable GetAmountDimensionTemp(string AmountName, int AmountType);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountDimensionTree", ReplyAction="http://tempuri.org/IAmountService/GetAmountDimensionTreeResponse")]
        System.Data.DataSet GetAmountDimensionTree(string amountCode, int amountTypeID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveAD_Relation", ReplyAction="http://tempuri.org/IAmountService/SaveAD_RelationResponse")]
        int SaveAD_Relation(string AmountCode, string AmountDimensionJson, int U_ID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveSelfSubject", ReplyAction="http://tempuri.org/IAmountService/SaveSelfSubjectResponse")]
        int SaveSelfSubject(string jsonString, string GuidanceStr);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetSubjectSource", ReplyAction="http://tempuri.org/IAmountService/GetSubjectSourceResponse")]
        System.Data.DataSet GetSubjectSource(string AmountCode, int startIndex, int endIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveCombination", ReplyAction="http://tempuri.org/IAmountService/SaveCombinationResponse")]
        int SaveCombination(WebPages.AmountService.AmountDimensionEntity _info, string SubjectCodeStr, string AmountCode, int UID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetDS_Temps", ReplyAction="http://tempuri.org/IAmountService/GetDS_TempsResponse")]
        System.Data.DataSet GetDS_Temps(string AmountCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountDimensionTempByA_Code", ReplyAction="http://tempuri.org/IAmountService/GetAmountDimensionTempByA_CodeResponse")]
        System.Data.DataTable GetAmountDimensionTempByA_Code(string A_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetNormTempByD_Code", ReplyAction="http://tempuri.org/IAmountService/GetNormTempByD_CodeResponse")]
        System.Data.DataTable GetNormTempByD_Code(string DimensionCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveScoreMessage", ReplyAction="http://tempuri.org/IAmountService/SaveScoreMessageResponse")]
        int SaveScoreMessage(string ScoreJson, ref string NormCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DelDimension", ReplyAction="http://tempuri.org/IAmountService/DelDimensionResponse")]
        int DelDimension(string D_code, string A_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DelDS_RelationByCode", ReplyAction="http://tempuri.org/IAmountService/DelDS_RelationByCodeResponse")]
        int DelDS_RelationByCode(string D_Code, string S_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountNameList", ReplyAction="http://tempuri.org/IAmountService/GetAmountNameListResponse")]
        System.Data.DataTable GetAmountNameList(string enterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveScore", ReplyAction="http://tempuri.org/IAmountService/SaveScoreResponse")]
        int SaveScore(string ScoreJson);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountAndDimension", ReplyAction="http://tempuri.org/IAmountService/GetAmountAndDimensionResponse")]
        System.Data.DataTable GetAmountAndDimension(string Acode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetSubjectOperationTemp", ReplyAction="http://tempuri.org/IAmountService/GetSubjectOperationTempResponse")]
        System.Data.DataSet GetSubjectOperationTemp(string CodeStr);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DisplayAmount", ReplyAction="http://tempuri.org/IAmountService/DisplayAmountResponse")]
        int DisplayAmount(string A_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DisplayDN", ReplyAction="http://tempuri.org/IAmountService/DisplayDNResponse")]
        int DisplayDN(string DimensionCode, string NormCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetExplainWarningDS", ReplyAction="http://tempuri.org/IAmountService/GetExplainWarningDSResponse")]
        System.Data.DataSet GetExplainWarningDS(string DimensionCode, string NormCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DisNER", ReplyAction="http://tempuri.org/IAmountService/DisNERResponse")]
        int DisNER(string NormCode, string ExplainCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveNER", ReplyAction="http://tempuri.org/IAmountService/SaveNERResponse")]
        int SaveNER(string ne_json);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveWER", ReplyAction="http://tempuri.org/IAmountService/SaveWERResponse")]
        int SaveWER(string nw_json, long uid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DelNWR", ReplyAction="http://tempuri.org/IAmountService/DelNWRResponse")]
        int DelNWR(string NormCode, string WarningCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/UpdateAmount", ReplyAction="http://tempuri.org/IAmountService/UpdateAmountResponse")]
        int UpdateAmount(WebPages.AmountService.Amount_InfoEntity Amount_Info);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/UpdateSubject", ReplyAction="http://tempuri.org/IAmountService/UpdateSubjectResponse")]
        int UpdateSubject(string jsonString);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DelTG_ByCode", ReplyAction="http://tempuri.org/IAmountService/DelTG_ByCodeResponse")]
        int DelTG_ByCode(string TgCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/DelOperationByCode", ReplyAction="http://tempuri.org/IAmountService/DelOperationByCodeResponse")]
        int DelOperationByCode(string SubjectCode, string OperationCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetSubjectTempsByLBCode", ReplyAction="http://tempuri.org/IAmountService/GetSubjectTempsByLBCodeResponse")]
        System.Data.DataSet GetSubjectTempsByLBCode(string LB_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/NewUpdateSubject", ReplyAction="http://tempuri.org/IAmountService/NewUpdateSubjectResponse")]
        int NewUpdateSubject(string jsonString);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetFormulaTempByCode", ReplyAction="http://tempuri.org/IAmountService/GetFormulaTempByCodeResponse")]
        System.Data.DataTable GetFormulaTempByCode(string Dcode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountLicenseTemp", ReplyAction="http://tempuri.org/IAmountService/GetAmountLicenseTempResponse")]
        System.Data.DataTable GetAmountLicenseTemp(string LicenseCode, string Amount_Name);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/OperationFormula", ReplyAction="http://tempuri.org/IAmountService/OperationFormulaResponse")]
        int OperationFormula(string jsonString, int U_ID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/Exists", ReplyAction="http://tempuri.org/IAmountService/ExistsResponse")]
        bool Exists(string Amount_Name, string Amount_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetDimensionByAmountCode", ReplyAction="http://tempuri.org/IAmountService/GetDimensionByAmountCodeResponse")]
        System.Collections.Generic.List<string> GetDimensionByAmountCode(string amountCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetSubjectNumByDimensionCode", ReplyAction="http://tempuri.org/IAmountService/GetSubjectNumByDimensionCodeResponse")]
        int GetSubjectNumByDimensionCode(string dimensionCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/UpdateExp", ReplyAction="http://tempuri.org/IAmountService/UpdateExpResponse")]
        int UpdateExp(string UpdateJson);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/IpdateNw", ReplyAction="http://tempuri.org/IAmountService/IpdateNwResponse")]
        int IpdateNw(string UNW_Json);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetWD_SubList", ReplyAction="http://tempuri.org/IAmountService/GetWD_SubListResponse")]
        System.Data.DataSet GetWD_SubList(string DimensionCode, string Amount_Code);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/UpdateWDMess", ReplyAction="http://tempuri.org/IAmountService/UpdateWDMessResponse")]
        int UpdateWDMess(string DimensionName, string SubjectNum, string DimensionCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/SaveDS_Relation", ReplyAction="http://tempuri.org/IAmountService/SaveDS_RelationResponse")]
        int SaveDS_Relation(string DimensionCode, string SubjectCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/repeat", ReplyAction="http://tempuri.org/IAmountService/repeatResponse")]
        bool repeat(string AmountCode, string DimensionName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetSubjectCountByAmountCode", ReplyAction="http://tempuri.org/IAmountService/GetSubjectCountByAmountCodeResponse")]
        string GetSubjectCountByAmountCode(string amountCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/zhidaoyu", ReplyAction="http://tempuri.org/IAmountService/zhidaoyuResponse")]
        bool zhidaoyu(string AmountCode, string textareas);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAmountService/GetAmountNameByE", ReplyAction="http://tempuri.org/IAmountService/GetAmountNameByEResponse")]
        System.Data.DataTable GetAmountNameByE(string EnterpriseCode);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IAmountServiceChannel : WebPages.AmountService.IAmountService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AmountServiceClient : System.ServiceModel.ClientBase<WebPages.AmountService.IAmountService>, WebPages.AmountService.IAmountService {
        
        public AmountServiceClient() {
        }
        
        public AmountServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AmountServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AmountServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AmountServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet GetAmountTemp(int Amount_TypeID, string Amount_Name, int Amount_Source, int StarPageIndex, int EndPageIndex, string LicenseCode) {
            return base.Channel.GetAmountTemp(Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex, LicenseCode);
        }
        
        public System.Data.DataSet GetGRAmountNameList(string enterpriseCode) {
            return base.Channel.GetGRAmountNameList(enterpriseCode);
        }
        
        public System.Data.DataTable GetAmountName() {
            return base.Channel.GetAmountName();
        }
        
        public System.Collections.Generic.List<WebPages.AmountService.Amount_InfoEntity> GetAllAmountName() {
            return base.Channel.GetAllAmountName();
        }
        
        public int InsertAmount(WebPages.AmountService.Amount_InfoEntity Amount_Info, ref string AmountCode, string LicenseCode) {
            return base.Channel.InsertAmount(Amount_Info, ref AmountCode, LicenseCode);
        }
        
        public System.Data.DataTable GetAmountDimensionTemp(string AmountName, int AmountType) {
            return base.Channel.GetAmountDimensionTemp(AmountName, AmountType);
        }
        
        public System.Data.DataSet GetAmountDimensionTree(string amountCode, int amountTypeID) {
            return base.Channel.GetAmountDimensionTree(amountCode, amountTypeID);
        }
        
        public int SaveAD_Relation(string AmountCode, string AmountDimensionJson, int U_ID) {
            return base.Channel.SaveAD_Relation(AmountCode, AmountDimensionJson, U_ID);
        }
        
        public int SaveSelfSubject(string jsonString, string GuidanceStr) {
            return base.Channel.SaveSelfSubject(jsonString, GuidanceStr);
        }
        
        public System.Data.DataSet GetSubjectSource(string AmountCode, int startIndex, int endIndex) {
            return base.Channel.GetSubjectSource(AmountCode, startIndex, endIndex);
        }
        
        public int SaveCombination(WebPages.AmountService.AmountDimensionEntity _info, string SubjectCodeStr, string AmountCode, int UID) {
            return base.Channel.SaveCombination(_info, SubjectCodeStr, AmountCode, UID);
        }
        
        public System.Data.DataSet GetDS_Temps(string AmountCode) {
            return base.Channel.GetDS_Temps(AmountCode);
        }
        
        public System.Data.DataTable GetAmountDimensionTempByA_Code(string A_Code) {
            return base.Channel.GetAmountDimensionTempByA_Code(A_Code);
        }
        
        public System.Data.DataTable GetNormTempByD_Code(string DimensionCode) {
            return base.Channel.GetNormTempByD_Code(DimensionCode);
        }
        
        public int SaveScoreMessage(string ScoreJson, ref string NormCode) {
            return base.Channel.SaveScoreMessage(ScoreJson, ref NormCode);
        }
        
        public int DelDimension(string D_code, string A_Code) {
            return base.Channel.DelDimension(D_code, A_Code);
        }
        
        public int DelDS_RelationByCode(string D_Code, string S_Code) {
            return base.Channel.DelDS_RelationByCode(D_Code, S_Code);
        }
        
        public System.Data.DataTable GetAmountNameList(string enterpriseCode) {
            return base.Channel.GetAmountNameList(enterpriseCode);
        }
        
        public int SaveScore(string ScoreJson) {
            return base.Channel.SaveScore(ScoreJson);
        }
        
        public System.Data.DataTable GetAmountAndDimension(string Acode) {
            return base.Channel.GetAmountAndDimension(Acode);
        }
        
        public System.Data.DataSet GetSubjectOperationTemp(string CodeStr) {
            return base.Channel.GetSubjectOperationTemp(CodeStr);
        }
        
        public int DisplayAmount(string A_Code) {
            return base.Channel.DisplayAmount(A_Code);
        }
        
        public int DisplayDN(string DimensionCode, string NormCode) {
            return base.Channel.DisplayDN(DimensionCode, NormCode);
        }
        
        public System.Data.DataSet GetExplainWarningDS(string DimensionCode, string NormCode) {
            return base.Channel.GetExplainWarningDS(DimensionCode, NormCode);
        }
        
        public int DisNER(string NormCode, string ExplainCode) {
            return base.Channel.DisNER(NormCode, ExplainCode);
        }
        
        public int SaveNER(string ne_json) {
            return base.Channel.SaveNER(ne_json);
        }
        
        public int SaveWER(string nw_json, long uid) {
            return base.Channel.SaveWER(nw_json, uid);
        }
        
        public int DelNWR(string NormCode, string WarningCode) {
            return base.Channel.DelNWR(NormCode, WarningCode);
        }
        
        public int UpdateAmount(WebPages.AmountService.Amount_InfoEntity Amount_Info) {
            return base.Channel.UpdateAmount(Amount_Info);
        }
        
        public int UpdateSubject(string jsonString) {
            return base.Channel.UpdateSubject(jsonString);
        }
        
        public int DelTG_ByCode(string TgCode) {
            return base.Channel.DelTG_ByCode(TgCode);
        }
        
        public int DelOperationByCode(string SubjectCode, string OperationCode) {
            return base.Channel.DelOperationByCode(SubjectCode, OperationCode);
        }
        
        public System.Data.DataSet GetSubjectTempsByLBCode(string LB_Code) {
            return base.Channel.GetSubjectTempsByLBCode(LB_Code);
        }
        
        public int NewUpdateSubject(string jsonString) {
            return base.Channel.NewUpdateSubject(jsonString);
        }
        
        public System.Data.DataTable GetFormulaTempByCode(string Dcode) {
            return base.Channel.GetFormulaTempByCode(Dcode);
        }
        
        public System.Data.DataTable GetAmountLicenseTemp(string LicenseCode, string Amount_Name) {
            return base.Channel.GetAmountLicenseTemp(LicenseCode, Amount_Name);
        }
        
        public int OperationFormula(string jsonString, int U_ID) {
            return base.Channel.OperationFormula(jsonString, U_ID);
        }
        
        public bool Exists(string Amount_Name, string Amount_Code) {
            return base.Channel.Exists(Amount_Name, Amount_Code);
        }
        
        public System.Collections.Generic.List<string> GetDimensionByAmountCode(string amountCode) {
            return base.Channel.GetDimensionByAmountCode(amountCode);
        }
        
        public int GetSubjectNumByDimensionCode(string dimensionCode) {
            return base.Channel.GetSubjectNumByDimensionCode(dimensionCode);
        }
        
        public int UpdateExp(string UpdateJson) {
            return base.Channel.UpdateExp(UpdateJson);
        }
        
        public int IpdateNw(string UNW_Json) {
            return base.Channel.IpdateNw(UNW_Json);
        }
        
        public System.Data.DataSet GetWD_SubList(string DimensionCode, string Amount_Code) {
            return base.Channel.GetWD_SubList(DimensionCode, Amount_Code);
        }
        
        public int UpdateWDMess(string DimensionName, string SubjectNum, string DimensionCode) {
            return base.Channel.UpdateWDMess(DimensionName, SubjectNum, DimensionCode);
        }
        
        public int SaveDS_Relation(string DimensionCode, string SubjectCode) {
            return base.Channel.SaveDS_Relation(DimensionCode, SubjectCode);
        }
        
        public bool repeat(string AmountCode, string DimensionName) {
            return base.Channel.repeat(AmountCode, DimensionName);
        }
        
        public string GetSubjectCountByAmountCode(string amountCode) {
            return base.Channel.GetSubjectCountByAmountCode(amountCode);
        }
        
        public bool zhidaoyu(string AmountCode, string textareas) {
            return base.Channel.zhidaoyu(AmountCode, textareas);
        }
        
        public System.Data.DataTable GetAmountNameByE(string EnterpriseCode) {
            return base.Channel.GetAmountNameByE(EnterpriseCode);
        }
    }
}
