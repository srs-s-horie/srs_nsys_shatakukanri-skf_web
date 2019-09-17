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
<style type="text/css">

</style>
<script type="text/javascript">
function back1() {
	var url="skf/Skf3010Sc002/init?SKF3010_SC002&tokenCheck=0"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}
</script>
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide">
			<nfwui:Form id="form" name="form" modelAttribute="form">
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 5%;">
<!-- 									<label style="height:24px;">社宅名</label> -->
									<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC007_SHATAKU_NAME %>" />
								</th>
								<td style="width: 15%;">
									<label>${form.shatakuName}<label>
								</td>
								<th style="width: 5%;">
<!-- 									<label>地域区分</label> -->
									<nfwui:LabelBox id="lblAreaKbn" code="<%=MessageIdConstant.SKF3010_SC007_AREA_KBN %>" />
								</th>
								<td style="width: 5%;">
									<label>${form.areaKbn}<label>
								</td>
								<th style="width: 5%;">
<!-- 									<label>社宅区分</label> -->
									<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC007_SHATAKU_KBN %>" />
								</th>
								<td style="width: 5%;">
									<label>${form.shatakuKbn}<label>
								</td>
								<td style="width: 40%;border:none;	">
								</td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</nfwui:Table>
			
		</nfwui:Form>
		<br>
			<!-- 明細＆細目未満 -->
				<!-- 明細部 -->
			<nfwui:Form id="form2" name="form2" action="/skf/Skf3010Sc007/selectList" modelAttribute="form">
				<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC007 %>" />
					<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
					<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName}" />
					<input type="hidden" name="hdnAreaKbn" id="hdnAreaKbn" value="${form.hdnAreaKbn}" />
					<input type="hidden" name="hdnShatakuKbn" id="hdnShatakuKbn" value="${form.hdnShatakuKbn}" />
					<input type="hidden" name="hdnListData" id="hdnListData" value="${form.hdnListData}" />
					<input type="hidden" name="hdnParkingBlock" id="sendParkingBlock" value="${form.hdnParkingBlock}" />
					<input type="hidden" name="hdnBackupContractPropertyId" id="hdnBackupContractPropertyId" value="${form.hdnBackupContractPropertyId}" />
					<input type="hidden" name="hdnBackupMaxContractPropertyId" id="hdnBackupMaxContractPropertyId" value="${form.hdnBackupMaxContractPropertyId}" />
					<input type="hidden" name="hdnRegistContractPropertyId" id="hdnRegistContractPropertyId" value="${form.hdnRegistContractPropertyId}" />
					<input type="hidden" name="hdnBackupParkingContractType" id="hdnBackupParkingContractType" value="${form.hdnBackupParkingContractType}" />
					<input type="hidden" name="hdnBackupｓOwnerName" id="hdnBackupOwnerName" value="${form.hdnBackupOwnerName}" />
					<input type="hidden" name="hdnBackupOwnerNo" id="hdnBackupOwnerNo" value="${form.hdnBackupOwnerNo}" />
					<input type="hidden" name="hdnBackupParkingZipCd" id="hdnBackupParkingZipCd" value="${form.hdnBackupParkingZipCd}" />
					<input type="hidden" name="hdnBackupParkingAddress" id="hdnBackupParkingAddress" value="${form.hdnBackupParkingAddress}" />
					<input type="hidden" name="hdnBackupParkingName" id="hdnBackupParkingName" value="${form.hdnBackupParkingName}" />
					<input type="hidden" name="hdnBackupAssetRegisterNo" id="hdnBackupAssetRegisterNo" value="${form.hdnBackupAssetRegisterNo}" />
					<input type="hidden" name="hdnBackupParkinglendKbn" id="hdnBackupParkinglendKbn" value="${form.hdnBackupParkinglendKbn}" />
					<input type="hidden" name="hdnBackupContractStartDate" id="hdnBackupContractStartDate" value="${form.hdnBackupContractStartDate}" />
					<input type="hidden" name="hdnBackupContractEndDate" id="hdnBackupContractEndDate" value="${form.hdnBackupContractEndDate}" />
					<input type="hidden" name="hdnBackupLandRent" id="hdnBackupLandRent" value="${form.hdnBackupLandRent}" />
					<input type="hidden" name="hdnBackupBiko" id="hdnBackupBiko" value="${form.hdnBackupBiko}" />
					<input type="hidden" name="contractPropertyId" id="sendContractPropertyId" value="" />
					<input type="hidden" name="parkingContractType" id="sendParkingContractType" value="" />
					<input type="hidden" name="parkingKanriNo" id="sendParkingKanriNo" value="${form.parkingKanriNo}" />
					<input type="hidden" name="selectMode" id="selectMode" value="${form.selectMode}" />
					<input type="hidden" name="hdnDelInfoFlg" id="hdnDelInfoFlg" value="${form.hdnDelInfoFlg}" />
					<input type="hidden" name="ownerNo" id="sendOwnerNo" value="${form.ownerNo}" />

					
					<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						})(jQuery);
					</script>
					<div id="listTableArea">
					<imui:listTable id="mainList" process="jssp" autoEncode="true" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect"
						multiSelect="false" data="${form.listTableData }"
						style="max-height: 800px" tabindex="1">
						<pager rowNum="${form.listTableMaxRowCount }" />
						<cols sortable="false">
						<col name="colParkingBlock" caption="区画番号" width="65" sortable="false" align="left" />
						<col name="colParkingContractType" caption="契約形態" width="100" sortable="false" align="left" wrap="true"/>
						<col name="colContractPropertyId" caption="契約番号" width="65" sortable="false" align="center" wrap="true"/>
						<col name="colOwnerName" caption="賃貸人（代理人）" width="140" sortable="false" align="left" wrap="true"/>
						<col name="colParkingAddress" caption="所在地"　width="250" sortable="false" align="left" wrap="true"/>
						<col name="colParkingName" caption="駐車場名" width="120" sortable="false" align="left" wrap="true"/>
						<col name="colAssetRegisterNo" caption="経理連携用管理番号"  width="120" sortable="false" align="center" wrap="true"/>
						<col name="colContractStartDate" caption="契約開始日" width="80" sortable="false" align="center" wrap="true"/>
						<col name="colContractEndDate" caption="契約終了日" width="80" sortable="false" align="center" wrap="true"/>
						<col name="colLandRent" caption="地代" width="70" sortable="false" align="right" wrap="true"/>
						<col name="colBiko" caption="備考" width="80" sortable="false" align="left" wrap="true"/>
						<col name="colParkingKanriNo" caption="駐車場管理番号" hidden="true"/>
						
						</cols>
					</imui:listTable>
					
					<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>
					<div id="sampleListTable1-pager"></div>
					<script type="text/javascript">
						(function($) {
							onCellSelect = function(rowId,iCol,cellcontent,e) {
								
								// リストテーブル情報取得
								var grid = $("#mainList");
								// 行番号から選択した行の情報を取得
								var row = grid.getRowData(rowId);
								
								$("#sendParkingBlock").val(row.colParkingBlock);
								$("#sendContractPropertyId").val(row.colContractPropertyId);
								$("#sendParkingKanriNo").val(row.colParkingKanriNo);
								if($("#selectMode").val() == 'init'){
									$("#selectMode").val('mainlList');
									
									url = "skf/Skf3010Sc007/selectList";
									$("#form2").attr("action", url);
									$("#form2").submit();
								}else{
									checkInput('mainList');	
								}
								
							}
							
							})(jQuery);

					</script>	
					</div>
		</div>
		<div class="imui-form-container-wide">
		<table class="imui-form-search-condition">
          <tbody>
           <tr>
               <th style="width:12%" colspan="2">
