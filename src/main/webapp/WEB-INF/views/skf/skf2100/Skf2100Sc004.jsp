<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.skf2100.app.skf2100sc004.Skf2100Sc004Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2100Sc004Form form = (Skf2100Sc004Form)request.getAttribute("form"); %>
<link rel="stylesheet" type="text/css" href="styles/skf/theme.css" />
<% //コメントボタンCSSを読み込み %>
<link href="styles/skf/CommentBtnStyle.css" rel="stylesheet" type="text/css">

<%-- コンテンツエリア --%>
<script type="text/javascript">
function back1() {
	var url="skf/Skf2010Sc005/Search"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}


$(function() {
	$(document).ready(function(){
	
		$('#faultFlag').bind('click', function(){
			alert(this.checked);
			if(this.checked){
				// チェックされている
				$("#hdnChkFaultSelect").val("true");
			} else {
				// チェックされていない
				$("#hdnChkFaultSelect").val(null);
			}
		});
	});
	


});
</script>

<style type="text/css">

</style>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide">

    <!-- コンテンツエリア -->
    <div style="max-width: 300px; margin-left:3%; margin-top:-7px;">
    <table class="imui-form-search-condition">
       <tr>
            <th style="width: 10%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2100_SC004_APPL_STATUS %>" /></th>
            <td style="width: 10%;"><label>${f:h(form.applStatusText) }</label></td>
      </tr>
    </table>
    </div>
    <nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data">
      <nfwui:Hidden id="applNo" name="applNo" />
      <input type="hidden" id="hdnChkFaultSelect" name="hdnChkFaultSelect" value="${form.hdnChkFaultSelect}" />
      
        <table class="imui-form-search-condition" style="margin-top:-11px;">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        <div class="imui-form-container-wide" >
                        	<nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2100_SC004_APPL_TITLE %>" titleLevel="2" />
							<table class="imui-form-search-condition">
								<colgroup span="1" style= "width:140px;">
								<colgroup span="1" style= "width:60px;">
								<colgroup span="1" style= "width:140px;">
								<tbody>
									<tr>
										<th rowspan="3" style="width: 20%;">
											<nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2100_SC004_SHOZOKU %>" />
										</th>
										<th colspan="2" style="width: 15%;">
											<nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2100_SC004_AGENCY %>" />
										</th>
										<td colspan="3">
											<label id="agency" name="agency">${f:h(form.agency) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2100_SC004_AFFILIATION1 %>" />
										</th>
										<td colspan="3">
											<label id="affiliation1" name="affiliation1">${f:h(form.affiliation1) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2100_SC004_AFFILIATION2 %>" />
										</th>
										<td colspan="3">
											<label id="affiliation2" name="affiliation2">${f:h(form.affiliation2) }</label>
										</td>
									</tr>
									<tr>
										<th rowspan="3">
											<nfwui:LabelBox id="lblApplicant" code="<%= MessageIdConstant.SKF2100_SC004_APPLICANT %>" />
										</th>
										<th colspan="2">
											<nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2100_SC004_SHAIN_NO %>" />
										</th>
										<td colspan="3">
											<label id="shainNo" name="shainNo">${f:h(form.shainNo) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblShainName" code="<%= MessageIdConstant.SKF2100_SC004_SHAIN_NAME %>" />
										</th>
										<td colspan="3">
											<label id="name" name="name">${f:h(form.name) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2100_SC004_TEL %>" />
										</th>
										<td colspan="3">
											<label id="tel" name="tel">${f:h(form.tel) }</label>
										</td>
									</tr>
									<tr>
										<th rowspan="4">
											<nfwui:LabelBox id="lblRouterInfo" code="<%= MessageIdConstant.SKF2100_SC004_ROUTER_INFO %>" />
										</th>
										<th colspan="2">
											<nfwui:LabelBox id="lblRouterNo" code="<%= MessageIdConstant.SKF2100_SC004_ROUTER_NO %>" />
										</th>
										<td colspan="3">
											<label id="mobileRouterNo" name="mobileRouterNo">${f:h(form.mobileRouterNo) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblIccid" code="<%= MessageIdConstant.SKF2100_SC004_ICCID %>" />
										</th>
										<td colspan="3">
											<label id="iccid" name="iccid">${f:h(form.iccid) }</label>
										</td>
									</tr>	
									</tr>		
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblImei" code="<%= MessageIdConstant.SKF2100_SC004_IMEI %>" />
										</th>
										<td colspan="3">
											<label id="imei" name="imei">${f:h(form.imei) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblStatus" code="<%= MessageIdConstant.SKF2100_SC004_STATUS %>" />
										</td>
										<td colspan="3">
											<imui:checkbox id="faultFlag" name="faultFlag" value="1" 
												checked="${form.hdnChkFaultSelect }" disabled="disabled" tabindex="1"/>故障
										</td>
									</tr>
									<tr>
										<th colspan="3">
											<nfwui:LabelBox id="lblLastUserDay" code="<%= MessageIdConstant.SKF2100_SC004_LAST_USE_DAY %>" />
										</th>
										<td colspan="3">
											<label id="lastUseDaylbl" name="lastUseDaylbl">${f:h(form.lastUseDaylbl) }</label>
										</td>
									</tr>
									<imart:condition validity="<%= String.valueOf(form.isReturnDayEditFlag()) %>" negative>
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblReturnDay" code="<%= MessageIdConstant.SKF2100_SC004_RETURN_DAY %>" />
											</th>
											<td colspan="3">
												<label id="returnDaylbl" name="returnDaylbl">${f:h(form.returnDaylbl) }</label>
											</td>
										</tr>
									</imart:condition>
								</tbody>
							</table>
						</div>
<imart:condition validity="<%= String.valueOf(form.isReturnDayEditFlag()) %>" >
						<div class="imui-form-container-wide" >
						<nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2100_SC004_APPLY_INPUT %>" titleLevel="2" />
							<table class="imui-form-search-condition-blue">
								<colgroup span="1" style= "width:140px;">
								<colgroup span="1" style= "width:60px;">
								<colgroup span="1" style= "width:140px;">
								<tbody>
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblReturnDay" code="<%= MessageIdConstant.SKF2100_SC004_RETURN_DAY %>" />
											</th>
											<td colspan="3">
												<nfwui:DateBox id="returnDay" name="returnDay" value="${f:h(form.returnDay)}"
													 cssStyle="width:180px" cssClass="${form.lastUseDayErr }" tabindex="3"/>
											</td>
										</tr>
								</tbody>
							</table>
						</div>		
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isCommentInputFlag()) %>"> 
						<div class="imui-form-container-wide" >
							<table class="imui-form-search-condition">
								<colgroup span="1" style= "width:140px;">
								<tbody>
									<style type="text/css"></style>
									<tr>
	                                    <th colspan="4"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2100_SC004_COMMENT %>" /></th>
	                                    <td colspan="3" >
	                						<imui:textArea id="commentNote" name="commentNote" style="height:80px; width:98%; ime-mode:active;" 
	                						value="${form.commentNote }" placeholder="例  申請者へのコメント" disabled="${form.commentDisabled }" tabindex="4"/>
	                                    </td>
									</tr>
								</tbody>
							</table>
						</div>
</imart:condition>                           
                    </td>
                    
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                      <table >
                        <!-- 右側の操作ガイドの部分 -->
                         <div class="imui-form-container-wide" >
                            <nfwui:Title id="titOperationGuide" code="<%= MessageIdConstant.SKF2100_SC004_GUIDE %>" titleLevel="2" />
                        <div style="overflow-y:scroll;height:99%;">
                            ${form.operationGuide}
                        </div>
                      </div>
                        
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
        
<tr style="border:none">
   <td style="border:none">
   </td>
      <td style="border:none">
   </td>
</tr>
<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>" negative>                         
<div class="align-L float-L">
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>">       
<div class="align-L">
</imart:condition>
      <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="5" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
	<nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="488"
          parameter="applNo:applNo" removePatterns=""
          screenUrl="skf/Skf2010Sc010/init" use="popup" tabindex="9"/>
</imart:condition>
</div>

<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>" negative>       
<div class="align-R">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn"
      value="修正依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_REVISION %>" message="<%= MessageIdConstant.I_SKF_2005 %>"
      url="skf/Skf2100Sc004/Revision" formId="form" disabled="${form.btnApproveDisabled}" tabindex="7"/>
</div>
<div class="align-R">

      <!-- 差戻しボタン -->
      <nfwui:ConfirmButton id="sendoutBtn" name="sendoutBtn"
      value="差戻し" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_SENDBACK %>" message="<%= MessageIdConstant.I_SKF_2010 %>"
      url="skf/Skf2100Sc004/Sendback" formId="form" disabled="${form.btnApproveDisabled}" tabindex="8"/>
      <nfwui:ConfirmButton id="approveBtn" name="approveBtn"
      value="承認" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_APPLY %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
      url="skf/Skf2100Sc004/Approval" formId="form" disabled="${form.btnApproveDisabled}" tabindex="6"/>
</div>
</imart:condition>
	
</nfwui:Form>
</div>