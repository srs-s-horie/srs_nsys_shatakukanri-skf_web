<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.skf2040.app.skf2040sc002.Skf2040Sc002Form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
<link rel="stylesheet" type="text/css" href="styles/skf/theme.css" />

<%  Skf2040Sc002Form form = (Skf2040Sc002Form)request.getAttribute("form"); %>


<!-- フッターエリア CSS-->
<style type="text/css">
	div.btnLeft{
	    text-align: left;
	    float: left;
	}

	div.btnRight{
    	text-align: right;
	}
}
</style>


<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 95%; max-width: 1350px;">
	<!-- 状況、資料ヘッダ -->
	<nfwui:Form id="form" name="form" modelAttribute="form">
	<!-- 添付資料表示あり -->
	<imart:condition validity="${form.tenpViewFlg}" >
		<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;border:none;" height="100px">
			<table class="imui-form-search-condition">
				<tr>
					<th width="100px">
						<nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC006_LBL_APPL_STATUS %>" />
					</th>
					<td width="100px">
						<label>${f:h(form.applStatusText) }</label>
					</td>
					<th width="100px">
						<nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2040_SC002_LBL_ATTACHED_FILE %>" />
					</th>
					<td>
						<div id="attachedFileAreaDiv">
							<c:forEach var="obj" items="${form.attachedFileList}">
								<a id="attached_${obj.attachedNo}">${obj.attachedName }</a>&nbsp;
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</imart:condition>
	<!-- 添付資料表示なし -->
	<imart:condition validity="${form.tenpViewFlg}" negative>
	<div class="imui-form-container-wide" width="300px" style="width: 90%; max-width: 300px;border:none;margin: 0px;" height="100px">
		<!--  <div style="max-width: 300px;margin: 0px;">-->
			<table class="imui-form-search-condition">
			   <tr>
			   	<th style="width: 5%;">
			   		<nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2030_SC002_APPL_STATUS %>" />
			   	</th>
				<td style="width: 10%;">
					<label>${f:h(form.applStatusText) }</label>
				</td>
			  </tr>
			</table>
		</div>
	</imart:condition>
	<!-- アコーディオンエリア -->
	<!-- 退居届-->
	<imart:condition validity="${form.taikyoViewFlg}">
		<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
			<nfwui:Accordion id="taikyoPdfViewFlg" >
				<nfwui:AccordionItem id="taikyoItem" code="<%= MessageIdConstant.SKF2040_SC002_TAIKYO %>" defaultOpen="${form.levelOpen }">
					<%@ include file="../skf2010/common/Skf2010TaikyoTodoke.jsp" %>
				</nfwui:AccordionItem>
			</nfwui:Accordion>
		</div>
	</imart:condition>
	<!-- 備品表示欄-->
	<imart:condition validity="${form.henkyakuInfoViewFlg}">	
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<%@ include file="skf2040common/Skf2040Sc002HenkyakuBihin.jsp" %>
	</div>
	</imart:condition>		
	<!-- コメント欄 -->
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
		<div class="imui-chapter-title" style="margin-bottom: 10px;">
			<h2>コメント</h2>
		</div>
		<!-- 承認者から申請者へ-->
		<table class="imui-form-search-condition">
			<tr　style="width: 100%; max-width: 1000px;text-align:center;">
				<th style="width: 200px; max-width: 200px;">
					<nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2040_SC002_COMMENT %>" />
				</th>
				<td>
					<imui:textArea id="commentNote" name="commentNote" value="${form.commentNote }" style="height:50px;width:100%; ime-mode:active;" placeholder="例 添付資料が間違っています。" />
				</td>
			</tr>
		</table>
	</div>
	<br>
    <nfwui:Hidden id="applNo" name="applNo" />
    <nfwui:Hidden id="applId" name="applId" value="${form.applId}"/>
	<nfwui:Hidden id="shainNo" name="shainNo" />
	<nfwui:Hidden id="applUpdateDate" name="applUpdateDate" />
	<nfwui:Hidden id="prePageId" name="prePageId" value="${form.prePageId}" />
	<nfwui:Hidden id="hdnBihinHenkyakuApplNo" name="hdnBihinHenkyakuApplNo" value="${form.hdnBihinHenkyakuApplNo}" />
	<input type="hidden" id="attachedNo" name="attachedNo" value="" />

