<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>
<script type="text/javascript">
	(function($) {
		$(document).ready(function($){
			$("#agencyCd").bind('change', function() {
				var map = new Object();
				var className = $("#originalCompanyCd").attr("class");
				map['originalCompanyCd'] = $("#originalCompanyCd").val();
				map['agencyCd'] = $("#agencyCd").val();
				
				nfw.common.doAjaxAction("skf/Skf3090Sc005/ChangeDropDownAsync",map,true,function(data) {
					$("#affiliation1Cd").imuiSelect('replace', data.affiliation1List);
					$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
					$("#businessAreaCd").imuiSelect('replace', data.businessAreaList);
					$("#originalCompanyCd").addClass(className);
				});
			});
			
			$("#affiliation1Cd").bind('change', function() {
				var map = new Object();
				var className = $("#originalCompanyCd").attr("class");
				map['originalCompanyCd'] = $("#originalCompanyCd").val();
				map['agencyCd'] = $("#agencyCd").val();
				map['affiliation1Cd'] = $("#affiliation1Cd").val();
				
				nfw.common.doAjaxAction("skf/Skf3090Sc005/ChangeDropDownAsync",map,true,function(data) {
					$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
					$("#originalCompanyCd").addClass(className);
				});
			});
		});
		
	})(jQuery);
	
</script>
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide">
			<div class="imui-form-container-wide"  style="width:95%;">
				<div class="imui-chapter-title" style="width:35%;"><h2>社員情報</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
				<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo}"  />
				<input type="hidden" name="hdnName" id="hdnName" value="${form.hdnName}"  />
				<input type="hidden" name="hdnNameKk" id="hdnNameKk" value="${form.hdnNameKk}" />
				<input type="hidden" name="hdnOriginalCompanyCd" id="hdnOriginalCompanyCd" value="${form.hdnOriginalCompanyCd}" />
				<input type="hidden" name="hdnAgencyCd" id="hdnAgencyCd" value="${form.hdnAgencyCd}" />
				<input type="hidden" name="hdnAffiliation1Cd" id="hdnAffiliation1Cd" value="${form.hdnAffiliation1Cd}" />
				<input type="hidden" name="hdnAffiliation2Cd" id="hdnAffiliation2Cd" value="${form.hdnAffiliation2Cd}" />
				<input type="hidden" name="updateFlag" id="updateFlag" value="${form.updateFlag}"  />
				<input type="hidden" name="roleId" id="roleId" value="${form.roleId}" />
				<input type="hidden" name="registFlg" id="registFlg" value="${form.registFlg}" />
				<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC005 %>" />
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_SHAIN_NUMBER %>" />
								</th>
								<td style="width: 20%;">
								<imui:textbox id="shainNo" name="shainNo" value="${f:h(form.shainNo)}" 
								style="width: 95%; ime-mode:disabled;" placeholder="例 00123456（半角）" disabled="${form.shainNoDisabled}" class="${form.shainNoError}" tabindex="3" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_NAME %>" />
								</th>

								<td style="width: 20%;">
								<imui:textbox id="name" name="name" style="width: 95%; ime-mode:active;" placeholder="例 中日本　太郎" value="${f:h(form.name)}" class="${form.nameError}" tabindex="4" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_NAME_KK %>" />
								</th>
								<td style="width: 20%;">
								<imui:textbox id="nameKk" name="nameKk" style="width: 95%; ime-mode:active;" placeholder="例 ナカニホン　タロウ" value="${f:h(form.nameKk)}" class="${form.nameKkError}" tabindex="5" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_MAIL %>" />
								</th>
								<td style="width: 20%;">
								<imui:textbox id="mailAddress" name="mailAddress" style="width: 95%; ime-mode:disabled;" placeholder="" value="${f:h(form.mailAddress)}" class="${form.mailAddressError}" tabindex="6" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_RETIRE %>" />
								</th>
								<td style="width: 20%;">
									<nfwui:DateBox id="retireDate" name="retireDate" cssStyle="width: 85%;" cssClass="${form.retireDateError}" tabindex="7" />	
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_COMPANY %>" />
								</th>
								<td style="width: 20%;">
									<imui:select id="originalCompanyCd" name="originalCompanyCd"
									width="95%"
									list="${form.companyList}"  class="${form.originalCompanyCdError}" tabindex="8" />
								</td>
							</tr>
							</nfwui:Table>

							<nfwui:Table use="search">
							<div class="imui-chapter-title" style="width:35%;"><h2>NEXCO中日本での配属先</h2></div>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_AGENCY %>" />
								</th>
								<td style="width: 20%;">
								<imui:select id="agencyCd" name="agencyCd"
									width="95%"
									list="${form.agencyList}" tabindex="9" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_GROUP %>" />
								</th>
								<td style="width: 20%;">
								<imui:select id="affiliation1Cd" name="affiliation1Cd"
									width="95%"
									list="${form.affiliation1List}" tabindex="10" />
								
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_TEAM %>" />
								</th>
								<td style="width: 20%;">
								<imui:select id="affiliation2Cd" name="affiliation2Cd"
									width="95%"
									list="${form.affiliation2List}" tabindex="11" />								
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC005_BUSINESS %>" />
								</th>
								<td style="width: 20%;">
								<imui:select id="businessAreaCd" name="businessAreaCd"
									width="95%"
									list="${form.businessAreaList}" tabindex="12" />								
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
				</nfwui:Form>
			</div>
			<br />
			<div class="align-L float-L">
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="13"  />
				<script type="text/javascript">
				    /**
				     * 一つ前の画面へ戻る
				     */
				    function back1() {
				    	var url = "skf/Skf3090Sc004/init?SKF3090_SC004&tokenCheck=0";
				    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
				    }
				
				</script>
			</div>

			<div class="align-R">
				<nfwui:ConfirmButton cssStyle="width:150px;" id="regist" value="登録" 
				 formId="form"
				 cssClass="imui-medium-button" title="<%=MessageIdConstant.SKF3090_SC005_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3053 %>"
				 url="skf/Skf3090Sc005/regist" tabindex="14" />
				<!---->
				<nfwui:ConfirmButton cssStyle="width:150px;" id="delete" value="削除"
				remove="${form.deleteRemoveFlag}" formId="form"
				 cssClass="imui-medium-button" title="<%=MessageIdConstant.SKF3090_SC005_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3005 %>"
				 url="skf/Skf3090Sc005/delete" tabindex="15" />
				<!---->
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->