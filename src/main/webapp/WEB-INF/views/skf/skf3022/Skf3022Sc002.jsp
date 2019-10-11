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
/*     width:650px; */
/*     min-width:650px; */
/*     max-width: 1000px; */
/*   } */
</style>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form" >
<div class="imui-form-container-wide">
	<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
	<nfwui:Title code="<%= MessageIdConstant.SKF3022_SEARCH_TITLE %>" titleLevel="2" />
		<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
		<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName}" />
		<input type="hidden" name="hdnRiyouStartDay" id="hdnRiyouStartDay" value="${form.hdnRiyouStartDay}" />
		<nfwui:Table use="search">
				<tbody>
					<tr>
						<th style="width: 15%;">
<!-- 							<label>社宅名</label> -->
							<nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF3022_SC002_SHATAKU_NAME %>" />
						</th>
						<td  colspan="3">
							<label>${form.shatakuName}</label>
						</td>
					</tr>
					<tr>
						<th style="width: 10%;">
<!-- 							<label>使用者</label> -->
							<nfwui:LabelBox id="lblShiyosha" code="<%= MessageIdConstant.SKF3022_SC002_SHIYOSYA %>" />
						</th>
						<td>
							<imui:textbox id="shiyosha" name="shiyosha" style="width:150px;" value="${form.shiyosha}" placeholder="例  中日本  太郎" tabindex="51" />
						</td>
						<th style="width: 15%;">
<!-- 							<label>駐車場</label> -->
							<nfwui:LabelBox id="lblChushajo" code="<%= MessageIdConstant.SKF3022_SC002_AKI_PARKING %>" />
						</th>
						<td>
						<input type="checkbox" name="akiParkingchk" id="akiParkingchk" value="1" checked="checked" tabindex="52"/>空き駐車場
<%-- 						<nfwui:CheckBoxGroupTag id="akiParking"> --%>
<%-- 							<nfwui:CheckBox id="akiParking1" name="akiParking" value="1" label="空き駐車場" tabindex="52"/> --%>
<%-- 						</nfwui:CheckBoxGroupTag> --%>
						</td>
					</tr>
					<tr>
						<th style="width: 10%;">
<!-- 							<label>備考</label> -->
							<nfwui:LabelBox id="lblBiko" code="<%= MessageIdConstant.SKF3022_SC002_BIKO %>" />
						</th>
						<td colspan="3">
							<imui:textbox id="parkingBiko" name="parkingBiko" style="width:80%;" value="${form.parkingBiko}" tabindex="53" />
						</td>
					</tr>
				</tbody>
		</nfwui:Table>
		<div class="align-L">
<%-- 		<imui:button id="search" name="search" value="検索" class="imui-small-button" onclick="searchOnClick()" tabindex="4" /> --%>
			<nfwui:Button id="searchBtn" name="searchBtn" code="<%=MessageIdConstant.SKF3010_SC004_BUTTON_SEARCH %>"  tabindex="54"
			preOnClick="refreshGridData();return false;" cssClass="imui-small-button" />
<%-- 			<nfwui:TextBox id="setName" name="setName" value="" remove/> --%>
		</div>
<br>
		<!-- 明細＆細目未満 -->
		<!-- 明細部 -->
		<nfwui:Title code="<%= MessageIdConstant.SKF3022_SEARCH_RESULT %>" titleLevel="2" />
			<script type="text/javascript">
				(function($){
				$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
				})(jQuery);
			</script>
		<imui:listTable id="resultList" name="resultList"
			data="${form.listTableList}" onCellSelect="onCellSelectPop" onBeforeSelectRow="onBeforeSelectRow" 
			width="550" height="200" multiSelect="false">
		<pager rowNum="${form.maxCount}" />
		<cols>
			<col name="colSelect" width="20" sortable="false" caption="" />
			<col name="colParkingBlock" width="150" sortable="false" align="left" caption="区画番号" />
			<col name="colLendKbn" width="60" sortable="false" align="center" caption="貸与区分" />
			<col name="collendJokyo" width="60" sortable="false" align="center" caption="貸与状況" />
			<col name="colShiyosha" width="150" sortable="false" align="left" caption="使用者" />
			<col name="colBiko" width="80" sortable="false" align="left" caption="備考" />
			<col name="colParkRentalAsjust" hidden="true" />
			<col name="colParkingKanriNo" hidden="true" />
			<col name="colhdnEndDate1" hidden="true" />
			<col name="colhdnEndDate2" hidden="true" />
			<col name="colhdnEndDate3" hidden="true" />
			<col name="colhdnEndDate" hidden="true" />
			<col name="colhdnSelect"  hidden="true"  />
		</cols>
		</imui:listTable>
		<script type="text/javascript">
		(function($) {
			onBeforeSelectRow = function(rowId,e) {
				//選択可の行がクリックされた場合のみTrueにする
				// リストテーブル情報取得		                        
                      var grid = $("#resultList");
		        var rowData = grid.getRowData(rowId);
		        //選択可フラグ
		        var hdnSelect = rowData.colhdnSelect;
                      if(hdnSelect === '1'){
                      	return true;
                      }else{
                      	return false;
                      }

			}
			
			onCellSelectPop = function(rowId, iCol, cellcontent, e) {
				$("#targetRowId").val(rowId);
				$("#setName").val(rowId);
				
				// 現在の選択行を取得
				var row = $("#resultList").jqGrid('getGridParam', 'selrow');
				//nfw.common.showReserveMessage("info", "row:"+ rowId);
				// 行IDを取得
				var ids = $("#resultList").jqGrid('getDataIDs');
				for (var i = 0; i < ids.length; i++) {
					//nfw.common.showReserveMessage("info", "ids[i]:"+ ids[i]);
				    if (rowId == ids[i]){
				        break;    // 行IDが一致したので抜ける
					}
				}
				if (i < ids.length) {
				    id = i + 1;
				    var obj = document.getElementById("rbtn" + id);
				    if(obj)
				        obj.checked = true;
				}

			}

			})(jQuery);
		</script>
		<br/>	
	<div class="align-R">
		<nfwui:PopupButton id="closebtn" value="画面を閉じる" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="cancel"  tabindex="55"/>
		<nfwui:PopupButton id="selectBtn" value="選択する" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="ok" 
		 preOnClick="if(!check()){return(false)};"  tabindex="56" />
