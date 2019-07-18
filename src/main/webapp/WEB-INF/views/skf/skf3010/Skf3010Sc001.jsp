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

<%-- コンテンツエリア --%>
<style type="text/css"></style>
<script type="text/javascript">
	function back1() {
		var url="skf/Skf1010Sc001/init?SKF1010_SC001&tokenCheck=0"
		nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
	}

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
</script>
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<div class="imui-form-container-wide"  style="width:95%;">
		<div class="imui-chapter-title"><h2>検索条件</h2></div>
		<nfwui:Form id="form" name="form" modelAttribute="form">
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC001 %>" />
			<nfwui:Table use="search">
				<tbody>
					<tr>
						<th style="width: 5%;">
							<!-- 管理会社 -->
							<nfwui:LabelBox id="lblManegeCompany" code="<%=MessageIdConstant.SKF3010_SC001_LBL_MANAGE_COMPANY %>" />
						</th>
						<td style="width: 7%;">
							<imui:select id="selectedCompanyCd" name="selectedCompanyCd" 
							width="185" list="${form.manageCompanyList}" tabindex="1" />
						</td>
						<th style="width: 5%;">
							<!-- 社宅区分 -->
							<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC001_LBL_SHATAKU_KBN %>" />
						</th>
						<td style="width: 5%;">
							<imui:select id="shatakuKbnCd" name="shatakuKbnCd" 
							width="128" list="${form.shatakuKbnList}" tabindex="3" />
						</td>
						<th style="width: 5%;">
							<!-- 空き部屋 -->
							<nfwui:LabelBox id="lblEmptyRoom" code="<%=MessageIdConstant.SKF3010_SC001_LBL_EMPTY_ROOM %>" />
						</th>
						<td style="width: 3%;">
							<imui:select id="emptyRoomCd" name="emptyRoomCd" 
							width="74" list="${form.emptyRoomList}" tabindex="5" />
						</td>
						<th style="width: 7%;">
							<!-- 社宅名 -->
							<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC001_LBL_SHATAKU_NAME %>" />
						</th>
						<td style="width: 10%;">
						    <imui:textbox id="shatakuName" name="shatakuName" style="width:260px;" value="${form.shatakuName}" placeholder="例　社宅名" tabindex="7" />
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
								width="185" list="${form.manageAgencyList}" tabindex="2" />
							</c:if>
							<c:if test="${form.agencyDispFlg == 'false'}">
								<imui:select id="agencyCd" name="agencyCd" 
								width="185" list="${form.manageAgencyList}" tabindex="2" disabled/>
							</c:if>
						</td>
						<th>
							<!-- 利用区分 -->
							<nfwui:LabelBox id="lblUseKbn" code="<%=MessageIdConstant.SKF3010_SC001_LBL_USE_KBN %>" />
						</th>
						<td>
							<imui:select id="useKbnCd" name="useKbnCd" 
							width="128" list="${form.useKbnList}" tabindex="4" />
						</td>
						<th style="white-space:nowrap">
							<!-- 空き駐車場 -->
							<nfwui:LabelBox id="lblEmptyParking" code="<%=MessageIdConstant.SKF3010_SC001_LBL_EMPTY_PARKING %>" />
						</th>
						<td>
							<imui:select id="emptyParkingCd" name="emptyParkingCd" 
							width="74" list="${form.emptyParkingList}" tabindex="6" />
						</td>
						<th style="white-space:nowrap">
							<!-- 社宅住所 -->
							<nfwui:LabelBox id="lblShatakuAddress" code="<%=MessageIdConstant.SKF3010_SC001_LBL_SHATAKU_ADDRESS %>" />
						</th>
						<td>
						    <imui:textbox id="shatakuAddress" name="shatakuAddress" style="width:260px;" value="${form.shatakuAddress}" placeholder="例　愛知県名古屋市中区錦2-18-19" tabindex="8" />
						</td>
					</tr>
				</tbody>
			</nfwui:Table>
		</nfwui:Form>
		<div class="align-L">	
			<nfwui:Button id="search" name="search" code="<%=MessageIdConstant.SKF3010_SC001_BTN_SEARCH %>" cssClass="imui-small-button" 
				url="skf/Skf3010Sc001/search" formId="form" tabindex="9" />
		</div>
		<script type="text/javascript">
			(function($){
				$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			})(jQuery);
		</script>
	</div>
	<!-- 明細＆細目未満 -->
	<div class="imui-form-container-wide"  style="width:95%;">
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
			
			<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc001/init"/>
			<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
			<script type="text/javascript">
				(function($){
					$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
				})(jQuery);
			</script>

			<imui:listTable id="mainList" process="jssp" autoEncode="true" autoWidth="true" rowNumbers="true"
				autoResize="true" onCellSelect="onCellSelect"
				multiSelect="false" data="${form.listTableData }"
				style="max-height: 800px" >
				<pager rowNum="${form.listTableMaxRowCount }" />
				<cols sortable="false">
					<col name="companyName" caption="管理会社" width="115" sortable="false" align="left" />
					<col name="agencyName" caption="管理機関" width="100" sortable="false" align="left" />
					<col name="shtakuKbn" caption="社宅区分" width="100" sortable="false" align="center" />
					<col name="useKbn" caption="利用区分" width="100" sortable="false" align="center" onCellAttr="onCellAttr" />
					<col name="shatakuName" caption="社宅名" width="175" sortable="false" align="left" />
					<col name="shatakuAddress" caption="社宅所在地" width="343" sortable="false" align="left" />
					<col name="structureKbn" caption="構造" width="50" sortable="false" align="center" />
					<col name="aging" caption="経年" width="50" sortable="false" align="center" />
					<col name="emptyRoomCount" caption="空き部屋数" width="125" sortable="false" align="right" />
					<col name="emptyParkingCount" caption="空き駐車場数" width="150" sortable="false" align="right" />
					<col name="col11" caption="基本" width="50" sortable="false" align="center" >
						<showIcon iconClass="im-ui-icon-common-16-update" align="center" />
					</col>
					<col name="col12" caption="部屋" width="50" sortable="false" align="center" >
						<showIcon iconClass="im-ui-icon-common-16-settings" />
					</col>
					<col name="hdnShatakuKbn" caption="対象行の社宅区分" hidden="true" />
					<col name="hdnShatakuKanriNo" caption="対象行の社宅管理番号" hidden="true" />
					<col name="hdnShatakuName" caption="対象行の社宅名" hidden="true" />
					<col name="hdnAreaKbn" caption="対象行の地域区分" hidden="true" />
					<col name="hdnEmptyRoomCount" caption="対象行の空き部屋数" hidden="true" />
					<col name="hdnEmptyParkingCount" caption="対象行の空き駐車場数" hidden="true" />
				</cols>
			</imui:listTable>

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
						$("#hdnRowShatakuKbn").val(row.hdnShatakuKbn);
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

 						// クリックアイコン判定
 				    	if ($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
 				    		/** 基本 */
 				    		// 社宅区分判定
 				    		if (shatakuKbn != "2") {
 				    			// 保有社宅登録画面へ
 	 				    		url = "skf/Skf3010Sc002/init"; 				    			
 				    		} else {
 				    			// 借上げ社宅登録画面へ
 				    			url = "skf/Skf3010Sc006/init";
 				    		}
 	 				    	$("#listTableForm").attr("action", url);
 		 				    $("#listTableForm").submit();
 				    	} else if ($(cellcontent).hasClass('im-ui-icon-common-16-settings')) {
 				    		/** 部屋 */
 				    		url = "skf/Skf3010Sc004/init";
 	 				    	$("#listTableForm").attr("action", url);
 		 				    $("#listTableForm").submit();
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
/**
// 検索キーをパラメータに設定
						    		// 管理会社選択値設定
									$('#form2 [name=hdnSelectedCompanyCd]').val($("#hdnSelectedCompanyCd").val());
						    		// 管理機関選択値設定
									$('#form2 [name=hdnAgencyCd]').val($("#hdnAgencyCd").val());
						    		// 社宅区分選択値設定
									$('#form2 [name=hdnShatakuKbn]').val($("#hdnShatakuKbn").val());
						    		// 利用区分選択値設定
									$('#form2 [name=hdnUseKbn]').val($("#hdnUseKbn").val());
						    		// 空き部屋選択値設定
									$('#form2 [name=hdnEmptyRoom]').val($("#hdnEmptyRoom").val());
						    		// 空き駐車場選択値設定
									$('#form2 [name=hdnEmptyParking]').val($("#hdnEmptyParking").val());
						    		// 社宅名設定
									$('#form2 [name=hdnShatakuName]').val($("#hdnShatakuName").val());
						    		// 社宅住所設定
									$('#form2 [name=hdnShatakuAddress]').val($("#hdnShatakuAddress").val());
*/
// 選択行をパラメータに追加
/**
									// <!-- 選択行:社宅区分 -->
									$('#form2 [name=hdnRowShatakuKbn]').val($("#hdnRowShatakuKbn").val());
									// <!-- 選択行:社宅管理番号 -->
									$('#form2 [name=hdnRowShatakuKanriNo]').val($("#hdnRowShatakuKanriNo").val());
									// <!-- 選択行:社宅名 -->
									$('#form2 [name=hdnRowShatakuName]').val($("#hdnRowShatakuName").val());
									// <!-- 選択行:地域区分 -->
									$('#form2 [name=hdnRowAreaKbn]').val($("#hdnRowAreaKbn").val());
									// <!-- 選択行:空き部屋数 -->
									$('#form2 [name=hdnRowEmptyRoomCount]').val($("#hdnRowEmptyRoomCount").val());
									// <!-- 選択行:空き駐車場数 -->
									$('#form2 [name=hdnRowEmptyParkingCount]').val($("#hdnRowEmptyParkingCount").val());
*/
									dialogTitle = "確認";
									dialogMessage = "契約情報を出力します。よろしいですか？";
						    		url = "skf/Skf3010Sc001/outContract";
							    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", url, "OK", "CANCEL", this, true);
									break;
						    	// 新規（保有・区分）
						    	case 1:
						    		// 社宅区分に「保有」を指定
									$('#form2 [name=hdnShatakuKbn]').val($("1").val());
						    		// 保有社宅登録画面
						    		url = "skf/Skf3010Sc002/init";
		 	 				    	$("#form2").attr("action", url);
		 		 				    $("#form2").submit();
									break;
						    	// 新規（借上）
						    	case 2:
						    		// 社宅区分に「借上」を指定
									$('#form2 [name=hdnShatakuKbn]').val($("2").val());
						    		// 保有社宅登録画面
						    		url = "skf/Skf3010Sc006/init";
		 	 				    	$("#form2").attr("action", url);
		 		 				    $("#form2").submit();
									break;
						    	// 複写(借上)
						    	case 3:					    	
							        // リストテーブル情報取得
							        grid = $("#mainList");
		//							var ids = grid.getGridParam("selarrrow"); // ←複数行
									// 行番号取得
									id = grid.getGridParam("selrow"); // ←1行
									// 選択行が無い場合
									if( id == null )
									{
										// nfw.common.showReserveMessage("warning", "<%= MessageIdConstant.W_SKF_3003 %>");
										nfw.common.showReserveMessage("warning", "複写元の借上社宅を選択してください。");
										break;
									}
									// 行データ取得
									row = grid.getRowData(id);
									// 社宅区分取得
									shatakuKbn = row.hdnShatakuKbn;
									
		 				    		// 社宅区分判定
		 				    		if (shatakuKbn != "2") {
										// nfw.common.showReserveMessage("warning", "<%= MessageIdConstant.W_SKF_3002 %>");
										nfw.common.showReserveMessage("warning", "社宅区分が「借上」ではないため複写できません。");
										break;
		 				    		}
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
						    		// 借上社宅登録画面
						    		url = "skf/Skf3010Sc006/init";
		 	 				    	$("#form2").attr("action", url);
		 		 				    $("#form2").submit();
									break;
								// 新規(一棟)
						    	case 4:
						    		// 社宅区分に「一棟」を指定
									$('#form2 [name=hdnShatakuKbn]').val($("4").val());
						    		// 保有社宅登録画面
						    		url = "skf/Skf3010Sc002/init";
		 	 				    	$("#form2").attr("action", url);
		 		 				    $("#form2").submit();
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
	</div>
	<br />
	<div class="align-R">
		<nfwui:Form id="form2" name="form2" >
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC001 %>" />
			<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc001/init"/>
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
            <imui:button id="csv" name="csv" value="契約情報出力" class="imui-medium-button" onclick="preButtonEvent(0)" tabindex="10" />
            <imui:button id="newRental" name="csv" value="新規（借上）" class="imui-medium-button" onclick="preButtonEvent(2)" tabindex="11" />
            <imui:button id="copy" name="csv" value="複写（借上）" class="imui-medium-button" onclick="preButtonEvent(3)" tabindex="12" />
            <imui:button id="newItto" name="csv" value="新規（一棟）" class="imui-medium-button" onclick="preButtonEvent(4)" tabindex="13" />
            <imui:button id="newHoyu" name="csv" value="新規（保有・区分）" class="imui-medium-button" onclick="preButtonEvent(1)" tabindex="14" />
		</nfwui:Form>
	</div>
</div>
	<!-- コンテンツエリア　ここまで -->