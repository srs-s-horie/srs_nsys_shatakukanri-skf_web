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
<%@ page import="jp.co.c_nexco.skf.skf2010.app.skf2010sc008.Skf2010Sc008Form" %>

<% // 代行ログイン時CSS読み込み箇所ここから  %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<% // 代行ログイン時CSS読み込み箇所ここまで %>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->
<!-- エラーメッセージ表示域（モック作成時は特に変更する必要なし） -->
<div id="errdiv" class="alert alert-error notshow"></div>

<script type="text/javascript">
  (function($){
    // 画面表示時に定義される処理
    $(document).ready(function(){
        // TODO 画面状態によって、初期表示時に各領域の表示/非表示を切り替える
        //代行ログイン後初期表示
        if($("#alterLoginFlg").val() == "1"){
        	$("#Skf2010Sc008_1").hide();
            $("#Skf2010Sc008_2").show();
            $("#loginButton").hide();
            $("#alterLoginMessage").hide();
        } 
        //代行ログイン前かつ社員選択後
        else if($("#hdnShainName").val() != ""){
        	$("#Skf2010Sc008_1").hide();
            $("#Skf2010Sc008_2").show();
            $("#logoutButton").hide();
        }
        //代行ログイン前かつ初期表示
        else{
        	$("#Skf2010Sc008_1").show();
            $("#Skf2010Sc008_2").hide();
        }
    });
  
    // 社員選択支援ポップアップ コールバック関数
    shainInfoCallback = function(param){
        if( param != null && typeof param == 'object' && param.shainNo != null){
            $("#shainNo").val(param.shainNo);
        }
    }
    
    
  })(jQuery);
