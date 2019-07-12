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
					<li>
						<a class="imui-toolbar-icon" title="最新情報"  tabindex="26">
							<span class="im-ui-icon-common-16-refresh" onclick="refresh()"></span>
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
			/**
			* 「CSV出力」ボタン押下時
			*/
			function confreqCsv() {
				showConfirm(W_GFK_0008, function() {
				//$.StandardPost("../common/top.html");
				
					$.StandardPost("../../skf/Skf3060_Sc001/init");
							
					var INFO="処理が正常に終了しました。"
					
					if(INFO!=""){
						imuiShowSuccessMessage(INFO);
					}

									
				});
			}
			    /**
			* 「メール送信」ボタン押下時
			*/
			function confreq() {
				showConfirm(W_GFK_0009, function() {
				//$.StandardPost("../common/top.html");
				
					$.StandardPost("../../skf/Skf3060_Sc001/init");
							
					var INFO="処理が正常に終了しました。"
					
					if(INFO!=""){
						imuiShowSuccessMessage(INFO);
					}

									
				});
			}
		</script>

<!-- 		<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!-- 			<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!-- 			</div>  -->
<!-- 		</div> -->

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px; min-width: 1350px">
				
			<table >
				<tr>
					<td>
						<div>
							<table class="imui-form-search-condition" >
								<td  style=" border: none;background-color: #fdfdff;" >
									<div class="imui-form-container-wide" style="width:780px;height:160px;">										
										<div class="imui-chapter-title">
											<h2>検索条件</h2>
										</div>
										<div>
										<table class="imui-form-search-condition">
											<tbody>
												<tr>
													<th style="width: 100px;">
														<label>基準期間</label>
													</th>
													<td colspan="2">
														<input class="ime-off" type="text" style="text-align: right;" name="cal001" id="cal001" value="2018/04/02"/>&nbsp;～&nbsp;&nbsp;<input class="ime-off" type="text" style="text-align: right;" name="cal002" id="cal002" value="2019/04/01"/>
													</td>
													<th>
														<label style="width:60px;">原籍会社名</label>
													</th>
													<td>
														<select style="width:200px;">
															<option value="0"></option>
															<option value="1">NEXCO中日本</option>
															<option value="2">NEXCO東日本</option>
															<option value="3">NEXCO西日本</option>
															<option value="4">高速道路総合研究所</option>
															<option value="5">外部機関</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>
														<label style="width:60px;">社員番号</label>
													</th>
													<td colspan="2">
														<input class="ime-off" style="width:200px;" type="text" placeholder="例　00123456（半角）"/>
													</td>
													<th>
														<label style="width:90px;">給与支給会社名</label>
													</th>
													<td>
														<select style="width:200px;">
															<option value="0"></option>
															<option value="1">NEXCO中日本</option>
															<option value="2">NEXCO東日本</option>
															<option value="3">NEXCO西日本</option>
															<option value="4">高速道路総合研究所</option>
															<option value="5">外部機関</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>
														<label>社員名</label>
													</th>
													<td colspan="2">
														<input style="width:200px;" type="text" placeholder="例　中日本　太郎"/>
													</td>
													<th>
														<label style="width:90px;">送信状態</label>
													</th>
													<td>
														<select style="width:120px;">
															<option value="0"></option>
															<option value="1"selected="selected">未送付</option>
															<option value="2">送付済</option>
														</select>
													</td>
												</tr>
											</tbody>
										</table>
										</div>
											<div class="align-L">	
												<input type="button" value="検索" class="imui-small-button" >
											</div>
									</div>							 
								</td>
							                        
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
								<td style="border: none;;background-color: #fdfdff;">
									<div class="imui-form-container-wide"  style="width: 450px;height:160px;">
									<div >
										<table >
											<div class="imui-chapter-title" style="margin-bottom:10px;">
												<h2>操作ガイド</h2>
											</div>
											<div>
													<tr>
														<td>
															基準期間
														</td>
														<td>
															：
														</td>
														<td>
															基準期間中に40歳または50歳の誕生日を迎える社員を検索します。
														</td>
													</tr>
													<tr>
														<td>
															CSV出力
														</td>
														<td>
															：
														</td>
														<td>
															年齢加算対象者一覧をCSV形式のファイルに出力します。
														</td>
													</tr>
													<tr>
														<td>
															メール送信
														</td>
														<td>
															：
														</td>
														<td>
															チェックした社員に年齢加算前/後の使用料をメールにて送信します。
														</td>
													</tr>												
											</div>
										</table>
									</div>
									</div>
								</td>
							</table>
						</div>

					</td>
					</tr>
					<tr>
						<td>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
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
										"メール<br /><INPUT type='checkbox'>",
										"原籍会社名",
										"給与支給<br />会社名",
										"社員番号",
										"氏名",
										"生年月日",
										"年齢",
										"社宅名",
										"部屋番号",
										"現使用料",
										"年齢加算<br />使用料",
										"送信状況<br />（送信日）",
										"入居日",
										"退居日",
										"用途",
										"役員区分",
										"所属",
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":1000,
									"width":"1280",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"sentaku_flg","width":"40","align":"center"}<!-- 選択 -->
										,{"name":"original_kaisha","width":"100","align":"left"}<!-- 原籍会社名 -->
										,{"name":"kyuyosikyu_kaisha","width":"100","align":"left"}<!-- 給与支給会社名 -->
										,{"name":"syain_no","width":"100","align":"left"}<!-- 社員番号 -->
										,{"name":"shain_name","width":"100","align":"left"}<!-- 氏名 -->
										,{"name":"birthday","width":"70","align":"center"}<!-- 生年月日 -->
										,{"name":"age","width":"40","align":"center"}<!-- 年齢 -->
										,{"name":"shataku_name","width":"150","align":"left"}<!-- 社宅名 -->
										,{"name":"room_no","width":"70","align":"left"}<!-- 部屋番号 -->
										,{"name":"shiyoryo_now","width":"70","align":"right"}<!-- 現使用料 -->
										,{"name":"shiyoryo_agekasan","width":"70","align":"right"}<!-- 年齢加算使用料 -->
										,{"name":"send_mail_date","width":"70","align":"center"}<!-- 送信状況（送信日） -->
										,{"name":"nyukyo_date","width":"70","align":"center"}<!-- 入居日 -->
										,{"name":"taikyo_date","width":"70","align":"center"}<!-- 退居日-->
										,{"name":"yoto","width":"50","align":"center"}<!-- 用途 -->
										,{"name":"yakuin_kbn","width":"70","align":"center"}<!-- 役員区分 -->
										,{"name":"shozoku","width":"400","align":"left"}<!-- 所属 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00016500",
										"shain_name":"中日本 2148",
										"birthday":"1969/02/17",
										"age":"50",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"103",
										"shiyoryo_now":"17,707円",
										"shiyoryo_agekasan":"20,658円",
										"send_mail_date":"",
										"nyukyo_date":"2018/07/20",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"本社技術・建設本部・技術管理部 技術管理T"
									},{
										"id":2,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00017099",
										"shain_name":"中日本 7099",
										"birthday":"1968/05/07",
										"age":"50",
										"shataku_name":"稲沢B棟",
										"room_no":"807",
										"shiyoryo_now":"34,535円",
										"shiyoryo_agekasan":"40,291円",
										"send_mail_date":"",
										"nyukyo_date":"2009/04/02",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"金沢支社 福井保全・サービスセンター（保全担当）"
									},{
										"id":3,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00017246",
										"shain_name":"中日本 7246",
										"birthday":"1968/11/10",
										"age":"50",
										"shataku_name":"稲沢B棟",
										"room_no":"506",
										"shiyoryo_now":"34,535円",
										"shiyoryo_agekasan":"40,291円",
										"send_mail_date":"",
										"nyukyo_date":"2003/11/07",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"名古屋支社 保全・サービス事業部 保全計画T"
									},{
										"id":4,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00018373",
										"shain_name":"中日本 8373",
										"birthday":"1978/12/21",
										"age":"40",
										"shataku_name":"稲沢B棟",
										"room_no":"409",
										"shiyoryo_now":"28,778円",
										"shiyoryo_agekasan":"34,535円",
										"send_mail_date":"",
										"nyukyo_date":"2011/11/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"名古屋支社 総務企画部 企画調整T"									
									},{
										"id":5,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00043986",
										"shain_name":"中日本 3986",
										"birthday":"1968/05/08",
										"age":"50",
										"shataku_name":"ﾙ･ﾎﾞｱ平喜",
										"room_no":"407",
										"shiyoryo_now":"24,429円",
										"shiyoryo_agekasan":"25,504円",
										"send_mail_date":"",
										"nyukyo_date":"2016/08/12",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"東京支社 清水工事事務所"									
									},{
										"id":6,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00045599",
										"shain_name":"中日本 5599",
										"birthday":"1979/03/20",
										"age":"40",
										"shataku_name":"稲沢A棟",
										"room_no":"407",
										"shiyoryo_now":"28,419円",
										"shiyoryo_agekasan":"30,518円",
										"send_mail_date":"",
										"nyukyo_date":"2016/04/05",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"本社 保全企画本部 保全企画T"									
									},{
										"id":7,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00045616",
										"shain_name":"中日本 5616",
										"birthday":"1978/11/22",
										"age":"40",
										"shataku_name":"ﾒｿﾞﾝ･ﾄﾞ･ｱﾘｴﾙ",
										"room_no":"202",
										"shiyoryo_now":"22,543円",
										"shiyoryo_agekasan":"27,051円",
										"send_mail_date":"",
										"nyukyo_date":"2016/08/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"東京支社 沼津工事事務所 御殿場西工事区"									
									},{
										"id":8,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"高速道路総合研究所",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00073578",
										"shain_name":"中日本 6642",
										"birthday":"1978/07/20",
										"age":"40",
										"shataku_name":"ｵｰｸﾗﾝﾄ八王子",
										"room_no":"403",
										"shiyoryo_now":"29,282円",
										"shiyoryo_agekasan":"35,138円",
										"send_mail_date":"",
										"nyukyo_date":"2014/04/03",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"東京支社 総務企画部 企画調整T"									
									},{
										"id":9,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00073578",
										"shain_name":"中日本 3578",
										"birthday":"1968/11/23",
										"age":"50",
										"shataku_name":"Raffine泉",
										"room_no":"305",
										"shiyoryo_now":"17,543円",
										"shiyoryo_agekasan":"23,386円",
										"send_mail_date":"",
										"nyukyo_date":"2016/07/03",
										"taikyo_date":"",
										"yoto":"独身",
										"yakuin_kbn":"",
										"shozoku":"東京支社 浜松保全・サービスセンター"									
									},{
										"id":10,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00074618",
										"shain_name":"中日本 4618",
										"birthday":"1978/05/26",
										"age":"40",
										"shataku_name":"稲沢A棟",
										"room_no":"410",
										"shiyoryo_now":"22,877円",
										"shiyoryo_agekasan":"22,877円",
										"send_mail_date":"",
										"nyukyo_date":"2010/04/02",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"名古屋支社　保全・サービス事業部 構造技術T"									
									}