<!--                	<label>区画番号</label> -->
               	<nfwui:LabelBox id="lblParkingBlock" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_BLOCK %>" />
               </th>
               <td style="width:20%">
               	<span id="spanParkingBlock">${form.parkingBlock}</span>
               </td>
               
			 <th style="width:12%">
<!-- 			 <label>契約番号</label> -->
			 <nfwui:LabelBox id="lblContractPropertyId" code="<%=MessageIdConstant.SKF3010_SC007_CONTRACT_PROPERTY_ID %>" />
			 </th>
               <td style="width:20%">
               		<imui:select id="contractPropertyId" name="contractPropertyId" 
					 width="140" list="${form.contractPropertyIdList}" tabindex="1" disabled="${form.contractListDisabled}" class="${form.contractPropertyIdError}"/>

               		<imui:button id="add" name="add" value="追加" class="imui-small-button" disabled="${form.addButtonDisabled}" onclick="addOnClick()" tabindex="2" />
           			<imui:button id="delete" name="delete" value="削除" class="imui-small-button" disabled="${form.deleteButtonDisabled}" onclick="deleteOnClick()" tabindex="3" />
               
               <td style="width:20%;border:none;" ></td>
			</tr>
                    <!-- スペース-->
                    <tr style="border:none">
                       <td style="border:none">
                       </td>
                    </tr>

			<tr>
               <th colspan="2">
