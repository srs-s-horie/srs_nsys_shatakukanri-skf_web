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

<script type="text/javascript">
	function back1() {
		var backMessage = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。";
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf3010Sc004/init", "OK", "キャンセル", this, true);	
	}
</script>
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC005 %>" />
		<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
		<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.shatakuName}" />
		<input type="hidden" name="hdnAreaKbn" id="hdnAreaKbn" value="${form.hdnAreaKbn}" />
		<input type="hidden" name="hdnShatakuKbn" id="hdnShatakuKbn" value="${form.hdnShatakuKbn}" />
		<input type="hidden" name="hdnOriginalAuse" id="hdnOriginalAuse" value="${form.hdnOriginalAuse}" />
		<input type="hidden" name="hdnLendKbn" id="hdnLendKbn" value="${form.hdnLendKbn}" />
		<input type="hidden" name="hdnEmptyParkingCount" id="hdnEmptyParkingCount" value="${form.hdnEmptyParkingCount}" />
		<input type="hidden" name="hdnBarnMensekiAdjust" id="hdnBarnMensekiAdjust" value="${form.barnMensekiAdjust}" />
		<input type="hidden" name="registBihinData" id="registBihinData" value="${form.registBihinData}" />
		<input type="hidden" name="hdnBihinStatusList" id="hdnBihinStatusList" value="${form.hdnBihinStatusList}" />
		<input type="hidden" name="dialogShatakuName" id="dialogShatakuName" value="${form.shatakuName}" />
		<input type="hidden" name="dialogRoomNo" id="dialogRoomNo" value="${form.roomNo}" />
	
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 4%;height:24px">
<!-- 							<label style="width:80px;">社宅名</label> -->
						<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC005_SHATAKU_NAME %>" />					
					</th>
					<td style="width: 10%;">
						<label>${form.shatakuName}<label>
					</td>
					<th style="width: 5%;">
<!-- 									<label>地域区分</label> -->
						<nfwui:LabelBox id="lblAreaKbn" code="<%=MessageIdConstant.SKF3010_SC005_AREA_KBN %>" />
					</th>
					<td style="width: 4%;">
						<label>${form.areaKbn}<label>
					</td>
					<th style="width: 5%;">
<!-- 							<label>社宅区分</label> -->
						<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC005_SHATAKU_KBN %>" />
					</th>
					<td style="width: 4%;">
						<label>${form.shatakuKbn}<label>
					</td>
					<th style="width: 6%;">
<!-- 									<label>空き部屋数</label> -->
								<nfwui:LabelBox id="lblEmptyRoomCount" code="<%=MessageIdConstant.SKF3010_SC005_EMPTY_ROOM_COUNT %>" />
					</th>
					<td style="width: 4%;">
						<label>${form.emptyRoomCount}<label>
					</td>
					<th style="width: 7%;">
<!-- 									<label>空き駐車場数</label> -->
								<nfwui:LabelBox id="lblEmptyParkingCount" code="<%=MessageIdConstant.SKF3010_SC005_EMPTY_PARKING_COUNT %>" />
					</th>
					<td style="width: 4%;">
						<label>${form.emptyParkingCount}<label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div id="tabs">
			<ul>
				<li><a href="#room_info">部屋情報</a></li>
				<li><a href="#bihin_info">備品情報</a></li>
			</ul>
			<div id="room_info">
				<table class="imui-form">
					<tbody>
						<!--部屋番号-->
						<tr>
							<th style="width:12%">
<!-- 									<label style="width:135px">部屋番号</label> -->
								<nfwui:LabelBox id="lblRoomNo" code="<%=MessageIdConstant.SKF3010_SC005_ROOMNO %>" />					
							</th>
							<td style="width:21.3%;" >
<!-- 									<input style="width:130px;" type="text" value="101" /> -->
								<imui:textbox id="txtRoomNo" name="roomNo" style="width:130px;" value="${form.roomNo}" class="${form.roomNoError}" maxlength="10"  placeholder="例　101" tabindex="1"/>
							</td>
							<th style="width:12%">
<!-- 									<label>本来延面積</label> -->
								<nfwui:LabelBox id="lblOriginalMenseki" code="<%=MessageIdConstant.SKF3010_SC005_ORIGINALMENSEKI %>" />
							</th>
							<td style="width:21.3%;" >