</script>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
    <!-- 代行ログイン時のみ表示されるメッセージ -->
	<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
      <nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data">
        <input type="hidden" name="hdnShainName" id="hdnShainName" value="${form.shainName}"  />
        <table class="imui-form-search-condition">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        <% //社員選択画面_表示領域 %>
                        <div id="Skf2010Sc008_1" >
                        <div class="imui-form-container-wide">
                        <table class="imui-form-search-condition" >

                            <tbody>
                                <tr>
                                    <th colspan="2" style="width: 30%;" >
                                    &nbsp;&nbsp;
                                    <nobr>
                                        <nfwui:LabelBox id="applName" code="<%= MessageIdConstant.SKF2010_SC008_SHAIN_NO %>" style="float:left" />
                                            &nbsp;&nbsp;
                                            <nfwui:PopupButton id="support" name="support" value="支援"
                                            cssClass="imui-small-button" use="popup"
                                            screenUrl="skf/Skf2010Sc001/init"
                                            popupWidth="650" popupHeight="700"
                                            modalMode="false" />
                                    </nobr>
                                    </th>
                                    <td style="width:120px;">
                                        <!-- <input style="width:120px;" id="shainNo" name="shainNo" type="text" value="${f:h(form.shainNo)}">-->
                                        <imui:textbox style="width:120px;" id="shainNo" name="shainNo" value="${f:h(form.shainNo)}" />
                                    </td>
                                    <td style="border:none;">
                                        <nfwui:Button id="select" name="select" formId="form" value="選択する" cssClass="imui-small-button" url="skf/Skf2010Sc008/Select" />
                                       <!-- <nfwui:Button id="login" name="login" formId="form" value="テストログイン" cssClass="imui-small-button" url="skf/Skf2010Sc008/Login" />
                                        <nfwui:Button id="logout" name="logout" formId="form" value="テストログアウト" cssClass="imui-small-button" url="skf/Skf2010Sc008/Logout" /> -->
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        </div>
                        </div>
                        
                        <% //代行ログイン対象社員情報確認画面_表示領域※ %>
                        <div id="Skf2010Sc008_2">
                        <div class="imui-form-container-wide">
                        <table class="imui-form-search-condition">
                            <tbody>
                              <div class="imui-chapter-title">
                                  <h2>代行対象社員</h2>
                              </div>
                                  <tbody>
                                      <tr>
                                          <th style="width:130px;">
                                              <label>社員番号</label>
                                          </th>
                                          <td colspan="2">
                                              ${f:h(form.shainNo)}
                                              <!-- <input type="hidden" id="shainNo" value="${f:h(form.shainNo)}"/> -->
                                          </td>
                                      </tr>
                                      <tr>
                                          <th>
                                              <label>社員氏名</label>
                                          </th>
                                          <td colspan="2">
                                              ${f:h(form.shainName)}
                                          </td>
                                      </tr>
                                      <tr>
                                          <th>
                                              <label>機関</label>
                                          </th>
                                          <td colspan="2">
                                              ${f:h(form.agencyName)}
                                          </td>
                                      </tr>
                                      <tr>
                                          <th>
                                              <label>部等</label>
                                          </th>
                                          <td colspan="2">
                                              ${f:h(form.affiliation1Name)}
                                          </td>
                                      </tr>
                                      <tr>
                                          <th>
                                              <label>室、チーム又は課</label>
                                          </th>
                                          <td colspan="2">
                                              ${f:h(form.affiliation2Name)}
                                          </td>
                                      </tr>

                            </tbody>
                        </table>
                        <% //ログイン後画面表示領域 %>
                        <div class="align-L" id="loginButton" >
                        	<nfwui:ConfirmButton id="login" value="代行ログイン" 
							 formId="form"
							 cssClass="imui-small-button" title="<%=MessageIdConstant.SKF2010_SC008_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_2059 %>"
							 url="skf/Skf2010Sc008/Login" />
                            <nfwui:Button id="cancel" formId="form" value="キャンセル" cssClass="imui-small-button" url="skf/Skf2010Sc008/Cancel" />
                        </div>
                        <% //ログイン後画面表示領域 %>
                        <div class="align-L" id="logoutButton">   
                            <nfwui:Button id="logout" formId="form" value="代行ログアウト" cssClass="imui-small-button" url="skf/Skf2010Sc008/Logout" />
                        </div>
                        </div>
                        </div>
                        </td>
                    
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                      <table >
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>操作ガイド</h2>
                        </div>
                        <div>
                        <div style="overflow-y:scroll;height:99%">
                            <span style="font-size: 100%; heigth:90%;">
                            
■社員番号には、社員番号（8桁の半角数字）を入力してください。<br/><br/>
◆<span style="font-weight: bold;color:green;">「支援」</span>をクリックすると、社員検索画面を表示します。<br/><br/>
◆<span style="font-weight: bold;color:green;">「選択する」</span>をクリックすると、入力した社員番号の社員情報を表示します。<br/><br/>
◆<span style="font-weight: bold;color:green;">「代行ログイン」</span>をクリックすると、選択した社員番号の社員としてログインします。<br/><br/>
◆<span style="font-weight: bold;color:green;">「キャンセル」</span>をクリックすると、選択した社員情報をクリアします。<br/><br/>
◆<span style="font-weight: bold;color:green;">「代行ログアウト」</span>をクリックすると、代行ログインした社員のログアウトをします。<br/><br/>
◆<span style="font-weight: bold;color:green;">「メニューへ」</span>をクリックすると、代行ログインした状態でメインメニューに戻ります。<br/><br/>
                            </span>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
      </nfwui:Form>
    </div>

    <!-- メッセージを表示するためのJavaScript（モック時はコメント）
    <script type="text/javascript">
        $(function() {
            showWarningDialog('', 'true');
        });

(function($){ $.imDateUtil.setOffset(540); $(function () { $("#jikoHaseiYmd").imuiCalendar({
"altField":"#jikoHaseiYmd","buttonText":"カレンダー","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"USA_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); 
})(jQuery);

    
    </script>
-->    

    
<script type="text/javascript">
    <!-- カレンダー出力用スクリプト -->
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



</div>
	<!-- コンテンツエリア　ここまで -->