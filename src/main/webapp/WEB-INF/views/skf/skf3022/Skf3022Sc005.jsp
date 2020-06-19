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
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<style type="text/css">
.ui-jqgrid .ui-jqgrid-bdiv {
  overflow-x:hidden; 
}
</style>
<script type="text/javascript">
	function back1() {
		var backMessage = "戻ります。よろしいですか？";
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf3022Sc005/prevPage", "OK", "キャンセル", this, true);	
	}

	// リストテーブルの貸与区分の文字色変更
	function onCellAttr(rowId,val,rawObject,cm,rdata){
		  var style;
		  switch (val) {
		  case '承認':
		      style = 'style="color:blue;"';
		      break;
		  case '未申請':
		      style = 'style="color:red;"';
		      break;
		  case '-':
		      style = 'style="color:black;"';
		      break;
		  default:
		      style = 'style="color:green;"';
	    break;
		  }
	    return style;
	}
</script>

	<!-- コンテンツエリア -->
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3022_SC005%>" />
		<input type="hidden" name="backUrl" id="backUrl" value=""/>
		<input type="hidden" name="hdnStTeijiCnt" id="hdnStTeijiCnt" value="${form.hdnStTeijiCnt}" />
		<input type="hidden" name="hdnBhTeijiCnt" id="hdnBhTeijiCnt" value="${form.hdnBhTeijiCnt}" />
		<input type="hidden" name="hdnMoveInOutCnt" id="hdnMoveInOutCnt" value="${form.hdnMoveInOutCnt}" />
		<input type="hidden" name="mailListData" id="mailListData" value="" />
		<input type="hidden" name="mailTeijiKbn" id="mailTeijiKbn" value="${form.mailTeijiKbn}" />
		<input type="hidden" name="delTeijiNo" id="delTeijiNo" value="" />
		<input type="hidden" name="delShainNo" id="delShainNo" value="" />
		<input type="hidden" name="delNyutaikyoKbn" id="delNyutaikyoKbn" value="" />
		<input type="hidden" name="delUpdateDate" id="delUpdateDate" value="" />
		<input type="hidden" name="delUpdateDateNtk" id="delUpdateDateNtk" value="" />
		<input type="hidden" name="delUpdateDateShataku" id="delUpdateDateShataku" value="" />
		<input type="hidden" name="delUpdateDateParkOne" id="delUpdateDateParkOne" value="" />
		<input type="hidden" name="delUpdateDateParkTwo" id="delUpdateDateParkTwo" value="" />
		<input type="hidden" name="delShatakuNo" id="delShatakuNo" value="" />
		<input type="hidden" name="delRoomNo" id="delRoomNo" value="" />
		<input type="hidden" name="delParkOne" id="delParkOne" value="" />
		<input type="hidden" name="delParkTwo" id="delParkTwo" value="" />
		<input type="hidden" name="hdnTeijiNo" id="hdnTeijiNo" value="" />
		<input type="hidden" name="hdnNyukyoDate" id="hdnNyukyoDate" value="" />
		<input type="hidden" name="hdnTaikyoDate" id="hdnTaikyoDate" value="" />
		<input type="hidden" name="hdnShoruikanriNo" id="hdnShoruikanriNo" value="" />
		<input type="hidden" name="hdnNyutaikyoKbn" id="hdnNyutaikyoKbn" value="" />
		<input type="hidden" name="hdnApplKbn" id="hdnApplKbn" value="" />
		<input type="hidden" name="hdnShainNoChangeFlg" id="hdnShainNoChangeFlg" value="" />
		<input type="hidden" name="searchInfoShainNo" id="searchInfoShainNo" value="${form.searchInfoShainNo}" />
		<input type="hidden" name="searchInfoShainName" id="searchInfoShainName" value="${form.searchInfoShainName}" />
		<input type="hidden" name="searchInfoShatakuName" id="searchInfoShatakuName" value="${form.searchInfoShatakuName}" />
		<input type="hidden" name="searchInfoNyutaikyoKbn" id="searchInfoNyutaikyoKbn" value="${form.searchInfoNyutaikyoKbn}" />
		<input type="hidden" name="searchInfoStJyokyo" id="searchInfoStJyokyo" value="${form.searchInfoStJyokyo}" />
		<input type="hidden" name="searchInfoStKakunin" id="searchInfoStKakunin" value="${form.searchInfoStKakunin}" />
		<input type="hidden" name="searchInfoBhJyokyo" id="searchInfoBhJyokyo" value="${form.searchInfoBhJyokyo}" />
		<input type="hidden" name="searchInfoBhKakunin" id="searchInfoBhKakunin" value="${form.searchInfoBhKakunin}" />
		<input type="hidden" name="searchInfoMoveInout" id="searchInfoMoveInout" value="${form.searchInfoMoveInout}" />
		<input type="hidden" name="hdnListSelectState" id="hdnListSelectState" value="" />
		<input type="hidden" name="hdnPageMax" id="hdnPageMax" value="${form.listTableMaxRowCount}" />
		<div class="imui-form-container-wide">
			<div class="imui-chapter-title"><h2>検索条件</h2></div>
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th>
<!-- 							<label style="width:80px;">社員番号</label> -->
							<nfwui:LabelBox id="lblShainNumber" code="<%=MessageIdConstant.SKF3022_SHAIN_NUMBER %>" />
						</th>
						<td>
