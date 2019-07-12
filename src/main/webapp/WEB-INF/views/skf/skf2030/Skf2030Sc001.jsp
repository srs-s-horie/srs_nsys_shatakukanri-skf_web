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
     * 前画面に戻る。
     */
    function back() {
        showConfirm(W_GFK_0002, function() {
            $.StandardPost("../../skf/Skf2010_Sc005/init");
        });
    }

    /**
     * 「差戻し」ボタン押下時
     */
    function sashimodoshi() {
        showConfirm(W_GFK_0007.replace('{0}', '申請内容の差戻'), function() {
        
            $.StandardPost("../../skf/Skf2010_Sc005/init");
      var INFO="差戻しが正常に終了しました。"
      
      if(INFO!=""){
      imuiShowSuccessMessage(INFO);
}
        });
    }

    /**
     * 「搬入完了」ボタン押下時
     */
    function kanryou() {
        showConfirm(W_GFK_0007.replace('{0}', '搬入完了'), function() {
                 
      $.StandardPost("../../skf/Skf2010_Sc003/init");
      var INFO="登録が正常に終了しました。"
      
      if(INFO!=""){
      imuiShowSuccessMessage(INFO);
}
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
                       <tr>
                            <th style="width: 10%;"><label>申請状況</label></th>
                            <td style="width: 10%;"><label>搬入待ち</label></td>
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
                            <h2>備品希望内容</h2>
                        </div>
                        <table class="imui-form-search-condition">
                            <tbody>
                                <tr>
                                    <th rowspan="4"  style="width: 10%;"><label>所属</label></th>
                                    <th colspan="3" style="width: 15%;"><label>機関</label></th>
                                    <td colspan="3">
                                        八王子
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>部等</label></th>
                                    <td colspan="3">
                                        保全・サービス事業部
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>室、チーム又は課</label></th>
                                    <td colspan="3">
                                        道路管理センター
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>勤務先のTEL</label></th>
                                    <td colspan="3">
                                        00-0000
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="4"><label>申請者</label></th>
                                    <th colspan="3"><label>社員番号</label></th>
                                    <td colspan="3">
                                        01234567
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>氏名</label></th>
                                    <td colspan="3">
                                        中日本ユーザ
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>等級</label></th>
                                    <td colspan="3">
                                        リーダー職１級
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>性別</label></th>
                                    <td colspan="3">
                                        男
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><label>入居社宅</label></th>
                                      <th colspan="3"><label>社宅名</label></th>
                                    <td colspan="3">
                                        彦根寮
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>室番号</label></th>
                                    <td colspan="3">
                                        225
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>規格(間取り)</label></th>
                                    <td colspan="3">
                                        1K
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>面積</label></th>
                                    <td colspan="3">
                                        32.38㎡
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="2"><label>代理人</label></th>
                                    <th colspan="3"><label>代理受取人</label></th>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>代理連絡先</label></th>
                                    <td colspan="3">
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="2"><label>備品搬入</label></th>
                                    <th colspan="3"><label>備品搬入希望日</label></th>
                                    <td colspan="3">
                                        2016/02/26 08:00～12:00                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>連絡先</label></th>
                                    <td colspan="3">
                                        000-0000-0000
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4"><label>搬入完了日</label></th>
                                    <td colspan="3">
                                       <input type="text" name="cal001" id="cal001" value="9999/99/99"/>
                                       <span style="color:red;">※備品の搬入が完了した日を入力してください</span>
                                    </td>
                                </tr>


<tr style="border:none">
   <td style="border:none">
   </td>
</tr>

                                <tr>
                                    <th rowspan="2" colspan="4"><label>備品</label></th>
                                                <tr>
                                                    <th><label>備付状況</label></th>
                                                    <th><label>申請</label></th>
                                                    <th><label>調整結果</label></th>
                                                </tr>

                                                <tr>
                                                   <th colspan="4"><label>洗濯機</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>冷蔵庫</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>オーブンレンジ</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>掃除機</label></th>
                                                   <td>なし</td>
                                                   <td>申請なし</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>電子炊飯ジャー</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>テレビ</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>テレビ台</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>座卓（こたつ）</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                                <tr>
                                                   <th colspan="4"><label>キッチンキャビネット</label></th>
                                                   <td>なし</td>
                                                   <td>申請あり</td>
                                                   <td>レンタル搬入</td>
                                                </tr>
                                </tr>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>
                                <tr>
                                    <th colspan="4"><label>承認者へのコメント</label></th>
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
                        <div style="overflow-y:scroll;height:99%">
                            <span style="font-size: 100%; heigth:90%;">
                           ■貸与を希望する備品を申請します。
                            <br>
                            入力ガイド
                            <br>
                            ①勤務先の電話番号を入力してください。
                            <br>
                            ②備品搬入希望日を入力、備品搬入希望時間帯を選択してください。
                            <br>
                            ※地域により希望時間指定できない場合があります。
                            <br>
                            ③連絡先の電話番号を入力してください。
                            <br>
                            ④必要とする備品の場合「申請する」、不要な備品の場合「申請しない」をチェックしてください。
                            <br><br>
                            各種ボタンの操作ガイド

                            <br>
                            ◆「<font color ="green">入力内容をクリア</font>」をクリックすると、現在の入力内容をクリアすることができます。
                            <br>
                            ◆「<font color ="green">一時保存</font>」をクリックすると、現在の入力内容を保存することができます。
                            <br>
                            ◆「<font color ="green">申請</font>」をクリックすると、現在の入力内容で申請行います。
                            <br><br>
                            ◆備品の搬入完了を報告します。
                            <br>
                            入力ガイド
                            <br>
                            ①備品搬入完了日を入力してください。
                            <br>
                            備品の搬入がない場合には入居日を入力してください。

                            各種ボタンの操作ガイド
                            <br>
                            ◆「<font color ="green">搬入完了</font>」をクリックすると、現在の入力内容で搬入完了を報告します。


                            </span>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>


<div class="align-L float-L">
      <input class="imui-medium-button check" type="button" value="前の画面へ" style="width:150px;" onclick="back1()">
</div> 

<div class="align-R">
      <input class="imui-medium-button check" type="button" value="搬入完了" style="width:150px;"  onclick="kanryou()">
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