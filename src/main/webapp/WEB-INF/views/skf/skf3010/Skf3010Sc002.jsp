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
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th style="width: 5%;">
							<label style="width:120px;">社宅名</label>
						</th>
						<td style="width: 10%;">
							<input style="width:200px;" type="text" value=""  placeholder="例　社宅名">
						</td>
						<th style="width: 5%;">
							<label style="width:100px;">地域区分</label>
						</th>
						<td style="width: 5%;">
							<select style="width:100px;">
								<option value="0"></option>
								<option value="1">特</option>
								<option value="2">甲</option>
								<option value="3">乙</option>
								<option value="4">他</option>
							</select>
						</td>
						<th style="width: 5%;">
							<label style="width:100px;">社宅区分</label>
						</th>
						<td style="width: 5%;">
							<select style="width:100px;">
								<option value="0" ></option>
								<option value="1" >保有</option>
								<option value="2" >区分所有</option>
								<!--
								<option value="3" >一棟借上</option>
								-->
							</select>
						</td>
						<th style="width: 6%;">
							<label style="width:100px;">空き部屋数</label>
						</th>
						<td style="width: 5%;">
						</td>
						<th style="width: 7%;">
							<label style="width:100px;">空き駐車場数</label>
						</th>
						<td style="width: 5%;"></td>
					</tr>
				</tbody>
			</table>
			<div id="tabs">
				<ul>
					<li><a href="#kihon_info">基本情報</a></li>
					<li><a href="#parking_info">駐車場情報</a></li>
					<li><a href="#bihin_info">備品情報</a></li>
					<li><a href="#admin_info">管理者情報</a></li>
					
				</ul>
				<div id="kihon_info">
					<table class="imui-form-search-condition">
						<tbody>
							<!--利用区分-->
							<tr>
								<th colspan="2"  style="width:12.5%;">
									<label style="width:140px;">利用区分</label>
								</th>
								<td colspan="4" style="width:37.5%">
									<select style="width:90px">
										<option value="1">使用中</option>
										<option value="2">廃止</option>
										<option value="3">解約済</option>
									</select>
								</td>
							</tr>
							<!--管理会社-->
							<tr>
								<th colspan="2">
									<label>管理会社</label>
								</th>
								<td colspan="4" style="width:37.5%">
									<select style="width:160px">
										<option value="0"></option>
										<option value="1">NEXCO中日本</option>
										<option value="2">NEXCO東日本</option>
										<option value="4">NEXCO西日本</option>
										<option value="5">高速道路総合研究所</option>
										<option value="6">外部機関</option>
									</select>
								</td>
							</tr>
							<!--管理機関-->
							<tr>
								<th colspan="2">
									<label>管理機関</label>
								</th>
								<td colspan="4" style="width:37.5%">
									<select style="width:160px">
										<option value="0"></option>
										<option value="1"></option>
										<option value="2"></option>
										<option value="3"></option>
										<option value="4"></option>
										<option value="5"></option>
									</select>
								</td>
							</tr>
							<!--管理事業領域-->
							<tr>
								<th colspan="2">
									<label>管理事業領域</label>
								</th>
								<td colspan="4" style="width:37.5%">
									<select style="width:160px">
										<option value="0"></option>
										<option value="1"></option>
										<option value="2"></option>
										<option value="3"></option>
										<option value="4"></option>
										<option value="5"></option>
									</select>
								</td>
							</tr>
							<!--郵便番号-->
							<tr>
								<th rowspan="2">
									<label>所在地</label>
								</th>
								<th>
									<label>郵便番号</label>
								</th>
								<td colspan="4">
									<input class="ime-off" style="width:85px;" type="text" value="" placeholder="例　4600003">
									<input type="button" value="住所検索" class="imui-small-button"/>
								</td>
							</tr>
							<!--住所-->
							<tr>
								<th>
									<label>住所</label>
								</th>
								<td colspan="4">
									<select style="width:90px">
										<option value="0"></option>
										<option value="1">北海道</option>
										<option value="2">青森県</option>
										<option value="3">岩手県</option>
										<option value="4">宮城県</option>
										<option value="5">秋田県</option>
										<option value="6">山形県</option>
										<option value="7">福島県</option>
										<option value="8">茨城県</option>
										<option value="9">栃木県</option>
										<option value="10">群馬県</option>
										<option value="11">埼玉県</option>
										<option value="12">千葉県</option>
										<option value="13">東京都</option>
										<option value="14">神奈川県</option>
										<option value="15">新潟県</option>
										<option value="16">富山県</option>
										<option value="17">石川県</option>
										<option value="18">福井県</option>
										<option value="19">山梨県</option>
										<option value="20">長野県</option>
										<option value="21">岐阜県</option>
										<option value="22">静岡県</option>
										<option value="23">愛知県</option>
										<option value="24">三重県</option>
										<option value="25">滋賀県</option>
										<option value="26">京都府</option>
										<option value="27">大阪府</option>
										<option value="28">兵庫県</option>
										<option value="29">奈良県</option>
										<option value="30">和歌山県</option>
										<option value="31">鳥取県</option>
										<option value="32">島根県</option>
										<option value="33">岡山県</option>
										<option value="34">広島県</option>
										<option value="35">山口県</option>
										<option value="36">徳島県</option>
										<option value="37">香川県</option>
										<option value="38">愛媛県</option>
										<option value="39">高知県</option>
										<option value="40">福岡県</option>
										<option value="41">佐賀県</option>
										<option value="42">長崎県</option>
										<option value="43">熊本県</option>
										<option value="44">大分県</option>
										<option value="45">宮崎県</option>
										<option value="46">鹿児島県</option>
										<option value="47">沖縄県</option>
										<option value="48">その他</option>
									</select>
									<input style="width:616px;" type="text" value="" placeholder="例　名古屋市中区錦2-18-19">
								</td>
							</tr>
							<!--構造-->
							<tr>
								<th colspan="2">
									<label>構造</label>
								</th>
								<td colspan="4">
									<select style="width:90px">
										<option value="0"></option>
										<option value="1">木造</option>
										<option value="2">組積</option>
										<option value="3">鉄筋</option>
									</select>
									<input style="width:360px;" type="text" value="" placeholder="例　RC3F">
								</td>
							</tr>
							<!--エレベーター-->
							<tr>
								<th colspan="2">
									<label>エレベーター</label>
								</th>
								<td colspan="4">
									<select style="width:90px">
										<option value="0"></option>
										<option value="1">なし</option>
										<option value="2">あり</option>
									</select>
								</td>
							</tr>

							<!--建築年月日-->
							<tr>
								<th colspan="2">
									<label>建築年月日</label>
								</th>
								<td colspan="2" style="width:15%">
									<input class="ime-off" type="text" id="hoge777" value="2005/04/02"/>
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge777").imuiCalendar({
													"altField":"#hoge777",
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
								<th style="width:1%;">
									<label>実年数</label>
								</th>
								<td>
									13年
								</td>
							</tr>
							<!--次回算定年月日-->
							<tr>
								<th colspan="2">
									<label>次回算定年月日</label>
								</th>
								<td colspan="2">
									2018/04/01
								</td>
								<th>
									<label>経年</label>
								</th>
								<td>
									10年
								</td>
							</tr>
							<!--社宅補足-->
							<tr>
								<th rowspan="3" colspan="2">
									<label>社宅補足</label>
								</th>
								<td colspan="2">
									<a href="">周辺地図.xlsx</a>
								</td>
								<td colspan="2">
									<input type="button" value="参照" class="imui-small-button" />
									<input type="button" value="削除" class="imui-small-button" />
								</td>
							</tr>
							<tr>
								<td colspan="2"></td>
								<td colspan="2">
									<input type="button" value="参照" class="imui-small-button" />
									<input type="button" value="削除" class="imui-small-button" />
								</td>
							</tr>
							<tr>
								<td colspan="2"></td>
								<td colspan="2">
									<input type="button" value="参照" class="imui-small-button" />
									<input type="button" value="削除" class="imui-small-button" />
								</td>
							</tr>
							<!--備考-->
							<tr>
								<th rowspan="3" colspan="2">
									<label>備考</label>
								</th>
								<td rowspan="3" colspan="4">
									<textarea style="width:710px;" rows="3"></textarea>
								</td>
								<td style="width: 30%;border:none;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="parking_info">
					<table class="imui-form-search-condition">
						<tbody>
							<!--駐車場構造-->
							<tr >
								<th style="width:7%;">
									<label style="width:170px">駐車場構造</label>
								</th>
								<td style="width:5%;">
									<select style="width:90px;">
										<option value="0"></option>
										<option value="1">平地</option>
										<option value="2">宿舎一体</option>
										<option value="3">複数階（屋内）</option>
										<option value="4">複数階（屋外）</option>
										<option value="5">なし</option>
									</select>
								</td>
							</tr>
							<!--駐車場基本使用料-->
							<tr>
								<th>
									<label>駐車場基本使用料</label>
								</th>
								<td>
									3,275円
								</td>
								<th rowspan="3" style="width:7%;">
									<label style="width:170px">駐車場補足</label>
								</th>
								<td style="width:10%;">
									<a  style="width:120px;" href="">区画マップ.xlsx</a>
								</td>
								<td style="width:10%;">
									<input type="button" value="参照" class="imui-small-button" />
									<input type="button" value="削除" class="imui-small-button" />
								</td>
							</tr>
							<tr>
								<th>
									<label>駐車場台数</label>
								</th>
								<td>
									5台
								</td>
								<td></td>
								<td>
									<input type="button" value="参照" class="imui-small-button" />
									<input type="button" value="削除" class="imui-small-button" />
								</td>
							</tr>
							<tr>
								<th>
									<label>貸与可能総数</label>
								</th>
								<td>
									5台
								</td>
								<td></td>
								<td>
									<input type="button" value="参照" class="imui-small-button" />
									<input type="button" value="削除" class="imui-small-button" />
								</td>
								<td style="width:9.2%;border:none;"></td>
							</tr>
						</tbody>
					</table>
					<br />
					<div class="align-L">	
						<input style="margin-bottom: 3px;" type="button" value="追加" class="imui-small-button" >
					</div>
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
//											"pager":"#sampleListTable1-pager",
										"colNames":[
											"区画番号",
											"貸与区分",				
											"使用者",							
											"駐車場<br/>調整金額",						
											"駐車場<br/>月額使用料",				
											"備考",						
											"削除",			
										],
										"datatype":"local",
										"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
