﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.SystemSettingService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="SystemSettingEntity", Namespace="http://schemas.datacontract.org/2004/07/JSBR.Model.BaseTable.Entity")]
    [System.SerializableAttribute()]
    public partial class SystemSettingEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string _emailnameField;
        
        private string _emailpwdField;
        
        private string _emailtypeField;
        
        private string _ipaddressField;
        
        private int _systemidField;
        
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
        public string _emailname {
            get {
                return this._emailnameField;
            }
            set {
                if ((object.ReferenceEquals(this._emailnameField, value) != true)) {
                    this._emailnameField = value;
                    this.RaisePropertyChanged("_emailname");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _emailpwd {
            get {
                return this._emailpwdField;
            }
            set {
                if ((object.ReferenceEquals(this._emailpwdField, value) != true)) {
                    this._emailpwdField = value;
                    this.RaisePropertyChanged("_emailpwd");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _emailtype {
            get {
                return this._emailtypeField;
            }
            set {
                if ((object.ReferenceEquals(this._emailtypeField, value) != true)) {
                    this._emailtypeField = value;
                    this.RaisePropertyChanged("_emailtype");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _ipaddress {
            get {
                return this._ipaddressField;
            }
            set {
                if ((object.ReferenceEquals(this._ipaddressField, value) != true)) {
                    this._ipaddressField = value;
                    this.RaisePropertyChanged("_ipaddress");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _systemid {
            get {
                return this._systemidField;
            }
            set {
                if ((this._systemidField.Equals(value) != true)) {
                    this._systemidField = value;
                    this.RaisePropertyChanged("_systemid");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="SystemSettingService.ISystemSettingService")]
    public interface ISystemSettingService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ISystemSettingService/SSUpdate", ReplyAction="http://tempuri.org/ISystemSettingService/SSUpdateResponse")]
        bool SSUpdate(WebPages.SystemSettingService.SystemSettingEntity model);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ISystemSettingServiceChannel : WebPages.SystemSettingService.ISystemSettingService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class SystemSettingServiceClient : System.ServiceModel.ClientBase<WebPages.SystemSettingService.ISystemSettingService>, WebPages.SystemSettingService.ISystemSettingService {
        
        public SystemSettingServiceClient() {
        }
        
        public SystemSettingServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public SystemSettingServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public SystemSettingServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public SystemSettingServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool SSUpdate(WebPages.SystemSettingService.SystemSettingEntity model) {
            return base.Channel.SSUpdate(model);
        }
    }
}