<!-- 									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="79.83">㎡</input> -->
<%-- 									<nfwui:NumberBox id="txtOriginalMenseki" name="txtOriginalMenseki" inputFormat="N2" cssStyle="width:130px;" value="${form.originalMenseki}" maxlength="8" tabindex="9" /> --%>
								<imui:textbox id="txtOriginalMenseki" name="originalMenseki" style="text-align: right;ime-mode: disabled;width:130px;" value="${form.originalMenseki}"  class="${form.originalMensekiError}" placeholder="例　70.5" maxlength="8" tabindex="9"/>㎡
							</td>
						</tr>
						<tr>
							<th>
<!-- 									<label>本来規格</label> -->
								<nfwui:LabelBox id="lblOriginalKikaku" code="<%=MessageIdConstant.SKF3010_SC005_ORIGINALKIKAKU %>" />
							</th>
							<td>
								<imui:select id="originalKikaku" name="originalKikaku" 
								width="110" list="${form.originalKikakuList}" class="${form.originalKikakuError}" tabindex="2" />
<!-- 									本来規格（補助）<input style="width:130px;" type="text" value="１２畳" /> -->
								<imui:textbox id="txtOriginalKikakuHosoku" name="originalKikakuHosoku" style="width:130px;" value="${form.originalKikakuHosoku}" class="${form.originalKikakuHosokuError}" placeholder="例　本来規格" maxlength="5" tabindex="3"/>
							</td>
							<th>
<!-- 									<label style="width:135px;">貸与延面積</label> -->
								<nfwui:LabelBox id="lblLendMenseki" code="<%=MessageIdConstant.SKF3010_SC005_LENDMENSEKI %>" />
							</th>
							<td>
<!-- 									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="79.83">㎡</input> -->
<%-- 									<nfwui:NumberBox id="txtLendMenseki" name="lendMenseki" inputFormat="N2" cssStyle="width:130px;" value="${form.lendMenseki}" maxlength="8" tabindex="10" /> --%>
								<imui:textbox id="txtLendMenseki" name="lendMenseki" style="text-align: right;ime-mode: disabled;width:130px;" value="${form.lendMenseki}" class="${form.lendMensekiError}" placeholder="例　70.5" maxlength="8" tabindex="10"/>㎡
							</td>
						</tr>
						<tr>
							<th>
<!-- 									<label>本来用途</label> -->
								<nfwui:LabelBox id="lblOriginalAuse" code="<%=MessageIdConstant.SKF3010_SC005_ORIGINALAUSE %>" />
							</th>
							<td>
								<imui:select id="originalAuse" name="originalAuse" 
								width="110" list="${form.originalAuseList}" class="${form.originalAuseError}" tabindex="4" />
<!-- 									<input style="width:130px;" type="text" placeholder="例　本来用途" /> -->
								<imui:textbox id="txtOriginalAuseHosoku" name="originalAuseHosoku" style="width:130px;" value="${form.originalAuseHosoku}" class="${form.originalAuseHosokuError}" placeholder="例　本来用途" maxlength="5" tabindex="5"/>
							</td>
							<th>
<!-- 									<label>サンルーム面積</label> -->
								<nfwui:LabelBox id="lblSunRoomMenseki" code="<%=MessageIdConstant.SKF3010_SC005_SUNROOMMENSEKI %>" />
							</th>
							<td>
<!-- 									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="0.00">㎡</input> -->
<%-- 									<nfwui:NumberBox id="txtSunRoomMenseki" name="sunRoomMenseki" inputFormat="N2" cssStyle="width:130px;" value="${form.sunRoomMenseki}" maxlength="8" tabindex="11" /> --%>
								<imui:textbox id="txtSunRoomMenseki" name="sunRoomMenseki" style="text-align: right;ime-mode: disabled;width:130px;" value="${form.sunRoomMenseki}" class="${form.sunRoomMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="11"/>㎡
							</td>
						</tr>
						<tr>
							<th>
<!-- 									<label>貸与区分</label> -->
								<nfwui:LabelBox id="lblSunRoomMenseki" code="<%=MessageIdConstant.SKF3010_SC005_LENDKBN %>" />
							</th>
							<td>
								<imui:select id="lendKbn" name="lendKbn" 
								width="110" list="${form.lendKbnList}" class="${form.lendKbnError}" tabindex="6" />