//										"rowNum":10,
										"width":"1060",
										"shrinkToFit":"true",
										"cellsubmit":"clientArray",
										"loadonce":true,
										"colModel":[
											{"name":"kukaku_no","width":"165","align":"center"}<!-- 区画番号 -->
											,{"name":"taiyo_kubun","width":"110","align":"center"}<!-- 貸与区分 -->
											,{"name":"shiyousya","width":"160","align":"left"}<!-- 使用者 -->
											,{"name":"parking_adustMoney","width":"120","align":"right"}<!-- 駐車場調整金額 -->
											,{"name":"parking_monthlyRate","width":"155","align":"right"}<!-- 駐車場月額使用料 -->
											,{"name":"note","width":"228","align":"center"}<!-- 備考 -->
											,{"name":"delete","width":"70","align":"center"}<!-- 削除 -->
										],
										"rownumbers":false,
										"height":"300"
									};
									parameter.data = [
										{
											"kukaku_no":"<input type='text' value='０１' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０２' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０３' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０４' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０５' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;' disabled><option value='0'></option><option value='1'>貸与可</option><option value='2' selected>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='-100' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,175円",
											"note":"<input type='text' value='縦列' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０６' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='来客用' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０７' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='100' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,375円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０８' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='０９' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										},{
											"kukaku_no":"<input type='text' value='１０' style='width:95%;'/>",
											"taiyo_kubun":"<select style='width:95%;'><option value='0'></option><option value='1' selected>貸与可</option><option value='2'>貸与不可</option></select>",
											"shiyousya":"",
											"parking_adustMoney":"<input class='ime-off' type='text' value='0' style='width:80%;text-align: right;'/>円",
											"parking_monthlyRate":"3,275円",
											"note":"<input type='text' value='' style='width:95%;'/>",
											"delete":"<input type='button' value='削除' class='imui-small-button'/>"
										}
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
//											// 1行づつ網掛け挑戦
//											jQuery('#sampleListTable1').jqGrid({
//												loadComplete: function () {
//													var rowIDs = jQuery('#sampleListTable1').getDataIDs(); 
//													$.each(rowIDs, function (i, item) {
//														if (i % 2 == 0) {
//															$('#'+item).removeClass('ui-widget-content');
//															$('#'+item).addClass('testcss');
//														}
//													});
//												},
//											});
//											jQuery('#sampleListTable1').jqGrid({
//												gridComplete: function () {
//													$('tbody > tr:even', this).addClass('ui-row-even');
//												}
//											});
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
								.ui-jqgrid .ui-jqgrid-htable th {
									display:table-cell;
								    height: 32px;
									text-align:center;
									vertical-align:middle;
								}
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
					<br />
					<div>
						<!--備考-->
						<table class="imui-form-search-condition">
							<tbody>
								<!--備考-->
								<tr>
									<th rowspan="3" style="width:12%;">
										<label>備考</label>
									</th>
									<td rowspan="2" style="width:61%" colspan="4">
										<textarea style="width:98%;" rows="3"></textarea>
									</td>
									<td style="width:17%;border:none;"></td>
								</tr>
								<tr />
								<tr />
							</tbody>
						</table>
					</div>
				</div>
				<div id="bihin_info">
					<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						})(jQuery);
					</script>

					<table name="imui-8eqlrzst4hv6std" id="bihinListTable1"></table>

					<div id="bihinListTable1-pager"></div>

					<script type="text/javascript">
						(function() {
							function imuiListTable() {
								var grid = jQuery('#bihinListTable1');
								var parameter = {
									"multiselect":false,
//											"pager":"#bihinListTable1-pager",
									"colNames":[
										"備品名称",
										"備付状況",
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
//									"rowNum":13,
									"width":"290",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"name":"bihin_name","width":"180","align":"left"}<!-- 備品名称 -->
										,{"name":"sonaetsuke_status","width":"100","align":"center"}<!-- 備付状況 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"bihin_name":"洗濯機",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5' selected>共有</option></select>"
									},{
										"bihin_name":"冷蔵庫",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5' selected>共有</option></select>"
									},{
										"bihin_name":"オーブンレンジ",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"掃除機",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"電子炊飯ジャー",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"テレビ",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"テレビ台",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"座卓(こたつ)",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"キッチンキャビネット",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"ルームエアコン",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"カーテン",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"照明器具",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
									},{
										"bihin_name":"ガステーブル",
										"sonaetsuke_status":"<select style='width:95%;'><option value='1' >なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4' selected>備付</option><option value='5'>共有</option></select>"
									}
								];

								grid.jqGrid(parameter);


// as
//											// 1行づつ網掛け挑戦
//											jQuery('#bihinListTable1').jqGrid({
//												loadComplete: function () {
//													var rowIDs = jQuery('#bihinListTable1').getDataIDs(); 
//													$.each(rowIDs, function (i, item) {
//														if (i % 2 == 0) {
//															$('#'+item).removeClass('ui-widget-content');
//															$('#'+item).addClass('testcss');
//														}
//													});
//												},
//											});
//											jQuery('#bihinListTable1').jqGrid({
//												gridComplete: function () {
//													$('tbody > tr:even', this).addClass('ui-row-even');
//												}
//											});
// ae

//										grid.jqGrid('navGrid','#bihinListTable1-pager',{
//											edit: false,
//											add: false,
//											del: false,
//											search: false,
//										});

								var gboxGridId     = 'gbox_bihinListTable1';
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
							.ui-jqgrid .ui-jqgrid-htable th {
								display:table-cell;
							    height: 32px;
								text-align:center;
								vertical-align:middle;
							}
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
							#bihinListTable1 tr td{
								white-space:normal;
							}
						-->
					</style>
				</div>
				<div id="admin_info">
					<table class="imui-form-search-condition">
						<colgroup>
							<col style="width:10%;"/>
							<col/>
							<col/>
							<col/>
							<col/>
							<col/>
						</colgroup>
						<tbody>
							<!--駐車場構造-->
							<tr >
								<td style="width:15%;background-color:white;"/>
								<th style="width:20%;">
									<label style="width:165px;">寮長・自治会長</label>
								</th>
								<th style="width:20%;">
									<label style="width:165px;">鍵管理者</label>
								</th>
								<th style="width:20%;">
									<label style="width:165px;">寮母・管理会社</label>
								</th>
								<td style="width:20%;border:none;"></td>
							</tr>
							<!--部屋番号-->
							<tr>
								<th>
									<label style="width:185px">部屋番号</label>
								</th>
								<td>
									<input style="width:150px;" type="text" value="101" />
								</td>
								<td>
									<input style="width:150px;" type="text" value="202" />
								</td>
								<td>
									<input style="width:150px;" type="text" value="303" />
								</td>
							</tr>
							<tr>
								<th>
									<label>氏名</label>
								</th>
								<td>
									<input style="width:150px;" type="text" value="川田　太郎" />
									<input type='button' value='社員入力支援' class='imui-small-button'/>
								</td>
								<td>
									<input style="width:150px;" type="text" value="海田　次郎" />
									<input type='button' value='社員入力支援' class='imui-small-button'/>
								</td>
								<td>
									<input style="width:150px;" type="text" value="山田　花子" />
									<input type='button' value='社員入力支援' class='imui-small-button' style="visibility:hidden;"/>
								</td>
							</tr>
							<tr>
								<th>
									<label>電子メールアドレス</label>
								</th>
								<td>
									<input class="ime-off" style="width:260px;" type="text" value="tarou@kawada.com" />
								</td>
								<td>
									<input class="ime-off" style="width:260px;" type="text" value="jirou@umida.net" />
								</td>
								<td>
									<input class="ime-off" style="width:260px;" type="text" value="hanako@yamada.jp" />
								</td>
							</tr>
							<tr>
								<th>
									<label>電話番号</label>
								</th>
								<td>
									<input class="ime-off" style="width:150px;height:98%" type="text" value="045-123-4567" />
								</td>
								<td>
									<input class="ime-off" style="width:150px;height:98%" type="text" value="080-9876-5432" />
								</td>
								<td>
									<input class="ime-off" style="width:150px;height:98%" type="text" value="090-1234-5678" />
								</td>
							</tr>
							<tr>
								<th>
									<label>内線番号</label>
								</th>
								<td>
									<input class="ime-off" style="width:150px;height:98%" type="text" value="12-3456" />
								</td>
								<td>
									<input class="ime-off" style="width:150px;height:98%" type="text" value="12-9876" />
								</td>
								<td>
									<input class="ime-off" style="width:150px;height:98%" type="text" value="12-0001" />
								</td>
							</tr>
							<!--備考-->
							<tr>
								<th rowspan="4">
									<label>備考</label>
								</th>
								<td rowspan="4">
									<textarea style="width:260px;" rows="4"></textarea>
								</td>
								<td rowspan="4">
									<textarea style="width:260px;" rows="4"></textarea>
								</td>
								<td rowspan="4">
									<textarea style="width:260px;" rows="4">寮母</textarea>
								</td>
							</tr>
							<tr />
							<tr />
							<tr />
						</tbody>
					</table>
				</div>

			</div>
			<script>
				$(function() {
					$( "#tabs" ).tabs();
				});
			</script>
			<br />
			<div class="align-L float-L">
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			<div class="align-R">
				<input style="width:150px;" type="button" value="登録" class="imui-medium-button" />
				<input style="width:150px;" type="button" value="削除" class="imui-medium-button" disabled/>
			</div>
		</div>
	</div>
	<br><br><br>
	<script type="text/javascript">
function ImageUp() {
window.open("../pop/pop_ShainSentaku.html","window1","width=650px,height=600px","menubar=no,resizable=yes");
}

function openWindow(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=680px,title=no';
  var window1 = window.open("../pop/pop_ShainSentaku.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}


</script>
	<!-- コンテンツエリア　ここまで -->