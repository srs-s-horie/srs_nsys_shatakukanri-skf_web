<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<%-- コンテンツエリア --%>
<script type="text/javascript">
	function back1() {
		var backMessage = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。";
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf2100Sc006/back", "OK", "キャンセル", this, true);	
	}
</script>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF2100_SC006 %>" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf2100Sc005/init?SKF2100_SC005&tokenCheck=0" />
		<!-- ** サーバー連携用 ** -->
		<input type="hidden" name="jsonLabelList" id="jsonLabelList" value="${form.jsonLabelList }"/>
		<!-- ** 貸出管理簿：パラメータ ** -->
		<input type="hidden" name="hdnRouterKanriId" id="hdnRouterKanriId" value="${form.hdnRouterKanriId}" />
		<input type="hidden" name="hdnYearMonth" id="hdnYearMonth" value="${form.hdnYearMonth}" />
		<input type="hidden" name="hdnApplStatus" id="hdnApplStatus" value="${form.hdnApplStatus }" />
		<input type="hidden" name="hdnContractKbn" id="hdnContractKbn" value="${form.hdnContractKbn }" />
		<input type="hidden" name="hdnOriginalCompanySelect" id="hdnOriginalCompanySelect" value="${form.hdnOriginalCompanySelect }" />
		<input type="hidden" name="hdnPayCompanySelect" id="hdnPayCompanySelect" value="${form.hdnPayCompanySelect }" />
		<!-- 社員名入力支援用 -->
		<input type="hidden" name="insertFormName" id="insertFormName" value="" />
		<input type="hidden" name="callbackFlag" id="callbackFlag" value="" />
		<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo}" />
		<input type="hidden" name="hdnShainName" id="hdnShainName" value="${form.hdnShainName}" />
		
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<td style="width: 1%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
					<!-- 社員番号-->
					<th style="width: 8%;">
						<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF2100_SC006_SHAIN_NO %>" />
					</th>
					<td style="width: 10%;">
						<label id="shainNo" name="shainNo">${f:h(form.shainNo) }</label>
					</td>
					<!-- 社員入力-->
					<td style="width: 7%;">
						<nfwui:PopupButton id="shainShien" name="shainShien" value="社員入力支援" use="popup"
							cssClass="imui-small-button" popupWidth="650" popupHeight="700"
							modalMode="true" screenUrl="skf/Skf2010Sc001/init"
							disabled="${form.shainShienDisableFlg }"
							preOnclick="setShainShienPreparation(0)"  tabindex="3"/> 
					</td>

					<td style="width: 2%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
					
					<!-- 対象年月 -->
					<th style="width: 7%;text-align:center;">
						<nfwui:LabelBox id="yearMonth" code="<%=MessageIdConstant.SKF2100_SC006_YEAR_MONTH %>" style="width:60px;text-align:center;"/>
					</th>
					<!-- 申請状況 -->
					<th style="width: 7%;text-align:center;white-space: nowrap;">
						<nfwui:LabelBox id="applStatus" code="<%=MessageIdConstant.SKF2100_SC006_APPL_STATUS %>" style="width:60px;text-align:center;"/>
					</th>
					<td style="width:20%;border:none;"></td>
				</tr>
				<tr>
				<td style="width: 1%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
					<!-- 社員氏名-->
					<th>
						<!-- <label style="width:60px;">社員氏名</label> -->
						<nfwui:LabelBox id="lblShainName" code="<%=MessageIdConstant.SKF2100_SC006_SHAIN_NAME %>" />
					</th>
					<td colspan="2" >
						<label id="shainName" name="shainName" style="width:150px;">${f:h(form.shainName) }</label>
					</td>
					<td style="width: 2%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
					
					<!-- 対象年月-->
					<td style="text-align:center;">
						<label id="yearMonthTxt" name="yearMonthTxt" style="text-align:center;">
							${form.yearMonthTxt }
						</label>
					</td>
					<!-- 申請状況-->
					<td style="text-align:center;">
						<label id="applStatusTxt" name="applStatusTxt" style="text-align:center;${form.applStatusTxtColor }">
							${form.applStatusTxt }
						</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div class="imui-form-container-wide" style="width: 95%;">
		<nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2100_SC006_TABLE_TITLE %>" titleLevel="2" />
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th rowspan="2" style="width: 15%;">
								<nfwui:LabelBox id="lblSc006ShiyoryoTsukigaku" code="<%=MessageIdConstant.SKF2100_SC006_LENDERS_INFO %>" />
							</th>
							<!-- 原籍会社 -->
							<th style="width: 15%;">
								<nfwui:LabelBox id="lblOriginalCompany" code="<%=MessageIdConstant.SKF2100_SC006_ORIGINAL_COMPANY %>" />
							</th>
							<td style="width: 20%;">
								<imui:select id="originalCompanySelect" name="originalCompanySelect" width="160" disabled="${form.editDisableFlg }"
								list="${form.originalCompanyList}" class="${form.originalCompanyListErr}" tabindex="4" />
							</td>
							<!-- 搬入 -->
							<th rowspan="5" style="width: 10%;">
								<nfwui:LabelBox id="lblSc006TaiyoTyusyajou" code="<%=MessageIdConstant.SKF2100_SC006_HANNYU %>" />
							</th>
							<!-- 貸出希望日 -->
							<th style="width: 15%;">
								<nfwui:LabelBox id="lblUseStartHopeDay" code="<%=MessageIdConstant.SKF2100_SC006_USE_START_HOPE_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="useStartHopeDay" name="useStartHopeDay" value="${f:h(form.useStartHopeDay)}"
								disabled="${form.editDisableFlg }" cssStyle="width:180px" cssClass="${form.useStartHopeDayErr }" tabindex="6"/>
							
							</td>
							<td style="width:38%;border:none;"></td>
						</tr>
						<tr>
							<!-- 給与支給会社 -->
							<th>
								<nfwui:LabelBox id="lblPayCompany" code="<%=MessageIdConstant.SKF2100_SC006_PAY_COMPANY %>" />
							</th>
							<td>
								<imui:select id="payCompanySelect" name="payCompanySelect" width="160" disabled="${form.editDisableFlg }"
								list="${form.payCompanyList}" class="${form.payCompanyListErr}" tabindex="5" />
							</td>
							<!-- 本人連絡先 -->
							<th style="width:15%;">
								<nfwui:LabelBox id="lblHannyuTel" code="<%=MessageIdConstant.SKF2100_SC006_HANNYU_TEL %>" />
							</th>
							<td style="width:30%;">
								<imui:textbox id="hannyuTel" name="hannyuTel" style="ime-mode: disabled;width:180px;" oninput="value = value.replace(/[^0-9-]+/i,'');"
									maxlength="13" value="${form.hannyuTel}" tabindex="7" disabled="${form.editDisableFlg }"
									class="${form.hannyuTelErr}" placeholder="例 090-0000-0000"/>
							</td>
						</tr>
						<tr>
							<!-- モバイルルーター情報 -->
							<th rowspan="8" style="width: 150px;">
								<nfwui:LabelBox id="lblRouterInfo" code="<%=MessageIdConstant.SKF2100_SC006_ROUTER_INFO %>" />
							</th>
							<!-- 通しNo -->
							<th style="width: 200px;">
								<nfwui:LabelBox id="lblRouterNo" code="<%=MessageIdConstant.SKF2100_SC006_ROUTER_NO %>" />
							</th>
							<td style="width: 200px;">
								<label id="routerNo" name="routerNo">${f:h(form.routerNo) }</label>
							</td>
							<!-- 本人メールアドレス -->
							<th style="width:15%;height:25px;">
								<nfwui:LabelBox id="lblMailAddress" code="<%=MessageIdConstant.SKF2100_SC006_HANNYU_MAILADDRESS %>" />
							</th>
							<td style="width:30%;">
								<label id="hannyuMailaddress" name="hannyuMailaddress">${f:h(form.hannyuMailaddress) }</label>
							</td>
						</tr>
						<tr>
							<!-- 電話番号 -->
							<th>
								<nfwui:LabelBox id="lblTel" code="<%=MessageIdConstant.SKF2100_SC006_TEL %>" />
							</th>
							<td>
								<label id="tel" name="tel">${f:h(form.tel) }</label>	
							</td>
							<!-- 発送日 -->
							<th style="width: 200px;">
								<nfwui:LabelBox id="lblShippingDate" code="<%=MessageIdConstant.SKF2100_SC006_SHIPPING_DATE %>" />
							</th>
							<td>
								<nfwui:DateBox id="shippingDate" name="shippingDate" value="${f:h(form.shippingDate)}"
								disabled="${form.editDisableFlg }" cssStyle="width:180px" cssClass="${form.shippingDateErr }" tabindex="9"/>
							</td>
						</tr>
						<tr>
							<!-- ICCID -->
							<th >
								<nfwui:LabelBox id="lblIccid" code="<%=MessageIdConstant.SKF2100_SC006_ICCID %>" />
							</th>
							<td>
								<label id="iccid" name="iccid">${f:h(form.iccid) }</label>	
							</td>
							<!-- 納品日 -->
							<th style="width: 200px;">
								<nfwui:LabelBox id="lblReceivedDate" code="<%=MessageIdConstant.SKF2100_SC006_RECEIVED_DATE %>" />
							</th>
							<td>
								<nfwui:DateBox id="receivedDate" name="receivedDate" value="${f:h(form.receivedDate)}"
								disabled="${form.editDisableFlg }" cssStyle="width:180px" cssClass="${form.receivedDateErr }" tabindex="10"/>
							</td>
						</tr>
						<tr>
							<!-- IMEI -->
							<th >
								<nfwui:LabelBox id="lblImei" code="<%=MessageIdConstant.SKF2100_SC006_IMEI %>" />
							</th>
							<td>
								<label id="imei" name="imei">${f:h(form.imei) }</label>	
							</td>
							<!-- 搬出 -->
							<th rowspan="3">
								<nfwui:LabelBox id="lblHansyutu" code="<%=MessageIdConstant.SKF2100_SC006_HANSYUTU %>" />
							</th>
							<!-- 利用停止日 -->
							<th>
								<nfwui:LabelBox id="lblUseStopDay" code="<%=MessageIdConstant.SKF2100_SC006_LAST_USE_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="useStopDay" name="useStopDay" value="${f:h(form.useStopDay)}"
								disabled="${form.editDisableFlg }" cssStyle="width:180px" cssClass="${form.useStopDayErr }" tabindex="11"/>

							</td>
						</tr>
						<tr>
							<!-- 入荷日 -->
							<th >
								<nfwui:LabelBox id="lblArrivalDate" code="<%=MessageIdConstant.SKF2100_SC006_ARRIVAL_DATE %>" />
							</th>
							<td>
								<label id="arrivalDate" name="arrivalDate">${f:h(form.arrivalDate) }</label>	
							</td>
							<!-- 本人連絡先 -->
							<th style="width:15%;">
								<nfwui:LabelBox id="lblHansyutuTel" code="<%=MessageIdConstant.SKF2100_SC006_HANSYUTU_TEL %>" />
							</th>
							<td style="width:30%;">
								<imui:textbox id="hansyutuTel" name="hansyutuTel" style="ime-mode: disabled;width:180px;" oninput="value = value.replace(/[^0-9-]+/i,'');"
									maxlength="13" value="${f:h(form.hansyutuTel)}" tabindex="12" disabled="${form.editDisableFlg }"
									class="${form.hansyutuTelErr}" placeholder="例 090-0000-0000"/>
							</td>
						</tr>
						<tr>
							<!--契約区分-->
							<th>
								<nfwui:LabelBox id="lblContractKbn" code="<%=MessageIdConstant.SKF2100_SC006_CONTRACT_KBN %>" />
							</th>
							<td>
								<label id="contractKbnTxt" name="contractKbnTxt">${form.contractKbnTxt }</label>
							</td>
							<!-- 窓口返却日 -->
							<th>
								<nfwui:LabelBox id="lblReturnDay" code="<%=MessageIdConstant.SKF2100_SC006_RETURN_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="returnDay" name="returnDay" value="${f:h(form.returnDay)}"
								disabled="${form.editDisableFlg }" cssStyle="width:180px" cssClass="${form.returnDayErr }" tabindex="13"/>
							</td>
						</tr>
						<tr>
							<!--契約終了日-->
							<th>
								<nfwui:LabelBox id="lblContractEndDate" code="<%=MessageIdConstant.SKF2100_SC006_CONTRACT_END_DATE %>" />
							</th>
							<td>
								<label id="contractEndDate" name="contractEndDate">${f:h(form.contractEndDate) }</label>
							</td>
							<!-- 備考 -->
							<th rowspan="2">
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF2100_SC006_BIKO %>" />
							</th>
							<td colspan="2" rowspan="2">
								<imui:textArea id="biko" name="biko" rows="3"  maxlength="1600"
									style="width:500px;" value="${f:h(form.biko)}" disabled="${form.editDisableFlg }" class="${form.bikoErr}" tabindex="14" />
							</td>
						</tr>
						<tr>
							<!-- 故障 -->
							<th>
								<nfwui:LabelBox id="lblFault" code="<%=MessageIdConstant.SKF2100_SC006_FAULT_FLAG %>" />
							</th>
							<td>
								<label id="faultTxt" name="faultTxt">${form.faultTxt }</label>
							</td>
						</tr>

					</tbody>
				</nfwui:Table>
		</div>
		<br />
		<div class="imui-form-container-wide" style="width: 98%;border:none;padding:0px;">
		<div class="align-L float-L">	
			<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="15" />
		</div>
		<div class="align-R">
			<nfwui:Button id="btnUnyonGuide" url="skf/Skf2100Sc006/OperationGuideDownload" value="運用ガイド" cssClass="imui-medium-button" 
			cssStyle="width: 150px" tabindex="16" disabled="${form.btnUnyonGuideDisableFlg }" />
			<imui:button id="btnTmpSave" value="登録" class="imui-medium-button" style="width: 150px" onclick="sc006PreButtonEvent(0)" 
			tabindex="17" disabled="${form.btnRegistDisableFlg }" />		</div>
		<div class="align-R">
			<imui:button id="btnKeizokuLogin" value="削除" class="imui-medium-button" style="width: 150px" onclick="sc006PreButtonEvent(3)" 
			tabindex="18" disabled="${form.btnDeleteDisableFlg }" />		</div>
		<br>
		</div>
		<script type="text/javascript">
			(function($) {
				// 画面表示時に定義される処理
				$(document).ready(function(){
					$(".imui-toolbar-icon").removeAttr("onclick");
					$(".imui-toolbar-icon").click(function(e) {
						back1();
					});

					// 運用ガイドダウンロード
					operationGuidDownLoad = function() {
						$('#downloadForm').submit();
					}

					// JSON可変ラベルリスト設定
					// 可変値ラベルをリスト形式にし、JSON文字列に変換後
					// formのhidden変数「jsonLabelList」に格納する
					sc006SetVariableLabelList = function() {
						// 可変ラベルリスト
						var labelArray = new Array();
						{
							// 可変ラベルリスト作成
							var labelMap = new Object();
							//　社員番号
							labelMap['shainNo'] = $("#shainNo").text().trim();
							//　社員名
							labelMap['shainName'] = $("#shainName").text().trim();
							labelArray.push(labelMap);
						}
						// 可変ラベルリストをJSON文字列に変換
						$('#jsonLabelList').val(JSON.stringify(labelArray));
					}

					
					
					// 社員入力支援クリック
					setShainShienPreparation = function(p) {
						// 種別判定
						if (p == 0) {
							// 社員番号入力支援
							$("#insertFormName").val("shainName");
							$("#callbackFlag").val("true");
						} 
					}
					
					// 下部ボタン押下時のイベント
					sc006PreButtonEvent = function (mode) {
						// 押下ボタン判定
						switch (mode) {
							case 0:
								// 登録
								// 現在状態バックアップ
								backUpStatus();
								//infomation.skf.i_skf_3027=すべてのタブの画面項目を登録します。よろしいですか？
								nfw.common.confirmPopup("すべての画面項目を登録します。よろしいですか？",
										"確認", "form", "skf/Skf2100Sc006/regist", "OK", "キャンセル", this, true);
								break;
							case 3:
								// 削除
								// 現在状態バックアップ
								backUpStatus();
								var mes = "モバイルルーター貸出管理簿データ（" +$("#shainName").text().trim() + "）を削除します。よろしいですか？";
								// 確認ダイアログ表示(infomation.skf.i_skf_3029=社宅管理台帳データ（{0}）を削除します。よろしいですか？)
								nfw.common.confirmPopup(mes,
										"確認", "form", "skf/Skf2100Sc006/delete", "OK", "キャンセル", this, true);
								break;
							default:
								nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
								break;
						};
					}


					// 現在状態バックアップ
					// 可変ラベル、備品リストテーブル、協議中フラグのバックアップを行う
					backUpStatus = function() {
						// 可変ラベルリスト作成
						sc006SetVariableLabelList();
					}


					// 社員入力支援コールバック
					shainInfoCallback = function() {
						// 社員番号
						$("#hdnShainNo").val($("#shainNo").val().trim());
						$("#shainNo").text($("#shainNo").val().trim());
						$("#hdnShainName").val($("#shainName").val());
						$("#shainName").val($("#shainName").val());
						$("#callbackFlag").val("false");
						// 現在状態バックアップ
						backUpStatus();
						url = "skf/Skf2100Sc006/ShainSupportCallBack";
						nfw.common.submitForm("form", url);
					}
					

					// 会社ドロップダウンチェンジ
					$("#originalCompanySelect").bind('change', function() {
						// エラークリア
						$("#originalCompanySelect").removeClass("nfw-validation-error");
					});

					// 会社ドロップダウンチェンジ
					$("#payCompanySelect").bind('change', function() {
						// エラークリア
						$("#payCompanySelect").removeClass("nfw-validation-error");
					});


					// 貸出希望日チェンジ
					$("#useStartHopeDay").bind('change', function() {
						// エラークリア
						$("#useStartHopeDay").removeClass("nfw-validation-error");
					});

					// 本人連絡先チェンジ
					$("#hannyuTel").bind('change', function() {
						// エラークリア
						$("#hannyuTel").removeClass("nfw-validation-error");
					});

					// 本人メールアドレスチェンジ
					$("#hannyuMailaddress").bind('change', function() {
						// エラークリア
						$("#hannyuMailaddress").removeClass("nfw-validation-error");
					});

					// 発送日チェンジ
					$("#shippingDate").bind('change', function() {
						// エラークリア
						$("#shippingDate").removeClass("nfw-validation-error");
					});

					// 納品日チェンジ
					$("#receivedDate").bind('change', function() {
						// エラークリア
						$("#receivedDate").removeClass("nfw-validation-error");
					});

					// 利用停止日チェンジ
					$("#useStopDay").bind('change', function() {
						// エラークリア
						$("#useStopDay").removeClass("nfw-validation-error");
					});
					
					// 本人連絡先チェンジ
					$("#hansyutuTel").bind('change', function() {
						// エラークリア
						$("#hansyutuTel").removeClass("nfw-validation-error");
					});
					
					// 窓口返却日チェンジ
					$("#returnDay").bind('change', function() {
						// エラークリア
						$("#returnDay").removeClass("nfw-validation-error");
					});
					
					// 備考チェンジ
					$("#biko").bind('change', function() {
						// エラークリア
						$("#biko").removeClass("nfw-validation-error");
					});


				});
			})(jQuery);
		</script>
	</nfwui:Form>
	<form id="downloadForm" action="tenant/maintenance/storage/file_download" method="post">
		<input name="path" type="hidden" value="${form.operationGuidePath }" />
		<input name="imui-theme-builder-module" type="hidden" value="notheme" />
	</form>
</div>
<!-- コンテンツエリア　ここまで -->