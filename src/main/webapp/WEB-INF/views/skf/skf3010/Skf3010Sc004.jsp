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
		</script>

		<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv">
			<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;">
			</div> 
		</div>

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<form id="form" class="target_form mt-10" action="" method="POST">
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th style="width: 5%;">
									<label style="height:24px;">社宅名</label>
								</th>
								<td style="width: 5%;">
									宮内A
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
									保有
								</td>
								<th style="width: 6%;">
									<label>空き部屋数</label>
								</th>
								<td style="width: 5%;">
									2/25
								</td>
								<th style="width: 7%;">
									<label>空き駐車場数</label>
								</th>
								<td style="width: 5%;">
									3/25
								</td>
							</tr>
							<tr>
								<th>
									<label>本来用途</label>
								</th>
								<td>
									<select style="width:110px;">
										<option value="0"></option>
										<option value="1">世帯</option>
										<option value="2">単身</option>
										<option value="3">独身</option>
									</select>
								</td>
								<th style="width: 5%;">
									<label>貸与区分</label>
								</th>
								<td>
									<select style="width:110px;">
										<option value="0"></option>
										<option value="1">貸与可</option>
										<option value="2">貸与不可</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="align-L">	
					<input type="button" value="検索" class="imui-small-button" >
				</div>
			</div>
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
//									"pager":"#sampleListTable1-pager",
									"colNames":[
										"",
										"部屋番号",				
										"本来用途",							
										"本来企画",						
										"本来延面積",				
										"貸与区分",						
										"使用者",			
										"備考",				
										"詳細",				
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
										,{"name":"room_no","width":"80","align":"left"}<!-- 部屋番号 -->
										,{"name":"original_ause","width":"80","align":"center"}<!-- 本来用途 -->
										,{"name":"original_kikaku","width":"80","align":"center"}<!-- 本来企画 -->
										,{"name":"original_menseki","width":"90","align":"right"}<!-- 本来延面積 -->
										,{"name":"lend_kbn","width":"80","align":"center"}<!-- 貸与区分 -->
										,{"name":"name","width":"123","align":"left"}<!-- 使用者 -->
										,{"name":"note","width":"610","align":"left"}<!-- 備考 -->
										,{"name":"detail","width":"80","align":"center"}<!-- 詳細 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"room_no":"101",
										"original_ause":"世帯",
										"original_kikaku":"3LDK",
										"original_menseki":"79.92㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　7771",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":2,
										"room_no":"102",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":3,
										"room_no":"103",
										"original_ause":"世帯",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:red'>貸与不可",
										"name":"中日本　4937",
										"note":"クリーニング終わり次第、貸与可",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":4,
										"room_no":"104",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　9318",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":5,
										"room_no":"105",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　0334",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":6,
										"room_no":"201",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　7424",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":7,
										"room_no":"202",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3243",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":8,
										"room_no":"203",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3575",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":9,
										"room_no":"204",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　7337",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":10,
										"room_no":"205",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　1668",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":11,
										"room_no":"301",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　1333",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":12,
										"room_no":"302",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　1922",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":13,
										"room_no":"303",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　1160",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":14,
										"room_no":"304",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3646",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":15,
										"room_no":"305",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3647",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":16,
										"room_no":"401",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3648",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":17,
										"room_no":"402",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3649",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":18,
										"room_no":"403",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3650",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":19,
										"room_no":"405",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3651",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":20,
										"room_no":"406",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3652",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":21,
										"room_no":"501",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3653",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":22,
										"room_no":"502",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3654",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":23,
										"room_no":"503",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3655",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":24,
										"room_no":"504",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3656",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
									},{
										"id":25,
										"room_no":"505",
										"original_ause":"単身",
										"original_kikaku":"1LDK",
										"original_menseki":"38.64㎡",
										"lend_kbn":"<font style='color:blue'>貸与可",
										"name":"中日本　3657",
										"note":"",
										"detail":"<input type='button' title='詳細' value='詳細' class='imui-small-button'>"
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
			<br />
			<div class="align-L float-L">	
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			<div class="align-R">
				<input style="width:150px;" type="button" value="新規" class="imui-medium-button" onclick="location.href='../../skf/Skf3010_Sc005/init'"/>
			</div>
		</div>
	</div>
	<!-- コンテンツエリア　ここまで -->