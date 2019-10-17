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
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form"  enctype="multipart/form-data" >
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
		<!-- JSON備品情報 -->
		<input type="hidden" name="jsonBihin" id="jsonBihin" />
		<!-- JSONドロップダウン選択値リスト -->
		<input type="hidden" name="jsonDrpDwnList" id="jsonDrpDwnList" />
		<!-- JSON可変ラベルリスト -->
		<input type="hidden" name="jsonLabelList" id="jsonLabelList" />
		<!-- 編集フラグ(編集中は「true」 -->
		<input type="hidden" name="onChangeFlag" id="onChangeFlag" value="false"/>
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc006/init"/>
		<!-- 補足ファイル -->
		<input type="hidden" name="fileNo" id="fileNo"/>
		<input type="hidden" name="hosokuType" id="hosokuType"/>
		<input type="hidden" name="hdnHosoku" id="sendHosokuType"/>
		<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo"/>
		
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 5%;">
						<!-- 社宅名 -->
						<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC002_LBL_SHATAKU_NAME %>" />
					</th>
					<td style="width: 10%;">
						<imui:textbox id="shatakuName" name="shatakuName" style="width:200px;" maxlength="30"
							class="${form.shatakuNameErr}" value="${form.shatakuName}" placeholder="例　社宅名" tabindex="1" />
					</td>
					<th style="width: 5%;">
						<!-- 地域区分 -->
						<nfwui:LabelBox id="lblAreaKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_AREA_KBN %>" />
					</th>
					<td style="width: 5%;">
						<imui:select id="areaKbn" name="areaKbn" width="100" list="${form.areaKbnList}" class="${form.areaKbnErr}" tabindex="2" />
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
				<nfwui:Table use="input">
					<tbody>
						<!--利用区分-->
						<tr>
							<th colspan="2">
								<!-- 利用区分 -->
								<nfwui:LabelBox id="lblUseKbn" code="<%=MessageIdConstant.SKF3010_SC002_LBL_USE_KBN %>" />
							</th>
							<td colspan="3">
								<imui:select id="useKbn" name="useKbn" width="90" list="${form.useKbnList}" class="${form.useKbnKbnErr}" tabindex="4" />
							</td>
						</tr>
						<!--管理会社-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageCompany" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_COMPANY %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageCompany" name="manageCompany" width="160"
									list="${form.manageCompanyList}" class="${form.manageCompanyErr}" tabindex="5" />
							</td>
						</tr>
						<!--管理機関-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageAgency" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_AGENCY %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageAgency" name="manageAgency" width="160"
									list="${form.manageAgencyList}" class="${form.manageAgencyErr}" tabindex="6" />
							</td>
						</tr>
						<!--管理事業領域-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblManageBusinessArea" code="<%=MessageIdConstant.SKF3010_SC002_LBL_MANAGE_BUSINESS_AREA %>" />
							</th>
							<td colspan="3">
								<imui:select id="manageBusinessArea" name="manageBusinessArea" width="160"
									list="${form.manageBusinessAreaList}" class="${form.manageBusinessAreaErr}" tabindex="7" />
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
								<imui:textbox id="zipCd" name="zipCd" style="ime-mode: disabled;width:85px;" value="${form.zipCd}"
													class="${form.zipCdErr}" placeholder="例　4600003" maxlength="7" tabindex="8"/>
								<imui:button id="addressSearch" name="addressSearch" value="住所検索"
										class="imui-small-button" onclick="addressSearchClick()" tabindex="9" />
							</td>
						</tr>
						<!--住所-->
						<tr>
							<th>
								<nfwui:LabelBox id="lblAddressDetail" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ADDRESS_DETAIL %>" />
							</th>
							<td colspan="3">
								<!-- 都道府県リスト -->
								<imui:select id="pref" name="pref" width="90" list="${form.prefList}" class="${form.prefErr}" tabindex="10" />
								<imui:textbox id="shatakuAddress" name="shatakuAddress" style="width:615px;" maxlength="100"
								value="${form.shatakuAddress}" placeholder="例　名古屋市中区錦2-18-19" class="${form.shatakuAddressErr}" tabindex="11" />
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
									list="${form.shatakuStructureList}" class="${form.shatakuStructureErr}" tabindex="12" />
								<imui:textbox id="shatakuStructureDetail" name="shatakuStructureDetail" style="width:360px;"
									maxlength="30" value="${form.shatakuStructureDetail}" placeholder="例　RC3F" tabindex="13" />
							</td>
						</tr>
						<!--エレベーター-->
						<tr>
							<th colspan="2">
								<nfwui:LabelBox id="lblElevator" code="<%=MessageIdConstant.SKF3010_SC002_LBL_ELEVATOR %>" />
							</th>
							<td colspan="3">
								<!-- エレベーターリスト -->
								<imui:select id="elevator" name="elevator" width="90" list="${form.elevatorList}" tabindex="14" />
							</td>
						</tr>
						<!--建築年月日-->
						<tr>
							<div>
							<th colspan="2">
								<nfwui:LabelBox id="lblBuildDate" code="<%=MessageIdConstant.SKF3010_SC002_LBL_BUILD_DATE %>" />
							</th>
							<td>
								<nfwui:DateBox id="buildDate" name="buildDate" value="${f:h(form.buildDate)}" cssStyle="width:100px" tabindex="15"/>
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
								<a id="${form.shatakuHosokuLink1 }" tabindex="16">${form.shatakuHosokuFileName1 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku1" name="impShatakuHosoku1" value="参照" class="imui-small-button" tabindex="17" onclick="fileSelect('1','shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku1" name="tmpFileBoxshataku1" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku1" name="delShatakuHosoku1" value="削除" class="imui-small-button" tabindex="18" onclick="fileDelete('1','shataku')"/>
							</td>
						</tr>
						<!--社宅補足-->
						<tr style="display:table-row;">
							<td>
								<a id="${form.shatakuHosokuLink2 }" tabindex="19">${form.shatakuHosokuFileName2 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku2" name="impShatakuHosoku2" value="参照" class="imui-small-button" tabindex="20" onclick="fileSelect('2','shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku2" name="tmpFileBoxshataku2" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku2" name="delShatakuHosoku2" value="削除" class="imui-small-button" tabindex="21" onclick="fileDelete('2','shataku')"/>
							</td>
						</tr>
						<!--社宅補足-->
						<tr style="display:table-row;">
							<td>
								<a id="${form.shatakuHosokuLink3 }">${form.shatakuHosokuFileName3 }</a>
							</td>
							<td colspan="2">
								<!-- 参照 -->
								<imui:button id="impShatakuHosoku3" name="impShatakuHosoku3" value="参照" class="imui-small-button" tabindex="23" onclick="fileSelect('3','shataku')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxshataku3" name="tmpFileBoxshataku3" />
								<!-- 削除 -->
								<imui:button id="delShatakuHosoku3" name="delShatakuHosoku3" value="削除" class="imui-small-button" tabindex="24" onclick="fileDelete('3','shataku')"/>
							</td>
						</tr>
						<!--備考-->
						<tr>
							<th rowspan="3" colspan="2">
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_BIKO %>" />
							</th>
							<td rowspan="3" colspan="3">
								<imui:textArea id="biko" name="biko" rows="3" style="width:715px;" maxlength="400" value="${form.biko}" tabindex="25" />
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
								<imui:textbox id="roomNo" name="roomNo" style="ime-mode: disabled;width:120px;" value="${form.roomNo}" 
								class="${form.roomNoError}" placeholder="例　101（半角）" maxlength="10" tabindex="25"/>
							</td>
							<th style="width: 15%;">
		<!-- 				<label>本来延面積</label> -->
								<nfwui:LabelBox id="lblOriginalMenseki" code="<%=MessageIdConstant.SKF3010_SC006_ORIGINALMENSEKI%>" />
							</th>
							<td>
								<imui:textbox id="originalMenseki" name="originalMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${form.originalMenseki}"  class="${form.originalMensekiError}" placeholder="例　70.5" maxlength="8" tabindex="26"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 					<label>本来規格</label> -->
								<nfwui:LabelBox id="lblOriginalKikaku" code="<%=MessageIdConstant.SKF3010_SC006_ORIGINALKIKAKU %>" />
							</th>
							<td>
								<imui:select id="originalKikaku" name="originalKikaku" 
									width="200" list="${form.originalKikakuList}" class="${form.originalKikakuError}" tabindex="27" />
							</td>
							<th>
		<!-- 					<label>貸与延面積</label> -->
								<nfwui:LabelBox id="lblLendMenseki" code="<%=MessageIdConstant.SKF3010_SC006_LENDMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="lendMenseki" name="lendMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${form.lendMenseki}" class="${form.lendMensekiError}" placeholder="例　70.5" maxlength="8" tabindex="28"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 				<label>本来用途</label> -->
								<nfwui:LabelBox id="lblOriginalAuse" code="<%=MessageIdConstant.SKF3010_SC006_ORIGINALAUSE %>" />
							</th>
							<td>
								<imui:select id="originalAuse" name="originalAuse" 
											width="200" list="${form.originalAuseList}" class="${form.originalAuseError}" tabindex="29" />
							</td>
							<th>
			<!-- 				<label>サンルーム面積</label> -->
								<nfwui:LabelBox id="lblSunRoomMenseki" code="<%=MessageIdConstant.SKF3010_SC006_SUNROOMMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="sunRoomMenseki" name="sunRoomMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${form.sunRoomMenseki}" class="${form.sunRoomMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="30"/>㎡
							</td>
						</tr>
						<tr>
							<th>
			<!-- 				<label>貸与区分</label> -->
								<nfwui:LabelBox id="lblSunRoomMenseki" code="<%=MessageIdConstant.SKF3010_SC006_LENDKBN %>" />
							</th>
							<td>
								<imui:select id="lendKbn" name="lendKbn" 
									width="200" list="${form.lendKbnList}" class="${form.lendKbnError}" tabindex="31" />
								<imui:textbox id="lendKbnHosoku" name="lendKbnHosoku" style="width:120px;" value="${form.lendKbnHosoku}" 
								class="${form.lendKbnHosokuError}" placeholder="例　貸与区分" maxlength="5" tabindex="32"/>
							</td>
							<th>
		<!-- 					<label>寒冷地減免事由区分</label> -->
							<nfwui:LabelBox id="lblColdExemptionKbn" code="<%=MessageIdConstant.SKF3010_SC006_COLDEXEMPTIONKBN %>" />
							</th>
							<td>
								<imui:select id="coldExemptionKbn" name="coldExemptionKbn" 
									width="200" list="${form.coldExemptionKbnList}" tabindex="33" />
							</td>
						</tr>
						<tr>
							<th rowspan="3">
			<!-- 				<label>備考</label> -->
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC005_BIKO %>" />
							</th>
							<td rowspan="3">
								<imui:textArea id="roomBiko" name="roomBiko" style="width:90%;" value="${form.roomBiko}" cols="35" rows="5" maxlength="100" tabindex="34"/>
							</td>
							<th>
		<!-- 				<label>階段面積</label> -->
								<nfwui:LabelBox id="lblStairsMenseki" code="<%=MessageIdConstant.SKF3010_SC006_STAIRSMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="stairsMenseki" name="stairsMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${form.stairsMenseki}" class="${form.stairsMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="35"/>㎡
							</td>
						</tr>
						<tr>
							<th>
		<!-- 				<label>物置面積</label> -->
								<nfwui:LabelBox id="lblBarnMenseki" code="<%=MessageIdConstant.SKF3010_SC006_BARNMENSEKI %>" />
							</th>
							<td>
								<imui:textbox id="barnMenseki" name="barnMenseki" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${form.barnMenseki}" class="${form.barnMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="36"/>㎡
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
								list="${form.parkingStructureList}" class="${form.parkingStructureErr}" tabindex="37" />
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
								<a id="${form.parkingHosokuLink1}" tabindex="38">${form.parkingHosokuFileName1}</a>
							</td>
							<td>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking1" name="tmpFileBoxparking1" />
								<!-- 参照 -->
								<imui:button id="impParkingHosoku1" name="impParkingHosoku1" value="参照" class="imui-small-button" tabindex="39" onclick="fileSelect('1','parking')"/>&nbsp;
								<!-- 削除 -->
								<imui:button id="delParkingHosoku1" name="delParkingHosoku1" value="削除" class="imui-small-button" tabindex="40" onclick="fileDelete('1','parking')"/>
							</td>
						</tr>
						<tr style="display:table-row;">
							<!--駐車場補足2-->
							<td >
								<a id="${form.parkingHosokuLink2}" tabindex="41">${form.parkingHosokuFileName2}</a>
							</td>
							<td > 
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking2" name="tmpFileBoxparking2" />
								<!-- 参照 -->
								<imui:button id="impParkingHosoku2" name="impParkingHosoku2" value="参照" class="imui-small-button" tabindex="42" onclick="fileSelect('2','parking')"/>&nbsp;
								<!-- 削除 -->
								<imui:button id="delParkingHosoku2" name="delParkingHosoku2" value="削除" class="imui-small-button" tabindex="43" onclick="fileDelete('2','parking')"/>
							</td>
						</tr>
						<tr style="display:table-row;">
							<!--駐車場補足3-->
							<td>
								<a id="${form.parkingHosokuLink3}" tabindex="44">${form.parkingHosokuFileName3}</a>
							</td>
							<td >
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBoxparking3" name="tmpFileBoxparking3" />
								<!-- 参照 -->
								<imui:button id="impParkingHosoku3" name="impParkingHosoku3" value="参照" class="imui-small-button" tabindex="45" onclick="fileSelect('3','parking')"/>&nbsp;
								<!-- 削除 -->
								<imui:button id="delParkingHosoku3" name="delParkingHosoku3" value="削除" class="imui-small-button" tabindex="46" onclick="fileDelete('3','parking')"/>
							</td>
						</tr>
						<tr>
						<!-- 区画番号 -->
							<th>
								<nfwui:LabelBox id="lblParkingBlock" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_BLOCK %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="parkingBlock" name="parkingBlock" style="text-align: right;ime-mode: disabled;width:100px;" 
								value="${form.parkingBlock}" class="${form.parkingBlockError}" placeholder="例　01（半角）" maxlength="10" tabindex="47"/>
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
								<nfwui:NumberBox name="parkingRentalAdjust" id="parkingRentalAdjust" cssClass="${form.parkingRentalAdjustError}" cssStyle="width:100px;" 
								inputFormat="n0" maxlength="10"  max="99999999" min="-999999" tabindex="48"/>&nbsp;円
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
								<imui:textArea id="parkingBiko" name="parkingBiko" rows="4" maxlength="100" style="width:90%;" value="${form.parkingBiko}" tabindex="49" />
							</td>
						</tr>
					</tbody>
				</table>
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
								maxlength="30" value="${form.manageCompanyName}" placeholder="例　○○管理会社" tabindex="51" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerCompanyName" name="keyManagerCompanyName" style="width:150px;"
								maxlength="30" value="${form.keyManagerCompanyName}" placeholder="例　○○管理会社" tabindex="56" />
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
								maxlength="30" value="${form.manageName}" placeholder="例　中日本　太郎" tabindex="52" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerName" name="keyManagerName" style="width:150px;" maxlength="30"
								value="${form.keyManagerName}" placeholder="例　中日本　太郎" tabindex="57" />
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
								maxlength="30" value="${form.manageMailAddress}" placeholder="例　t.nakanihon.aa@" tabindex="53" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerMailAddress" name="keyManagerMailAddress" style="width:260px;"
								maxlength="50" value="${form.keyManagerMailAddress}" placeholder="例　t.nakanihon.aa@" tabindex="58" />
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
								maxlength="15" value="${form.manageTelNumber}" placeholder="例　052-999-9999" tabindex="54" />
							</td>
							<td>
								<!-- 鍵管理者 -->
								<imui:textbox id="keyManagerTelNumber" name="keyManagerTelNumber" style="width:150px;height:98%"
								maxlength="15" value="${form.keyManagerTelNumber}" placeholder="例　052-999-9999" tabindex="59" />
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
														style="width:260px;" value="${form.manageBiko}" tabindex="55" />
							</td>
							<td rowspan="4">
								<!-- 鍵管理者 -->
								<imui:textArea id="keyManagerBiko" name="keyManagerBiko" rows="4" maxlength="400"
														style="width:260px;" value="${form.keyManagerBiko}" tabindex="60" />
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
																			tabindex="61" disabled="${form.contractDelDisableFlg }"/>
								<!-- 追加ボタン -->
								<imui:button id="contractAdd" name="contractAdd" value="追加" class="imui-small-button" 
												disabled="${form.contractAddDisableFlg}" onclick="contractAddClick()" tabindex="62" />
								<!-- 削除ボタン -->
								<imui:button id="contractDell" name="contractDell" value="削除" class="imui-small-button" 
												disabled="${form.contractDelDisableFlg}" onclick="contractDelClick()" tabindex="63" />
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
																			tabindex="73" disabled="${form.parkingContractDelDisableFlg }"/>
								<!-- 追加ボタン -->
								<imui:button id="parkingContractAdd" name="parkingContractAdd" value="追加" class="imui-small-button" 
												disabled="${form.parkingContractAddDisableFlg}" onclick="parkingContractAddClick()" tabindex="74" />
								<!-- 削除ボタン -->
								<imui:button id="parkingContractDell" name="parkingContractDell" value="削除" class="imui-small-button" 
												disabled="${form.parkingContractDelDisableFlg}" onclick="contractDelClick()" tabindex="75" />
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 賃貸人（代理人） -->
								<nfwui:LabelBox id="lblContractOwner" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_OWNER %>" />
							</th>
							<td>
								<!-- 賃貸人（代理人）テキストボックス -->
								<imui:textbox readonly="true" id="contractOwnerName" name="contractOwnerName"
									style="width:150px;" value="${form.contractOwnerName}" disabled="${form.contractDelDisableFlg }" tabindex="64" />
								<!-- 支援ボタン -->
								<nfwui:PopupButton id="contractSupport" name="contractSupport" value="支援" use="popup"
									cssClass="imui-small-button" popupWidth="650" popupHeight="700"
									modalMode="false" screenUrl="skf/Skf2010Sc001/init"
									parameter="parkingLendKbn:nyukyoFlag"  disabled="${form.contractDelDisableFlg }"
									callbackFunc="contractOwnerInfoCallback()" tabindex="65"/>
							</td>
							<th colspan="2">
								<!-- 契約形態(駐車場) -->
								<nfwui:LabelBox id="lblParkingContractType" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_CONTRACT_TYPE %>" />
							</th>
							<td >
							<imui:select id="parkingContractType" name="parkingContractType" 
								 width="130" list="${form.parkingContractTypeList}" tabindex="76" disabled="${form.parkingContractTypeDisabled}" class="${form.parkingContractTypeError}"/>
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
								<imui:textbox readonly="true" id="parkingOwnerName" name="parkingOwnerName"
									style="width:150px;height:98%" value="${form.parkingOwnerName}" disabled="${form.parkingContractInfoDisabled}" tabindex="77" />
								<!-- 支援ボタン -->
								<nfwui:PopupButton id="parkingContractSupport" name="parkingContractSupport" value="支援" use="popup"
									cssClass="imui-small-button" popupWidth="650" popupHeight="700"
									modalMode="false" screenUrl="skf/Skf2010Sc001/init"
									parameter="parkingLendKbn:nyukyoFlag"  disabled="${form.parkingContractInfoDisabled }"
									callbackFunc="parkingContractOwnerInfoCallback()" tabindex="78"/>
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
								<imui:textbox id="parkingZipCd" name="parkingZipCd" style="ime-mode: disabled;width:85px;" value="${f:h(form.parkingZipCd)}" class="${form.parkingZipCdError}" disabled="${form.parkingContractInfoDisabled}" placeholder="例　4600003" maxlength="7" tabindex="79"/>
								<imui:button id="parkingAddressSearch" name="parkingAddressSearch" value="住所検索" class="imui-small-button" disabled="${form.parkingContractInfoDisabled}" onclick="addressOnClick()" tabindex="80" />
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
									value="${form.assetRegisterNo}" placeholder="例　A001002003004" disabled="${form.contractDelDisableFlg }" tabindex="66" />
							</td>
							<!-- 住所（駐車場） -->
							<th>
								<nfwui:LabelBox id="lblParkingContractAddress" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ADDRESS%>" />
							</th>
							<td>
								<imui:textbox id="parkingContractAddress" name="parkingContractAddress" style="width:300;" value="${f:h(form.parkingContractAddress)}" class="${form.parkingAddressError}" placeholder="例　愛知県名古屋市中区錦2-18-19" maxlength="50" tabindex="81" disabled="${form.parkingContractInfoDisabled}"/>
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
								<nfwui:DateBox id="contractStartDay" name="contractStartDay"
									value="${f:h(form.contractStartDay)}" cssStyle="width:100px" disabled="${form.contractDelDisableFlg }" tabindex="67"/>
							</td>
							<th colspan="2">
							<!-- 駐車場名 -->
								<nfwui:LabelBox id="lblParkingName" code="<%=MessageIdConstant.SKF3010_SC006_PARKING_NAME %>" />
							</th>
							<td colspan="3">
								<imui:textbox id="parkingName" name="parkingName" style="width:150px;" value="${f:h(form.parkingName)}" 
									class="${form.parkingNameError}" disabled="${form.parkingContractInfoDisabled}" placeholder="例　駐車場名" maxlength="30" tabindex="82"/>
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
								<nfwui:DateBox id="contractEndDay" name="contractEndDay"
									value="${f:h(form.contractEndDay)}" cssStyle="width:100px" disabled="${form.contractDelDisableFlg }" tabindex="68"/>
							</td>
							<th colspan="2">
								<!-- 経理連携用管理番号（駐車場） -->
								<nfwui:LabelBox id="lblContractAssetRegisterNo" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_ASSET_REGISTER_NO %>" />
							</th>
							<td>
								<imui:textbox id="parkingAssetRegisterNo" name="parkingAssetRegisterNo" style="ime-mode:disabled;width:150px;" maxlength="13"
									value="${form.parkingAssetRegisterNo}" placeholder="例　A001002003004" disabled="${form.parkingContractInfoDisabled }" tabindex="83" />
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 家賃 -->
								<nfwui:LabelBox id="lblContractRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractRent" name="contractRent" max="99999999" min="0" cssClass="nfw-default-width" cssStyle="width: 100px;"
									maxlength="10" value="${form.contractRent}" disabled="${form.contractDelDisableFlg }" tabindex="69" />&nbsp;円
							</td>
							<th colspan="2">
								<!-- 契約開始日 -->
								<nfwui:LabelBox id="lblContractStartDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_START_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="parkingContractStartDay" name="parkingContractStartDay"
									value="${f:h(form.parkingContractStartDay)}" cssStyle="width:100px" disabled="${form.parkingContractInfoDisabled }" tabindex="84"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<!-- 共益費 -->
								<nfwui:LabelBox id="lblContractKyoekihi" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_KYOEKIHI %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractKyoekihi" name="contractKyoekihi" max="99999999" min="0" cssClass="nfw-default-width" cssStyle="width: 100px;"
									maxlength="10" value="${form.contractKyoekihi}" disabled="${form.contractDelDisableFlg }" tabindex="70" />&nbsp;円
							</td>
							<th colspan="2">
								<!-- 契約終了日 -->
								<nfwui:LabelBox id="lblContractEndtDay" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_END_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="parkingContractEndDay" name="parkingContractEndDay"
									value="${f:h(form.parkingContractEndDay)}" cssStyle="width:100px" disabled="${form.parkingContractInfoDisabled }" tabindex="85"/>
							</td>
						</tr> 
						<tr>
							<th colspan="2">
								<!-- 駐車場料（地代） -->
								<nfwui:LabelBox id="lblContractLandRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_LAND_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="contractLandRent" name="contractLandRent" max="99999999" min="0" cssClass="nfw-default-width" cssStyle="width: 100px;"
									maxlength="10" value="${form.contractLandRent}" disabled="${form.contractDelDisableFlg }" tabindex="71" />&nbsp;円
							</td>
							<th colspan="2">
								<!-- 駐車場料（地代）(駐車場) -->
								<nfwui:LabelBox id="lblContractLandRent" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_LAND_RENT %>" />
							</th>
							<td>
								<nfwui:NumberBox id="parkingLandRent" name="parkingLandRent" max="99999999" min="0" cssClass="nfw-default-width" cssStyle="width: 100px;"
									maxlength="10" value="${form.parkingLandRent}" disabled="${form.parkingContractInfoDisabled }" tabindex="86" />&nbsp;円
							</td>
						</tr>
						<tr>
							<th rowspan ="2" colspan="2">
								<!-- 備考 -->
								<nfwui:LabelBox id="lblContractBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_BIKO %>" />
							</th>
							<td rowspan="2">
								<imui:textArea id="contractBiko" name="contractBiko" rows="5" clols="35" maxlength="400"
									style="width:90%;" value="${form.contractBiko}" disabled="${form.contractDelDisableFlg }" tabindex="72" />
							</td>
							<th rowspan ="2" colspan="2">
								<!-- 備考（駐車場） -->
								<nfwui:LabelBox id="lblContractBiko" code="<%=MessageIdConstant.SKF3010_SC002_LBL_CONTRACT_BIKO %>" />
							</th>
							<td rowspan="2">
								<imui:textArea id="parkingContractBiko" name="parkingContractBiko" rows="5" clols="35" maxlength="400"
									style="width:90%;" value="${form.parkingContractBiko}" disabled="${form.parkingContractInfoDisabled }" tabindex="87" />
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
								// 貸与可能総数
								labelMap['parkingRentalAdjust'] = $('#parkingRentalAdjust').val();
								labelArray.push(labelMap);
							}
							// 可変ラベルリストをJSON文字列に変換
							$('#jsonLabelList').val(JSON.stringify(labelArray));
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
								url = "skf/Skf3010Sc006/attachedFileAdd";
								$("#form").attr("action", url);
								$("#form").submit();
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
						// 登録ボタン句陸
						enterClick = function() {
							alert("それはダメ！");
						}
						// 登録ボタン句陸
						deleteClick = function() {
							alert("まだダメｯ！");
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
							setJsonBihinList();
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
											// 編集フラグ判定
											if ($("#onChangeFlag").val() != "true") {
												url = "skf/Skf3010Sc006/addContractList";
												$("#form").attr("action", url);
												$("#form").submit();
											} else {
												$(this).imuiMessageDialog('close');
												$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
													iconType : 'question',
													title : '確認',
													modal : true,
													buttons: [
														{
															'id': 'contractChangeAddOk',
															'text': 'ok',
															'click': function() {
																url = "skf/Skf3010Sc006/addContractList";
																$("#form").attr("action", url);
																$("#form").submit();
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
//							// 削除済み契約番号バックアップ
//							var deletedContractNo = $("#hdnDeleteContractSelectedValue").val();
							if ($("#contractNo").text().indexOf('契約開始日') != -1) {
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
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteContractSelectedValue").val($("#contractNo").val());
												url = "skf/Skf3010Sc006/delContractList";
												$("#form").attr("action", url);
												$("#form").submit();
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
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteContractSelectedValue").val($("#contractNo").val());
												url = "skf/Skf3010Sc006/delContractList";
												$("#form").attr("action", url);
												$("#form").submit();
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
							//保存情報設定
							setJsonBihinList();
							setVariableLabelList();
							$("#parkingSelectMode").val("addParking");
							// I-SKF-3108
							$("<div>駐車場の契約情報を追加します。よろしいですか？</div>").imuiMessageDialog({
								iconType : 'question',
								title : '確認',
								modal : true,
								buttons: [
									{
										'id': 'contractAddOk',
										'text': 'ok',
										'click': function() {
											// 編集フラグ判定
											if ($("#onChangeFlag").val() != "true") {
												url = "skf/Skf3010Sc006/addParkingContractList";
												$("#form").attr("action", url);
												$("#form").submit();
											} else {
												$(this).imuiMessageDialog('close');
												$("<div>入力内容が無効になります。破棄してもよろしいですか？</div>").imuiMessageDialog({
													iconType : 'question',
													title : '確認',
													modal : true,
													buttons: [
														{
															'id': 'contractChangeAddOk',
															'text': 'ok',
															'click': function() {
																url = "skf/Skf3010Sc006/addParkingContractList";
																$("#form").attr("action", url);
																$("#form").submit();
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
						contractDelClick = function() {
							//保存情報設定
							setJsonBihinList();
							setVariableLabelList();
//							// 削除済み契約番号バックアップ
//							var deletedContractNo = $("#hdnDeleteContractSelectedValue").val();
							if ($("#parkingContractNo").text().indexOf('契約開始日') != -1) {
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
								//MessageIdConstant.：I-SKF-3109
								$("<div>駐車場の契約情報を削除します。よろしいですか？</div>").imuiMessageDialog({
									iconType : 'question',
									title : '確認',
									modal : true,
									buttons: [
										{
											'id': 'contractDelOk1',
											'text': 'ok',
											'click': function() {
												$("#parkingSelectMode").val("delParking");
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteContractSelectedValue").val($("#parkingContractNo").val());
												url = "skf/Skf3010Sc006/addParkingContractList";
												$("#form").attr("action", url);
												$("#form").submit();
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
												$("#parkingSelectMode").val("delParking");
												// 選択値設定(削除済み契約番号)
												$("#hdnDeleteContractSelectedValue").val($("#parkingContractNo").val());
												url = "skf/Skf3010Sc006/addParkingContractList";
												$("#form").attr("action", url);
												$("#form").submit();
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
						
						// 社員入力支援コールバック(寮長・自治会長)
						shainInfoCallback = function(param) {
//						leaderShainInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#dormitoryLeaderName").val(param.name);
								$("#keyManagerName").val(param.name);	// ← 後で削除
								$("#contractOwnerName").val(param.name);	// ← 後で削除
								// 編集フラグを「true」に設定
								$("#onChangeFlag").val("true");
							}
						}
						// 社員入力支援コールバック(鍵管理者)
						keyManagerShainInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#keyManagerName").val(param.name);
								// 編集フラグを「true」に設定
								$("#onChangeFlag").val("true");
							}
						}
						// 賃貸人入力支援コールバック
						contractOwnerInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#contractOwnerName").val(param.name);
								$("#contractOwnerNo").val(param.shainNo);
								// 編集フラグを「true」に設定
								$("#onChangeFlag").val("true");
							}
						}
						// 賃貸人（駐車場）入力支援コールバック
						parkingContractOwnerInfoCallback = function(param) {
							if( param != null && typeof param == 'object' && param.name != null){
								$("#contractOwnerName").val(param.name);
								$("#contractOwnerNo").val(param.shainNo);
								// 編集フラグを「true」に設定
								$("#onChangeFlag").val("true");
							}
						}
						//駐車場契約住所検索
				    	addressOnClick = function () {
							var map = new Object();
							map['parkingZipCd'] = $("#parkingZipCd").val();
							
							nfw.common.doAjaxAction("skf/Skf3010Sc006/ParkingAddressSearchAsync",map,true,function(data) {
								if(data.parkingContractAddress != null && data.parkingContractAddress!=""){
									$("#parkingContractAddress").val(data.parkingContractAddress);
									$("#parkingAddress").text(data.parkingContractAddress);
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
							map['barnMenseki'] = $("#txtBarnMenseki").val();
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
						setDisabled = function(state){
				    		$("#parkingOwnerName").prop("disabled",state);
				    		$("#parkingOwnerName").val("");
				    		$("#parkingOwnerNo").val(null);
							$("#parkingZipCd").prop("disabled",state);
							$("#parkingZipCd").val("");
							$("#parkingContractAddress").prop("disabled",state);
							$("#parkingContractAddress").val("");
							$("#parkingName").prop("disabled",state);
							$("#parkingName").val("");
							$("#parkingAssetRegisterNo").prop("disabled",state);
							$("#parkingAssetRegisterNo").val("");
							$("#parkingContractStartDay").prop("disabled",state);
							$("#parkingContractStartDay").val("");
							$("#parkingContractEndDay").prop("disabled",state);
							$("#parkingContractEndDay").val("");							
							$("#parkingLandRent").val(null);
							wjObj = wijmo.Control.getControl('#parkingLandRentDiv');
							wjObj.value = null;
							$('#parkingLandRent').prop("value", "");
							$("#parkingLandRent").prop("disabled",state);
							$("#parkingContractBiko").prop("disabled",state);
							$("#parkingContractBiko").val("");
							$("#parkingAddressSearch").prop("disabled",state);
							$("#parkingContractSupport").prop("disabled",state);
							
							if(state){
								$('#parkingAddressSearch').addClass("imui-disabled-button");
								$('#parkingContractSupport').addClass("imui-disabled-button");
								//
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
								setDisabled(false);
							}else{
								setDisabled(true);
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
									$("#parkingContractAdd").prop("disabled",false);
									$('#parkingContractAdd').removeClass("imui-disabled-button");
								}else{
									$("#parkingContractAdd").prop("disabled",true);
									$('#parkingContractAdd').addClass("imui-disabled-button");
								}
								setParkingLendKbn($("#parkingStructure").val());
							});
						});
						
						
						// 契約番号ドロップダウンチェンジ
						$("#contractNo").bind('change', function() {
							// 変更後選択値取得
							$("#hdnChangeContractSelectedIndex").val($("#contractNo").val());
							// 編集フラグ判定
							if ($("#onChangeFlag").val() != "true") {
								url = "skf/Skf3010Sc002/changeContractDrpDwn";
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
												url = "skf/Skf3010Sc002/changeContractDrpDwn";
												$("#form").attr("action", url);
												$("#form").submit();
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
						
						// 駐車場住所チェンジ
						$("#parkingContractAddress").bind('change', function() {
							// 駐車場情報の所在地に設定
							$("#parkingAddress").text($("#parkingContractAddress").val());
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

						// 参考にしようと思って残してるやつ
						//添付ファイルリンククリック時
						$("a[id^='attached_']").click(function(){
							downloadShatakuHosokuFile(this);
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
						
			    		$("#form").attr("action", url);
			    		$("#form").submit();
						
					}
					
				})(jQuery);
			</script>
		</div>
		<br />
		<div class="align-L float-L">
			<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()" tabindex="77"/>
		</div>
		<div class="align-R">
			<!-- 登録 -->
			<imui:button id="enter" name="enter" value="登録" class="imui-medium-button" style="width:150px;" onclick="enterClick()" tabindex="78" />
			<!-- 削除 -->
			<imui:button id="delete" name="delete" value="削除" class="imui-medium-button" style="width:150px;"
											onclick="deleteClick()" tabindex="79" disabled="${form.newShatakuFlg }"/>
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
	</nfwui:Form>
</div>
<!-- コンテンツエリア　ここまで -->