<!--                 <label>契約形態</label> -->
               <nfwui:LabelBox id="lblParkingContractType" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_CONTRACT_TYPE %>" />
               </th>
               <td colspan="3">
               <imui:select id="parkingContractType" name="parkingContractType" 
					 width="130" list="${form.parkingContractTypeList}" tabindex="4" disabled="${form.contractListDisabled}" class="${form.parkingContractTypeError}"/>
               </td>
             </tr>
			<tr>
               <th  colspan="2">
<!--                <label>賃貸人（代理人）<label> -->
               		<nfwui:LabelBox id="lblOwnerName" code="<%=MessageIdConstant.SKF3010_SC007_OWNER_NAME %>" />
               </th>
               <td colspan="3">
<%--                		<imui:textbox id="txtOwnerName" name="ownerName" style="width:130px;" value="${f:h(form.ownerName)}" class="${form.ownerNameError}" disabled="${form.contractInfoDisabled}" maxlength="30" tabindex="5" readonly /> --%>
               		<imui:textbox id="txtOwnerName" name="ownerName" style="width:130px;" value="${f:h(form.ownerName)}" class="${form.ownerNameError}" disabled="${form.contractInfoDisabled}" maxlength="30" tabindex="5" />
               		<nfwui:PopupButton id="ownerShien" name="ownerShien" value="支援" use="popup" 
               		cssClass="imui-small-button" popupWidth="650" popupHeight="550" 
               		modalMode="false" screenUrl="skf/Skf2010Sc001/init" 
               		parameter="parkinglendKbn:nyukyoFlag" disabled="${form.contractInfoDisabled}" 
               		callbackFunc="shainInfoCallback" tabindex="6"/>
               </td>
               </tr>

             <tr>
               <th rowspan="2">
<!--                <label>所在地 </label> -->
               		<nfwui:LabelBox id="lblParkingAddressKbn" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_ADDRESS_KBN %>" />
               </th>
               <th>
<!--                <label>郵便番号</label> -->
               		<nfwui:LabelBox id="lblParkingZipCd" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_ZIP_CD %>" />
               </th>
               <td colspan="3">
               	<imui:textbox id="txtParkingZipCd" name="parkingZipCd" style="ime-mode: disabled;width:130px;" value="${f:h(form.parkingZipCd)}" class="${form.parkingZipCdError}" disabled="${form.contractInfoDisabled}" placeholder="例　4600003" maxlength="7" tabindex="7"/>
              	<nfwui:Button id="addressSearch" name="addressSearch" code="<%=MessageIdConstant.SKF3010_SC007_ADDRESS_SEARCH %>" cssClass="imui-small-button" url="skf/Skf3010Sc007/addressSearch" disabled="${form.contractInfoDisabled}" formId="form2"  tabindex="8"/>
             </tr>

             <tr>
               <th>
<!--                <label>住所</label> -->
					<nfwui:LabelBox id="lblParkingAddress" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_ADDRESS %>" />
               <td colspan="3">
               		<imui:textbox id="txtParkingAddress" name="parkingAddress" style="width:50%;" value="${f:h(form.parkingAddress)}" class="${form.parkingAddressError}" placeholder="例　愛知県名古屋市中区錦2-18-19" maxlength="50" tabindex="9" disabled="${form.contractInfoDisabled}"/>
               </td>
               </tr>
  
               <th style="width:12%" colspan="2">
<!--                		<label>駐車場名</label> -->
               		<nfwui:LabelBox id="lblParkingName" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_NAME %>" />
               </th>
               <td colspan="3">
               		<imui:textbox id="txtParkingName" name="parkingName" style="width:200px;" value="${f:h(form.parkingName)}" class="${form.parkingNameError}" disabled="${form.contractInfoDisabled}" placeholder="例　駐車場名" maxlength="30" tabindex="10"/>
               </td>
             </tr>

             <tr>
               <th  colspan="2">
