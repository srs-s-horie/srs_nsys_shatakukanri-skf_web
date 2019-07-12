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
            <li>
                <a onclick="confreq()" class="imui-toolbar-icon" tabindex="16">
                <span class="im-smart-icon-common-16-information"></span>
                    申請要件を確認
                </a>
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
     * メニュー画面へ遷移する。
     */
    function back() {
        showConfirm(W_GFK_0002, function() {
            $.StandardPost("../common/top.html");
        });
    }

    /**
     * 「申請内容を確認」ボタン押下時
     */
    function confreq() {
        showConfirm(W_GFK_0001.replace('{0}', '申請内容を確認'), function() {
         var taikyoSyataku = false;
         var taikyoCar = false;

         $('input:checkbox[name="taikyo_type"]:checked').each(function() {
             if ($(this).val() == 'syataku') {
                 taikyoSyataku = true;
             } else {
                 taikyoCar = true;
             }
            
         });
         if (taikyoSyataku === false && taikyoCar == true) {
             $.StandardPost("../../skf/Skf2040_Sc002/init");
         } else if (taikyoSyataku === true && taikyoCar === false) {
             $.StandardPost("../../skf/Skf2040_Sc002/init");
         } else if (taikyoSyataku === true && taikyoCar === true) {
             $.StandardPost("../../skf/Skf2040_Sc002/init");
         } else {
             showWarning(E_GFK_0001);
         }
        });
    }
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
        showConfirm(W_GFK_0002, function() {
            history.back()
        });
    }
    /**
     * TOP画面へ遷移する。
     */
    function TOP() {
        showConfirm(W_GFK_0007, function() {
            $.StandardPost("../common/top.html");
        });
    }
