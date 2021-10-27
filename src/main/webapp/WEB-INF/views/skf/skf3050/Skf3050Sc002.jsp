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

<%-- コンテンツエリア --%>
<script src="scripts/skf/skfCommon.js"></script>
	<script type="text/javascript">
		/**
		* 一つ前の画面へ戻る
		*/
		function back1() {
			showConfirm(W_GFK_0002, function() {
				history.back()
			});
		}

		/**
		* メニュー画面へ遷移する。
		*/
		function back() {
			showConfirm(W_GFK_0007, function() {
				$.StandardPost("../common/top.html");
			});
		}
	</script>
	<!-- 明細＆細目未満 -->
	<div class="imui-form-container-wide">
	<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">
		<!-- hidden項目 -->
		<input type="hidden" id="hdnBtnKariKeisanDisabled" name="hdnBtnKariKeisanDisabled" value="${form.hdnBtnKariKeisanDisabled}" />
		<input type="hidden" id="hdnBtnShimeShoriDisabled" name="hdnBtnShimeShoriDisabled" value="${form.hdnBtnShimeShoriDisabled}" />
		<input type="hidden" id="hdnBtnRenkeiDataSakuseiDisabled" name="hdnBtnRenkeiDataSakuseiDisabled" value="${form.hdnBtnRenkeiDataSakuseiDisabled}" />
		<input type="hidden" id="hdnBtnShimeKaijoDisabled" name="hdnBtnShimeKaijoDisabled" value="${form.hdnBtnShimeKaijoDisabled}" />
		<input type="hidden" id="hdnBtnRenkeiDataKakuteiDisabled" name="hdnBtnRenkeiDataKakuteiDisabled" value="${form.hdnBtnRenkeiDataKakuteiDisabled}" />
		<input type="hidden" id="hdnSelectedTaisyonendo" name="hdnSelectedTaisyonendo" value="${form.hdnSelectedTaisyonendo}" />
		<input type="hidden" id="hdnJikkouShijiYoteiNengetsu" name="hdnJikkouShijiYoteiNengetsu" value="${form.hdnJikkouShijiYoteiNengetsu}" />
		<input type="hidden" id="hdnJikkouShijiYoteiShoriCol" name="hdnJikkouShijiYoteiShoriCol" value="${form.hdnJikkouShijiYoteiShoriCol}" />
		<input type="hidden" id="hdnJikkouShijiYoteiShoriIdx" name="hdnJikkouShijiYoteiShoriIdx" value="${form.hdnJikkouShijiYoteiShoriIdx}" />
		<input type="hidden" id="hdnKariKeisanBtnMsg" name="hdnKariKeisanBtnMsg" value="${form.hdnKariKeisanBtnMsg}" />
		<input type="hidden" id="hdnShimeShoriBtnMsg" name="hdnShimeShoriBtnMsg" value="${form.hdnShimeShoriBtnMsg}" />
		<input type="hidden" id="hdnRenkeiDataSakuseiBtnMsg" name="hdnRenkeiDataSakuseiBtnMsg" value="${form.hdnRenkeiDataSakuseiBtnMsg}" />
		<input type="hidden" id="hdnShimeKaijoBtnMsg" name="hdnShimeKaijoBtnMsg" value="${form.hdnShimeKaijoBtnMsg}" />
		<input type="hidden" id="hdnRenkeiDataKakuteiBtnMsg" name="hdnRenkeiDataKakuteiBtnMsg" value="${form.hdnRenkeiDataKakuteiBtnMsg}" />
		<input type="hidden" id="hdnBihinTaiyoWarnContinueFlg" name="hdnBihinTaiyoWarnContinueFlg" value="${form.hdnBihinTaiyoWarnContinueFlg}" />
		<input type="hidden" id="hdnBihinHenkyakuWarnContinueFlg" name="hdnBihinHenkyakuWarnContinueFlg" value="${form.hdnBihinHenkyakuWarnContinueFlg}" />
		<input type="hidden" id="hdnWarnMsg" name="hdnWarnMsg" value="${form.hdnWarnMsg}" />
		<input type="hidden" id="hdnBtnRouterShimeShoriDisabled" name="hdnBtnRouterShimeShoriDisabled" value="${form.hdnBtnRouterShimeShoriDisabled}" />
		<input type="hidden" id="hdnBtnRouterShimeKaijoDisabled" name="hdnBtnRouterShimeKaijoDisabled" value="${form.hdnBtnRouterShimeKaijoDisabled}" />
		<input type="hidden" id="hdnRouterShimeShoriBtnMsg" name="hdnRouterShimeShoriBtnMsg" value="${form.hdnRouterShimeShoriBtnMsg}" />
		<input type="hidden" id="hdnRouterShimeKaijoBtnMsg" name="hdnRouterShimeKaijoBtnMsg" value="${form.hdnRouterShimeKaijoBtnMsg}" />
		<input type="hidden" id="hdnJikkouShijiYoteiRouterShoriCol" name="hdnJikkouShijiYoteiRouterShoriCol" value="${form.hdnJikkouShijiYoteiRouterShoriCol}" />
		
		<table class="imui-form-search-condition">
			<tbody>
				<tr>
					<th>
						<label style="width:80px;">対象年度</label>
					</th>
					<td>
						<imui:select id="taishonendoDropdown" name="taishonendoDropdown" width="120" list="${form.dropDownList}" tabindex="3" />
					</td>
					<td style="width:100%;border:none;"></td>
				</tr>
			</tbody>
		</table>
		<!-- 明細部 -->
			<div class="imui-chapter-title" ><h2>月次処理状況</h2></div>
			<script type="text/javascript">
			  (function($){
			    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			  })(jQuery);
			</script>
			<imui:listTable id="grvGetsujiShoriSts" process="jssp" autoEncode="false" autoWidth="false"
			autoResize="true" height="100%" style="word-wrap:break-word;" data="${form.getujiGrid }" >
				<cols sortable="false">
				<col name="col1" caption="年月" width="160" sortable="false" align="center" />
				<col name="col2" caption="社宅締め処理" width="160" sortable="false" align="center" />
				<col name="col2_2" caption="モバイルルーター締め処理" width="160" sortable="false" align="center" />
				<col name="col3" caption="給与連携データ作成" width="160" sortable="false" align="center" />
				<col name="col4" hidden="true"/>
				<showIcon iconClass="im-ui-icon-common-16-update" />
				</cols>
			</imui:listTable>
		<br>
	</nfwui:Form>
	<nfwui:Form id="batchForm" name="batchForm" modelAttribute="form" enctype="multipart/form-data">
		<input type="hidden" id="hdnJikkouShijiYoteiNengetsu" name="hdnJikkouShijiYoteiNengetsu" value="${batchForm.hdnJikkouShijiYoteiNengetsu}" />
		<input type="hidden" id="hdnBihinTaiyoWarnContinueFlg" name="hdnBihinTaiyoWarnContinueFlg" value="${batchForm.hdnBihinTaiyoWarnContinueFlg}" />
		<input type="hidden" id="hdnBihinHenkyakuWarnContinueFlg" name="asyncUserId" value="${batchForm.hdnBihinHenkyakuWarnContinueFlg}" />
		<input type="hidden" id="taskMsgId" name="taskMsgId" value="${batchForm.taskMsgId}" />
	
		<div class="align-R">
			<input id="kariKeisanBtn" name="kariKeisanBtn" style="width:150px;" type="button" value="仮計算処理" class="imui-medium-button" tabindex="4"/>
			<imui:button id="closeTaskExecution" name="closeTaskExecution" style="width:150px;" value="社宅締め処理" class="imui-medium-button" tabindex="5" />
			<imui:button id="routerCloseTaskExecution" name="routerCloseTaskExecution" style="width:220px;" value="モバイルルーター締め処理" class="imui-medium-button" tabindex="7"/>
			<input id="positiveCoopDataSakuseiBtn" name="positiveCoopDataSakuseiBtn" type="button" style="width:200px;" value="給与連携データ作成処理" class="imui-medium-button" tabindex="9"/>
		</div>

		<div class="align-R">
			<imui:button id="closeCanselTaskExecution" name="closeCanselTaskExecution"  style="width:150px;" value="社宅締め解除処理" class="imui-medium-button" tabindex="6" />
			<imui:button id="routerCloseCanselTaskExecution" name="routerCloseCanselTaskExecution"  style="width:220px;" value="モバイルルーター締め解除処理" class="imui-medium-button" tabindex="8"/>
			<imui:button id="confirmPositiveCooperationTaskExecution" name="confirmPositiveCooperationTaskExecution" style="width:200px;" value="給与連携データ確定処理" class="imui-medium-button" tabindex="10"/>
		</div>
	</nfwui:Form>