<!--                <label>経理連携用管理番号<label> -->
               		<nfwui:LabelBox id="lblAssetRegisterNo" code="<%=MessageIdConstant.SKF3010_SC007_ASSET_REGISTER_NO %>" />
               </th>
               <td  colspan="3">
               		<imui:textbox id="txtAssetRegisterNo" name="assetRegisterNo" style="ime-mode: disabled;width:200px;" value="${f:h(form.assetRegisterNo)}" class="${form.assetRegisterNoError}" disabled="${form.contractInfoDisabled}" placeholder="例　1234-56-7890-1-001" maxlength="15" tabindex="11"/>
               </td>
               
			</tr>
			<tr>
               <th colspan="2">
<!--                		<label>貸与区分<label> -->
               		<nfwui:LabelBox id="lblParkinglendKbn" code="<%=MessageIdConstant.SKF3010_SC007_PARKING_LEND_KBN %>" />
               </th>
               <td colspan="3">
               		<imui:select id="parkinglendKbn" name="parkinglendKbn" 
					 	width="110" list="${form.parkinglendKbnList}" disabled="${form.contractInfoDisabled}" tabindex="12" />
               </td>
               
			</tr>
			<tr>
               <th style="width:12%" colspan="2">
<!--                <label>契約開始日<label> -->
              		<nfwui:LabelBox id="lblContractStartDate" code="<%=MessageIdConstant.SKF3010_SC007_CONTRACT_START_DATE %>" />
               </th>
               <td>
                 <imui:textbox name="contractStartDate" id="contractStartDate" value="${f:h(form.contractStartDate)}" class="${form.contractStartDateError}" disabled="${form.contractInfoDisabled}" style="width:100px"  tabindex="13"/>
               </td>
               <th style="width: 150px;">
<!--                <label>契約終了日<label> -->
               		<nfwui:LabelBox id="lblContractEndDate" code="<%=MessageIdConstant.SKF3010_SC007_CONTRACT_END_DATE %>" />
               </th>
                    <td>
                       <imui:textbox name="contractEndDate" id="contractEndDate" value="${f:h(form.contractEndDate)}" class="${form.contractEndDateError}" disabled="${form.contractInfoDisabled}" style="width:100px"  tabindex="14"/>
                    </td>
				<im:calendar floatable="true" altField="#contractStartDate" disabled="${form.contractInfoDisabled}"/>
				<im:calendar floatable="true" altField="#contractEndDate" disabled="${form.contractInfoDisabled}"/>
             </tr>

             <tr>
               <th  colspan="2">
<!--                <label>駐車場料（地代）<label> -->
               		<nfwui:LabelBox id="lblLandRent" code="<%=MessageIdConstant.SKF3010_SC007_LAND_RENT %>" />
               </th>
                    <td colspan="3">
                         <imui:textbox name="landRent" id="landRent" value="${f:h(form.landRent)}" class="${form.landRentError}" disabled="${form.contractInfoDisabled}" style="text-align: right;ime-mode: disabled;width:100px" placeholder="例　半角数字" maxlength="6" tabindex="15"/> 
<%--                          <nfwui:NumberBox name="landRentnumber" id="landRentnumber" value="${form.landRentnumber}" cssClass="${form.landRentError}" disabled="${form.contractInfoDisabled}" cssStyle="width:100px;" inputFormat="n0" maxlength="7" tabindex="15"/>  --%>
                        &nbsp;円
                    </td>
               </tr>
               <tr>

               <th colspan="2">
