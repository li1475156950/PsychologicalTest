﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.LetterService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="U_LetterEntity", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.LetterModel")]
    [System.SerializableAttribute()]
    public partial class U_LetterEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int _ul_idField;
        
        private int _ul_inboxisdeleteField;
        
        private int _ul_isreadField;
        
        private int _ul_jumptypeField;
        
        private string _ul_noteField;
        
        private int _ul_receveidField;
        
        private int _ul_senderidField;
        
        private int _ul_senderisdeleteField;
        
        private int _ul_sendertypeField;
        
        private System.DateTime _ul_timeField;
        
        private string _ul_titleField;
        
        private int _ul_typeField;
        
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
        public int _ul_id {
            get {
                return this._ul_idField;
            }
            set {
                if ((this._ul_idField.Equals(value) != true)) {
                    this._ul_idField = value;
                    this.RaisePropertyChanged("_ul_id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_inboxisdelete {
            get {
                return this._ul_inboxisdeleteField;
            }
            set {
                if ((this._ul_inboxisdeleteField.Equals(value) != true)) {
                    this._ul_inboxisdeleteField = value;
                    this.RaisePropertyChanged("_ul_inboxisdelete");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_isread {
            get {
                return this._ul_isreadField;
            }
            set {
                if ((this._ul_isreadField.Equals(value) != true)) {
                    this._ul_isreadField = value;
                    this.RaisePropertyChanged("_ul_isread");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_jumptype {
            get {
                return this._ul_jumptypeField;
            }
            set {
                if ((this._ul_jumptypeField.Equals(value) != true)) {
                    this._ul_jumptypeField = value;
                    this.RaisePropertyChanged("_ul_jumptype");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _ul_note {
            get {
                return this._ul_noteField;
            }
            set {
                if ((object.ReferenceEquals(this._ul_noteField, value) != true)) {
                    this._ul_noteField = value;
                    this.RaisePropertyChanged("_ul_note");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_receveid {
            get {
                return this._ul_receveidField;
            }
            set {
                if ((this._ul_receveidField.Equals(value) != true)) {
                    this._ul_receveidField = value;
                    this.RaisePropertyChanged("_ul_receveid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_senderid {
            get {
                return this._ul_senderidField;
            }
            set {
                if ((this._ul_senderidField.Equals(value) != true)) {
                    this._ul_senderidField = value;
                    this.RaisePropertyChanged("_ul_senderid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_senderisdelete {
            get {
                return this._ul_senderisdeleteField;
            }
            set {
                if ((this._ul_senderisdeleteField.Equals(value) != true)) {
                    this._ul_senderisdeleteField = value;
                    this.RaisePropertyChanged("_ul_senderisdelete");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_sendertype {
            get {
                return this._ul_sendertypeField;
            }
            set {
                if ((this._ul_sendertypeField.Equals(value) != true)) {
                    this._ul_sendertypeField = value;
                    this.RaisePropertyChanged("_ul_sendertype");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public System.DateTime _ul_time {
            get {
                return this._ul_timeField;
            }
            set {
                if ((this._ul_timeField.Equals(value) != true)) {
                    this._ul_timeField = value;
                    this.RaisePropertyChanged("_ul_time");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _ul_title {
            get {
                return this._ul_titleField;
            }
            set {
                if ((object.ReferenceEquals(this._ul_titleField, value) != true)) {
                    this._ul_titleField = value;
                    this.RaisePropertyChanged("_ul_title");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _ul_type {
            get {
                return this._ul_typeField;
            }
            set {
                if ((this._ul_typeField.Equals(value) != true)) {
                    this._ul_typeField = value;
                    this.RaisePropertyChanged("_ul_type");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="LetterService.ILetterService")]
    public interface ILetterService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/GetInboxList", ReplyAction="http://tempuri.org/ILetterService/GetInboxListResponse")]
        System.Data.DataSet GetInboxList(int UL_ReceveID, string UL_Title, int StarPageIndex, int EndPageIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/Insert", ReplyAction="http://tempuri.org/ILetterService/InsertResponse")]
        long Insert(WebPages.LetterService.U_LetterEntity entityInfo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/UpdateDelte", ReplyAction="http://tempuri.org/ILetterService/UpdateDelteResponse")]
        bool UpdateDelte(string UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/GetEntity", ReplyAction="http://tempuri.org/ILetterService/GetEntityResponse")]
        WebPages.LetterService.U_LetterEntity GetEntity(int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/GetSendTemp", ReplyAction="http://tempuri.org/ILetterService/GetSendTempResponse")]
        System.Data.DataSet GetSendTemp(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/GetDraftTemp", ReplyAction="http://tempuri.org/ILetterService/GetDraftTempResponse")]
        System.Data.DataSet GetDraftTemp(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/UpdateDeleteSender", ReplyAction="http://tempuri.org/ILetterService/UpdateDeleteSenderResponse")]
        bool UpdateDeleteSender(string UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/BulkInsert", ReplyAction="http://tempuri.org/ILetterService/BulkInsertResponse")]
        bool BulkInsert(string ReceveID, string Title, string Content, int Write, int SenderID, string SendType, string UL_JumpType);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/GetUserTypeTemp", ReplyAction="http://tempuri.org/ILetterService/GetUserTypeTempResponse")]
        System.Data.DataTable GetUserTypeTemp(int UserID, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/AllUpdate", ReplyAction="http://tempuri.org/ILetterService/AllUpdateResponse")]
        bool AllUpdate(string ReceveID, string Title, string Content, int Write, int SenderID, int UL_ID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/UpdateRead", ReplyAction="http://tempuri.org/ILetterService/UpdateReadResponse")]
        bool UpdateRead(string UL_ID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/NoRead", ReplyAction="http://tempuri.org/ILetterService/NoReadResponse")]
        int NoRead(int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ILetterService/GetTopEntity", ReplyAction="http://tempuri.org/ILetterService/GetTopEntityResponse")]
        System.Data.DataTable GetTopEntity(int UL_ReceveID);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ILetterServiceChannel : WebPages.LetterService.ILetterService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class LetterServiceClient : System.ServiceModel.ClientBase<WebPages.LetterService.ILetterService>, WebPages.LetterService.ILetterService {
        
        public LetterServiceClient() {
        }
        
        public LetterServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public LetterServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public LetterServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public LetterServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet GetInboxList(int UL_ReceveID, string UL_Title, int StarPageIndex, int EndPageIndex) {
            return base.Channel.GetInboxList(UL_ReceveID, UL_Title, StarPageIndex, EndPageIndex);
        }
        
        public long Insert(WebPages.LetterService.U_LetterEntity entityInfo) {
            return base.Channel.Insert(entityInfo);
        }
        
        public bool UpdateDelte(string UserID) {
            return base.Channel.UpdateDelte(UserID);
        }
        
        public WebPages.LetterService.U_LetterEntity GetEntity(int UserID) {
            return base.Channel.GetEntity(UserID);
        }
        
        public System.Data.DataSet GetSendTemp(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex) {
            return base.Channel.GetSendTemp(UL_SenderID, UL_Title, StarPageIndex, EndPageIndex);
        }
        
        public System.Data.DataSet GetDraftTemp(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex) {
            return base.Channel.GetDraftTemp(UL_SenderID, UL_Title, StarPageIndex, EndPageIndex);
        }
        
        public bool UpdateDeleteSender(string UserID) {
            return base.Channel.UpdateDeleteSender(UserID);
        }
        
        public bool BulkInsert(string ReceveID, string Title, string Content, int Write, int SenderID, string SendType, string UL_JumpType) {
            return base.Channel.BulkInsert(ReceveID, Title, Content, Write, SenderID, SendType, UL_JumpType);
        }
        
        public System.Data.DataTable GetUserTypeTemp(int UserID, string EnterpriseCode) {
            return base.Channel.GetUserTypeTemp(UserID, EnterpriseCode);
        }
        
        public bool AllUpdate(string ReceveID, string Title, string Content, int Write, int SenderID, int UL_ID) {
            return base.Channel.AllUpdate(ReceveID, Title, Content, Write, SenderID, UL_ID);
        }
        
        public bool UpdateRead(string UL_ID) {
            return base.Channel.UpdateRead(UL_ID);
        }
        
        public int NoRead(int UserID) {
            return base.Channel.NoRead(UserID);
        }
        
        public System.Data.DataTable GetTopEntity(int UL_ReceveID) {
            return base.Channel.GetTopEntity(UL_ReceveID);
        }
    }
}
