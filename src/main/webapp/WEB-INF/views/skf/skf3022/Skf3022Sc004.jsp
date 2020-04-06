<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<script src="scripts/skf/skfCommon.js"></script>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>
<script type="text/javascript">
function onChangeJigetu() {
		
		if(($("#txtStkTyoseiPayJigetuDisable").val() == "1" &&
				$("#txtCojinChangePayJigetuDisable").val() == "1" &&
				$("#txtParkingChangePayJigetuDisable").val() == "1")){
			// 活性
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").prop("disabled",false);		
			$("#txtStkTyoseiPayJigetuDisable").val("0");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").prop("disabled",false);		
			$("#txtCojinChangePayJigetuDisable").val("0");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").prop("disabled",false);		
			$("#txtParkingChangePayJigetuDisable").val("0");
			$('input[id=Skf3022Sc004_popup_jigetu]').prop("checked",true);
		}else{
			// 非活性
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").prop("disabled",true);		
			$("#txtStkTyoseiPayJigetuDisable").val("1");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").prop("disabled",true);		
			$("#txtCojinChangePayJigetuDisable").val("1");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").prop("disabled",true);		
			$("#txtParkingChangePayJigetuDisable").val("1");
			$('input[id=Skf3022Sc004_popup_jigetu]').prop("checked",false);
		}
	}

function onChangeJijigetu() {
	if(($("#txtStkTyoseiPayJijigetuDisable").val() == "1" &&
			$("#txtCojinChangePayJijigetuDisable").val() == "1" &&
			$("#txtParkingChangePayJijigetuDisable").val() == "1")){
		// 活性
		$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").removeClass("wj-state-disabled");
		$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").prop("disabled",false);		
		$("#txtStkTyoseiPayJijigetuDisable").val("0");
		$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").removeClass("wj-state-disabled");
		$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").prop("disabled",false);		
		$("#txtCojinChangePayJijigetuDisable").val("0");
		$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").removeClass("wj-state-disabled");
		$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").prop("disabled",false);		
		$("#txtParkingChangePayJijigetuDisable").val("0");
		$('input[id=Skf3022Sc004_popup_jijigetu]').prop("checked",true);
	}else{
		// 非活性
		$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").add("wj-state-disabled");
		$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").prop("disabled",true);		
		$("#txtStkTyoseiPayJijigetuDisable").val("1");
		$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").add("wj-state-disabled");
		$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").prop("disabled",true);
		$("#txtCojinChangePayJijigetuDisable").val("1");
		$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").add("wj-state-disabled");
		$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").prop("disabled",true);	
		$("#txtParkingChangePayJijigetuDisable").val("1");
		$('input[id=Skf3022Sc004_popup_jijigetu]').prop("checked",false);
	}
}