<!--                <label>備考<label> -->
               		<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3010_SC007_BIKO %>" />
               </th>
               <td colspan="3">
                    <imui:textbox name="biko" id="biko" value="${f:h(form.biko)}" disabled="${form.contractInfoDisabled}" style="width:500px" maxlength="100" tabindex="16"/>
               </td>             
               </tr>
		</table>	
			<br />

			<div class="align-R">
				<imui:button id="regist" name="regist" value="登録" class="imui-medium-button" style="width: 150px" onclick="registOnClick()" tabindex="17" disabled="${form.registButtonDisabled}"/>
				<imui:button id="cancel" name="cancel" value="キャンセル" class="imui-medium-button" style="width: 150px" onclick="cancelOnClick()" tabindex="18" disabled="${form.cancelButtonDisabled}"/>
			
			</div>
			<br>
		
			<div class="align-L">	
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="19" />
			</div>
		</div>

		<script type="text/javascript">
				(function($) {
					// 画面表示時に定義される処理
				    $(document).ready(function(){
				    	checkInput = function (mode) {
				    		
							$("#selectMode").val(mode);
							
							//入力内容チェック
							var map = new Object();
							map['parkingBlock'] = $("#sendParkingBlock").val();
							map['contractPropertyId'] = $("#contractPropertyId").val();
							map['hdnBackupContractPropertyId'] = $("#hdnBackupContractPropertyId").val();
							map['hdnBackupMaxContractPropertyId'] = $("#hdnBackupMaxContractPropertyId").val();
							map['hdnBackupParkingContractType'] = $("#hdnBackupParkingContractType").val();
							map['hdnBackupOwnerName'] = $("#hdnBackupOwnerName").val();
							map['hdnBackupOwnerNo'] = $("#hdnBackupOwnerNo").val();
							map['hdnBackupParkingZipCd'] = $("#hdnBackupParkingZipCd").val();
							map['hdnBackupParkingAddress'] = $("#hdnBackupParkingAddress").val();
							map['hdnBackupParkingName'] = $("#hdnBackupParkingName").val();
							map['hdnBackupAssetRegisterNo'] = $("#hdnBackupAssetRegisterNo").val();
							map['hdnBackupParkinglendKbn'] = $("#hdnBackupParkinglendKbn").val();
							map['hdnBackupContractStartDate'] = $("#hdnBackupContractStartDate").val();
							map['hdnBackupContractEndDate'] = $("#hdnBackupContractEndDate").val();
							map['hdnBackupLandRent'] = $("#hdnBackupLandRent").val();
							map['hdnBackupBiko'] = $("#hdnBackupBiko").val();

							map['parkingContractType'] = $("#parkingContractType").val();
							map['ownerName'] = $("#txtOwnerName").val();
							map['parkingZipCd'] = $("#txtParkingZipCd").val();
							map['parkingAddress'] = $("#txtParkingAddress").val();
							map['parkingName'] = $("#txtParkingName").val();
							map['assetRegisterNo'] = $("#txtAssetRegisterNo").val();
							map['parkinglendKbn'] = $("#parkinglendKbn").val();
							map['contractStartDate'] = $("#contractStartDate").val();
							map['contractEndDate'] = $("#contractEndDate").val();
							map['landRent'] = $("#landRent").val();
							map['biko'] = $("#biko").val();
							
							map['hdnDelInfoFlg'] = $("#hdnDelInfoFlg").val();
							map['selectMode'] = $("#selectMode").val();
							
							nfw.common.doAjaxAction("skf/Skf3010Sc007/ContractInfoSelectAsync",map,true,function(data) {
								
								var result = data.checkResult;
								if(result == "1"){
									$("#contractPropertyId").imuiSelect('replace', data.contractPropertyIdList);
									//内容変更有で、確認メッセージ
									//確認メッセージ
										var dialogTitle = "確認";
										//MessageIdConstant.：I-SKF-2024
										var dialogMessage = "入力内容が無効になります。破棄してもよろしいですか？";
								    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", "skf/Skf3010Sc007/selectList", "OK", "CANCEL", this, true);
								}else{
									
									url = "skf/Skf3010Sc007/selectList";
									$("#form2").attr("action", url);
									$("#form2").submit();
								}
								
								
							});
				    	}
				    	
				    	addOnClick = function () {
				    		$("#sendParkingBlock").val($("#sendParkingBlock").val());
							$("#sendContractPropertyId").val( $("#contractPropertyId").val());
				    		$("<div>駐車場の契約情報を追加します。よろしいですか？</div>").imuiMessageDialog({
				    			iconType : 'question',
				    			title : '確認',
				    			modal : true,
				    		    buttons: [
				    		      {
				    		        'id': 'okbutton',
				    		        'text': 'OK',
				    		        'click': function() { checkInput('addButton'); }
				    		      },
				    		      {
				    		        'text': 'キャンセル',
				    		        'click': function() {$(this).imuiMessageDialog('close'); }
				    		      }
				    		    ]
				    		});
				    	}
				    	
				    	deleteOnClick = function(){
				    		var mode = $("#selectMode").val();
				    		var dialogTitle = "確認";
				    		
				    		if(mode == "addButton"){
				    			//追加（未登録）情報の削除
				    			$("#sendParkingBlock").val($("#sendParkingBlock").val());
								$("#sendContractPropertyId").val( $("#hdnBackupContractPropertyId").val());
								$("#selectMode").val('deleteButtonAdd');
								
								//MessageIdConstant.：I-SKF-2024
								var dialogMessage = "入力内容が無効になります。破棄してもよろしいですか？";
						    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", "skf/Skf3010Sc007/selectList", "OK", "CANCEL", this, true);
				    		}else{
				    			//登録済み情報の削除
				    			$("#sendParkingBlock").val($("#sendParkingBlock").val());
								$("#sendContractPropertyId").val( $("#contractPropertyId").val());
								$("#selectMode").val('deleteButton');
			
				    			
								//MessageIdConstant.：I-SKF-3064
								var dialogMessage = "駐車場の契約情報を削除します。よろしいですか？";
						    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", "skf/Skf3010Sc007/selectList", "OK", "CANCEL", this, true);
				    		}
				    	}
				    	
				    	cancelOnClick = function () {
				    		$("#sendParkingBlock").val($("#sendParkingBlock").val());
							$("#sendContractPropertyId").val( $("#hdnRegistContractPropertyId").val());
							$("#selectMode").val('mainList');
							//MessageIdConstant.：I-SKF-3051編集が無効になります。よろしいですか？
				    		
			    			var dialogTitle = "確認";
							var dialogMessage = "編集が無効になります。よろしいですか？";
					    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", "skf/Skf3010Sc007/selectList", "OK", "CANCEL", this, true);
				    	}
				    	
				    	registOnClick = function () {
				    		$("#sendParkingBlock").val($("#sendParkingBlock").val());
							$("#sendContractPropertyId").val( $("#contractPropertyId").val());
							$("#sendParkingContractType").val( $("#parkingContractType").val());
							$("#selectMode").val('registButton');
							//MessageIdConstant.I_SKF_3035[{0}を登録します。よろしいですか？]
				    		
			    			var dialogTitle = "確認";
							var dialogMessage = "駐車場契約情報を登録します。よろしいですか？";
					    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", "skf/Skf3010Sc007/regist", "OK", "CANCEL", this, true);
				    	}
				    	
				    	updateOwnerName = function() {
				            if( param != null && typeof param == 'object' && param.name != null && param.no != null){
				                $("#txtOwnerName").val(param.name);
				                $("#ownerNo").val(param.no);
				            }
				    		
				    	}
				    	shainInfoCallback = function(param) {
				            if( param != null && typeof param == 'object' && param.name != null && param.shainNo != null){
				                $("#txtOwnerName").val(param.name);
				                $("#sendOwnerNo").val(param.shainNo);
				            }
				    		
				    	}
				    	
				    	backOnClick = function () {
					    	//確認メッセージ
							dialogTitle = "確認";
							dialogMessage = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。";
					    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3010Sc002/init", "OK", "CANCEL", this, true);	
					    }
				    	
				    	//リサイズ時イベント
				    	$(window).bind('resize', function(){
				    		$('#mainList').setGridWidth($('#listTableArea').width(), true);	
				    	}).trigger('resize');
				    
				    });
					
					$("#contractPropertyId").bind('change', function() {
						$("#sendParkingBlock").val($("#sendParkingBlock").val());
						$("#sendContractPropertyId").val( $("#contractPropertyId").val());
						
						checkInput('contractPropertyIdList');
						
					});
					
					$("#parkingContractType").bind('change', function() {
						//契約形態変更
						$('#sendParkingContractType').val($("#parkingContractType").val());
						// サービス呼び出し
						url = "skf/Skf3010Sc007/changeContractType";
						$("#form2").attr("action", url);
						$("#form2").submit();
					
					
					});
					
				})(jQuery);
				</script>
		</nfwui:Form>

	
	<!-- コンテンツエリア　ここまで -->