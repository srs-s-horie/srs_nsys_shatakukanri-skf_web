<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.skf2100.app.skf2100sc001.Skf2100Sc001Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2100Sc001Form form = (Skf2100Sc001Form)request.getAttribute("form"); %>

<% //コメントボタンCSSを読み込み %>
<link href="styles/skf/CommentBtnStyle.css" rel="stylesheet" type="text/css">

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->

<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".imui-toolbar-icon").removeAttr("onclick");
		$(".imui-toolbar-icon").click(function(e) {
			back1("toolbar");
		});
		
		
		$('#bodyReceiptCheckFlag').bind('click', function(){
			if(this.checked){
				// チェックされている
				$("#hdnBodyReceiptChecked").val("true");
			} else {
				// チェックされていない
				$("#hdnBodyReceiptChecked").val(null);
			}
		});
		
		$('#handbookReceiptCheckFlag').bind('click', function(){
			if(this.checked){
				// チェックされている
				$("#hdnHandbookReceiptChecked").val("true");
				$("#handbookReceiptCheckFlag").val("1");
			} else {
				// チェックされていない
				$("#hdnHandbookReceiptChecked").val(null);
				$("#handbookReceiptCheckFlag").val(null);
			}
		});
		
		$('#materialsReceivedCheckFlag').bind('click', function(){
			if(this.checked){
				// チェックされている
				$("#hdnMaterialsReceivedChecked").val("true");
			} else {
				// チェックされていない
				$("#hdnMaterialsReceivedChecked").val(null);
			}
		});
	});
    /**
     * 一つ前の画面へ戻る
     */
    function back1(btnType) {
		var message = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。";
    	if (btnType == "toolbar") {
    		message = "戻ります。よろしいですか？";
		}
    	var url="${form.backUrl}";
    	nfw.common.confirmPopup(message
    			, "戻る確認"
    			, "form"
    			, url
    			, "OK"
    			, "キャンセル"
    			, this
    			, false);
    }
</script>

    <!-- コンテンツエリア -->
<div class="imui-form-container-wide" style="padding-top:2px;">
<div style="margin: 0px;">
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
<br>
</div>
<nfwui:Form id="form" name="form" modelAttribute="form">
<nfwui:Hidden id="applNo" name="applNo" />
<nfwui:Hidden id="applId" name="applId" />
<nfwui:Hidden id="applStatus" name="applStatus" />
<nfwui:Hidden id="hdnShainNo" name="hdnShainNo" />
<nfwui:Hidden id="prePageId" name="prePageId" />
<nfwui:Hidden id="userId" name="userId" />
<!-- 補足ファイル -->
<input type="hidden" id="attachedNo" name="attachedNo" value="" />
<input type="hidden" name="fileNo" id="fileNo"/>
<input type="hidden" name="hosokuType" id="hosokuType"/>
<input type="hidden" name="hdnHosoku" id="sendHosokuType"/>
<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo"/>
<input type="hidden" id="bihinCheckFlag" name="bihinCheckFlag" value="false" />
<input type="hidden" id="hdnBodyReceiptChecked" name="hdnBodyReceiptChecked" value="${form.hdnBodyReceiptChecked}" />
<input type="hidden" id="hdnHandbookReceiptChecked" name="hdnHandbookReceiptChecked" value="${form.hdnHandbookReceiptChecked}" />
<input type="hidden" id="hdnMaterialsReceivedChecked" name="hdnMaterialsReceivedChecked" value="${form.hdnMaterialsReceivedChecked}" />
<!-- コンテンツエリア -->
<imart:condition validity="<%= String.valueOf(form.isRouterInfoViewFlag()) %>" >
<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;border:none; margin-left:3%; padding:0px;">
	<table class="imui-form-search-condition">
		<tr>
		<th width="100px"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2100_SC001_APPL_STATUS %>" /></th>
		<td width="100px"><label>${f:h(form.applStatusText) }</label></td>
		<th width="100px"><nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2100_SC001_ATTACHED_FILE %>" /></th>
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
<imart:condition validity="<%= String.valueOf(form.isRouterInfoViewFlag()) %>" negative>
<div class="imui-form-container-wide" width="300px" style="width: 90%; max-width: 300px;border:none; margin-left:3%; padding:0px;" height="100px">
	<table class="imui-form-search-condition">
		<tr>
		<th width="100px"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2100_SC001_APPL_STATUS %>" /></th>
		<td width="100px"><label>${f:h(form.applStatusText) }</label></td>
	</tr>
	</table>
