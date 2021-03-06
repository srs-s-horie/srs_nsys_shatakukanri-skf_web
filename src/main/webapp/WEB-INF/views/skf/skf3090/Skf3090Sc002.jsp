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

<!-- 以下ツールバー -->
		<div class="imui-toolbar-wrap">
			<div class="imui-toolbar-inner">
				<!-- ツールバー左側 -->
				<ul class="imui-list-toolbar">
					<!-- 戻る -->
					<li>
						<a class="imui-toolbar-icon" title="戻る" tabindex="23" onclick="back1()" href="javascript:void(0);">
							<span class="im-ui-icon-common-16-back"></span>
						</a>
					</li>

				</ul>
				<!-- ツールバー右側 -->
				<ul class="imui-list-box-toolbar-utility">
					<li>
						<a onclick="back()" class="imui-toolbar-icon" tabindex="16">
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
			* メニュー画面へ遷移する。
			*/
			function back() {
				showConfirm(W_GFK_0007, function() {
					$.StandardPost("../common/top.html");
				});
			}
		</script>

<!-- 		<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!-- 			<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!-- 			</div>  -->
<!-- 		</div> -->

		<!-- コンテンツエリア -->

			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">


			<table class="imui-form-search-condition">
			<th style="width:10%"><label>改定日</label></th>
			<td style="width:15%">
			<input type="text" name="cal001" id="cal001" value=""/>
			</td>
			<td style="border:none;">
			</td>
			</table>
			住宅支払報酬額（1人・1日・1畳につき、円）
				<!-- 明細部 -->
				<table class="imui-form-search-condition">
				<tr>
				<th style="width:15%"><label>01 北海道</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>13 東京都</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>25 滋賀県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>37 香川県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>02 青森県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>14 神奈川県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>26 京都府</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>38 愛媛県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>03 岩手県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>15 新潟県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>27 大阪府</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>39 高知県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>04 宮城県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>16 富山県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>28 兵庫県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>40 福岡県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				
				<tr>
				<th style="width:15%"><label>05 秋田県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>17 石川県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>29 奈良県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>41 佐賀県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				
				<tr>
				<th style="width:15%"><label>06 山形県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>18 福井県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>30 和歌山県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>42 長崎県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>07 福島県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>19 山梨県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>31 鳥取県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>43 熊本県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>

				<tr>
				<th style="width:15%"><label>08 茨城県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>20 長野県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>32 島根県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>44 大分県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>09 栃木県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>21 岐阜県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>33 岡山県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>45 宮崎県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>10 群馬県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>22 静岡県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>34 広島県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>46 鹿児島県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>11 埼玉県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>23 愛知県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>35 山口県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>47 沖縄県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				</tr>
				<tr>
				<th style="width:15%"><label>12 千葉県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>24 三重県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<th style="width:15%"><label>36 徳島県</label></th>
				<td style="width:10%"><input type="text"  style="width:100px;text-align: right;" placeholder="" value=""></input></td>
				<td style="width:15%;border:none;"><label></label></td>
				<td style="width:15%;border:none;"></td>
				</tr>
				<tr>
				<th style="width:15%"><label>備考</label></th>
				<td style="" colspan="7">
				<textarea class="ime-off" style="width: 95%;" rows="2" cols="40"></textarea>
				</input></td>
				</tr>
			<!--
			<div class="align-L">	
				<input type="button" value="CSV取込" class="imui-small-button" onclick="location.href='../../skf/Skf3020_Sc003/init'"/>
				<input type="button" value="取込状況を確認" class="imui-small-button" onclick="location.href='../../skf/Skf3020_Sc003/init'"/>
			</div>
			<br /><br /><br />
			
			<div class="align-L">
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			-->
			</table>
			<br>
			
			<div class="align-L float-L">
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>

			<div class="align-R">
				<input style="width:150px;" type="button" value="登録" class="imui-medium-button" onclick=""/>
				<input style="width:150px;" type="button" value="複写" class="imui-medium-button" onclick="" disabled/>
				<input style="width:150px;" type="button" value="削除" class="imui-medium-button" onclick="" disabled />
			</div>


	</div>
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