<!-- 							<input class="ime-off" style="width:200px;" type="text" placeholder="例　00123456（半角）"/> -->
							<imui:textbox id="txtShainNo" name="shainNo" style="ime-mode: disabled;width:320px;" value="${f:h(form.shainNo)}" placeholder="例　00123456（半角）" maxlength="8" tabindex="3"/>
						</td>
						<th colspan="2">
<!-- 							<label style="width:80px;">入退居区分</label> -->
							<nfwui:LabelBox id="lblNyutaikyoKbn" code="<%=MessageIdConstant.SKF3022_SC005_NYUTAIKYO_KBN %>" />
						</th>
						<td>
							<imui:select id="nyutaikyoKbn" name="nyutaikyoKbn" 
									width="120px" list="${form.nyutaikyoKbnList}" tabindex="6" />
						</td>
						<th rowspan="2">
<!-- 							<label style="width:80px;">備品提示</label> -->
							<nfwui:LabelBox id="lblBihinTeiji" code="<%=MessageIdConstant.SKF3022_BIHIN_TEIJI %>" />
						</th>
						<th>
<!-- 							<label style="width:80px;">状況</label> -->
							<nfwui:LabelBox id="lblJyokyo" code="<%=MessageIdConstant.SKF3022_SC005_BIHINTEIJI_JYOKYO %>" />
						</th>
						<td style="width:20%;">
							<imui:select id="bhJyokyo" name="bhJyokyo" 
									width="120px" list="${form.bhJyokyoList}" tabindex="9" />
						</td>
					</tr>
					<tr>
						<th>
<!-- 							<label>社員氏名</label> -->
							<nfwui:LabelBox id="lblShainName" code="<%=MessageIdConstant.SKF3022_SHAIN_NAME %>" />
						</th>
						<td>
<!-- 							<input style="width:200px;" type="text" placeholder="例　中日本　太郎"/> -->
							<imui:textbox id="txtShainName" name="shainName" style="width:320px;" value="${form.shainName}" placeholder="例　中日本　太郎" maxlength="20" tabindex="4"/>
						</td>
						<th rowspan="2">
<!-- 							<label style="width:80px;">社宅提示</label> -->
							<nfwui:LabelBox id="lblShatakuTeiji" code="<%=MessageIdConstant.SKF3022_SHTAKU_TEIJI %>" />
						</th>
						<th>
<!-- 							<label style="width:80px;">状況</label> -->
							<nfwui:LabelBox id="lblStJyokyo" code="<%=MessageIdConstant.SKF3022_SC005_SHTAKUTEIJI_JYOKYO %>" />
						</th>
						<td>
							<imui:select id="stJyokyo" name="stJyokyo" 
								width="120px" list="${form.stJyokyoList}" tabindex="7" />
						</td>
						<th>
<!-- 							<label>確認督促</label> -->
							<nfwui:LabelBox id="lblBhKakunin" code="<%=MessageIdConstant.SKF3022_SC005_BIHINTEIJI_KAKUNIN %>" />
						</th>
						<td>
							<imui:select id="bhKakunin" name="bhKakunin" 
								width="120px" list="${form.bhKakuninList}" tabindex="10" />
						</td>
					</tr>
					<tr>
						<th>
