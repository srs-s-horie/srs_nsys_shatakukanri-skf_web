<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<script src="scripts/skf/skfCommon.js"></script>
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<style>
   /* データ行の改行許容 */
#popAttachedFileListTable tr td{
	white-space:normal;
}
</style>

<script type="text/javascript">
	(function($){
	$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
	})(jQuery);
</script>
<script type="text/javascript">
	$(function() {
		$(document).ready(function(){

			$("#addFile").click(function(){
				// 警告文表示を削除
				$(".imui-box-caution, .imui-box-warning").hide();
				
				var sendUrl = "skf/Skf2010Sc009/AddAsync";
				
				var grid = $("#popAttachedFileListTable");
				
				var file = $("#Skf2010Sc009_popup_attachedFile");
				
				if (file.prop("files")[0] == null) {
					nfw.common.showReserveMessage("error", "指定されたファイルが存在しません");
					return false;
				}
				
				var map = new Object();
				map['popApplNo'] = $("#popApplNo").val();
				map['popApplId'] = $("#popApplId").val();
				map['popCandidateNo'] = $("#popCandidateNo").val();
				map['attachedFile'] = file.prop("files")[0];
				// 非同期通信実行
				nfw.common.doAjaxAction(sendUrl, map, true, updateGrid, this, true);
			}); 
			
		    // リストテーブルの確認欄のアイコンをクリックした時のイベント
		    onCellSelectAttachedFile = function(rowId, iCol, cellContent, e) {
		    	if ($(cellContent).hasClass('im-ui-icon-menu-24-document')
		    			|| $(cellContent).hasClass('im-ui-icon-common-24-trashbox')) {
		    		
		    		var grid = $("#popAttachedFileListTable");
		    		
		    		var rowData = grid.getRowData(rowId);
		    		
		    		var attachedName = rowData.attachedName;
		    		var attachedNo = rowData.attachedNo;
		    		$("#attachedName").val(attachedName);
		    		$("#popAttachedNo").val(attachedNo);
		    		
		    		var submitUrl = "skf/Skf2010Sc009/";
		    		if ($(cellContent).hasClass('im-ui-icon-menu-24-document')) {
						submitUrl = submitUrl + "Download";
						$("#listForm").prop("action", submitUrl);
						$("#listForm").submit();
		    		} else {
		    			submitUrl = submitUrl + "DeleteAsync";
		    			var map = new Object();
		    			map['popApplNo'] = $("#popApplNo").val();
						map['popApplId'] = $("#popApplId").val();
						map['popCandidateNo'] = $("#popCandidateNo").val();
		    			map['attachedName'] = attachedName;
		    			map['popAttachedNo'] = attachedNo;
		    			// 非同期通信実行
						nfw.common.doAjaxAction(submitUrl, map, true, updateGrid, this, true);
		    			
		    		}
		    		
		    	}
		    }
		});
		
	    
	    $("#closeBtn").click(function(){
	    	//window.opener.updateAttachedFileArea();
	    	try {
	    		updateAttachedFileArea("1");
	    	} catch (e) {
	    		// エラーが出た場合特に何もしない
	    	}
	    	
	    	nfw.common.modalPopupClose(this);
	    });
	    
	    updateGrid = function (data) {
	    	var grid = $("#popAttachedFileListTable");
	    	// 現在のリストテーブルの内容を初期化
    		grid.clearGridData();
			// リストテーブルのデータをセット
			grid.jqGrid('setGridParam', {data:data.popAttachedFileList});
			// リストテーブルをリロード
			grid.trigger("reloadGrid");
			
			$("#Skf2010Sc009_popup_attachedFile").val("");
			
	    }
	});
</script>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>

	<div id="imui-container" style="width:750px; height:700px; min-width:750px;max-width: 1000px;">
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="650px" style="width:100%; min-width:650px;max-width: 620px;">
			<div class="imui-chapter-title"><nfwui:Title code="<%= MessageIdConstant.SKF2010_SC009_LBL_ATTACHED_FILE_SELECT %>" level="2" /></div>
			<div style="height:75px">１、<font color="green">「参照」</font>をクリックし、添付資料を選択してください。<br>
			２、選択後、<font color="green">「申請書類に添付」</font>をクリックしてください。<br>
			３．添付書類の登録終了後、<font color="green">「画面を閉じる」</font>をクリックすると、<br>　　申請画面に戻ります。</div>
				<nfwui:Form id="popForm" name="popForm" enctype="multipart/form-data" modelAttribute="form"  secureToken="false" >
				  <input type="hidden" name="popApplNo" value="${f:h(form.popApplNo)}" />
				  <input type="hidden" name="popApplId" value="${f:h(form.popApplId)}" />
				  <input type="hidden" name="popCandidateNo" value="${f:h(form.popCandidateNo)}" />
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th style="width: 3%;">
									<nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC009_LBL_APPL_NAME %>" />
								</th>
								<td style="width: 10%;">
									${f:h(form.popApplName)}
								</td>
							</tr>
							<tr>
								<th style="width: 3%;">
									<nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC009_LBL_ATTACHED_FILE_SEARCH %>" />
								</th>
								<td style="width: 10%;">
								  <nfwui:FileBox id="attachedFile" name="attachedFile" cssStyle="width:340px" />　　<imui:button id="addFile" name="addFile" class="imui-small-button" value="申請書類に添付" />
								</td>
							</tr>

						</tbody>
					</table>
				</nfwui:Form>
				
<br>
			<!-- 明細＆細目未満 -->
				<!-- 明細部 -->
				<form id="listForm" name="listForm" enctype="multipart/form-data">
				  <input type="hidden" id="popApplId" name="popApplId" value="${f:h(form.popApplId)}" />
				  <input type="hidden" id="popCandidateNo" name="popCandidateNo" value="${f:h(form.popCandidateNo)}" />
				  <input type="hidden" id="attachedName" name="attachedName" value="" />
				  <input type="hidden" id="popAttachedNo" name="popAttachedNo" value="" />
					<div class="imui-chapter-title"><nfwui:Title code="<%= MessageIdConstant.SKF2010_SC009_LBL_ATTACHED_FILE_LIST %>" level="2" /></div>
					
<imui:listTable id="popAttachedFileListTable" name="popAttachedFileListTable"
data="${form.popAttachedFileList}"
multiSelect="false"
onCellSelect="onCellSelectAttachedFile"
width="650" height="200"
>
<pager rowNum="10" />
<cols>
  <col name="attachedNo" hidden="true" />
  <col name="attachedName" sortable="false" caption="添付資料" width="225" align="left" />
  <col name="fileSize" sortable="false" caption="ファイルサイズ" width="100" align="right"/>
  <col name="applDate" sortable="false" caption="登録日時" width="200" align="left" />
　　<col name="view" sortable="false" caption="表示" width="50" align="center">
	<showIcon iconClass="im-ui-icon-menu-24-document" />
  </col>
　　<col name="delete" caption="削除" width="50" align="center">
	<showIcon iconClass="im-ui-icon-common-24-trashbox" />
  </col>
</cols>
</imui:listTable>

				</form>
				<br>
			<div class="align-R">
				<imui:button id="closeBtn" value="画面を閉じる" class="imui-small-button" style="width:100px;" />
				
			</div>
			</div>
</div>