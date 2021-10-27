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
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf2100Sc008/back", "OK", "キャンセル", this, true);	
	}
</script>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF2100_SC008 %>" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf2100Sc007/init?SKF2100_SC007&tokenCheck=0" />
		<!-- ** サーバー連携用 ** -->
		<input type="hidden" name="hdnContractKbn" id="hdnContractKbn" value="${form.hdnContractKbn }" />
		<input type="hidden" name="hdnFaultFlag" id="hdnFaultFlag" value="${form.hdnFaultFlag }" />
		<input type="hidden" name="hdnLendingJudgment" id="hdnLendingJudgment" value="${form.hdnLendingJudgment }" />
		<input type="hidden" name="newDataFlag" id="newDataFlag" value="${form.newDataFlag }" />
		<input type="hidden" id="hdnChkFaultSelect" name="hdnChkFaultSelect" value="${form.hdnChkFaultSelect}" />
		<!-- 補足ファイル -->
		<input type="hidden" name="fileNo" id="fileNo"/>
		<input type="hidden" name="hosokuType" id="hosokuType"/>
		<input type="hidden" name="hdnHosoku" id="sendHosokuType"/>
		<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo"/>
		<div class="imui-form-container-wide"  >
		<nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2100_SC008_LABEL_TITLE %>" titleLevel="2" />
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th rowspan="8">
								<nfwui:LabelBox id="lblRouterInfo" code="<%=MessageIdConstant.SKF2100_SC008_ROUTER_INFO %>" />
							</th>
							<!-- 通しNo -->
							<th colspan="1" style="width: 10%;">
								<nfwui:LabelBox id="lblRouterNo" code="<%=MessageIdConstant.SKF2100_SC008_ROUTER_NO %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="routerNo" name="routerNo" style="ime-mode: disabled;" oninput="value = value.replace(/[^0-9]+/i,'');"
									maxlength="10" value="${f:h(form.routerNo)}" tabindex="3" disabled="${form.editDisableFlg }"
									class="${form.routerNoErr}" placeholder="例　1"/>
							</td>
						</tr>
						<tr>
							<!-- 電話番号 -->
							<th style="width:15%;">
								<nfwui:LabelBox id="lblTel" code="<%=MessageIdConstant.SKF2100_SC008_TEL %>" />
							</th>
							<td colspan="2" >
								<imui:textbox id="tel" name="tel" style="ime-mode: disabled;" oninput="value = value.replace(/[^0-9-]+/i,'');"
									maxlength="13" value="${f:h(form.tel)}" tabindex="4" 
									class="${form.telErr}" placeholder="例　090-0000-0000"/>
							</td>
						</tr>
						<tr>
							<!-- ICCID -->
							<th >
								<nfwui:LabelBox id="lblIccid" code="<%=MessageIdConstant.SKF2100_SC008_ICCID %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="iccid" name="iccid" style="ime-mode: disabled;"
									maxlength="20" value="${f:h(form.iccid)}" tabindex="5" 
									class="${form.iccidErr}" placeholder=""/>
							</td>
						</tr>
						<tr>
							<!-- IMEI -->
							<th >
								<nfwui:LabelBox id="lblImei" code="<%=MessageIdConstant.SKF2100_SC008_IMEI %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="imei" name="imei" style="ime-mode: disabled;"
									maxlength="15" value="${f:h(form.imei)}" tabindex="6" 
									class="${form.imeiErr}" placeholder=""/>
							</td>
						</tr>
						<tr>
							<!-- SSID A -->
							<th >
								<nfwui:LabelBox id="lblSsidA" code="<%=MessageIdConstant.SKF2100_SC008_SSID_A %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="ssidA" name="ssidA" style="ime-mode: disabled;"
									maxlength="32" value="${f:h(form.ssidA)}" tabindex="7" 
									class="${form.ssidAErr}" placeholder=""/>
							</td>
						</tr>
						<tr>
							<!-- WPA Key -->
							<th >
								<nfwui:LabelBox id="lblWpaKey" code="<%=MessageIdConstant.SKF2100_SC008_WPA_KEY %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="wpaKey" name="wpaKey" style="ime-mode: disabled;"
									maxlength="64" value="${f:h(form.wpaKey)}" tabindex="8" 
									class="${form.wpaKeyErr}" placeholder=""/>
							</td>
						</tr>
						<tr>
							<!-- 入荷日 -->
							<th >
								<nfwui:LabelBox id="lblArrivalDate" code="<%=MessageIdConstant.SKF2100_SC008_ARRIVAL_DATE %>" />
							</th>
							<td colspan="2">
								<nfwui:DateBox id="arrivalDate" name="arrivalDate" value="${f:h(form.arrivalDate)}"
								 cssStyle="width:95%" cssClass="${form.arrivalDateErr }" tabindex="9"/>
								
							</td>
						</tr>
						<tr>
							<!-- 故障 -->
							<th>
								<nfwui:LabelBox id="lblFault" code="<%=MessageIdConstant.SKF2100_SC008_FAULT_FLAG %>" />
							</th>
							<td colspan="2">
								&nbsp;<imui:checkbox id="faultFlag" name="faultFlag" value="1" 
									checked="${form.hdnChkFaultSelect }" tabindex="10"/>
							</td>
						</tr>
						<tr>
							<th rowspan="3">
								<nfwui:LabelBox id="lblRouterInfo" code="<%=MessageIdConstant.SKF2100_SC008_CONTRACT_INFO %>" />
							</th>
							<!--契約区分-->
							<th>
								<nfwui:LabelBox id="lblContractKbn" code="<%=MessageIdConstant.SKF2100_SC006_CONTRACT_KBN %>" />
							</th>
							<td colspan="2">
								<imui:select id="contractKbnSelect" name="contractKbnSelect" width="150px" list="${form.contractKbnDropDownList}" 
								 tabindex="11" cssClass="${form.contractKbnSelectErr }"/>
							</td>
						</tr>
						<tr>
							<!--契約開始日-->
							<th>
								<nfwui:LabelBox id="lblContractStartDate" code="<%=MessageIdConstant.SKF2100_SC008_CONTRACT_START_DATE %>" />
							</th>
							<td colspan="2">
								<nfwui:DateBox id="contractStartDate" name="contractStartDate" value="${f:h(form.contractStartDate)}"
								 cssStyle="width:95%" cssClass="${form.contractStartDateErr }" tabindex="12"/>
							</td>
						</tr>
						<tr>
							<!--契約終了日-->
							<th>
								<nfwui:LabelBox id="lblContractEndDate" code="<%=MessageIdConstant.SKF2100_SC008_CONTRACT_END_DATE %>" />
							</th>
							<td colspan="2">
								<nfwui:DateBox id="contractEndDate" name="contractEndDate" value="${f:h(form.contractEndDate)}"
								 cssStyle="width:95%" cssClass="${form.contractEndDateErr }" tabindex="13"/>
							</td>
						</tr>
						<tr>
							<th colspan="2" rowspan="3">
								<nfwui:LabelBox id="lblContractEndDate" code="<%=MessageIdConstant.SKF2100_SC008_HOSOKU %>" />
							</th>
							<td colspan="1" style="width: 35%;">
								<a id="${form.hosokuLink1 }" tabindex="14">${f:h(form.hosokuFileName1) }</a>
							</td>
							<td colspan="1">
								<!-- 参照 -->
								<imui:button id="impHosoku1" name="impHosoku1" value="参照" class="imui-small-button" tabindex="16" onclick="fileSelect('1')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBox1" name="tmpFileBox1" />
								<!-- 削除 -->
								<imui:button id="delHosoku1" name="delHosoku1" value="削除" class="imui-small-button" tabindex="17" onclick="fileDelete('1')"/>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="width: 35%;">
								<a id="${form.hosokuLink2 }" tabindex="18">${f:h(form.hosokuFileName2) }</a>
							</td>
							<td colspan="1">
								<!-- 参照 -->
								<imui:button id="impHosoku2" name="impHosoku2" value="参照" class="imui-small-button" tabindex="19" onclick="fileSelect('2')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBox2" name="tmpFileBox2" />
								<!-- 削除 -->
								<imui:button id="delHosoku2" name="delHosoku2" value="削除" class="imui-small-button" tabindex="20" onclick="fileDelete('2')"/>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="width: 35%;">
								<a id="${form.hosokuLink3 }" tabindex="21">${f:h(form.hosokuFileName3) }</a>
							</td>
							<td colspan="1">
								<!-- 参照 -->
								<imui:button id="impHosoku3" name="impHosoku3" value="参照" class="imui-small-button" tabindex="22" onclick="fileSelect('3')"/>
								<nfwui:FileBox cssStyle="display: none;" id="tmpFileBox3" name="tmpFileBox3" />
								<!-- 削除 -->
								<imui:button id="delHosoku3" name="delHosoku3" value="削除" class="imui-small-button" tabindex="23" onclick="fileDelete('3')"/>
							</td>
						</tr>
						<tr>
							<!-- 備考 -->
							<th colspan="2">
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF2100_SC008_BIKO %>" />
							</th>
							<td colspan="2">
								<imui:textArea id="biko" name="biko" rows="4"  maxlength="400"
									style="width:50%;" value="${f:h(form.biko)}" class="${form.bikoErr}" tabindex="24" />
							</td>
						</tr>


					</tbody>
				</nfwui:Table>
		</div>
		<br />
		<div class="align-L float-L">	
			<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="25" />
		</div>
		<div class="align-R">
			<imui:button id="btnTmpSave" value="登録" class="imui-medium-button" style="width: 150px" onclick="sc006PreButtonEvent(0)" 
			tabindex="26" disabled="${form.btnRegistDisableFlg }" />	
			<imui:button id="btnKeizokuLogin" value="削除" class="imui-medium-button" style="width: 150px" onclick="sc006PreButtonEvent(3)" 
			tabindex="27" disabled="${form.btnDeleteDisableFlg }" />		</div>
		<br>
		<script type="text/javascript">
			(function($) {
				// 画面表示時に定義される処理
				$(document).ready(function(){
					$(".imui-toolbar-icon").removeAttr("onclick");
					$(".imui-toolbar-icon").click(function(e) {
						back1();
					});
					
					
					$('#faultFlag').bind('click', function(){
						if(this.checked){
							// チェックされている
							$("#hdnChkFaultSelect").val("true");
						} else {
							// チェックされていない
							$("#hdnChkFaultSelect").val(null);
						}
					});
					// 下部ボタン押下時のイベント
					sc006PreButtonEvent = function (mode) {
						var element = document.getElementById( "faultFlag" ) ;
						
						if ( element.checked ) {
							// チェックされている
							$("#hdnChkFaultSelect").val("true");
						} else {
							// チェックされていない
							$("#hdnChkFaultSelect").val(null);
						}
						// 押下ボタン判定
						switch (mode) {
							case 0:
								// 登録
								//infomation.skf.i_skf_3053
								nfw.common.confirmPopup("編集した内容で登録します。よろしいですか？",
										"確認", "form", "skf/Skf2100Sc008/regist", "OK", "キャンセル", this, true);
								break;
							case 3:
								// 削除
								//I-SKF-3005
								var mes = "削除します。よろしいですか？";
								// 確認ダイアログ表示
								nfw.common.confirmPopup(mes,
										"確認", "form", "skf/Skf2100Sc008/delete", "OK", "キャンセル", this, true);
								break;
							default:
								nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
								break;
						};
					}
					
					/** クリックイベント */
					//補足資料参照ボタンクリック
					fileSelect = function(no) {
						
						var fileboxId = '#tmpFileBox' + no;
						//FileBoxを疑似的にクリック
						$(fileboxId).trigger("click");
						
						if($(fileboxId).val() != ""){
							//ファイル番号設定
							$("#fileNo").val(no);

							formId= "form";
							url = "skf/Skf2100Sc008/attachedFileAdd";
							nfw.common.submitForm(formId, url);
						}
						
					}
					//補足資料削除ボタンクリック
					fileDelete = function(no) {
						
							//ファイル番号設定
							$("#fileNo").val(no);
							
							var dialogTitle = "確認";
							//MessageIdConstant.：I-SKF-3005
							var dialogMessage = "削除します。よろしいですか？";
							nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf2100Sc008/attachedFileDelete", "OK", "キャンセル", this, true);
						
					}
					
					//添付ファイルリンククリック時
					$("a[id^='attached_']").click(function(){
						downloadHosokuFile(this);
					});
					
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
				
				//添付ファイルリンククリック時
				downloadHosokuFile = function(data) {
					//リンクタグのidから補足種別と添付ファイル番号を取得
					var id = $(data).attr("id");
					var url = "skf/Skf2100Sc008/AttachedFileDownload";
					var list = id.split('_');
					var hosokuType = list[1];
					var fileNo = list[2];
					
					$("#sendAttachedNo").val(fileNo);
					

					formId= "form";
					url = "skf/Skf2100Sc008/AttachedFileDownload";
					nfw.common.submitForm(formId, url);
					
				}
			})(jQuery);
		</script>
	</nfwui:Form>
</div>
<!-- コンテンツエリア　ここまで -->