﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.ChineseToPinYinService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ChineseToPinYinService.IChineseToPinYinService")]
    public interface IChineseToPinYinService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IChineseToPinYinService/GetFirstPY_ByChinese", ReplyAction="http://tempuri.org/IChineseToPinYinService/GetFirstPY_ByChineseResponse")]
        string GetFirstPY_ByChinese(string Chinese);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IChineseToPinYinService/GetAllPY_ByChinese", ReplyAction="http://tempuri.org/IChineseToPinYinService/GetAllPY_ByChineseResponse")]
        string GetAllPY_ByChinese(string Chinese);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IChineseToPinYinServiceChannel : WebPages.ChineseToPinYinService.IChineseToPinYinService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ChineseToPinYinServiceClient : System.ServiceModel.ClientBase<WebPages.ChineseToPinYinService.IChineseToPinYinService>, WebPages.ChineseToPinYinService.IChineseToPinYinService {
        
        public ChineseToPinYinServiceClient() {
        }
        
        public ChineseToPinYinServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ChineseToPinYinServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ChineseToPinYinServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ChineseToPinYinServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string GetFirstPY_ByChinese(string Chinese) {
            return base.Channel.GetFirstPY_ByChinese(Chinese);
        }
        
        public string GetAllPY_ByChinese(string Chinese) {
            return base.Channel.GetAllPY_ByChinese(Chinese);
        }
    }
}