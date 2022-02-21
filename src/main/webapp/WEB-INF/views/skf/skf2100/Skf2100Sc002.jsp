<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.skf2100.app.skf2100sc002.Skf2100Sc002Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2100Sc002Form form = (Skf2100Sc002Form)request.getAttribute("form"); %>
<link rel="stylesheet" type="text/css" href="styles/skf/theme.css" />
<% //コメントボタンCSSを読み込み %>
<link href="styles/skf/CommentBtnStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />


<%-- コンテンツエリア --%>
<script type="text/javascript">
function back1() {
	var url="skf/Skf2010Sc005/Search"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

$(function() {
	$(document).ready(function(){
		// 添付資料のリンクをクリックした時のイベント
		$("a[id^='attached_']").click(function(){
			attachedFileDownload(this);
		});		
	});
	
	attachedFileDownload = function(obj) {
		var id = $(obj).attr("id");
		var url = "skf/Skf2100Sc002/AttachedFileDownload";
		var attachedNo = id.replace(/^attached_/, '');
		
		$("#attachedNo").val(attachedNo);
		$("#form").attr("action", url);
		$("#form").submit();
	}
	
	updateAttachedFileArea = function () {
		var map = new Object();
		map['applNo'] = $("#applNo").val();
		nfw.common.doAjaxAction("skf/Skf2100Sc002/AttachedFileAreaAsync", map, true, function(res){
// 			if (res.attachedFileArea.length > 0) {
				$("#attachedFileAreaDiv").html(res.attachedFileArea);
				
				$("a[id^='attached_']").bind("click", function(){
					attachedFileDownload(this);
				});
// 			} else {
// 				$("#attachedFileAreaDiv").remove();
// 			}
		});
	}
	


});
</script>

<style type="text/css">

</style>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide">

    <!-- コンテンツエリア -->
    <div style="max-width: 1000px; margin-left:3%; margin-top:-7px;">
    <table class="imui-form-search-condition">
       <tr>
            <th style="width: 10%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2100_SC002_APPL_STATUS %>" /></th>
            <td style="width: 10%;"><label>${f:h(form.applStatusText) }</label></td>
				<th width="100px"><nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2100_SC002_ATTACHED_FILE %>" /></th>
				<td>
				<div id="attachedFileAreaDiv">
<c:forEach var="obj" items="${form.attachedFileList }">
                            <a id="attached_${obj.attachedNo}">${obj.attachedName }</a>&nbsp;
</c:forEach>
				</div>
				</td>
      </tr>
    </table>
    </div>
    <nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data">
		<!-- ** モバイルルーター入力支援：戻り値 ** -->
		<input type="hidden" name="hdnMobileRouterNo" id="hdnMobileRouterNo" value="${form.hdnMobileRouterNo}" />
		<input type="hidden" name="hdnIccid" id="hdnIccid" value="${form.hdnIccid}" />
		<input type="hidden" name="hdnImei" id="hdnImei" value="${form.hdnImei}" />
		<!-- ** サーバー連携用 ** -->
		<input type="hidden" name="jsonLabelList" id="jsonLabelList" value="${form.jsonLabelList }"/>
		
      <nfwui:Hidden id="applNo" name="applNo" />
      <nfwui:Hidden id="applId" name="applId" />
      <nfwui:Hidden id="attachedNo" name="attachedNo" />
        <table class="imui-form-search-condition" style="margin-top:-11px;">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        <div class="imui-form-container-wide" >
                        <nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2100_SC002_APPL_TITLE %>" titleLevel="2" />
									
							<table class="imui-form-search-condition">
								<colgroup span="1" style= "width:140px;">
								<colgroup span="1" style= "width:60px;">
								<colgroup span="1" style= "width:140px;">
								<tbody>
										<tr>
											<th rowspan="3"><nfwui:LabelBox id="lblApplicant" code="<%= MessageIdConstant.SKF2100_SC002_APPLICANT %>" /></th>
											<th colspan="2"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2100_SC002_AGENCY %>" /></th>
											<td colspan="2">
												<label id="agency" name="agency">${f:h(form.agency) }</label>
											</td>
										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2100_SC002_AFFILIATION1 %>" /></th>
											<td colspan="2">
												<label id="affiliation1" name="affiliation1">${f:h(form.affiliation1) }</label>
											</td>
										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2100_SC002_AFFILIATION2 %>" /></th>
											<td colspan="2">
												<label id="affiliation2" name="affiliation2">${f:h(form.affiliation2) }</label>
											</td>
										</tr>									
									<tr>
										<th rowspan="4"><nfwui:LabelBox id="lblApplicant" code="<%= MessageIdConstant.SKF2100_SC002_APPLICANT %>" /></th>
										<th colspan="2"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2100_SC002_SHAIN_NO %>" /></th>
										<td colspan="2">
											<label id="shainNo" name="shainNo">${f:h(form.shainNo) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2"><nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2100_SC002_SHAIN_NAME %>" /></th>
										<td colspan="2">
											<label id="name" name="name">${f:h(form.name) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2100_SC002_TEL %>" /></th>
										<td colspan="2">
											<label id="tel" name="tel">${f:h(form.tel) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="2"><nfwui:LabelBox id="lblMailAddress" code="<%= MessageIdConstant.SKF2100_SC002_MAILADDRESS %>" /></th>
										<td colspan="2">
											<label id="mailAddress" name="mailAddress">${f:h(form.mailAddress) }</label>
										</td>
									</tr>
									<tr>
										<th colspan="3"><nfwui:LabelBox id="lblUseStartHopeDay" code="<%= MessageIdConstant.SKF2100_SC002_USE_START_DAY %>" /></th>
										<td colspan="2">
											<label id="useStartHopeDaylbl" name="useStartHopeDaylbl">${f:h(form.useStartHopeDaylbl) }</label>
										</td>
									</tr>									
<imart:condition validity="<%= String.valueOf(form.isRouterInfoViewFlag()) %>" >
										<tr>
											<th rowspan="2"  >
												<nfwui:LabelBox id="lblLendersInfo" code="<%= MessageIdConstant.SKF2100_SC002_LENDERS_INFO %>" />
											</th>
											<th colspan="2">
												<nfwui:LabelBox id="lblOriginalCompany" code="<%= MessageIdConstant.SKF2100_SC002_ORIGINAL_COMPANY %>" />
											</th>
											<td colspan="2">
												<label id="originalCompany" name="originalCompany">${f:h(form.originalCompany) }</label>
											</td>
										</tr>
										<tr>	
											<th colspan="2">
												<nfwui:LabelBox id="lblPayCompany" code="<%= MessageIdConstant.SKF2100_SC002_PAY_COMPANY %>" />
											</th>
											<td colspan="2">
												<label id="payCompany" name="payCompany">${f:h(form.payCompany) }</label>
											</td>
										</tr>	
										<tr>
											<th rowspan="3">
												<nfwui:LabelBox id="lblRouterInfo" code="<%= MessageIdConstant.SKF2100_SC002_ROUTER_INFO %>" />
											</th>
											<th colspan="2">
												<nfwui:LabelBox id="lblRouterNo" code="<%= MessageIdConstant.SKF2100_SC002_ROUTER_NO %>" />
											</th>
											<td colspan="2">
												<label id="mobileRouterNo" name="mobileRouterNo">${f:h(form.mobileRouterNo) }</label>
											</td>
										</tr>
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblIccid" code="<%= MessageIdConstant.SKF2100_SC002_ICCID %>" />
											</th>
											<td colspan="2">
												<label id="iccid" name="iccid">${f:h(form.iccid) }</label>
											</td>
										</tr>	
										</tr>		
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblImei" code="<%= MessageIdConstant.SKF2100_SC002_IMEI %>" />
											</th>
											<td colspan="2">
												<label id="imei" name="imei">${f:h(form.imei) }</label>
											</td>
										</tr>
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblShippingDate" code="<%= MessageIdConstant.SKF2100_SC002_SHIPPING_DATE %>" />
											</th>
											<td colspan="2">
												<label id="shippingDatelbl" name="shippingDatelbl">${f:h(form.shippingDatelbl) }</label>
											</td>
										</tr>		
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblReceivedDate" code="<%= MessageIdConstant.SKF2100_SC002_RECEIVED_DATE %>" />
											</th>
											<td colspan="2">
												<label id="receivedDatelbl" name="receivedDatelbl">${f:h(form.receivedDatelbl) }</label>
											</td>
										</tr>
										<tr style="border:none">
											<td style="border:none"></td>
										</tr>
										<tr>
											<th colspan="3"><nfwui:LabelBox id="lblItemName" code="<%= MessageIdConstant.SKF2100_SC002_ITEMNAME %>" /></th>
											<th colspan="1"><nfwui:LabelBox id="lblKosu" code="<%= MessageIdConstant.SKF2100_SC002_KOSU %>" /></th>
											<th colspan="1"><nfwui:LabelBox id="lblReceiptCheck" code="<%= MessageIdConstant.SKF2100_SC002_RECEIPT_CHECK %>" /></th>
										</tr>
										<tr>
											<th colspan="3"><nfwui:LabelBox id="lblMobileRouter" code="<%= MessageIdConstant.SKF2100_SC002_MOBILE_ROUTER %>" /></th>
											<td colspan="1">1</td>
											<td colspan="1">
												<imui:checkbox id="bodyReceiptCheckFlag" name="bodyReceiptCheckFlag" value="1" 
													checked="${form.bodyReceiptCheckFlag }" disabled="true" tabindex="5"/>
											</td>
										</tr>
										<tr>
											<th colspan="3"><nfwui:LabelBox id="lblRentalGuide" code="<%= MessageIdConstant.SKF2100_SC002_RENTAL_GUIDE %>" /></th>
											<td colspan="1">1</td>
											<td colspan="1">
												<imui:checkbox id="handbookReceiptCheckFlag" name="handbookReceiptCheckFlag" value="1" 
													checked="${form.handbookReceiptCheckFlag }" disabled="true" tabindex="6"/>
											</td>
										</tr>	
										<tr>
											<th colspan="3"><nfwui:LabelBox id="lblReturnMaterials" code="<%= MessageIdConstant.SKF2100_SC002_RETURN_MATERIALS %>" /></th>
											<td colspan="1">1</td>
											<td colspan="1">
												<imui:checkbox id="materialsReceivedCheckFlag" name="materialsReceivedCheckFlag" value="1" 
													checked="${form.materialsReceivedCheckFlag }" disabled="true" tabindex="7"/>
											</td>
										</tr>
									</imart:condition>
									
							</table>
						</div>
<imart:condition validity="<%= String.valueOf(form.isRouterInfoViewFlag()) %>" negative>
						<div class="imui-form-container-wide" >
						<nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2100_SC002_APPLY_INPUT %>" titleLevel="2" />
							<table class="imui-form-search-condition-blue">
								
								<tbody>
										<tr>
											<th rowspan="2" style= "width:180px;white-space: nowrap;"><nfwui:LabelBox id="lblLendersInfo" code="<%= MessageIdConstant.SKF2100_SC002_LENDERS_INFO %>" /></th>
											<th colspan="2" ><nfwui:LabelBox id="lblOriginalCompany" code="<%= MessageIdConstant.SKF2100_SC002_ORIGINAL_COMPANY %>" /></th>
											<td colspan="2" style= "width:480px;">
												<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" negative>
													<imui:select id="originalCompanyCd" name="originalCompanyCd" width="160" disabled="${form.originalCompanySelectDisableFlg }"
															list="${form.originalCompanySelectList}" class="${form.originalCompanySelectErr}" tabindex="3" />
												</imart:condition>
												<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" >
													<label id="originalCompany" name="originalCompany">${f:h(form.originalCompany) }</label>
												</imart:condition>
											</td>
										</tr>
										<tr>	
											<th colspan="2"><nfwui:LabelBox id="lblPayCompany" code="<%= MessageIdConstant.SKF2100_SC002_PAY_COMPANY %>" /></th>
											<td colspan="2">
											<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" negative>
												<imui:select id="payCompanyCd" name="payCompanyCd" width="160" disabled="${form.payCompanySelectDisableFlg }"
														list="${form.payCompanySelectList}" class="${form.payCompanySelectErr}" tabindex="4" />
											</imart:condition>
											<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" >
												<label id="payCompany" name="payCompany">${f:h(form.payCompany) }</label>
											</imart:condition>
											</td>
										</tr>
										<tr>
											<th rowspan="8" style= "width:140px;white-space: nowrap;"><nfwui:LabelBox id="lblRouterInfo" code="<%= MessageIdConstant.SKF2100_SC002_ROUTER_INFO %>" /></th>
											<th colspan="2" >
											<label id="mobileNo" name="mobileNo">通しNo
												<div  class="align-R float-R">
													<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" negative>
														<nfwui:PopupButton id="routerSelect" name="routerSelect" value="ルーター選択" use="popup"
																cssClass="imui-small-button" popupWidth="650" popupHeight="700"
																modalMode="true" screenUrl="skf/Skf2100Sc009/init"
																callbackFunc="routerShienCallback()"  tabindex="5"/> 
													</imart:condition>
												</div></label>
<%-- 													<nfwui:LabelBox id="lblRouterNo" code="<%= MessageIdConstant.SKF2100_SC002_ROUTER_NO %>" /> --%>

											</th>
											<td colspan="2">
												<label id="mobileRouterNo" name="mobileRouterNo">${f:h(form.mobileRouterNo) }</label>
											</td>
										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblIccid" code="<%= MessageIdConstant.SKF2100_SC002_ICCID %>" /></th>
											<td colspan="2">
												<label id="iccid" name="iccid">${f:h(form.iccid) }</label>
											</td>
										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblImei" code="<%= MessageIdConstant.SKF2100_SC002_IMEI %>" /></th>
											<td colspan="2">
												<label id="imei" name="imei">${f:h(form.imei) }</label>
											</td>
										</tr>		
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblShippingDate" code="<%= MessageIdConstant.SKF2100_SC002_SHIPPING_DATE %>" /></th>
											<td colspan="2">
												<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" negative>
													<nfwui:DateBox id="shippingDate" name="shippingDate" value="${f:h(form.shippingDate)}"
													 cssStyle="width:180px" cssClass="${form.shippingDateErr }" tabindex="6"/>
												</imart:condition>
												<imart:condition validity="<%= String.valueOf(form.isStatus00Flag()) %>" >
													<label id="shippingDatelbl" name="shippingDatelbl">${f:h(form.shippingDatelbl) }</label>
												</imart:condition>
											</td>
										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblItemName" code="<%= MessageIdConstant.SKF2100_SC002_ITEMNAME %>" /></th>
											<th colspan="2"><nfwui:LabelBox id="lblKosu" code="<%= MessageIdConstant.SKF2100_SC002_KOSU %>" /></th>
										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblMobileRouter" code="<%= MessageIdConstant.SKF2100_SC002_MOBILE_ROUTER %>" /></th>
											<td colspan="2">1</td>

										</tr>
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblRentalGuide" code="<%= MessageIdConstant.SKF2100_SC002_RENTAL_GUIDE %>" /></th>
											<td colspan="2">1</td>

										</tr>	
										<tr>
											<th colspan="2"><nfwui:LabelBox id="lblReturnMaterials" code="<%= MessageIdConstant.SKF2100_SC002_RETURN_MATERIALS %>" /></th>
											<td colspan="2">1</td>
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
                                    <th colspan="4"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2100_SC002_COMMENT %>" /></th>
                                    <td colspan="3" >
                						<imui:textArea id="commentNote" name="commentNote" style="height:80px; width:98%; ime-mode:active;" 
                						value="${form.commentNote }" placeholder="例  申請者へのコメント" disabled="${form.commentDisabled }" tabindex="7"/>
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
                            <nfwui:Title id="titOperationGuide" code="<%= MessageIdConstant.SKF2100_SC002_GUIDE %>" titleLevel="2" />
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
      <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="8" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
	<nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="488"
          parameter="applNo:applNo" removePatterns=""
          screenUrl="skf/Skf2010Sc010/init" use="popup" tabindex="14"/>
</imart:condition>
</div>

<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>" negative>       
<imart:decision case="${form.dispMode}" value="<%= String.valueOf(CodeConstant.VIEW_LEVEL_2) %>">
<div class="align-R">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn"
      value="修正依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_REVISION %>" message="<%= MessageIdConstant.I_SKF_2005 %>"
      url="skf/Skf2100Sc002/Revision" formId="form" removePatterns="NONADMIN" tabindex="11"/>
</div>
<div class="align-R">
           <!-- 添付ボタン -->
           <nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           use="popup" popupWidth="790" popupHeight="700"
           parameter="applNo:popApplNo,applId:popApplId" modalMode="true" 
           screenUrl="skf/Skf2010Sc009/init" formId="form" removePatterns="NON" tabindex="9"/>
           <!-- 差戻しボタン -->
           <nfwui:ConfirmButton id="sendoutBtn" name="sendoutBtn"
           value="差戻し" cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2100_SENDBACK %>" message="<%= MessageIdConstant.I_SKF_2010 %>"
           url="skf/Skf2100Sc002/Sendback" formId="form" tabindex="12"/>
      <nfwui:ConfirmButton id="presentBtn" name="presentBtn"
      value="確認依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_PRESENT %>" message="<%= MessageIdConstant.I_SKF_2011 %>"
      url="skf/Skf2100Sc002/Present" formId="form" removePatterns="NONADMIN" disabled="${form.btnApproveDisabled}" tabindex="10"/>
</div>
</imart:decision>
<imart:decision case="${form.dispMode}" value="<%= String.valueOf(CodeConstant.VIEW_LEVEL_3) %>">
	<div class="align-R">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn"
      value="修正依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_REVISION %>" message="<%= MessageIdConstant.I_SKF_2005 %>"
      url="skf/Skf2100Sc002/Revision" formId="form" removePatterns="NONADMIN" tabindex="11"/>
      <nfwui:ConfirmButton id="approveBtn" name="approveBtn"
      value="承認" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2100_APPLY %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
      url="skf/Skf2100Sc002/Approval" formId="form" removePatterns="NONADMIN" disabled="${form.btnApproveDisabled}" tabindex="13"/>
	</div>  
</imart:decision> 
</imart:condition>
<script type="text/javascript">
		(function($) {
			// 画面表示時に定義される処理
			$(document).ready(function(){
				
				updateAttachedFileArea();
				
				// JSON可変ラベルリスト設定
				// 可変値ラベルをリスト形式にし、JSON文字列に変換後
				// formのhidden変数「jsonLabelList」に格納する
				setVariableLabelList = function() {
					// 可変ラベルリスト
					var labelArray = new Array();
					{
						// 可変ラベルリスト作成
						var labelMap = new Object();
						// 通しNo
						labelMap['mobileRouterNo'] = $("#mobileRouterNo").text().trim();
						// ICCID
						labelMap['iccid'] = $("#iccid").text().trim();
						// ICCID
						labelMap['imei'] = $("#imei").text().trim();
						labelArray.push(labelMap);
					}
					// 可変ラベルリストをJSON文字列に変換
					$('#jsonLabelList').val(JSON.stringify(labelArray));
				}
				
				// 入力支援コールバック
				routerShienCallback = function() {
					// 通しNo
					$("#mobileRouterNo").text($("#hdnMobileRouterNo").val());
					// ICCID
					$("#iccid").text($("#hdnIccid").val());
					// IMEI
					$("#imei").text($("#hdnImei").val());
					setVariableLabelList();
 					url = "skf/Skf2100Sc002/RouterSupportCallBack";
 					nfw.common.submitForm("form", url);
// 					// パラメータ作成 
// 					var map = new Object();
// 					map['applNo'] = $("#applNo").val();
// 					map['mobileRouterNo'] = $("#hdnMobileRouterNo").val();
// 					map['iccid'] = $("#hdnIccid").val();
// 					map['imei'] = $("#hdnImei").val();
// 					nfw.common.doAjaxAction("skf/Skf2100Sc002/RouterSupportCallBackAsync", map, true, function(data) {
// 						// 戻り値設定
// 						updateAttachedFileArea();
// 						$("#hdnMobileRouterNo").val(data.hdnMobileRouterNo);
						
// 					});
				}
				
				
				
			});
			})(jQuery);
</script>
				
</nfwui:Form>
</div>