(function($) {
    
	// 画面表示時に定義される処理
	$(document).ready(function(){

		// フォーカスを合わせる
		document.getElementById('Skf3022Sc004_popup_txtStkTyoseiPayJigetuDiv').focus();
		
		// ボタン押下時のイベント
		preButtonEvent = function (mode) {
			var dialogTitle = "";
			var dialogMessage = "";
			var url = "";
			var grid = null;
			var row = null;
			var id = null;

			switch (mode) {
			// 登録
			case 0:
				// 社宅管理IDがNULLなら
				if("1" == $("#hdnRegistMessage").val()){
					dialogMessage = "提示データの登録内容をもとに次月予約として、社宅管理台帳データを登録します。よろしいですか？";
				}
				// 提示NoがNULLなら
				if("2" == $("#hdnRegistMessage").val()){
					dialogMessage = "入退居情報の登録内容をもとに次月予約として、社宅管理台帳データを登録します。よろしいですか？";
				}
				
				/*
				if("true" == $("#txtStkTyoseiPayJigetuDisable").val()){
					$("#txtStkTyoseiPayJigetuDisable").val(false);
				}
				alert($("#txtStkTyoseiPayJigetuDisable").val());
				alert($("#txtCojinChangePayJigetuDisable").val());
				alert($("#txtParkingChangePayJigetuDisable").val());
				alert($("#txtStkTyoseiPayJijigetuDisable").val());
				alert($("#txtCojinChangePayJijigetuDisable").val());
				alert($("#txtParkingChangePayJijigetuDisable").val());
				*/
				
				skf.common.confirmPopupForCallback(dialogMessage, "確認", "form", "OK", "キャンセル", this, function(){
					nfw.common.modalPopupWithPreHandler('skf/Skf3022Sc004/registe', 'Skf3022Sc004_popup_form', 'Skf3022Sc004_popup_Sc004regist');
					nfw.common.modalPopupClose($('#Skf3022Sc004_popup_closeBtn'));
				});
				break;
			
			// 閉じる
			case 1:
				skf.common.confirmPopupForCallback("画面を閉じます。よろしいですか？",
						"確認", "form", "ok", "キャンセル", this, function(){
					nfw.common.modalPopupClose($('#Skf3022Sc004_popup_closeBtn'));
				});
				break;
			default:
				nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
				break;
			};
			//return false;
		}
	});

})(jQuery);
</script>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
<div style="width:100%;" >
	<div class="imui-form-container-wide">
		<div style="height:30px; bottom:10px">次月予約情報を入力して、<font color="green">「登録」</font>をクリックしてください。</div>

		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3022_SC004 %>" />

		<!-- 前画面からのパラメータ -->
		<input type="hidden" name="hdnJigetuYoyakuTeijiNo" id="hdnJigetuYoyakuTeijiNo" value="${form.hdnJigetuYoyakuTeijiNo}" />
		<input type="hidden" name="hdnJigetuYoyakuYearMonth" id="hdnJigetuYoyakuYearMonth" value="${form.hdnJigetuYoyakuYearMonth}" />
		<input type="hidden" name="hdnJigetuYoyakuShatakuKanriId" id="hdnJigetuYoyakuShatakuKanriId" value="${form.hdnJigetuYoyakuShatakuKanriId}" />
		<input type="hidden" name="hdnJigetuYoyakuRental" id="hdnJigetuYoyakuRental" value="${form.hdnJigetuYoyakuRental}" />
		<input type="hidden" name="hdnJigetuYoyakuKyoekihiPerson" id="hdnJigetuYoyakuKyoekihiPerson" value="${form.hdnJigetuYoyakuKyoekihiPerson}" />
		<input type="hidden" name="hdnJigetuYoyakuParkingRentalOne" id="hdnJigetuYoyakuParkingRentalOne" value="${form.hdnJigetuYoyakuParkingRentalOne}" />
		<input type="hidden" name="hdnJigetuYoyakuParkingRentalTwo" id="hdnJigetuYoyakuParkingRentalTwo" value="${form.hdnJigetuYoyakuParkingRentalTwo}" />

		<!-- 登録用の保持パラメータ -->
		<input type="hidden" name="hdnJigetu" id="hdnJigetu" value="${form.hdnJigetu}" />
		<input type="hidden" name="hdnJijigetu" id="hdnJijigetu" value="${form.hdnJijigetu}" />

		<!-- チェックボックス用のパラメータ -->
		<input type="hidden" name="txtStkTyoseiPayJigetuDisable" id="txtStkTyoseiPayJigetuDisable" value="${form.txtStkTyoseiPayJigetuDisable}" />
		<input type="hidden" name="txtCojinChangePayJigetuDisable" id="txtCojinChangePayJigetuDisable" value="${form.txtCojinChangePayJigetuDisable}" />
		<input type="hidden" name="txtParkingChangePayJigetuDisable" id="txtParkingChangePayJigetuDisable" value="${form.txtParkingChangePayJigetuDisable}" />

		<input type="hidden" name="txtStkTyoseiPayJijigetuDisable" id="txtStkTyoseiPayJijigetuDisable" value="${form.txtStkTyoseiPayJijigetuDisable}" />
		<input type="hidden" name="txtCojinChangePayJijigetuDisable" id="txtCojinChangePayJijigetuDisable" value="${form.txtCojinChangePayJijigetuDisable}" />
		<input type="hidden" name="txtParkingChangePayJijigetuDisable" id="txtParkingChangePayJijigetuDisable" value="${form.txtParkingChangePayJijigetuDisable}" />

		<!-- 登録ボタンのメッセージ -->
		<input type="hidden" name="hdnRegistMessage" id="hdnRegistMessage" value="${form.hdnRegistMessage}" />

		<!-- 社員情報 -->
		<div class="imui-chapter-title"><h2>次月予約情報</h2></div>
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 35%;">
					</th>
					<td align="center">
						 <nfwui:CheckBoxGroupTag id="jigetu">                              	
	                      	<nfwui:CheckBox id="jigetu" name="jigetu" value="1" label="次月" tabindex="301" onclick="onChangeJigetu();"/>
	 					 </nfwui:CheckBoxGroupTag>
					</td>
					<td align="center">
						 <nfwui:CheckBoxGroupTag id="jijigetu">                              	
	                       	<nfwui:CheckBox id="jijigetu" name="jijigetu" value="1" label="次々月" tabindex="302" onclick="onChangeJijigetu();"/>
	 					 </nfwui:CheckBoxGroupTag>
					</td>
				</tr>
				<tr>
					<!-- 社宅使用料月額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblShatakuPay" code="<%=MessageIdConstant.SKF3022_SC004_SHATAKU_PAY %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px; height:21px;" >
						<label>${form.shatakuPayJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px; height:21px;" >
						<label>${form.shatakuPayJijigetu}<label>&nbsp;円
					</td>
				</tr>
				<tr>
					<!-- 社宅使用料調整金額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblStkTyoseiPay" code="<%=MessageIdConstant.SKF3022_SC004_STK_TYOSEI_PAY %>" />
					</th>
					<td align="right">
						<nfwui:NumberBox id="txtStkTyoseiPayJigetu" name="txtStkTyoseiPayJigetu" max="999999" min="-99999"
							cssClass="${form.txtStkTyoseiPayJigetuErr}" cssStyle="width: 100px;"
							maxlength="7" value="${form.txtStkTyoseiPayJigetu}"  
							tabindex="303" />円
					</td>
					<td align="right">
						<nfwui:NumberBox id="txtStkTyoseiPayJijigetu" name="txtStkTyoseiPayJijigetu" max="999999" min="-99999"
							cssClass="${form.txtStkTyoseiPayJijigetuErr}" cssStyle="width: 100px;"
							maxlength="7" value="${form.txtStkTyoseiPayJijigetu}"  
							tabindex="304" />円
					</td>
				</tr>
				<tr>
					<!-- 社宅使用料月額（調整後） -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblStkFinalPay" code="<%=MessageIdConstant.SKF3022_SC004_STK_FINAL_PAY %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.stkFinalPayJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.stkFinalPayJijigetu}<label>&nbsp;円
					</td>
				</tr>
				<tr>
					<!-- 空行 -->
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<!-- 個人負担共益費月額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblCojinPay" code="<%=MessageIdConstant.SKF3022_SC004_COJIN_PAY %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.cojinPayJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.cojinPayJijigetu}<label>&nbsp;円
					</td>
				</tr>
				<tr>
					<!-- 個人負担共益費調整金額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblCojinChangePay" code="<%=MessageIdConstant.SKF3022_SC004_COJIN_CHANGE_PAY %>" />
					</th>
					<td align="right" >
						<nfwui:NumberBox id="txtCojinChangePayJigetu" name="txtCojinChangePayJigetu" max="999999" min="-99999"
							cssClass="${form.txtCojinChangePayJigetuErr}" cssStyle="width: 100px;"
							maxlength="7" value="${form.txtCojinChangePayJigetu}"  
							tabindex="305" />円
					</td>
					<td align="right">
						<nfwui:NumberBox id="txtCojinChangePayJijigetu" name="txtCojinChangePayJijigetu" max="999999" min="-99999"
							cssClass="${form.txtCojinChangePayJijigetuErr}" cssStyle="width: 100px;"
							maxlength="7" value="${form.txtCojinChangePayJijigetu}"  
							tabindex="306" />円
					</td>
				</tr>
				<tr>
					<!-- 個人負担共益費月額（調整後） -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblCojinFinalPay" code="<%=MessageIdConstant.SKF3022_SC004_COJIN_FINAL_PAY %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.cojinFinalPayJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.cojinFinalPayJijigetu}<label>&nbsp;円
					</td>
				</tr>
				<tr>
					<!-- 空行 -->
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<!-- 区画1:駐車場使用料月額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblParkingPayOne" code="<%=MessageIdConstant.SKF3022_SC004_PARKING_PAY_ONE %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.parkingPayOneJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.parkingPayOneJijigetu}<label>&nbsp;円
					</td>
				</tr>
				<tr>
					<!-- 区画2:駐車場使用料月額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblParkingPayTwo" code="<%=MessageIdConstant.SKF3022_SC004_PARKING_PAY_TWO %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.parkingPayTwoJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.parkingPayTwoJijigetu}<label>&nbsp;円
					</td>
				</tr>
				<tr>
					<!-- 駐車場使用料調整金額 -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblParkingChangePay" code="<%=MessageIdConstant.SKF3022_SC004_PARKING_CHANGE_PAY %>" />
					</th>
					<td align="right">
						<nfwui:NumberBox id="txtParkingChangePayJigetu" name="txtParkingChangePayJigetu" max="999999" min="-99999"
							cssClass="${form.txtParkingChangePayJigetuErr}" cssStyle="width: 100px;"
							maxlength="7" value="${form.txtParkingChangePayJigetu}"  
							tabindex="307" />円
					</td>
					<td align="right">
						<nfwui:NumberBox id="txtParkingChangePayJijigetu" name="txtParkingChangePayJijigetu" max="999999" min="-99999"
							cssClass="${form.txtParkingChangePayJijigetuErr}" cssStyle="width: 100px;"
							maxlength="7" value="${form.txtParkingChangePayJijigetu}"  
							tabindex="308" />円
					</td>
				</tr>
				<tr>
					<!-- 駐車場使用料月額（調整後） -->
					<th style="width: 35%;">
						<nfwui:LabelBox id="lblParkingFinalPay" code="<%=MessageIdConstant.SKF3022_SC004_PARKING_FINAL_PAY %>" />
					</th>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.parkingFinalPayJigetu}<label>&nbsp;円
					</td>
					<td align="right" style="padding:3px 5px 3px 3px;" height:21px;" >
						<label>${form.parkingFinalPayJijigetu}<label>&nbsp;円 
					</td>
				</tr>
			</tbody>
		</nfwui:Table>

		<div class="align-R">
			<!-- 画面を閉じる ボタン -->
			<nfwui:PopupButton id="closeBtn" value="画面を閉じる" cssClass="imui-medium-button" modalMode="true" use="cancel"  preOnClick="if(!preButtonEvent(1)){return(false)};"tabindex="309" />				
			<!-- 登録 ボタン -->
			<nfwui:PopupButton id="Sc004regist" value="登録" cssStyle="width:100px;" preUrl="skf/Skf3022Sc004/registe"
				 cssClass="imui-medium-button" modalMode="true" use="ok" preOnClick="if(!preButtonEvent(0)){return(false)};" tabindex="310" />
		</div>
	</div>