</div>

<script type="text/javascript">
(function($) {
	$(document).ready(function() {

		const KARIKEISAN_BTN = 'kariKeisanBtn';
		const SHIME_SHORI_BTN = 'closeTaskExecution';
		const POSITIVE_DATA_CREATE_BTN = 'positiveCoopDataSakuseiBtn';
		const SHIME_KAIJO_SHORI_BTN = 'closeCanselTaskExecution';
		const POSITIVE_DATA_CONFIRM_BTN = 'confirmPositiveCooperationTaskExecution';
		const DISABLED_COLOR = '#aaaaaa';
		const NORMAL_COLOR = '#333333';
		const HILIGHT_COLOR = '#87cefa';
		const ROUTER_SHIME_SHORI_BTN = 'routerCloseTaskExecution';
		const ROUTER_SHIME_KAIJO_SHORI_BTN = 'routerCloseCanselTaskExecution';

		/*
		* 「仮計算処理」ボタン押下時
		*/
		$("#" + KARIKEISAN_BTN).click(function() {
			var dialogTitle = "確認";
			var dialogMessage = $("#hdnKariKeisanBtnMsg").val();
			var url = "skf/Skf3050Sc002/provCalc";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
		});

		/*
		* 「締め処理」ボタン押下時
		*/
		$("#" + SHIME_SHORI_BTN).click(function() {
			var dialogTitle = "確認";
			var dialogMessage = $("#hdnShimeShoriBtnMsg").val();
			var url = "skf/Skf3050Sc002/closeTaskExecution";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
		});
		
		/*
		* 「モバイルルーター締め処理」ボタン押下時
		*/
		$("#" + ROUTER_SHIME_SHORI_BTN).click(function() {
			var dialogTitle = "確認";
			var dialogMessage = $("#hdnRouterShimeShoriBtnMsg").val();
			var url = "skf/Skf3050Sc002/routerCloseTaskExecution";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
		});

		/*
		 * 「給与連携データ作成処理」ボタン押下時
		 */
		$("#" + POSITIVE_DATA_CREATE_BTN).click(function(){
			// 警告文表示を削除
			hideResultMessage();
			var dialogTitle = "確認";
			var dialogMessage = $("#hdnRenkeiDataSakuseiBtnMsg").val();
			skf.common.confirmPopupForCallback(dialogMessage, "確認", "batchForm", "OK", "キャンセル", this, function() {
				var paramMap = new Object();
				paramMap['hdnJikkouShijiYoteiNengetsu'] = $("#hdnJikkouShijiYoteiNengetsu").val();
				paramMap['hdnBihinTaiyoWarnContinueFlg'] = '';
				paramMap['hdnBihinHenkyakuWarnContinueFlg'] = '';

				nfw.common.doAjaxAction("skf/Skf3050Sc002/createPositiveCooperationDataAsync", paramMap, true, function(data) {
					// ボタン活性/非活性
					$("#hdnBtnKariKeisanDisabled").val(true);
					$("#hdnBtnShimeShoriDisabled").val(true);
					$("#hdnBtnRenkeiDataSakuseiDisabled").val(false);
					$("#hdnBtnShimeKaijoDisabled").val(false);
					$("#hdnBtnRenkeiDataKakuteiDisabled").val(false);
					$("#hdnBtnRouterShimeShoriDisabled").val(true);
					$("#hdnBtnRouterShimeKaijoDisabled").val(false);
					// 「給与連携データ作成を「実行済」に設定
					var getsujiGrid = $("#grvGetsujiShoriSts");
					var gridDatas = getsujiGrid.getGridParam('data');
					var tagetCol = $("#hdnJikkouShijiYoteiShoriCol").val();
					var tagetIdx = Number($("#hdnJikkouShijiYoteiShoriIdx").val());
					getsujiGrid.setCell(gridDatas[tagetIdx].id, tagetCol, '実行済', { background: HILIGHT_COLOR });
					// 描画
					initDisplay();

					// データ作成処理
					url = "skf/Skf3050Sc002/createPositiveCooperationData";
					nfw.common.submitForm("form", url);
				});
			});
		});

		/*
		* 「締め解除処理」ボタン押下時
		*/
		$("#" + SHIME_KAIJO_SHORI_BTN).click(function() {
			var dialogMessage = $("#hdnShimeKaijoBtnMsg").val();
			var url = "skf/Skf3050Sc002/closeCancelTaskExecution";
			nfw.common.confirmPopup(dialogMessage, "確認", "form", url, "OK", "キャンセル", this, true);
		});
		
		/*
		* 「締め解除処理」ボタン押下時
		*/
		$("#" + ROUTER_SHIME_KAIJO_SHORI_BTN).click(function() {
			var dialogMessage = $("#hdnRouterShimeKaijoBtnMsg").val();
			var url = "skf/Skf3050Sc002/routerCloseCancelTaskExecution";
			nfw.common.confirmPopup(dialogMessage, "確認", "form", url, "OK", "キャンセル", this, true);
		});

		/*
		* 「給与連携データ確定処理」ボタン押下時
		*/
		$("#" + POSITIVE_DATA_CONFIRM_BTN).click(function() {
			var dialogMessage = $("#hdnRenkeiDataKakuteiBtnMsg").val();
			var url = "skf/Skf3050Sc002/confirmPositiveCooperationTaskExecution";
			nfw.common.confirmPopup(dialogMessage, "確認", "form", url, "OK", "キャンセル", this, true);
		});

		/*
		 * 「対象年度」ドロップダウン変更
		 */
		$("#taishonendoDropdown").bind('change', function() {
			var selectVal = $("#taishonendoDropdown").val();
			$("#hdnSelectedTaisyonendo").val(selectVal);
			
			
			nfw.common.submitForm("form", "skf/Skf3050Sc002/changeDropDown");
		});

		/*
		 * メッセージ用の処理実行年月を取得する。
		 */
		getJikkoNengetsuForMsg = function() {
			var tagetNengetsu = $("#hdnJikkouShijiYoteiNengetsu").val();
			var year = tagetNengetsu.substr(0, 4);
			var month = Number(tagetNengetsu.substr(4));
			var rtnNengetsu = year + '年' + month + '月';
			
			return rtnNengetsu;
		}

		/*
		 * 画面のボタンの活性状態を設定
		 */
		setBtnStatus = function() {
			var kariKeisanDisabled = cnvBoolean($("#hdnBtnKariKeisanDisabled").val());
			$("#" + KARIKEISAN_BTN).attr("disabled", kariKeisanDisabled);
			if (kariKeisanDisabled) {
				$("#" + KARIKEISAN_BTN).css("color", DISABLED_COLOR);
			}

			var shimeShoriDisabled = cnvBoolean($("#hdnBtnShimeShoriDisabled").val());
			$("#" + SHIME_SHORI_BTN).attr("disabled", shimeShoriDisabled);
			if (shimeShoriDisabled) {
				$("#" + SHIME_SHORI_BTN).css("color", DISABLED_COLOR);
			}

			var renkeiDataSakuseiDisabled = cnvBoolean($("#hdnBtnRenkeiDataSakuseiDisabled").val());
			$("#" + POSITIVE_DATA_CREATE_BTN).attr("disabled", renkeiDataSakuseiDisabled);
			if (renkeiDataSakuseiDisabled) {
				$("#" + POSITIVE_DATA_CREATE_BTN).css("color", DISABLED_COLOR);
			}

			var shimeKaijoDisabled = cnvBoolean($("#hdnBtnShimeKaijoDisabled").val());
			$("#" + SHIME_KAIJO_SHORI_BTN).attr("disabled", shimeKaijoDisabled);
			if (shimeKaijoDisabled) {
				$("#" + SHIME_KAIJO_SHORI_BTN).css("color", DISABLED_COLOR);
			}

			var renkeiDataKakuteiDisabled = cnvBoolean($("#hdnBtnRenkeiDataKakuteiDisabled").val());
			$("#" + POSITIVE_DATA_CONFIRM_BTN).attr("disabled", renkeiDataKakuteiDisabled);
			if (renkeiDataKakuteiDisabled) {
				$("#" + POSITIVE_DATA_CONFIRM_BTN).css("color", DISABLED_COLOR);
			}
			
			var routerShimeShoriDisabled = cnvBoolean($("#hdnBtnRouterShimeShoriDisabled").val());
			$("#" + ROUTER_SHIME_SHORI_BTN).attr("disabled", routerShimeShoriDisabled);
			if (routerShimeShoriDisabled) {
				$("#" + ROUTER_SHIME_SHORI_BTN).css("color", DISABLED_COLOR);
			}
			
			var routerShimeKaijoDisabled = cnvBoolean($("#hdnBtnRouterShimeKaijoDisabled").val());
			$("#" + ROUTER_SHIME_KAIJO_SHORI_BTN).attr("disabled", routerShimeKaijoDisabled);
			if (routerShimeKaijoDisabled) {
				$("#" + ROUTER_SHIME_KAIJO_SHORI_BTN).css("color", DISABLED_COLOR);
			}
		}

		/*
		 * ボタンの文字色を初期化する。
		 */
		initBtnColor = function() {
			$("#" + KARIKEISAN_BTN).css("color", NORMAL_COLOR);
			$("#" + SHIME_SHORI_BTN).css("color", NORMAL_COLOR);
			$("#" + POSITIVE_DATA_CREATE_BTN).css("color", NORMAL_COLOR);
			$("#" + SHIME_KAIJO_SHORI_BTN).css("color", NORMAL_COLOR);
			$("#" + POSITIVE_DATA_CONFIRM_BTN).css("color", NORMAL_COLOR);
			$("#" + ROUTER_SHIME_SHORI_BTN).css("color", NORMAL_COLOR);
			$("#" + ROUTER_SHIME_KAIJO_SHORI_BTN).css("color", NORMAL_COLOR);
		}

		/*
		 * 月次グリッドビューの実行指示予定箇所の協調表示設定(背景色変更)
		 */
		setGetsujiGridHilight = function() {
			var getsujiGrid = $("#grvGetsujiShoriSts");
			var gridDatas = getsujiGrid.getGridParam('data');
			var tagetCol = $("#hdnJikkouShijiYoteiShoriCol").val();
			var tagetIdx = Number($("#hdnJikkouShijiYoteiShoriIdx").val());
			if(tagetCol != ''){
				getsujiGrid.setCell(gridDatas[tagetIdx].id, tagetCol, '', { background: HILIGHT_COLOR });
			}
			// モバイルルーター
			var tagetColR = $("#hdnJikkouShijiYoteiRouterShoriCol").val();
			if(tagetColR != ''){
				getsujiGrid.setCell(gridDatas[tagetIdx].id, tagetColR, '', { background: HILIGHT_COLOR });
			}
			
			
		}

		/*
		 * boolean変換
		 */
		cnvBoolean = function(targetVal) {
			var result = typeof(targetVal);
			
			if (result === 'string') {
				if (targetVal === 'true') {
					return true;
				} else {
					return false;
				}
			
			} else if (result === 'boolean') {
				return targetVal;
				 
			} else {
				return false;
			}
		}

		/*
		 * 処理結果メッセージ非表示
		 */
		hideResultMessage = function() {
			// 警告文表示を削除
			$(".imui-box-caution, .imui-box-warning").hide();
			$(".imui-box-caution, .imui-box-error").hide();
			$(".imui-box-caution, .imui-box-success").hide();
		}

		/*
		 * 画面初期表示処理
		 */
		initDisplay = function() {

			var selectTaisyonendo = $("#hdnSelectedTaisyonendo").val();
			$("#taishonendoDropdown").val(selectTaisyonendo);
			
			initBtnColor();
			setBtnStatus();
			setGetsujiGridHilight();
		}
		
		initDisplay();

		// 警告メッセージ判定
		if ($("#hdnWarnMsg").val().trim().length > 0) {
			// 警告文表示を削除
			hideResultMessage();
			var dialogMessage = $("#hdnWarnMsg").val();
			var url = "skf/Skf3050Sc002/closeTaskExecution";

			$("<div>" + dialogMessage + "</div>").imuiMessageDialog({
				iconType : 'question',
				title : '確認',
				modal : true,
				buttons: [
					{
						'id': 'closeTaskOK',
						'text': 'OK',
						'click': function() {
							$(this).imuiMessageDialog('close');
							nfw.common.submitForm("form", url);
						}
					},
					{
						'text': 'キャンセル',
						'click': function() {
							$(this).imuiMessageDialog('close');
							$("#hdnWarnMsg").val("");
							$("#hdnBihinTaiyoWarnContinueFlg").val("");
							$("#hdnBihinHenkyakuWarnContinueFlg").val("");
						}
					}
				]
			});
		};
	});
})(jQuery);
</script>
<!-- コンテンツエリア　ここまで -->