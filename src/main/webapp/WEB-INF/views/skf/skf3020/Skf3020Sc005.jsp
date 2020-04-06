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
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->
<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
	<div style="width: 100%;">
		<div class="imui-form-container-wide">
		
		<input type="hidden" name="txtDisabled" id="txtDisabled" value="${form.txtDisabled}" />
		<input type="hidden" name="enterMsg" id="enterMsg" value="${form.enterMsg}" />
		<input type="hidden" name="backMsg" id="backMsg" value="${form.backMsg}" />
		<input type="hidden" id="hdnRowShainNo" name="hdnRowShainNo" value="${form.hdnRowShainNo}" />
		<input type="hidden" id="hdnSelShainNo" name="hdnSelShainNo" value="${form.hdnSelShainNo}" />
		<input type="hidden" id="insertFormName" name="insertFormName" value="" />
		<input type="hidden" id="callbackFlag" name="callbackFlag" value="" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3020Sc004/init"/>
		<table class="imui-form-search-condition">
			<tbody>
				<tr>
					<th>
						<label style="width:80px;">社員番号</label>
					</th>
					<td colspan="2" style="width:95%;">
						<imui:textbox id="shainNo" name="shainNo" class="ime-off" style="width:200px; background:#ffead6;" type="text" readonly="true" value="${form.shainNo}" maxlength="8" placeholder="例 00123456（半角）"/>
						<nfwui:PopupButton id="btnShainNyuryoku" name="btnShainNyuryoku"
								value="社員入力支援" disabledPatterns="CREATED"
								cssClass="imui-small-button" use="popup"
								screenUrl="skf/Skf2010Sc001/init" popupWidth="650"
								popupHeight="700" modalMode="true" preOnclick="setShainShienPreparation()"/>
						<%-- <input id="btnShainNyuryoku" class="imui-small-button" type="button" value="社員入力支援" /> --%>
						<nfwui:Button id="btnKariShainNo" cssClass="imui-small-button" url="skf/Skf3020Sc005/set" formId="form" value="仮社員番号設定" disabledPatterns="CHANGE,CREATED" />
						<%-- <input id="btnKariShainNo" class="imui-small-button" type="button" value="仮社員番号設定" /> --%>
						<br />
						<nfwui:CheckBoxGroupTag id="id_check_shainNo" disabledPatterns="CREATED">
							<nfwui:CheckBox id="check_shainNo" name="id_check_shainNo" value="1" label="社員番号の変更が必要" />
						</nfwui:CheckBoxGroupTag>
						<%-- <label for="id_check_shainNo">社員番号の変更が必要</label> --%>
						<br />
						<font style="color:red">&nbsp&nbsp&nbsp&nbsp&nbsp※再雇用や役員昇格など社員番号の変更が必要となる場合</font>
					</td>
				</tr>
				<tr>
					<th>
						<label>社員氏名</label>
					</th>
					<td>
						<imui:textbox id="txtShainMei" name="txtShainMei" style="width:200px;" type="text" value="${form.txtShainMei}" maxlength="20" placeholder="例 中日本　太郎"/>
					</td>
				</tr>
				<tr>
					<th>
						<label>等級</label>
					</th>
					<td>
						<imui:textbox id="txtTokyu" name="txtTokyu" style="width:100px;" type="text" value="${form.txtTokyu}" maxlength="255" placeholder="例 担当職〇級"/>
					</td>
				</tr>
				<tr>
					<th>
						<label>年齢</label>
					</th>
					<td>
						<imui:textbox id="txtNenrei" name="txtNenrei" style="ime-mode: disabled; width:100px;" type="text" value="${form.txtNenrei}" maxlength="4" placeholder="例 半角数字"/>
					</td>
				</tr>
				<tr>
					<th rowspan="4">
						<label>新所属</label>
					</th>
					<td rowspan="4" colspan="3">
						<imui:textArea id="txtShinShozoku" name="txtShinShozoku" rows="4" style="width:500px;" value="${form.txtShinShozoku}" maxlength="255" placeholder="例 名古屋支社" />
					</td>
				</tr>
				<tr /><tr /><tr />
				<tr>
					<th rowspan="4">
						<label>現所属</label>
					</th>
						<td rowspan="4" colspan="3">
							<imui:textArea id="txtGenShozoku" name="txtGenShozoku" rows="4" style="width:500px;" value="${form.txtGenShozoku}" maxlength="255" placeholder="例 名古屋支社" />
						</td>
					</tr>
					<tr /><tr /><tr />
					<tr>
						<th rowspan="3">
							<label>備考</label>
						</th>
						<td rowspan="3" colspan="3">
							<imui:textArea id="txtBiko" name="txtBiko" rows="3" style="width:500px;" value="${form.txtBiko}" maxlength="100" />
						</td>
					</tr>
					<tr /><tr />
				</tbody>
			</table>
			<br />
			
			<div class="align-L float-L">	
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			<div class="align-R">
				<imui:button style="width:150px;" value="登録" class="imui-medium-button" disabled="${form.hdnBtnTorokuDisabled}" onclick="clickBtnToroku()"/>
			</div>
			
			<script type="text/javascript">
				// 画面テキストID配列
				const TXT_ARRAY = [
						"check_shainNo", "txtShainMei", "txtTokyu", "txtNenrei",
						"txtShinShozoku", "txtGenShozoku", "txtBiko"
				];
				
				$(document).ready(function() {
					$(".imui-toolbar-icon").removeAttr("onclick");
					$(".imui-toolbar-icon").click(function(e) {
						back1();
					});
					/*
					 * 画面のテキスト項目の活性状態を設定
					 */
					setControlStatus = function() {
	
						var txtDisabled = cnvBoolean($("#txtDisabled").val());
					
						for (var i=0; i < TXT_ARRAY.length; i++) {
							$("#" + TXT_ARRAY[i]).attr("disabled", txtDisabled);
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
					 * 「登録」ボタン押下時の処理
					 */
					clickBtnToroku = function() {
						var url = 'skf/Skf3020Sc005/registe';
						var dialogTitle = '確認';
				    	var dialogMessage = $("#enterMsg").val();
				    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
					}
					
					/*
				     * 「前の画面へ」ボタン押下時の処理
				     */
				    back1 = function() {
				    	var url = 'skf/Skf3020Sc004/init?SKF3020_SC004&tokenCheck=0';
				    	var dialogMessage = $("#backMsg").val();
				    	nfw.common.doBack(url, dialogMessage);
				    }
					
					/*
					 * 社員入力支援 コールバック関数
					 */
					shainInfoCallback = function(){
				        //if( param != null && typeof param == 'object' && param.name != null){
				        	// 社員入力支援にて選択された社員番号
				        $("#txtShainNo").val($("#shainNo").val());
				        $("#txtShainNo").text($("#shainNo").val());
				        	//nfw.common.submitForm("form", "skf/Skf3020Sc005/support");
				        //}
					}
					
					// 社員入力支援クリック
					setShainShienPreparation = function() {
						// 種別判定
						// 社員番号入力支援
						$("#insertFormName").val("txtShainMei");
						//$("#callbackFlag").val("true");

					}

					// 画面項目設定
					setControlStatus();
	
				});
			</script>
		</div>
	</div>
</nfwui:Form>
<!-- コンテンツエリア:モックのまま -->
<!-- コンテンツエリア　ここまで -->