<!-- 									<input style="width:130px;" type="text" placeholder="例　貸与区分" /> -->
								<imui:textbox id="txtLendKbnHosoku" name="lendKbnHosoku" style="width:130px;" value="${form.lendKbnHosoku}" class="${form.lendKbnHosokuError}" placeholder="例　貸与区分" maxlength="5" tabindex="7"/>
							</td>
							<th>
<!-- 									<label>寒冷地減免事由区分</label> -->
								<nfwui:LabelBox id="lblColdExemptionKbn" code="<%=MessageIdConstant.SKF3010_SC005_COLDEXEMPTIONKBN %>" />
							</th>
							<td>
								<imui:select id="coldExemptionKbn" name="coldExemptionKbn" 
								width="110" list="${form.coldExemptionKbnList}" tabindex="12" />
							</td>
						</tr>
						<!--備考-->
						<tr>
							<th rowspan="3">
<!-- 									<label>備考</label> -->
								<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC005_BIKO %>" />
							</th>
							<td rowspan="3">
<!-- 									<textarea style="width:270px;" rows="6"></textarea> -->
								<imui:textArea id="txtBiko" name="biko" style="width:270px;" value="${form.biko}" class="${form.bikoError}" cols="30" rows="6" tabindex="8"/>
							</td>
							<th>
<!-- 									<label>階段面積</label> -->
								<nfwui:LabelBox id="lblStairsMenseki" code="<%=MessageIdConstant.SKF3010_SC005_STAIRSMENSEKI %>" />
							</th>
							<td>
<!-- 									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="0.00">㎡</input> -->
<%-- 									<nfwui:NumberBox id="txtStairsMenseki" name="stairsMenseki" inputFormat="N2" cssStyle="width:130px;" value="${form.stairsMenseki}" maxlength="8" tabindex="13" /> --%>
								<imui:textbox id="txtStairsMenseki" name="stairsMenseki" style="text-align: right;ime-mode: disabled;width:130px;" value="${form.stairsMenseki}" class="${form.stairsMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="13"/>㎡
							</td>
						</tr>
						<tr>
							<th>
<!-- 									<label>物置面積</label> -->
								<nfwui:LabelBox id="lblBarnMenseki" code="<%=MessageIdConstant.SKF3010_SC005_BARNMENSEKI %>" />
							</th>
							<td>
<%-- 									<nfwui:NumberBox id="txtBarnMenseki" name="barnMenseki" inputFormat="N2" cssStyle="width:130px;" value="${form.barnMenseki}" maxlength="8" tabindex="14" /> --%>
								<imui:textbox id="txtBarnMenseki" name="barnMenseki" style="text-align: right;ime-mode: disabled;width:130px;" value="${form.barnMenseki}" class="${form.barnMensekiError}" placeholder="例　1.0" maxlength="8" tabindex="14"/>㎡
							</td>
						</tr>
						<tr>
							<th>
