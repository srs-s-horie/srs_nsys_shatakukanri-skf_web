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
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>


		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide"  style="width: 95% ;">
				<div class="imui-chapter-title"><h2>組織情報</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
				<input type="hidden" name="hdnCompanyCd" id="hdnCompanyCd" value="${form.hdnCompanyCd}" />
				<input type="hidden" name="hdnAgencyCd" id="hdnAgencyCd" value="${form.hdnAgencyCd}" />
				<input type="hidden" name="hdnAffiliation1Cd" id="hdnAffiliation1Cd" value="${form.hdnAffiliation1Cd}" />
				<input type="hidden" name="hdnAffiliation2Cd" id="hdnAffiliation2Cd" value="${form.hdnAffiliation2Cd}" />
				<input type="hidden" name="hdnBusinessAreaCd" id="hdnBusinessAreaCd" value="${form.hdnBusinessAreaCd}" />
				<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC007 %>" />
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblCompanyCd" code="<%= MessageIdConstant.SKF3090_SC007_COMPANY %>" />
								</th>
								<td style="width: 30%;">
									<imui:select id="registCompanyCd" name="registCompanyCd"
									width="185" list="${form.companyList}" disabled="${form.companyCdDisabled}" tabindex="1" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAgencyCd" code="<%= MessageIdConstant.SKF3090_SC007_AGENCY_CODE %>" />
								</th>

								<td style="width: 30%;">
								<imui:textbox id="registAgencyCd" name="registAgencyCd" value="${f:h(form.registAgencyCd)}" disabled="${form.agencyCdDisabled}" style="width: 55%; ime-mode:disabled" maxlength="4" placeholder="例 00" tabindex="2" />
								<imui:button id="agencyCdSearch"  value="名称を検索" disabled="${form.agencyCdSearchDisabled}" class="imui-small-button"
									  onclick="checkConfrim()" tabindex="3" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation1Cd" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION1_CODE %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAffiliation1Cd" name="registAffiliation1Cd" value="${f:h(form.registAffiliation1Cd)}" disabled="${form.affiliation1CdDisabled}" style="width: 55%; ime-mode:disabled" maxlength="2" placeholder="例 01" tabindex="4" />
								<nfwui:Button id="affiliation1CdSearch" name="affiliation1CdSearch" value="名称を検索" disabled="${form.affiliation1CdSearchDisabled}" cssClass="imui-small-button"
									url="skf/Skf3090Sc007/affiliation1Search" formId="form"  tabindex="5" />	
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation2Cd" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION2_CODE %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAffiliation2Cd" name="registAffiliation2Cd" value="${f:h(form.registAffiliation2Cd)}" disabled="${form.affiliation2CdDisabled}" style="width: 95%" placeholder="例 001" tabindex="6" />
								</td>
							</tr>
							
							 <!-- スペース-->
							<tr style="border:none">
								<td style="border:none">
								</td>
							</tr>

							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAgencyName" code="<%= MessageIdConstant.SKF3090_SC007_AGENCY %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAgencyName" name="registAgencyName" value="${f:h(form.registAgencyName)}" disabled="${form.agencyNameDisabled}" style="width: 95%" placeholder="例 機関の名称" tabindex="7" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation1Name" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION1 %>" />
								</th>
								<td style="width: 30%;">
									<imui:textbox id="registAffiliation1Name" name="registAffiliation1Name" value="${f:h(form.registAffiliation1Name)}" disabled="${form.affiliation1NameDisabled}" style="width: 95%" placeholder="例 部等の名称" tabindex="8" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation2Name" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION2 %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAffiliation2Name" name="registAffiliation2Name" value="${f:h(form.registAffiliation2Name)}" disabled="${form.affiliation2NameDisabled}" style="width: 95%" placeholder="例 室、チーム又は課の名称" tabindex="9" />
								</td>
							</tr>
							<tr>

								<th style="width: 15%;">
									<nfwui:LabelBox id="lblBusinessAreaCd" code="<%= MessageIdConstant.SKF3090_SC007_BUSINESS_AREA %>" />
								</th>
								<td style="width: 30%;">
								<imui:select id="registBusinessAreaCd" name="registBusinessAreaCd" 
									width="185" list="${form.businessAreaList}" disabled="${f:h(form.businessAreaCdDisabled)}" tabindex="10" />
								
								</td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</nfwui:Table>
				</nfwui:Form>	
			</div>

			<br />
			
		<script type="text/javascript">
				(function($) {
					$("#registCompanyCd").bind('change', function() {
						// alert("教授");
						var map = new object();
						map['registCompanyCd'] = $("#registCompanyCd").val();
					});
					checkConfrim = function() {
						// 会社が選択されていてかつ機関コードが入力されていて、部等コードが入力されている確認ダイアログ表示判定 yes:あり no:なし
					//	alert("あああああああああああああああああ");
						var sRegsitCompanyCd = $("#registCompanyCd").val();
						var sregsitAgencyCd = $("#regsitAgencyCd").val();
						var sRegistAffiliation1Cd = $("#registAffiliation1Cd").val();
						if (sRegsitCompanyCd != "" && sregsitAgencyCd != "" && sRegistAffiliation1Cd != "") {
							dialogue = "yes"
						} else {
							dialogue = "no"
						}
						
						// 入力チェック判定用の値設定を行う
						var map = new Object();
						
						map['registCompanyCd'] = $('#registCompanyCd').val(); // 会社コード
						map['registAgencyCd'] = $('#registAgencyCd').val(); // 機関コード
						map['registAffiliation1Cd'] = $('#registAffiliation1Cd').val(); // 部等コード
						map['registAffiliation2Cd'] = $('#registAffiliation2Cd').val(); // 室、チーム又は課コード
						map['registAgencyName'] = $('#registAgencyName').val(); // 機関名称
						map['registAffiliation1Name'] = $('#registAffiliation1Name').val(); // 部等名称
						map['registAffiliation2Name'] = $('#registAffiliation2Name').val(); // 室、チーム又は課名称
						
						// 入力チェック非同期処理呼び出し
						nfw.common.doAjaxAction("skf/Skf3090Sc007/AgencySearchAsync", map, true, function(data) {
							
							$('#registAgencyName').val(data.registAgencyName);
							
							alert("きょうじゅ");
// 							var form = "form";
						
// 							if (dialogue == "yes") {
// 								skf.common.confirmPopup("部等（コード・名称）と室、チーム又は課（コード・名称）の内容がクリアされ、機関（名称）はマスタに登録されている内容に変更されます。よろしいですか", "確認", form, "OK", "CANCEL", this);
// 							}
						});
				}
					
				})(jQuery);
			</script>	

			<div class="align-L float=L">
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="11" />
				<script type="text/javascript">
					// 1つ前の画面に戻る
					function back1() {
						alert("教授の家は東京");
						var url = "skf/Skf3090Sc006/init?SKF3090_SC006&tokenCheck=0";
						nfw.common.doBack(url, "前の画面に戻ります。よろしいですか？編集中の内容は無効になります。");
					}
					
				</script>	
			</div>
			<div class="align-R">
				<nfwui:ConfirmButton cssStyle="width: 150px" id="regist" name="regist" value="登録" disabled="${form.registButtonDisabled}" remove="${form.registButtonRemove}" cssClass="imui-small-button"
					title="<%=MessageIdConstant.SKF3090_SC007_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3053 %>" url="skf/Skf3090Sc007/regist" formId="form" tabindex="12" />
				<nfwui:ConfirmButton cssStyle="width: 150px" id="delete" name="delete" value="削除" disabled="${form.deleteButtonDisabled}"  cssClass="imui-small-button"
					 title="<%=MessageIdConstant.SKF3090_SC007_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3005 %>" url="skd/Skf3090Sc007/delete" formId="form" tabindex="13" />	
			
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->