<!-- フッターエリア　ボタン -->
<div class="imui-box-layout">
	<table width="100%">
		<tr>
			<!-- 左エリア -->
			<div class="btnLeft">

			</div>
			<!-- 右エリア -->
 			<div class="btnRight">
 				<!-- 修正依頼 -->
				      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn" value="修正依頼"
				       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
				       title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>"
				       message="<%= MessageIdConstant.SKF2040_SC002_REVISION_MSG %>"
				       url="skf/Skf2040Sc002/Revision" removePatterns="PTN_A,PTN_B,PTN_D,PTN_F"/>
 			</div>
 		</tr>
 		<tr>
 			<!-- 左エリア -->
 			<div class="btnLeft">
				<!-- 前の画面へ -->
 				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" />
		 		<!-- 退居届PDFダウンロード -->
				<imart:condition validity="${form.taikyoPdfViewFlg}">
					<input name="doDelRow1" id="doDelRow1" type="button" value="退居（自動車の保管場所変換）届PDF出力" class="imui-medium-button" onclick="onClickOutputPdfR0103()" />
				</imart:condition>
				<!-- コメントボタン -->
				<imart:condition validity="${form.commentViewFlg}">
					<nfwui:PopupButton id="commentPop" value="コメント表示" 
					cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
					modalMode="false" popupWidth="1350" popupHeight="488"
					parameter="applNo:applNo"
					screenUrl="skf/Skf2010Sc010/init" use="popup" />
				</imart:condition>
 			</div>
 			<!-- 右エリア -->
 			<div id="dCheck1" class="btnRight">
 					<!-- 資料を添付 -->
						<nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
						cssClass="imui-medium-button" cssStyle="width: 150px" 
						use="popup" popupWidth="780" popupHeight="700"
						parameter="applNo:popApplNo,applId:popApplId" modalMode="true" 
						screenUrl="skf/Skf2010Sc009/init" formId="form" removePatterns="PTN_A,PTN_B,PTN_D,PTN_F"
						callbackFunc="updateAttachedFileArea" />
					<!-- 差戻しボタン -->
						<nfwui:ConfirmButton id="remandBtn" name="remandBtn" value="差戻し"
						cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
						title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>"
						message="<%= MessageIdConstant.SKF2040_SC002_REMAND_MSG %>"
						removePatterns="PTN_A,PTN_B,PTN_D,PTN_F"
						url="skf/Skf2040Sc002/Remand"/>
					<!-- 提示ボタン --> 							
						<nfwui:ConfirmButton id="presentBtn" name="presentBtn" value="提示"
						cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
						title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>"
						message="<%= MessageIdConstant.I_SKF_2011 %>"
						removePatterns="PTN_B,PTN_E,PTN_F"
						url="skf/Skf2040Sc002/Present" disabled="${form.btnPresentDisabeld}"/>															
					<!-- 承認ボタン -->
						<nfwui:ConfirmButton id="approveBtn" name="approveBtn"
							value="承認" cssClass="imui-medium-button check" cssStyle="width: 150px" 
							title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
							url="skf/Skf2040Sc002/Approval" formId="form" 
							removePatterns="PTN_A,PTN_C,PTN_D,PTN_F"
							disabled="${form.btnApproveDisabled}"/>
							
 			</div>
 		</tr>	
 	</table>
	</nfwui:Form>
</div>	
<script type="text/javascript">
// 前の画面に戻る
function back1() {
	var url="skf/Skf2010Sc005/init"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

$(function() {
	$(document).ready(function(){
		// 添付資料のリンクをクリックした時のイベント
		$("a[id*='attached_']").click(function(){
			attachedFileDownload(this);
		});
	});
	
	// 添付ファイルリンクからのファイルダウンロード処理
	attachedFileDownload = function(obj) {
		var id = $(obj).attr("id");
		var url = "skf/Skf2040Sc002/Download";
		var attachedNo = id.replace(/\attached_/, '');
		
		$("#attachedNo").val(attachedNo);
		$("#form").attr("action", url);
		$("#form").submit();
	}
	
	// 添付資料設定時に上部表示エリアに追記する処理
	updateAttachedFileArea = function () {
		var map = new Object();
		map['applNo'] = $("#applNo").val();
		nfw.common.doAjaxAction("skf/Skf2040Sc002/AttachedFileAreaAsync", map, true, function(res){
			$("#attachedFileAreaDiv").html(res.attachedFileArea);
			
			// 追記したリンクにはファイルダウンロード機能が無いため追加
			$("a[id*='attached_']").bind("click", function(){
				attachedFileDownload(this);
			});
		});
	}
	
    //「退居（自動車の保管場所返還）届」ボタン押下時のイベント
    onClickOutputPdfR0103 = function () {
    	nfw.common.submitForm("form", "skf/Skf2040Sc002/OutputPdfR0103");
    }
});
</script>
