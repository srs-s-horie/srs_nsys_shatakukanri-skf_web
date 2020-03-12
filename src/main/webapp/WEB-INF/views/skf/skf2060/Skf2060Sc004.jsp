<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<script src="scripts/skf/skfCommon.js"></script>

<%-- コンテンツエリア --%>

<script type="text/javascript">
  (function($){
    // 画面表示時に定義される処理
    $(document).ready(function(){

    });

    // 提示候補者名欄でDeleteKeyまたはBackSpaceを押下時イベント
    candidateName_KeyDown = function(e) {
        var c = e.keyCode;
        if (c == 46 || c == 8) {
            $("#candidatePersonName").val("");
            // 裏で保持している社員番号をクリア
            $("#candidatePersonNo").val("");
        }
    };

    // 「新規提示」ボタン押下時のイベント
    onClickNewCandidate = function () {
        nfw.common.submitForm("paramForm", "skf/Skf2060Sc001/Init");
    }

    // 「督促メール送信」ボタン押下時のイベント
    onClickSendMail = function () {
        // チェックされた督促チェックボックスの値を配列として取得
     var checkedReminderBoxMap = $("[name=reminderChkVal]:checked").map(function() {
         return $(this).val();
     }).get();

     // 選択項目が無い場合
        if( checkedReminderBoxMap.length <= 0 ){
            nfw.common.showReserveMessage("warning", "メール送付対象を選択してください。");
            return false;
        }

        // TODO メッセージConstから取得
        skf.common.confirmPopup("督促メールを送信します。よろしいですか？", 
                "確認", "form", "skf/Skf2060Sc004/SendMail", 
                "OK", "キャンセル", this, false);
    }

    // 「一括完了」ボタン押下時のイベント
    onClickBulkComplete = function () {
        // TODO メッセージConstから取得
        //W_GFK_0001.replace('{0}', '申請内容を確認')
        skf.common.confirmPopup("選択された申請書を一括で承認します。よろしいですか？", 
                "確認", "form", "skf/Skf2060Sc004/BulkComplete", 
                "OK", "キャンセル", this, false);
    }

    // リストテーブルクリック時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
        if ($(cellContent).hasClass('im-ui-icon-common-16-update')) {
          // 再提示押下時
          onClickRecandidate(rowId);
        }else if ($(cellContent).hasClass('im-smart-icon-common-16-information')){
          // 確認押下時
          onClickConfirm(rowId);
        }
    }

    // 選択行から遷移先画面に渡すパラメータ情報を取得する
    setParamFromGridRowData = function(rowId){
        var grid = $("#mainList");
        var rowData = grid.getRowData(rowId);
        $("#paramUserCd").val(rowData.candidatePersonNo);
        $("#paramApplNo").val(rowData.applNo);
        $("#paramApplStatus").val(rowData.applStatusCd);
    }

    // 再提示押下時の処理
    onClickRecandidate = function(rowId){
        // TODO メッセージConstから取得
        if(!confirm("既に選択済みですが、再提示します。よろしいですか？")){
            return;
        }
        setParamFromGridRowData(rowId);

        var nextPageUrl = "skf/Skf2060Sc001/Init";
        $("#paramForm").attr("action", nextPageUrl);

        nfw.common.submitForm("paramForm", nextPageUrl);
    }

    // 確認押下時の処理
    onClickConfirm = function(rowId){
        setParamFromGridRowData(rowId);

        var nextPageUrl = "skf/Skf2060Sc003/Init";
        $("#paramForm").attr("action", nextPageUrl);

        nfw.common.submitForm("paramForm", nextPageUrl);
    }

    // リストテーブルの申請状況の文字色変更
    onCellAttr = function(rowId,val,rawObject,cm,rdata){
        var style;
        switch (val) {
        case '完了':
            style = 'style="color:green;"';
            break;
        default:
            style = 'style="color:blue;"';
        break;
        }
        return style;
    }

    // 社員選択支援ポップアップ コールバック関数
    shainInfoCallback = function(param){
        if( param != null && typeof param == 'object' && param.name != null){
            $("#candidatePersonName").val(param.name);
            $("#candidatePersonNo").val(param.shainNo);
        }
    }

    //ウィンドウリサイズ時イベント
    $(window).bind('resize', function(){
        // 一覧の横幅を変更
        $('#mainList').setGridWidth($("#listTableArea").width(), true);
    }).trigger('resize');

  })(jQuery);
