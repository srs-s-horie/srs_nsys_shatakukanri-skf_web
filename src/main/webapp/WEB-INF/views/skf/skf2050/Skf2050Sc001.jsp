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
                onclick="back1()" href="javascript:void(0);"><span class="im-ui-icon-common-16-back"></span></a>
            </li>

        </ul>
        <!-- ツールバー右側 -->
        <ul class="imui-list-box-toolbar-utility">
            <li>
                <a onclick="TOP()" class="imui-toolbar-icon" tabindex="16">
                <span class="im-ui-icon-common-16-home"></span>
                    社宅TOP
                </a>
            </li>

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
     * 「同意する」ボタン押下時
     */
    function confreq_ok() {
        showConfirm(W_GFK_0006.replace('{0}', '提示内容に同意'), function() {
         $.StandardPost("../../skf/Skf2010_Sc003/init");
        });
    }
    
    /**
     * 「同意しない」ボタン押下時
     */
    function confreq_ng() {
        showConfirm(W_GFK_0007.replace('{0}', '提示内容に同意'), function() {
         $.StandardPost("../../skf/Skf2010_Sc003/init");
        });
    }
    /**
     * TOP画面へ遷移する。
     */
    function TOP() {
        showConfirm(W_GFK_0008, function() {
            $.StandardPost("../common/top.html");
        });
    }
</script>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">

    <!-- コンテンツエリア -->
                          <table class="imui-form-search-condition">
                       <tr style="background-color: #fdfdff;">
                            <th style="width: 10%;"><label>申請状況</label></th>
                            <td style="width: 10%;"><label>確認依頼</label></td>
                            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      </tr>
                    </table>

        <table class="imui-form-search-condition">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        
                        <div class="imui-form-container-wide" >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>備品返却内容</h2>
                        </div>
                        <table class="imui-form-search-condition">
                            <tbody>
                                <tr>
                                    <th rowspan="4"  style="width: 10%;"><label>所属</label></th>
                                    <th colspan="2" style="width: 18%;"><label>機関</label></th>
                                    <td colspan="2">
                                        名古屋
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>部等</label></th>
                                    <td colspan="2">
                                        保全・サービス事業部
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>室、チーム又は課</label></th>
                                    <td colspan="2">
                                        道路管理センター
                                    </td>
                                </tr>

                                <tr>
                                    <th colspan="2"><label>勤務先のTEL</label></th>
                                    <td colspan="2">
                                        00-0000
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><label>申請者</label></th>
                                    <th colspan="2"><label>社員番号</label></th>
                                    <td colspan="2">
                                        01234567
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>氏名</label></th>
                                    <td colspan="2">
                                        中日本ユーザ
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>等級</label></th>
                                    <td colspan="2">
                                        リーダー職１級
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>性別</label></th>
                                    <td colspan="2">
                                        男
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><label>入居社宅</label></th>
                                      <th colspan="2"><label>社宅名</label></th>
                                    <td colspan="2">彦根寮
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>室番号</label></th>
                                    <td colspan="2">
                                        225
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>規格(間取り)</label></th>
                                    <td colspan="2">
                                        1K
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="2"><label>面積</label></th>
                                    <td colspan="2">
                                        32.38㎡
                                    </td>
                                </tr>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>
                                <tr>
                                    <th rowspan="15"><label>備品</label></th>
                                    <th rowspan="2" colspan="2"><label>備品</label></th>
                                                <tr>
                                                    <th><label>備付状況</label></th>
                                                    <th><label>対象</label></th>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>洗濯機</label></th>
                                                   <td>共有</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>冷蔵庫</label></th>
                                                   <td>なし</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>オーブンレンジ</label></th>
                                                   <td>レンタル</td>
                                                   <td colspan="2">
                                                       レンタル搬出
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>掃除機</label></th>
                                                   <td>なし</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>電子炊飯ジャー</label></th>
                                                   <td>レンタル</td>
                                                   <td colspan="2">
                                                       レンタル搬出
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>テレビ</label></th>
                                                   <td>レンタル</td>
                                                   <td colspan="2">
                                                       レンタル搬出
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>テレビ台</label></th>
                                                   <td>レンタル</td>
                                                   <td colspan="2">
                                                       レンタル搬出
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>座卓（こたつ）</label></th>
                                                   <td>レンタル</td>
                                                   <td colspan="2">
                                                       レンタル搬出
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>キッチンキャビネット</label></th>
                                                   <td>レンタル</td>
                                                   <td colspan="2">
                                                       レンタル搬出
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>ルームエアコン</label></th>
                                                   <td>なし</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>カーテン</label></th>
                                                   <td>なし</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>照明器具</label></th>
                                                   <td>なし</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <th colspan="2"><label>ガステーブル</label></th>
                                                   <td>なし</td>
                                                   <td colspan="2">
                                                       -
                                                   </td>
                                                </tr>
                                </tr>

                                <tr>
                                    <th colspan="3"><label>連絡先</label></th>
                                    <td colspan="2">
                                        000-0000-0000
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>備品返却立会日</label></th>
                                    <td colspan="2">
                                        <input type="text" name="cal001" id="cal001" value="2016/02/27"/>
                                        
                                        <select>
                                            <option>時間指定なし</option>
                                            <option>08:00～12:00</option>
                                            <option selected="selected">12:00～15:00</option>
                                        </select>
                                    </td>
                                </tr>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>
                                <tr>
                                    <th colspan="3"><label>承認者へのコメント</label></th>
                                    <td colspan="3" >
                                        <textarea rows="4" style="width: 98%" placeholder="例  承認者へのコメント"></textarea>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                        </div>
                    </td>
                    
                    <td style="width: 30%; border: none; background-color: #fdfdff;">
                      <table >
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>操作ガイド</h2>
                        </div>
                        <div>
                        <div style="overflow-y:scroll;height:380px">
                            <span style="font-size: 100%; heigth:90%;">
                            ■搬出する備品の確認を行います。
                            <br><br>
                            入力ガイド
                            <br>
                            ①備品返却立会日を入力、備品返却立会時間帯を選択してください。
                            <br>
                            ※地域により希望時間指定できない場合があります。
                            <br><br>
                            各種ボタンの操作ガイド
                            <br>
                            ◆提示内容をご確認いただき、問題なければ「<font color ="green">同意する</font>」をクリックしてください。
                            <br>
                            ◆異存がある場合は「<font color ="green">同意しない</font>」をクリックしてください。
                            <br><br>
                            ■備品の搬出完了を報告します。
                            <br>
                            入力ガイド
                            <br>
                            ①備品搬出完了日を入力してください。
                            <br>
                            ※備品の搬出がない場合には退居日を入力してください。
                            <br><br>
                            各種ボタンの操作ガイド
                            <br>
                            ◆「<font color ="green">搬出完了</font>」をクリックすると、現在の入力内容で搬出完了を報告します。
                            <br>
                            </span>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<div class="align-L float-L">
      <input class="imui-medium-button check" type="button" a onclick="back1()" value="前の画面へ" style="width:150px;">
</div> 

<div class="align-R">
      <input class="imui-medium-button check" type="button" a onclick="confreq_ok()" value="同意する" style="width:150px;">
      <input class="imui-medium-button check" type="button" a onclick="confreq_ng()" value="同意しない" style="width:150px;">
</div> 

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
	<!-- コンテンツエリア　ここまで -->