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

		<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv">
			<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;">
			</div> 
		</div>

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<!--<div class="imui-form-container-wide"  style="width:1280px;">-->
				<form id="form" class="target_form mt-10" action="" method="POST">
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th style="width: 5%;">
									<label style="height:24px;">社宅名</label>
								</th>
								<td style="width: 15%;">
									ｴﾊﾞｰｸﾞﾘｰﾝ
								</td>
								<th style="width: 5%;">
									<label>地域区分</label>
								</th>
								<td style="width: 5%;">
									甲
								</td>
								<th style="width: 5%;">
									<label>社宅区分</label>
								</th>
								<td style="width: 5%;">
									一棟借上
								</td>
								<td style="width: 40%;border:none;	">
								</td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</table>
				</form>
				<!--
			</div>-->
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
			
				<!-- 明細部 -->
				<form id="sampleList1">
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
//									"pager":"#sampleListTable1-pager",
									"colNames":[
										"",
										"区画番号",				
										"契約形態",				
										"契約番号",							
										"賃貸人（代理人）",						
										"所在地",				
										"駐車場名",						
										"経理連携用管理番号",			
										"契約開始日",				
										"契約終了日",				
										"地代",				
										"備考",				
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
//									"rowNum":3,
									"width":"1280",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"A11","width":"060","align":"left"}<!-- 区画番号 -->
										,{"name":"A01","width":"100","align":"left"}<!-- 契約形態 -->
										,{"name":"A02","width":"060","align":"center"}<!-- 契約番号 -->
										,{"name":"A03","width":"150","align":"left"}<!-- 所有者 -->
										,{"name":"A04","width":"300","align":"left"}<!-- 所在地 -->
										,{"name":"A05","width":"120","align":"left"}<!-- 駐車場名 -->
										,{"name":"A06","width":"120","align":"center"}<!-- 経理連携用管理番号 -->
										,{"name":"A07","width":"070","align":"center"}<!-- 契約開始日 -->
										,{"name":"A08","width":"070","align":"center"}<!-- 契約終了日 -->
										,{"name":"A09","width":"070","align":"right"}<!-- 地代 -->
										,{"name":"A10","width":"080","align":"left"}<!-- 備考 -->
									],
									"rownumbers":false,
									"height":"200"
								};
								parameter.data = [
									{
										"A11":"01",
										"A01":"社宅と一括契約",
										"A02":"",
										"A03":"",
										"A04":"",
										"A05":"",
										"A06":"",
										"A07":"",
										"A08":"",
										"A09":"",
										"A10":"",
										
										
									},
																		{
										"A11":"02",
										"A01":"社宅と一括契約",
										"A02":"",
										"A03":"",
										"A04":"",
										"A05":"",
										"A06":"",
										"A07":"",
										"A08":"",
										"A09":"",
										"A10":"",
										
										
									},									{
										"A11":"03",
										"A01":"社宅と一括契約",
										"A02":"",
										"A03":"",
										"A04":"",
										"A05":"",
										"A06":"",
										"A07":"",
										"A08":"",
										"A09":"",
										"A10":"",
										
										
									},									{
										"A11":"04",
										"A01":"社宅と一括契約",
										"A02":"",
										"A03":"",
										"A04":"",
										"A05":"",
										"A06":"",
										"A07":"",
										"A08":"",
										"A09":"",
										"A10":"",
										
										
									},									{
										"A11":"05",
										"A01":"社宅と一括契約",
										"A02":"",
										"A03":"",
										"A04":"",
										"A05":"",
										"A06":"",
										"A07":"",
										"A08":"",
										"A09":"",
										"A10":"",
										
										
									},									{
										"A11":"06",
										"A01":"社宅と別契約",
										"A02":"1",
										"A03":"中日本　太郎",
										"A04":"東京都〇〇市△△△1-2-3",
										"A05":"〇〇〇〇〇",
										"A06":"A009160717202",
										"A07":"2017/04/01",
										"A08":"9999/12/31",
										"A09":"10,000",
										"A10":"",
										
									},									{
										"A11":"07",
										"A01":"社宅と別契約",
										"A02":"1",
										"A03":"中日本　太郎",
										"A04":"東京都〇〇市△△△1-2-3",
										"A05":"〇〇〇〇〇",
										"A06":"A009160717203",
										"A07":"2017/09/01",
										"A08":"9999/12/31",
										"A09":"10,000",
										"A10":"",
										
									},									{
										"A11":"08",
										"A01":"社宅と別契約",
										"A02":"1",
										"A03":"中日本　太郎",
										"A04":"東京都〇〇市△△△1-2-3",
										"A05":"〇〇〇〇〇",
										"A06":"A009160717204",
										"A07":"2018/10/01",
										"A08":"9999/12/31",
										"A09":"10,000",
										"A10":"",
										
									},
								];

								grid.jqGrid(parameter);

								// ヘッダ結合
								grid.jqGrid('setGroupHeaders', {
									useColSpanStyle: true,
									groupHeaders:[
										{startColumnName: 'kihon', numberOfColumns: 2,  titleText: 'メンテナンス'},
									]
								});

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
		<!--
			</div>
			-->
			
<br/>
		<table class="imui-form-search-condition">
                            <tbody>
             <tr>
               <th style="width:12%" colspan="2"><label>区画番号</label></th>
               <td>
               06
               </td>
               
               <th style="width:12%"><label>契約形態</label></th>
               <form>
               <td style="width:20%">
               <select id="IDOS" onchange="check(this)">
                    <option value=""></option>
                    <option value="社宅と一括契約">社宅と一括契約</option>
                    <option value="社宅と別契約" selected="selected">社宅と別契約</option>
               </select>
               <td style="width:20%;border:none;" ></td>

