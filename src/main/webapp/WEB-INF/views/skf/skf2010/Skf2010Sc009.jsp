<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<style>
   /* データ行の改行許容 */
#attachedFileList tr td{
	white-space:normal;
}
</style>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>

	<div id="imui-container" style="width:750px;min-width:750px;max-width: 1000px;">
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="650px" style="width:100%; min-width:650px;max-width: 650px;">
			<div class="imui-chapter-title"><nfwui:Title code="<%= MessageIdConstant.SKF2010_SC009_LBL_ATTACHED_FILE_SELECT %>" level="2" /></div>
			<div style="height:75px">１、<font color="green">「参照」</font>をクリックし、添付資料を選択してください。<br>
			２、選択後、<font color="green">「申請書類に添付」</font>をクリックしてください。<br>
			３．添付書類の登録終了後、<font color="green">「画面を閉じる」</font>をクリックすると、<br>　　申請画面に戻ります。</div>
				<nfwui:Form id="form" name="form" enctype="multipart/form-data" modelAttribute="form"  >
				  <nfwui:Hidden id="applNo" name="applNo" />
				  <nfwui:Hidden id="applId" name="applId" />
				  <nfwui:Hidden id="candidateNo" name="candidateNo" />
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th style="width: 3%;">
									<nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC009_LBL_APPL_NAME %>" />
								</th>
								<td style="width: 10%;">
									${f:h(form.applName)}
								</td>
							</tr>
							<tr>
								<th style="width: 3%;">
									<nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC009_LBL_ATTACHED_FILE_SEARCH %>" />
								</th>
								<td style="width: 10%;">
								  <nfwui:FileBox id="attachedFile" name="attachedFile" cssStyle="width:340px" />　　<nfwui:Button id="addFile" name="addFile" cssClass="imui-small-button" formId="form" url="skf/Skf2010Sc009/Add" value="申請書類に添付" />
								</td>
							</tr>

						</tbody>
					</table>
				</nfwui:Form>
				
<br>
			<!-- 明細＆細目未満 -->
				<!-- 明細部 -->
				<nfwui:Form id="listForm" name="listForm" enctype="multipart/form-data" modelAttribute="form"  >
				  <input type="hidden" id="attachedName" name="attachedName" value="" />
				  <input type="hidden" id="attachedNo" name="attachedNo" value="" />
					<div class="imui-chapter-title"><nfwui:Title code="<%= MessageIdConstant.SKF2010_SC009_LBL_ATTACHED_FILE_LIST %>" level="2" /></div>
					<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						})(jQuery);
					</script>
					<script type="text/javascript">
						(function($) {
							
						    // リストテーブルの確認欄のアイコンをクリックした時のイベント
						    onCellSelect = function(rowId, iCol, cellContent, e) {
						    	if ($(cellContent).hasClass('im-ui-icon-menu-24-document')
						    			|| $(cellContent).hasClass('im-ui-icon-common-24-trashbox')) {
						    		var grid = $("#attachedFileList");
						    		var rowData = grid.getRowData(rowId);
						    		
						    		var attachedName = rowData.attachedName;
						    		var attachedNo = rowData.attachedNo;
						    		$("#attachedName").val(attachedName);
						    		$("#attachedNo").val(attachedNo);
						    		
						    		var submitUrl = "skf/Skf2010Sc009/";
						    		if ($(cellContent).hasClass('im-ui-icon-menu-24-document')) {
										submitUrl = submitUrl + "download";
						    		} else {
						    			submitUrl = submitUrl + "delete";
						    		}
						    		
						    		$("#listForm").attr("action", submitUrl);
						    		$("#listForm").submit();
						    		
						    	}
						    }
						    
						    $("#closeBtn").click(function(){
						    	//window.opener.updateAttachedFileArea();
						    	var func = new Function('data','window.opener.updateAttachedFileArea("1")');
						    	func("1");
						    	window.open('about:blank','_self').close();
						    });
						})(jQuery);
					</script>
<imui:listTable id="attachedFileList" name="attachedFileList"
data="${form.attachedFileList}"
autoResize="true" autoWidth="true"
onCellSelect="onCellSelect"
width="650" height="200"
>
<cols>
  <col name="attachedNo" hidden="true" />
  <col name="attachedName" caption="添付資料" width="225" align="left" />
  <col name="fileSize" caption="ファイルサイズ" width="100" align="left"/>
  <col name="applDate" caption="登録日時" width="200" align="left" />
　　<col name="view" caption="表示" width="50" align="center">
	<showIcon iconClass="im-ui-icon-menu-24-document" />
  </col>
　　<col name="delete" caption="削除" width="50" align="center">
	<showIcon iconClass="im-ui-icon-common-24-trashbox" />
  </col>
</cols>
</imui:listTable>

				</nfwui:Form>
				<br>
			<div class="align-R">
				<input style="width:100px;" id="close" type="button" value="画面を閉じる" class="imui-small-button"  onclick="window.opener.updateAttachedFileArea();window.close()"/>
				
			</div>
			</div>
</div>