</div>
</nfwui:Form>
	<script type="text/javascript">
		if(($("#txtStkTyoseiPayJigetuDisable").val() == "1" &&
				$("#txtCojinChangePayJigetuDisable").val() == "1" &&
				$("#txtParkingChangePayJigetuDisable").val() == "1")){
			// 非活性
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").prop("disabled",true);		
			$("#txtStkTyoseiPayJigetuDisable").val("1");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").prop("disabled",true);		
			$("#txtCojinChangePayJigetuDisable").val("1");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").prop("disabled",true);		
			$("#txtParkingChangePayJigetuDisable").val("1");
		}else{
			// 活性
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJigetu").prop("disabled",false);		
			$("#txtStkTyoseiPayJigetuDisable").val("0");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtCojinChangePayJigetu").prop("disabled",false);		
			$("#txtCojinChangePayJigetuDisable").val("0");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtParkingChangePayJigetu").prop("disabled",false);		
			$("#txtParkingChangePayJigetuDisable").val("0");
		}
		
		if(($("#txtStkTyoseiPayJijigetuDisable").val() == "1" &&
				$("#txtCojinChangePayJijigetuDisable").val() == "1" &&
				$("#txtParkingChangePayJijigetuDisable").val() == "1")){
			// 非活性
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").prop("disabled",true);		
			$("#txtStkTyoseiPayJijigetuDisable").val("1");
			$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").prop("disabled",true);
			$("#txtCojinChangePayJijigetuDisable").val("1");
			$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").add("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").prop("disabled",true);	
			$("#txtParkingChangePayJijigetuDisable").val("1");
		}else{
			// 活性
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtStkTyoseiPayJijigetu").prop("disabled",false);		
			$("#txtStkTyoseiPayJijigetuDisable").val("0");
			$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtCojinChangePayJijigetu").prop("disabled",false);		
			$("#txtCojinChangePayJijigetuDisable").val("0");
			$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").removeClass("wj-state-disabled");
			$("#Skf3022Sc004_popup_txtParkingChangePayJijigetu").prop("disabled",false);		
			$("#txtParkingChangePayJijigetuDisable").val("0");
		}
	</script>
<!-- コンテンツエリア　ここまで -->
