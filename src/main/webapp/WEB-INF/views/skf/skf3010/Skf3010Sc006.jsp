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
<script src="scripts/skf/skfCommon.js"></script>

<%-- コンテンツエリア --%>
<style type="text/css"></style>
<script type="text/javascript">
	function back1() {
		var url="skf/Skf3010Sc001/init?SKF3010_SC001&tokenCheck=0"
		nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
	}
	
</script>

<!-- コンテンツエリア -->

	<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data" >
	<div class="imui-form-container-wide" >
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC006 %>" />
		<input type="hidden" name="ittoFlg" id="ittoFlg" value="${form.ittoFlg }" />
		<input type="hidden" name="oldBuildDate" id="oldBuildDate" value="${f:h(form.buildDate)}" />
		<input type="hidden" name="lendKbnSelectListString" id="lendKbnSelectListString" value="${f:h(form.lendKbnSelectListString)}" />
		<input type="hidden" name="defaultParkingLendStatus" id="defaultParkingLendStatus" value="${f:h(form.defaultParkingLendStatus)}" />
		<input type="hidden" name="contractOwnerNo" id="contractOwnerNo" value="${form.contractOwnerNo}" />
		<input type="hidden" name="parkingOwnerNo" id="parkingOwnerNo" value="${form.parkingOwnerNo}" />
		<input type="hidden" name="nowParkingInfoListTableData" id="nowParkingInfoListTableData" />
		<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo }"/>
		<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName }"/>
		<input type="hidden" name="hdnAreaKbn" id="hdnAreaKbn" value="${form.hdnAreaKbn }"/>
		<input type="hidden" name="hdnShatakuKbn" id="hdnShatakuKbn" value="${form.hdnShatakuKbn }"/>
		<input type="hidden" name="hdnEmptyRoomCount" id="hdnEmptyRoomCount" value="${form.hdnEmptyRoomCount }"/>
		<input type="hidden" name="hdnEmptyParkingCount" id="hdnEmptyParkingCount" value="${form.hdnEmptyParkingCount}"/>
		<input type="hidden" name="hdnBarnMensekiAdjust" id="hdnBarnMensekiAdjust" value="${form.hdnBarnMensekiAdjust}"/>
		<input type="hidden" name="parkingSelectMode" id="parkingSelectMode" value="${form.parkingSelectMode}"/>
		<input type="hidden" name="parkingEditFlg" id="parkingEditFlg" value="${form.parkingEditFlg}"/>
		<!-- 建築年月日(初期画面起動時データ) -->
		<input type="hidden" name="startingBuildDate" id="startingBuildDate" value="${form.startingBuildDate }"/>
		<!-- 構造区分(初期画面起動時データ) -->
		<input type="hidden" name="startingShatakuStructure" id="startingShatakuStructure" value="${form.startingShatakuStructure }"/>
		<!-- 駐車場構造区分(初期画面起動時データ) -->
		<input type="hidden" name="startingParkingStructure" id="startingParkingStructure" value="${form.startingParkingStructure }"/>
		<!-- 地域区分(初期画面起動時データ) -->
		<input type="hidden" name="startingAreaKbn" id="startingAreaKbn" value="${form.startingAreaKbn }"/>
		<!-- 賃貸人(画面表示時データ) -->
		<input type="hidden" name="startingContractOwnerName" id="startingContractOwnerName" value="${form.contractOwnerName }"/>
		<!-- 賃貸人番号(画面表示時データ) -->
		<input type="hidden" name="startingContractOwnerNo" id="startingContractOwnerNo" value="${form.contractOwnerNo }"/>
		<!-- 経理連携用管理番号(画面表示時データ) -->
		<input type="hidden" name="startingAssetRegisterNo" id="startingAssetRegisterNo" value="${form.assetRegisterNo }"/>
		<!-- 契約開始日(画面表示時データ) -->
		<input type="hidden" name="startingContractStartDay" id="startingContractStartDay" value="${form.contractStartDay }"/>
		<!-- 契約終了日(画面表示時データ) -->
		<input type="hidden" name="startingContractEndDay" id="startingContractEndDay" value="${form.contractEndDay }"/>
		<!-- 家賃(画面表示時データ) -->
		<input type="hidden" name="startingContractRent" id="startingContractRent" value="${form.contractRent }"/>
		<!-- 共益費(画面表示時データ) -->
		<input type="hidden" name="startingContractKyoekihi" id="startingContractKyoekihi" value="${form.contractKyoekihi }"/>
		<!-- 駐車場料(画面表示時データ) -->
		<input type="hidden" name="startingContractLandRent" id="startingContractLandRent" value="${form.contractLandRent }"/>
		<!-- 備考(画面表示時データ) -->
		<input type="hidden" name="startingContractBiko" id="startingContractBiko" value="${form.contractBiko }"/>
		<!-- 賃貸人(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractOwnerName" id="startingParkingContractOwnerName" value="${form.startingParkingContractOwnerName }"/>
		<!-- 経理連携用管理番号(画面表示時データ) -->
		<input type="hidden" name="startingParkingAssetRegisterNo" id="startingParkingAssetRegisterNo" value="${form.startingParkingAssetRegisterNo }"/>
		<!-- 契約開始日(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractStartDay" id="startingParkingContractStartDay" value="${form.startingParkingContractStartDay }"/>
		<!-- 契約終了日(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractEndDay" id="startingParkingContractEndDay" value="${form.startingParkingContractEndDay }"/>
		<!-- 郵便番号(画面表示時データ) -->
		<input type="hidden" name="startingParkingZipCd" id="startingParkingZipCd" value="${form.startingParkingZipCd }"/>
		<!-- 住所(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractAddress" id="startingParkingContractAddress" value="${form.startingParkingContractAddress }"/>
		<!-- 駐車場名(画面表示時データ) -->
		<input type="hidden" name="startingParkingName" id="startingParkingName" value="${form.startingParkingName }"/>
		<!-- 駐車場料(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractLandRent" id="startingParkingContractLandRent" value="${form.startingParkingContractLandRent }"/>
		<!-- 備考(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractBiko" id="startingParkingContractBiko" value="${form.startingParkingContractBiko }"/>
		<!-- 備考(画面表示時データ) -->
		<input type="hidden" name="startingParkingContractType" id="startingParkingContractType" value="${form.startingParkingContractType }"/>
		
		<!-- JSON備品情報 -->
		<input type="hidden" name="jsonBihin" id="jsonBihin" />
		<!-- JSONドロップダウン選択値リスト -->
		<input type="hidden" name="jsonDrpDwnList" id="jsonDrpDwnList" />
		<!-- JSON可変ラベルリスト -->
		<input type="hidden" name="jsonLabelList" id="jsonLabelList" />
		<!-- 編集フラグ(編集中は「true」 -->
		<input type="hidden" name="onChangeFlag" id="onChangeFlag" value="false"/>

		<!-- 補足ファイル -->
		<input type="hidden" name="fileNo" id="fileNo"/>
		<input type="hidden" name="hosokuType" id="hosokuType"/>
		<input type="hidden" name="hdnHosoku" id="sendHosokuType"/>
		<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo"/>
		<!-- 賃貸人(代理人)入力支援用 -->
		<input type="hidden" name="insertFormOwnerName" id="insertFormOwnerName" value="" />
		<input type="hidden" name="insertFormOwnerNo" id="insertFormOwnerNo" value="" />
		
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 5%;">
						<!-- 社宅名 -->
						<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC002_LBL_SHATAKU_NAME %>" />
					</th>
					<td style="width: 10%;">
						<imui:textbox id="shatakuName" name="shatakuName" style="width:200px;" maxlength="30"
							class="${form.shatakuNameErr}" value="${form.shatakuName}" placeholder="例　社宅名" tabindex="3" />
					</td>
					<th style="width: 5%;">
						<!-- 地域区分 -->
						<nfwui:LabelBox id="lblAreaKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_AREA_KBN %>" />
					</th>
					<td style="width: 5%;">
						<imui:select id="areaKbn" name="areaKbn" width="100" list="${form.areaKbnList}" class="${form.areaKbnErr}" tabindex="4" />
					</td>
					<th style="width: 5%;">
						<!-- 社宅区分 -->
						<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_SHATAKU_KBN %>" />
					</th>
					<td style="width: 5%;">
							<!-- 社宅区分ラベル -->
							<label>${form.shatakuKbn}</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div id="tabs">
			<ul>
				<li><a href="#kihon_info">基本情報</a></li>
				<li><a href="#room_info">部屋情報</a></li>
				<li><a href="#parking_info">駐車場情報</a></li>
				<li><a href="#bihin_info">備品情報</a></li>
				<li><a href="#admin_info">管理者情報</a></li>
				<li><a href="#keiyaku_info">契約情報</a></li>
			</ul>
			<div id="kihon_info">
				<nfwui:Table use="search">
					<tbody>
						<!--利用区分-->
						<tr>
							<th colspan="2">
								<!-- 利用区分 -->
								<nfwui:LabelBox id="lblUseKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_USE_KBN %>" />
							</th>
							<td colspan="3">
								<imui:select id="useKbn" name="useKbn" width="90" list="${form.useKbnList}" class="${form.useKbnKbnErr}" tabindex="9" />
							</td>
						</tr>
						<!--管理会社-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageCompany" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_COMPANY %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageCompany" name="manageCompany" width="160"
									list="${form.manageCompanyList}" class="${form.manageCompanyErr}" tabindex="10" />
							</td>
						</tr>
						<!--管理機関-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageAgency" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_AGENCY %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageAgency" name="manageAgency" width="160"
									list="${form.manageAgencyList}" class="${form.manageAgencyErr}" tabindex="11" />
							</td>
						</tr>
						<!--管理事業領域-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageBusinessArea" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_BUSINESS_AREA %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageBusinessArea" name="manageBusinessArea" width="160"
									list="${form.manageBusinessAreaList}" class="${form.manageBusinessAreaErr}" tabindex="12" />
							</td>
						</tr>
						<!--所在地-->
						<tr>
							<!--所在地-->
							<th rowspan="2" style="width:7%;">
								<nfwui:LabelBox id="lblAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ADDRESS %>" />
							</th>
							<!--郵便番号-->
							<th style="width:10%;">
								<nfwui:LabelBox id="lblZipCd" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ZIP_CD %>" />
							</th>
							<td colspan="3">
								<imui:textbox id="zipCd" name="zipCd" style="ime-mode: disabled;width:85px;" value="${f:h(form.zipCd)}"
													class="${form.zipCdErr}" placeholder="例　4600003" maxlength="7" tabindex="13"/>
								<imui:button id="addressSearch" name="addressSearch" value="住所検索"
										class="imui-small-button" onclick="addressSearchClick()" tabindex="14" />
							</td>
						</tr>
						<!--住所-->
						<tr>
							<th>
								<nfwui:LabelBox id="lblAddressDetail" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ADDRESS_DETAIL %>" />
							</th>
							<td colspan="3">
								<!-- 都道府県リスト -->
								<imui:select id="pref" name="pref" width="90" list="${form.prefList}" class="${form.prefErr}" tabindex="15" />
								<imui:textbox id="shatakuAddress" name="shatakuAddress" style="width:615px;" maxlength="100"
								value="${f:h(form.shatakuAddress)}" placeholder="例　名古屋市中区錦2-18-19" class="${form.shatakuAddressErr}" tabindex="16" />
							</td>
						</tr>
						<!--社宅構造-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblStructure" code="<%=MessageIdConstant.SKF3010_SC002_LBL_STRUCTURE %>" />
							</th>
							<td colspan="3">
								<!-- 構造リスト -->
								<imui:select id="shatakuStructure" name="shatakuStructure" width="90"
									list="${form.shatakuStructureList}" class="${form.shatakuStructureErr}" tabindex="17" />
								<imui:textbox id="shatakuStructureDetail" name="shatakuStructureDetail" style="width:360px;"
									maxlength="30" value="${f:h(form.shatakuStructureDetail)}" placeholder="例　RC3F" tabindex="18" />
							</td>
						</tr>
						<!--エレベーター-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblElevator" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ELEVATOR %>" />
							</th>
							<td colspan="3">
								<!-- エレベーターリスト -->
								<imui:select id="elevator" name="elevator" width="90" list="${form.elevatorList}" tabindex="19" />
							</td>
						</tr>
						<!--建築年月日-->
						<tr>
							<div>
							<th colspan="2">
								<nfwui:LabelBox id="lblBuildDate" code="<%=MessageIdConstant.SKF3010_SC002_LBL_BUILD_DATE %>" />
							</th>
							<td>
								<nfwui:DateBox id="buildDate" name="buildDate" value="${f:h(form.buildDate)}" cssStyle="width:100px" 
								cssClass="${f:h(form.buildDateErr)}" tabindex="20"/>
							</td>
							<th>
								<nfwui:LabelBox id="lblRealYearCount" code="<%=MessageIdConstant.SKF3010_SC002_LBL_REAL_YEAR_COUNT %>" />
							</th>
							<td style="width:13%;">
								<label id="realYearCount" name="realYearCount">
									${form.jituAge }
								</label>
							</td>
							</div>
						</tr>
						<!--次回算定年月日-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblNextCalculateDate" code="<%=MessageIdConstant.SKF3010_SC002_LBL_NEXT_CALCULATE_DATE %>" />
							</th>
							<td >
								<label id="nextCalculateDate" name="nextCalculateDate">
									${form.nextCalcDate }
								</label>
							</td>
							<th>
								<nfwui:LabelBox id="lblAging" code="<%=MessageIdConstant.SKF3010_SC002_LBL_AGING %>" />
							</th>
							<td>
								<label id="aging" name="aging">
									${form.aging }
								</label>
							</td>
						</tr>
						<!--社宅補足-->
						<tr>
							<th rowspan="3" colspan="2">
								<nfwui:LabelBox id="lblShatakuSupplement" code="<%=MessageIdConstant.SKF3010_SC002_LBL_SHATAKU_SUPPLEMENT %>" />
							</th>
							<td>
								<a id="${form.shatakuHosokuLink1 }" tabindex="21">${form.shatakuHosokuFileName1 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku1" name="impShatakuHosoku1" value="参照" class="imui-small-button" tabindex="22" onclick="fileSelect('1','shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku1" name="tmpFileBoxshataku1" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku1" name="delShatakuHosoku1" value="削除" class="imui-small-button" tabindex="23" onclick="fileDelete('1','shataku')"/>
							</td>
						</tr>
						<!--社宅補足-->
						<tr style="display:table-row;">
							<td>
								<a id="${form.shatakuHosokuLink2 }" tabindex="24">${form.shatakuHosokuFileName2 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku2" name="impShatakuHosoku2" value="参照" class="imui-small-button" tabindex="25" onclick="fileSelect('2','shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku2" name="tmpFileBoxshataku2" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku2" name="delShatakuHosoku2" value="削除" class="imui-small-button" tabindex="26" onclick="fileDelete('2','shataku')"/>
							</td>
						</tr>
						<!--社宅補足-->
						<tr style="display:table-row;">
							<td>
								<a id="${form.shatakuHosokuLink3 }" tabindex="27">${form.shatakuHosokuFileName3 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku3" name="impShatakuHosoku3" value="参照" class="imui-small-button" tabindex="28" onclick="fileSelect('3','shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku3" name="tmpFileBoxshataku3" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku3" name="delShatakuHosoku3" value="削除" class="imui-small-button" tabindex="29" onclick="fileDelete('3','shataku')"/>
							</td>
						</tr>
						<!--備考-->
						<tr>
							<th rowspan="3" colspan="2">
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_BIKO %>" />
							</th>
							<td rowspan="3" colspan="3">
								<imui:textArea id="biko" name="biko" rows="3" style="width:715px;" maxlength="400" value="${f:h(form.biko)}" tabindex="30" />
							</td>
							<td style="width: 30%;border:none;background-color:white;box-shadow:none;"></td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
			<div id="room_info">
				<nfwui:Table use="input">
					<tbody>
						<tr>
							<th  style="width: 15%;">
		<!-- 				<label>部屋番号</label> -->
								<nfwui:LabelBox id="lblRoomNo" code="<%=MessageIdConstant.SKF3010_SC006_ROOMNO%>" />
							</th>
							<td style="width: 40%;">
								<imui:textbox id="roomNo" name="roomNo" style="ime-mode: disabled;width:120px;" value="${f:h(form.roomNo)}" 
								class="${form.roomNoError}" placeholder="例　101（半角）" maxlength="10" tabindex="31"/>
							</td>
							<th style="width: 15%;">
		<!-- 				<label>本来延面積</label> -->
								<nfwui:LabelBox id="lblOriginalMenseki" code="<%=MessageIdConstant.SKF3010_SC006_ORIGINALMENSEKI%>" />
							</th>
							<td>
								<imui:textbox id="originalMenseki" name="originalMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${f:h(form.originalMenseki)}"  class="${form.originalMensekiError}" placeholder="例　70.5" maxlength="8" tabindex="37"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 					<label>本来規格</label> -->
								<nfwui:LabelBox id="lblOriginalKikaku" code="<%=MessageIdConstant.SKF3010_SC006_ORIGINALKIKAKU %>" />
							</th>
							<td>
								<imui:select id="originalKikaku" name="originalKikaku" 
									width="200" list="${form.originalKikakuList}" class="${form.originalKikakuError}" tabindex="32" />
							</td>
							<th>
		<!-- 					<label>貸与延面積</label> -->
								<nfwui:LabelBox id="lblLendMenseki" code="<%=MessageIdConstant.SKF3010_SC006_LENDMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="lendMenseki" name="lendMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${f:h(form.lendMenseki)}" class="${form.lendMensekiError}" placeholder="例　70.5" maxlength="8" tabindex="38"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 				<label>本来用途</label> -->
								<nfwui:LabelBox id="lblOriginalAuse" code="<%=MessageIdConstant.SKF3010_SC006_ORIGINALAUSE %>" />
							</th>
							<td>
								<imui:select id="originalAuse" name="originalAuse" 
											width="200" list="${form.originalAuseList}" class="${form.originalAuseError}" tabindex="33" />
							</td>
							<th>
			<!-- 				<label>サンルーム面積</label> -->
								<nfwui:LabelBox id="lblSunRoomMenseki" code="<%=MessageIdConstant.SKF3010_SC006_SUNROOMMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="sunRoomMenseki" name="sunRoomMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${f:h(form.sunRoomMenseki)}" class="${form.sunRoomMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="39"/>㎡
							</td>
						</tr>
						<tr>
							<th>
			<!-- 				<label>貸与区分</label> -->
								<nfwui:LabelBox id="lblSunRoomMenseki" code="<%=MessageIdConstant.SKF3010_SC006_LENDKBN %>" />
							</th>
							<td>
								<imui:select id="lendKbn" name="lendKbn" 
									width="200" list="${form.lendKbnList}" class="${form.lendKbnError}" tabindex="34" />
								<imui:textbox id="lendKbnHosoku" name="lendKbnHosoku" style="width:120px;" value="${f:h(form.lendKbnHosoku)}" 
								class="${form.lendKbnHosokuError}" placeholder="例　貸与区分" maxlength="5" tabindex="35"/>
							</td>
							<th>
		<!-- 					<label>寒冷地減免事由区分</label> -->
							<nfwui:LabelBox id="lblColdExemptionKbn" code="<%=MessageIdConstant.SKF3010_SC006_COLDEXEMPTIONKBN %>" />
							</th>
							<td>
								<imui:select id="coldExemptionKbn" name="coldExemptionKbn" 
									width="200" list="${form.coldExemptionKbnList}" tabindex="40" />
							</td>
						</tr>
						<tr>
							<th rowspan="3">
			<!-- 				<label>備考</label> -->
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC005_BIKO %>" />
							</th>
							<td rowspan="3">
								<imui:textArea id="roomBiko" name="roomBiko" style="width:90%;" value="${f:h(form.roomBiko)}" cols="35" rows="5" maxlength="100" tabindex="36"/>
							</td>
							<th>
		<!-- 				<label>階段面積</label> -->
								<nfwui:LabelBox id="lblStairsMenseki" code="<%=MessageIdConstant.SKF3010_SC006_STAIRSMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="stairsMenseki" name="stairsMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${f:h(form.stairsMenseki)}" class="${form.stairsMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="41"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 				<label>物置面積</label> -->
								<nfwui:LabelBox id="lblBarnMenseki" code="<%=MessageIdConstant.SKF3010_SC006_BARNMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="barnMenseki" name="barnMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${f:h(form.barnMenseki)}" class="${form.barnMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="42"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 				<label>物置調整面積</label> -->
								<nfwui:LabelBox id="lblBarnMensekiAdjust" code="<%=MessageIdConstant.SKF3010_SC006_BARNMENSEKIADJUST %>" />
							</th>
							<td>
								<span id="spbarnMensekiAdjust">${form.barnMensekiAdjust}</span>㎡
							</td>
						</tr>
				</tbody>
				</nfwui:Table>
			</div>
			<div id="parking_info">
				<table class="imui-form" id="parkingTable">
					<colgroup>
						<col style="width:15%;"/>
						<col/>
						<col/>
						<col style="width:30%;"/>
					</colgroup>
					<tbody>
						<!--駐車場構造-->
						<tr>
							<th>
								<nfwui:LabelBox id="lblParkingStructureKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_STRUCTURE_KBN %>" />
							</th>
							<td colspan="2">
								<!-- 駐車場構造リスト -->
								<imui:select id="parkingStructure" name="parkingStructure" width="200"
								list="${form.parkingStructureList}" class="${form.parkingStructureErr}" tabindex="43" />
							</td>
							<td style="border:none;background-color:#ffffff;box-shadow:none;"></td>
						</tr>
						<tr>
						<!-- 駐車場所在地 -->
							<th>
								<nfwui:LabelBox id="lblParkingAddress" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_ADDRESS %>" />
							</th>
							<td colspan="2">
								<label id="parkingAddress" name="parkingAddress">
									${form.parkingAddress}
								</label>
							</td>
						</tr>
						<tr>
						<!--駐車場補足-->
							<th rowspan="3">
								<nfwui:LabelBox id="lblParkingSupplement" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_SUPPLEMENT %>" />
							</th>
							<!--駐車場補足1-->
							<td style="width:30%;">
								<a id="${form.parkingHosokuLink1}" tabindex="44">${form.parkingHosokuFileName1}</a>
							</td>
							<td>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking1" name="tmpFileBoxparking1" />
								<!-- 参照 -->
								<imui:button id="impParkingHosoku1" name="impParkingHosoku1" value="参照" class="imui-small-button" tabindex="45" onclick="fileSelect('1','parking')"/>&nbsp;
								<!-- 削除 -->
								<imui:button id="delParkingHosoku1" name="delParkingHosoku1" value="削除" class="imui-small-button" tabindex="46" onclick="fileDelete('1','parking')"/>
							</td>
						</tr>
						<tr style="display:table-row;">
							<!--駐車場補足2-->
							<td >
								<a id="${form.parkingHosokuLink2}" tabindex="47">${form.parkingHosokuFileName2}</a>
							</td>
							<td > 
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking2" name="tmpFileBoxparking2" />
								<!-- 参照 -->
								<imui:button id="impParkingHosoku2" name="impParkingHosoku2" value="参照" class="imui-small-button" tabindex="48" onclick="fileSelect('2','parking')"/>&nbsp;
								<!-- 削除 -->
								<imui:button id="delParkingHosoku2" name="delParkingHosoku2" value="削除" class="imui-small-button" tabindex="49" onclick="fileDelete('2','parking')"/>
							</td>
						</tr>
						<tr style="display:table-row;">
							<!--駐車場補足3-->
							<td>
								<a id="${form.parkingHosokuLink3}" tabindex="50">${form.parkingHosokuFileName3}</a>
							</td>
							<td >
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking3" name="tmpFileBoxparking3" />
								<!-- 参照 -->
								<imui:button id="impParkingHosoku3" name="impParkingHosoku3" value="参照" class="imui-small-button" tabindex="51" onclick="fileSelect('3','parking')"/>&nbsp;
								<!-- 削除 -->
								<imui:button id="delParkingHosoku3" name="delParkingHosoku3" value="削除" class="imui-small-button" tabindex="52" onclick="fileDelete('3','parking')"/>
							</td>
						</tr>
						<tr>
						<!-- 区画番号 -->
							<th>
								<nfwui:LabelBox id="lblParkingBlock" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_BLOCK %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="parkingBlock" name="parkingBlock" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${f:h(form.parkingBlock)}" class="${form.parkingBlockError}" placeholder="例　01（半角）" maxlength="10" tabindex="53"/>
							</td>
						</tr>
						<tr>
						<!--貸与区分-->
							<th>
								<nfwui:LabelBox id="lblParkingLendKbn" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_LEND %>" />
							</th>
							<td colspan="2">
								<label id="parkingLendKbn" name="parkingLendKbn">
									${form.parkingLendKbn}
								</label>
							</td>
						</tr>
						<tr>
						<!--使用者-->
							<th>
								<nfwui:LabelBox id="lblShiyosya" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_SHIYOSHA %>" />
							</th>
							<td colspan="2">
								<label id="shiyosya" name="shiyosya">
									${form.shiyosya}
								</label>
							</td>
						</tr>
						<tr>
						<!--駐車場基本使用料-->
							<th>
								<nfwui:LabelBox id="lblParkingRental" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_RENTAL %>" />
							</th>
							<td colspan="2">
								<label id="parkingBasicRent" name="parkingBasicRent">
									${form.parkingRent }&nbsp;円
								</label>
							</td>
						</tr>
						<tr>
						<!--駐車場調整金額-->
							<th>
								<nfwui:LabelBox id="lblParkingRentalAdjust" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_RENTAL_ADJUST %>" />
							</th>
							<td colspan="2">
							<imui:textbox id="parkingRentalAdjust" name="parkingRentalAdjust" style="text-align: right;width:100px;ime-mode: disabled;" pattern="\d*"
								maxlength="6" value="${f:h(form.parkingRentalAdjust)}" class="${form.parkingRentalAdjustError}" tabindex="54" />
<%-- 								<nfwui:NumberBox name="parkingRentalAdjust" id="parkingRentalAdjust" cssClass="${form.parkingRentalAdjustError}" cssStyle="width:100px;"  --%>
<%-- 								inputFormat="n0" maxlength="8"  min="-999999" tabindex="54"/> --%>
								&nbsp;円
							</td>
						</tr>
						<tr>
						<!--駐車場月額使用料-->
							<th>
								<nfwui:LabelBox id="lblParkingShiyoMonthFei" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_SHIYO_MONTH_FEI %>" />
							</th>
							<td colspan="2">
								<label id="parkingShiyoMonthFei" name="parkingShiyoMonthFei">
									${form.parkingShiyoMonthFei }&nbsp;円
								</label>
							</td>
						</tr>
						<!--備考-->
						<tr>
							<th>
								<nfwui:LabelBox id="lblParkingBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_BIKO %>" />
							</th>
							<td colspan="2">
								<imui:textArea id="parkingBiko" name="parkingBiko" rows="4" maxlength="100" style="width:90%;" value="${f:h(form.parkingBiko)}" tabindex="55" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="bihin_info">
				<imui:listTable id="bihinInfoList" process="jssp" autoEncode="false" autoWidth="false" rowNumbers="true" autoResize="false" 
						onCellSelect="onCellSelect" multiSelect="false" data="${form.bihinInfoListTableData }" style="max-height: 800px;" height="auto" tabinex="56">
					<cols sortable="false">
						<col name="bihinCd" caption="備品コード" hidden="true" key="true" />
						<col name="bihinName" caption="備品名称" width="165" sortable="false" align="left" wrap="true" />
						<col name="bihinStatusKbn" caption="備付状況" width="110" sortable="false" align="center" wrap="true" />
						<col name="updateDate" caption="更新日時" hidden="true" />
					</cols>
				</imui:listTable>
			</div>
			<div id="admin_info">
				<nfwui:Table use="input">
					<tbody>
						<tr >
							<td style="width:10%;border:none;background-color:#ffffff;box-shadow:none;"/>
							<th style="width:20%;">
								<!-- 管理会社 -->
								<nfwui:LabelBox id="lblManageCompany" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_COMPANY %>" />
							</th>
							<th style="width:20%;">
								<!-- 鍵管理者 -->
								<nfwui:LabelBox id="lblKeyManager" code="<%=MessageIdConstant.SKF3010_SC002_LBL_KEY_MANAGER %>" />
							</th>
							<td style="width:20%;border:none;background-color:#ffffff;box-shadow:none;"/>
						</tr>
						<tr>
							<!--会社名-->
							<th>
								<nfwui:LabelBox id="lblManageCompanyName" code="<%=MessageIdConstant.SKF3010_SC006_COMPANY_NAME %>" />
							</th>
							<td>
								<!-- 管理会社 -->
								<imui:textbox id="manageCompanyName" name="manageCompanyName" style="width:150px;"
								maxlength="60" value="${f:h(form.manageCompanyName)}" placeholder="例　○○管理会社" tabindex="57" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerCompanyName" name="keyManagerCompanyName" style="width:150px;"
								maxlength="60" value="${f:h(form.keyManagerCompanyName)}" placeholder="例　○○管理会社" tabindex="62" />
							</td>
						</tr>
						<tr>
							<!-- 担当者名 -->
							<th>
								<nfwui:LabelBox id="lblManageName" code="<%=MessageIdConstant.SKF3010_SC006_MANAGE_NAME %>" />
							</th>
							<td>
								<!-- 管理会社 -->
								<imui:textbox id="manageName" name="manageName" style="width:150px;"
								maxlength="30" value="${f:h(form.manageName)}" placeholder="例　中日本　太郎" tabindex="58" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerName" name="keyManagerName" style="width:150px;" maxlength="30"
								value="${f:h(form.keyManagerName)}" placeholder="例　中日本　太郎" tabindex="63" />
							</td>
						</tr>
						<tr>
							<!-- 電子メールアドレス -->
							<th>
								<nfwui:LabelBox id="lblManageMailAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_MAIL_ADDRESS %>" />
							</th>
							<td>
								<!-- 管理会社 -->
								<imui:textbox id="manageMailAddress" name="manageMailAddress" style="width:260px;"
								maxlength="50" value="${f:h(form.manageMailAddress)}" placeholder="例　t.nakanihon.aa@" tabindex="59" 
								class="${form.manageMailAddressError}"/>
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerMailAddress" name="keyManagerMailAddress" style="width:260px;"
								maxlength="50" value="${f:h(form.keyManagerMailAddress)}" placeholder="例　t.nakanihon.aa@" tabindex="64" 
								class="${form.keyManagerMailAddressErr}"/>
							</td>
						</tr>
						<tr>
							<!-- 電話番号 -->
							<th>
								<nfwui:LabelBox id="lblManageTelNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_TEL_NO %>" />
							</th>
							<td>
								<!-- 管理会社 -->
								<imui:textbox id="manageTelNumber" name="manageTelNumber" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.manageTelNumber)}" placeholder="例　052-999-9999" tabindex="60" 
								class="${form.manageTelNumberError}"/>
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerTelNumber" name="keyManagerTelNumber" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.keyManagerTelNumber)}" placeholder="例　052-999-9999" tabindex="65" 
								class="${form.keyManagerTelNumberErr}"/>
							</td>

						</tr>
						<tr>
							<!--備考-->
							<th rowspan="4">
								<nfwui:LabelBox id="lblManageBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_BIKO %>" />
							</th>
							<td rowspan="4">
								<!-- 管理会社 -->
								<imui:textArea id="manageBiko" name="manageBiko" rows="4" maxlength="400"
														style="width:260px;" value="${f:h(form.manageBiko)}" tabindex="61" />
							</td>
							<td rowspan="4">
								<!-- 鍵管理者 -->
								<imui:textArea id="keyManagerBiko" name="keyManagerBiko" rows="4" maxlength="400"
														style="width:260px;" value="${f:h(form.keyManagerBiko)}" tabindex="66" />
							</td>
						</tr>
						<tr />
						<tr />
						<tr />
					</tbody>
				</nfwui:Table>
			</div>
			<div id="keiyaku_info">
				<nfwui:Table use="input">
					<tbody>
						<tr>
							<th rowspan="13" style="width:5%" >
								<!-- 社宅 -->
								<nfwui:LabelBox id="lblContractShataku" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_SHATAKU %>" />
							</th>
							<th colspan="2"  style="width:15%;">
								<!-- 契約番号 -->
								<nfwui:LabelBox id="lblContractNumber" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_NUMBER %>" />
							</th>
							<td  style="width:30%">
								<!-- 契約番号リスト -->
								<imui:select id="contractNo" name="contractNo" width="200" list="${form.contractNoList}"
																			tabindex="67" disabled="${form.contractDelDisableFlg }"/>
								<!-- 追加ボタン -->
								<imui:button id="contractAdd" name="contractAdd" value="追加" class="imui-small-button" 
												disabled="${form.contractAddDisableFlg}" onclick="contractAddClick()" tabindex="68" />
								<!-- 削除ボタン -->
								<imui:button id="contractDell" name="contractDell" value="削除" class="imui-small-button" 
												disabled="${form.contractDelDisableFlg}" onclick="contractDelClick()" tabindex="69" />
							</td>
							<th rowspan="13" style="width:5%" >
								<!-- 駐車場 -->
								<nfwui:LabelBox id="lblContractParking" code="<%=MessageIdConstant.SKF3010_SC006_CONTRACT_PARKING %>" />
							</th>
							<th colspan="2"  style="width:15%;">
								<!-- 契約番号 -->
								<nfwui:LabelBox id="lblContractNumber" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_NUMBER %>" />
							</th>
							<td  style="width:30%">
								<!-- 契約番号リスト -->
								<imui:select id="parkingContractNo" name="parkingContractNo" width="200" list="${form.parkingContractNoList}"
																			tabindex="79" disabled="${form.parkingContractDelDisableFlg }"/>
								<!-- 追加ボタン -->
								<imui:button id="parkingContractAdd" name="parkingContractAdd" value="追加" class="imui-small-button" 
												disabled="${form.parkingContractAddDisableFlg}" onclick="parkingContractAddClick()" tabindex="80" />
								<!-- 削除ボタン -->
								<imui:button id="parkingContractDel" name="parkingContractDel" value="削除" class="imui-small-button" 
												disabled="${form.parkingContractDelDisableFlg}" onclick="parkingContractDelClick()" tabindex="81" />
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 賃貸人（代理人） -->
								<nfwui:LabelBox id="lblContractOwner" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_OWNER %>" />
							</th>
							<td>
								<!-- 賃貸人（代理人）テキストボックス -->
								<imui:textbox readonly="true" id="contractOwnerName" name="contractOwnerName" class="${form.contractOwnerNameErr }"
									style="width:150px;" value="${f:h(form.contractOwnerName)}" disabled="${form.contractDelDisableFlg }" tabindex="70"
									onKeyDown="contractOwnerName_KeyDown(event)" />
								<!-- 支援ボタン -->
								<nfwui:PopupButton id="contractSupport" name="contractSupport" value="支援" use="popup"
									cssClass="imui-small-button" popupWidth="640" popupHeight="800"
									modalMode="true" screenUrl="skf/Skf3070Sc004/init"
									disabled="${form.contractDelDisableFlg }"
									 tabindex="71"/>
							</td>
							<th colspan="2">
								<!-- 契約形態(駐車場) -->
								<nfwui:LabelBox id="lblParkingContractType" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_CONTRACT_TYPE %>" />
							</th>
							<td >
							<imui:select id="parkingContractType" name="parkingContractType" 
								 width="130" list="${form.parkingContractTypeList}" tabindex="82" disabled="${form.parkingContractTypeDisabled}" class="${form.parkingContractTypeError}"/>
			               </td>
						</tr>
						<tr>
							<th rowspan="2">
								<!-- 所在地 -->
								<nfwui:LabelBox id="lblContractAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ADDRESS %>" />
							</th>
							<th>
								<!-- 郵便番号 -->
								<nfwui:LabelBox id="lblContractPostNumber" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_POST_NUMBER %>" />
							</th>
							<td>
								<label id="contractZipCd" name="contractZipCd" />
							</td>
							<th colspan="2">
								<!-- 賃貸人（代理人）（駐車場） -->
								<nfwui:LabelBox id="lblContractOwner" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_OWNER %>" />
							</th>
							<td>
								<!-- 賃貸人（代理人）テキストボックス -->
								<imui:textbox readonly="true" id="parkingOwnerName" name="parkingOwnerName" class="${form.parkingOwnerNameError }"
									style="width:150px;height:98%" value="${f:h(form.parkingOwnerName)}" disabled="${form.parkingContractInfoDisabled}" tabindex="83" 
									onKeyDown="parkingOwnerName_KeyDown(event)"/>
								<!-- 支援ボタン -->
								<nfwui:PopupButton id="parkingContractSupport" name="parkingContractSupport" value="支援" use="popup"
									cssClass="imui-small-button" popupWidth="640" popupHeight="800"
									modalMode="true" screenUrl="skf/Skf3070Sc004/init"
									disabled="${form.parkingContractInfoDisabled }"
									 tabindex="84"/>
							</td>
						</tr>
							<!--住所-->
						<tr>
							<th>
								<!-- 住所 -->
								<nfwui:LabelBox id="lblContractDetailAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_DETAIL_ADDRESS %>" />
							</th>
							<td>
 								<label id="contractAddress" name="contractAddress" />
							</td>
							<th rowspan="2">
								<!-- 所在地 -->
								<nfwui:LabelBox id="lblContractAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ADDRESS %>" />
							</th>
							<th>
								<!-- 郵便番号（駐車場） -->
								<nfwui:LabelBox id="lblContractPostNumber" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_POST_NUMBER %>" />
							</th>
							<td>
								<imui:textbox id="parkingZipCd" name="parkingZipCd" style="ime-mode: disabled;width:85px;" value="${f:h(form.parkingZipCd)}" class="${form.parkingZipCdError}" 
								disabled="${form.parkingContractInfoDisabled}" placeholder="例　4600003" maxlength="7" tabindex="85"/>
								<imui:button id="parkingAddressSearch" name="parkingAddressSearch" value="住所検索" class="imui-small-button" 
								disabled="${form.parkingContractInfoDisabled}" onclick="addressOnClick()" tabindex="86" />
							</td>
						</tr>
						<tr></tr>
						<tr>
							<th colspan="2">
								<!-- 経理連携用管理番号 -->
								<nfwui:LabelBox id="lblContractAssetRegisterNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ASSET_REGISTER_NO %>" />
							</th>
							<td>
								<imui:textbox id="assetRegisterNo" name="assetRegisterNo" style="ime-mode:disabled;width:150px;" maxlength="15"
									class="${form.assetRegisterNoErr}" value="${f:h(form.assetRegisterNo)}" placeholder="例　A001002003004" disabled="${form.contractDelDisableFlg }" tabindex="72" />
							</td>
							<!-- 住所（駐車場） -->
							<th>
								<nfwui:LabelBox id="lblParkingContractAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_DETAIL_ADDRESS%>" />
							</th>
							<td>
								<imui:textbox id="parkingContractAddress" name="parkingContractAddress" style="width:300;" value="${f:h(form.parkingContractAddress)}" 
								class="${form.parkingAddressError}" placeholder="例　愛知県名古屋市中区錦2-18-19" maxlength="50" tabindex="87" disabled="${form.parkingContractInfoDisabled}"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 契約開始日 -->
								<nfwui:LabelBox id="lblContractStartDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_START_DAY%>" />
							</th>
							<td>
							<!--
								<imui:textbox style="ime-mode:disabled; width:95px;" id="contractStartDay" name="contractStartDay"
									maxlength="10" value="${form.contractStartDay}" placeholder="例　2020/09/01" tabindex="70" />
								<im:calendar floatable="true" altField="#contractStartDay"/>
							-->
								<nfwui:DateBox id="contractStartDay" name="contractStartDay" cssClass="${form.contractStartDayErr }"
									value="${f:h(form.contractStartDay)}" cssStyle="width:100px" disabled="${form.contractDelDisableFlg }" tabindex="73"/>
							</td>
							<th colspan="2">
							<!-- 駐車場名 -->
								<nfwui:LabelBox id="lblParkingName" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_NAME %>" />
							</th>
							<td colspan="3">
								<imui:textbox id="parkingName" name="parkingName" style="width:150px;" value="${f:h(form.parkingName)}" 
									class="${form.parkingNameError}" disabled="${form.parkingContractInfoDisabled}" placeholder="例　駐車場名" maxlength="30" tabindex="88"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 契約終了日 -->
								<nfwui:LabelBox id="lblContractEndtDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_END_DAY %>" />
							</th>
							<td>
							<!--
								<imui:textbox style="ime-mode:disabled; width:95px;" id="contractEndDay" name="contractEnDay"
									maxlength="10" value="${form.contractEndDay}" placeholder="例　2020/09/30" tabindex="71" />
								<im:calendar floatable="true" altField="#contractEndDay"/>
							-->
								<nfwui:DateBox id="contractEndDay" name="contractEndDay" cssClass="${form.contractEndDayErr }"
									value="${f:h(form.contractEndDay)}" cssStyle="width:100px" disabled="${form.contractDelDisableFlg }" tabindex="74"/>
							</td>
							<th colspan="2">
								<!-- 経理連携用管理番号（駐車場） -->
								<nfwui:LabelBox id="lblContractAssetRegisterNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ASSET_REGISTER_NO %>" />
							</th>
							<td>
								<imui:textbox id="parkingAssetRegisterNo" name="parkingAssetRegisterNo" style="ime-mode:disabled;width:150px;" class="${form.parkingAssetRegisterNoError}" maxlength="15"
									value="${f:h(form.parkingAssetRegisterNo)}" placeholder="例　A001002003004" disabled="${form.parkingContractInfoDisabled }" tabindex="89" />
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 家賃 -->
								<nfwui:LabelBox id="lblContractRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractRent" name="contractRent" max="99999999" min="0" 
									cssClass="${form.contractRentErr}" cssStyle="width:100px;"
									maxlength="10" disabled="${form.contractDelDisableFlg }" tabindex="75" inputFormat="n0" />&nbsp;円
							</td>
							<th colspan="2">
								<!-- 契約開始日 -->
								<nfwui:LabelBox id="lblContractStartDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_START_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="parkingContractStartDay" name="parkingContractStartDay" value="${f:h(form.parkingContractStartDay)}" 
									cssStyle="width:100px" cssClass="${f:h(form.parkingContractStartDateError)}" disabled="${form.parkingContractInfoDisabled}" tabindex="90"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 共益費 -->
								<nfwui:LabelBox id="lblContractKyoekihi" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_KYOEKIHI %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractKyoekihi" name="contractKyoekihi" max="99999999" min="0" 
									cssClass="${form.contractKyoekihiErr }" cssStyle="width: 100px;"
									maxlength="10" value="${form.contractKyoekihi}" disabled="${form.contractDelDisableFlg }" tabindex="76" />&nbsp;円
							</td>
							<th colspan="2">
								<!-- 契約終了日 -->
								<nfwui:LabelBox id="lblContractEndtDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_END_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="parkingContractEndDay" name="parkingContractEndDay" value="${f:h(form.parkingContractEndDay)}" 
									 cssStyle="width:100px" cssClass="${f:h(form.parkingContractEndDateError)}" disabled="${form.parkingContractInfoDisabled }" tabindex="91"/>
							</td>
						</tr> 
						<tr>
							<th colspan="2">
								<!-- 駐車場料（地代） -->
								<nfwui:LabelBox id="lblContractLandRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_LAND_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractLandRent" name="contractLandRent" max="99999999" min="0" 
									cssClass="${form.contractLandRentErr}" cssStyle="width: 100px;"
									maxlength="10" value="${form.contractLandRent}" disabled="${form.contractDelDisableFlg }" tabindex="77" />&nbsp;円
							</td>
							<th colspan="2">
								<!-- 駐車場料（地代）(駐車場) -->
								<nfwui:LabelBox id="lblContractLandRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_LAND_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="parkingLandRent" name="parkingLandRent" max="999999" min="0" cssClass="${f:h(form.parkingLandRentError)}" cssStyle="width: 100px;"
									maxlength="8" value="${form.parkingLandRent}" disabled="${form.parkingContractInfoDisabled }" tabindex="92" />&nbsp;円
							</td>
						</tr>
						<tr>
							<th rowspan ="2" colspan="2">
								<!-- 備考 -->
								<nfwui:LabelBox id="lblContractBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_BIKO %>" />
							</th>
							<td rowspan="2">
								<imui:textArea id="contractBiko" name="contractBiko" rows="5" clols="35" maxlength="400"
									style="width:90%;" value="${f:h(form.contractBiko)}" disabled="${form.contractDelDisableFlg }" tabindex="78" />
							</td>
							<th rowspan ="2" colspan="2">
								<!-- 備考（駐車場） -->
								<nfwui:LabelBox id="lblContractBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_BIKO %>" />
							</th>
							<td rowspan="2">
								<imui:textArea id="parkingContractBiko" name="parkingContractBiko" rows="5" clols="35" maxlength="400"
									style="width:90%;" value="${f:h(form.parkingContractBiko)}" disabled="${form.parkingContractInfoDisabled }" tabindex="93" />
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
			<script type="text/javascript">
				(function($) {
					// 画面表示時に定義される処理
					$(document).ready(function(){
						// 契約情報タブの郵便番号を基本情報タブの郵便番号に設定
						$('#contractZipCd').text($('#zipCd').val());
						// 契約情報タブの住所を基本情報タブの県名 + 住所に設定
						$('#contractAddress').text($('#pref option:selected').text() + $('#shatakuAddress').val());
						
						/** 契約情報変更チェック */
						// 契約情報の「賃貸人、経理連携用管理番号、契約開始日、契約終了日、家賃、共益費、駐車場料、備考」のいづれかに変更があるかチェックする
						// 戻り値：変更有り(true)、変更なし(false)
						checkContractInfo = function() {
							// 変更チェック(賃貸人、経理連携用管理番号、契約開始日、契約終了日、家賃、共益費、駐車場料、備考)
							if ($("#startingContractOwnerName").val() != $("#contractOwnerName").val()
								|| $("#startingContractOwnerNo").val() != $("#contractOwnerNo").val()
								|| $("#startingAssetRegisterNo").val() != $("#assetRegisterNo").val()
								|| $("#startingContractStartDay").val().replace(/\//g, "") != $("#contractStartDay").val().replace(/\//g, "")
								|| $("#startingContractEndDay").val().replace(/\//g, "") != $("#contractEndDay").val().replace(/\//g, "")
								|| $("#startingContractRent").val().replace(/,/g, "") != $("#contractRent").val().replace(/,/g, "")
								|| $("#startingContractKyoekihi").val().replace(/,/g, "") != $("#contractKyoekihi").val().replace(/,/g, "")
								|| $("#startingContractLandRent").val().replace(/,/g, "") != $("#contractLandRent").val().replace(/,/g, "")
								|| $("#startingContractBiko").val() != $("#contractBiko").val())
							{
								return true;
							}
							return false;
						}
						/** 駐車場契約情報変更チェック */
						// 駐車場契約情報に変更があるかチェックする
						// 戻り値：変更有り(true)、変更なし(false)
						checkParkingContractInfo = function() {
							// 変更チェック
							if ($("#startingParkingContractOwnerName").val() != $("#parkingOwnerName").val()
								|| $("#startingParkingAssetRegisterNo").val() != $("#parkingAssetRegisterNo").val()
								|| $("#startingParkingContractStartDay").val() != $("#parkingContractStartDay").val().replace(/\//g, "")
								|| $("#startingParkingContractEndDay").val() != $("#parkingContractEndDay").val().replace(/\//g, "")
								|| $("#startingParkingZipCd").val() != $("#parkingZipCd").val()
								|| $("#startingParkingContractAddress").val() != $("#parkingContractAddress").val()
								|| $("#startingParkingName").val() != $("#parkingName").val().replace(/,/g, "")
								|| $("#startingParkingContractLandRent").val() != $("#parkingLandRent").val().replace(/,/g, "")
								|| $("#startingParkingContractBiko").val() != $("#parkingContractBiko").val()
								|| $("#startingParkingContractType").val() != $("#parkingContractType").val())
							{
								return true;
							}
							return false;
						}
						
						// JSON備品リスト設定
						// 備品リストをJSON文字列に変換し
						// formのhidden変数「jsonBihin」に格納する
						setJsonBihinList = function() {
							// 備品情報リスト
							var bihinArray = new Array();
							{
								// 備品情報取得
								var bihinArrrows = $("#bihinInfoList").getRowData();
								// 備品行数取得
								var bihinRowNum = bihinArrrows.length;
								// 備品情報リスト作成
								for (var i = 0; i < bihinRowNum; i++) {
									var bihinMap = new Object();
									bihinMap['bihinCd'] = bihinArrrows[i].bihinCd;
									bihinMap['bihinName'] = bihinArrrows[i].bihinName;
									bihinMap['bihinStatusKbn'] = $("#bihinStatus" + i).val();
									bihinMap['updateDate'] = bihinArrrows[i].updateDate;
									bihinArray.push(bihinMap);
								}
							}
							// 備品情報リストをJSON文字列に変換
							$('#jsonBihin').val(JSON.stringify(bihinArray));
						}
						
						// JSONドロップダウン選択値設定
						// ドロップダウン選択値をリスト形式にし、JSON文字列に変換後
						// formのhidden変数「jsonDrpDwnList」に格納する
						setDrpDwnList = function() {
							// ドロップダウン選択値リスト
							var drpDwnArray = new Array();
							{
								// ドロップダウン選択値リスト作成
								var drpDwnMap = new Object();
								// 地域区分
								drpDwnMap['areaKbn'] = $('#areaKbn').val();
								// 利用区分
								drpDwnMap['useKbn'] = $('#useKbn').val();
								// 管理会社
								drpDwnMap['manageCompany'] = $("#manageCompany").val();
								// 管理機関
								drpDwnMap['manageAgency'] = $('#manageAgency').val();
								// 管理事業領域
								drpDwnMap['manageBusinessArea'] = $('#manageBusinessArea').val();
								// 社宅住所(都道府県)
								drpDwnMap['pref'] = $('#pref').val();
								// 社宅構造
								drpDwnMap['shatakuStructure'] = $('#shatakuStructure').val();
								// エレベーター
								drpDwnMap['elevator'] = $('#elevator').val();
								// 駐車場構造
								drpDwnMap['parkingStructure'] = $('#parkingStructure').val();
								// 契約情報
								drpDwnMap['contractNo'] = $('#contractNo').val();
								drpDwnMap['contractText'] = $('#contractNo').children("option:selected").text().trim();
								// 契約情報
								drpDwnMap['parkingContractNo'] = $('#parkingContractNo').val();
								drpDwnMap['parkingContractNoText'] = $('#parkingContractNo').children("option:selected").text().trim();
								drpDwnArray.push(drpDwnMap);
							}
							// ドロップダウン選択値リストをJSON文字列に変換
							$('#jsonDrpDwnList').val(JSON.stringify(drpDwnArray));
						}
						
						// JSON可変ラベルリスト設定
						// 可変値ラベルをリスト形式にし、JSON文字列に変換後
						// formのhidden変数「jsonLabelList」に格納する
						setVariableLabelList = function() {
							// 可変ラベルリスト
							var labelArray = new Array();
							{
								// 可変ラベルリスト作成
								var labelMap = new Object();
								// 実年数
								labelMap['realYearCount'] = $('#realYearCount').text().trim();
								// 次回算定年月日
								labelMap['nextCalculateDate'] = $('#nextCalculateDate').text().trim();
								// 経年
								labelMap['aging'] = $('#aging').text().trim();
								// 駐車場基本使用料（※「 円」自動付与されるので削除）
								labelMap['parkingBasicRent'] = $('#parkingBasicRent').text().replace("円", "").trim();
								// 駐車場月額使用料
								labelMap['parkingShiyoMonthFei'] = $('#parkingShiyoMonthFei').text().replace("円", "").trim();
								// 調整金額
								labelMap['parkingRentalAdjust'] = $('#parkingRentalAdjust').val();
								labelArray.push(labelMap);
							}
							// 可変ラベルリストをJSON文字列に変換
							$('#jsonLabelList').val(JSON.stringify(labelArray));
						}
						// 現在状態バックアップ
						// ドロップ選択値ダウンリスト、可変ラベルリスト、リストテーブルのバックアップを行う
						backUpStatus = function() {
							// JSON駐車場区画情報リスト設定
							//setJsonParkingBlock();
							// JSON備品リスト設定
							setJsonBihinList();
							// JSONドロップダウン選択値リスト設定
							setDrpDwnList();
							// JSON可変ラベルリスト設定
							setVariableLabelList();
						}
						
						/** クリックイベント */
						//補足資料参照ボタンクリック
						fileSelect = function(no,type) {
							
							var fileboxId = '#tmpFileBox'+ type + no;
							//FileBoxを疑似的にクリック
							$(fileboxId).trigger("click");
							
							if($(fileboxId).val() != ""){
								//ファイル番号設定
								$("#fileNo").val(no);
								$("#hosokuType").val(type);
								//保存情報設定
								setJsonBihinList();
								setVariableLabelList();
// 								url = "skf/Skf3010Sc006/attachedFileAdd";
// 								$("#form").attr("action", url);
// 								$("#form").submit();
								formId= "form";
								url = "skf/Skf3010Sc006/attachedFileAdd";
								nfw.common.submitForm(formId, url);
							}
							
						}
						//補足資料削除ボタンクリック
						fileDelete = function(no,type) {
							
								//ファイル番号設定
								$("#fileNo").val(no);
								$("#hosokuType").val(type);
								//保存情報設定
								setJsonBihinList();
								setVariableLabelList();
								
								var dialogTitle = "確認";
								//MessageIdConstant.：I-SKF-3005
								var dialogMessage = "削除します。よろしいですか？";
								nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc006/attachedFileDelete", "ok", "キャンセル", this, true);
							
						}
						
						// 登録ボタンクリック
						enterClick = function() {
							//MessageIdConstant.I_SKF_3035[{0}を登録します。よろしいですか？]
							dialogMessage = "借上社宅情報を登録します。よろしいですか？";
							$("<div>借上社宅情報を登録します。よろしいですか？</div>").imuiMessageDialog({
								iconType : 'question',
								title : '確認',
								modal : true,
								buttons: [
									{
										'id': 'tourokuOk',
										'text': 'ok',
										'click': function() {
											$(this).imuiMessageDialog('close');
											// 登録処理
											enterHoyuShataku();
										}
									},
									{
										'text': 'キャンセル',
										'click': function() {
											$(this).imuiMessageDialog('close');
										}
									}
								]
							});
						}

						// 登録処理
						enterHoyuShataku = function() {
							// 現在状態バックアップ
							backUpStatus();
							// 新規の場合は「地域区分」「建築年月日」「構造」「駐車場構造」更新チェック
							if (($("#hdnShatakuKanriNo").val().length > 0)
								&& ($("#startingBuildDate").val() != $("#buildDate").val().replace(/\//g, "")
								|| $("#startingShatakuStructure").val() != $("#shatakuStructure").val()
								|| $("#startingParkingStructure").val() != $("#parkingStructure").val()
								|| $("#startingAreaKbn").val() != $("#areaKbn").val()))
							{
								//MessageIdConstant.：I-SKF-3033
								$("<div>使用料計算に影響する項目が更新されました。登録処理を実行してよろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'tourokuOk',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
// 												url = "skf/Skf3010Sc006/regist";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/regist";
												nfw.common.submitForm(formId, url);

											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
											}
										}
									]
								});
							} else {
// 								url = "skf/Skf3010Sc006/regist";
// 								$("#form").attr("action", url);
// 								$("#form").submit();
								formId= "form";
								url = "skf/Skf3010Sc006/regist";
								nfw.common.submitForm(formId, url);
							}
						}
						
						// 削除ボタンクリック
						deleteClick = function() {
							// 現在状態バックアップ
							backUpStatus();
							var dialogTitle = "確認";
							//MessageIdConstant.：I-SKF-3004
							var dialogMessage = "（" + $("#shatakuName").val() + "・" + $("#roomNo").val() + "）の削除処理を実行します。よろしいですか？";
							nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc006/delete", "ok", "キャンセル", this, true);
						}
						
						// 住所検索押下時のイベント
						addressSearchClick = function() {
//						$("#addressSearch").click(function () {
							var map = new Object();
							map['zipCd'] = $("#zipCd").val();
							// 住所検索
							nfw.common.doAjaxAction("skf/Skf3010Sc002/AddressSearchAsync", map, true, function(data) {
								// 結果判定
								if ("" != data.zipCdErr) {
									$("#zipCd").prop('class', data.zipCdErr);
								} else {
									$("#pref").imuiSelect('replace', data.prefList);
									$("#shatakuAddress").val(data.shatakuAddress);
								}
								// 編集フラグを「true」に設定
								$("#onChangeFlag").val("true");
							});
						}

						// 契約情報追加ボタンクリック
						contractAddClick = function() {
							// I-SKF-3108
							$("<div>社宅の契約情報を追加します。よろしいですか？</div>").imuiMessageDialog({
								iconType : 'question',
								title : '確認',
								modal : true,
								buttons: [
									{
										'id': 'contractAddOk',
										'text': 'ok',
										'click': function() {
											$(this).imuiMessageDialog('close');
											// 契約情報変更チェック
											if (!checkContractInfo()) {
												// 現在状態バックアップ
												backUpStatus();
												// 契約情報変更なし
												url = "skf/Skf3010Sc006/addContractList";
												$("#form").attr("action", url);
												$("#form").submit();
											} else {
												$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
													iconType : 'question',
													title : '確認',
													modal : true,
													buttons: [
														{
															'id': 'contractChangeAddOk',
															'text': 'ok',
															'click': function() {
																$(this).imuiMessageDialog('close');
																// 現在状態バックアップ
																backUpStatus();
// 																url = "skf/Skf3010Sc006/addContractList";
// 																$("#form").attr("action", url);
// 																$("#form").submit();
																formId= "form";
																url = "skf/Skf3010Sc006/addContractList";
																nfw.common.submitForm(formId, url);
															}
														},
														{
															'text': 'キャンセル',
															'click': function() {
																$(this).imuiMessageDialog('close');
																// 変更前選択プルダウンに戻す
																$("#contractNo").val($("#hdnDispContractSelectedIndex").val());
															}
														}
													]
												});
											}
										}
									},
									{
										'text': 'キャンセル',
										'click': function() {
											$(this).imuiMessageDialog('close');
										}
									}
								]
							});
						}

						// 契約情報削除ボタンクリック
						contractDelClick = function() {
							if ($("#contractNo").children("option:selected").text().indexOf('契約開始日') != -1) {
								// 契約番号リスト取得
								var contractNoOptions = $("#contractNo")[0].options;
								// 契約番号リスト最大値取得
								var maxContractNo = contractNoOptions[contractNoOptions.length - 1];
								// 契約番号の最大値か確認
								var selectContractNo = $("#contractNo").val();
								// 契約番号の最大値か確認
								if ($("#contractNo").val() != maxContractNo.value) {
									var map = new Object();
									map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
									// 「最新の契約情報でないため、削除できません。」を出力
									nfw.common.doAjaxAction("skf/Skf3010Sc006/deleteContractErrAsync", map, true, function(data) {});
									return;
								}
								//MessageIdConstant.：I-SKF-3109
								$("<div>社宅の契約情報を削除します。よろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractDelOk1',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 現在状態バックアップ
												backUpStatus();
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteContractSelectedValue").val($("#contractNo").val());
// 												url = "skf/Skf3010Sc006/delContractList";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/delContractList";
												nfw.common.submitForm(formId, url);
											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
											}
										}
									]
								});
							} else {
								//MessageIdConstant.：I-SKF-2024
								$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractDelOk2',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 現在状態バックアップ
												backUpStatus();
												// 選択値設定(削除済み契約番号)
 												$("#hdnDeleteContractSelectedValue").val($("#contractNo").val());
// 												url = "skf/Skf3010Sc006/delContractList";
// 												$("#form").attr("action", url);
//												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/delContractList";
												nfw.common.submitForm(formId, url);
											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
											}
										}
									]
								});
							}
						}
						
						// 駐車場契約情報追加ボタンクリック
						parkingContractAddClick = function() {
							// I-SKF-3063
							$("<div>駐車場の契約情報を追加します。よろしいですか？</div>").imuiMessageDialog({
								iconType : 'question',
								title : '確認',
								modal : true,
								buttons: [
									{
										'id': 'contractAddOk',
										'text': 'ok',
										'click': function() {
											$(this).imuiMessageDialog('close');
											// 契約情報変更チェック
											if (!checkParkingContractInfo()) {
												// 現在状態バックアップ
												backUpStatus();
												$("#parkingSelectMode").val("addParking");
												// 契約情報変更なし
// 												url = "skf/Skf3010Sc006/changeParkingContractList";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/changeParkingContractList";
												nfw.common.submitForm(formId, url);
											} else {
												$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
													iconType : 'question',
													title : '確認',
													modal : true,
													buttons: [
														{
															'id': 'contractChangeAddOk',
															'text': 'ok',
															'click': function() {
																$(this).imuiMessageDialog('close');
																// 現在状態バックアップ
																backUpStatus();
																$("#parkingSelectMode").val("addParking");
// 																url = "skf/Skf3010Sc006/changeParkingContractList";
// 																$("#form").attr("action", url);
// 																$("#form").submit();
																formId= "form";
																url = "skf/Skf3010Sc006/changeParkingContractList";
																nfw.common.submitForm(formId, url);
															}
														},
														{
															'text': 'キャンセル',
															'click': function() {
																$(this).imuiMessageDialog('close');
																// 変更前選択プルダウンに戻す
																$("#contractNo").val($("#hdnDispParkingContractSelectedIndex").val());
															}
														}
													]
												});
											}
										}
									},
									{
										'text': 'キャンセル',
										'click': function() {
											$(this).imuiMessageDialog('close');
										}
									}
								]
							});
						}
						// 駐車場契約情報削除ボタンクリック
						parkingContractDelClick = function() {
							if (!checkParkingContractInfo() && $("#parkingEditFlg").val() != "true") {
								// 契約番号リスト取得
								var contractNoOptions = $("#parkingContractNo")[0].options;
								// 契約番号リスト最大値取得
								var maxContractNo = contractNoOptions[contractNoOptions.length - 1];
								// 契約番号の最大値か確認
								var selectContractNo = $("#parkingContractNo").val();
								// 契約番号の最大値か確認
								if ($("#parkingContractNo").val() != maxContractNo.value) {
									var map = new Object();
									map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
									// 「最新の契約情報でないため、削除できません。」を出力
									nfw.common.doAjaxAction("skf/Skf3010Sc002/DeleteContractErrAsync", map, true, function(data) {});
									return;
								}
								//MessageIdConstant.：I-SKF-3064
								$("<div>駐車場の契約情報を削除します。よろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractDelOk1',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 現在状態バックアップ
												backUpStatus();
												$("#parkingSelectMode").val("delParking");
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteParkingContractSelectedValue").val($("#parkingContractNo").val());
// 												url = "skf/Skf3010Sc006/changeParkingContractList";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/changeParkingContractList";
												nfw.common.submitForm(formId, url);
											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
											}
										}
									]
								});
							} else {
								//MessageIdConstant.：I-SKF-2024
								$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractDelOk2',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 現在状態バックアップ
												backUpStatus();
												$("#parkingSelectMode").val("delParking");
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteParkingContractSelectedValue").val($("#parkingContractNo").val());
// 												url = "skf/Skf3010Sc006/changeParkingContractList";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/changeParkingContractList";
												nfw.common.submitForm(formId, url);
											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
											}
										}
									]
								});
							}
						}
						
						checkMaxParkingContract = function(){
							// 契約番号リスト取得
							var contractNoOptions = $("#parkingContractNo")[0].options;
							// 契約番号リスト最大値取得
							var maxContractNo = contractNoOptions[contractNoOptions.length - 1];
							// 契約番号の最大値か確認
							var selectContractNo = $("#parkingContractNo").val();
							// 契約番号の最大値か確認
							if ($("#parkingContractNo").val() != maxContractNo.value) {
								return false;
							}
							return true;
						}
						
						// 駐車場契約情報ボタンクリック
						contractParkingInfoClick = function() {
							var dialogTitle = "確認";
							//MessageIdConstant.：I-SKF-3110
							var dialogMessage = "社宅情報は登録済みでしょうか。確認後、駐車場契約情報登録を行ってください。";
							nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc007/init", "ok", "キャンセル", this, true);
						}
						
						// 社員入力支援コールバック(寮長・自治会長)
						shainInfoCallback = function(param) {
//						leaderShainInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#contractOwnerName").val(param.name);	// ← 後で削除
								$("#contractOwnerNo").val(1);	// ← 後で削除
							}
						}

						// 社員入力支援コールバック(鍵管理者)
						keyManagerShainInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#keyManagerName").val(param.name);
							}
						}

						// 賃貸人入力支援コールバック
						contractOwnerInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#contractOwnerName").val(param.name);
								$("#contractOwnerNo").val(param.shainNo);
							}
						}
						// 賃貸人（駐車場）入力支援コールバック
						parkingContractOwnerInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#parkingContractOwnerName").val(param.name);
								$("#parkingContractOwnerNo").val(param.shainNo);
							}
						}
						//駐車場契約住所検索
				    	addressOnClick = function () {
							var map = new Object();
							map['parkingZipCd'] = $("#parkingZipCd").val();
							
							nfw.common.doAjaxAction("skf/Skf3010Sc006/ParkingAddressSearchAsync",map,true,function(data) {
								if(data.parkingContractAddress != null && data.parkingContractAddress!=""){
									$("#parkingContractAddress").val(data.parkingContractAddress);
									if(checkMaxParkingContract()){
										$("#parkingAddress").val(data.parkingContractAddress);
									}
								}
								$("#parkingZipCd").removeClass("nfw-validation-error");
								$("#parkingZipCd").addClass(data.parkingZipCdError);
							});
				    	}
						/** ドロップダウンチェンジイベント */
						// 管理会社ドロップダウンチェンジ
						$("#manageCompany").bind('change', function() {
							var map = new Object();
							map['selectedCompanyCd'] = $("#manageCompany").val();
							map['agencyCd'] = "";
							map['manageBusinessAreaCd'] = "";
							// ドロップダウンチェンジイベント
							nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeMngDrpDwnAsync", map, true, function(data) {
									$("#manageCompany").imuiSelect('replace', data.manageCompanyList);
									$("#manageAgency").imuiSelect('replace', data.manageAgencyList);
									$("#manageBusinessArea").imuiSelect('replace', data.manageBusinessAreaList);
							});
						});
						// 管理機関ドロップダウンチェンジ
						$("#manageAgency").bind('change', function() {
							var map = new Object();
							map['selectedCompanyCd'] = $("#manageCompany").val();
							map['agencyCd'] = $("#manageAgency").val();
							map['manageBusinessAreaCd'] = "";
							// ドロップダウンチェンジイベント
							nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeMngDrpDwnAsync", map, true, function(data) {
									$("#manageCompany").imuiSelect('replace', data.manageCompanyList);
									$("#manageAgency").imuiSelect('replace', data.manageAgencyList);
									$("#manageBusinessArea").imuiSelect('replace', data.manageBusinessAreaList);
							});
						});
						// 社宅構造ドロップダウンチェンジ
						$("#shatakuStructure").bind('change', function() {
							// テキスト内容判定
							if ("" != $("#buildDate").val()) {
								var map = new Object();
								map['buildDate'] = $("#buildDate").val();
								map['areaKbnCd'] = $("#areaKbn").val();
								map['structureKbn'] = $("#shatakuStructure").val();
								// ドロップダウンチェンジイベント
								nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeStructureDrpDwnAsync", map, true, function(data) {
									$("#realYearCount").text(data.jituAge);
									$("#nextCalculateDate").text(data.nextCalcDate);
									$("#aging").text(data.aging);
								});
							}
						});
						// 地域区分ドロップダウンチェンジ
						$("#areaKbn").bind('change', function() {
							var map = new Object();
							map['nextCalcDate'] = $("#nextCalculateDate").text();
							map['jituAge'] = $("#realYearCount").text();
							map['aging'] = $("#aging").text();
							map['buildDate'] = $("#buildDate").val();
							map['areaKbnCd'] = $("#areaKbn").val();
							map['structureKbn'] = $("#shatakuStructure").val();
							map['parkingStructure'] = $("#parkingStructure").val();
							map['parkingRentalAdjust'] = $("#parkingRentalAdjust").val();

							nfw.common.doAjaxAction("skf/Skf3010Sc006/ChangeAreaDrpDwnAsync", map, true, function(data) {
								// 次回算定年月日設定
								$("#nextCalculateDate").text(data.nextCalcDate);
								// 実年数設定
								$("#realYearCount").text(data.jituAge);
								// 経年設定
								$("#aging").text(data.aging);
								// 駐車場基本使用料設定
								$("#parkingBasicRent").text(data.parkingBasicRent + " 円");
								// 駐車場月額使用料設定
								$("#parkingShiyoMonthFei").text(data.parkingShiyoMonthFei + " 円");
							});
						});
						//部屋情報本来用途
						$("#originalAuse").bind('change', function() {
							var map = new Object();
							map['barnMenseki'] = $("#barnMenseki").val();
							map['originalAuse'] = $("#originalAuse").val();
							map['barnMensekiAdjust'] = $("hdnBarnMensekiAdjust").val();
							
							nfw.common.doAjaxAction("skf/Skf3010Sc006/ChangeBarnMensekiAsync",map,true,function(data) {
								document.getElementById('spbarnMensekiAdjust').innerHTML = data.barnMensekiAdjust;
								$("#hdnBarnMensekiAdjust").val(data.barnMensekiAdjust);
							});
						});
						//部屋情報物置面積
						$("#barnMenseki").bind('change', function() {
							var map = new Object();
							map['barnMenseki'] = $("#barnMenseki").val();
							map['originalAuse'] = $("#originalAuse").val();
							map['barnMensekiAdjust'] = $("#hdnBarnMensekiAdjust").val();
							
							nfw.common.doAjaxAction("skf/Skf3010Sc006/ChangeBarnMensekiAsync",map,true,function(data) {
								document.getElementById('spbarnMensekiAdjust').innerHTML = data.barnMensekiAdjust;
								$("#hdnBarnMensekiAdjust").val(data.barnMensekiAdjust);
							});
						});
						//駐車場貸与区分
						setParkingLendKbn = function(parkingStructure){
							if(parkingStructure == "5"){
								$("#parkingLendKbn").text("");
							}else{//$('[name=lendKbn] option:selected').text();
								$("#parkingLendKbn").text($('[name=lendKbn] option:selected').text());
							}
						}
						
						// 貸与区分ドロップダウンチェンジ
						$("#lendKbn").bind('change', function() {
							setParkingLendKbn($("#parkingStructure").val());
						
						
						});
						//駐車場契約
						setDisabled = function(state,reset){
				    		$("#parkingOwnerName").prop("disabled",state);
							$("#parkingZipCd").prop("disabled",state);
							$("#parkingContractAddress").prop("disabled",state);
							$("#parkingName").prop("disabled",state);
							$("#parkingAssetRegisterNo").prop("disabled",state);
							$("#parkingContractStartDay").prop("disabled",state);
							$("#parkingContractEndDay").prop("disabled",state);
							$("#parkingLandRent").val(null);
							$("#parkingLandRent").prop("disabled",state);
							$("#parkingContractBiko").prop("disabled",state);
							$("#parkingAddressSearch").prop("disabled",state);
							$("#parkingContractSupport").prop("disabled",state);
							
							if(reset){
								//入力値リセット
								$("#parkingOwnerName").val("");
								$("#parkingOwnerNo").val(null);
								$("#parkingZipCd").val("");
								$("#parkingContractAddress").val("");
								$("#parkingName").val("");
								$("#parkingAssetRegisterNo").val("");
								$("#parkingContractStartDay").val("");
								$("#parkingContractEndDay").val("");
								wjObj = wijmo.Control.getControl('#parkingLandRentDiv');
								wjObj.value = null;
								$('#parkingLandRent').prop("value", "");
								$("#parkingContractBiko").val("");
							}
							
							if(state){
								$('#parkingAddressSearch').addClass("imui-disabled-button");
								$('#parkingContractSupport').addClass("imui-disabled-button");
								$("#parkingContractStartDayDiv").addClass("wj-state-disabled");
								$("#parkingContractEndDayDiv").addClass("wj-state-disabled");
								$("#parkingLandRentDiv").addClass("wj-state-disabled");
							}else{
								$('#parkingAddressSearch').removeClass("imui-disabled-button");
								$('#parkingContractSupport').removeClass("imui-disabled-button");
								$("#parkingContractStartDayDiv").removeClass("wj-state-disabled");
								$("#parkingContractEndDayDiv").removeClass("wj-state-disabled");
								$("#parkingLandRentDiv").removeClass("wj-state-disabled");
 								$("#parkingContractStartDayDiv").prop("disabled",state);
 								$("#parkingContractEndDayDiv").prop("disabled",state);
 								$("#parkingLandRentDiv").prop("disabled",state);
							}
							
				    	}
						//駐車場契約形態ドロップダウン
						$("#parkingContractType").bind('change', function() {
							//契約形態変更
							if($("#parkingContractType").val()=="2"){
								setDisabled(false,true);
							}else{
								setDisabled(true,true);
							}
						});
						
						// 駐車場構造ドロップダウンチェンジ
						$("#parkingStructure").bind('change', function() {
							var map = new Object();
							map['areaKbnCd'] = $("#areaKbn").val();
							map['parkingStructure'] = $("#parkingStructure").val();
							map['parkingRentalAdjust'] = $("#parkingRentalAdjust").val();
							// リストテーブル情報取得
							var arrrows = $("#parkingInfoList").getRowData();
							// 行数取得
							var rowNum = arrrows.length;
							var parkingRentalAdjusts = new Array();
							// 駐車場区画調整金額リスト作成
							for (var i = 0; i < rowNum; i++) {
								parkingRentalAdjusts.push($("#parkingRentalAdjust" + arrrows[i].rId).val());
							}
							map['parkingRentalAdjusts'] = parkingRentalAdjusts;
							// ドロップダウンチェンジイベント
							nfw.common.doAjaxAction("skf/Skf3010Sc006/ChangeParkingStructureDrpDwnAsync", map, true, function(data) {
								// 駐車場基本使用料設定
								$("#parkingBasicRent").text(data.parkingBasicRent + " 円");
								// 駐車場月額使用料設定
								$("#parkingShiyoMonthFei").text(data.parkingShiyoMonthFei + " 円");
								
								if($("#parkingStructure").val() != "5" && $("#parkingStructure").val() != ""){
									//駐車場構造がなしまたは空以外
									if($("#parkingEditFlg").val() != "true"){
										//追加中でない
										$("#parkingContractAdd").prop("disabled",false);
										$('#parkingContractAdd').removeClass("imui-disabled-button");
									}
								}else{
									$("#parkingContractAdd").prop("disabled",true);
									$('#parkingContractAdd').addClass("imui-disabled-button");
									$("#parkingContractDel").prop("disabled",true);
									$('#parkingContractDel').addClass("imui-disabled-button");
									$("#parkingContractType").prop("disabled",true);
									setDisabled(true,false);
								}
								setParkingLendKbn($("#parkingStructure").val());
							});
						});
						
						
						// 契約番号ドロップダウンチェンジ
						$("#contractNo").bind('change', function() {
							// 変更後選択値取得
							$("#hdnChangeContractSelectedIndex").val($("#contractNo").val());
							// 契約情報変更チェック
							if (!checkContractInfo() && ${form.contractAddDisableFlg} != true) {
								// 変更なし
								// 現在状態バックアップ
								backUpStatus();
								url = "skf/Skf3010Sc006/changeContractDrpDwn";
								$("#form").attr("action", url);
								$("#form").submit();
							} else {
								$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractChangeOk',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 現在状態バックアップ
												backUpStatus();
// 												url = "skf/Skf3010Sc006/changeContractDrpDwn";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/changeContractDrpDwn";
												nfw.common.submitForm(formId, url);
											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 変更前選択プルダウンに戻す
												$("#contractNo").val($("#hdnDispContractSelectedIndex").val());
											}
										}
									]
								});
							}
						});
						
						// 駐車場契約番号ドロップダウンチェンジ
						$("#parkingContractNo").bind('change', function() {
							// 変更後選択値取得
							$("#hdnChangeParkingContractSelectedIndex").val($("#parkingContractNo").val());
							// 契約情報変更チェック
							if (!checkParkingContractInfo() && $("#parkingEditFlg").val() != "true") {
								// 変更なし
								// 現在状態バックアップ
								backUpStatus();
								$("#parkingSelectMode").val("changeParking");
								url = "skf/Skf3010Sc006/changeParkingContractList";
								$("#form").attr("action", url);
								$("#form").submit();
							} else {
								$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractChangeOk',
											'text': 'ok',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 現在状態バックアップ
												backUpStatus();
												$("#parkingSelectMode").val("changeParking");
// 												url = "skf/Skf3010Sc006/changeParkingContractList";
// 												$("#form").attr("action", url);
// 												$("#form").submit();
												formId= "form";
												url = "skf/Skf3010Sc006/changeParkingContractList";
												nfw.common.submitForm(formId, url);
											}
										},
										{
											'text': 'キャンセル',
											'click': function() {
												$(this).imuiMessageDialog('close');
												// 変更前選択プルダウンに戻す
												$("#parkingContractNo").val($("#hdnDispParkingContractSelectedIndex").val());
											}
										}
									]
								});
							}
						});
						
						/** テキストチェンジイベント */
						// 建築年月日チェンジ
						$("#buildDate").bind('change', function() {
							// テキスト内容判定
							if ("" != $("#buildDate").val()) {
								var map = new Object();
								map['buildDate'] = $("#buildDate").val();
								map['areaKbnCd'] = $("#areaKbn").val();
								map['structureKbn'] = $("#shatakuStructure").val();
								map['nextCalcDate'] = $("#nextCalculateDate").text();
								map['jituAge'] = $("#realYearCount").text();
								map['aging'] = $("#aging").text();
								// テキストチェンジイベント
								nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeStructureDrpDwnAsync", map, true, function(data) {
									// 結果判定
									if ("99999999" != data.buildDate) {
										$("#buildDate").val(data.buildDate);
										$("#realYearCount").text(data.jituAge);
										$("#nextCalculateDate").text(data.nextCalcDate);
										$("#aging").text(data.aging);
										$("#oldBuildDate").val(data.buildDate)
									} else {
										$("#buildDate").val($("#oldBuildDate").val());
									}
								});
							}
						});
						
						// 駐車場住所チェンジ
						$("#parkingContractAddress").bind('change', function() {
							//最新の契約情報かチェック
							if(checkMaxParkingContract()){
								// 最新の情報の場合、駐車場情報の所在地に設定
								$("#parkingAddress").text($("#parkingContractAddress").val());
							}
						});
						
						// 駐車場調整金額チェンジ
						$("#parkingRentalAdjust").bind('change', function() {
							var map = new Object();
							// 駐車場基本使用料取得
							var parkingBasicRent = $("#parkingBasicRent").text().replace("円", "").replace(",", "").trim();
							// 駐車場調整金額取得
							var parkingRentalAdjust = $("#parkingRentalAdjust").val();
							// パラメータ設定
							map['parkingBasicRent'] = parkingBasicRent;
							map['parkingRentalAdjust'] = parkingRentalAdjust;

							// ドロップダウンチェンジイベント
							nfw.common.doAjaxAction("skf/Skf3010Sc006/ChangeParkingRentalAdustsTextAsync", map, true, function(data) {
								$("#parkingShiyoMonthFei").text(data.parkingShiyoMonthFei + " 円");
							});
						});
						$("#parkingRentalAdjust").bind('focus', function() {
							// 駐車場調整金額取得
							var parkingRentalAdjust = $("#parkingRentalAdjust").val();
							$("#parkingRentalAdjust").val(parkingRentalAdjust.replace(/,/g, ''));
						});
						$("#parkingRentalAdjust").bind('blur', function() {
							// 駐車場調整金額取得
							var parkingRentalAdjust = Number($("#parkingRentalAdjust").val());
							$("#parkingRentalAdjust").val(parkingRentalAdjust.toLocaleString());
						});
						$("#parkingRentalAdjust").bind('keypress', function(e) {
							  // 数字以外の不要な文字を削除
							  var st = String.fromCharCode(e.which);
							  if ("0123456789".indexOf(st,0) < 0) { return false; }
							  return true;  
						});
						
						// 参考にしようと思って残してるやつ
						//添付ファイルリンククリック時
						$("a[id^='attached_']").click(function(){
							downloadShatakuHosokuFile(this);
						});
						
					    backOnClick = function () {
					    	//確認メッセージ
							dialogTitle = "確認";
							dialogMessage = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。";
					    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc001/init", "ok", "キャンセル", this, true);	
					    }
					    
						// 賃貸人入力支援戻り値設定用
						$("#contractSupport").click(function(){
							$("#insertFormOwnerName").val("contractOwnerName");
							$("#insertFormOwnerNo").val("contractOwnerNo");
						});
						// 賃貸人入力支援戻り値設定用
						$("#parkingContractSupport").click(function(){
							$("#insertFormOwnerName").val("parkingOwnerName");
							$("#insertFormOwnerNo").val("parkingOwnerNo");
						});
					});
					// 何かが変わったときのイベント
					jQuery(document).on("change", function(data) {
						$("#onChangeFlag").val("true");
					});
					// 動的に作成したコントロールのイベント
					
					//添付ファイルリンククリック時
					downloadShatakuHosokuFile = function(data) {
						//リンクタグのidから補足種別と添付ファイル番号を取得
						var id = $(data).attr("id");
						var url = "skf/Skf3010Sc006/AttachedDownload";
						var list = id.split('_');
						var hosokuType = list[1];
						var fileNo = list[3];
						
						$("#sendHosokuType").val(hosokuType);
						$("#sendAttachedNo").val(fileNo);
						
// 			    		$("#form").attr("action", url);
// 			    		$("#form").submit();
						formId= "form";
						url = "skf/Skf3010Sc006/AttachedDownload";
						nfw.common.submitForm(formId, url);
						
					}
					
				    // 賃貸人名欄でDeleteKeyまたはBackSpaceを押下時イベント
				    contractOwnerName_KeyDown = function(e) {
				        var c = e.keyCode;
				        if (c == 46 || c == 8) {
				            $("#contractOwnerName").val("");
				            // 裏で保持している社員番号をクリア
				            $("#contractOwnerNo").val("");
				        }
				    };
				    parkingOwnerName_KeyDown = function(e) {
				        var c = e.keyCode;
				        if (c == 46 || c == 8) {
				            $("#parkingOwnerName").val("");
				            // 裏で保持している社員番号をクリア
				            $("#parkingOwnerNo").val("");
				        }
				    };
					
				})(jQuery);
			</script>
		</div>
		<br />
		<div class="align-L float-L">
			<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()" tabindex="94"/>
		</div>
		<div class="align-R">
			<!-- 登録 -->
			<imui:button id="enter" name="enter" value="登録" class="imui-medium-button" style="width:150px;" onclick="enterClick()" tabindex="95" />
			<!-- 削除 -->
			<imui:button id="delete" name="delete" value="削除" class="imui-medium-button" style="width:150px;"
											onclick="deleteClick()" tabindex="96" disabled="${form.newShatakuFlg }"/>
		</div>
		<!-- 現在表示中タブインデックス -->
		<input type="hidden" name="hdnNowSelectTabIndex" id="hdnNowSelectTabIndex" value="${form.hdnNowSelectTabIndex}" />
		<!-- 初期表示契約情報プルダウンインデックス -->
		<input type="hidden" name="hdnDispContractSelectedIndex" id="hdnDispContractSelectedIndex" value="${form.hdnDispContractSelectedIndex}" />
		<!-- 現在表示中契約情報プルダウンインデックス -->
		<input type="hidden" name="hdnChangeContractSelectedIndex" id="hdnChangeContractSelectedIndex" value="${form.hdnDispContractSelectedIndex}" />
		<!-- 現在表示中契約情報削除プルダウンインデックス -->
		<input type="hidden" name="hdnDeleteContractSelectedValue" id="hdnDeleteContractSelectedValue" value="${form.hdnDeleteContractSelectedValue}" />
		<!-- 初期表示駐車場契約情報プルダウンインデックス -->
		<input type="hidden" name="hdnDispParkingContractSelectedIndex" id="hdnDispParkingContractSelectedIndex" value="${form.hdnDispParkingContractSelectedIndex}" />
		<!-- 現在表示中駐車場契約情報プルダウンインデックス -->
		<input type="hidden" name="hdnChangeParkingContractSelectedIndex" id="hdnChangeParkingContractSelectedIndex" value="${form.hdnChangeParkingContractSelectedIndex}" />
		<!-- 現在表示中駐車場契約情報削除プルダウンインデックス -->
		<input type="hidden" name="hdnDeleteParkingContractSelectedValue" id="hdnDeleteParkingContractSelectedValue" value="${form.hdnDeleteParkingContractSelectedValue}" />

		<script type="text/javascript">
			$(function() {
				$( "#tabs" ).tabs();

				$("#tabs").tabs({
					selected:parseInt(${form.hdnNowSelectTabIndex}),
					activate: function(event, ui) {
						// 選択タブインデックスを保存
						$("#hdnNowSelectTabIndex").val(ui.newTab.index());
						// 契約情報タブの郵便番号を基本情報タブの郵便番号に設定
						$('#contractZipCd').text($('#zipCd').val());
						// 契約情報タブの住所を基本情報タブの県名 + 住所に設定
						$('#contractAddress').text($('#pref option:selected').text() + $('#shatakuAddress').val());
					},
					select: function(event, ui){
						// 選択タブインデックスを保存
						$("#hdnNowSelectTabIndex").val(ui.index);
						// 契約情報タブの郵便番号を基本情報タブの郵便番号に設定
						$('#contractZipCd').text($('#zipCd').val());
						// 契約情報タブの住所を基本情報タブの県名 + 住所に設定
						$('#contractAddress').text($('#pref option:selected').text() + $('#shatakuAddress').val());
					}
				});
			});
		</script>
	</div>
	</nfwui:Form>

<!-- コンテンツエリア　ここまで -->