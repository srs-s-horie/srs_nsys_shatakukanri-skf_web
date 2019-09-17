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
  .imui-box-warning, .imui-box-caution {
    min-width: 70%;
    position: absolute!important;
    z-index: 1;
    margin-left: 12%;
  }
  #imui-container {
    width:650px;
    min-width:650px;
    max-width: 1000px;
  }
</style>
<div id="imui-container" style="width:650px;min-width:650px;max-width: 1000px;">
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="550px" style="width:100%; min-width:550px;max-width: 550px;">
	<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
		<div class="imui-chapter-title"><h2>検索条件</h2></div>
		<form id="form" class="target_form mt-10" action="" method="POST">
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th style="width: 15%;">
							<label>社宅名</label>
						</th>
						<td  colspan="3">
							新石川寮
						</td>
					</tr>
					<tr>
						<th style="width: 10%;">
							<label>使用者</label>
						</th>
						<td  >
							<input style="width:150px;" type="text" value="" placeholder="例　中日本　太郎">
						</td>
						<th style="width: 15%;">
							<label>駐車場</label>
						</th>
						<td  >
							<input type="checkbox" checked/><label>空き駐車場</label>
						</td>
					</tr>
						<th style="width: 10%;">
							<label>備考</label>
						</th>
						<td colspan="3">
							<input style="width:80%;" type="text" value="" >
						</td>
					</tr>


				</tbody>
			</table>
		</form>
		<div class="align-L">	
			<input type="button" value="検索" class="imui-small-button" >
			<!--<input type="button" value="クリア" class="imui-small-button" >-->
				</div>
<br>
			<!-- 明細＆細目未満 -->
		<!-- 明細部 -->
		<form id="sampleList1">
			<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
			<script type="text/javascript">
				(function($){
				$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
				})(jQuery);
			</script>

			<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>

			<div id="sampleListTable1-pager"></div>

			<script type="text/javascript">
				function selRow(id) {
					if (id) {
						$("#sampleListTable1").jqGrid('setSelection', id);
					}
				}

				(function() {
					function imuiListTable() {
						var grid = jQuery('#sampleListTable1');
						var parameter = {
							"multiselect":false,
							"pager":"#sampleListTable1-pager",
							"colNames":[
								"",
								"区画番号",				
								"貸与区分",							
								"貸与状況",
								"使用者",
								"備考",						
							],
							"datatype":"local",
							"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
							"rowNum":1000,
							"width":"550",
							"shrinkToFit":"true",
							"cellsubmit":"clientArray",
							"loadonce":true,
							"colModel":[
							<!-- {"hidden":true,"name":"id","key":true},-->
								{index:'rb',"name":"rb", "width":"20","align":"center",  formatter:rbtnFmatter}
								,{"name":"A001","width":"150","align":"left"}<!-- 区画番号 -->
								,{"name":"A002","width":"60","align":"center"}<!-- 貸与区分 -->
								,{"name":"A003","width":"60","align":"center"}<!-- 貸与状況 -->
								,{"name":"A004","width":"150","align":"left"}<!-- 使用者 -->
								,{"name":"A005","width":"80","align":"left"}<!-- 備考 -->
							],
							// 行の選択でラジオボタンも選択
							onSelectRow: function(id)
							{
								// 現在の選択行を取得
								var row = $("#sampleListTable1").jqGrid('getGridParam', 'selrow');
								// 行IDを取得
								var ids = $("#sampleListTable1").jqGrid('getDataIDs');
								for (var i = 0; i < ids.length; i++) {
									if (row == ids[i])
										break;  // 行IDが一致したので抜ける
								}
								if (i < ids.length) {
									id = i + 1;
									var obj = document.getElementById("rbtn" + id);
									if(obj)
										obj.checked = true;
								}
							},

							"rownumbers":false,
							"height":"200"
						};


						parameter.data = [
							{
								"id":1,
								"A001":"01",
								"A002":"貸与可",
								"A003":"なし",
								"A004":"1R",
								"A005":"空き",
							},
							{
								"id":2,
								"A001":"02",
								"A002":"貸与可",
								"A003":"退居予定",
								"A004":"中日本 6985",
								"A005":"",
							},									

							{
								"id":3,
								"A001":"04",
								"A002":"貸与可",
								"A003":"なし",
								"A004":"",
								"A005":"",
							},
							{
								"id":4,
								"A001":"05",
								"A002":"貸与可",
								"A003":"なし",
								"A004":"",
								"A005":"予備",
							},								
							];

						grid.jqGrid(parameter);


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
				function rbtnFmatter(cellvalue, options, rowObject)
						{
						// ラジオボタンの input タグをリターンする
						var rbtn = '<input type="radio" name="rbtn" id="rbtn' + options['rowId'] + '" ' +
						'onclick="selRow(\'' + options['rowId'] + '\')"/>';
						return rbtn;
						}
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
	<div class="align-R">
		<input style="width:100px;" id="" type="button" value="画面を閉じる" class="imui-small-button"  onclick="window.close()"/>
		<input style="width:100px;" id="selectBtn" type="button" value="選択する" class="imui-small-button" />
		<!--<input style="width:100px;" id="" type="button" value="キャンセル" class="imui-small-button"  onclick="window.close()"/>-->
		
	</div>
	<script type="text/javascript">
	jQuery(function ($) {
		$("#selectBtn").click (function() {
			alert("1");
			var array = [];
		    $('area-selected:true').each(function() {
		        array.push($(this).attr('id'));
		        alert($(this).attr('id'));
		    });

			//alert(array);
		});			  
	});

	</script>
	</div>
</div>