</script>

<!-- コンテンツエリア -->

<nfwui:Form id="form" name="form" modelAttribute="form">
    <div class="imui-form-container-wide">
        <table class="imui-form-search-condition" width="100%" style="border: none;" >
            <td style="width: 45%; border: none;" >
                <div>
                    <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2060_SC004_SEARCH_TITLE %>" titleLevel="2" />
                    <table class="imui-form-search-condition">
                        <tr>
                            <th style="width: 200px;">
                                <nfwui:LabelBox id="lblCandidateDate" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_DATE %>" />
                            </th>
                            <td colspan="2">
                                <nfwui:DateBox id="candidateDateFrom" name="candidateDateFrom" value="${f:h(form.candidateDateFrom)}"
                                               cssClass="${f:h(form.candidateDateFromErr)}" tabindex="3" cssStyle="width:100px"/>
                                &nbsp;～&nbsp;
                                <nfwui:DateBox id="candidateDateTo" name="candidateDateTo" value="${f:h(form.candidateDateTo)}"
                                               cssClass="${f:h(form.candidateDateToErr)}" tabindex="4" cssStyle="width:100px"/>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 200px;">
                                <div style="float:right" >
                                    <nfwui:PopupButton id="support" name="support" value="支援"
                                        cssClass="imui-small-button" use="popup"
                                        screenUrl="skf/Skf2010Sc001/init"
                                        popupWidth="640" popupHeight="800"
                                        modalMode="true"  tabindex="5"/>
                                </div>
                                <nfwui:LabelBox id="lblCandidatePersonName" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_PERSON_NAME %>"/>
                                &nbsp;&nbsp;
                                
                            </th>
                            <td colspan="2">
                                <input type="hidden" name="candidatePersonNo" id="shainNo" value="${form.candidatePersonNo}" />
                                <input name="candidatePersonName" id="candidatePersonName" placeholder="例 中日本　一郎"
                                       value="${f:h(form.candidatePersonName)}" readonly="readonly" tabindex="6" onKeyDown="candidateName_KeyDown(event)" ></input>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 200px;">
                                <nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2060_SC004_SHATAKU_NAME %>" />
                            </th>
                            <td colspan="2">
                                <input name="shatakuName" id="shatakuName" style="ime-mode:active;" placeholder="例 厚木宿舎" value="${form.shatakuName}"  tabindex="7"></input>
                            </td>
                        </tr>

                        <tr>
                            <th style="width: 200px;">
                                <nfwui:LabelBox id="lblShatakuAddressName" code="<%= MessageIdConstant.SKF2060_SC004_SHATAKU_ADDRESS_NAME %>"/>
                            </th>
                            <td colspan="2">
                                <input name="shatakuAddressName" id="shatakuAddressName" style="ime-mode:active;" placeholder="例 神奈川県厚木市恩名" value="${f:h(form.shatakuAddressName)}" tabindex="8"></input>
                            </td>
                        </tr>   

                        <tr>
                            <th style="width: 200px;"　rowspan="2">
                                <nfwui:LabelBox id="lblCandidateStatus" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_STATUS %>" />
                            </th>
                            <td colspan="2">
                                <nfwui:CheckBoxGroupTag id="candidateStatus">
                                <table class="${f:h(form.candidateStatusErr)}">
                                    <tr style="height: 25px;">
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus01" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_KAKUNIN_IRAI %>" label="確認依頼" tabindex="8" />
                                        </td>
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus02" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_SENTAKU_ZUMI %>" label="選択済" tabindex="10" />
                                        </td>
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus03" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_SENTAKU_SHINAI %>" label="選択しない" tabindex="11" />
                                        </td>
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus04" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_KANRYOU %>" label="完了" tabindex="12" />
                                        </td>
                                    </tr>
                                </table>
                                </nfwui:CheckBoxGroupTag>
                            </td>
                        </tr>
                    </table>
                    <div class="align-L">
                        <nfwui:Button id="Skf2060Sc004Search" name="Skf2060Sc004Search" value="検索" cssClass="imui-small-button" 
                            url="skf/Skf2060Sc004/search" formId="form" tabindex="13" />
                    </div>
                </div>
                <!-- 操作ガイド -->
                <td style="width: 45%; border: none;background-color: #fdfdff;">
                    <div style="overflow-y:scroll; max-height:300px; height:300px; margin-left: 20px; background-color:#eeeeee;">
                        <nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2060_SC004_OPERATION_GUIDE %>" titleLevel="2" />
                        <div style="margin-left: 20px;">
                            ${form.operationGuide}
                        </div>
                    </div>  
                </td>
            </td>
        </table>
    </div>


