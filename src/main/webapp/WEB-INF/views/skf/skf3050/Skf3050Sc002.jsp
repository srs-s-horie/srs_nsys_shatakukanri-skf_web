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
			
							<table class="imui-form-search-condition">
					<tbody>

						<tr>
							<th>
								<label style="width:80px;">対象年度</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">2018年度</option>
									<option value="2">2017年度</option>
									<option value="3" selected>2016年度</option>
									<option value="4">2015年度</option>
									<option value="5">2014年度</option>
								</select>
							</td>
							<td style="width:1000px;border:none;"></td>
							
						</tr>
					</tbody>
				</table>
			
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title" ><h2>月次処理状況</h2></div>
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
										"年月",
										"締め処理",
										"給与連携データ作成"

									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":12,
									"width":"495",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"nengetsu","width":"160","align":"center"}<!-- 選択 -->
										,{"name":"shimeshori","width":"160","align":"center"}<!-- 入退居区分 -->
										,{"name":"hrrenkei","width":"160","align":"center"}<!-- 社員番号 -->
									],
									"rownumbers":false,
									"height":"350"
								};
								parameter.data = [
									{
										"id":1,
										"nengetsu":"2016年4月（5月給与）",
										"shimeshori":"実行済",
										"hrrenkei":"確定済",
									},									{
										"id":2,
										"nengetsu":"2016年5月（6月給与）",
										"shimeshori":"実行済",
										"hrrenkei":"確定済",
									},
									{
										"id":3,
										"nengetsu":"2016年6月（7月給与）",
										"shimeshori":"実行済",
										"hrrenkei":"確定済",
									},
									{
										"id":4,
										"nengetsu":"2016年7月（8月給与）",
										"shimeshori":"実行済",
										"hrrenkei":"確定済",
									},
									{
										"id":5,
										"nengetsu":"2016年8月（9月給与）",
										"shimeshori":"実行済",
										"hrrenkei":"確定済",
									},
									{
										"id":6,
										"nengetsu":"2016年9月（10月給与）",
										"shimeshori":"実行済",
										"hrrenkei":"確定済",
									},
									{
										"id":7,
										"nengetsu":"2016年10月（11月給与）",
										"shimeshori":"",
										"hrrenkei":"",
									},
									{
										"id":8,
										"nengetsu":"2016年11月（12月給与）",
										"shimeshori":"",
										"hrrenkei":"",
									},
									{
										"id":9,
										"nengetsu":"2016年12月（翌1月給与）",
										"shimeshori":"",
										"hrrenkei":"",
									},
									{
										"id":10,
										"nengetsu":"2017年1月（2月給与）",
										"shimeshori":"",
										"hrrenkei":"",
									},
									{
										"id":11,
										"nengetsu":"2017年2月（3月給与）",
										"shimeshori":"",
										"hrrenkei":"",
									},
									{
										"id":12,
										"nengetsu":"2017年3月（4月給与）",
										"shimeshori":"",
										"hrrenkei":"",
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
				</form>
				<br>

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
			<div class="align-R">
				<input style="width:150px;" type="button" value="仮計算処理" class="imui-medium-button" onclick=""/>
				<input style="width:150px;" type="button" value="締め処理" class="imui-medium-button" onclick="" />
				<input style="width:200px;" type="button" value="給与連携データ作成処理" class="imui-medium-button" onclick="" disabled/>
			</div>

			<div class="align-R">
				<input style="width:150px;" type="button" value="締め解除処理" class="imui-medium-button" onclick="" disabled/>
				<input style="width:200px;" type="button" value="給与連携データ確定処理" class="imui-medium-button" onclick="" disabled/>
			</div>
		</div>

					</div>
	</div>
<!-- コンテンツエリア　ここまで -->