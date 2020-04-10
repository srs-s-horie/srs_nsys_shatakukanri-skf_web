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
	
	.imui-box-warning ul li{
		display:inline;	
	}
	
	.imui-box-warning {
		width:60%;
	}
</style>
<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		// 検索ボタンをクリックした時の処理
		$("#search").click(function() {
			// 警告文表示を削除
			$(".imui-box-caution, .imui-box-warning").hide();
			var grid = $("#popOwnerInfoList");
			var map = new Object();
			map['popOwnerName'] = $("#popOwnerName").val();
			map['popOwnerNameKk'] = $("#popOwnerNameKk").val();
			map['popAddress'] = $("#popAddress").val();
			map['popBusinessKbn'] = $("#popBusinessKbn").val();
			
			// 現在のリストテーブルの内容を初期化
    		grid.clearGridData();
			// 非同期で検索処理を実行
			nfw.common.doAjaxAction("skf/Skf3070Sc004/SearchAsync", map, true, function(data) {
				// リストテーブルのデータをセット
				grid.jqGrid('setGridParam', {data:data.popListTableList});
				// リストテーブルをリロード
				grid.trigger("reloadGrid");
	    	}, this, false);
		});
		
		$("#selectBtn").click (function() {
			var rowId = $("#targetRowId").val();
			if (rowId == null || rowId == "") {
				nfw.common.setResultMessage("warning", "賃貸人（代理人）を選択してください");
				return;
			}
			
			var grid = $("#popOwnerInfoList");
	        var rowData = grid.getRowData(rowId);
	        
	        //ID名が insertFormOwnerNameのvalue値 のテキストボックスに氏名又は名称を設定
	        var insertFormOwnerName = $("#insertFormOwnerName").val();
	        $("#" + insertFormOwnerName).val(rowData.ownerName);
	        
	      //ID名が insertFormOwnerNoのvalue値 のテキストボックスに賃貸人(代理人)番号を設定
	        var insertFormOwnerNo = $("#insertFormOwnerNo").val();
	        $("#" + insertFormOwnerNo).val(rowData.ownerNo);
	        
	        nfw.common.modalPopupClose(this);
	        
	        var ownerCallbackFlag = $("#ownerCallbackFlag").val();
	        if (ownerCallbackFlag != null && ownerCallbackFlag == "true") {
	        	ownerInfoCallback();
	        }
		});

		$("#closeBtn").click(function() {
			nfw.common.modalPopupClose(this);
		});
	});
	
    // リストテーブルの確認欄のアイコンをクリックした時のイベント
    onCellSelectContract = function(rowId, iCol, cellContent, e) {
    	$("#targetRowId").val(rowId);
    }
});
</script>
<div id="imui-container" style="width:620px;min-width:620px;max-width: 620px;">
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="550px" style="width:100%; min-width:550px;max-width: 550px; margin-left: 10px;">
<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
	<nfwui:Title code="<%= MessageIdConstant.SKF3070_SC004_SEARCH_TITLE %>" titleLevel="2" />
	<nfwui:Form id="searchForm" name="searchForm" modelAttribute="form" >
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblOwnerName" code="<%= MessageIdConstant.SKF3070_SC004_OWNER_NAME %>" />
					</th>
					<td style="width: 10%;">
					    <imui:textbox id="popOwnerName" name="popShainNo" style="width:260px; ime-mode:active;" value="${form.popOwnerName}" tabIndex="3" />
					</td>
				</tr>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblOwnerNameKk" code="<%= MessageIdConstant.SKF3070_SC004_OWNER_NAME_KK %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="popOwnerNameKk" name="popName" style="width:260px; ime-mode:active;" value="${form.popOwnerNameKk}" tabIndex="4" />
					</td>
				</tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblAddress" code="<%= MessageIdConstant.SKF3070_SC004_ADDRESS %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="popAddress" name="popNameKk" style="width:260px; ime-mode:active;" value="${form.popAddress}" tabIndex="5" />
					</td>
				</tr>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblBusinessKbn" code="<%= MessageIdConstant.SKF3070_SC004_BUSINESS_KBN %>" />
					</th>
					<td style="width: 10%;">
					  <imui:select id="popBusinessKbn" name="popBusinessKbn" width="150" list="${form.popBusinessKbnList}" tabindex="6" />
					</td>
				</tr>

			</tbody>
		</nfwui:Table>
	</nfwui:Form>
	<div class="align-L">	
	    <imui:button id="search" name="search" value="検索" class="imui-small-button" tabindex="7" />
	</div>
<br>
			<!-- 明細＆細目未満 -->
	<!-- 明細部 -->
	<nfwui:Form id="sampleList1" name="sampleList1" modelAttribute="form" secureToken="false">
	    <nfwui:Title code="<%= MessageIdConstant.SKF3070_SC004_SEARCH_RESULT %>" titleLevel="2" />
	    <script type="text/javascript">
			(function($){
			$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			})(jQuery);
		</script>
		<imui:listTable id="popOwnerInfoList" name="popOwnerInfoList"
		data="${form.popListTableList}" onCellSelect="onCellSelectContract"
		width="550" height="200" multiSelect="false" autoEncode="true">
		<pager rowNum="${form.listTableMaxRowCount}"/>
		<cols>
		  <col name="ownerName" width="160" sortable="false" caption="氏名又は名称" wrap="true" sortable="false"/>
		  <col name="ownerNameKk" width="180" sortable="false" caption="氏名又は名称(フリガナ）" wrap="true" sortable="false"/>
		  <col name="businessKbn" width="90" sortable="false" caption="個人法人区分" wrap="true" sortable="false"  />
		  <col name="address" width="320" sortable="false" caption="住所" wrap="true" sortable="false"/>
		  <col name="ownerNo" caption="賃貸人(代理人)番号" hidden="true" sortable="false"  />
		</cols>
		</imui:listTable>
	</nfwui:Form>
	<script type="text/javascript">
	(function($) {
		$(document).ready(function(){
			//リストテーブルのヘッダの内容を書き換える
			$("#jqgh_popOwnerInfoList_ownerNameKk").html("氏名又は名称<br />(フリガナ）");
			$("#jqgh_popOwnerInfoList_businessKbn").html("個人法人<br />区分");
		});
	})(jQuery);	
	</script>
	<br>
<div class="align-R">
	<imui:button id="closeBtn" name="closeBtn" value="画面を閉じる" style="width:100px;" class="imui-small-button" tabindex="8" />
	<imui:button id="selectBtn" name="selectBtn" value="選択" style="width:100px;" class="imui-small-button" tabindex="9" />
	<input type="hidden" id="targetRowId" value="" />
</div>
</div>
</div>
	<!-- コンテンツエリア　ここまで -->