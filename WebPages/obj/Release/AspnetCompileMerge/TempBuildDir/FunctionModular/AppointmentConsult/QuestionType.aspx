<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuestionType.aspx.cs" Inherits="WebPages.FunctionModular.AppointmentConsult.QuestionType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />

    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>

    <script src="ViewModel/QuestionTypeViewModel.js"></script>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li>参数设置</li>
            </ol>
        </div>
    </div>

    <!-- /. ROW  -->
    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: right; margin-top: 10px;">
            <button class="btn btn-sm pull-right" style="background-color: orange; color: white" id="btnAdd" name="btnAdd">+新增问题类型</button>
        </div>
    </div>

    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th class="text-center" style="width:30%">名称</th>
                            <th class="text-center" style="width:50%">描述</th>
                            <th class="text-center" style="width:20%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 20%;">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 30px; font-size: 25px; font-weight: 700;" id="hTitle">新增部门
                </h4>

                <div class="modal-body">
                    <form role="form" id="formInfo" method="post" class="form-horizontal ">
                        <div class="form-group">
                            <label id="txtName_LB" class="col-sm-3  col-xs-4 control-label text-right">*名称：</label>
                            <div class="col-sm-7  col-xs-8">
                                <input type="text" maxlength="20" class="form-control" name="txtName" id="txtName" onblur="txtNameCheck(this)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  col-xs-4 control-label text-right">描述：</label>
                            <div class="col-sm-7  col-xs-8">
                                <textarea id="txtDescribe" name="txtDescribe" class="form-control" maxlength="500" style="width: 100%; margin-top: 0px; margin-bottom: 0px; height: 182px;"></textarea>
                            </div>
                        </div>

                        <div class="form-group" style="text-align: center;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 10px;" id="btSubmit" class="btn btn-sm">
                                保存
                            </button>
                            <button type="button" class="btn btn-sm"  style="color: white" id="cancel">
                                取消
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        //判断名称格式与长度
        function txtNameCheck(obj) {
            var txt = $("#txtName").val();
            if (txt.length > 20) {
                var a=$(this).find("[data-bv-for=txtName]");
                txt = txt.substring(0, 20);
                $("#txtName").val(txt);
                $("small[data-bv-for=txtName]").text('');
                $("#txtName").css("border-color", "#2b542c");
                $("#txtName_LB").css("color", "#2b542c");
            }
        }
    </script>
</asp:Content>
