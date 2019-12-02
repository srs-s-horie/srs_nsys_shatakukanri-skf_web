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
		var url="skf/Skf3010Sc001/init"
		nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
	}
</script>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form"  enctype="multipart/form-data" >
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC002 %>" />
		<input type="hidden" name="ittoFlg" id="ittoFlg" value="${form.ittoFlg }" />
		<input type="hidden" name="oldBuildDate" id="oldBuildDate" value="${f:h(form.buildDate)}" />
		<input type="hidden" name="lendKbnSelectListString" id="lendKbnSelectListString" value="${f:h(form.lendKbnSelectListString)}" />
		<input type="hidden" name="defaultParkingLendStatus" id="defaultParkingLendStatus" value="${f:h(form.defaultParkingLendStatus)}" />
		<input type="hidden" name="contractOwnerNo" id="contractOwnerNo" value="${form.contractOwnerNo}" />
		<input type="hidden" name="nowParkingInfoListTableData" id="nowParkingInfoListTableData" />
		<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo }"/>
		<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName }"/>
		<input type="hidden" name="hdnAreaKbn" id="hdnAreaKbn" value="${form.hdnAreaKbn }"/>
		<input type="hidden" name="hdnShatakuKbn" id="hdnShatakuKbn" value="${form.hdnShatakuKbn }"/>
		<input type="hidden" name="hdnEmptyRoomCount" id="hdnEmptyRoomCount" value="${form.hdnEmptyRoomCount }"/>
		<input type="hidden" name="hdnEmptyParkingCount" id="hdnEmptyParkingCount" value="${form.hdnEmptyParkingCount }"/>
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
		
		<!-- JSON駐車場区画情報 -->
		<input type="hidden" name="jsonParking" id="jsonParking" />
		<!-- JSON備品情報 -->
		<input type="hidden" name="jsonBihin" id="jsonBihin" />
		<!-- JSONドロップダウン選択値リスト -->
		<input type="hidden" name="jsonDrpDwnList" id="jsonDrpDwnList" />
		<!-- JSON可変ラベルリスト -->
		<input type="hidden" name="jsonLabelList" id="jsonLabelList" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc002/init"/>
		<!-- 補足ファイル -->
		<input type="hidden" name="fileNo" id="fileNo"/>
		<input type="hidden" name="hosokuType" id="hosokuType"/>
		<input type="hidden" name="hdnHosoku" id="sendHosokuType"/>
		<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo"/>

		<!-- 社員名入力支援用 -->
		<input type="hidden" id="insertFormName" value="" />
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
						<!-- 一棟なら一棟のラベル、一棟以外ならプルダウン -->
						<c:if test="${form.ittoFlg == 'false'}">
							<!-- 社宅区分リスト -->
							<imui:select id="shatakuKbn" name="shatakuKbn" width="100" list="${form.shatakuKbnList}" class="${form.shatakuKbnErr}" tabindex="5" />
						</c:if>
						<c:if test="${form.ittoFlg == 'true'}">
							<!-- 社宅区分ラベル -->
							<label>${form.shatakuKbn}</label>
						</c:if>
					</td>
					<th style="width: 6%;">
						<!-- 空き部屋数 -->
						<nfwui:LabelBox id="lblEmptyRoomCount" code="<%=MessageIdConstant.SKF3010_SC002_LBL_EMPTY_ROOM_COUNT %>" />
					</th>
					<td style="width: 5%;">
						<!-- 空き部屋数値 -->
						<label>${form.emptyRoomCount}</label>
					</td>
					<th style="width: 7%;">
						<!-- 空き駐車場数 -->
						<nfwui:LabelBox id="lblEmptyParkingCount" code="<%=MessageIdConstant.SKF3010_SC002_LBL_EMPTY_PARKING_COUNT %>" />
					</th>
					<td style="width: 5%;">
						<!-- 空き駐車場数値 -->
						<label>${form.emptyParkingCount}</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div id="tabs">
			<ul>
				<li><a href="#kihon_info">基本情報</a></li>
				<li><a href="#parking_info">駐車場情報</a></li>
				<li><a href="#bihin_info">備品情報</a></li>
				<li><a href="#admin_info">管理者情報</a></li>
				<!-- 契約情報タブ表示判定 -->
				<c:if test="${form.ittoFlg == 'true'}">
					<li><a href="#keiyaku_info">契約情報</a></li>
				</c:if>
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
								<imui:select id="useKbn" name="useKbn" width="90" list="${form.useKbnList}" class="${form.useKbnKbnErr}" tabindex="6" />
							</td>
						</tr>
						<!--管理会社-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageCompany" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_COMPANY %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageCompany" name="manageCompany" width="160"
									list="${form.manageCompanyList}" class="${form.manageCompanyErr}" tabindex="7" />
							</td>
						</tr>
						<!--管理機関-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageAgency" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_AGENCY %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageAgency" name="manageAgency" width="160"
									list="${form.manageAgencyList}" class="${form.manageAgencyErr}" tabindex="8" />
							</td>
						</tr>
						<!--管理事業領域-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageBusinessArea" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_BUSINESS_AREA %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageBusinessArea" name="manageBusinessArea" width="160"
									list="${form.manageBusinessAreaList}" class="${form.manageBusinessAreaErr}" tabindex="9" />
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
													class="${form.zipCdErr}" placeholder="例　4600003" maxlength="7" tabindex="10"/>
								<imui:button id="addressSearch" name="addressSearch" value="住所検索"
										class="imui-small-button" onclick="addressSearchClick()" tabindex="11" />
							</td>
						</tr>
						<!--住所-->
						<tr>
							<th>
								<nfwui:LabelBox id="lblAddressDetail" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ADDRESS_DETAIL %>" />
							</th>
							<td colspan="3">
								<!-- 都道府県リスト -->
								<imui:select id="pref" name="pref" width="90" list="${form.prefList}" class="${form.prefErr}" tabindex="12" />
								<imui:textbox id="shatakuAddress" name="shatakuAddress" style="width:615px;" maxlength="100"
								value="${f:h(form.shatakuAddress)}" placeholder="例　名古屋市中区錦2-18-19" class="${form.shatakuAddressErr}" tabindex="13" />
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
									list="${form.shatakuStructureList}" class="${form.shatakuStructureErr}" tabindex="14" />
								<imui:textbox id="shatakuStructureDetail" name="shatakuStructureDetail" style="width:360px;"
									maxlength="30" value="${f:h(form.shatakuStructureDetail)}" placeholder="例　RC3F" tabindex="15" />
							</td>
						</tr>
						<!--エレベーター-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblElevator" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ELEVATOR %>" />
							</th>
							<td colspan="3">
								<!-- エレベーターリスト -->
								<imui:select id="elevator" name="elevator" width="90" list="${form.elevatorList}" tabindex="16" />
							</td>
						</tr>
						<!--建築年月日-->
						<tr>
							<div>
							<th colspan="2">
								<nfwui:LabelBox id="lblBuildDate" code="<%=MessageIdConstant.SKF3010_SC002_LBL_BUILD_DATE %>" />
							</th>
							<td>
								<nfwui:DateBox id="buildDate" name="buildDate" value="${f:h(form.buildDate)}"
												 cssStyle="width:100px" cssClass="${form.buildDateErr }" tabindex="17"/>
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
								<a id="${form.shatakuHosokuLink1 }" tabindex="18">${form.shatakuHosokuFileName1 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku1" name="impShatakuHosoku1" value="参照" class="imui-small-button" tabindex="19" onclick="fileSelect('1', 'shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku1" name="tmpFileBoxshataku1" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku1" name="delShatakuHosoku1" value="削除" class="imui-small-button" tabindex="20" onclick="fileDelete('1', 'shataku')"/>
							</td>
						</tr>
						<!--社宅補足-->
						<tr style="display:table-row;">
							<td>
								<a id="${form.shatakuHosokuLink2 }" tabindex="21">${form.shatakuHosokuFileName2 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku2" name="impShatakuHosoku2" value="参照" class="imui-small-button" tabindex="22" onclick="fileSelect('2', 'shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku2" name="tmpFileBoxshataku2" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku2" name="delShatakuHosoku2" value="削除" class="imui-small-button" tabindex="23" onclick="fileDelete('2', 'shataku')"/>
							</td>
						</tr>
						<!--社宅補足-->
						<tr style="display:table-row;">
							<td>
								<a id="${form.shatakuHosokuLink3 }">${form.shatakuHosokuFileName3 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku3" name="impShatakuHosoku3" value="参照" class="imui-small-button" tabindex="25" onclick="fileSelect('3', 'shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku3" name="tmpFileBoxshataku3" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku3" name="delShatakuHosoku3" value="削除" class="imui-small-button" tabindex="26" onclick="fileDelete('3', 'shataku')"/>
							</td>
						</tr>
						<!--備考-->
						<tr>
							<th rowspan="3" colspan="2">
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_BIKO %>" />
							</th>
							<td rowspan="3" colspan="3">
								<imui:textArea id="biko" name="biko" rows="3" style="width:715px;" maxlength="400" value="${form.biko}" tabindex="27" />
							</td>
							<td style="width: 30%;border:none;background-color:white;"></td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
			<div id="parking_info">
				<nfwui:Table use="search">
					<tbody>
						<!--駐車場構造-->
						<tr >
							<th style="width:7%;">
								<nfwui:LabelBox id="lblParkingStructureKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_STRUCTURE_KBN %>" />
							</th>
							<td style="width:5%;">
								<!-- 駐車場構造リスト -->
								<imui:select id="parkingStructure" name="parkingStructure" width="120"
								list="${form.parkingStructureList}" class="${form.parkingStructureErr}" tabindex="28" />
							</td>
						</tr>
						<!--駐車場基本使用料-->
						<tr>
							<th>
								<nfwui:LabelBox id="lblParkingRental" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_RENTAL %>" />
							</th>
							<td>
								<label id="parkingBasicRent" name="parkingBasicRent">
									${form.parkingRent }&nbsp;円
								</label>
							</td>
							<th rowspan="3" style="width:7%;">
								<nfwui:LabelBox id="lblParkingSupplement" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_SUPPLEMENT %>" />
							</th>
							<td style="width:10%;">
								<a id="${form.parkingHosokuLink1 }" tabindex="29">${form.parkingHosokuFileName1 }</a>
							</td>
							<!--駐車場補足1-->
							<td style="width:20%;">
								<!-- 参照 -->
								<imui:button id="impParkingHosoku1" name="impParkingHosoku1" value="参照" class="imui-small-button" tabindex="30" onclick="fileSelect('1', 'parking')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking1" name="tmpFileBoxparking1" />
								<!-- 削除 -->
								<imui:button id="delParkingHosoku1" name="delParkingHosoku1" value="削除" class="imui-small-button" tabindex="31" onclick="fileDelete('1', 'parking')"/>
							</td>
						</tr>
						<tr>
							<th>
								<!-- 駐車場台数 -->
								<nfwui:LabelBox id="lblParkingBlockCount" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_BLOCK_COUNT %>" />
							</th>
							<td>
								<label id="parkingBlockCount" name="parkingBlockCount">
									${form.parkingBlockCount }&nbsp;台
								</label>
							</td>
							<td>
								<a id="${form.parkingHosokuLink2 }" tabindex="32">${form.parkingHosokuFileName2 }</a>
							</td>
							<!--駐車場補足2-->
							<td>
								<!-- 参照 -->
								<imui:button id="impParkingHosoku2" name="impParkingHosoku2" value="参照" class="imui-small-button" tabindex="33" onclick="fileSelect('2', 'parking')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking2" name="tmpFileBoxparking2" />
								<!-- 削除 -->
								<imui:button id="delParkingHosoku2" name="delParkingHosoku2" value="削除" class="imui-small-button" tabindex="34" onclick="fileDelete('2', 'parking')"/>
							</td>
						</tr>
						<tr>
							<th>
								<!-- 貸与可能総数 -->
								<nfwui:LabelBox id="lblLendPossibleCount" code="<%=MessageIdConstant.SKF3010_SC002_LBL_LEND_POSSIBLE_COUNT %>" />
							</th>
							<td>
								<label id="lendPossibleCount" name="lendPossibleCount">
									${form.lendPossibleCount }&nbsp;台
								</label>
							</td>
							<td>
								<a id="${form.parkingHosokuLink3 }" tabindex="35">${form.parkingHosokuFileName3 }</a>
							</td>
							<!--駐車場補足3-->
							<td>
								<!-- 参照 -->
								<imui:button id="impParkingHosoku3" name="impParkingHosoku3" value="参照" class="imui-small-button" tabindex="36" onclick="fileSelect('3', 'parking')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking3" name="tmpFileBoxparking3" />
								<!-- 削除 -->
								<imui:button id="delParkingHosoku3" name="delParkingHosoku3" value="削除" class="imui-small-button" tabindex="37" onclick="fileDelete('3', 'parking')"/>
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
				<br />
				<div class="align-L"><!--  -->
					<!-- 追加 -->
					<imui:button id="addParkingBlock" name="addParkingBlock" value="追加" class="imui-small-button"
											onclick="addParkingBlockClick()" style="margin-bottom: 3px;" tabindex="38" />
				</div>
				<div>
				<imui:listTable id="parkingInfoList" process="jssp" autoEncode="false" autoWidth="false" rowNumbers="true" autoResize="false"
					onCellSelect="onCellSelect" multiSelect="false" data="${form.parkingInfoListTableData }" style="max-height: 800px;" tabindex="39">
					<cols sortable="false">
						<col name="rId" caption="RelativeID" hidden="true" key="true"/>
						<col name="parkingKanriNo" caption="駐車場管理番号" hidden="true" />
						<col name="parkingBlock" caption="区画番号" width="165" sortable="false" align="center" wrap="true" />
						<col name="parkingLendKbn" caption="貸与区分" width="95" sortable="false" align="center" wrap="true" />
						<col name="parkingLendStatus" caption="貸与状況" hidden="true" />
						<col name="shainName" caption="使用者" width="140" sortable="false" align="left" wrap="true" />
						<col name="parkingRentalAdjust" caption="駐車場調整金額" width="110" sortable="false" align="right" wrap="true" />
						<col name="parkingMonthRental" caption="駐車場月額使用料" width="120" sortable="false" align="right" wrap="true" />
						<col name="parkingBiko" caption="備考" width="230" sortable="false" align="center" wrap="true" />
						<col name="parkingBlockDelete" caption="削除" width="50" sortable="false" align="center" wrap="true">
							<showIcon iconClass="im-ui-icon-common-16-trashbox" align="center" />
						</col>
						<col name="updateDate" caption="更新日時" hidden="true" />
					</cols>
				</imui:listTable>
				</div>
				<br />
				<div>
					<!--備考-->
					<nfwui:Table use="search">
						<tbody>
							<!--備考-->
							<tr>
								<th rowspan="3" style="width:12%;">
									<nfwui:LabelBox id="lblParkingBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_PARKING_BIKO %>" />
								</th>
								<td rowspan="2" style="width:61%" colspan="4">
									<imui:textArea id="parkingBiko" name="parkingBiko" rows="3" maxlength="400" style="width:650px;" value="${form.parkingBiko}" tabindex="44" />
								</td>
							</tr>
							<tr />
							<tr />
						</tbody>
					</nfwui:Table>
				</div>
			</div>
			<div id="bihin_info">
				<imui:listTable id="bihinInfoList" process="jssp" autoEncode="false" autoWidth="false" rowNumbers="true" autoResize="false" 
						onCellSelect="onCellSelect" multiSelect="false" data="${form.bihinInfoListTableData }" style="max-height: 800px;" height="auto" tabinex="43">
					<cols sortable="false">
						<col name="bihinCd" caption="備品コード" hidden="true" key="true" />
						<col name="bihinName" caption="備品名称" width="165" sortable="false" align="left" wrap="true" />
						<col name="bihinStatusKbn" caption="備付状況" width="110" sortable="false" align="center" wrap="true" />
						<col name="updateDate" caption="更新日時" hidden="true" />
					</cols>
				</imui:listTable>
			</div>
			<div id="admin_info">
				<nfwui:Table use="search">
					<tbody>
						<tr >
							<td style="width:15%;"/>
							<th style="width:20%;">
								<!-- 寮長・自治会長 -->
								<nfwui:LabelBox id="lblDormitoryLeader" code="<%=MessageIdConstant.SKF3010_SC002_LBL_DORMITORY_LEADER %>" />
							</th>
							<th style="width:20%;">
								<!-- 鍵管理者 -->
								<nfwui:LabelBox id="lblKeyManager" code="<%=MessageIdConstant.SKF3010_SC002_LBL_KEY_MANAGER %>" />
							</th>
							<th style="width:20%;">
								<!-- 寮母・管理会社 -->
								<nfwui:LabelBox id="lblMatron" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MATRON %>" />
							</th>
						</tr>
						<tr>
							<!--部屋番号-->
							<th>
								<nfwui:LabelBox id="lblManageShatakuNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_SHATAKU_NO %>" />
							</th>
							<td>
								<!-- 寮長・自治会長 -->
								<imui:textbox id="dormitoryLeaderRoomNo" name="dormitoryLeaderRoomNo" style="width:150px;"
								maxlength="30" value="${f:h(form.dormitoryLeaderRoomNo)}" placeholder="例　101（半角）" tabindex="46" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerRoomNo" name="keyManagerRoomNo" style="width:150px;"
								maxlength="30" value="${f:h(form.keyManagerRoomNo)}" placeholder="例　101（半角）" tabindex="53" />
							</td>
							<td>
								<!-- 寮母・管理会社 -->
								<imui:textbox id="matronRoomNo" name="matronRoomNo" style="width:150px;"
								maxlength="30" value="${f:h(form.matronRoomNo)}" placeholder="例　101（半角）" tabindex="60" />
							</td>
						</tr>
						<tr>
							<!-- 氏名 -->
							<th>
								<nfwui:LabelBox id="lblManageName" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_NAME %>" />
							</th>
							<td>
								<!-- 寮長・自治会長 -->
								<imui:textbox id="dormitoryLeaderName" name="dormitoryLeaderName" style="width:150px;"
								maxlength="30" value="${f:h(form.dormitoryLeaderName)}" placeholder="例　中日本　太郎" tabindex="47" />
								<!-- 社員入力支援 -->
								<nfwui:PopupButton id="supportDormitoryLeaderName" name="supportDormitoryLeaderName" value="社員入力支援" use="popup"
									cssClass="imui-small-button" popupWidth="650" popupHeight="700"
									modalMode="true" screenUrl="skf/Skf2010Sc001/init" tabindex="48"/> 
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerName" name="keyManagerName" style="width:150px;" maxlength="30"
								value="${f:h(form.keyManagerName)}" placeholder="例　中日本　太郎" tabindex="54" />
								<!-- 社員入力支援 -->
								<nfwui:PopupButton id="supportKeyManagerName" name="supportKeyManagerName" value="社員入力支援" use="popup"
									cssClass="imui-small-button" popupWidth="650" popupHeight="700"
									modalMode="true" screenUrl="skf/Skf2010Sc001/init" tabindex="55"/> 
							</td>
							<td>
								<!-- 寮母・管理会社 -->
								<imui:textbox id="matronName" name="matronName" style="width:150px;"
								maxlength="30" value="${f:h(form.matronName)}" placeholder="例　中日本　太郎" tabindex="61" />
							</td>
						</tr>
						<tr>
							<!-- 電子メールアドレス -->
							<th>
								<nfwui:LabelBox id="lblManageMailAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_MAIL_ADDRESS %>" />
							</th>
							<td>
								<!-- 寮長・自治会長 -->
								<imui:textbox id="dormitoryLeaderMailAddress" name="dormitoryLeaderMailAddress" style="width:260px;"
								maxlength="50" value="${f:h(form.dormitoryLeaderMailAddress)}" placeholder="例　t.nakanihon.aa@" tabindex="49"
								class="${form.dormitoryLeaderMailAddressErr}" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerMailAddress" name="keyManagerMailAddress" style="width:260px;"
								maxlength="50" value="${f:h(form.keyManagerMailAddress)}" placeholder="例　t.nakanihon.aa@" tabindex="56"
								class="${form.keyManagerMailAddressErr}" />
							</td>
							<td>
								<!-- 寮母・管理会社 -->
								<imui:textbox id="matronMailAddress" name="matronMailAddress" style="width:260px;"
								maxlength="30" value="${f:h(form.matronMailAddress)}" placeholder="例　t.nakanihon.aa@" tabindex="62"
								class="${form.matronMailAddressErr}" />
							</td>
						</tr>
						<tr>
							<!-- 電話番号 -->
							<th>
								<nfwui:LabelBox id="lblManageTelNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_TEL_NO %>" />
							</th>
							<td>
								<!-- 寮長・自治会長 -->
								<imui:textbox id="dormitoryLeaderTelNumber" name="dormitoryLeaderTelNumber" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.dormitoryLeaderTelNumber)}" placeholder="例　052-999-9999" tabindex="50"
								class="${form.dormitoryLeaderTelNumberErr}" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerTelNumber" name="keyManagerTelNumber" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.keyManagerTelNumber)}" placeholder="例　052-999-9999" tabindex="57"
								class="${form.keyManagerTelNumberErr}" />
							</td>
							<td>
								<!-- 寮母・管理会社 -->
								<imui:textbox id="matronTelNumber" name="matronTelNumber" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.matronTelNumber)}" placeholder="例　052-999-9999" tabindex="63"
								class="${form.matronTelNumberErr}" />
							</td>
						</tr>
						<tr>
							<!-- 内線番号 -->
							<th>
								<nfwui:LabelBox id="lblManageExtensionNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_EXTENSION_NO %>" />
							</th>
							<td>
								<!-- 寮長・自治会長 -->
								<imui:textbox id="dormitoryLeaderExtentionNo" name="dormitoryLeaderExtentionNo" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.dormitoryLeaderExtentionNo)}" placeholder="例　0000" tabindex="51"
								class="${form.dormitoryLeaderExtentionNoErr}" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerExtentionNo" name="keyManagerExtentionNo" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.keyManagerExtentionNo)}" placeholder="例　0000" tabindex="58"
								class="${form.keyManagerExtentionNoErr}" />
							</td>
							<td>
								<!-- 寮母・管理会社 -->
								<imui:textbox id="matronExtentionNo" name="matronExtentionNo" style="width:150px;height:98%"
								maxlength="15" value="${f:h(form.matronExtentionNo)}" placeholder="例　0000" tabindex="64"
								class="${form.matronExtentionNoErr}" />
							</td>
						</tr>
						<tr>
							<!--備考-->
							<th rowspan="4">
								<nfwui:LabelBox id="lblManageBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_BIKO %>" />
							</th>
							<td rowspan="4">
								<!-- 寮長・自治会長 -->
								<imui:textArea id="dormitoryLeaderBiko" name="dormitoryLeaderBiko" rows="4" maxlength="400"
														style="width:260px;" value="${form.dormitoryLeaderBiko}" tabindex="52" />
							</td>
							<td rowspan="4">
								<!-- 鍵管理者 -->
								<imui:textArea id="keyManagerBiko" name="keyManagerBiko" rows="4" maxlength="400"
														style="width:260px;" value="${form.keyManagerBiko}" tabindex="59" />
							</td>
							<td rowspan="4">
								<!-- 寮母・管理会社 -->
								<imui:textArea id="matronBiko" name="matronBiko" rows="4" maxlength="400"
														style="width:260px;" value="${form.matronBiko}" tabindex="65" />
							</td>
						</tr>
						<tr />
						<tr />
						<tr />
					</tbody>
				</nfwui:Table>
			</div>
			<div id="keiyaku_info">
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th rowspan="13" style="width:5%" >
								<!-- 社宅 -->
								<nfwui:LabelBox id="lblContractShataku" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_SHATAKU %>" />
							</th>
							<th colspan="2"  style="width:10%;">
								<!-- 契約番号 -->
								<nfwui:LabelBox id="lblContractNumber" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_NUMBER %>" />
							</th>
							<td  style="width:35%">
								<!-- 契約番号リスト -->
								<imui:select id="contractNo" name="contractNo" width="200" list="${form.contractNoList}"
																			tabindex="66" disabled="${form.contractDelDisableFlg }"/>
								<!-- 追加ボタン -->
								<imui:button id="contractAdd" name="contractAdd" value="追加" class="imui-small-button" 
												disabled="${form.contractAddDisableFlg}" onclick="contractAddClick()" tabindex="67" />
								<!-- 削除ボタン -->
								<imui:button id="contractDell" name="contractDell" value="削除" class="imui-small-button" 
												disabled="${form.contractDelDisableFlg}" onclick="contractDelClick()" tabindex="68" />
							</td>
							<td style="border:none;width:30%;" rowspan="11">
								<font size="2">
									別契約の駐車場がある場合&nbsp;&nbsp;
									<imui:button id="contractParkingInfo" name="contractParkingInfo" value="駐車場契約情報" class="imui-medium-button"
														onclick="contractParkingInfoClick()" disabled="${form.parkingContractDisableFlg }" tabindex="78" />
								</font>
								<br/>
								<br/>
								<font size="2">
									※駐車場の区画情報は駐車場情報タブにて登録後に
									<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;駐車場契約情報を登録してください。
								</font>
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
									style="width:150px;height:98%" value="${f:h(form.contractOwnerName)}" disabled="${form.contractDelDisableFlg }" tabindex="69" />
								<!-- 支援ボタン -->
								<nfwui:PopupButton id="contractSupport" name="contractSupport" value="支援" use="popup"
									cssClass="imui-small-button" popupWidth="650" popupHeight="700"
									modalMode="false" screenUrl="skf/Skf2010Sc001/init"
									parameter="parkinglendKbn:nyukyoFlag"  disabled="${form.contractDelDisableFlg }"
									callbackFunc="contractOwnerInfoCallback" tabindex="70"/>
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
						</tr>
						<tr></tr>
						<tr>
							<th colspan="2">
								<!-- 経理連携用管理番号 -->
								<nfwui:LabelBox id="lblContractAssetRegisterNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ASSET_REGISTER_NO %>" />
							</th>
							<td>
								<imui:textbox id="assetRegisterNo" name="assetRegisterNo" style="ime-mode:disabled;width:150px;" maxlength="13"
													class="${form.assetRegisterNoErr}" value="${f:h(form.assetRegisterNo)}" placeholder="例　A001002003004"
																					 disabled="${form.contractDelDisableFlg }" tabindex="71" />
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 契約開始日 -->
								<nfwui:LabelBox id="lblContractStartDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_START_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="contractStartDay" name="contractStartDay" cssClass="${form.contractStartDayErr }"
									value="${f:h(form.contractStartDay)}" cssStyle="width:100px" disabled="${form.contractDelDisableFlg }" tabindex="72"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 契約終了日 -->
								<nfwui:LabelBox id="lblContractEndtDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_END_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="contractEndDay" name="contractEndDay" cssClass="${form.contractEndDayErr }"
									value="${f:h(form.contractEndDay)}" cssStyle="width:100px" disabled="${form.contractDelDisableFlg }" tabindex="73"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 家賃 -->
								<nfwui:LabelBox id="lblContractRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractRent" name="contractRent" max="99999999" min="0"
									cssClass="${form.contractRentErr }" cssStyle="width: 100px;"
									maxlength="10" value="${form.contractRent}" disabled="${form.contractDelDisableFlg }" tabindex="74" />&nbsp;円
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
									maxlength="10" value="${form.contractKyoekihi}" disabled="${form.contractDelDisableFlg }" tabindex="75" />&nbsp;円
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
									maxlength="10" value="${form.contractLandRent}" disabled="${form.contractDelDisableFlg }" tabindex="76" />&nbsp;円
							</td>
						</tr>
						<tr>
							<th rowspan ="2" colspan="2">
								<!-- 備考 -->
								<nfwui:LabelBox id="lblContractBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_BIKO %>" />
							</th>
							<td rowspan="2">
								<imui:textArea id="contractBiko" name="contractBiko" rows="5" clols="35" maxlength="400"
									style="width:475px;" value="${form.contractBiko}" disabled="${form.contractDelDisableFlg }" tabindex="77" />
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
			<script type="text/javascript">
				(function($) {
					// 画面表示時に定義される処理
					$(document).ready(function(){
						if ($("#ittoFlg").val() != "true") {
							// 一棟借上以外は非表示
							$('#tabs div[id=keiyaku_info]').hide();
						}
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

						// JSON駐車場区画情報リスト設定
						// 駐車場区画情報リストをJSON文字列に変換し
						// formのhidden変数「jsonParking」に格納する
						setJsonParkingBlock = function() {
							// 駐車場区画情報リスト
							var parkingBlockArray = new Array();
							{
								// 駐車場区画情報取得
								var parkingArrrows = $("#parkingInfoList").getRowData();
								// 駐車場区画行数取得
								var parkingRowNum = parkingArrrows.length;
								// 駐車場区画情報リスト作成
								for (var i = 0; i < parkingRowNum; i++) {
									// Mapコレクション
									var parkingBlockMap = new Object();
									parkingBlockMap['rId'] = parkingArrrows[i].rId;
									parkingBlockMap['parkingKanriNo'] = parkingArrrows[i].parkingKanriNo;
									parkingBlockMap['parkingBlock'] = $("#parkingBlockNo" + parkingArrrows[i].rId).val();
									parkingBlockMap['parkingLendKbn'] = $("#parkingLendKbn" + parkingArrrows[i].rId).val();
									parkingBlockMap['parkingLendStatus'] = parkingArrrows[i].parkingLendStatus;
									parkingBlockMap['shainName'] = parkingArrrows[i].shainName;
									parkingBlockMap['parkingRentalAdjust'] = $("#parkingRentalAdjust" + parkingArrrows[i].rId).val();
									parkingBlockMap['parkingBiko'] = $("#parkingBlockBiko" + parkingArrrows[i].rId).val();
									parkingBlockMap['updateDate'] = parkingArrrows[i].updateDate;
									parkingBlockArray.push(parkingBlockMap);
								}
							}
							// 駐車場区画情報リストをJSON文字列に変換
							$('#jsonParking').val(JSON.stringify(parkingBlockArray));
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
								// 社宅区分
								if ($('#ittoFlg').val() != 'true') {
									// 一棟以外の場合はプルダウン選択値
									drpDwnMap['shatakuKbn'] = $('#shatakuKbn').val();
								} else {
									// 一棟の場合はダミーテキストを入れる
									drpDwnMap['shatakuKbn'] = "4";
								}
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
								// 駐車場台数
								labelMap['parkingBlockCount'] = $('#parkingBlockCount').text().replace("台", "").trim();
								// 貸与可能総数
								labelMap['lendPossibleCount'] = $('#lendPossibleCount').text().replace("台", "").trim();
								labelArray.push(labelMap);
							}
							// 可変ラベルリストをJSON文字列に変換
							$('#jsonLabelList').val(JSON.stringify(labelArray));
						}
						// 現在状態バックアップ
						// ドロップ選択値ダウンリスト、可変ラベルリスト、リストテーブルのバックアップを行う
						backUpStatus = function() {
							// JSON駐車場区画情報リスト設定
							setJsonParkingBlock();
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
								backUpStatus();
								url = "skf/Skf3010Sc002/attachedFileAdd";
								nfw.common.submitForm("form", url);
							}
						}

						//補足資料削除ボタンクリック
						fileDelete = function(no,type) {
								//ファイル番号設定
								$("#fileNo").val(no);
								$("#hosokuType").val(type);
								//保存情報設定
								backUpStatus();
								
								var dialogTitle = "確認";
								//MessageIdConstant.：I-SKF-3005
								var dialogMessage = "削除します。よろしいですか？";
								nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc002/attachedFileDelete", "ok", "キャンセル", this, true);
						}

						// 登録ボタンクリック
						enterClick = function() {
							//MessageIdConstant.I_SKF_3035[{0}を登録します。よろしいですか？]
							$("<div>保有社宅情報を登録します。よろしいですか？</div>").imuiMessageDialog({
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
												url = "skf/Skf3010Sc002/regist";
												nfw.common.submitForm("form", url);
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
								url = "skf/Skf3010Sc002/regist";
								nfw.common.submitForm("form", url);
							}
						}

						// 削除ボタンクリック
						deleteClick = function() {
							// 現在状態バックアップ
							backUpStatus();
							var dialogTitle = "確認";
							//MessageIdConstant.：I-SKF-3003
							var dialogMessage = "社宅（" + $("#shatakuName").val() + "）の削除処理を実行します。よろしいですか？";
							nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc002/delete", "ok", "キャンセル", this, true);
						}

						// 住所検索押下時のイベント
						addressSearchClick = function() {
							var map = new Object();
							map['zipCd'] = $("#zipCd").val();
							// 住所検索
							nfw.common.doAjaxAction("skf/Skf3010Sc002/AddressSearchAsync", map, true, function(data) {
								$("#pref").imuiSelect('replace', data.prefList);
								$("#shatakuAddress").val(data.shatakuAddress);
							});
						}

						// 駐車場区画追加ボタンクリック時のイベント
						addParkingBlockClick = function() {
							// リストデータ取得
							var arrrows = $("#parkingInfoList").getRowData();
							// 現在の最大のRID番号取得
							var maxRid = 0;
							for (i = 0; i < arrrows.length; i++) {
								var cur = parseInt(arrrows[i].rId);
								if (maxRid < cur) {
									maxRid = cur;
								}
							}
							// 次設定RID
							var nextRid = maxRid + 1;
							// 駐車場基本使用料
							var parkingMonthRental = $("#parkingBasicRent").text().trim();
							// 駐車場状況初期値
							var defaultParkingLendStatus = $("#defaultParkingLendStatus").val().trim();

							var addRowData = {
								"rId": nextRid,
								"parkingKanriNo":"",
								"parkingBlock":"<input id='parkingBlockNo" + nextRid + "' name='parkingBlockNo" + nextRid
										+ "' type='text' value='' placeholder='例　01（半角）' style='width:140px;' maxlength='30'/>",
								"parkingLendKbn":"<select id='parkingLendKbn" + nextRid + "' name='parkingLendKbn" + nextRid
										+ " 'style='width:90px;'>" + $("#lendKbnSelectListString").val() + "</select>",
								"parkingLendStatus":defaultParkingLendStatus,
								"shainName":"",
								"parkingRentalAdjust":"<input id='parkingRentalAdjust" + nextRid + "' name='parkingRentalAdjust" + nextRid
									+ "' placeholder='例　半角数字' type='text' value='0' style='ime-mode: disabled; width:75px; text-align: right;' maxlength='6'/> 円",
								"parkingMonthRental":"<label id='parkingMonthRental" + nextRid + "' name='parkingMonthRental"
																			+ nextRid + "' >" + parkingMonthRental + "</label>",
								"parkingBiko":"<input id='parkingBlockBiko" + nextRid + "' name='parkingBlockBiko"
												+ nextRid + "' type='text' value='' style='width:215px;' maxlength='100'/>",
								"parkingBlockDelete":"",
								"updateDate":""
							};
							// 駐車場に1区画追加
							$("#parkingInfoList").addRowData(undefined, addRowData);
							// 駐車場台数を加算
							var parkingBlockCount = parseInt($("#parkingBlockCount").text().replace("台", "").trim()) + 1;
							$("#parkingBlockCount").text(parkingBlockCount + " 台");
							// 貸与可能総数を減算
							var lendPossibleCount = parseInt($("#lendPossibleCount").text().replace("台", "").trim()) + 1;
							$("#lendPossibleCount").text(lendPossibleCount + " 台");
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
												url = "skf/Skf3010Sc002/addContractList";
												nfw.common.submitForm("form", url);
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
																url = "skf/Skf3010Sc002/addContractList";
																nfw.common.submitForm("form", url);
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
									nfw.common.doAjaxAction("skf/Skf3010Sc002/DeleteContractErrAsync", map, true, function(data) {});
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
												url = "skf/Skf3010Sc002/delContractList";
												nfw.common.submitForm("form", url);
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
												url = "skf/Skf3010Sc002/delContractList";
												nfw.common.submitForm("form", url);
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

						// 駐車場契約情報ボタンクリック
						contractParkingInfoClick = function() {
							var dialogTitle = "確認";
							//MessageIdConstant.：I-SKF-3110
							var dialogMessage = "社宅情報は登録済みでしょうか。確認後、駐車場契約情報登録を行ってください。";
							nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc007/init", "ok", "キャンセル", this, true);
						}

						// 賃貸人入力支援コールバック
						contractOwnerInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#contractOwnerName").val(param.name);
								$("#contractOwnerNo").val(param.shainNo);
							}
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
							nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeAreaDrpDwnAsync", map, true, function(data) {
								// 次回算定年月日設定
								$("#nextCalculateDate").text(data.nextCalcDate);
								// 実年数設定
								$("#realYearCount").text(data.jituAge);
								// 経年設定
								$("#aging").text(data.aging);
								// 駐車場基本使用料設定
								$("#parkingBasicRent").text(data.parkingBasicRent + " 円");
								// 駐車場区画使用料設定
								for (var i = 0; i < rowNum; i++) {
									$("#parkingMonthRental" + arrrows[i].rId).text(data.parkingBlockRentManys[i]);
								}
							});
						});

						// 駐車場構造ドロップダウンチェンジ
						$("#parkingStructure").bind('change', function() {
							var map = new Object();
							map['buildDate'] = $("#buildDate").val();
							map['areaKbnCd'] = $("#areaKbn").val();
							map['structureKbn'] = $("#shatakuStructure").val();
							map['parkingStructure'] = $("#parkingStructure").val();
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
							nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeParkingStructureDrpDwnAsync", map, true, function(data) {
								// 駐車場基本使用料設定
								$("#parkingBasicRent").text(data.parkingBasicRent + " 円");
								// 駐車場区画使用料設定
								for (var i = 0; i < rowNum; i++) {
									$("#parkingMonthRental" + arrrows[i].rId).text(data.parkingBlockRentManys[i]);
								}
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
								url = "skf/Skf3010Sc002/changeContractDrpDwn";
								nfw.common.submitForm("form", url);
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
												url = "skf/Skf3010Sc002/changeContractDrpDwn";
												nfw.common.submitForm("form", url);
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

						//添付ファイルリンククリック時
						$("a[id^='attached_']").click(function(){
							downloadShatakuHosokuFile(this);
						});
						
						$("#supportDormitoryLeaderName, #supportKeyManagerName").click(function(){
					    	var id = $(this).attr("id");
					    	var formName = id.replace(/^support/g, "").replace(/^[A-Z]/g, function(val) {
					    		return val.toLowerCase();
					    	});
					    	$("#insertFormName").val(formName);
						});
					});

					// 動的に作成したコントロールのイベント
					// 駐車場調整金額チェンジ
					jQuery(document).on("change", "input[id^='parkingRentalAdjust']", function(data) {
						var map = new Object();
						// 駐車場基本使用料取得
						var parkingBasicRent = $("#parkingBasicRent").text().replace("円", "").replace(/,/g, "").trim();
						// リストテーブル情報取得
						var grid = $("#parkingInfoList");
						// RelativeID取得
						var rId = data.target.id.replace("parkingRentalAdjust", "");
						// 駐車場調整金額取得
						var parkingRentalAdjust = $("#parkingRentalAdjust" + rId).val().replace(/,/g, "");
						// パラメータ設定
						var parkingRentalAdjusts = new Array();
						parkingRentalAdjusts.push(parkingRentalAdjust);
						map['parkingBasicRent'] = parkingBasicRent;
						map['parkingRentalAdjusts'] = parkingRentalAdjusts;
						// 金額チェンジイベント
						nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeParkingRentalAdustsTextAsync", map, true, function(data) {
							$("#parkingMonthRental" + rId).text(data.parkingBlockRentManys[0]);
						});
					});

					// 駐車場貸与区分ドロップダウンチェンジ
					jQuery(document).on("change", "select[id^='parkingLendKbn']", function(data) {
						// RelativeID取得
						var rId = data.target.id.replace("parkingLendKbn", "");
						// 行データ取得
						var rowData = $("#parkingInfoList").getRowData(rId);
						// 駐車場貸与区分取得
						var lendKbn = $("#parkingLendKbn" + rId).val();
						// 駐車場貸与状況取得
						var lendStatus = rowData.parkingLendStatus;
						// 駐車場台数取得
						var parkingBlockCount = $("#parkingBlockCount").text().replace("台", "").trim();
						// 貸与可能総数取得
						var lendPossibleCount = $("#lendPossibleCount").text().replace("台", "").trim();
						// パラメータ設定
						var parkingBlockRowData = new Array();
						parkingBlockRowData.push(lendKbn);
						parkingBlockRowData.push(lendStatus);
						var map = new Object();
						map['parkingBlockRowData'] = parkingBlockRowData;
						map['parkingBlockCount'] = parkingBlockCount;
						map['lendPossibleCount'] = lendPossibleCount;
						// ドロップダウンチェンジイベント
						nfw.common.doAjaxAction("skf/Skf3010Sc002/ChangeParkingLendKbnDrpDwnAsync", map, true, function(data) {
							$("#parkingBlockCount").text(data.parkingBlockCount);
							$("#lendPossibleCount").text(data.lendPossibleCount);
						});
					});

					//添付ファイルリンククリック時
					downloadShatakuHosokuFile = function(data) {
						//リンクタグのidから補足種別と添付ファイル番号を取得
						var id = $(data).attr("id");
						var url = "skf/Skf3010Sc002/AttachedDownload";
						var list = id.split('_');
						var hosokuType = list[1];
						var fileNo = list[3];
						$("#sendHosokuType").val(hosokuType);
						$("#sendAttachedNo").val(fileNo);
						nfw.common.submitForm("form", url);
					}

					// アイコンクリック
					onCellSelect = function(rowId,iCol,cellcontent,e) {

						// 駐車場削除アイコンクリック時
						if ($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')) {
							var map = new Object();
							// 行番号から選択した行の情報を取得
							var rowData = $("#parkingInfoList").getRowData(rowId);
							// 駐車場管理番号取得
							var parkingKanriNo = rowData.parkingKanriNo;
							// RID取得
							var rId = rowData.rId;
							// 駐車場貸与区分取得
							var lendKbn = $("#parkingLendKbn" + rId).val();
							// 駐車場区画番号取得
							var parkingBlockNo = $("#parkingBlockNo" + rId).val();
							// 駐車場貸与状況取得
							var lendStatus = rowData.parkingLendStatus;
							// 駐車場台数取得
							var parkingBlockCount = $("#parkingBlockCount").text().replace("台", "").trim();
							// 貸与可能総数取得
							var lendPossibleCount = $("#lendPossibleCount").text().replace("台", "").trim();
							// パラメータ設定
							var parkingBlockRowData = new Array();
							parkingBlockRowData.push(lendKbn);
							parkingBlockRowData.push(lendStatus);
							map['parkingBlockRowData'] = parkingBlockRowData;
							map['parkingBlockCount'] = parkingBlockCount;
							map['lendPossibleCount'] = lendPossibleCount;
							map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
							map['deleteParkingKanriNo'] = parkingKanriNo;
							map['deleteParkingBlockNo'] = parkingBlockNo;
							// 削除ボタン押下イベント
							nfw.common.doAjaxAction("skf/Skf3010Sc002/DeleteParkingBlockAsync", map, true, function(data) {
								$("#parkingBlockCount").text(data.parkingBlockCount);
								$("#lendPossibleCount").text(data.lendPossibleCount);
								// 駐車場区画削除判定
								if(data.parkingBlockDeleteFlg) {
									// 駐車場を1区画削除
									$("#parkingInfoList").delRowData(rowId);
								}
							});
							window.scrollTo(0, 0);
						}
					}
				})(jQuery);
			</script>
		</div>
		<br />
		<div class="align-L float-L">
			<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()" tabindex="79"/>
		</div>
		<div class="align-R">
			<!-- 登録 -->
			<imui:button id="enter" name="enter" value="登録" class="imui-medium-button" style="width:150px;" onclick="enterClick()" tabindex="80" />
			<!-- 削除 -->
			<imui:button id="delete" name="delete" value="削除" class="imui-medium-button" style="width:150px;"
											onclick="deleteClick()" tabindex="81" disabled="${form.newShatakuFlg }"/>
		</div>
		<!-- 現在表示中タブインデックス -->
		<input type="hidden" name="hdnNowSelectTabIndex" id="hdnNowSelectTabIndex" value="${form.hdnNowSelectTabIndex}" />
		<!-- 初期表示契約情報プルダウンインデックス -->
		<input type="hidden" name="hdnDispContractSelectedIndex" id="hdnDispContractSelectedIndex" value="${form.hdnDispContractSelectedIndex}" />
		<!-- 現在表示中契約情報プルダウンインデックス -->
		<input type="hidden" name="hdnChangeContractSelectedIndex" id="hdnChangeContractSelectedIndex" value="${form.hdnDispContractSelectedIndex}" />
		<!-- 現在表示中契約情報削除プルダウンインデックス -->
		<input type="hidden" name="hdnDeleteContractSelectedValue" id="hdnDeleteContractSelectedValue" value="${form.hdnDeleteContractSelectedValue}" />
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
	</nfwui:Form>
</div>
<!-- コンテンツエリア　ここまで -->