<%-- 		<imui:button id="selectBtn" name="selectBtn" value="選択" style="width:100px;" class="imui-small-button" /> --%>
		<input type="hidden" id="targetRowId" value="" />
		
	</div>

	<script type="text/javascript">
		function refreshGridData() {
			//入力内容チェック
			var map = new Object();
			map['shatakuNo'] = $("#hdnShatakuKanriNo").val();
			map['shiyosha'] = $("#shiyosha").val();
			map['parkingBiko'] = $("#parkingBiko").val();
			//map['akiParking'] =  $("#akiParking1").val();
			var element = document.getElementById( "akiParkingchk" ) ;
		
			if ( element.checked ) {
				// チェックされている
				map['akiParking'] =  "1";
			} else {
				// チェックされていない
				map['akiParking'] =  "0";
			}
			map['kaisiDate'] = $("#hdnRiyouStartDay").val();
		
			nfw.common.doAjaxAction("skf/Skf3022Sc002/searchAsync",map,true,function(data) {
				$("#resultList").jqGrid("clearGridData");
				$("#targetRowId").val("");
				var result = data.dataCount;
				// リストテーブル情報更新
				var grid = $("#resultList");
		
				 $("#resultList").jqGrid("setGridParam",{
			            data : data.listTableList,
			        }).trigger("reloadGrid");
		// 		if(result == 0){
		// 			nfw.common.showReserveMessage("warning", "検索結果がありません。抽出条件を変更してください。");
		// 			return;
		// 		}else if(result == -1){
		// 			nfw.common.showReserveMessage("error", "検索結果が100件を超えました。抽出条件を変更してください。");
		// 			return;
		// 		}
				if(result > 0){
		// 			for(var i=0; i < data.listTableList.length; i++ ){
		// 				grid.addRowData(undefined, data.listTableList[i]);
		// 			}
					var ids = $("#resultList").jqGrid('getDataIDs');
		            for(var i = 0; i < ids.length; i++) {
		                j = i + 1;
		                var rowData = grid.getRowData(ids[i]);
				        
				        var selectbool = rowData.colSelect;
				        //nfw.common.showReserveMessage("info", "sel:"+ selectbool);
				        //チェックボックス設定
				        var rbtn;
				        if(selectbool=='1'){
		                	rbtn = '<input type="radio" name="rbtn" id="rbtn' + j + '" ' +
		                            'onclick="selRow(\'' + ids[i] + '\')"/>';
		                }else{
		                	rbtn = '<input type="radio" name="rbtn" id="rbtn' + j + '" ' +
		                    'onclick="selRow(\'' + ids[i] + '\')" disabled/>';
		                }
		                grid.setRowData(ids[i], {colSelect:rbtn});
		            }
				}
				
			});
			
		};
		
		function selRow(id) {
		    if (id) {
		        // ラジオボタンの行を選択する
		        $("#resultList").jqGrid('setSelection', id);
		        $("#targetRowId").val(id);
		    }
		};
		
		function check(){
			var rowId = $("#targetRowId").val();
			if (rowId == null || rowId == "") {
				nfw.common.showReserveMessage("warning", "駐車場を選択してください");
				return false;
			}else{
				var grid = $("#resultList");
		        var rowData = grid.getRowData(rowId);
		        //JSONデータ作成
				var parkingData = {
						"parkNo": rowData.colParkingKanriNo,
						"parkBlock": rowData.colParkingBlock,
						"parkRentalAsjust": rowData.colParkRentalAsjust,
						"endDay": rowData.colhdnEndDate
				}
				//親画面に値設定(親画面に以下の非表示項目を作成する)
		 		$("#hdnParkingShienParkBlock").val(parkingData.parkBlock);
				$("#hdnParkingShienParkNo").val(parkingData.parkNo);
				$("#hdnParkingShienParkRentalAsjust").val(parkingData.parkRentalAsjust);
				$("#hdnParkingShienEndDay").val(parkingData.endDay);
				return true;
			}
		};
	</script>
</div>
</nfwui:Form>