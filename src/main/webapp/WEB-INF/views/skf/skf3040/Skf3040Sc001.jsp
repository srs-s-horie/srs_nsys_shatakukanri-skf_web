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
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th>
							<label style="width:115px;">希望日</label>
						</th>
						<td style="width:98%;">
							<input class="ime-off" id="hoge001" style="width:160px;text-align: right;" type="text" value="2017/08/01" />
							<script type="text/javascript">
								(function($){
									$.imDateUtil.setOffset(540);
									$(function () {
										$("#hoge001").imuiCalendar({
											"altField":"#hoge001",
											"nextText":"来月",
											"format":"yyyy\/MM\/dd",
											"dayNames":[
												"日曜日",
												"月曜日",
												"火曜日",
												"水曜日",
												"木曜日",
												"金曜日",
												"土曜日"
											],
											"dayNamesShort":["日","月","火","水","木","金","土"],
											"prevText":"先月",
											"url":"calendar\/tag\/caljson",
											"currentText":"現在",
											"calendarId":"JPN_CAL",
											"firstDay":0,
											"closeText":"閉じる",
											"dayNamesMin":["日","月","火","水","木","金","土"],
											"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],
											"monthNames":[
												"1月",
												"2月",
												"3月",
												"4月",
												"5月",
												"6月",
												"7月",
												"8月",
												"9月",
												"10月",
												"11月",
												"12月"
											]
										});
									});
								})(jQuery);
							</script>
							　～　
							<input class="ime-off" id="hoge002" style="width:160px;text-align: right;" type="text" value="2017/08/31" />
							<script type="text/javascript">
								(function($){
									$.imDateUtil.setOffset(540);
									$(function () {
										$("#hoge002").imuiCalendar({
											"altField":"#hoge002",
											"nextText":"来月",
											"format":"yyyy\/MM\/dd",
											"dayNames":[
												"日曜日",
												"月曜日",
												"火曜日",
												"水曜日",
												"木曜日",
												"金曜日",
												"土曜日"
											],
											"dayNamesShort":["日","月","火","水","木","金","土"],
											"prevText":"先月",
											"url":"calendar\/tag\/caljson",
											"currentText":"現在",
											"calendarId":"JPN_CAL",
											"firstDay":0,
											"closeText":"閉じる",
											"dayNamesMin":["日","月","火","水","木","金","土"],
											"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],
											"monthNames":[
												"1月",
												"2月",
												"3月",
												"4月",
												"5月",
												"6月",
												"7月",
												"8月",
												"9月",
												"10月",
												"11月",
												"12月"
											]
										});
									});
								})(jQuery);
							</script>
						</td>
					</tr>
					<tr>
						<th>
							<label>再発行</label>
						</th>
						<td>
							<input name="nm_radio1" id="id_radio1_1" type="radio" checked>
								<label for="id_radio1_1">発行済みを含まない</label>
							</input>&nbsp;&nbsp;
							<input name="nm_radio1" id="id_radio1_2" type="radio">
								<label for="id_radio1_2">発行済みを含む</label>
							</input>
						</td>
					</tr>
				</tbody>
			</table>
			<br />
			<div class="align-R">
				<input type="button" value="レンタル備品指示書出力" class="imui-medium-button" />
			</div>
		</div>
	</div>
<!-- コンテンツエリア　ここまで -->