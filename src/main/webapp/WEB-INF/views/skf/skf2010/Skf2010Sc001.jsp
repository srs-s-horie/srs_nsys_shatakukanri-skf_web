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
  .ui-jqgrid .ui-jqgrid-htable th div {
		display:table-cell;
	    height: 32px;
		text-align:center;
		vertical-align:middle;
	}

	/* データ行の改行許容 */
	#shainList tr td{
		white-space:normal;
	}
</style>

<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		// 検索ボタンをクリックした時の処理
		$("#search").click(function() {
			// 警告文表示を削除
			$(".imui-box-caution").hide();
			var grid = $("#popShainList");
			var map = new Object();
			map['popShainNo'] = $("#popShainNo").val();
			map['popName'] = $("#popName").val();
			map['popNameKk'] = $("#popNameKk").val();
			map['popAgency'] = $("#popAgency").val();
			map['shatakuKanriNo'] = $("#shatakuKanriNo").val();
			if (map['shatakuKanriNo'] == null) {
				map['shatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
			}
			// 非同期で検索処理を実行
			nfw.common.doAjaxAction("skf/Skf2010Sc001/SearchAsync", map, true, function(data) {
				// 現在のリストテーブルの内容を初期化
	    		grid.clearGridData();
				// リストテーブルのデータをセット
				grid.jqGrid('setGridParam', {data:data.popListTableList});
				// リストテーブルをリロード
				grid.trigger("reloadGrid");
	    	});
		});
		
		$("#selectBtn").click (function() {
			var rowId = $("#targetRowId").val();
			if (rowId == null || rowId == "") {
				nfw.common.showReserveMessage("warning", "選択してください");
				return;
			}
			
			var grid = $("#popShainList");
	        var rowData = grid.getRowData(rowId);

	        var insertFormName = $("#insertFormName").val();
	        
	        $("#shainNo").val(rowData.shainNo);
	        $("#" + insertFormName).val(rowData.name);
	        nfw.common.modalPopupClose(this);
		});

		$("#closeBtn").click(function() {
			nfw.common.modalPopupClose(this);
		});
	});
	
    // リストテーブルの確認欄のアイコンをクリックした時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
    	$("#targetRowId").val(rowId);
    }
});
</script>
<div id="imui-container" style="width:650px;min-width:650px;max-width: 650px;">
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="550px" style="width:100%; min-width:550px;max-width: 550px; margin-left: 10px;">
<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
	<nfwui:Title code="<%= MessageIdConstant.SKF2010_SC001_SEARCH_TITLE %>" titleLevel="2" />
	<nfwui:Form id="searchForm" name="searchForm" modelAttribute="form" >
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2010_SC001_SHAIN_NO %>" />
					</th>
					<td style="width: 10%;">
					    <imui:textbox id="popShainNo" name="popShainNo" style="width:260px;" value="${form.popShainNo}" />
					</td>
				</tr>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2010_SC001_NAME %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="popName" name="popName" style="width:260px;" value="${form.popName}" />
					</td>
				</tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblNameKk" code="<%= MessageIdConstant.SKF2010_SC001_NAME_KK %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="popNameKk" name="popNameKk" style="width:260px;" value="${form.popNameKk}" />
					</td>
				</tr>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblGenShozoku" code="<%= MessageIdConstant.SKF2010_SC001_AGENCY %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="popAgency" name="popAgency" style="width:260px;" value="${form.popAgency}" />
					</td>
				</tr>

			</tbody>
		</nfwui:Table>
	</nfwui:Form>
	<div class="align-L">	
	    <imui:button id="search" name="search" value="検索"
	    class="imui-small-button" url="skf/Skf2010Sc001/Search"
	    formId="searchForm" />
	</div>
<br>
			<!-- 明細＆細目未満 -->
	<!-- 明細部 -->
	<nfwui:Form id="sampleList1" name="sampleList1" modelAttribute="form" secureToken="false">
	    <nfwui:Title code="<%= MessageIdConstant.SKF2010_SC001_SEARCH_RESULT %>" titleLevel="2" />
		<script type="text/javascript">
			(function($){
			$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			})(jQuery);
		</script>

		<imui:listTable id="popShainList" name="popShainList"
		data="${form.popListTableList}" onCellSelect="onCellSelect"
		width="550" height="200" multiSelect="false">
		<pager rowNum="1000" />
		<cols>
		  <col name="shainNo" width="100" sortable="false" caption="社員番号" />
		  <col name="name" width="200" sortable="false" caption="氏名" />
		  <col name="agency" width="255" sortable="false" caption="現所属" />
		</cols>
		</imui:listTable>
	</nfwui:Form>
	<br>
<div class="align-R">
	<imui:button id="closeBtn" name="closeBtn" value="画面を閉じる" style="width:100px;" class="imui-small-button" />
	<imui:button id="selectBtn" name="selectBtn" value="選択" style="width:100px;" class="imui-small-button" />
	<!--<input style="width:100px;" id="" type="button" value="キャンセル" class="imui-small-button"  onclick="window.close()"/>-->
	<input type="hidden" id="targetRowId" value="" />
</div>
</div>
</div>
	<!-- コンテンツエリア　ここまで -->