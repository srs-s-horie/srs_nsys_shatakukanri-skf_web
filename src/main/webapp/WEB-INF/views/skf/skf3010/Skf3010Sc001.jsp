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
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<%-- コンテンツエリア --%>
<style type="text/css"></style>
<script type="text/javascript">
	// リストテーブルの利用区分の文字色変更
	function onCellAttr(rowId,val,rawObject,cm,rdata){
		var style;
		switch (val) {
			case '使用中':
				style = 'style="color:blue;"';
				break;
			case '解約済':
			case '廃止':
			default:
				style = 'style="color:red;"';
				break;
		}
		return style;
	}
	function cellAttrEllipsis(rowId,val,rawObject,cm,rdata){
		return 'style="text-overflow: ellipsis; white-space: nowrap;"'
	}
</script>
<!-- コンテンツエリア -->
<div class="imui-form-container-wide">
	<div class="imui-chapter-title"><h2>検索条件</h2></div>
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC001 %>" />
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 5%;">
						<!-- 管理会社 -->
						<nfwui:LabelBox id="lblManageCompany" code="<%=MessageIdConstant.SKF3010_SC001_LBL_MANAGE_COMPANY %>" />
					</th>
					<td style="width: 7%;">
						<imui:select id="selectedCompanyCd" name="selectedCompanyCd" 
						width="185" list="${form.manageCompanyList}" tabindex="3" />
					</td>
					<th style="width: 5%;">
						<!-- 社宅区分 -->
						<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC001_LBL_SHATAKU_KBN %>" />
					</th>
					<td style="width: 5%;">
						<imui:select id="shatakuKbnCd" name="shatakuKbnCd" 
						width="128" list="${form.shatakuKbnList}" tabindex="5" />
					</td>
					<th style="width: 5%;">
						<!-- 空き部屋 -->
						<nfwui:LabelBox id="lblEmptyRoom" code="<%=MessageIdConstant.SKF3010_SC001_LBL_EMPTY_ROOM %>" />
					</th>
					<td style="width: 3%;">
						<imui:select id="emptyRoomCd" name="emptyRoomCd" 
						width="74" list="${form.emptyRoomList}" tabindex="7" />
					</td>
					<th style="width: 7%;">
						<!-- 社宅名 -->
						<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC001_LBL_SHATAKU_NAME %>" />
					</th>
					<td style="width: 10%;">
						<imui:textbox id="shatakuName" name="shatakuName" style="width:260px;"
							maxlength="30" value="${form.shatakuName}" placeholder="例　社宅名" tabindex="9" />
					</td>
				</tr>
				<tr>
					<th>
						<!-- 管理機関 -->
						<nfwui:LabelBox id="lblManageAgency" code="<%=MessageIdConstant.SKF3010_SC001_LBL_MANAGE_AGENCY %>" />
					</th>
					<td>
						<!-- 管理機関表示フラグ判定 -->
						<c:if test="${form.agencyDispFlg == 'true'}">
							<imui:select id="agencyCd" name="agencyCd" 
							width="185" list="${form.manageAgencyList}" tabindex="4" />
						</c:if>
						<c:if test="${form.agencyDispFlg == 'false'}">
							<imui:select id="agencyCd" name="agencyCd" 
							width="185" list="${form.manageAgencyList}" tabindex="4" disabled/>
						</c:if>
					</td>
					<th>
						<!-- 利用区分 -->
						<nfwui:LabelBox id="lblUseKbn" code="<%=MessageIdConstant.SKF3010_SC001_LBL_USE_KBN %>" />
					</th>
					<td>
						<imui:select id="useKbnCd" name="useKbnCd" 
						width="128" list="${form.useKbnList}" tabindex="6" />
					</td>
					<th>
						<!-- 空き駐車場 -->
						<nfwui:LabelBox id="lblEmptyParking" code="<%=MessageIdConstant.SKF3010_SC001_LBL_EMPTY_PARKING %>" />
					</th>
					<td>
						<imui:select id="emptyParkingCd" name="emptyParkingCd" 
						width="74" list="${form.emptyParkingList}" tabindex="8" />
					</td>
					<th>
						<!-- 社宅住所 -->
						<nfwui:LabelBox id="lblShatakuAddress" code="<%=MessageIdConstant.SKF3010_SC001_LBL_SHATAKU_ADDRESS %>" />
					</th>
					<td>
						<imui:textbox id="shatakuAddress" name="shatakuAddress" style="width:260px;" maxlength="100"
								value="${f:h(form.shatakuAddress)}" placeholder="例　愛知県名古屋市中区錦2-18-19" tabindex="10" />
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
	</nfwui:Form>
	<div class="align-L">
		<nfwui:Button id="search" name="search" code="<%=MessageIdConstant.SKF3010_SC001_BTN_SEARCH %>" cssClass="imui-small-button" 
			url="skf/Skf3010Sc001/search" formId="form" tabindex="11" />
	</div>
