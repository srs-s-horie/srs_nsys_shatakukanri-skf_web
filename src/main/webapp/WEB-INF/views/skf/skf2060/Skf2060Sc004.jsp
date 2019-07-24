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

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
<nfwui:Form id="form" name="form" modelAttribute="form">
<table align="center">
    <tr>
        <td>
            <div>
                <table class="imui-form-search-condition" width="100%" style="border: none;" >
                    <td class="imui-form-container-wide" style="width: 650p; border: none;background-color: #fdfdff;" >
                     <div class="imui-form-container-wide" style="width: 650px;height:300px;">
                       <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2060_SC004_SEARCH_TITLE %>" titleLevel="2" />
                            <table class="imui-form-search-condition">
                                <tr>
                                    <th style="width: 120px;">
                                        <nfwui:LabelBox id="candidateDate" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_DATE %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textbox  type="text" name="candidateDateFrom" id="candidateDateFrom" value="${form.candidateDateFrom}"/>
                                        &nbsp;～&nbsp;&nbsp;
                                        <imui:textbox  type="text" name="candidateDateTo" id="candidateDateTo" value="${form.candidateDateTo}"/>
                                    </td>
                                </tr>
                                <im:calendar floatable="true" altField="#candidateDateFrom" />
                                <im:calendar floatable="true" altField="#candidateDateTo" />
                                <tr>
                                    <th style="width: 120px;">
                                        <nfwui:LabelBox id="candidatePersonName" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_PERSON_NAME %>" style="float:left" />
                                        &nbsp;&nbsp;
                                        <nfwui:PopupButton id="support" name="support" value="支援"
                                            cssClass="imui-small-button" use="popup"
                                            screenUrl="skf/Skf2010Sc001/init"
                                            popupWidth="650" popupHeight="700"
                                            modalMode="false" />
                                    </th>
                                    <td style="width: 180px;" colspan="2">
                                    <input name="candidatePersonName" id="candidatePersonName" placeholder="例 中日本　一郎"
                                        value="${form.candidatePersonName}"></input>
                                    </td>
                                </tr>   

                                <tr>
                                    <th style="width: 120px;">
                                        <nfwui:LabelBox id="shatakuName" code="<%= MessageIdConstant.SKF2060_SC004_SHATAKU_NAME %>" />
                                    </th>
                                    <td style="width: 180px;" colspan="2">
                                    <input name="shatakuName" id="shatakuName" placeholder="例 厚木宿舎"
                                        value="${form.shatakuName}"></input>
                                    </td>
                                </tr>   

                                <tr>
                                    <th style="width: 120px;">
                                        <nfwui:LabelBox id="shatakuAddressName" code="<%= MessageIdConstant.SKF2060_SC004_SHATAKU_ADDRESS_NAME %>"/>
                                    </th>
                                    <td style="width: 180px;" colspan="2">
                                    <input name="shatakuAddressName" id="shatakuAddressName" placeholder="例 神奈川県厚木市恩名"></input>
                                    </td>
                                </tr>   

                                <tr>
                                    <th style="width: 120px;"　rowspan="2">
                                        <nfwui:LabelBox id="candidateStatus" code="<%= MessageIdConstant.SKF2060_SC004_CANDIDATE_STATUS %>" />
                                    </th>
                                    <td style="width: 180px;" colspan="2">
                                        <nfwui:CheckBoxGroupTag id="candidateStatus">
                                        <table>
                                            <tr style="height: 25px;">
                                                <td>
                                                    <nfwui:CheckBox id="candidateStatus01" name="candidateStatus"
                                                        value="01" label="確認依頼" />
                                                </td>
                                                <td>
                                                    <nfwui:CheckBox id="candidateStatus02" name="candidateStatus"
                                                        value="02" label="選択済" />
                                                </td>
                                                <td>
                                                    <nfwui:CheckBox id="candidateStatus03" name="candidateStatus"
                                                        value="03" label="選択しない" />
                                                </td>
                                                <td>
                                                    <nfwui:CheckBox id="candidateStatus04" name="candidateStatus"
                                                        value="04" label="完了" />
                                                </td>
                                            </tr>
                                        </table>
                                        </nfwui:CheckBoxGroupTag>
                                    </td>
                                </tr>   
                            </table>
                         <div class="align-L">	
                             <nfwui:Button id="search" name="search" value="検索" cssClass="imui-small-button" 
                                 url="skf/Skf2060Sc004/init" formId="form" tabindex="8" />
                         </div>
                         </div>
                         
                         
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

            <td style="width: 45%; border: none;background-color: #fdfdff;">
                <div class="imui-form-container-wide" width="100%" style="width: 600px;height:300px;">
                <div style="overflow-y:scroll;max-height:300px;height:300px">
                    <table >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>操作ガイド</h2>
                        </div>

                            <tr>
                                <td>
                                    完了：
                                </td>
                                <td width="74%" valign="top" align="left">
                                    チェックした借上候補物件提示結果を一括完了できます。<br/>
                                    確認依頼中の借上候補物件提示内容は一括完了対象外です。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    提示状況：
                                </td>
                                <td>
                                    借上候補物件提示内容の現在の状態を表します。
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue;" >確認依頼：</span>
                                </td>
                                <td>
                                    提示対象者に借上候補物件情報を提示している申請書類です。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue;" >選択済：</span>
                                </td>
                                <td>
                                    提示対象者が提示内容の借上候補物件を選択した申請書類です。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue;" >選択しない：</span>
                                </td>
                                <td>
                                    提示対象者が提示内容の借上候補物件を選択しなかった申請書類です。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:green;" >完了：</span>
                                </td>
                                <td>
                                    借上候補物件の提示業務が完了した申請書類です。
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:green;">「再提示」：</span>
                                </td>
                                <td>
                                    借上候補物件の提示内容変更等で再度提示が必要な場合は再提示を行います。<br/>
                                    <span style="font-weight: bold;color:green;">「再提示」</span>をクリックすると、借上候補物件登録画面に遷移します。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:green;">「確認」：</span>
                                </td>
                                <td>
                                    借上候補物件の提示内容の確認を行います。<br/>
                                    <span style="font-weight: bold;color:green;">「確認」</span>をクリックすると、借上候補物件提示確認画面に遷移します。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:green;">「新規提示」：</span>
                                </td>
                                <td>
                                    新規に借上候補物件の提示を行います。
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:green;">「一括完了」：</span>
                                </td>
                                <td>
                                    「完了」がチェックされている申請書類を一括完了します。
                                </td>
                            </tr>

                        </div>
                    </table>
                </div>  

            </td>
