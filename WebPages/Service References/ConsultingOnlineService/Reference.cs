﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18444
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebPages.ConsultingOnlineService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ConsultingOnlineService.IConsultingOnlineService")]
    public interface IConsultingOnlineService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IConsultingOnlineService/GetAppDateByID", ReplyAction="http://tempuri.org/IConsultingOnlineService/GetAppDateByIDResponse")]
        System.Collections.Generic.List<string> GetAppDateByID(string userID, string role_typeID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IConsultingOnlineService/GetServiceIPAndPort", ReplyAction="http://tempuri.org/IConsultingOnlineService/GetServiceIPAndPortResponse")]
        string GetServiceIPAndPort();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IConsultingOnlineService/GetConsultantAbout", ReplyAction="http://tempuri.org/IConsultingOnlineService/GetConsultantAboutResponse")]
        System.Data.DataTable GetConsultantAbout(string DWID, string isFriend);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IConsultingOnlineService/GetVisitorAbout", ReplyAction="http://tempuri.org/IConsultingOnlineService/GetVisitorAboutResponse")]
        System.Data.DataTable GetVisitorAbout(string DWID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IConsultingOnlineService/GetGroupAbout", ReplyAction="http://tempuri.org/IConsultingOnlineService/GetGroupAboutResponse")]
        System.Data.DataTable GetGroupAbout(string DWID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IConsultingOnlineService/UpDateAppState_Finish", ReplyAction="http://tempuri.org/IConsultingOnlineService/UpDateAppState_FinishResponse")]
        void UpDateAppState_Finish(string DWID);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IConsultingOnlineServiceChannel : WebPages.ConsultingOnlineService.IConsultingOnlineService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ConsultingOnlineServiceClient : System.ServiceModel.ClientBase<WebPages.ConsultingOnlineService.IConsultingOnlineService>, WebPages.ConsultingOnlineService.IConsultingOnlineService {
        
        public ConsultingOnlineServiceClient() {
        }
        
        public ConsultingOnlineServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ConsultingOnlineServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ConsultingOnlineServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ConsultingOnlineServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Collections.Generic.List<string> GetAppDateByID(string userID, string role_typeID) {
            return base.Channel.GetAppDateByID(userID, role_typeID);
        }
        
        public string GetServiceIPAndPort() {
            return base.Channel.GetServiceIPAndPort();
        }
        
        public System.Data.DataTable GetConsultantAbout(string DWID, string isFriend) {
            return base.Channel.GetConsultantAbout(DWID, isFriend);
        }
        
        public System.Data.DataTable GetVisitorAbout(string DWID) {
            return base.Channel.GetVisitorAbout(DWID);
        }
        
        public System.Data.DataTable GetGroupAbout(string DWID) {
            return base.Channel.GetGroupAbout(DWID);
        }
        
        public void UpDateAppState_Finish(string DWID) {
            base.Channel.UpDateAppState_Finish(DWID);
        }
    }
}