<!-- 							<label>社宅名</label> -->
							<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3022_SHATAKU_NAME %>" />
						</th>
						<td>
<!-- 							<input style="width:200px;" type="text" placeholder="例　社宅名"/> -->
							<imui:textbox id="txtShatakuName" name="shatakuName" style="width:320px;" value="${form.shatakuName}" placeholder="例　社宅名" maxlength="30" tabindex="5"/>
						</td>
						<th>
<!-- 							<label>確認督促</label> -->
							<nfwui:LabelBox id="lblStKakunin" code="<%=MessageIdConstant.SKF3022_SC005_SHATAKUTEIJI_KAKUNIN %>" />
						</th>
						<td>
							<imui:select id="stKakunin" name="stKakunin" 
								width="120px" list="${form.stKakuninList}" tabindex="8" />
						</td>
						<th colspan="2">
<!-- 							<label>備品搬入搬出督促</label> -->
							<nfwui:LabelBox id="lblMoveInOut" code="<%=MessageIdConstant.SKF3022_SC005_MOVE_INOUT %>" />
						</th>
						<td>
							<imui:select id="moveInOut" name="moveInOut" 
								width="120px" list="${form.moveInOutList}" tabindex="11" />
						</td>
					</tr>
				</tbody>
			</table>
			<div class="align-L">	
				<nfwui:Button id="search" name="search" code="<%=MessageIdConstant.SKF3010_SC004_BUTTON_SEARCH %>" cssClass="imui-small-button" 
						url="skf/Skf3022Sc005/search" formId="form" tabindex="12" />
			</div>
		</div>
		<!-- 明細＆細目未満 -->
		<div class="imui-form-container-wide" >
			<!-- 明細部 -->
			
				<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
				<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						})(jQuery);
					</script>
					<div id="listTableArea">
					<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" shrinkToFit="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect" onGridComplete="gridComplete"
						multiSelect="true" data="${form.listTableData}"
						onBeforeSelectRow="onBeforeSelectRow" onSelectRow="onSelectRow" onSelectAll="onSelectAll"
						style="max-height: 800px;" tabindex="11" height="300">
						<pager rowNum="${form.listTableMaxRowCount }" />
						<cols sortable="false">
						<col name="colChkSelect" caption="督促" hidden="true"/>
						<col name="colNyutaikyoKbn" caption="入退居区分" width="50" sortable="false" align="center" wrap="true"/>
						<col name="colShainNo" caption="社員番号" width="85" sortable="false" align="left" wrap="true"/>
						<col name="colShainName" caption="社員氏名" width="95" sortable="false" align="left" wrap="true"/>
						<col name="colSinseiKbn" caption="申請区分"　width="55" sortable="false" align="center" wrap="true"/>
						<col name="colNyukyoDate" caption="入居予定日" width="85" sortable="false" align="center" wrap="true"/>
						<col name="colTaikyoDate" caption="退居予定日"  width="85" sortable="false" align="center" wrap="true"/>
						<col name="colShatakuName" caption="社宅名" width="135" sortable="false" align="left" wrap="true"/>
						<col name="colRoomNo" caption="部屋番号" width="55" sortable="false" align="left" wrap="true"/>
						<col name="colYouto" caption="用途" width="35" sortable="false" align="center" wrap="true"/>
						<col name="colStJyokyo" caption="状況" width="60" sortable="false" align="center" wrap="true" onCellAttr="onCellAttr"/>
						<col name="colStKakunin" caption="確認督促" width="85" sortable="false" align="center" wrap="true"/>
						<col name="colBhJyokyo" caption="状況" width="60" sortable="false" align="center" wrap="true" onCellAttr="onCellAttr"/>
						<col name="colBhkakunin" caption="確認督促" width="85" sortable="false" align="center" wrap="true"/>
						<col name="colMoveInOut" caption="督促" width="85" sortable="false" align="center" wrap="true"/>
						<col name="colDetail" caption="詳細" width="40" sortable="false" align="center" >
							<showIcon iconClass="im-ui-icon-common-16-update" />
						</col>
						<col name="colDelete" caption="削除" width="40" sortable="false" align="center" >
							<showIcon iconClass="im-ui-icon-common-16-trashbox" />
						</col>
						<col name="hdnTeijiNo" caption="" hidden="true"/>
						<col name="hdnShoruikanriNo" caption="" hidden="true"/>
						<col name="hdnNyushutsuBi" caption="" hidden="true"/>
						<col name="hdnShainName" caption="" hidden="true"/>
						<col name="hdnUpdateDate" caption="" hidden="true"/>
						<col name="hdnUpdateDateNtk" caption="" hidden="true"/>
						<col name="hdnShatakuNo" caption="" hidden="true"/>
						<col name="hdnRoomKanriNo" caption="" hidden="true"/>
						<col name="hdnParkNoOne" caption="" hidden="true"/>
						<col name="hdnParkNoTwo" caption="" hidden="true"/>
						<col name="hdnUpdateDateShataku" caption="" hidden="true"/>
						<col name="hdnUpdateDateParkOne" caption="" hidden="true"/>
						<col name="hdnUpdateDateParkTwo" caption="" hidden="true"/>
						<col name="hdnShainChangeFlg" caption="" hidden="true"/>
						<col name="hdnTaiyoKbn" caption="" hidden="true"/>
						<col name="hdnJssShatakuTeijiDate" caption="" hidden="true"/>
						<col name="hdnTeijiKbn" caption="" hidden="true"/>
						<col name="sameAppNoCount" caption="同一申請書類管理番号" hidden="true"/>
						<col name="hdnNyutaikyoKbnCd" caption="" hidden="true"/>
						<col name="hdnStJyokyoCd" caption="" hidden="true"/>
						<col name="hdnBhJyokyoCd" caption="" hidden="true"/>
						<col name="hdnSinseiKbnCd" caption="" hidden="true"/>
						<col name="chkSelect" caption="チェックボックス" hidden="true"/>
						
						</cols>
					</imui:listTable>

					</div>
					<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>
					<div id="sampleListTable1-pager"></div>
					<script type="text/javascript">
						(function($) {
							
							//選択行チェック
							onBeforeSelectRow = function(rowId,e) {
								//チェックボックス可かアイコン列がクリックされた場合のみTrueにする
								// リストテーブル情報取得
								var grid = $("#mainList");
								i =  $.jgrid.getCellIndex($(e.target).closest('td')[0]);
								cm = grid.getGridParam('colModel');
								var row = grid.getRowData(rowId);
								//詳細列は許可
								if(cm[i].name === 'colDetail'){
									return true;
								}
								//削除列は許可
								else if( cm[i].name === 'colDelete'){
									return true;
								}
								//他行はチェックボックス選択可のみ許可
								else if(row.chkSelect == 'false'){
									//選択不可
									return false;
								}else{
									return true;
								}
								return false;
							}
							
							
							onCellSelect = function(rowId,iCol,cellcontent,e) {
								// リストテーブル情報取得
								var grid = $("#mainList");
								// 行番号から選択した行の情報を取得
								var row = grid.getRowData(rowId);

								if ($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
									//連携パラメータ
 									var hdnTeijiNo = row.hdnTeijiNo;
 									var hdnNyukyoDate = row.colNyukyoDate;
 									var hdnTaikyoDate = row.colTaikyoDate;
 									var hdnShoruikanriNo = row.hdnShoruikanriNo;
 									var hdnNyutaikyoKbn = row.hdnNyutaikyoKbnCd;
 									var hdnApplKbn = row.hdnSinseiKbnCd;
 									var hdnShainNoChangeFlg = row.hdnShainChangeFlg;
									
 									$("#hdnTeijiNo").val(hdnTeijiNo);
 									$("#hdnNyukyoDate").val(hdnNyukyoDate);
 									$("#hdnTaikyoDate").val(hdnTaikyoDate);
 									$("#hdnShoruikanriNo").val(hdnShoruikanriNo);
 									$("#hdnNyutaikyoKbn").val(hdnNyutaikyoKbn);
 									$("#hdnApplKbn").val(hdnApplKbn);
 									$("#hdnShainNoChangeFlg").val(hdnShainNoChangeFlg);
 									
 									$('#mainList').setSelection(rowId,false);
 									
 									if(row.sameAppNoCount != ""){
 										//同一申請書類管理番号存在する場合メッセージ表示
 	 									var dialogMessage = row.sameAppNoCount;
 	 									nfw.common.confirmPopup(dialogMessage, "", "form", "skf/Skf3022Sc006/init", "OK", "キャンセル", this, true);

 									}else{
 										
 										$("#backUrl").val("skf/Skf3022Sc005/init?SKF3022_SC005&tokenCheck=0");
 										// サービス呼び出し
 	 									url = "skf/Skf3022Sc006/init";
 										nfw.common.submitForm("form", url);
 									}
								}else if($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')) {
 									// 削除パラメータ
 									var delTeijiNo = row.hdnTeijiNo;
 									var delShainNo = row.colShainNo;
 									var delNyutaikyoKbn = row.hdnNyutaikyoKbnCd;
 									var delUpdateDate = row.hdnUpdateDate;
 									var delUpdateDateNtk = row.hdnUpdateDateNtk;
 									var delUpdateDateShataku = row.hdnUpdateDateShataku;
 									var delUpdateDateParkOne = row.hdnUpdateDateParkOne;
 									var delUpdateDateParkTwo = row.hdnUpdateDateParkTwo;
 									var delShatakuNo = row.hdnShatakuNo;
 									var delRoomNo = row.hdnRoomKanriNo;
 									var delParkOne = row.hdnParkNoOne;
 									var delParkTwo = row.hdnParkNoTwo;
									
 									$("#delTeijiNo").val(delTeijiNo);
 									$("#delShainNo").val(delShainNo);
 									$("#delNyutaikyoKbn").val(delNyutaikyoKbn);
 									$("#delUpdateDate").val(delUpdateDate);
 									$("#delUpdateDateNtk").val(delUpdateDateNtk);
 									$("#delUpdateDateShataku").val(delUpdateDateShataku);
 									$("#delUpdateDateParkOne").val(delUpdateDateParkOne);
 									$("#delUpdateDateParkTwo").val(delUpdateDateParkTwo);
 									$("#delShatakuNo").val(delShatakuNo);
 									$("#delRoomNo").val(delRoomNo);
 									$("#delParkOne").val(delParkOne);
 									$("#delParkTwo").val(delParkTwo);
 									
 									$('#mainList').setSelection(rowId,false);
 									
									var dialogTitle = "確認";
									var dialogMessage = "提示データ（"+row.colShainName+"）を削除します。よろしいですか？";//I-SKF-3022
									nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3022Sc005/delete", "OK", "キャンセル", this, true);

								}
								else if($(cellcontent).hasClass('cbox')){
									//チェックボックス

 								}
								var prop = $('#allListCheck').prop('checked');
								if(prop){
									//督促チェックボックスがONの場合、OFFにする
									$('#allListCheck').prop('checked',false);
								}
							}
							
							onSelectRow = function(rowid,e){
								
								changeButtonState();
							}
							
							
							//督促ボタン状態変更
							changeButtonState = function(){
								var TeijiKbnCount1 = 0;     // 提示区分が1の件数
								var TeijiKbnCount2 = 0;     // 提示区分が2の件数
								var TeijiKbnCount3 = 0;     // 提示区分が3の件数
							
								if($('#hdnListSelectState').val() ==="all"){
									//全選択処理中は実行しない
									return;
								}
								
								var grid = $('#mainList');
								var rows = grid.getRowData(); //get data
								var selrows = $('#mainList').getGridParam('selarrrow');
								for (var i = 0; i < selrows.length; i++)
								{
									// 選択行
									var row = $('#mainList').getRowData(selrows[i]);
									var teijiKbn = row.hdnTeijiKbn;
									if(teijiKbn == "1"){
										TeijiKbnCount1 += 1;
									}else if(teijiKbn == "2"){
										TeijiKbnCount2 += 1;
									}if(teijiKbn == "3"){
										TeijiKbnCount3 += 1;
									}
								}
								
								if(TeijiKbnCount1 > 0){
									jQuery('#btnShatakuTeiji').prop("disabled",false);
									$('#btnShatakuTeiji').removeClass("imui-disabled-button");
									$('#hdnStTeijiCnt').val(TeijiKbnCount1);
								}else{
									jQuery('#btnShatakuTeiji').prop("disabled",true);
									$('#btnShatakuTeiji').addClass("imui-disabled-button");
									$('#hdnStTeijiCnt').val(TeijiKbnCount1);
								}
								if(TeijiKbnCount2 > 0){
									$('#btnBihinTeiji').prop("disabled",false);
									$('#btnBihinTeiji').removeClass("imui-disabled-button");
									$('#hdnBhTeijiCnt').val(TeijiKbnCount2);
								}else{
									$('#btnBihinTeiji').prop("disabled",true);
									$('#btnBihinTeiji').addClass("imui-disabled-button");
									$('#hdnBhTeijiCnt').val(TeijiKbnCount2);
								}
								if(TeijiKbnCount3 > 0){
									$('#btnBihinInOut').prop("disabled",false);
									$('#btnBihinInOut').removeClass("imui-disabled-button");
									$('#hdnMoveInOutCnt').val(TeijiKbnCount3);
								}else{
									$('#btnBihinInOut').prop("disabled",true);
									$('#btnBihinInOut').addClass("imui-disabled-button");
									$('#hdnMoveInOutCnt').val(TeijiKbnCount3);
								}
							}
							
						})(jQuery);
						
						//督促チェックボックス処理
						function allCheckBoxSelect(e){
							//チェックボックス状態取得
							var prop = $('#allListCheck').prop('checked');
							//リスト選択全解除
							$("#mainList").jqGrid('resetSelection');
							//選択処理状態all
							$('#hdnListSelectState').val("all");
							//選択状態で選択処理
							if(prop){
								var grid = $('#mainList');
								var rows = grid.getRowData(); //get data
								//nfw.common.showReserveMessage("warning", "選択");
								for (var idx in rows) {
									var row = rows[idx];
									var page = $('#mainList').getGridParam('page');
									var pagem = $('#hdnPageMax').val();
									var pagemax =  Number(pagem);
									var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
									if(row.chkSelect == 'true'){
										$('#mainList').setSelection(rowidx,true);
									}
								}
							}
							$('#hdnListSelectState').val("solo");
							changeButtonState();
							
						}
						 
						//リスト生成後イベント
						 function gridComplete(){
							var grid = $('#mainList');
							var rows = grid.getRowData(); //get data
							for (var idx in rows) {
								var row = rows[idx];
								var page = $('#mainList').getGridParam('page');
								var pagem = $('#hdnPageMax').val();
								var pagemax =  Number(pagem);
								var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
								if(row.chkSelect == 'false'){
									//チェックボックスを非活性にする
									var cbsdis = $("tr#"+rowidx+".jqgrow > td > input.cbox", grid);
									if (cbsdis.length != 0) {
										cbsdis.attr("disabled", true);
							        }
								}
							}
							

							var $list = $('#mainList');
							// 項目に指定した幅を設定する
							//var $col = $('#mainList_cb');
							//$col[0].style.width = "35px";
							// ヘッダ項目に指定した幅を設定する
							$(".jqgfirstrow > td")[1].style.width = "25px";
							// JqGridの項目の幅情報の上書き.
							var befHtml = $list[0].grid.headers[1].el.innerHTML;
							$list[0].grid.headers[1].el.innerHTML="<span>督促<br /><input type=\"checkbox\" name=\"listCheck\" id=\"allListCheck\" onclick=\"allCheckBoxSelect(event)\"></span>";
							$list[0].grid.headers[1].el.style.width="25px";
							$list[0].grid.headers[1].el.style.textAlign = "center";
							$list[0].grid.headers[3].el.innerText = "入退居\n区分";
							$list[0].grid.headers[6].el.innerText = "申請\n区分";
							$list[0].grid.headers[12].el.innerText = "社宅提示\n状況";
							$list[0].grid.headers[13].el.innerText = "社宅提示\n確認督促";
							$list[0].grid.headers[14].el.innerText = "備品提示\n状況";
							$list[0].grid.headers[15].el.innerText = "備品提示\n確認督促";
							$list[0].grid.headers[16].el.innerText = "搬入搬出\n督促";
							$list[0].grid.headers[3].el.style.textAlign = "center";
 						    $list[0].grid.headers[6].el.style.textAlign = "center";
 							$list[0].grid.headers[12].el.style.textAlign = "center";
 							$list[0].grid.headers[13].el.style.textAlign = "center";
 							$list[0].grid.headers[14].el.style.textAlign = "center";
 							$list[0].grid.headers[15].el.style.textAlign = "center";
 							$list[0].grid.headers[16].el.style.textAlign = "center";
 							$list[0].grid.headers[17].el.style.textAlign = "center";
 							$list[0].grid.headers[18].el.style.textAlign = "center";

						    changeButtonState();
						};
						

						
						//メール送信情報生成
						function setDunningMailInfo(teijiKbn){
							//選択行
							var index = 0;
							var mailList=[];
							var selrows = $('#mainList').getGridParam('selarrrow');
							for (var i = 0; i < selrows.length; i++)
							{
								// 選択行
								var row = $('#mainList').getRowData(selrows[i]);
								var hdnTeijiKbn = row.hdnTeijiKbn;
								if(hdnTeijiKbn == teijiKbn){
									//対象提示区分と一致
									var tempStr = [];
									var shainNo = row.colShainNo;
									var shainName = row.colShainName;
									var teijiNo = row.hdnTeijiNo;
									var nyutaikyoKbn = row.hdnNyutaikyoKbnCd;
									var updateDate = row.hdnUpdateDate;
									var shinseiShoruiNo = row.hdnShoruikanriNo
									var bihinTeijiJokyo = row.hdnBhJyokyoCd;
									var jssShatakuTeijiDate = row.hdnJssShatakuTeijiDate
									
									tempStr.push(shainNo);
									tempStr.push(shainName);
									tempStr.push(teijiNo);
									tempStr.push(nyutaikyoKbn);
									tempStr.push(updateDate);
									tempStr.push(shinseiShoruiNo);
									tempStr.push(bihinTeijiJokyo);
									tempStr.push(jssShatakuTeijiDate);
									
									mailList.push(tempStr.join(","));		//配列で格納
								}
							}
							//送信データ設定
							$("#mailListData").val(mailList.join(";"));
							$("#mailTeijiKbn").val(teijiKbn);
							
							return true;
						};
					</script>	

				<script type="text/javascript">
				(function($) {
					// 画面表示時に定義される処理
				    $(document).ready(function(){
						$(".imui-toolbar-icon").removeAttr("onclick");
						$(".imui-toolbar-icon").click(function(e) {
							back1();
						});
				    	//リサイズ時イベント
				    	$(window).bind('resize', function(){
				    		$('#mainList').setGridWidth($('#listTableArea').width(), true);	
				    	}).trigger('resize');
				    				
				    });
					
				})(jQuery);
				</script>
			
					<br />
			<div class="align-R">				
				<nfwui:ConfirmButton id="btnShatakuTeiji" name="btnShatakuTeiji" 
							code="<%=MessageIdConstant.SKF3022_SC005_ST_TEIJI_KAKUNIN%>"  
 							cssStyle="width:200px;" cssClass="imui-medium-button" 
							formId="form" disabled="${form.btnShatakuTeijiDisabled}"
 							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>"  
 							message="<%= MessageIdConstant.I_SKF_3023 %>"  
 							preOnclick="if(!setDunningMailInfo(1)){retrun(false)};" 
 							url="skf/Skf3022Sc005/SendMail" tabindex="13"/> 
				<nfwui:ConfirmButton id="btnBihinTeiji" name="btnBihinTeiji" 
							code="<%=MessageIdConstant.SKF3022_SC005_BH_TEIJI_KAKUNIN%>"  
							cssStyle="width:200px;" cssClass="imui-medium-button"
							formId="form" disabled="${form.btnBihinTeijiDisabled}"
							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>" 
							message="<%= MessageIdConstant.I_SKF_3024 %>" 
							preOnclick="if(!setDunningMailInfo(2)){retrun(false)};"
							url="skf/Skf3022Sc005/SendMail" tabindex="14"/>
				<nfwui:ConfirmButton id="btnBihinInOut" name="btnBihinInOut" 
							code="<%=MessageIdConstant.SKF3022_SC005_BTN_MOVE_INOUT%>"  
							cssStyle="width:150px;" cssClass="imui-medium-button"
							formId="form" disabled="${form.btnBihinInOutDisabled}"
							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>" 
							message="<%= MessageIdConstant.I_SKF_3025 %>" 
							preOnclick="if(!setDunningMailInfo(3)){retrun(false)};"
							url="skf/Skf3022Sc005/SendMail" tabindex="15"/>
			</div>

		</div>

	</div>
	</nfwui:Form>
<!-- コンテンツエリア　ここまで -->