</script>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
        <table class="imui-form-search-condition">
        
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        
                        <div class="imui-form-container-wide" >
                        <table class="imui-form-search-condition">
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>申請内容</h2>
                        </div>

                            <tbody>
                                <tr>
                                    <th colspan="3" style="width: 30%;"><label>機関</label></th>
                                    <td colspan="2">
                                        八王子
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>部等</label></th>
                                    <td colspan="2">
                                        保全・サービス事業部
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>室、チーム又は課</label></th>
                                    <td colspan="2">
                                        道路管理センター
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>保有住宅名</label></th>
                                    <td colspan="2">
                                        <select>
                                            <option>すずかけ台3</option>
                                            <option>つくし野1</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>現住所</label></th>
                                    <td colspan="2">
                                            東京都〇〇市△△△町
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>氏名</label></th>
                                    <td colspan="2">
                                            中日本 0010
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>性別</label></th>
                                    <td colspan="2">
                                            男
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2"><label>駐車場</label></th>
                                    <th width="70"><label>1台目</label></th>
                                    <th><label>保管場所</label></th>
                                    <td colspan="2">
                                        01234567
                                    </td>
                                </tr>
                                <tr>
                                    <th width="70"><label>2台目</label></th>
                                    <th><label>保管場所</label></th>
                                    <td colspan="2">
                                        01234567
                                    </td>
                                </tr>

                                <tr>
                                    <th colspan="3"><label>退居(返還)日</label></th>
                                    <td colspan="2">
                                        <input type="text" name="cal001" id="cal001" value="9999/99/99"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th colspan="3"><label>退居(返還)する社宅又は、<br>自動車の保管場所</label></th>
                                    <td colspan="2">
                                        <input type="checkbox" name="taikyo_type" value="syataku">社宅を退居する
                                        <input type="checkbox" name="taikyo_type" value="car1">駐車場1を返還する
                                        <input type="checkbox" name="taikyo_type" value="car2">駐車場2を返還する
                                    </td>
                                </tr>

                                <tr>
                                    <th colspan="3"><label>退居(返還)理由</label></th>
                                    <td colspan="2">
                                        <select style="width:90%">
                                            <option>転勤</option>
                                            <option>同居</option>
                                        </select>
                                        <br>
                                        <textarea rows="4" style="width: 90%" placeholder="例  自宅購入のため"></textarea>
                                        
                                    </td>
                                </tr>                                

                                <tr>
                                    <th colspan="3"><label>社宅の状態</label></th>
                                    <td colspan="2">
                                        <textarea rows="4" style="width: 90%" placeholder="例  壁に破損あり"></textarea>
                                        
                                    </td>
                                </tr>    

                                <tr>
                                    <th colspan="3"><label>退居後の連絡先</label></th>
                                    <td colspan="2">
                                        <textarea rows="4" style="width: 90%" placeholder="例  090-0000-0000"></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <th colspan="3"><label>返却備品</label></th>
                                    <td colspan="2">
                                        <table>
                                        <tr>
                                        <td>・洗濯機</td>
                                        <td>・冷蔵庫</td>
                                        </tr>
                                        <tr>
                                        <td>・オーブンレンジ&nbsp;&nbsp;&nbsp;</td>
                                        <td>・掃除機</td>
                                        </tr>
                                        <tr>
                                        <td>・電子炊飯ジャー</td>
                                        <td>・テレビ</td>
                                        </tr>
                                        <tr>
                                        <td>・テレビ台</td>
                                        <td>・座卓(こたつ)</td>
                                        </tr>
                                        <tr></tr>
                                        
                                        </table>
                                    </td>
                                </tr>                                    

                               <tr>
                                    <th colspan="3"><label>返却立合希望日</label></th>
                                    <td colspan="2">
                                        <input type="text" name="cal002" id="cal002" value="9999/99/99"/>
                                        <select>
                                            <option>12:00～15:00</option>
                                            <option>15:00～18:00</option>
                                        </select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>連絡先</label></th>
                                    <td colspan="2">
                                        <input type="text" maxlenght="13" value="000-0000-0000"></input>
                                        <span style="color:red;">※搬出業者から連絡がありますので、連絡先は必ず入力してください。</span>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
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
                            
                            ■社宅等の退居及び駐車場の返還の場合に使用する申請書類です。<br>
                            ①申請対象の「保有住宅名」を選択してください。<br>
                            ②「退居（返還）日」を入力してください。<br>
                            ③「退居（返還）する社宅又は、自動車の保管場所」を選択してください。<br>
                            ④「退居（返還）理由」を選択してください。<br>
                            ⑤「社宅の状態」がありましたら、入力してください。<br>
                            ⑥「退居後の連絡先」を入力してください。<br>
                            ⑦退居に伴う備品の返却確認を行って、備品の返却がある場合には返却立会希望日時、連絡先を入力してください。<br>
                            ※地域により希望時間指定ができない場合があります。<br>

                            ボタン操作ガイド<br>
                            ◆<span style="font-weight: bold;color:green;">「入力内容をクリア」</span>をクリックすると、現在の入力内容をクリアすることができます。<br/><br/>
                            ◆<span style="font-weight: bold;color:green;">「資料を添付」</span>をクリックすると、申請時に必要な付帯資料を添付することができます。<br/><br/>
                            ◆<span style="font-weight: bold;color:green;">「一時保存」</span>をクリックすると、現在の入力内容を保存することができます。<br/><br/>
                            ◆<span style="font-weight: bold;color:green;">「申請内容を確認」</span>をクリックすると、現在の入力内容で申請書類を作成します。この段階では申請は行われません。<br/>
                            次の申請書類確認画面で「申請」を行うことで初めて申請されます。
                            </span>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<div class="imui-box-layout">
    <table style="width:100%;">
    <tbody>

<td align="left">
      <input class="imui-medium-button check" type="button" value="入力内容をクリア" style="width:150px;">
</td> 
<td align="right">
      <input class="imui-medium-button check" type="button" value="申請要件を確認" style="width:150px;">
      <input class="imui-medium-button check" type="button" value="一時保存" style="width:150px;">
</td>
    </tbody>

        <tbody>
    
<td align="left">
      <input class="imui-medium-button check" type="button" value="前の画面へ" style="width:150px;" onclick="back1()">
</td>
<br>
<td align="right">
     <!-- <input class="imui-medium-button check" type="button" value="資料を添付" style="width:150px;" onclick="openAddFileSelectWindow()"> -->
      <input class="imui-medium-button check" type="button" value="申請内容を確認" style="width:150px;"  onclick="confreq()">
</td>

    </tbody>

    </table>


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

<script type="text/javascript">
function openAddFileSelectWindow(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=630px,title=no';
  var window1 = window.open("../pop/pop_AddFileSelect.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}

</script>


</div>
	<!-- コンテンツエリア　ここまで -->