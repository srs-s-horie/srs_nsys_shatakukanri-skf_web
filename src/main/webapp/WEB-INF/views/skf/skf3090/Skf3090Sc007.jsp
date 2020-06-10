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

<div class="imui-form-container-wide">
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" style="width:95%;">
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
									width="185" list="${form.companyList}" disabled="${form.companyCdDisabled}"  tabindex="1" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAgencyCd" code="<%= MessageIdConstant.SKF3090_SC007_AGENCY_CODE %>" />
								</th>

								<td style="width: 30%;">
								<imui:textbox id="registAgencyCd" name="registAgencyCd" value="${f:h(form.registAgencyCd)}" disabled="${form.agencyCdDisabled}" style="width: 55%; ime-mode:disabled" maxlength="4" placeholder="例 00" onblur="focusOut()" tabindex="2" />
								<imui:button id="agencyCdSearch"  value="名称を検索" disabled="${form.agencyCdSearchDisabled}" class="imui-small-button"
									  onclick="agencyCheckConfrim()" tabindex="3" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation1Cd" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION1_CODE %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAffiliation1Cd" name="registAffiliation1Cd" value="${f:h(form.registAffiliation1Cd)}" disabled="${form.affiliation1CdDisabled}" style="width: 55%; ime-mode:disabled" maxlength="3" placeholder="例 01" tabindex="4" />
								<imui:button id="affiliation1CdSearch"  value="名称を検索" disabled="${form.affiliation1CdSearchDisabled}" class="imui-small-button"
									   onclick="affiliation1CheckConfrim()" tabindex="5" />	
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation2Cd" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION2_CODE %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAffiliation2Cd" name="registAffiliation2Cd" value="${f:h(form.registAffiliation2Cd)}" disabled="${form.affiliation2CdDisabled}" style="width: 55%; ime-mode:disabled" maxlength="3" placeholder="例 001" tabindex="6" />
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
								<imui:textbox id="registAgencyName" name="registAgencyName" value="${f:h(form.registAgencyName)}" disabled="${form.agencyNameDisabled}" style="width: 95%; ime-mode:active;" placeholder="例 機関の名称" tabindex="7" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation1Name" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION1 %>" />
								</th>
								<td style="width: 30%;">
									<imui:textbox id="registAffiliation1Name" name="registAffiliation1Name" value="${f:h(form.registAffiliation1Name)}" disabled="${form.affiliation1NameDisabled}" style="width: 95%; ime-mode:active;" placeholder="例 部等の名称" tabindex="8" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation2Name" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION2 %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="registAffiliation2Name" name="registAffiliation2Name" value="${f:h(form.registAffiliation2Name)}" disabled="${form.affiliation2NameDisabled}" style="width: 95%; ime-mode:active;" placeholder="例 室・課等の名称" tabindex="9" />
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
			
		<script src="scripts/skf/skfCommon.js"></script>	
		<script type="text/javascript">
				(function($) {
					$("#registCompanyCd").change(function() {
						// 会社以外の内容が入力されているかの確認ダイアログ表示判定 yes:あり no:なし
						var sRegistCompanyCd = $("#registCompanyCd").val();
						var sRegistAgencyCd = $("#registAgencyCd").val();
						var sRegistAffiliation1Cd = $("#registAffiliation1Cd").val();
						var sRegistAffiliation2Cd = $("#registAffiliation2Cd").val();
						var sRegistAgencyName = $("#registAgencyName").val();
						var sRegistAffiliation1Name = $("#registAffiliation1Name").val();
						var sRegistAffiliation2Name = $("#registAffiliation2Name").val();
												
						if (sRegistAgencyCd != "" || sRegistAffiliation1Cd != "" || sRegistAffiliation2Cd != "" || sRegistAgencyName != ""
										|| sRegistAffiliation1Name != "" || sRegistAffiliation1Name != "" || sRegistAffiliation2Name != "" ) {
							dialogue = "yes"
						} else {
							dialogue = "no"
						}
						
							var form = "form";
						
							if (dialogue == "yes") {
								skf.common.confirmPopupForCallback("会社コード以外の内容がクリアされます。よろしいですか?", "確認", "form", "OK", "キャンセル", this, function(){
									$("#registAgencyCd").val("");
									$('#registAgencyName').val("");
									$("#registAffiliation1Cd").val("");
									$("#registAffiliation2Cd").val("");
									$("#registAffiliation1Name").val("");
									$("#registAffiliation2Name").val("");
									$("#registBusinessAreaCd").imuiSelect('replace', "")
								});
								} 
				});
					
					focusOut = function() {
							var map = new Object();
							map['registCompanyCd'] = $("#registCompanyCd").val();
							map['registAgencyCd'] = $("#registAgencyCd").val();
					
							nfw.common.doAjaxAction("skf/Skf3090Sc007/ChangeDropDownAsync",map,true,function(data) {
								$("#registBusinessAreaCd").imuiSelect('replace', data.businessAreaList);
							});	
							
					}
					
					$("#registAgencyCd").bind('change', function() {
						var text = $("#registAgencyCd").val();
						if (text.length >= 2) {
						focusOut();
						}
					});
					
					agencyCheckConfrim = function() {
						//エラーメッセージ削除
						$(".imui-box-caution, .imui-box-warning").remove();
						// 会社と機関コード以外の内容が入力されているかの確認ダイアログ表示判定 yes:あり no:なし
						var sRegistCompanyCd = $("#registCompanyCd").val();
						var sRegistAgencyCd = $("#registAgencyCd").val();
						var sRegistAffiliation1Cd = $("#registAffiliation1Cd").val();
						var sRegistAffiliation2Cd = $("#registAffiliation2Cd").val();
						var sRegistAgencyName = $("#registAgencyName").val();
						var sRegistAffiliation1Name = $("#registAffiliation1Name").val();
						var sRegistAffiliation2Name = $("#registAffiliation2Name").val();
						var sRegistBusinessAreaCd = $("#registBusinessAreaCd").val();
						
						if (sRegistCompanyCd != "" && sRegistAgencyCd != "" && 
								(sRegistAffiliation1Cd != "" || sRegistAffiliation2Cd != "" || sRegistAgencyName != ""
										|| sRegistAffiliation1Name != "" || sRegistAffiliation1Name != "" || sRegistAffiliation2Name != "" )) {
							dialogue = "yes"
						} else {
							dialogue = "no"
						}
						
						// 入力チェック判定用の値設定を行う
						var map = new Object();
						
						map['registCompanyCd'] = $('#registCompanyCd').val(); // 会社コード
						map['registAgencyCd'] = $('#registAgencyCd').val(); // 機関コード
						map['registAffiliation1Cd'] = $('#registAffiliation1Cd').val(); // 部等コード
						map['registAffiliation2Cd'] = $('#registAffiliation2Cd').val(); // 室・課等コード
						map['registAgencyName'] = $('#registAgencyName').val(); // 機関名称
						map['registAffiliation1Name'] = $('#registAffiliation1Name').val(); // 部等名称
						map['registAffiliation2Name'] = $('#registAffiliation2Name').val(); // 室・課等名称
						
						// 入力チェック非同期処理呼び出し
						nfw.common.doAjaxAction("skf/Skf3090Sc007/AgencySearchAsync", map, true, function(data) {
							
							var form = "form";
						
							if (dialogue == "yes") {
								skf.common.confirmPopupForCallback("部等（コード・名称）と室・課等（コード・名称）の内容がクリアされ、機関（名称）はマスタに登録されている内容に変更されます。よろしいですか?", "確認", "form", "OK", "キャンセル", this, function(){
									$("#registAffiliation1Cd").val("");
									$("#registAffiliation2Cd").val("");
									$("#registAgencyName").val(data.registAgencyName);
									$("#registAffiliation1Name").val("");
									$("#registAffiliation2Name").val("");
									$("#registBusinessAreaCd").val(data.registBusinessAreaCd);
									});
								} else {
									$("#registAgencyName").val(data.registAgencyName);
								}

						});
				}
					
					affiliation1CheckConfrim = function() {
						//エラーメッセージ削除
						$(".imui-box-caution, .imui-box-warning").remove();
						// 会社と機関コードと部等コード以外の内容が入力されているかの確認ダイアログ表示判定 yes:あり no:なし
						var sRegistCompanyCd = $("#registCompanyCd").val();
						var sRegistAgencyCd = $("#registAgencyCd").val();
						var sRegistAffiliation1Cd = $("#registAffiliation1Cd").val();
						var sRegistAffiliation2Cd = $("#registAffiliation2Cd").val();
						var sRegistAgencyName = $("#registAgencyName").val();
						var sRegistAffiliation1Name = $("#registAffiliation1Name").val();
						var sRegistAffiliation2Name = $("#registAffiliation2Name").val();
						var sRegistBusinessAreaCd = $("#registBusinessAreaCd").val();
						
						if (sRegistCompanyCd != "" && sRegistAgencyCd != "" && sRegistAffiliation1Cd != "" &&
								(sRegistAffiliation2Cd != "" ||  
										 sRegistAffiliation1Name != "" || sRegistAffiliation2Name != "" )) {
							dialogue = "yes"
						} else {
							dialogue = "no"
						}
						
						// 入力チェック判定用の値設定を行う
						var map = new Object();
						
						map['registCompanyCd'] = $('#registCompanyCd').val(); // 会社コード
						map['registAgencyCd'] = $('#registAgencyCd').val(); // 機関コード
						map['registAffiliation1Cd'] = $('#registAffiliation1Cd').val(); // 部等コード
						map['registAffiliation2Cd'] = $('#registAffiliation2Cd').val(); // 室・課等コード
						map['registAgencyName'] = $('#registAgencyName').val(); // 機関名称
						map['registAffiliation1Name'] = $('#registAffiliation1Name').val(); // 部等名称
						map['registAffiliation2Name'] = $('#registAffiliation2Name').val(); // 室・課等名称
						
						// 入力チェック非同期処理呼び出し
						nfw.common.doAjaxAction("skf/Skf3090Sc007/Affiliation1SearchAsync", map, true, function(data) {
							
							var form = "form";
						
							if (dialogue == "yes") {
								skf.common.confirmPopupForCallback("室・課等（コード・名称）の内容がクリアされ、部等（名称）はマスタに登録されている内容に変更されます。よろしいですか?", "確認", "form", "OK", "キャンセル", this, function(){
									$("#registAffiliation2Cd").val("");
									$("#registAffiliation1Name").val(data.registAffiliation1Name);
									$("#registAffiliation2Name").val("");
									$("#registBusinessAreaCd").val(data.registBusinessAreaCd);
									});
								} else {
									$("#registAffiliation1Name").val(data.registAffiliation1Name);
								}

						});
				}
					
				})(jQuery);
			</script>	

			<div class="align-L float-L">
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="11" />
				<script type="text/javascript">
					// 1つ前の画面に戻る
					function back1() {
						var url = "skf/Skf3090Sc006/init?SKF3090_SC006&tokenCheck=0";
						nfw.common.doBack(url, "前の画面に戻ります。よろしいですか？編集中の内容は無効になります。");
					}
					
				</script>	
			</div>
			<div class="align-R">
				<nfwui:ConfirmButton cssStyle="width: 150px" id="regist" name="regist" value="登録" disabled="${form.registButtonDisabled}" remove="${form.registButtonRemove}" cssClass="imui-medium-button"
					title="<%=MessageIdConstant.SKF3090_SC007_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3053 %>" url="skf/Skf3090Sc007/regist" formId="form" tabindex="12" />
				<nfwui:ConfirmButton cssStyle="width: 150px" id="delete" name="delete" value="削除" disabled="${form.deleteButtonDisabled}"  cssClass="imui-medium-button"
					 title="<%=MessageIdConstant.SKF3090_SC007_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_3005 %>" url="skf/Skf3090Sc007/delete" formId="form" tabindex="13" />	
			
			</div>
		</div>
</div>		
	<!-- コンテンツエリア　ここまで -->