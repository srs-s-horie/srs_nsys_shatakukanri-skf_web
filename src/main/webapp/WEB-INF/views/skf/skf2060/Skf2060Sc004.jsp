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
  
    // 「新規提示」ボタン押下時のイベント
    onClickNewCandidate = function () {
        nfw.common.submitForm("form", "skf/Skf2060Sc001/Init");
    }

    // 「督促メール送信」ボタン押下時のイベント
    onClickSendMail = function () {
        // チェックされた督促チェックボックスの値を配列として取得
     var checkedReminderBoxMap = $("[name=reminderChkVal]:checked").map(function() {
         return $(this).val();
     }).get();
        
     // 選択項目が無い場合
        if( checkedCompBoxMap.length <= 0 ){
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
      // TODO 現行にチェック有無判定がないため削除予定
      // チェックされた完了チェックボックスの値を配列として取得
//       var checkedCompBoxMap = $("[name=completeChkVal]:checked").map(function() {
//         return $(this).val();
//       }).get();
      
//       // 選択項目が無い場合
//         if( checkedCompBoxMap.length <= 0 ){
//             nfw.common.showReserveMessage("warning", "選択してください。");
//             return false;
//         }

        // TODO メッセージConstから取得
        skf.common.confirmPopup("選択された申請書を一括で承認します。よろしいですか？", 
                "確認", "form", "skf/Skf2060Sc004/BulkComplete", 
                "OK", "キャンセル", this, false);
    }
    
    // リストテーブルクリック時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
        if ($(cellContent).hasClass('im-ui-icon-common-16-update')) {
          // 再提示押下時
          onClickRecandidate(rowId);
        }else if ($(cellContent).hasClass('im-ui-icon-menu-24-document')){
          // 確認押下時
          onClickConfirm(rowId);
        }
    }
    
    // 選択行から遷移先画面に渡すパラメータ情報を取得する
    getGridRowData = function(rowId){
      var grid = $("#mainList");
        var rowData = grid.getRowData(rowId);
        
        $("#paramUserCd").val(rowData.candidatePersonNo);
        $("#paramUserName").val(rowData.candidatePersonName);
        $("#paramApplNo").val(rowData.applNo);
        $("#paramApplId").val(rowData.applId);
        $("#paramApplStatusCd").val(rowData.applStatusCd);
    }
    
    // 再提示押下時の処理
    onClickRecandidate = function(rowId){
      getGridRowData(rowId);
        
        var nextPageUrl = "skf/Skf2060Sc001/Recandidate";
        $("#paramForm").attr("action", nextPageUrl);
        
        nfw.common.submitForm("paramForm", nextPageUrl);
    }
    
    // 確認押下時の処理
    onClickConfirm = function(rowId){
      getGridRowData(rowId);
      
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
        }
    }
    
    //ウィンドウリサイズ時イベント
    $(window).bind('resize', function(){
        // 一覧の横幅を変更（90%）
        $('#mainList').setGridWidth($(window).width() * 0.9);
    }).trigger('resize');

    
  })(jQuery);
</script>

