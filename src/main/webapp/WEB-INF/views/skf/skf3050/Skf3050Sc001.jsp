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
<!-- 			</div>  -->
<!-- 		</div> -->

		<!-- コンテンツエリア -->
<!--
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				-->

<!--
			</div>
			-->
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
			
				<!-- 明細部 -->
				<!--
				<form id="sampleList1">
					<div class="imui-chapter-title" ><h2>月次処理状況照会</h2></div>
					-->
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
									"pager":false,
									"colNames":[
										"",
										"社員番号",
										"社員氏名",
										"所属",
										"社員番号",
										"従業員マスタ:社員氏名",
										"従業員マスタ:所属"

									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":1000,
									"width":"1200",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"A001","width":"120","align":"center"}<!-- 社員番号 -->
										,{"name":"A002","width":"200","align":"left"}<!-- 社員氏名 -->
										,{"name":"A003","width":"300","align":"left"}<!-- 所属 -->
										,{"name":"A004","width":"120","align":"left"}<!-- 社員番号 -->
										,{"name":"A005","width":"200","align":"left"}<!-- 従業員マスタ:社員氏名 -->
										,{"name":"A006","width":"120","align":"left"}<!-- 従業員マスタ:所属 -->
									],
									"rownumbers":false,
									"height":"352"
								};
								parameter.data = [
									{
										"id":1,
										"A001":"K0000001",
										"A002":"中日本　○○１",
										"A003":"本社総務本部・人事部",
										"A004":"<input type='text' value='26990001' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":2,
										"A001":"K0000002",
										"A002":"中日本　○○２",
										"A003":"本社総務本部・人事部",
										"A004":"<input type='text' value='26990002' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":3,
										"A001":"K0000003",
										"A002":"中日本　○○３",
										"A003":"本社総務本部・人事部",
										"A004":"<input type='text' value='26990003' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":4,
										"A001":"K0000004",
										"A002":"中日本　○○４",
										"A003":"東京支社南アルプス工事事務所",
										"A004":"<input type='text' value='26990004' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":5,
										"A001":"K0000005",
										"A002":"中日本　○○５",
										"A003":"東京支社南アルプス工事事務所",
										"A004":"<input type='text' value='26990005' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":6,
										"A001":"K0000006",
										"A002":"中日本　○○６",
										"A003":"東京支社環境・技術管理部",
										"A004":"<input type='text' value='26990006' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":7,
										"A001":"K0000007",
										"A002":"中日本　○○７",
										"A003":"東京支社環境・技術管理部",
										"A004":"<input type='text' value='26990007' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":8,
										"A001":"K0000008",
										"A002":"中日本　○○８",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990008' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":9,
										"A001":"K0000009",
										"A002":"中日本　○○９",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990009' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":10,
										"A001":"K0000010",
										"A002":"中日本　○○１０",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990010' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":11,
										"A001":"K0000011",
										"A002":"中日本　○○１１",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990011' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":12,
										"A001":"K0000012",
										"A002":"中日本　○○１２",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990012' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":13,
										"A001":"K0000013",
										"A002":"中日本　○○１３",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990013' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":14,
										"A001":"K0000014",
										"A002":"中日本　○○１４",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990014' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
									{
										"id":15,
										"A001":"K0000015",
										"A002":"中日本　○○１５",
										"A003":"東京支社総務企画部",
										"A004":"<input type='text' value='26990014' style='width:95%'></input>",
										"A005":"",
										"A006":"",
									},
								];

								grid.jqGrid(parameter);

//								// ヘッダ結合
//								grid.jqGrid('setGroupHeaders', {
//									useColSpanStyle: true,
//									groupHeaders:[
//										{startColumnName: 'shataku_status', numberOfColumns: 2,  titleText: '社宅提示'},
//										{startColumnName: 'bihin_status', numberOfColumns: 2,  titleText: '備品提示'},
//									]
//								});

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
					<br>
			<div class="align-R">
				<input style="width:150px;" type="button" value="社員情報確認" class="imui-medium-button" onclick="" />
				<input style="width:150px;" type="button" value="登録" class="imui-medium-button" onclick=""/>
			</div>

					
				</form>

		</div>

			

					</div>
	</div>
<!-- コンテンツエリア　ここまで -->