</tr>
                    <!-- スペース-->
                    <tr style="border:none">
                       <td style="border:none">
                       </td>
                    </tr>

<tr>
               <th colspan="2"><label>契約番号</label></th>
               <td width="20%">
					<select style="width: 105px;" id="Change10"  tabindex="12" name="Change10">
                            <option value=""></option>
                            <option value="1" selected="selected">1</option>
                            <option value="2">2</option>
                            <option value="3"></option>
                            <option value="4"></option>
                            <option value="5"></option>
					</select>

                        <input name="doSendBack" id="" type="button" value="追加" class="imui-small-button"/>
                        <input name="doSendBack" id="" type="button" value="削除" class="imui-small-button" />

               <th><label>賃貸人（代理人）<label></th>
               <td>
               <input class="ime-off" style="width: 150px;" type="text" value="中日本　太郎" name="Change1"></input>
               <input name="doSendBack" id="" type="button" value="支援" class="imui-small-button"/>
               </td>



             </tr>


             <tr>
               <th rowspan="2">
               <label>所在地 <!--郵便番号--></label>
               </th>
               <th>
               <label>郵便番号</label>
               </th>
               <td colspan="3">
               <input class="ime-off" style="width: 100px;" type="text" value="1231234"  name="Change2"></input>
               <input name="doSendBack" id="" type="button" value="住所検索" class="imui-small-button" />
               </tr>
<!--
               </td>

               <th><label>所在地 住所</label></th>
               <td>
    -->
               <tr>
               <th>
               <label>住所</label>

               <td colspan="3">
               <input class="ime-off" style="width: 50%;" type="text" value="東京都〇〇市△△△1-2-3"  name="Change3"></input>
               </td>
               </tr>
  
               <th style="width:12%" colspan="2"><label>駐車場名</label></th>
               <td colspan="3">
               <input class="ime-off" style="width: 200px;" type="text" value="〇〇〇〇"  name="Change4"></input>
               </td>
               

             </tr>

             <tr>
               <th  colspan="2">
               <label>経理連携用管理番号<label>
               </th>
               <td  colspan="3">
               <input class="ime-off" style="width: 150px; text-align: left;" type="text" value="A009160717202"  name="Change5"></input><!--A009160717202-->
               </td>
               
</tr>
<tr>
               <th colspan="2"><label>貸与区分<label></th>
               <td colspan="3">
               <select style="width: 105px;" id="Change6"  tabindex="12" name="Change6">
                            <option value=""></option>
                            <option value="貸与可" selected="selected">貸与可</option>
                            <option value="貸与不可">貸与不可</option>
               </select>
               </td>
               
</tr>
<tr>
               <th style="width:12%" colspan="2">
               <label>契約開始日<label>
               </th>
               <td>
                 <input type="text" name="Change7" id="Change7" value="2018/03/01"/>
               </td>
               <th style="width: 150px;">
               <label>契約終了日<label>
               </th>
                    <td>
                        <input type="text" name="Change8" id="Change8" value="9999/12/31"/>
                    </td>


             </tr>

             <tr>
               <th  colspan="2">
               <label>駐車場料（地代）<label>
               </th>
                    <td colspan="3">
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="10,000"  name="Change9"></input>&nbsp;円
                    </td>
               </tr>           
               <tr>

               <th colspan="2">
               <label>備考<label>
               </th>
                    <td colspan="3">
                        <input class="ime-off" style="width: 500px; text-align: left;" type="text" value="" name="Change11"></input>
                    </td>             
                    
               </tr>

</table>
			
			
			<br />

			<div class="align-R">

				<input style="width:150px;" type="button" value="登録" class="imui-medium-button"> <!--onclick="location.href='../../skf/Skf3010_Sc002/init'"-->
				<input style="width:150px;" type="button" value="キャンセル" class="imui-medium-button"> <!--onclick="location.href='../../skf/Skf3010_Sc002/init'"-->
			</div>

		</div>
		<br>
					<div class="align-L float-L">	
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			<br>
		</div>
		
	</div>
	
					<script type="text/javascript">
				function check(sel) {
				var v = sel.value, frm = sel.form;
				flg = (v=='社宅と別契約' || v=='')?false:true;
				frm.elements['Change1'].disabled = flg;
				frm.elements['Change2'].disabled = flg;
				frm.elements['Change3'].disabled = flg;
				frm.elements['Change4'].disabled = flg;
				frm.elements['Change5'].disabled = flg;
				frm.elements['Change6'].disabled = flg;
				frm.elements['Change7'].disabled = flg;
				frm.elements['Change8'].disabled = flg;
				frm.elements['Change9'].disabled = flg;
				frm.elements['Change10'].disabled = flg;
				frm.elements['Change11'].disabled = flg;
				frm.elements['Change12'].disabled = flg;
				frm.elements['cal004'].disabled = flg;
				frm.elements['cal005'].disabled = flg;
				}
				</script>
	
    <!-- カレンダー出力用スクリプト -->
    <script type="text/javascript">
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal001").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal002").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal003").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#Change7").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#Change8").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal006").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal007").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal008").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);      
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal009").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
    </script>
	<!-- コンテンツエリア　ここまで -->