<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="IndividualConsultationEdit.aspx.cs" Inherits="WebPages.FunctionModular.AppointmentConsult.IndividualConsultationEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">


    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationEdit.css" rel="stylesheet" />
    <link href="lib/StarRating/CSS/star-rating.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="lib/StarRating/Script/star-rating.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="ViewModel/IndividualConsultationEditViewModel.js"></script>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li><a href="IndividualConsultation.aspx">个体咨询</a></li>
                <li>编辑</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <ul id="myTab" class="nav nav-tabs-lyj">
                <li class="active"><a href="#file" data-toggle="tab" style="border-left: none;">基本信息</a></li>
                <li class="" id="liRecord">
                    <p>咨询记录</p>
                </li>
                <li class="" id="liSummary">
                    <p>结案总结</p>
                </li>
                <li style="float: right;">
                    <button class="btn btn-primary btn-sm" style="margin-top: 5px; margin-right: 3px;" id="btnBack">返回</button>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="file">
                    <form id="formFile" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">



                        <div class="col-md-8">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">个案号：</label>
                                    <label class="control-label col-md-8" style="text-align: left;" id="lblNumber"></label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">*问题类型：</label>
                                    <div class="col-md-8">
                                        <select id="selectQuestionType" class="form-control" name="selectQuestionType">
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-8">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">*登录名：</label>
                                    <div class="col-md-8">

                                        <select id="selectUserdisabled" class="form-control" name="selectUserdisabled" style="display: none;">
                                        </select>

                                        <select class="selectpicker" data-done-button="true" data-live-search="true" id="selectUser" name="selectUser">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">出生日期：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtAge" disabled />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">姓名：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtName" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">部门：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtDepartment" disabled />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">性别：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtSex" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">婚姻状况：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtMaritalStatus" name="txtMaritalStatus" maxlength="30" />
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-8">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">文化程度：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtCulture" name="txtCulture" maxlength="30" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">联系方式：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtPhone" name="txtPhone" maxlength="30" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class=" col-md-8" style="text-align: center; margin-top: 10px;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnSaveFile" class="btn btn-sm">
                                保存
                            </button>

                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="Record">

                    <form id="formRecord" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">
                        <div class="col-md-12" style="text-align: right;">
                            <button class="btn btn-sm " style="background-color: orange; color: white" id="btnRecordAdd" name="btnRecordAdd">+新建记录</button>
                        </div>
                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: hidden; height: 500px; border: 1px solid #ddd; padding-top: 10px; margin-top: 10px;" id="divRecirdMain">
                        </div>

                        <div class=" col-md-12" style="text-align: center; margin-top: 20px;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnSaveRecord" class="btn btn-sm">
                                保存
                            </button>
                            <button type="button" style="color: white; margin-left: 20px;" id="btnDelNowPage" class="btn  btn-primary btn-sm">
                                删除此页
                            </button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="Summary">

                    <form id="formSummary" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">
                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: hidden; height: 500px; border: 1px solid #ddd; padding-top: 10px; margin-top: 10px;" id="divSummaryMain">

                            <div class='row'>
                                <div class='col-md-5 col-ms-12 col-xs-12 form-group'>
                                    <label class='col-md-4' style='height: 45px; line-height: 45px; text-align: right; padding-left: 5px;'>咨询效果评估：</label>
                                    <div class='col-md-8 col-ms-12 col-xs-12'>
                                        <input type='number' id="txtSummaryStar" name="txtSummaryStar" value='' maxlength='30' />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div>
                                        <div class="col-md-2 col-ms-6 col-xs-6 form-group" style="margin-right: 0px;">
                                            <input type="text" class="form-control" style="text-align: right;" id="txtMainTitle" name="txtMainTitle" value="结案总结" />
                                        </div>
                                        <div class="col-md-7 col-ms-10 col-xs-10 form-group" style="margin-left: 0px;">
                                            <textarea class="form-control" style="padding-top: 5px;" rows="4" maxlength='4000' id="txtMainSummary" name="txtMainSummary"></textarea>
                                        </div>
                                        <div class="col-md-3 col-ms-2 col-xs-2">
                                            &nbsp;
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class=" col-md-12" style="text-align: center; margin-top: 20px;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnSaveSummary" class="btn btn-sm">
                                保存
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function onlyNumber(obj) {
            //得到第一个字符是否为负号  
             var t = obj.value.charAt(0);
            //先把非数字的都替换掉，除了数字和.   
            obj.value = obj.value.replace(/[^\d]/g, '');
            //必须保证第一个为数字而不是.     
            obj.value = obj.value.replace(/^\./g, '');
            ////保证只有出现一个.而没有多个.     
            //obj.value = obj.value.replace(/\.{2,}/g, '.');
            ////保证.只出现一次，而不能出现两次以上     
            //obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
            ////如果第一位是负号，则允许添加  
            //if (t == '-') {
            //    obj.value =obj.value;
            //    }
        }
        var navName = '/FunctionModular/AppointmentConsult/IndividualConsultation.aspx';
    </script>
</asp:Content>
