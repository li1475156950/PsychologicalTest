﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.ParameterService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ParameterEntity", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.ReservationModel")]
    [System.SerializableAttribute()]
    public partial class ParameterEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string _descrField;
        
        private int _p_deleteField;
        
        private int _parameteridField;
        
        private string _parameternameField;
        
        private int _parametertypeField;
        
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
        public string _descr {
            get {
                return this._descrField;
            }
            set {
                if ((object.ReferenceEquals(this._descrField, value) != true)) {
                    this._descrField = value;
                    this.RaisePropertyChanged("_descr");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _p_delete {
            get {
                return this._p_deleteField;
            }
            set {
                if ((this._p_deleteField.Equals(value) != true)) {
                    this._p_deleteField = value;
                    this.RaisePropertyChanged("_p_delete");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _parameterid {
            get {
                return this._parameteridField;
            }
            set {
                if ((this._parameteridField.Equals(value) != true)) {
                    this._parameteridField = value;
                    this.RaisePropertyChanged("_parameterid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _parametername {
            get {
                return this._parameternameField;
            }
            set {
                if ((object.ReferenceEquals(this._parameternameField, value) != true)) {
                    this._parameternameField = value;
                    this.RaisePropertyChanged("_parametername");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _parametertype {
            get {
                return this._parametertypeField;
            }
            set {
                if ((this._parametertypeField.Equals(value) != true)) {
                    this._parametertypeField = value;
                    this.RaisePropertyChanged("_parametertype");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ParameterService.IParameterService")]
    public interface IParameterService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/PlaceJson", ReplyAction="http://tempuri.org/IParameterService/PlaceJsonResponse")]
        System.Data.DataSet PlaceJson(int StarPageIndex, int EndPageIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/WayJson", ReplyAction="http://tempuri.org/IParameterService/WayJsonResponse")]
        System.Data.DataSet WayJson(int StarPageIndex, int EndPageIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/ProblemJson", ReplyAction="http://tempuri.org/IParameterService/ProblemJsonResponse")]
        System.Data.DataSet ProblemJson(int StarPageIndex, int EndPageIndex);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/Parameterdelete", ReplyAction="http://tempuri.org/IParameterService/ParameterdeleteResponse")]
        bool Parameterdelete(int ParameterID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/ParameterInsert", ReplyAction="http://tempuri.org/IParameterService/ParameterInsertResponse")]
        bool ParameterInsert(WebPages.ParameterService.ParameterEntity model);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/ParameterSelect", ReplyAction="http://tempuri.org/IParameterService/ParameterSelectResponse")]
        WebPages.ParameterService.ParameterEntity ParameterSelect(int ParameterID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IParameterService/ParameterUpdata", ReplyAction="http://tempuri.org/IParameterService/ParameterUpdataResponse")]
        bool ParameterUpdata(WebPages.ParameterService.ParameterEntity model);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IParameterServiceChannel : WebPages.ParameterService.IParameterService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ParameterServiceClient : System.ServiceModel.ClientBase<WebPages.ParameterService.IParameterService>, WebPages.ParameterService.IParameterService {
        
        public ParameterServiceClient() {
        }
        
        public ParameterServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ParameterServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ParameterServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ParameterServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Data.DataSet PlaceJson(int StarPageIndex, int EndPageIndex) {
            return base.Channel.PlaceJson(StarPageIndex, EndPageIndex);
        }
        
        public System.Data.DataSet WayJson(int StarPageIndex, int EndPageIndex) {
            return base.Channel.WayJson(StarPageIndex, EndPageIndex);
        }
        
        public System.Data.DataSet ProblemJson(int StarPageIndex, int EndPageIndex) {
            return base.Channel.ProblemJson(StarPageIndex, EndPageIndex);
        }
        
        public bool Parameterdelete(int ParameterID) {
            return base.Channel.Parameterdelete(ParameterID);
        }
        
        public bool ParameterInsert(WebPages.ParameterService.ParameterEntity model) {
            return base.Channel.ParameterInsert(model);
        }
        
        public WebPages.ParameterService.ParameterEntity ParameterSelect(int ParameterID) {
            return base.Channel.ParameterSelect(ParameterID);
        }
        
        public bool ParameterUpdata(WebPages.ParameterService.ParameterEntity model) {
            return base.Channel.ParameterUpdata(model);
        }
    }
}
