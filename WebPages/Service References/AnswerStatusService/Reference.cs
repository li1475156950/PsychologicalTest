﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.AnswerStatusService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AnswerStatusEntity", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.AnswerStatusModel")]
    [System.SerializableAttribute()]
    public partial class AnswerStatusEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int AnsIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string AnsNameField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int AnsID {
            get {
                return this.AnsIDField;
            }
            set {
                if ((this.AnsIDField.Equals(value) != true)) {
                    this.AnsIDField = value;
                    this.RaisePropertyChanged("AnsID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string AnsName {
            get {
                return this.AnsNameField;
            }
            set {
                if ((object.ReferenceEquals(this.AnsNameField, value) != true)) {
                    this.AnsNameField = value;
                    this.RaisePropertyChanged("AnsName");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="AnswerStatusService.IAnswerStatusService")]
    public interface IAnswerStatusService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAnswerStatusService/GetAllAnswerStatus", ReplyAction="http://tempuri.org/IAnswerStatusService/GetAllAnswerStatusResponse")]
        System.Collections.Generic.List<WebPages.AnswerStatusService.AnswerStatusEntity> GetAllAnswerStatus();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IAnswerStatusServiceChannel : WebPages.AnswerStatusService.IAnswerStatusService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AnswerStatusServiceClient : System.ServiceModel.ClientBase<WebPages.AnswerStatusService.IAnswerStatusService>, WebPages.AnswerStatusService.IAnswerStatusService {
        
        public AnswerStatusServiceClient() {
        }
        
        public AnswerStatusServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AnswerStatusServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AnswerStatusServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AnswerStatusServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Collections.Generic.List<WebPages.AnswerStatusService.AnswerStatusEntity> GetAllAnswerStatus() {
            return base.Channel.GetAllAnswerStatus();
        }
    }
}
