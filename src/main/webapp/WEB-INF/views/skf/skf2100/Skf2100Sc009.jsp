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
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>
<script src="scripts/skf/skfCommon.js"></script>

<%-- コンテンツエリア --%>
<style type="text/css">
	.imui-box-warning, .imui-box-caution, .imui-box-success{
		min-width: 70%;
		position: absolute!important;
		z-index: 1;
		margin-left: 12%;
	}
</style>

<!-- コンテンツエリア -->
<nfwui:Form id="skf2100Sc009form" name="skf2100Sc009form" modelAttribute="form" >
	<div class="imui-form-container-wide">
		<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
		<nfwui:Title code="<%= MessageIdConstant.SKF2100_SC009_SEARCH_TITLE %>" titleLevel="2" />
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 30%;">
						<!-- 通しNo -->
						<nfwui:LabelBox id="lblSc009RouterNo" code="<%= MessageIdConstant.SKF2100_SC009_ROUTER_NO %>" />
					</th>
					<td  colspan="5">
						<imui:textbox id="sc009RouterNo" name="sc009RouterNo" style="ime-mode: disabled;width:260px;" maxlength="10"
							 oninput="value = value.replace(/[^0-9]+/i,'');"  value="${f:h(form.routerNo)}" placeholder="" tabindex="301" />
					</td>
				</tr>
				<tr>
					<th>
						<!-- 電話番号 -->
						<nfwui:LabelBox id="lblSc009Tel" code="<%= MessageIdConstant.SKF2100_SC009_TEL %>" />
					</th>
					<td  colspan="5">
						<imui:textbox id="sc009Tel" name="sc009Tel" style="ime-mode: disabled;width:260px;" maxlength="13" value="${f:h(form.tel)}" 
							oninput="value = value.replace(/[^0-9-]+/i,'');" placeholder="" tabindex="302" />
					</td>
				</tr>
				<tr>
					<th>
					<!-- 契約終了日 -->
						<nfwui:LabelBox id="lblSc009ContractEndDate" code="<%=MessageIdConstant.SKF2100_SC009_CONTRACT_END_DATE %>" />
					</th>
					<td >
						<nfwui:DateBox id="sc009ContractEndDateFrom" name="sc009ContractEndDateFrom" value="${f:h(form.sc009ContractEndDateFrom)}"
						 cssStyle="width:100px" tabindex="303"/>
						&nbsp;～&nbsp;&nbsp;
						<nfwui:DateBox id="sc009ContractEndDateTo" name="sc009ContractEndDateTo" value="${f:h(form.sc009ContractEndDateTo)}"
						 cssStyle="width:100px" tabindex="304"/>
						
					</td>
					
				</tr>
				<tr>
					<!-- 備考 -->
					<th >
						<nfwui:LabelBox id="lblSc009Biko" code="<%=MessageIdConstant.SKF2100_SC009_BIKO %>" />
					</th>
					<td >
						<imui:textbox id="sc009Biko" name="sc009Biko" style="width:260px;"
							value="${f:h(form.biko)}" placeholder="" tabindex="305" />
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div class="align-L">
			<nfwui:Button id="searchBtn" name="searchBtn" code="<%=MessageIdConstant.SKF2100_SC009_BTN_SEARCH %>"  tabindex="306"
														preOnClick="refreshGridData();return false;" cssClass="imui-small-button" />
		</div>
		<br>
		<!-- 明細＆細目未満 -->
		<!-- 明細部 -->
		<nfwui:Title code="<%= MessageIdConstant.SKF2100_SC009_SEARCH_RESULT %>" titleLevel="2" />
		<script type="text/javascript">
			(function($){
			$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			})(jQuery);
		</script>

		<imui:listTable id="resultList" name="resultList" process="jssp" autoEncode="false" autoWidth="true" autoResize="true"
			data="${form.listTableList}" onCellSelect="onCellSelectPop" onBeforeSelectRow="onBeforeSelectRow" multiSelect="false"  tabindex="308">
			<pager rowNum="${form.maxCount}" />
			<cols>
				<col name="colSelect" width="20" sortable="false" caption="" wrap="true"  tabindex="307"/>
				<col name="colRouterNo" width="50" sortable="false" align="left" caption="通しNo" wrap="true" />
				<col name="colTel" width="120" sortable="false" align="left" caption="電話番号" wrap="true" />
				<col name="colContractEndDate" width="120" sortable="false" align="left" caption="契約終了日" wrap="true" />
				<col name="colBiko" width="200" sortable="false" align="left" caption="備考" wrap="true" />
				<col name="colhdnIccid"  hidden="true"  />
				<col name="colhdnImei"  hidden="true"  />
				<col name="colhdnSelect"  hidden="true"  />
			</cols>
		</imui:listTable>
		<script type="text/javascript">
			(function($) {
				onBeforeSelectRow = function(rowId,e) {
					//選択可の行がクリックされた場合のみTrueにする
					// リストテーブル情報取得
					var grid = $("#resultList");
					var rowData = grid.getRowData(rowId);
					//選択可フラグ
					var hdnSelect = rowData.colhdnSelect;
					if(hdnSelect === '1'){
						return true;
					}else{
						return false;
					}
				}

				onCellSelectPop = function(rowId, iCol, cellcontent, e) {
					$("#targetRowId").val(rowId);

					// 現在の選択行を取得
					var row = $("#resultList").jqGrid('getGridParam', 'selrow');
					// 行IDを取得
					var ids = $("#resultList").jqGrid('getDataIDs');
					for (var i = 0; i < ids.length; i++) {
						if (rowId == ids[i]){
							break;	// 行IDが一致したので抜ける
						}
					}
					if (i < ids.length) {
						id = i + 1;
						var obj = document.getElementById("rbtn" + id);
						if(obj) obj.checked = true;
					}
				}
			})(jQuery);
		</script>
		<br/>	
		<div class="align-R">
			<nfwui:PopupButton id="closebtn" value="画面を閉じる" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="cancel"  tabindex="309"/>
			<nfwui:PopupButton id="selectBtn" value="選択する" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="ok" 
			 preOnClick="if(!check()){return(false)};"  tabindex="310" />
			<input type="hidden" id="targetRowId" value="" />
		</div>

		<script type="text/javascript">
			function refreshGridData() {
				// 警告文表示を削除
				$(".imui-box-caution, .imui-box-warning").hide();
				$(".imui-box-caution, .imui-box-error").hide();
				$(".imui-box-caution, .imui-box-success").hide();
				//入力内容チェック
				var map = new Object();
				map['routerNo'] = $("#sc009RouterNo").val();
				map['tel'] = $("#sc009Tel").val();
				map['sc009ContractEndDateFrom'] = $("#Skf2100Sc009_popup_sc009ContractEndDateFrom").val();
				map['sc009ContractEndDateTo'] = $("#Skf2100Sc009_popup_sc009ContractEndDateTo").val();
				map['biko'] = $("#sc009Biko").val();
				$("#resultList").jqGrid("clearGridData");
				$("#targetRowId").val("");

				nfw.common.doAjaxAction("skf/Skf2100Sc009/searchAsync",map,true,function(data) {
					var result = data.dataCount;
					// リストテーブル情報更新
					var grid = $("#resultList");

					$("#resultList").jqGrid('setGridParam',{
						data : data.listTableList
					}).trigger("reloadGrid");

					if(result > 0){
						var ids = $("#resultList").jqGrid('getDataIDs');
						for(var i = 0; i < ids.length; i++) {
							j = i + 1;
							var rowData = grid.getRowData(ids[i]);

							//チェックボックス設定
							var rbtn = '<input type="radio" name="rbtn" id="rbtn' + j + '" ' +
								'onclick="selRow(\'' + ids[i] + '\')"/>';

							grid.setRowData(ids[i], {colSelect:rbtn});
						}
					}
					window.scrollTo(0, 0);
				});
			};

			function selRow(id) {
				if (id) {
					// ラジオボタンの行を選択する
					$("#resultList").jqGrid('setSelection', id);
					$("#targetRowId").val(id);
				}
			};

			function check(){
				var rowId = $("#targetRowId").val();
				if (rowId == null || rowId == "") {
					var map = new Object();
					// 未選択エラー
					nfw.common.doAjaxAction("skf/Skf2100Sc009/selectErrAsync", map, true, function(data){});
					return false;
				}else{
					var grid = $("#resultList");
					var rowData = grid.getRowData(rowId);
					//親画面に値設定(親画面に以下の非表示項目を作成する)
			 		$("#hdnMobileRouterNo").val(rowData.colRouterNo);
					$("#hdnIccid").val(rowData.colhdnIccid);
					$("#hdnImei").val(rowData.colhdnImei);

					return true;
				}
			};
		</script>
	</div>
</nfwui:Form>