<!-- テーブル一覧箇所 -->
<div class="imui-form-container-wide">
    <nfwui:Title id="listTitle" code="<%= MessageIdConstant.SKF2060_SC004_SEARCH_RESULT %>" titleLevel="2" />
    <!-- listTable表示領域 -->
    <div id="listTableArea">
        <nfwui:CheckBoxGroupTag id="completeChkVal">
        <nfwui:CheckBoxGroupTag id="reminderChkVal">
            <imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
                autoResize="true" onCellSelect="onCellSelect"
                multiSelect="false" data="${form.listTableData}"
                style="max-height: 1000px" 
                height="232">
                <pager rowNum="${form.listTableMaxRowCount}" />
                <cols sortable="false">
                <col name="completeChk" caption="完了" width="30" sortable="false" align="center" />
                <col name="reminderChk" caption="督促" width="30" sortable="false" align="center" />
                <col name="candidateStatus" caption="提示状況" width="50" sortable="false" onCellAttr="onCellAttr" align="center" />
                <col name="candidateDate" caption="提示日" width="50" sortable="false" wrap="true" align="center" />
                <col name="candidatePersonNo" caption="社員番号" width="60" sortable="false" wrap="true"/>
                <col name="candidatePersonName" caption="提示対象者" width="90" sortable="false" wrap="true"/>
                <col name="shatakuName" caption="借上社宅名" width="140" sortable="false" wrap="true"/>
                <col name="shatakuAddress" caption="社宅所在地" sortable="false" wrap="true" onCellAttr="cellAttrEllipsis"/>
                <col name="biko" caption="備考" width="125" sortable="false" wrap="true"/>
                <col name="recandidate" caption="再提示" width="30" sortable="false" align="center" >
                    <showIcon iconClass="im-ui-icon-common-16-update" />
                </col>
                <col name="confirm" caption="確認" width="30" sortable="false" align="center" >
                    <showIcon iconClass="im-smart-icon-common-16-information" />
                </col>
                <col name="applId" hidden="true" />
                <col name="applNo" hidden="true" />
                <col name="applStatusCd" hidden="true" />
                </cols>
            </imui:listTable>
        </nfwui:CheckBoxGroupTag>
        </nfwui:CheckBoxGroupTag>
    </div>
    
    <br>
    <div class="align-R">
        <imui:button id="newCandidate" name="newCandidate" value="新規提示" class="imui-medium-button"
                     onclick="onClickNewCandidate()" tabindex="97" />
        
        <imui:button id="sendMail" name="sendMail" value="督促メール送信" class="imui-medium-button"
                     onclick="onClickSendMail()" tabindex="98" />
        
        <imui:button id="bulkComplete" name="bulkComplete" value="一括完了" class="imui-medium-button"
                     onclick="onClickBulkComplete()" tabindex="99" />
    </div>
</div>

 <br><br>

<!-- NFWUIフォーム終了位置 -->
</nfwui:Form>

<!-- 遷移先画面に渡すパラメータフォーム -->
<nfwui:Form id="paramForm" name="paramForm" modelAttribute="form" secureToken="false">
    <input type="hidden" id="paramUserCd" name="shainNo" value="" />
    <input type="hidden" id="paramApplNo" name="applNo" value="" />
    <input type="hidden" id="paramApplStatus" name="applStatus" value="" />
    <input type="hidden" name="backUrl" value="skf/Skf2060Sc004/init" />
</nfwui:Form>
<!-- 隠し項目 -->
<input type="hidden" name="insertFormName" id="insertFormName" value="candidatePersonName" /> <!-- 支援ポップアップ社員名受け取り用 -->
<!-- 隠し項目終わり -->

<!-- コンテンツエリア　ここまで -->