<!-- カレンダー出力用スクリプト -->
<script type="text/javascript">
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal001").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal002").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal003").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal004").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal005").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal006").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal007").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal008").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);      
  (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal009").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
</script>

<!-- コンテンツエリア -->
<div>
<nfwui:Form id="form" name="form" modelAttribute="form">
    <div class="imui-form-container-wide">
        <table class="imui-form-search-condition" width="100%" style="border: none;" >
            <td style="width: 45%; border: none;" >
                <div>
                    <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2060_SC004_SEARCH_TITLE %>" titleLevel="2" />
                    <table class="imui-form-search-condition">
                        <tr>
                            <th style="width: 200px;">
                                <nfwui:LabelBox id="candidateDate" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_DATE %>" />
                            </th>
                            <td colspan="2">
                                <imui:textbox  type="text" name="candidateDateFrom" id="candidateDateFrom" value="${form.candidateDateFrom}" style="width:100px" />
                                &nbsp;～&nbsp;
                                <imui:textbox  type="text" name="candidateDateTo" id="candidateDateTo" value="${form.candidateDateTo}" style="width:100px" />
                            </td>
                        </tr>
                        <im:calendar floatable="true" altField="#candidateDateFrom" />
                        <im:calendar floatable="true" altField="#candidateDateTo" />
                        <tr>
                            <th style="width: 200px;">
                                <div style="float:right" >
                                    <nfwui:PopupButton id="support" name="support" value="支援"
                                        cssClass="imui-small-button" use="popup"
                                        screenUrl="skf/Skf2010Sc001/init"
                                        popupWidth="650" popupHeight="700"
                                        modalMode="false" />
                                </div>
                                <nfwui:LabelBox id="personName" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_PERSON_NAME %>"/>
                                &nbsp;&nbsp;
                                
                            </th>
                            <td colspan="2">
                                <input name="candidatePersonName" id="candidatePersonName" placeholder="例 中日本　一郎"
                                       value="${form.candidatePersonName}"></input>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 200px;">
                                <nfwui:LabelBox id="shatakuName" code="<%= MessageIdConstant.SKF2060_SC004_SHATAKU_NAME %>" />
                            </th>
                            <td colspan="2">
                                <input name="shatakuName" id="shatakuName" placeholder="例 厚木宿舎" value="${form.shatakuName}"></input>
                            </td>
                        </tr>

                        <tr>
                            <th style="width: 200px;">
                                <nfwui:LabelBox id="shatakuAddressName" code="<%= MessageIdConstant.SKF2060_SC004_SHATAKU_ADDRESS_NAME %>"/>
                            </th>
                            <td colspan="2">
                                <input name="shatakuAddressName" id="shatakuAddressName" placeholder="例 神奈川県厚木市恩名"></input>
                            </td>
                        </tr>   

                        <tr>
                            <th style="width: 200px;"　rowspan="2">
                                <nfwui:LabelBox id="candidateStatus" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_STATUS %>" />
                            </th>
                            <td colspan="2">
                                <nfwui:CheckBoxGroupTag id="candidateStatus">
                                <table>
                                    <tr style="height: 25px;">
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus01" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_KAKUNIN_IRAI %>" label="確認依頼" />
                                        </td>
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus02" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_SENTAKU_ZUMI %>" label="選択済" />
                                        </td>
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus03" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_SENTAKU_SHINAI %>" label="選択しない" />
                                        </td>
                                        <td>
                                            <nfwui:CheckBox id="candidateStatus04" name="candidateStatus"
                                                value="<%= CodeConstant.STATUS_KANRYOU %>" label="完了" />
                                        </td>
                                    </tr>
                                </table>
                                </nfwui:CheckBoxGroupTag>
                            </td>
                        </tr>
                    </table>
                    <div class="align-L">
                        <nfwui:Button id="search" name="search" value="検索" cssClass="imui-small-button" 
                            url="skf/Skf2060Sc004/search" formId="form" tabindex="8" />
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
</div>

<!-- テーブル一覧箇所 -->
<div class="imui-form-container-wide">
    <nfwui:Title id="listTitle" code="<%= MessageIdConstant.SKF2060_SC004_SEARCH_RESULT %>" titleLevel="2" />
    <nfwui:CheckBoxGroupTag id="completeChkVal">
    <nfwui:CheckBoxGroupTag id="reminderChkVal">
        <imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
            autoResize="true" onCellSelect="onCellSelect"
            multiSelect="false" data="${form.listTableData}"
            style="max-height: 1000px" 
            height="232">
            <pager rowNum="${form.listTableMaxRowCount}" />
            <cols sortable="false">
            <col name="applId" hidden="true" />
            <col name="applNo" hidden="true" />
            <col name="applStatusCd" hidden="true" />
            <col name="completeChk" caption="完了" width="40" sortable="false" align="center" />
            <col name="reminderChk" caption="督促" width="40" sortable="false" align="center" />
            <col name="candidateStatus" caption="提示状況" width="80" sortable="false" onCellAttr="onCellAttr"/>
            <col name="candidateDate" caption="提示日" width="80" sortable="false" />
            <col name="candidatePersonNo" caption="社員番号" width="70" sortable="false" />
            <col name="candidatePersonName" caption="提示対象者" width="120" sortable="false" />
            <col name="shatakuName" caption="借上社宅名" sortable="false" />
            <col name="shatakuAddress" caption="社宅所在地" sortable="false" />
            <col name="biko" caption="備考" width="125" sortable="false" />
            <col name="recandidate" caption="再提示" width="50" sortable="false" align="center" >
                <showIcon iconClass="im-ui-icon-common-16-update" />
            </col>
            <col name="confirm" caption="確認" width="50" sortable="false" align="center" >
                <showIcon iconClass="im-ui-icon-menu-24-document" />
            </col>
            </cols>
        </imui:listTable>
    </nfwui:CheckBoxGroupTag>
    </nfwui:CheckBoxGroupTag>
    
    <br>
    <div class="align-R">
        <imui:button id="newCandidate" name="newCandidate" value="新規提示" class="imui-medium-button" onclick="onClickNewCandidate()" />
        
        <imui:button id="sendMail" name="sendMail" value="督促メール送信" class="imui-medium-button" onclick="onClickSendMail()" />
        
        <imui:button id="bulkComplete" name="bulkComplete" value="一括完了" class="imui-medium-button" onclick="onClickBulkComplete()" />
    </div>
</div>

 <br><br>

<!-- NFWUIフォーム終了位置 -->
</nfwui:Form>

<!-- 遷移先画面に渡すパラメータフォーム -->
<nfwui:Form id="paramForm" name="paramForm" modelAttribute="form" secureToken="false">
    <input type="hidden" id="paramUserCd" name="userCd" value="" />
    <input type="hidden" id="paramUserName" name="userName" value="" />
    <input type="hidden" id="paramApplNo" name="applNo" value="" />
    <input type="hidden" id="paramApplId" name="applId" value="" />
    <input type="hidden" id="paramApplStatus" name="applStatus" value="" />
    <input type="hidden" name="backUrl" value="skf/Skf2060Sc004/init" />
</nfwui:Form>

<!-- コンテンツエリア　ここまで -->