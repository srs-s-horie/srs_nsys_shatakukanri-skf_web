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
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<form id="form" class="target_form mt-10" action="" method="POST">
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th style="width: 10%;">
									<label>会社</label>
								</th>
								<td style="width: 15%;">
									<select style="width:185px;">
										<option value="0"></option>
										<option value="1">NEXCO中日本</option>
										<option value="2">NEXCO東日本</option>
										<option value="4">NEXCO西日本</option>
										<option value="5">高速道路総合研究所</option>
										<option value="6">外部機関</option>
									</select>
								</td>
								<th style="width: 10%;">
									<label>部等</label>
								</th>
								<td style="width: 15%;">
								<select style="width:185px;"><br />
										<option value="0"></option>
										<option value="1"></option>
										<option value="2"></option>
										<option value="3"></option>
										<option value="4"></option>
										<option value="5"></option>
									</select>
								
								</td>

								<th style="width: 10%;">
									<label>事業領域</label>
								</th>
								<td style="width: 15%;">
								<select style="width:185px;"><br />
										<option value="0"></option>
										<option value="1"></option>
										<option value="2"></option>
										<option value="3"></option>
										<option value="4"></option>
										<option value="5"></option>
									</select>
								</td>
							</tr>
							<tr>

								<th style="width: 10%;">
									<label>機関</label>
								</th>
								<td style="width: 15%;">
								<select style="width:185px;"><br />
										<option value="0"></option>
										<option value="1">本社</option>
										<option value="2">東京支社</option>
										<option value="3">八王子支社</option>
										<option value="4">名古屋支社</option>
										<option value="5">金沢支社</option>
									</select>
								</td>

								<th style="width: 10%;">
									<label>室、チーム又は課</label>
								</th>
								<td style="width: 15%;">
								<select style="width:185px;"><br />
										<option value="0"></option>
										<option value="1"></option>
										<option value="2"></option>
										<option value="3"></option>
										<option value="4"></option>
										<option value="5"></option>
									</select>
								</td>

							</tr>
						</tbody>

					</table>
				<div class="align-L">	
					<input type="button" value="検索" class="imui-small-button" >
				</div>
				</form>
				<script type="text/javascript">
				  (function($){
				    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
				  })(jQuery);
				</script>
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
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
										"会社",				
										"機関",							
										"部等",						
										"室、チーム又は課",				
										"事業領域",						
										"詳細",					
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
										,{"name":"A001","width":"250","align":"left"}<!-- 会社 -->
										,{"name":"A002","width":"250","align":"left"}<!-- 機関 -->
										,{"name":"A003","width":"200","align":"left"}<!-- 部等 -->
										,{"name":"A004","width":"200","align":"left"}<!-- 室、チーム又は課 -->
										,{"name":"A005","width":"200","align":"left"}<!-- 事業領域 -->
										,{"name":"A006","width":"100","align":"center"}<!-- 詳細 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"監査役付",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":2,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"監査部",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":3,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"安全管理部",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":4,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"総務本部",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":5,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"総務本部",
										"A004":"笹子トンネル天井板落下事故被害者ご相談室",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":6,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"総務本部・総務部",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":7,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"総務本部・総務部",
										"A004":"総務・秘書T",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},

									{
										"id":8,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"総務本部・総務部",
										"A004":"法務T",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":9,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"保全企画本部",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":10,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"保全企画本部",
										"A004":"保全企画T",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":11,
										"A001":"NEXCO中日本",
										"A002":"本社",
										"A003":"保全企画本部",
										"A004":"施設T",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},
									{
										"id":12,
										"A001":"外部機関",
										"A002":"●●株式会社",
										"A003":"",
										"A004":"",
										"A005":"",
										"A006":" <input type='button' title='詳細' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3090_Sc007/init'\">",

									},

								];

								grid.jqGrid(parameter);

//								// ヘッダ結合
//								grid.jqGrid('setGroupHeaders', {
//									useColSpanStyle: true,
//									groupHeaders:[
//										{startColumnName: 'kihon', numberOfColumns: 2,  titleText: 'メンテナンス'},
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
			</div>
			<br />
			<div class="align-R">
				<input style="width:150px;" id="" type="button" value="新規" class="imui-medium-button"  onclick="location.href='../../skf/Skf3090_Sc007/init'"/>
			</div>
		</div>
	</div>
	<!-- コンテンツエリア　ここまで -->