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
						<th  style="width:15%;">
							<label>取込ファイル</label>
						</th>
						<td style="width:100px;">
							<input type="file" size="40" accept=".csv"/>
						</td>
						
						<td style="border:none;">
						<input type="button" value="EXCEL取込" class="imui-small-button" onclick="location.href=''"/>
						</td>
					</tr>
				</tbody>
			</table>
			
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
										"改定日",
										"備考",
										"メンテナンス"

									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":12,
									"width":"1025",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"kaiteibi","width":"120","align":"center"}<!-- 改定日 -->
										,{"name":"bikou","width":"710","align":"left"}<!-- 備考 -->
										,{"name":"maintenance","width":"180","align":"left"}<!-- メンテナンス -->
									],
									"rownumbers":false,
									"height":"352"
								};
								parameter.data = [
									{
										"id":1,
										"kaiteibi":"2016/04/01",
										"bikou":"",
										"maintenance":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc002/init'\">&nbsp;<input type='button' value='EXCEL出力' class='imui-small-button' onclick=\"location.href=''\">",
									}
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
				<input style="width:150px;" type="button" value="新規" class="imui-medium-button" onclick="location.href='../../skf/Skf3090_Sc002/init'"/>
<!--				<input style="width:150px;" type="button" value="取込状況を確認" class="imui-medium-button" onclick="" /> -->
			</div>

		</div>

			
			<br />

					</div>
	</div>
	<!-- コンテンツエリア　ここまで -->