,{
										"id":11,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00122551",
										"shain_name":"中日本 2551",
										"birthday":"1969/03/09",
										"age":"50",
										"shataku_name":"ｵｰｸﾗﾝﾄ八王子",
										"room_no":"401",
										"shiyoryo_now":"35,138円",
										"shiyoryo_agekasan":"40,995円",
										"send_mail_date":"",
										"nyukyo_date":"2015/09/02",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"八王子支社 保全・サービス事業部 道路管制センター・交通規制T"									
									}
,{
										"id":12,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00122593",
										"shain_name":"中日本 2593",
										"birthday":"1968/12/12",
										"age":"50",
										"shataku_name":"ｿﾚｲﾕﾚｳﾞｧﾝ",
										"room_no":"604",
										"shiyoryo_now":"24,543円",
										"shiyoryo_agekasan":"29,068円",
										"send_mail_date":"",
										"nyukyo_date":"2016/11/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"名古屋支社 飯田保全・サービスセンター"									
									}
,{
										"id":13,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00122870",
										"shain_name":"中日本 2870",
										"birthday":"1968/10/22",
										"age":"50",
										"shataku_name":"百合ヶ丘",
										"room_no":"102",
										"shiyoryo_now":"53,543円",
										"shiyoryo_agekasan":"56,936円",
										"send_mail_date":"",
										"nyukyo_date":"2016/08/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"東京支社 保全・サービス事業部 構造技術T"									
									}
