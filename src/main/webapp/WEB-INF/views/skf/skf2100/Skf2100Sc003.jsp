<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.skf2100.app.skf2100sc003.Skf2100Sc003Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2100Sc003Form form = (Skf2100Sc003Form)request.getAttribute("form"); %>

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
		
		$('#faultFlag').bind('click', function(){
			if(this.checked){
				// チェックされている
				$("#hdnChkFaultSelect").val("true");
			} else {
				// チェックされていない
				$("#hdnChkFaultSelect").val(null);
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
	$(function() {

		
		$(document).ready(function() {
			
			// 取下げボタンクリックイベント
			$("#btnCancel").click(function(){
				var dialogTitle = "確認";
				var dialogMessage = "申請書を取下げします。よろしいですか？";
				var url = "skf/Skf2100Sc003/cancel";
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
			});
				
				
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
    		$("input:text").prop("disabled", true);
    		$("select").prop("disabled", true);
    		$("input:radio").prop("disabled", true);
</imart:condition>

		});
		
	});

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
<nfwui:Hidden id="hdnRouterKanriId" name="hdnRouterKanriId" />		
<!-- 補足ファイル -->
<input type="hidden" id="attachedNo" name="attachedNo" value="" />
<input type="hidden" name="fileNo" id="fileNo"/>
<input type="hidden" name="hosokuType" id="hosokuType"/>
<input type="hidden" name="hdnHosoku" id="sendHosokuType"/>
<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo"/>
<input type="hidden" id="hdnChkFaultSelect" name="hdnChkFaultSelect" value="${form.hdnChkFaultSelect}" />
			

<!-- コンテンツエリア -->
<div style="max-width: 300px; margin-left:3%; margin-top:-7px;">
	<table class="imui-form-search-condition">
		<tr>
		<th style="width: 10%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2100_SC003_APPL_STATUS %>" /></th>
		<td style="width: 10%;"><label>${f:h(form.applStatusText) }</label></td>
	</tr>
	</table>
</div>
<table class="imui-form-search-condition">
<tbody>
<tr>
	<td style="width: 70%; border: none;background-color: #fdfdff;">
	<!-- 左側の入力域の部分 -->
		<div class="imui-form-container-wide" style="margin-top: 0px; margin-bottom: 10px;">
			<table class="imui-form-search-condition">
				<nfwui:Title id="ttlBihinKibo" code="<%= MessageIdConstant.SKF2100_SC003_APPL_TITLE %>" titleLevel="2" />
				<tbody>
					<tr>
						<th rowspan="3" style="width: 20%;">
							<nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2100_SC003_SHOZOKU %>" />
						</th>
						<th colspan="2" style="width: 15%;">
							<nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2100_SC003_AGENCY %>" />
						</th>
						<td colspan="3">
							<label id="agency" name="agency">${f:h(form.agency) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2100_SC003_AFFILIATION1 %>" />
						</th>
						<td colspan="3">
							<label id="affiliation1" name="affiliation1">${f:h(form.affiliation1) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2100_SC003_AFFILIATION2 %>" />
						</th>
						<td colspan="3">
							<label id="affiliation2" name="affiliation2">${f:h(form.affiliation2) }</label>
						</td>
					</tr>
					<tr>
						<th rowspan="3">
							<nfwui:LabelBox id="lblApplicant" code="<%= MessageIdConstant.SKF2100_SC003_APPLICANT %>" />
						</th>
						<th colspan="2">
							<nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2100_SC003_SHAIN_NO %>" />
						</th>
						<td colspan="3">
							<label id="shainNo" name="shainNo">${f:h(form.shainNo) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblShainName" code="<%= MessageIdConstant.SKF2100_SC003_SHAIN_NAME %>" />
						</th>
						<td colspan="3">
							<label id="name" name="name">${f:h(form.name) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2100_SC003_TEL %>" />
						</th>
						<td colspan="3">
						<imart:condition validity="<%= String.valueOf(form.isLastUseDayEditFlag()) %>" >
							<imui:textbox id="tel" name="tel" style="ime-mode: disabled;width:200px;"
								maxlength="13" value="${form.tel}" tabindex="3" oninput="value = value.replace(/[^0-9-]+/i,'');"
								class="${form.telErr}" placeholder="例 090-0000-0000"/>
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isLastUseDayEditFlag()) %>" negative>
							<label id="tel" name="tel">${f:h(form.tel) }</label>
						</imart:condition>
						</td>
					</tr>
					<tr>
						<th rowspan="4">
							<nfwui:LabelBox id="lblRouterInfo" code="<%= MessageIdConstant.SKF2100_SC003_ROUTER_INFO %>" />
						</th>
						<th colspan="2">
							<nfwui:LabelBox id="lblRouterNo" code="<%= MessageIdConstant.SKF2100_SC003_ROUTER_NO %>" />
						</th>
						<td colspan="3">
							<label id="mobileRouterNo" name="mobileRouterNo">${f:h(form.mobileRouterNo) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblIccid" code="<%= MessageIdConstant.SKF2100_SC003_ICCID %>" />
						</th>
						<td colspan="3">
							<label id="iccid" name="iccid">${f:h(form.iccid) }</label>
						</td>
					</tr>	
					</tr>		
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblImei" code="<%= MessageIdConstant.SKF2100_SC003_IMEI %>" />
						</th>
						<td colspan="3">
							<label id="imei" name="imei">${f:h(form.imei) }</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<nfwui:LabelBox id="lblStatus" code="<%= MessageIdConstant.SKF2100_SC003_STATUS %>" />
						</td>
						<td colspan="3">
							<imui:checkbox id="faultFlag" name="faultFlag" value="1" 
								checked="${form.hdnChkFaultSelect }" disabled="${form.faultFlagDisabled }" tabindex="4"/>故障
						</td>
					</tr>
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblLastUserDay" code="<%= MessageIdConstant.SKF2100_SC003_LAST_USE_DAY %>" />
						</th>
						<td colspan="3">
						<imart:condition validity="<%= String.valueOf(form.isLastUseDayEditFlag()) %>" >
							<nfwui:DateBox id="lastUseDay" name="lastUseDay" value="${f:h(form.lastUseDay)}"
							 cssStyle="width:180px" cssClass="${form.lastUseDayErr }" tabindex="5"/>
						</imart:condition>
						<imart:condition validity="<%= String.valueOf(form.isLastUseDayEditFlag()) %>" negative>
							<label id="lastUseDaylbl" name="lastUseDaylbl">${f:h(form.lastUseDaylbl) }</label>
						</imart:condition>
							
						</td>
					</tr>
					<imart:condition validity="<%= String.valueOf(form.isRouterInfoViewFlag()) %>" >
					<tr>
						<th colspan="3">
							<nfwui:LabelBox id="lblReturnDay" code="<%= MessageIdConstant.SKF2100_SC003_RETURN_DAY %>" />
						</th>
						<td colspan="3">
							<label id="returnDaylbl" name="returnDaylbl">${f:h(form.returnDaylbl) }</label>
						</td>
					</tr>
					</imart:condition>
					<tr style="border:none">
						<td style="border:none"></td>
					</tr>
					<tr>
					<imart:condition validity="<%= String.valueOf(form.isCommentInputFlag()) %>" >
						<th colspan="1">
							<nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2100_SC003_COMMENT %>" />
						</th>
						<td colspan="5">
							<imui:textArea id="commentNote" name="commentNote" rows="4" placeholder="例  承認者へのコメント" 
							style="width: 98%; ime-mode:active;" value="${form.commentNote}" tabindex="6"></imui:textArea>
						</td>
					</imart:condition>
					</tr>
				</tbody>
			</table>
				<nfwui:LabelBox id="lblNotesText" code="<%= MessageIdConstant.SKF2100_SC003_NOTES_TEXT %>" />
		</div>
	</td>
                    
	<td style="width: 30%; border: none; background-color: #fdfdff;">
		<table >
		<!-- 右側の操作ガイドの部分 -->
		<div class="imui-form-container-wide" style="margin-top: 0px;" >
			<nfwui:Title id="titOperationGuide" code="<%= MessageIdConstant.SKF2100_SC003_GUIDE %>" titleLevel="2" />
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
<div class="align-L ">
      <imui:button class="imui-medium-button check" id="backBtn" name="backBtn" value="前の画面へ" style="width:150px;" tabindex="7" onclick="back1()" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
    <nfwui:PopupButton id="commentPop" value="コメント表示" 
    cssClass="imui-medium-button" style="width:150px;"
    modalMode="false" popupWidth="1350" popupHeight="488"
    parameter="applNo:applNo" formId="form" tabindex="12"
    screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</div> 
</imart:condition>

<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>" negative>

<div class="align-R">
           <nfwui:Button id="saveBtn" name="saveBtn" value="一時保存" disabled="${form.btnSaveDisabled}" tabindex="9"
           cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
           url="skf/Skf2100Sc003/Save" removePatterns="ST01" />
</div> 
<div class="align-L float-L">
<imui:button class="imui-medium-button check" id="backBtn" name="backBtn" value="前の画面へ" style="width:150px; margin-top:5px;" tabindex="7" onclick="back1()" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="488"
          parameter="applNo:applNo" formId="form" tabindex="15"
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
			 formID="form" cssClass="imui-medium-button" 
			 url="skf/Skf2100Sc003/Download" tabindex="8"/> 

		<nfwui:ConfirmButton id="applyBtn" name="applyBtn" value="申請" disabled="${form.btnApplicationDisabled}"
			cssClass="imui-medium-button check" cssStyle="width:150px; margin-top:5px;" formId="form"
			title="<%= MessageIdConstant.SKF2100_CONFIRM_TITLE %>"
			message="<%= MessageIdConstant.I_SKF_2003 %>" tabindex="10"
			url="skf/Skf2100Sc003/Apply" removePatterns="ST01" />
	</imart:condition>
	<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
		<imui:button class="imui-medium-button check" id="btnCancel" name="btnCancel" 
		value="取下げ" disabled="${form.btnCancelDisabled}" tabindex="11" style="width:150px;" />
	</imart:condition>
</div> 
</imart:condition>

</nfwui:Form>

</div>

<!-- コンテンツエリア　ここまで -->