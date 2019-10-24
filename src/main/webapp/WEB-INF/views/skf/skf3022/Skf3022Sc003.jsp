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
<style type="text/css">
  .imui-box-warning, .imui-box-caution, .imui-box-success{
	min-width: 70%;
	position: absolute!important;
	z-index: 1;
	margin-left: 12%;
  }
/*   #imui-container { */
/*	 width:650px; */
/*	 min-width:650px; */
/*	 max-width: 1000px; */
/*   } */
</style>

<!-- コンテンツエリア -->
<nfwui:Form id="rateShienform" name="rateShienform" modelAttribute="form" >
	<div class="imui-form-container-wide">
		<div style="height:30px; bottom:10px">使用料計算情報を入力して、<font color="green">「設定する」</font>をクリックしてください。</div>
		<!-- 前画面からのパラメータ -->
		<input type="hidden" name="sc003HdnShatakuKanriNo" id="sc003HdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
		<input type="hidden" name="sc003HdnRoomKanriNo" id="sc003HdnRoomKanriNo" value="${form.hdnRoomKanriNo}" />
		<input type="hidden" name="sc003HdnShainNo" id="sc003HdnShainNo" value="${form.hdnShainNo}" />
		<input type="hidden" name="sc003HdnYakuinKbn" id="sc003HdnYakuinKbn" value="${form.hdnYakuinKbn}" />
		<input type="hidden" name="sc003HdnShatakuChintairyo" id="sc003HdnShatakuChintairyo" value="${form.hdnShatakuChintairyo}" />
		<input type="hidden" name="sc003HdnTeijiFlag" id="sc003HdnTeijiFlag" value="${form.hdnTeijiFlag}" />
		<input type="hidden" name="sc003HdnSyoruiKanriNo" id="sc003HdnSyoruiKanriNo" value="${form.hdnSyoruiKanriNo}" />
		<!-- 同期処理取得値 -->
		<input type="hidden" name="sc003HdnSeinengappi" id="sc003HdnSeinengappi" value="${form.hdnSeinengappi}" />
		<input type="hidden" name="sc003HdnBarnMensekiAdjust" id="sc003HdnBarnMensekiAdjust" value="${form.hdnBarnMensekiAdjust }" />
		<input type="hidden" name="sc003HdnBuildDate" id="sc003HdnBuildDate" value="${form.hdnBuildDate }" />
		<input type="hidden" name="sc003HdnStructureKbn" id="sc003HdnStructureKbn" value="${form.hdnStructureKbn }" />
		<input type="hidden" name="sc003HdnAreaKbn" id="sc003HdnAreaKbn" value="${form.hdnAreaKbn }" />
		<input type="hidden" name="sc003HdnRateShienTanka" id="sc003HdnRateShienTanka" value="${form.sc003HdnRateShienTanka }" />
		<input type="hidden" name="sc003HdnRateShienKeinen" id="sc003HdnRateShienKeinen" value="${form.sc003HdnRateShienKeinen }" />
		<input type="hidden" name="sc003HdnRateShienKeinenZankaRitsu" id="sc003HdnRateShienKeinenZankaRitsu" value="${form.sc003HdnRateShienKeinenZankaRitsu }" />
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- 社宅名 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblSc003ShatakuName" code="<%= MessageIdConstant.SKF3022_SC003_SHATAKU_NAME %>" />
					</th>
					<td  style="width: 20%;" colspan="2">
						<label id="sc003ShatakuName" name="sc003ShatakuName" >${form.sc003ShatakuName }</label>
					</td>
					<!-- 部屋番号 -->
					<th style="width: 15%;">
						<nfwui:LabelBox id="lblSc003RoomNo" code="<%= MessageIdConstant.SKF3022_SC003_ROOM_NO %>" />
					</th>
					<td  style="width: 25%;">
						<label id="sc003RoomNo" name="sc003RoomNo">${form.sc003RoomNo }</label>
					</td>
				</tr>
				<tr>
					<!-- 所在地 -->
					<th>
						<nfwui:LabelBox id="lblSc003Address" code="<%= MessageIdConstant.SKF3022_SC003_ADDRESS %>" />
					</th>
					<td colspan="2">
						<label id="sc003Address" name="sc003Address" >${form.sc003Address }</label>
					</td>
					<!-- 所在地区分 -->
					<th>
						<nfwui:LabelBox id="lblSc003AddressKbn" code="<%= MessageIdConstant.SKF3022_SC003_ADDRESS_KBN %>" />
					</th>
					<td  style="width: 25%;">
						<label id="sc003AddressKbn" name="sc003AddressKbn" >${form.sc003AddressKbn }</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- 規格 -->
					<th style="width: 25%;">
						<nfwui:LabelBox id="lblSc003Kikaku" code="<%= MessageIdConstant.SKF3022_SC003_KIKAKU %>" />
					</th>
					<td style="width: 15%;">
						<label id="sc003Kikaku" name="sc003Kikaku" >${form.sc003Kikaku }</label>
					</td>
					<!-- 規格ドロップダウン -->
					<td style="width: 15%;">
						<imui:select id="sc003KikakuSelect" name="sc003KikakuSelect" width="100"
						list="${form.sc003KikakuSelecteList}" class="${form.sc003KikakuSelecteErr}" tabindex="1" />
					</td>
					<td style="width: 25%;border:none;background-color:#ffffff;box-shadow:none;" />
				</tr>
				<tr>
					<!-- 用途 -->
					<th>
						<nfwui:LabelBox id="lblSc003Youto" code="<%= MessageIdConstant.SKF3022_SC003_YOUTO %>" />
					</th>
					<td>
						<label id="sc003Youto" name="sc003Youto" >${form.sc003Youto }</label>
					</td>
					<!-- 用途ドロップダウン -->
					<td >
						<imui:select id="sc003YoutoSelect" name="sc003YoutoSelect" width="100"
						list="${form.sc003YoutoSelectList}" class="${form.sc003YoutoSelectErr}" tabindex="2" />
					</td>
				</tr>
				<tr>
					<!-- 延べ面積 -->
					<th>
						<nfwui:LabelBox id="lblSc003NobeMenseki" code="<%= MessageIdConstant.SKF3022_SC003_NOBE_MENSEKI %>" />
					</th>
					<td>
						<label id="sc003NobeMenseki" name="sc003NobeMenseki" >${form.sc003NobeMenseki }</label>
					</td>
					<td>
						<!-- 延べ面積テキストボックス -->
						<imui:textbox id="sc003InputNobeMenseki" name="sc003InputNobeMenseki" style="width:100px; text-align:right;" maxlength="8"
						value="${form.sc003InputNobeMenseki}" placeholder="例　70.5" class="${form.sc003InputNobeMensekiErr}" tabindex="3"/>&nbsp;㎡
					</td>
				</tr>
				<tr>
					<!-- ③サンルーム -->
					<th>
						<nfwui:LabelBox id="lblSc003SunRoom" code="<%= MessageIdConstant.SKF3022_SC003_SUNROOM %>" />
					</th>
					<td>
						<label id="sc003SunRoom" name="sc003SunRoom" >${form.sc003SunRoom }</label>
					</td>
				</tr>
				<tr>
					<!-- ④階段 -->
					<th>
						<nfwui:LabelBox id="lblSc003Kaidan" code="<%= MessageIdConstant.SKF3022_SC003_KAIDAN %>" />
					</th>
					<td >
						<label id="sc003Kaidan" name="sc003Kaidan" >${form.sc003Kaidan }</label>
					</td>
				</tr>
				<tr>
					<!-- ⑤物置 -->
					<th>
						<nfwui:LabelBox id="lblSc003Monooki" code="<%= MessageIdConstant.SKF3022_SC003_MONOOKI %>" />
					</th>
					<td>
						<label id="sc003Monooki" name="sc003Monooki" >${form.sc003Monooki }</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- ⑥基準使用料算定上延べ面積 -->
					<th style="width: 25%;">
						<nfwui:LabelBox id="lblSc003KijunMenseki" code="<%= MessageIdConstant.SKF3022_SC003_KIJUN_MENSEKI %>" />
					</th>
					<td  style="width: 15%;" >
						<label id="sc003KijunMenseki1" name="sc003KijunMenseki1" >${form.sc003KijunMenseki1 }</label>
					</td>
					<td  style="width: 15%;">
						<label id="sc003KijunMenseki2" name="sc003KijunMenseki2" >${form.sc003KijunMenseki2 }</label>
					</td>
					<td  style="width: 25%;">
						<label id="sc003KijunMenseki3" name="sc003KijunMenseki3" >&nbsp;&nbsp;②－③－④</label>
					</td>
				</tr>	
				<tr>
					<!-- ⑦社宅使用料算定上延べ面積 -->
					<th>
						<nfwui:LabelBox id="lblSc003ShatakuMenseki" code="<%= MessageIdConstant.SKF3022_SC003_SHATAKU_MENSEKI %>" />
					</th>
					<td>
						<label id="sc003ShatakuMenseki1" name="sc003ShatakuMenseki1" >${form.sc003ShatakuMenseki1 }</label>
					</td>
					<td>
						<label id="sc003ShatakuMenseki2" name="sc003ShatakuMenseki2" >${form.sc003ShatakuMenseki2 }</label>
					</td>
					<td>
						<label id="sc003ShatakuMenseki3" name="sc003ShatakuMenseki3" > &nbsp;&nbsp;②＋⑤　※小数点以下切り捨て</label>
					</td>
				</tr>
				<tr>
					<!-- ⑧基準単価 -->
					<th>
						<nfwui:LabelBox id="lblSc003KijunTanka" code="<%= MessageIdConstant.SKF3022_SC003_KIJUN_TANKA %>" />
					</th>
					<td>
						<label id="sc003KijunTanka1" name="sc003KijunTanka1" >${form.sc003KijunTanka1 }</label>
					</td>
					<td>
						<label id="sc003KijunTanka2" name="sc003KijunTanka2" >${form.sc003KijunTanka2 }</label>
					</td>
					
				</tr>
				<tr>
					<!-- ⑨経年調整なし使用料 -->
					<th>
						<nfwui:LabelBox id="lblSc003KeinenChouseinashiShiyoryo" code="<%= MessageIdConstant.SKF3022_SC003_KEINEN_CHOUSEINASHI_SHIYORYO %>" />
					</th>
					<td>
						<label id="sc003KeinenChouseinashiShiyoryo1" name="sc003KeinenChouseinashiShiyoryo1" >${form.sc003KeinenChouseinashiShiyoryo1 }</label>
					</td>
					<td>
						<label id="sc003KeinenChouseinashiShiyoryo2" name="sc003KeinenChouseinashiShiyoryo2" >${form.sc003KeinenChouseinashiShiyoryo2 }</label>
					</td>
					<td>
						<label id="sc003KeinenChouseinashiShiyoryo3" name="sc003KeinenChouseinashiShiyoryo3" >&nbsp;&nbsp;⑦×⑧&nbsp;&nbsp;</label>
					</td>
				</tr>
				<tr>
					<!-- ⑩経年 -->
					<th>
						<nfwui:LabelBox id="lblSc003Keinen" code="<%= MessageIdConstant.SKF3022_SC003_KEINEN %>" />
					</th>
					<td>
						<label id="sc003Keinen" name="sc003Keinen" >${form.sc003Keinen }</label>
					</td>
				</tr>
				<tr>
					<!-- ⑪経年調整　残価率 -->
					<th>
						<nfwui:LabelBox id="lblSc003KeinenZankaritsu" code="<%= MessageIdConstant.SKF3022_SC003_KEINEN_ZANKARITSU %>" />
					</th>
					<td>
						<label id="sc003KeinenZankaritsu" name="sc003KeinenZankaritsu" >${form.sc003KeinenZankaritsu }</label>
					</td>
				</tr>	
			</tbody>
		</nfwui:Table>
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- ⑫使用料月額 -->
					<th style="width: 25%;">
						<nfwui:LabelBox id="lblSc003PatternShiyoryo" code="<%= MessageIdConstant.SKF3022_SC003_PATTERN_SHIYORYO %>" />
					</th>
					<td  style="width: 15%;" >
						<label id="sc003PatternShiyoryo1" name="sc003PatternShiyoryo1" >${form.sc003PatternShiyoryo1 }</label>
					</td>
					<td style="width: 15%;">
						<label id="sc003PatternShiyoryo2" name="sc003PatternShiyoryo2" >${form.sc003PatternShiyoryo2 }</label>
					</td>
					<td  style="width: 25%;">
						<label id="sc003PatternShiyoryo3" name="sc003PatternShiyoryo3" >
							&nbsp;&nbsp;⑨×⑪×単身者負担軽減率*<br />&nbsp;&nbsp;(*①が「単身」の場合のみ)
						</label>
					</td>
				</tr>
				<tr>
					<!-- ⑬年齢加算係数 -->
					<th>
						<nfwui:LabelBox id="lblSc003NenreikasanKeisu" code="<%= MessageIdConstant.SKF3022_SC003_NENREIKASAN_KEISU %>" />
					</th>
					<td style="border:none;background-color:#ffffff;box-shadow:none;" />
					<td>
						<label id="sc003NenreikasanKeisu" name="sc003NenreikasanKeisu" >${form.sc003NenreikasanKeisu }</label>
					</td>
				</tr>
				<tr>
					<!-- 社宅使用料月額 -->
					<th>
						<nfwui:LabelBox id="lblSc003ShatakuShiyoryo" code="<%= MessageIdConstant.SKF3022_SC003_SHATAKU_SHIYORYO %>" />
					</th>
					<td style="border:none;background-color:#ffffff;box-shadow:none;" />
					<td>
						<label id="sc003ShatakuShiyoryo2" name="sc003ShatakuShiyoryo2" >${form.sc003ShatakuShiyoryo2 }</label>
					</td>
					<td>
						<label id="sc003ShatakuShiyoryo3" name="sc003ShatakuShiyoryo3" >&nbsp;&nbsp;⑫×⑬　円未満切り捨て</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<br>
		<div class="align-R">
			<nfwui:PopupButton id="sc003Closebtn" value="画面を閉じる" cssStyle="width:100px;"
				 cssClass="imui-small-button" modalMode="true" use="cancel"  tabindex="4"/>
			<nfwui:PopupButton id="sc003SelectBtn" value="設定する" cssStyle="width:100px;"
				 cssClass="imui-small-button" modalMode="true" use="ok" preOnClick="if(!checkSc003()){return(false)};" tabindex="5" />
			<nfwui:PopupButton id="sc003SelectBtnDummy" value="設定する" cssStyle="display: none;"
				 cssClass="imui-small-button" modalMode="true" use="ok" preOnClick="if(!resultReturn()){return(false)};" />
		</div>
		<script type="text/javascript">
			(function($) {
				// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
				jQuery(document).on("focus click", "input,textarea", function() {
					$(this).select();
				});
				// 画面表示時に定義される処理
				$(document).ready(function(){
					// 延べ面積チェンジ
					$("#sc003InputNobeMenseki").bind('change', function() {
						// パラメータ作成
						var map = new Object();
						map['mapParam'] = createParam();
						nfw.common.doAjaxAction("skf/Skf3022Sc003/changeInputNobeMensekiAsync",map,true,function(data) {
							// 非同期処理戻り値設定
							setAsyncResult(data);
						});
					});

					// 用途ドロップダウンチェンジ
					$("#sc003YoutoSelect").bind('change', function() {
						// パラメータ作成
						var map = new Object();
						map['mapParam'] = createParam();
						nfw.common.doAjaxAction("skf/Skf3022Sc003/changeInputNobeMensekiAsync",map,true,function(data) {
							// 非同期処理戻り値設定
							setAsyncResult(data);
						});
					});
				});
			})(jQuery);

			// 非同期パラメータ作成
			function createParam() {
				var map = new Object();
				map['inputNobeMenseki'] = $("#sc003InputNobeMenseki").val();
				map['youtoSelect'] = $("#sc003YoutoSelect").val();
				map['sunRoom'] = $("#sc003SunRoom").text().trim();
				map['kaidan'] = $("#sc003Kaidan").text().trim();
				map['monooki'] = $("#sc003Monooki").text().trim();
				map['kijunTanka2'] = $("#sc003KijunTanka2").text().trim();
				map['kijunMenseki2'] = $("#sc003KijunMenseki2").text().trim();
				map['shatakuMenseki2'] = $("#sc003ShatakuMenseki2").text().trim();
				map['hdnShatakuChintairyo'] = $("#sc003HdnShatakuChintairyo").val().trim();
				map['hdnSeinengappi'] = $("#sc003HdnSeinengappi").val().trim();
				map['hdnBarnMensekiAdjust'] = $("#sc003HdnBarnMensekiAdjust").val().trim();
				map['hdnBuildDate'] = $("#sc003HdnBuildDate").val().trim();
				map['hdnStructureKbn'] = $("#sc003HdnStructureKbn").val().trim();
				map['hdnAreaKbn'] = $("#sc003HdnAreaKbn").val().trim();
				map['patternShiyoryo2'] = $("#sc003PatternShiyoryo2").text().trim();
				map['shatakuShiyoryo2'] = $("#sc003ShatakuShiyoryo2").text().trim();
				map['keinenChouseinashiShiyoryo2'] = $("#sc003KeinenChouseinashiShiyoryo2").text().trim();
				map['nenreikasanKeisu'] = $("#sc003NenreikasanKeisu").text().trim();
				map['hdnTeijiFlag'] = $("#sc003HdnTeijiFlag").val().trim();
				map['hdnSyoruiKanriNo'] = $("#sc003HdnSyoruiKanriNo").val().trim();
				return map;
			}

			// 非同期処理戻り値設定
			function setAsyncResult(data) {
				$("#sc003KijunMenseki2").text(data.kijunMenseki2);
				$("#sc003ShatakuMenseki2").text(data.shatakuMenseki2);
				$("#sc003KeinenChouseinashiShiyoryo2").text(data.keinenChouseinashiShiyoryo2);
				$("#sc003KijunTanka2").text(data.kijunTanka2);
				$("#sc003PatternShiyoryo2").text(data.patternShiyoryo2);
				$("#sc003NenreikasanKeisu").text(data.nenreikasanKeisu);
				$("#sc003ShatakuShiyoryo2").text(data.shatakuShiyoryo2);
				$("#sc003HdnRateShienTanka").val(data.sc003HdnRateShienTanka);
				$("#sc003HdnRateShienKeinen").val(data.sc003HdnRateShienKeinen);
				$("#sc003HdnRateShienKeinenZankaRitsu").val(data.sc003HdnRateShienKeinenZankaRitsu);
			}

			function checkSc003(){
				// エラークリア
				$("#sc003KikakuSelect").removeClass("nfw-validation-error");
				$("#sc003YoutoSelect").removeClass("nfw-validation-error");
				$("#sc003InputNobeMenseki").removeClass("nfw-validation-error");

				var errMsg = "";
				// 規格
				var kikaku = $('#sc003KikakuSelect').children("option:selected").text().trim();
				// 用途
				var youtoKbn = $('#sc003YoutoSelect').children("option:selected").text().trim();
				// 延べ面積
				var nobeMenseki = $("#sc003InputNobeMenseki").val().trim();
				/** 必須入力チェック */
				// 規格
				if (kikaku == null || kikaku == "") {
					errMsg = "規格を選択してください。\n";
					// 背景色設定
					$("#sc003KikakuSelect").addClass("nfw-validation-error");
				}
				// 用途
				if (youtoKbn == null || youtoKbn == "") {
					errMsg += "①用途を選択してください。\n";
					// 背景色設定
					$("#sc003YoutoSelect").addClass("nfw-validation-error");
				}
				// 延べ面積
				if (nobeMenseki == null || nobeMenseki == "") {
					errMsg += "②延べ面積が未入力です。\n";
					// 背景色設定
					$("#sc003InputNobeMenseki").addClass("nfw-validation-error");
//				} else if (!nobeMenseki.match(/^([1-9]\d*|0)(\.\d+)?$/g)) {	// 延べ面積形式チェック
				} else if (!nobeMenseki.match(/^([1-9]\d*|0)(\.\d+)?$/)) {	// 延べ面積形式チェック
					errMsg += "②延べ面積は数字半角か「.」で入力してください。\n";
					// 背景色設定
					$("#sc003InputNobeMenseki").addClass("nfw-validation-error");
				}
				// エラーチェック
				if (errMsg.length > 0) {
					nfw.common.showReserveMessage("warning", errMsg);
					return false;
				}
				// 本来延面積≠入力した延べ面積、且つ、本来規格＝入力した規格の場合確認メッセージを表示する
				var honraiMenseki = $("#sc003NobeMenseki").text().trim();	// 本来延べ面積
				var honraiKikaku = $("#sc003Kikaku").text().trim();			// 本来規格
				if (honraiMenseki != nobeMenseki && honraiKikaku == kikaku) {

					$("<div>延べ面積が変更されていますが、規格が変更されていません。よろしいですか？</div>").imuiMessageDialog({
						iconType : 'question',
						title : '確認',
						modal : true,
						buttons: [
							{
								'id': 'sc003Ok',
								'text': 'ok',
								'click': function() {
									$(this).imuiMessageDialog('close');
									// 親画面へ値を設定
									sc003SetResult();
									$("#sc003SelectBtnDummy").trigger("click");
									return true;
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
					sc003SetResult();
					return true;
				}
				return false;
			}

			// 親画面へ値を設定
			function sc003SetResult() {
				$("#hdnRateShienKikaku").val($('#sc003KikakuSelect').val().trim());
				$("#hdnRateShienKikakuName").val($('#sc003KikakuSelect').children("option:selected").text().trim());
				$("#hdnRateShienYoto").val($('#sc003YoutoSelect').val().trim());
				$("#hdnRateShienYotoName").val($('#sc003YoutoSelect').children("option:selected").text().trim());
				$("#hdnRateShienNobeMenseki").val($("#sc003InputNobeMenseki").val().trim());
				$("#hdnRateShienSunroomMenseki").val($("#sc003SunRoom").text().trim());
				$("#hdnRateShienKaidanMenseki").val($("#sc003Kaidan").text().trim());
				$("#hdnRateShienMonookiMenseki").val($("#sc003Monooki").text().trim());
				$("#hdnRateShienKijunMenseki").val($("#sc003KijunMenseki2").text().trim());
				$("#hdnRateShienShatakuMenseki").val($("#sc003ShatakuMenseki2").text().trim());
				$("#hdnRateShienTanka").val($("#sc003HdnRateShienTanka").val().trim());
				$("#hdnRateShienKeinen").val($("#sc003HdnRateShienKeinen").val().trim());
				$("#hdnRateShienKeinenZankaRitsu").val($("#sc003HdnRateShienKeinenZankaRitsu").val().trim());
				$("#hdnRateShienPatternGetsugaku").val($("#sc003PatternShiyoryo2").text().trim());
				$("#hdnRateShienShatakuGetsugaku").val($("#sc003ShatakuShiyoryo2").text().trim());
				$("#hdnRateShienKihonShiyoryo").val($("#sc003KijunTanka2").text().trim());
				$("#hdnRateShienPatternName").val($("#sc003Kikaku").text().trim() + " 　⇒　" + $('#sc003KikakuSelect').children("option:selected").text().trim());
			}
			
			function resultReturn() {
				return true;
			}
		</script>
	</div>
</nfwui:Form>