,{
										"id":14,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00124542",
										"shain_name":"中日本 4542",
										"birthday":"1979/02/22",
										"age":"40",
										"shataku_name":"稲沢B棟",
										"room_no":"606",
										"shiyoryo_now":"28,779円",
										"shiyoryo_agekasan":"34,535円",
										"send_mail_date":"",
										"nyukyo_date":"2016/07/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"本社 保全企画本部 施設T"									
									}
,{
										"id":15,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00158927",
										"shain_name":"中日本 8927",
										"birthday":"1968/04/02",
										"age":"50",
										"shataku_name":"知立",
										"room_no":"241",
										"shiyoryo_now":"18,696円",
										"shiyoryo_agekasan":"21,812円",
										"send_mail_date":"",
										"nyukyo_date":"2014/08/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"東京支社 横浜保全・サービスセンター（保全担当）"									
									}
,{
										"id":16,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00159559",
										"shain_name":"中日本 9559",
										"birthday":"1968/11/21",
										"age":"50",
										"shataku_name":"ﾌｨｵｰﾚN",
										"room_no":"203",
										"shiyoryo_now":"22,545円",
										"shiyoryo_agekasan":"30,051円",
										"send_mail_date":"",
										"nyukyo_date":"2014/07/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"名古屋支社 豊田保全・サービスセンター"									
									}