</div>
</imart:condition>
<table class="imui-form-search-condition">
<tbody>
<tr>
	<td style="width: 70%; border: none;background-color: #fdfdff;">
	<!-- 左側の入力域の部分 -->
		<div class="imui-form-container-wide" style="margin-top: 0px; margin-bottom: 10px;">
			<table class="imui-form-search-condition">
				<nfwui:Title id="ttlBihinKibo" code="<%= MessageIdConstant.SKF2100_SC001_APPL_TITLE %>" titleLevel="2" />
				<tbody>
					<tr>
						<th rowspan="5" style="width: 15%;">
							<nfwui:LabelBox id="lblApplicant" code="<%= MessageIdConstant.SKF2100_SC001_APPLICANT %>" />
						</th>
						<th colspan="3" style="width: 15%;">
							<nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2100_SC001_AGENCY %>" />
						</th>
						<td colspan="2">
							<label id="agency" name="agency">${f:h(form.agency) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2100_SC001_AFFILIATION1 %>" />
						</th>
						<td colspan="2">
							<label id="affiliation1" name="affiliation1">${f:h(form.affiliation1) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2100_SC001_AFFILIATION2 %>" />
						</th>
						<td colspan="2">
							<label id="affiliation2" name="affiliation2">${f:h(form.affiliation2) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2100_SC001_SHAIN_NO %>" />
						</th>
						<td colspan="2">
							<label id="shainNo" name="shainNo">${f:h(form.shainNo) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblShainName" code="<%= MessageIdConstant.SKF2100_SC001_SHAIN_NAME %>" />
						</th>
						<td colspan="2">
							<label id="name" name="name">${f:h(form.name) }</label>
						</td>
					</tr>
					<tr>
						<th rowspan="3">
							<nfwui:LabelBox id="lblShinseiInfo" code="<%= MessageIdConstant.SKF2100_SC001_SHISEI_INFO %>" /></th>
						<th colspan="3">
							<nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2100_SC001_TEL %>" />
						</th>
						<td colspan="2">
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" >
							<imui:textbox id="tel" name="tel" style="ime-mode: disabled;width:200px;"
								maxlength="13" value="${form.tel}" tabindex="3" oninput="value = value.replace(/[^0-9-]+/i,'');"
								class="${form.telErr}" placeholder="例 090-0000-0000"/>
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" negative>
							<label id="lbltel" name="lbltel">${f:h(form.tel) }</label>
						</imart:condition>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblMailAddress" code="<%= MessageIdConstant.SKF2100_SC001_MAILADDRESS %>" />
						</th>
						<td colspan="2">
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" >
							<imui:textbox id="mailAddress" name="mailAddress" style="ime-mode: disabled;width:200px;"
								maxlength="255" value="${form.mailAddress}" tabindex="4" 
								class="${form.mailAddressErr}" placeholder="例 xxxxx@c-nexco.co.jp"/>
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" negative>
							<label id="mailAddress" name="mailAddress">${f:h(form.mailAddress) }</label>
						</imart:condition>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblUseStartDay" code="<%= MessageIdConstant.SKF2100_SC001_USE_START_DAY %>" />
						</th>
						<td colspan="2">
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" >
							<nfwui:DateBox id="useStartHopeDay" name="useStartHopeDay" value="${f:h(form.useStartHopeDay)}"
							 cssStyle="width:180px" cssClass="${form.useStartHopeDayErr }" tabindex="5"/>
							 <nfwui:LabelBox id="lblHopeDayText" code="<%= MessageIdConstant.SKF2100_SC001_USE_START_DAY_TEXT %>" />
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" negative>
							<label id="useStartHopeDaylbl" name="useStartHopeDaylbl">${f:h(form.useStartHopeDaylbl) }</label>
						</imart:condition>
							
						</td>

					</tr>
					<tr>
						<th colspan="4">
							<nfwui:LabelBox id="lblNotes" code="<%= MessageIdConstant.SKF2100_SC001_NOTES %>" />
						</th>
						<td colspan="2">
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" >
							<nfwui:LabelBox id="lblNotesTextRed" code="<%= MessageIdConstant.SKF2100_SC001_NOTES_TEXT_RED %>" />
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isUseStartHopeDayEditFlag()) %>" negative>
							<nfwui:LabelBox id="lblNotesText" code="<%= MessageIdConstant.SKF2100_SC001_NOTES_TEXT %>" />
						</imart:condition>
							
						</td>
					</tr>
					<th colspan="4">
						<nfwui:LabelBox id="lblCompliance" code="<%= MessageIdConstant.SKF2100_SC001_COMPLIANCE %>" />
					</th>
						<td colspan="2">
							<nfwui:LabelBox id="lblComplianceText" code="<%= MessageIdConstant.SKF2100_SC001_COMPLIANCE_TEXT %>" />
						</td>
					</tr>
					<imart:condition validity="<%= String.valueOf(form.isRouterInfoViewFlag()) %>" >
					<tr>
						<th rowspan="2"  >
							<nfwui:LabelBox id="lblLendersInfo" code="<%= MessageIdConstant.SKF2100_SC001_LENDERS_INFO %>" />
						</th>
						<th colspan="3">
							<nfwui:LabelBox id="lblOriginalCompany" code="<%= MessageIdConstant.SKF2100_SC001_ORIGINAL_COMPANY %>" />
						</th>
						<td colspan="2">
							<label id="originalCompany" name="originalCompany">${f:h(form.originalCompany) }</label>
						</td>
					</tr>
					<tr>	
						<th colspan="3">
							<nfwui:LabelBox id="lblPayCompany" code="<%= MessageIdConstant.SKF2100_SC001_PAY_COMPANY %>" />
						</th>
						<td colspan="2">
							<label id="payCompany" name="payCompany">${f:h(form.payCompany) }</label>
						</td>
					</tr>	
					<tr>
						<th rowspan="4">
							<nfwui:LabelBox id="lblRouterInfo" code="<%= MessageIdConstant.SKF2100_SC001_ROUTER_INFO %>" />
						</th>
						<th colspan="3">
							<nfwui:LabelBox id="lblRouterNo" code="<%= MessageIdConstant.SKF2100_SC001_ROUTER_NO %>" />
						</th>
						<td colspan="2">
							<label id="mobileRouterNo" name="mobileRouterNo">${f:h(form.mobileRouterNo) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblIccid" code="<%= MessageIdConstant.SKF2100_SC001_ICCID %>" />
						</th>
						<td colspan="2">
							<label id="iccid" name="iccid">${f:h(form.iccid) }</label>
						</td>
					</tr>	
					</tr>		
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblImei" code="<%= MessageIdConstant.SKF2100_SC001_IMEI %>" />
						</th>
						<td colspan="2">
							<label id="imei" name="imei">${f:h(form.imei) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblShippingDate" code="<%= MessageIdConstant.SKF2100_SC001_SHIPPING_DATE %>" />
						</th>
						<td colspan="2">
							<label id="shippingDatelbl" name="shippingDatelbl">${f:h(form.shippingDatelbl) }</label>
						</td>
					</tr>		
					<tr>
						<th rowspan="1">
							<nfwui:LabelBox id="lblRouterReceived" code="<%= MessageIdConstant.SKF2100_SC001_ROUTER_RECEIVED %>" /></th>
						<th colspan="3">
							<nfwui:LabelBox id="lblReceivedDate" code="<%= MessageIdConstant.SKF2100_SC001_RECEIVED_DATE %>" />
						</th>
						<td colspan="2">
						<imart:condition validity="<%= String.valueOf(form.isStatus24Flag()) %>" negative>
							<nfwui:DateBox id="receivedDate" name="receivedDate" value="${f:h(form.receivedDate)}"
							 cssStyle="width:180px" cssClass="${form.receivedDateErr }" tabindex="6"/>
							 <nfwui:LabelBox id="lblReceivedDateText" code="<%= MessageIdConstant.SKF2100_SC001_RECEIVED_DATE_TEXT %>" />
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isStatus24Flag()) %>" >
							<label id="receivedDatelbl" name="receivedDatelbl">${f:h(form.receivedDatelbl) }</label>
						</imart:condition>
						</td>
					</tr>
					<tr style="border:none">
						<td style="border:none"></td>
					</tr>
					<tr>
						<th colspan="4"><nfwui:LabelBox id="lblItemName" code="<%= MessageIdConstant.SKF2100_SC001_ITEMNAME %>" /></th>
						<th colspan="1"><nfwui:LabelBox id="lblKosu" code="<%= MessageIdConstant.SKF2100_SC001_KOSU %>" /></th>
						<th colspan="1"><nfwui:LabelBox id="lblReceiptCheck" code="<%= MessageIdConstant.SKF2100_SC001_RECEIPT_CHECK %>" /></th>
					</tr>
					<tr>
						<th colspan="4"><nfwui:LabelBox id="lblMobileRouter" code="<%= MessageIdConstant.SKF2100_SC001_MOBILE_ROUTER %>" /></th>
						<td colspan="1">1</td>
						<td colspan="1">
							<imui:checkbox id="bodyReceiptCheckFlag" name="bodyReceiptCheckFlag" value="1" 
								checked="${form.hdnBodyReceiptChecked }" disabled="${form.bodyReceiptCheckFlagDisabled }" tabindex="7"/>
						</td>
					</tr>
					<tr>
						<th colspan="4"><nfwui:LabelBox id="lblRentalGuide" code="<%= MessageIdConstant.SKF2100_SC001_RENTAL_GUIDE %>" /></th>
						<td colspan="1">1</td>
						<td colspan="1">
							<imui:checkbox id="handbookReceiptCheckFlag" name="handbookReceiptCheckFlag" value="1" 
								checked="${form.hdnHandbookReceiptChecked }" disabled="${form.handbookReceiptCheckFlagDisabled }" tabindex="8"/>
						</td>
					</tr>	
					<tr>
						<th colspan="4"><nfwui:LabelBox id="lblReturnMaterials" code="<%= MessageIdConstant.SKF2100_SC001_RETURN_MATERIALS %>" /></th>
						<td colspan="1">1</td>
						<td colspan="1">
							<imui:checkbox id="materialsReceivedCheckFlag" name="materialsReceivedCheckFlag" value="1" 
								checked="${form.hdnMaterialsReceivedChecked }" disabled="${form.materialsReceivedCheckFlagDisabled }" tabindex="9"/>
						</td>
					</tr>
					</imart:condition>
					<tr style="border:none">
						<td style="border:none"></td>
					</tr>
					<tr>
					<imart:condition validity="<%= String.valueOf(form.isCommentInputFlag()) %>" >
						<th colspan="1">
							<nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2100_SC001_COMMENT %>" />
						</th>
						<td colspan="5">
							<imui:textArea id="commentNote" name="commentNote" rows="4" placeholder="例  承認者へのコメント" 
							style="width: 98%; ime-mode:active;" value="${form.commentNote}" tabindex="10"></imui:textArea>
						</td>
					</imart:condition>
					</tr>
				</tbody>
			</table>
		</div>
	</td>
                    
	<td style="width: 30%; border: none; background-color: #fdfdff;">
		<table >
		<!-- 右側の操作ガイドの部分 -->
		<div class="imui-form-container-wide" style="margin-top: 0px;" >
			<nfwui:Title id="titOperationGuide" code="<%= MessageIdConstant.SKF2100_SC001_GUIDE %>" titleLevel="2" />
			<div style="overflow-y:scroll;height:99%;">
				${form.operationGuide }
			</div>
		</div>

		</table>
	</td>
</tr>
</tbody>
</table>
<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>">
<div class="align-L float-L">
      <imui:button class="imui-medium-button check" id="backBtn" name="backBtn" value="前の画面へ" style="width:150px;" tabindex="11" onclick="back1()" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
    <nfwui:PopupButton id="commentPop" value="コメント表示" 
    cssClass="imui-medium-button" style="width:150px;"
    modalMode="false" popupWidth="1350" popupHeight="488"
    parameter="applNo:applNo" formId="form" tabindex="17"
    screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</div> 
<imart:condition validity="<%= String.valueOf(form.isStatus24Flag()) %>">
<div class="align-R" style="clear: both;">
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isStatus24Flag()) %>" negative>
<div class="align-R">
</imart:condition>

<imart:condition validity="<%= String.valueOf(form.isStatus24Flag()) %>" negative>
      <imui:button class="imui-medium-button check" id="btnCarryIn" name="btnCarryIn" 
        value="搬入完了" disabled="${form.btnImportFinidhedDisabled}" tabindex="15" style="width:150px;" />
</imart:condition>
</div> 
</imart:condition>

<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>" negative>

<div class="align-R">
           <nfwui:Button id="saveBtn" name="saveBtn" value="一時保存" disabled="${form.btnSaveDisabled}" tabindex="13"
           cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
           url="skf/Skf2100Sc001/Save" removePatterns="ST01,ST10" />
</div> 
<div class="align-L float-L">
<imui:button class="imui-medium-button check" id="backBtn" name="backBtn" value="前の画面へ" style="width:150px; margin-top:5px;" tabindex="11" onclick="back1()" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="488"
          parameter="applNo:applNo" formId="form" tabindex="17"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</div> 
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
<div class="align-L float-L" style="clear: both;">
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>" negative>
<div class="align-L float-L" style="clear: both;">
</imart:condition>
</div> 
<div class="align-R">
	<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>" negative>
		<nfwui:Button cssStyle="width:150px;" id="download" name="download" value="申請要件を確認" disabled="${form.btnCheckDisabled}"
			 formID="form" cssClass="imui-medium-button" url="skf/Skf2100Sc001/Download" tabindex="12"/> 

		<nfwui:ConfirmButton id="applyBtn" name="applyBtn" value="申請" disabled="${form.btnApplicationDisabled}"
			cssClass="imui-medium-button check" cssStyle="width:150px; margin-top:5px;" formId="form"
			title="<%= MessageIdConstant.SKF2100_CONFIRM_TITLE %>"
			message="<%= MessageIdConstant.I_SKF_2003 %>" tabindex="14"
			url="skf/Skf2100Sc001/Apply" removePatterns="ST01,ST20,ST24" />
	</imart:condition>
	<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
<%-- 		<imui:button class="imui-medium-button check" id="btnCancel" name="btnCancel"  --%>
<%-- 		value="取下げ" disabled="${form.btnCancelDisabled}" tabindex="16" style="width:150px;" /> --%>
		<nfwui:ConfirmButton id="cancelBtn" name="cancelBtn" value="取下げ" disabled="${form.btnApplicationDisabled}"
			cssClass="imui-medium-button check" cssStyle="width:150px; margin-top:5px;" formId="form"
			title="<%= MessageIdConstant.SKF2100_CONFIRM_TITLE %>"
			message="<%= MessageIdConstant.I_SKF_2002 %>" tabindex="16"
			url="skf/Skf2100Sc001/cancel" removePatterns="ST10,ST24" />
	</imart:condition>
</div> 
</imart:condition>


</nfwui:Form>

    </div>
<script type="text/javascript">
    (function($) {

		
		$(document).ready(function() {
			
			// 搬入完了ボタンクリックイベント
			$("#btnCarryIn").bind('click', function() {
				var dialogTitle = "確認";
				var dialogMessage = "モバイルルーターの搬入確認を完了します。よろしいですか？";
				var url = "skf/Skf2100Sc001/complete";
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
			});
			// 取下げボタンクリックイベント
			$("#btnCancel").bind('click', function() {
				var dialogTitle = "確認";
				var dialogMessage = "申請書を取下げします。よろしいですか？";
				var url = "skf/Skf2100Sc001/cancel";
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
			});
				
				

			
			// 添付資料のリンクをクリックした時のイベント
			$("a[id*='attached_']").click(function(){
				attachedFileDownload(this);
			});
				
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
    		$("input:text").prop("disabled", true);
    		$("select").prop("disabled", true);
    		$("input:radio").prop("disabled", true);
</imart:condition>

		});
		
		// 添付ファイルリンクからのファイルダウンロード処理
		attachedFileDownload = function(obj) {
			var id = $(obj).attr("id");
			var url = "skf/Skf2100Sc001/AttachedFileDownload";
			var attachedNo = id.replace(/\attached_/, '');
			
			$("#attachedNo").val(attachedNo);
			$("#form").attr("action", url);
			$("#form").submit();
		}
		
		// 添付資料設定時に上部表示エリアに追記する処理
		updateAttachedFileArea = function () {
			var map = new Object();
			map['applNo'] = $("#applNo").val();
			nfw.common.doAjaxAction("skf/Skf2100Sc001/AttachedFileAreaAsync", map, true, function(res){
				$("#attachedFileAreaDiv").html(res.attachedFileArea);
				
				// 追記したリンクにはファイルダウンロード機能が無いため追加
				$("a[id*='attached_']").bind("click", function(){
					attachedFileDownload(this);
				});
			});
		}
	})(jQuery);

</script>
  

    
	<!-- コンテンツエリア　ここまで -->