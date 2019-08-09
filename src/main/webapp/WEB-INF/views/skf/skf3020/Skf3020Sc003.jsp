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
<!-- コンテンツエリア -->
		<div class="imui-form-container-wide"  style="width:1280px;">
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
							"pager":"#sampleListTable1-pager",
							"colNames":[
								"",
								"社員番号",
								"社員氏名",
								"等級",
								"年齢",
								"新所属",
								"現所属",
								"備考",
							],
							"datatype":"local",
							"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
							"rowNum":1000,
							"width":"1350",
							"shrinkToFit":"true",
							"cellsubmit":"clientArray",
							"loadonce":true,
							"colModel":[
								{"hidden":true,"name":"id","key":true}
								,{"name":"shain_no","width":"80","align":"left"}<!-- 社員番号 -->
								,{"name":"shain_name","width":"140","align":"left"}<!-- 社員氏名 -->
								,{"name":"grade","width":"60","align":"left"}<!-- 等級 -->
								,{"name":"age","width":"60","align":"right"}<!-- 年齢 -->
								,{"name":"new_affiliation","width":"400","align":"left"}<!-- 新所属 -->
								,{"name":"now_affiliation","width":"400","align":"left"}<!-- 現所属 -->
								,{"name":"note","width":"158","align":"left"}<!-- 備考 -->
							],
							"rownumbers":false,
							"height":"400"
						};
						parameter.data = [
							{
								"id":1,
								"shain_no":"900001",
								"shain_name":"高速　タロウ",
								"grade":"L1",
								"age":"31",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":"転任"
							},{
								"id":2,
								"shain_no":"900002",
								"shain_name":"高速　ナハコ",
								"grade":"L2",
								"age":"32",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"note":"配置換"
							},{
								"id":3,
								"shain_no":"",
								"shain_name":"高速　次郎",
								"grade":"L2",
								"age":"38",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":"転任"
							},{
								"id":4,
								"shain_no":"",
								"shain_name":"高速　四郎",
								"grade":"L2",
								"age":"22",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"",
								"note":""
							},{
								"id":5,
								"shain_no":"900003",
								"shain_name":"高速　五郎",
								"grade":"L2",
								"age":"60",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":"再雇用"
							},{
								"id":6,
								"shain_no":"900004",
								"shain_name":"高速　六郎",
								"grade":"L2",
								"age":"34",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
							},{
								"id":7,
								"shain_no":"900005",
								"shain_name":"高速　七郎",
								"grade":"L2",
								"age":"35",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":""
							},{
								"id":8,
								"shain_no":"900006",
								"shain_name":"高速　八郎",
								"grade":"L2",
								"age":"36",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":""
							},{
								"id":9,
								"shain_no":"900007",
								"shain_name":"高速　九朗",
								"grade":"L1",
								"age":"37",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
							},{
								"id":10,
								"shain_no":"900008",
								"shain_name":"高速　十郎",
								"grade":"L2",
								"age":"38",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":"転籍"
							},{
								"id":11,
								"shain_no":"",
								"shain_name":"高速　十一",
								"grade":"L1",
								"age":"39",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":"出向受入"
							},{
								"id":12,
								"shain_no":"900012",
								"shain_name":"高速　十二",
								"grade":"L1",
								"age":"40",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"new_affiliation":"",
								"note":"退職"
							},{
								"id":13,
								"shain_no":"900013",
								"shain_name":"高速　十三",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
							},{
								"id":14,
								"shain_no":"900014",
								"shain_name":"高速　十四",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
							},{
								"id":15,
								"shain_no":"900015",
								"shain_name":"高速　十五",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
							},{
								"id":16,
								"shain_no":"900016",
								"shain_name":"高速　十六",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":""
							},{
								"id":17,
								"shain_no":"900017",
								"shain_name":"高速　十七",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":""
							},{
								"id":18,
								"shain_no":"900018",
								"shain_name":"高速　十八",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"now_affiliation":"本社 総務本部 総務部 総務・秘書チーム 秘書役",
								"note":""
							},{
								"id":19,
								"shain_no":"900019",
								"shain_name":"高速　十九",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
							},{
								"id":20,
								"shain_no":"900020",
								"shain_name":"高速　二十",
								"grade":"L2",
								"age":"41",
								"new_affiliation":"東京支社 横浜保全・サービスセンター（保全担当）保全担当課長",
								"now_affiliation":"本社 総務本部 経理部 経理チーム",
								"note":""
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

			<br />
			<div class="align-L float-L">	
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			<div class="align-R">
				<input style="width:150px;" type="button" value="取込実行" class="imui-medium-button" onclick="location.href='../../skf/Skf3020Sc002/init'"/>
			</div>

	</div>
	<!-- コンテンツエリア　ここまで -->