</table>

</div>

</div>

<script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>


</div>

<!-- テーブル一覧箇所 -->
<div class="imui-form-container" width="1300px" style="width: 100%; max-width: 1300px;">
                <nfwui:CheckBoxGroupTag id="completeChkVal">
                <nfwui:CheckBoxGroupTag id="reminderChkVal">
                    <imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
                        autoResize="true" onCellSelect="onCellSelect"
                        multiSelect="false" data="${form.listTableData }"
                        style="max-height: 800px" >
                        <pager rowNum="${form.listTableMaxRowCount }" />
                        <cols sortable="false">
                        <col name="col1" caption="完了" width="30" sortable="false" align="center" />
                        <col name="col2" caption="督促" width="50" sortable="false" align="center" />
                        <col name="col3" caption="提示状況" width="60" sortable="false" />
                        <col name="col4" caption="提示日" width="65" sortable="false" />
                        <col name="col5" caption="社員番号" width="60" sortable="false" />
                        <col name="col6" caption="提示対象者" width="120" sortable="false" />
                        <col name="col7" caption="借上社宅名" width="255" sortable="false" />
                        <col name="col8" caption="社宅所在地" width="300" sortable="false" />
                        <col name="col9" caption="備考" width="125" sortable="false" />
                        <col name="col10" caption="再提示" width="75" sortable="false" align="center" />
                        <col name="col11" caption="確認" width="75" sortable="false" align="center" >
                        </col>
                        </cols>
                    </imui:listTable>
                </nfwui:CheckBoxGroupTag>
                </nfwui:CheckBoxGroupTag>

<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <form id="sampleList1">
    <div class="imui-chapter-title" width="1300px" style="width:1300px; max-width:1300px;">
<%--         <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2060_SC004_SEARCH_RESULT %>" titleLevel="2" /> --%>
    </div>
        <script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>

<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>

<div id="sampleListTable1-pager"></div>

<script type="text/javascript">
  (function() {

    (function($) {
      $(document).ready(function() {

      });
    })(jQuery);
  })();
</script>
<br>
  </form>
        <div class="align-R">
            <input tabindex="19" name="imui-8euruuk15dn9qtq" id="submit0" type="button" value="新規提示" class="imui-medium-button" onclick="location.href='../../skf/Skf2060_Sc001/init'">
            
            <input tabindex="19" name="imui-8euruuk15dn9qtq" id="submit0" type="button" value="督促メール送信" class="imui-medium-button" />
            
            <input tabindex="19" name="imui-8euruuk15dn9qtq" id="submit0" type="button" value="一括完了" class="imui-medium-button" />
        </div>
</div>
</div>

 <br><br>

</table>
<!-- NFWUIフォーム終了位置 -->
</nfwui:Form>
<div class="align-R">
     <!-- <input class="imui-medium-button check" type="button" value="CSV出力" style="width:150px;"  > -->
</div> 



</div>
<!-- コンテンツエリア　ここまで -->