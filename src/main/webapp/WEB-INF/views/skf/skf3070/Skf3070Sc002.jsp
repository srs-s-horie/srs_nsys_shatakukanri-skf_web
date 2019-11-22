<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<!-- コンテンツエリア -->
<div style="width: 100%;">
	<div class="imui-form-container-wide">
		<nfwui:Title id="title" code="<%= MessageIdConstant.SKF3070_SC002_OWNER_INFO_TITLE %>" titleLevel="2" />
		<nfwui:Form id="form" name="form" modelAttribute="form">		
			<table class="imui-form-search-condition" >
				<tr>
					<th rowspan="5" style="width: 120px;">
						<nfwui:LabelBox id="lblOwner" code="<%= MessageIdConstant.SKF3070_SC002_OWNER %>" />
					</th>
					<th style="width: 150px;">
						<nfwui:LabelBox id="lblOwnerName" code="<%= MessageIdConstant.SKF3070_SC002_OWNER_NAME %>" />
					</th>				
					<td colspan="3">
						<imui:textbox id="ownerName" name="ownerName" value="${f:h(form.ownerName)}" placeholder="例 中日本 一郎" 
							style="width: 95%;" tabindex="1"/>
					</td>
					<th rowspan="2" style="width: 160px;">
						<nfwui:LabelBox id="lblAddressLocation" code="<%= MessageIdConstant.SKF3070_SC002_ADDRESS_LOCATION %>" />
					</th>
					<th style="width: 100px;">
						<nfwui:LabelBox id="lblZipCode" code="<%= MessageIdConstant.SKF3070_SC002_ZIP_CODE %>" />
					</th>
					<td colspan="3">
						<imui:textbox id="zipCode" name="zipCode" value="${f:h(form.zipCode)}" 	maxlength="7" style="width: 20%;" 
							placeholder="例  4600003" tabindex="3"/>
					<nfwui:Button id="searchAddress" name="searchAddress" formId="form" value="住所検索" cssClass="imui-small-button" url="skf/Skf3070Sc002/searchAddress" tabindex="4" />
					</td>
				</tr>
				<tr>
					<th style="width: 160px;">
						<nfwui:LabelBox id="lblOwnerNameKk" code="<%= MessageIdConstant.SKF3070_SC002_OWNER_NAME_KK %>" />
					</th>
					<td colspan="3">
						<imui:textbox id="ownerNameKk" name="ownerNameKk" value="${f:h(form.ownerNameKk)}" placeholder="例 ナカニホン　イチロウ"
							 style="width: 95%;" tabindex="2"/>
					</td>
					<th style="width: 100px;">
						<nfwui:LabelBox id="lblAddress" code="<%= MessageIdConstant.SKF3070_SC002_ADDRESS %>" />
					</th>
					<td colspan="3">
						<imui:textbox id="address" name="address" value="${f:h(form.address)}" 
							placeholder="例 愛知県名古屋市中区錦2-18-19"  style="width: 95%;"  tabindex="5"/>
					</td>
				</tr>
				<tr>
					<th style="width: 160px;">
						<nfwui:LabelBox id="lblBusinessKbn" code="<%= MessageIdConstant.SKF3070_SC001_BUSINESS_KBN %>" />
					</th>
					<td colspan="6">
						<imui:select id="businessKbn" name="businessKbn" list="${form.ddlBusinessKbnList}" width="15%" tabindex="6"/>
					</td>
				</tr>	
				<tr>
					<th style="width: 160px;">
						<nfwui:LabelBox id="lblAcceptFlg" code="<%= MessageIdConstant.SKF3070_SC001_ACCEPT_FLG %>" />
					</th>
					<td colspan="6">
						<imui:select id="acceptFlg" name="acceptFlg" list="${form.ddlAcceptFlgList}" tabindex="7"/>
						<imui:textbox id="acceptStatus" name="acceptStatus" value="${f:h(form.acceptStatus)}" placeholder="例 督促状況" 
							style="width: 30%;" tabindex="8"/>
					</td>
				</tr>
				<tr>
					<th style="width: 160px;">
						<nfwui:LabelBox id="lblAcceptFlg" code="<%= MessageIdConstant.SKF3070_SC002_REMARKS %>" />
					</th>
					<td colspan="6">
						<imui:textArea id="remarks" name="remarks" 
							value="${f:h(form.remarks)}" style="width: 90%;" placeholder="例 共有持分不明につき総額" tabindex="9"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="ownerNo" id="ownerNo" value="${form.ownerNo}" />
		</nfwui:Form>
		<!-- フッターエリア -->
        <div class="align-L float-L">
        	<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="10"  />
        </div>
        
        <div class="align-R">
    		<nfwui:ConfirmButton cssStyle="width:150px;" id="regist" value="登録" 
				formId="form"
				cssClass="imui-medium-button" title="<%=MessageIdConstant.SKF3070_SC002_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3053 %>"
				url="skf/Skf3070Sc002/regist" tabindex="11" />

        </div>
	</div>
</div>
<!-- javascript -->
<script src="scripts/skf/skfCommon.js"></script>	
<script type="text/javascript">
/**
 * 一つ前の画面へ戻る
 */
function back1() {
	var url = "skf/Skf3070Sc001/init?SKF3070_SC001&tokenCheck=0";
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

</script>