,{
										"id":17,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00159924",
										"shain_name":"中日本 9924",
										"birthday":"1968/11/22",
										"age":"50",
										"shataku_name":"忠生",
										"room_no":"402",
										"shiyoryo_now":"30,043円",
										"shiyoryo_agekasan":"31,550円",
										"send_mail_date":"",
										"nyukyo_date":"2008/08/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"名古屋支社 羽島保全・サービスセンター（総務企画担当）"									
									}
,{
										"id":18,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00160025",
										"shain_name":"中日本 0025",
										"birthday":"1968/06/11",
										"age":"50",
										"shataku_name":"ﾄﾞﾘｰﾑｸﾞﾗﾝﾃﾞ",
										"room_no":"207",
										"shiyoryo_now":"13,653円",
										"shiyoryo_agekasan":"21,251円",
										"send_mail_date":"",
										"nyukyo_date":"2013/08/02",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"本社 技術･建設本部･環境･技術企画部 技術企画･開発T（在町田）"									
									}
,{
										"id":19,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00161556",
										"shain_name":"中日本 1556",
										"birthday":"1978/05/19",
										"age":"40",
										"shataku_name":"MK下宮地",
										"room_no":"201",
										"shiyoryo_now":"16,010円",
										"shiyoryo_agekasan":"24,016円",
										"send_mail_date":"",
										"nyukyo_date":"2015/04/01",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"金沢支社 総務企画部 企画調整T"									
									}
,{
										"id":20,
										"sentaku_flg":"<input type='checkbox'></input>",
										"original_kaisha":"NEXCO中日本",
										"kyuyosikyu_kaisha":"NEXCO中日本",
										"syain_no":"00163521",
										"shain_name":"中日本 3521",
										"birthday":"1978/06/09",
										"age":"40",
										"shataku_name":"ﾋﾞﾊﾞｺｰﾄ暁C",
										"room_no":"5-A",
										"shiyoryo_now":"11,245円",
										"shiyoryo_agekasan":"11,121円",
										"send_mail_date":"",
										"nyukyo_date":"2013/08/04",
										"taikyo_date":"",
										"yoto":"世帯",
										"yakuin_kbn":"",
										"shozoku":"東京支社 沼津工事事務所 御殿場西工事区"									
									}
								];

								grid.jqGrid(parameter);



// as
//									// 1行づつ網掛け挑戦
//									jQuery('#sampleListTable1').jqGrid({
//										loadComplete: function () {
//											var rowIDs = jQuery('#sampleListTable1').getDataIDs(); 
//											$.each(rowIDs, function (i, item) {
//												if (i % 2 == 0) {
//													$('#'+item).removeClass('ui-widget-content');
//													$('#'+item).addClass('testcss');
//												}
//											});
//										},
//									});
//									jQuery('#sampleListTable1').jqGrid({
//										gridComplete: function () {
//											$('tbody > tr:even', this).addClass('ui-row-even');
//										}
//									});
// ae

								grid.jqGrid('navGrid','#sampleListTable1-pager',{
									edit: false,
									add: false,
									del: false,
									search: false,
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
					<style type="text/css">  
						<!--
							/* ヘッダテキスト中央寄せ */
							.ui-jqgrid .ui-jqgrid-htable th div {
								display:table-cell;
							    height: 32px;
								text-align:center;
								vertical-align:middle;
							}
							/** 1行間隔で網掛け挑戦
							.testcss {
								border: 1px solid #a6c9e2;
								background-color: #e6e6fa ;
								color: #222222;
							}

							.ui-row-even {
								background-color: #e6e6fa ;
							}
							*/

							/* データ行の改行許容 */
							#sampleListTable1 tr td{
								white-space:normal;
							}
						-->
					</style>
				</form>
			</div>
		</td>
		</tr>
		</table>
			<br />
			<div class="align-R">
				<input style="width:150px;" type="button" value="CSV出力" class="imui-medium-button" onclick="confreqCsv()"/>
				<input style="width:150px;" type="button" value="メール送信" class="imui-medium-button" onclick="confreq()"/>
			</div>
		</div>
	</div>
<!-- コンテンツエリア　ここまで -->