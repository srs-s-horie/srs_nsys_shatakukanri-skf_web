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

<!-- コンテンツエリア:モックのまま -->
<!-- 以下ツールバー -->
<div class="imui-toolbar-wrap">
    <div class="imui-toolbar-inner">
        <!-- ツールバー左側 -->
        <ul class="imui-list-toolbar">
            <!-- 戻る -->
            <li><a class="imui-toolbar-icon" title="戻る" tabindex="23"
                onclick="back1()" href="javascript:void(0);"><span
                    class="im-ui-icon-common-16-back"></span></a></li>
                    
        </ul>
        <!-- ツールバー右側 -->
        <ul class="imui-list-box-toolbar-utility">
                                    <li>
                        <a onclick="back()" class="imui-toolbar-icon" tabindex="16">
                            <span class="im-ui-icon-common-16-home"></span>
                            社宅TOP
                        </a>
                    </li>
            <li><a class="imui-toolbar-icon" title="最新情報"  tabindex="22"><span
                    class="im-ui-icon-common-16-refresh"
                    onclick="refresh()"></span></a></li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
        showConfirm(W_GFK_0002, function() {
            history.back()
        });
    }

            /**
            * メニュー画面へ遷移する。
            */
            function back() {
                showConfirm(W_GFK_0007, function() {
                    $.StandardPost("../common/top.html");
                });
            }
</script>

<!-- <div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!-- <div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!-- </div>  -->
<!-- </div> -->

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
<table align="center">
    <tr>
        <td>
            <div>
                <table class="imui-form-search-condition" width="100%" style="border: none;" >
                    <td class="imui-form-container-wide" style="width: 650p; border: none;background-color: #fdfdff;" >
                     <div class="imui-form-container-wide" style="width: 650px;height:300px;">
                       <div class="imui-chapter-title" style="margin-bottom: 1px;" >
                            <h2>検索条件</h2>
                        </div>
                            <form id="form" class="target_form mt-10" action="" method="POST">
                                <table class="imui-form-search-condition">
                                    <tr>
                                        <th style="width: 120px;">
                                            <label>提示日</label>
                                        </th>
                                        <td colspan="2">
                                            <input type="text" name="cal001" id="cal001" value="9999/99/99"/>&nbsp;～&nbsp;&nbsp;<input type="text" name="cal002" id="cal002" value="9999/99/99"/>
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 120px;">
                                            <label>提示対象者名<div class="align-R float-R"><input class="imui-small-button check" type="button" value="支援"></div></input></label>
                                            
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <input placeholder="例 中日本　一郎"></input>
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 120px;">
                                            <label>借上社宅名</label>
                                            
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <input placeholder="例 厚木宿舎"></input>
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 120px;">
                                            <label>社宅所在地</label>
                                            
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <input placeholder="例 神奈川県厚木市恩名"></input>
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 120px;"　rowspan="2">
                                            <label>提示状況&nbsp;&nbsp;
                                            </label>

                                            
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                            <table>
                                                <tr style="height: 25px;">
                                                    <td>
                                                        <INPUT checked type="checkbox">確認依頼&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <INPUT checked type="checkbox">選択済&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <INPUT checked type="checkbox">選択しない&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <INPUT type="checkbox">完了
                                                    </td>

                                                </tr>
                                        
                                            </table>
                                        </td>
                                    </tr>   
                                </table>
                            </form>
        
        
                         <div class="align-L">  
                             <input tabindex="19" name="imui-8euruuk15dn9qtq" id="submit0" type="button" value="検索" class="imui-medium-button" >
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
<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <form id="sampleList1">
    <div class="imui-chapter-title" width="1300px" style="width:1300px; max-width:1300px;"><h2>検索結果一覧</h2></div>
        <script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>

<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>

<div id="sampleListTable1-pager"></div>

<script type="text/javascript">
  (function() {
    function imuiListTable() {

      var grid = jQuery('#sampleListTable1');
                                        var parameter = {
                                            "multiselect":false,
                                            "pager":"#sampleListTable1-pager",
                                            "colNames":[
                                                "",
                                                "完了",
                                                "督促 ",
                                                "提示状況",
                                                "提示日",
                                                "社員番号",
                                                "提示対象者",
                                                "借上社宅名",
                                                "社宅所在地",
                                                "備考",
                                                "再提示",
                                                "確認",
                                            ],
                                            "datatype":"local",
                                            "errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
                                            "rowNum":10,
                                            "width":"1300",
                                            "shrinkToFit":"false",
                                            "cellsubmit":"clientArray",
                                            "loadonce":true,
                                            "colModel":[
{"hidden":true,"name":"id","key":true}
,{"name":"A001","width":"030","align":"center"}<!-- 完了 -->
,{"name":"A012","width":"050","align":"center"}<!-- 督促 -->
,{"name":"A002","width":"060","align":"center"}<!-- 提示状況 -->
,{"name":"A003","width":"065","align":"center"}<!-- 提示日 -->
,{"name":"A004","width":"060","align":"center"}<!-- 社員番号 -->
,{"name":"A005","width":"120","align":"left"}  <!-- 申提示対象者 -->
,{"name":"A006","width":"255","align":"left"}<!-- 借上社宅名 -->
,{"name":"A007","width":"300","align":"left"}<!-- 社宅所在地 -->
,{"name":"A008","width":"125","align":"left"}<!-- 備考 -->
,{"name":"A010","width":"075","align":"center"}<!-- 再提示 -->
,{"name":"A011","width":"075","align":"center"}<!-- 確認 -->
                                            ],
                                            "rownumbers":true,
                                            "height":"232"
                                        };
                                        parameter.data = [
                                            {
"A001":"<INPUT type='checkbox'>",
"A012":"<INPUT type='checkbox'>",
"A002":"<font style='color:blue'>選択済</font>",
"A003":"2018/11/14",
"A004":"01707424",
"A005":"中日本 0001",
"A006":"みずほ台1",
"A007":"東京都〇〇市△△△",
"A008":"××××××××",
"A010":"<a hidden>再提示</a><input type='button' value='再提示' class='imui-small-button' onclick=\"location.href='../../skf/Skf2060_Sc001/init'\">",
"A011":"<a hidden>確認</a><input type='button' value='確認' class='imui-small-button' onclick=\"location.href='../../skf/Skf2060_Sc003/init'\">",
                                                "id":1
                                            },
                                            {
"A001":"<INPUT type='checkbox'>",
"A012":"<INPUT type='checkbox'>",
"A002":"<font style='color:blue'>確認依頼</font>",
"A003":"2018/11/14",
"A004":"01112233",
"A005":"中日本 0002",
"A006":"",
"A007":"",
"A008":"",
"A010":"",
"A011":"<a hidden>確認</a><input type='button' value='確認' class='imui-small-button' onclick=\"location.href='../../skf/Skf2060_Sc003/init'\">",
                                                "id":2
                                            }
                                        ];

      grid.jqGrid(parameter);

      grid.jqGrid('navGrid','#sampleListTable1-pager',{
        edit: false,
        add: false,
        del: false,
        search: false
      });

      var gboxGridId     = 'gbox_sampleListTable1';
      var gboxGrid       = jQuery('#' + gboxGridId);
      var parentWidthOld = Number.MIN_VALUE;
    }

    (function($) {
      $(document).ready(function() {
        imuiListTable();

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

<div class="align-R">
     <!-- <input class="imui-medium-button check" type="button" value="CSV出力" style="width:150px;"  > -->
</div> 



</div>
<!-- コンテンツエリア　ここまで -->