</div>
<!-- 明細＆細目未満 -->
<div class="imui-form-container-wide">
	<!-- 明細部 -->
	<nfwui:Form id="listTableForm" name="listTableForm" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC001 %>" />
		<!-- 検索キー  -->
		<!-- 検索キー：管理会社コード -->
		<input type = "hidden" name="hdnSelectedCompanyCd" id="hdnSelectedCompanyCd" value="${form.hdnSelectedCompanyCd}" />
		<!-- 検索キー：管理機関コード -->
		<input type = "hidden" name="hdnAgencyCd" id="hdnAgencyCd" value="${form.hdnAgencyCd}" />
		<!-- 検索キー：社宅区分コード -->
		<input type = "hidden" name="hdnShatakuKbnCd" id="hdnShatakuKbnCd" value="${form.hdnShatakuKbnCd}" />
		<!-- 検索キー：利用区分コード -->
		<input type = "hidden" name="hdnUseKbnCd" id="hdnUseKbnCd" value="${form.hdnUseKbnCd}" />
		<!-- 検索キー：空き部屋コード -->
		<input type = "hidden" name="hdnEmptyRoomCd" id="hdnEmptyRoomCd" value="${form.hdnEmptyRoomCd}" />
		<!-- 検索キー：空き駐車場コード -->
		<input type = "hidden" name="hdnEmptyParkingCd" id="hdnEmptyParkingCd" value="${form.hdnEmptyParkingCd}" />
		<!-- 検索キー：社宅名 -->
		<input type = "hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName}" />
		<!-- 検索キー：社宅住所 -->
		<input type = "hidden" name="hdnShatakuAddress" id="hdnShatakuAddress" value="${form.hdnShatakuAddress}" />
		
		<!-- 選択行 -->
		<!-- 選択行:社宅区分 -->
		<input type="hidden" name="hdnRowShatakuKbn" id="hdnRowShatakuKbn" value="" />
		<!-- 選択行:社宅管理番号 -->
		<input type="hidden" name="hdnRowShatakuKanriNo" id="hdnRowShatakuKanriNo" value="" />
		<!-- 選択行:社宅名 -->
		<input type="hidden" name="hdnRowShatakuName" id="hdnRowShatakuName" value="" />
		<!-- 選択行:地域区分 -->
		<input type="hidden" name="hdnRowAreaKbn" id="hdnRowAreaKbn" value="" />
		<!-- 選択行:空き部屋数 -->
		<input type="hidden" name="hdnRowEmptyRoomCount" id="hdnRowEmptyRoomCount" value="" />
		<!-- 選択行:空き駐車場数 -->
		<input type="hidden" name="hdnRowEmptyParkingCount" id="hdnRowEmptyParkingCount" value="" />
		<!-- 複写フラグ -->
		<input type="hidden" name="copyFlg" id="copyFlg" value="" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc001/init"/>
		<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
		<div id="listTable">
			<imui:listTable id="mainList" process="jssp" autoEncode="true" autoWidth="true" rowNumbers="true" autoResize="true" rowNumWidth="35"
				onCellSelect="onCellSelect" multiSelect="false" data="${form.listTableData }" height="300" tabindex="12">
				<pager rowNum="${form.listTableMaxRowCount }" />
				<cols sortable="false">
					<col name="companyName" caption="管理会社" width="115" sortable="false" align="left" onCellAttr="cellAttrEllipsis"/>
					<col name="agencyName" caption="管理機関" width="115" sortable="false" align="left" wrap="true" />
					<col name="shatakuKbn" caption="社宅区分" width="100" sortable="false" align="center" wrap="true" />
					<col name="useKbn" caption="利用区分" width="100" sortable="false" align="center" onCellAttr="onCellAttr" wrap="true" />
					<col name="shatakuName" caption="社宅名" width="259" sortable="false" align="left" wrap="true" />
					<col name="shatakuAddress" caption="社宅所在地" width="259" sortable="false" align="left" onCellAttr="cellAttrEllipsis"/>
					<col name="structureKbn" caption="構造" width="50" sortable="false" align="center" wrap="true" />
					<col name="aging" caption="経年" width="50" sortable="false" align="center" wrap="true" />
					<col name="emptyRoomCount" caption="空き部屋数" width="90" sortable="false" align="right" wrap="true" />
					<col name="emptyParkingCount" caption="空き駐車場数" width="105" sortable="false" align="right" wrap="true" />
					<col name="col11" caption="基本" width="50" sortable="false" align="center" >
						<showIcon iconClass="im-ui-icon-common-16-update" />
					</col>
					<col name="col12" caption="部屋" width="50" sortable="false" align="center" >
						<showIcon iconClass="im-ui-icon-common-16-update" />
					</col>
					<col name="hdnShatakuKbn" caption="対象行の社宅区分" hidden="true" />
					<col name="hdnShatakuKanriNo" caption="対象行の社宅管理番号" hidden="true" />
					<col name="hdnShatakuName" caption="対象行の社宅名" hidden="true" />
					<col name="hdnAreaKbn" caption="対象行の地域区分" hidden="true" />
					<col name="hdnEmptyRoomCount" caption="対象行の空き部屋数" hidden="true" />
					<col name="hdnEmptyParkingCount" caption="対象行の空き駐車場数" hidden="true" />
					<col name="hdnRoomNo" caption="対象行の部屋番号" hidden="true" />
				</cols>
			</imui:listTable>
		</div>

		<script type="text/javascript">
			(function($) {
				onCellSelect = function(rowId,iCol,cellcontent,e) {
					// リストテーブル情報取得
					var grid = $("#mainList");
					// 行番号から選択した行の情報を取得
					var row = grid.getRowData(rowId);
					// 社宅区分
					var shatakuKbn = row.hdnShatakuKbn;
					// URL
					var url = "skf/Skf3010Sc001/init";

					// 社宅区分
					$("#hdnRowShatakuKbn").val(shatakuKbn);
					// 社宅管理番号
					$("#hdnRowShatakuKanriNo").val(row.hdnShatakuKanriNo);
					// 社宅名
					$("#hdnRowShatakuName").val(row.hdnShatakuName);
					// 地域区分
					$("#hdnRowAreaKbn").val(row.hdnAreaKbn);
					// 空き部屋数
					$("#hdnRowEmptyRoomCount").val(row.hdnEmptyRoomCount);
					// 空き駐車場数
					$("#hdnRowEmptyParkingCount").val(row.hdnEmptyParkingCount);
					// 複写フラグ
					$("#copyFlg").val("false");

					// クリックアイコン判定
					if ($(cellcontent).hasClass('im-ui-icon-common-16-update') && iCol == 11) {
						/** 基本 */
						// 社宅区分判定
						if (shatakuKbn != "2") {
							// 保有社宅登録画面へ
							url = "skf/Skf3010Sc002/init";
						} else {
							// 借上げ社宅登録画面へ
							url = "skf/Skf3010Sc006/init";
						}
						nfw.common.submitForm("listTableForm", url);
					} else if ($(cellcontent).hasClass('im-ui-icon-common-16-update') && iCol == 12) {
						/** 部屋 */
						url = "skf/Skf3010Sc004/init";
						nfw.common.submitForm("listTableForm", url);
					}
				}
				$("#selectedCompanyCd").bind('change', function() {
					var map = new Object();
					map['selectedCompanyCd'] = $("#selectedCompanyCd").val();
					map['agencyCd'] = "";
					// ドロップダウンチェンジイベント
					nfw.common.doAjaxAction("skf/Skf3010Sc001/ChangeDropDownAsync",map,true,function(data) {
						$("#selectedCompanyCd").imuiSelect('replace', data.manageCompanyList);
						$("#agencyCd").imuiSelect('replace', data.manageAgencyList);
						// 外部機関判定
						if ($("#selectedCompanyCd").val()!='ZZZZ') {
							$("#agencyCd").prop('disabled', false);
						} else {
							$("#agencyCd").prop('disabled', true);
						}
					});
				});

				$("span .im-ui-icon-common-16-update").mouseover(function(e) {
					$(this).css("cursor","pointer");
				}).mouseleave(
					function(e) {
						$(this).css("cursor","default");
					}
				);

				// 画面表示時に定義される処理
				$(document).ready(function(){

//					// リサイズ時イベント
//					$(window).bind('resize', function(){
//						$('#mainList').setGridWidth($('#listTableArea').width(), true);
//					}).trigger('resize');

					// 下部ボタン押下時のイベント
					preButtonEvent = function (mode) {
						var dialogTitle = "";
						var dialogMessage = "";
						var url = "";
						var grid = null;
						var row = null;
						var id = null;
						var shatakuKbn = null;

						switch (mode) {
							// 契約情報出力
							case 0:
								dialogTitle = "確認";
								dialogMessage = "契約情報を出力します。よろしいですか？";
								url = "skf/Skf3010Sc001/contractDownLoad";
								nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", url, "ok", "キャンセル", this, true);
								break;
							// 新規（保有・区分）
							case 1:
								// 社宅区分に「保有」を指定
								$('#form2 [name=hdnRowShatakuKbn]').val("1");
								// 保有社宅登録画面
								url = "skf/Skf3010Sc002/init";
								nfw.common.submitForm("form2", url);
								break;
							// 新規（借上）
							case 2:
								// 社宅区分に「借上」を指定
								$('#form2 [name=hdnRowShatakuKbn]').val("2");
								// 借上社宅登録画面
								url = "skf/Skf3010Sc006/init";
								nfw.common.submitForm("form2", url);
								break;
							// 複写(借上)
							case 3:
								/** パラメータ設定 */
								// 選択行:社宅区分
								$('#form2 [name=hdnRowShatakuKbn]').val($("#hdnRowShatakuKbn").val());
								// 選択行:社宅管理番号
								$('#form2 [name=hdnRowShatakuKanriNo]').val($("#hdnRowShatakuKanriNo").val());
								// 選択行:社宅名
								$('#form2 [name=hdnRowShatakuName]').val($("#hdnRowShatakuName").val());
								// 選択行:地域区分
								$('#form2 [name=hdnRowAreaKbn]').val($("#hdnRowAreaKbn").val());
								// 選択行:空き部屋数
								$('#form2 [name=hdnRowEmptyRoomCount]').val($("#hdnRowEmptyRoomCount").val());
								// 選択行:空き駐車場数
								$('#form2 [name=hdnRowEmptyParkingCount]').val($("#hdnRowEmptyParkingCount").val());
								// 複写フラグ
								$('#form2 [name=copyFlg]').val("true");
								// 社宅一覧の借上(複写)ボタン処理
								url = "skf/Skf3010Sc001/rentalCopyCheck";
								nfw.common.submitForm("form2", url);
								break;
							// 新規(一棟)
							case 4:
								// 社宅区分に「一棟」を指定
								$('#form2 [name=hdnRowShatakuKbn]').val("4");
								// 保有社宅登録画面
								url = "skf/Skf3010Sc002/init";
								nfw.common.submitForm("form2", url);
								break;
							default:
								nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
								break;
						};
					}
				});
			})(jQuery);
		</script>
	</nfwui:Form>
	<br />
	<div class="align-R">
		<nfwui:Form id="form2" name="form2" >
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC001 %>" />
			<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc001/init?SKF3010_SC001&tokenCheck=0" />
			<!-- 検索キー  -->
			<!-- 検索キー：管理会社コード -->
			<input type = "hidden" name="hdnSelectedCompanyCd" id="hdnSelectedCompanyCd" value="${form.hdnSelectedCompanyCd}" />
			<!-- 検索キー：管理機関コード -->
			<input type = "hidden" name="hdnAgencyCd" id="hdnAgencyCd" value="${form.hdnAgencyCd}" />
			<!-- 検索キー：社宅区分コード -->
			<input type = "hidden" name="hdnShatakuKbnCd" id="hdnShatakuKbnCd" value="${form.hdnShatakuKbnCd}" />
			<!-- 検索キー：利用区分コード -->
			<input type = "hidden" name="hdnUseKbnCd" id="hdnUseKbnCd" value="${form.hdnUseKbnCd}" />
			<!-- 検索キー：空き部屋コード-->
			<input type = "hidden" name="hdnEmptyRoomCd" id="hdnEmptyRoomCd" value="${form.hdnEmptyRoomCd}" />
			<!-- 検索キー：空き駐車場コード -->
			<input type = "hidden" name="hdnEmptyParkingCd" id="hdnEmptyParkingCd" value="${form.hdnEmptyParkingCd}" />
			<!-- 検索キー：社宅名 -->
			<input type = "hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName}" />
			<!-- 検索キー：社宅住所 -->
			<input type = "hidden" name="hdnShatakuAddress" id="hdnShatakuAddress" value="${form.hdnShatakuAddress}" />
			<!-- 社宅リスト -->
			<input type = "hidden" name="listTableData" id="listTableData" value="${form.listTableData}" />
	
			<!-- 選択行 -->
			<!-- 選択行:社宅区分 -->
			<input type="hidden" name="hdnRowShatakuKbn" id="hdnRowShatakuKbn" value="" />
			<!-- 選択行:社宅管理番号 -->
			<input type="hidden" name="hdnRowShatakuKanriNo" id="hdnRowShatakuKanriNo" value="" />
			<!-- 選択行:社宅名 -->
			<input type="hidden" name="hdnRowShatakuName" id="hdnRowShatakuName" value="" />
			<!-- 選択行:地域区分 -->
			<input type="hidden" name="hdnRowAreaKbn" id="hdnRowAreaKbn" value="" />
			<!-- 選択行:空き部屋数 -->
			<input type="hidden" name="hdnRowEmptyRoomCount" id="hdnRowEmptyRoomCount" value="" />
			<!-- 選択行:空き駐車場数 -->
			<input type="hidden" name="hdnRowEmptyParkingCount" id="hdnRowEmptyParkingCount" value="" />
			<!-- 複写フラグ -->
			<input type="hidden" name="copyFlg" id="copyFlg" value="" />
			<imui:button id="excel" name="excel" value="契約情報出力" class="imui-medium-button" onclick="preButtonEvent(0)" tabindex="13" />
			<imui:button id="newRental" name="newRental" value="新規（借上）" class="imui-medium-button" onclick="preButtonEvent(2)" tabindex="14" />
			<imui:button id="copy" name="copy" value="複写（借上）" class="imui-medium-button" onclick="preButtonEvent(3)" tabindex="15" />
			<imui:button id="newItto" name="newItto" value="新規（一棟）" class="imui-medium-button" onclick="preButtonEvent(4)" tabindex="16" />
			<imui:button id="newHoyu" name="newHoyu" value="新規（保有・区分）" class="imui-medium-button" onclick="preButtonEvent(1)" tabindex="17" />
		</nfwui:Form>
	</div>
</div>
<!-- コンテンツエリア　ここまで -->