<!-- 									<label>物置調整面積</label> -->
								<nfwui:LabelBox id="lblBarnMensekiAdjust" code="<%=MessageIdConstant.SKF3010_SC005_BARNMENSEKIADJUST %>" />
							</th>
							<td style="height:24px">
								<span id="spbarnMensekiAdjust">${form.barnMensekiAdjust}</span>㎡
							</td>
							<td style="width:33.4%;border:none;background-color:#ffffff;box-shadow:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="bihin_info">
				<table class="imui-form">
				<!-- 明細部 -->
				<form id="bihinList">
				<imui:listTable id="bihinList" process="jssp" autoEncode="false" autoWidth="false" rowNumbers="true"
					autoResize="false" onCellSelect="onCellSelect"
					multiSelect="false" data="${form.bihinListData}"
					style="max-height: 800px" height="auto" tabindex="15">
					<cols sortable="false">
					<col name="bihinCode" hidden="true" />
					<col name="bihinName" caption="備品名称" width="180" sortable="false" />
					<col name="bihinStatus" caption="備品状況" width="120" sortable="false" align="center" />
					<col name="bihinLatestStatus" hidden="true" />
					<col name="updateDate" hidden="true" />
					</cols>
				</imui:listTable>
				</form>
			</div>
			<script type="text/javascript">
			(function($) {
				$("#originalAuse").bind('change', function() {
					var map = new Object();
					map['barnMenseki'] = $("#txtBarnMenseki").val();
					map['originalAuse'] = $("#originalAuse").val();
					map['barnMensekiAdjust'] = $("hdnBarnMensekiAdjust").val();
					
					nfw.common.doAjaxAction("skf/Skf3010Sc005/ChangeDropDownAsync",map,true,function(data) {
						document.getElementById('spbarnMensekiAdjust').innerHTML = data.barnMensekiAdjust;
						$("#hdnBarnMensekiAdjust").val(data.barnMensekiAdjust);
					});
				});
				$("#txtBarnMenseki").bind('change', function() {
					var map = new Object();
					map['barnMenseki'] = $("#txtBarnMenseki").val();
					map['originalAuse'] = $("#originalAuse").val();
					map['barnMensekiAdjust'] = $("#hdnBarnMensekiAdjust").val();
					
					nfw.common.doAjaxAction("skf/Skf3010Sc005/ChangeDropDownAsync",map,true,function(data) {
						document.getElementById('spbarnMensekiAdjust').innerHTML = data.barnMensekiAdjust;
						$("#hdnBarnMensekiAdjust").val(data.barnMensekiAdjust);
					});
				});
				
				// 画面表示時に定義される処理
				$(document).ready(function(){
					$(".imui-toolbar-icon").removeAttr("onclick");
					$(".imui-toolbar-icon").click(function(e) {
						back1();
					});

					// 下部ボタン押下時のイベント
					registOnClick = function () {
						var dialogTitle = "";
						var dialogMessage = "";
						var url = "";
						var grid = null;
						var row = null;
						var datas = null;

						//備品ステータス取得
						// リストテーブル情報取得
						grid = $("#bihinList");
						datas = grid.getGridParam("data");//全行
						
						if( datas.length > 0 )
						{
							var strs = [];
							for( var i=0; i<datas.length; ++i )
							{
								var tempStr = [];
								var row = datas[i];
								var statusList = "bihinStatus"+i;
								var bihinCode = row.bihinCode;
								var bihinName = row.bihinName;
								var bihinLatestStatus = row.bihinLatestStatus;
								var updateDate = row.updateDate;
								var bihinStatus = document.getElementById(statusList);
								var bihinStatusValue = bihinStatus.value;
								
								tempStr.push(bihinCode);
								tempStr.push(bihinName);
								tempStr.push(bihinStatusValue);
								tempStr.push(bihinLatestStatus);
								tempStr.push(updateDate);
								
								strs.push(tempStr.join(","));		//配列で格納
							}																
					
							$("#registBihinData").val(strs.join(";"));
						}
						
						//確認メッセージ
						dialogTitle = "確認";
						//MessageIdConstant.I_SKF_3035[{0}を登録します。よろしいですか？]
						dialogMessage = "社宅部屋情報を登録します。よろしいですか？";
						nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc005/regist", "ok", "キャンセル", this, true);	
				    }
				    deleteOnClick = function () {
				    	var shatakuname = $("#dialogShatakuName").val();
				    	var roomNo = $("#dialogRoomNo").val()
				    	//確認メッセージ
						dialogTitle = "確認";
						//MessageIdConstant.I_SKF_3004[（{0}・{1}）の削除処理を実行します。よろしいですか？]
						dialogMessage = "(" + shatakuname + "・" + roomNo + ")の削除処理を実行します。よろしいですか？";
				    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc005/delete", "ok", "キャンセル", this, true);	
				    }
				    backOnClick = function () {
				    	//確認メッセージ
						dialogTitle = "確認";
						dialogMessage = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。";
				    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc004/init", "ok", "キャンセル", this, true);	
				    }
			    });
			})(jQuery);
			</script>
			</nfwui:Form>
		</div>
		<br />
		<nfwui:Form id="btnForm" name="btnForm">
		<div class="align-L float-L">	
			<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="16" />
		</div>
		<div class="align-R">
			<imui:button id="regist" name="regist" value="登録" class="imui-medium-button" style="width: 150px" onclick="registOnClick()" tabindex="17" />
			<imui:button id="delete" name="delete" value="削除" class="imui-medium-button" style="width: 150px" onclick="deleteOnClick()" disabled="${form.deleteBtnFlg}" tabindex="18" />
		
		</div>
		</nfwui:Form>
	</div>
	<script>
		$(function() {
			$( "#tabs" ).tabs();
		});
	</script>
</div>
	<!-- コンテンツエリア　ここまで -->