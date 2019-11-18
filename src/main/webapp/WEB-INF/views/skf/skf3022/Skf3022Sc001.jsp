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
<nfwui:Form id="skf3022Sc001form" name="skf3022Sc001form" modelAttribute="form" >
	<div class="imui-form-container-wide">
		<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
		<nfwui:Title code="<%= MessageIdConstant.SKF3022_SC001_SEARCH_TITLE %>" titleLevel="2" />
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 13%;">
						<!-- 社宅名 -->
						<nfwui:LabelBox id="lblSc001ShatakuName" code="<%= MessageIdConstant.SKF3022_SC001_SHATAKU_NAME %>" />
					</th>
					<td  colspan="5">
						<imui:textbox id="sc001ShatakuName" name="sc001ShatakuName" style="width:260px;"
											value="${form.shatakuName}" placeholder="例　社宅名" tabindex="3" />
					</td>
				</tr>
				<tr>
					<th>
						<!-- 部屋番号 -->
						<nfwui:LabelBox id="lblSc001RoomNo" code="<%= MessageIdConstant.SKF3022_SC001_ROOM_NO %>" />
					</th>
					<td  colspan="5">
						<imui:textbox id="sc001RoomNo" name="sc001RoomNo" style="width:260px;" value="${form.roomNo}"
																			placeholder="例　101（半角）" tabindex="4" />
					</td>
				</tr>
					<th style="width: 13%;">
						<!-- 用途 -->
						<nfwui:LabelBox id="lblSc001Yoto" code="<%= MessageIdConstant.SKF3022_SC001_YOTO %>" />
					</th>
					<td style="width: 11%;">
						<imui:select id="sc001YoutoSelect" name="sc001YoutoSelect" width="60"
												list="${form.sc001YoutoSelectList}" tabindex="5" />
					</td>
					<th style="width: 10%;">
						<!-- 規格 -->
						<nfwui:LabelBox id="lblSc001Kikaku" code="<%= MessageIdConstant.SKF3022_SC001_KIKAKU %>" />
					</th>
					<td style="width: 14%;">
						<imui:select id="sc001KikakuSelect" name="sc001KikakuSelect" width="70"
													list="${form.sc001KikakuSelecteList}" tabindex="6" />
					</td>
					<th style="width: 13%;">
						<!-- 空き部屋 -->
						<nfwui:LabelBox id="lblSc001EmptyRoom" code="<%= MessageIdConstant.SKF3022_SC001_EMPTY_ROOM %>" />
					</th>
					<td style="width: 12%;">
						<imui:select id="sc001EmptyRoomSelect" name="sc001EmptyRoomSelect" width="60"
													list="${form.sc001EmptyRoomSelectList}" tabindex="7" />
					</td>
					<th style="width: 15%;">
						<!-- 空き駐車場 -->
						<nfwui:LabelBox id="lblSc001EmptyParking" code="<%= MessageIdConstant.SKF3022_SC001_EMPTY_PARKING %>" />
					</th>
					<td style="width: 12%;">
						<imui:select id="sc001EmptyParkingSelect" name="sc001EmptyParkingSelect" width="60"
													list="${form.sc001EmptyParkingSelectList}" tabindex="8" />
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div class="align-L">
			<nfwui:Button id="searchBtn" name="searchBtn" code="<%=MessageIdConstant.SKF3022_SC001_BTN_SEARCH %>"  tabindex="9"
														preOnClick="refreshGridData();return false;" cssClass="imui-small-button" />
		</div>
		<br>
		<!-- 明細＆細目未満 -->
		<!-- 明細部 -->
		<nfwui:Title code="<%= MessageIdConstant.SKF3022_SEARCH_RESULT %>" titleLevel="2" />
		<script type="text/javascript">
			(function($){
			$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			})(jQuery);
		</script>

		<imui:listTable id="resultList" name="resultList" process="jssp" autoEncode="false" autoWidth="true" autoResize="true"
			data="${form.listTableList}" onCellSelect="onCellSelectPop" onBeforeSelectRow="onBeforeSelectRow" multiSelect="false">
			<pager rowNum="${form.maxCount}" />
			<cols>
				<col name="colSelect" width="20" sortable="false" caption="" wrap="true" />
				<col name="colShatakuName" width="140" sortable="false" align="left" caption="社宅名" wrap="true" />
				<col name="colRoomNo" width="100" sortable="false" align="left" caption="部屋番号" wrap="true" />
				<col name="colAuse" width="50" sortable="false" align="center" caption="用途" wrap="true" />
				<col name="colKikaku" width="50" sortable="false" align="center" caption="規格" wrap="true" />
				<col name="colEmptyRoom" width="80" sortable="false" align="center" caption="空き部屋" wrap="true" />
				<col name="colEmptyParking" width="80" sortable="false" align="center" caption="空き駐車場" wrap="true" />
				<col name="colEmptyRoomState" hidden="true" />
				<col name="colShatakuKanriNo" hidden="true" />
				<col name="colRoomKanriNo" hidden="true" />
				<col name="colhdnSelect"  hidden="true"  />
			</cols>
		</imui:listTable>
		<script type="text/javascript">
			(function($) {
				// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
				jQuery(document).on("focus click", "input,textarea", function() {
					$(this).select();
				});
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
			<nfwui:PopupButton id="closebtn" value="画面を閉じる" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="cancel"  tabindex="10"/>
			<nfwui:PopupButton id="selectBtn" value="選択する" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="ok" 
			 preOnClick="if(!check()){return(false)};"  tabindex="11" />
			<input type="hidden" id="targetRowId" value="" />
		</div>

		<script type="text/javascript">
			function refreshGridData() {
				//入力内容チェック
				var map = new Object();
				map['shatakuName'] = $("#sc001ShatakuName").val();
				map['roomNo'] = $("#sc001RoomNo").val();
				map['sc001YoutoSelect'] = $("#sc001YoutoSelect").val();
				map['sc001KikakuSelecte'] = $("#sc001KikakuSelect").val();
				map['sc001EmptyRoomSelect'] = $("#sc001EmptyRoomSelect").val();
				map['sc001EmptyParkingSelect'] = $("#sc001EmptyParkingSelect").val();
				$("#resultList").jqGrid("clearGridData");
				$("#targetRowId").val("");

				nfw.common.doAjaxAction("skf/Skf3022Sc001/searchAsync",map,true,function(data) {
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

							var selectbool = rowData.colSelect;
							//チェックボックス設定
							var rbtn;
							if(selectbool=='1'){
								rbtn = '<input type="radio" name="rbtn" id="rbtn' + j + '" ' +
								'onclick="selRow(\'' + ids[i] + '\')"/>';
							}else{
								rbtn = '<input type="radio" name="rbtn" id="rbtn' + j + '" ' +
								'onclick="selRow(\'' + ids[i] + '\')" disabled/>';
							}
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
					nfw.common.doAjaxAction("skf/Skf3022Sc001/selectErrAsync", map, true, function(data){});
					return false;
				}else{
					var grid = $("#resultList");
					var rowData = grid.getRowData(rowId);
					//親画面に値設定(親画面に以下の非表示項目を作成する)
			 		$("#hdnShatakuKanriNo").val(rowData.colShatakuKanriNo);
					$("#hdnShatakuName").val(rowData.colShatakuName);
					$("#hdnRoomKanriNo").val(rowData.colRoomKanriNo);
					$("#hdnRoomNo").val(rowData.colRoomNo);

					return true;
				}
			};
		</script>
	</div>
</nfwui:Form>