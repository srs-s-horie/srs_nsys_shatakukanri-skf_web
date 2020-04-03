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

<script src="scripts/skf/skfCommon.js"></script>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>
<script type="text/javascript">
function back1() {
	var url="skf/Skf1010Sc001/init?SKF1010_SC001&tokenCheck=0"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
}

//リストテーブルの入退居予定作成区分の文字色変更
function onCellAttr(rowId,val,rawObject,cm,rdata){
	  var style;
	  switch (val) {
	  case '作成済':
	      style = 'style="color:blue;"';
	      break;
	  case '未作成':
	      style = 'style="color:red;"';
	      break;	  
	  default:
	      style = 'style="color:black;"';
    break;
	  }
    return style;
}

(function($) {
	/*
	jQuery(document).on("focus click", "input,textarea", function() {
		$(this).select();
		return false;
	});
	*/
	
	onGridComplete = function(rowId,iCol,cellcontent,e) {
		var $list = $('#mainList');
		$list[0].grid.headers[12].el.innerText = "入退去予定\n作成区分";
		$list[0].grid.headers[12].el.style.textAlign = "center";

		// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
		/*
	   	document.getElementById("txtShainNo").addEventListener('click', function(){
	   		$(this).select();
	   		return false;
	   	}, false);    	
		document.getElementById("txtShinShozoku").addEventListener('click', function(){
	   		$(this).select();
	   		return false;
	   	}, false);    	
		document.getElementById("txtShainMei").addEventListener('click', function(){
	   		$(this).select();
	   		return false;
	   	}, false);    	
		document.getElementById("txtGenShozoku").addEventListener('click', function(){
	   		$(this).select();
	   		return false;
	   	}, false);    	
		document.getElementById("txtBiko").addEventListener('click', function(){
	   		$(this).select();
	   		return false;
	   	}, false);    	
		*/
	}
	
	
	onCellSelect = function(rowId,iCol,cellcontent,e) {
		// リストテーブル情報取得
		var grid = $("#mainList");
		// 行番号から選択した行の情報を取得
		var row = grid.getRowData(rowId);
		// col14：社員番号
		var shainNo = row.col4;									

		// 入居
		$("#hdnRowNyukyo").val(row.col1);
		// 退居
		$("#hdnRowTaikyo").val(row.col2);
		// 変更
		$("#hdnRowHenko").val(row.col3);
		// 社員番号
		$("#hdnRowShainNo").val(row.col4);
		// 社員氏名
		$("#hdnRowShainName").val(row.col5);
		// 等級
		$("#hdnRowTokyu").val(row.col6);
		// 年齢
		$("#hdnRowAge").val(row.col7);
		// 新所属
		$("#hdnRowNewAffiliation").val(row.col8);
		// 現所属
		$("#hdnRowNowAffiliation").val(row.col9);
		// 備考
		$("#hdnRowBiko").val(row.col10);
		// 取込日
		$("#hdnRowTakingDate").val(row.col11);
		// 入退居予定作成区分
		$("#hdnRowNyutaikyoKbn").val(row.col12);
		// 更新日時
		$("#hdnRowUpdateDate").val(row.col16);
		
		$("#sendShainNo").val(shainNo);									
		if ($(cellcontent).hasClass('im-smart-icon-common-16-information')) {
			// 現社宅ボタン押下
			var url = "/imart/skf/Skf3020Sc001/init";
			// ― テスト用URL
			//var url = "/imart/skf/Skf3020Sc004/init";
			//$("#form2").attr("action", url);
			//$("#form2").attr("target", "hoge");
			//$("#form2").submit();
			
			document.getElementById('genshataku').click();
			
			//var sendArguments = new Array(row.col4);
			//window.showModalDialog(url,sendArguments,"top=Number((window.screen.height-650)/2);left=Number((window.screen.width-550)/2);dialogWidth=580px;dialogHeight=600px; menubar=no;toolbar=no;resizable=yes;location=no;status=no");			
			//window.showModalDialog(url,$("#form2"),"top=Number((window.screen.height-650)/2);left=Number((window.screen.width-550)/2);dialogWidth=580px;dialogHeight=600px; menubar=no;toolbar=no;resizable=yes;location=no;status=no");			
			
		}else if($(cellcontent).hasClass('im-ui-icon-common-16-update')){
			// 詳細ボタン押下
			
			var formId= "form2";
			var url = "skf/Skf3020Sc005/init";
			nfw.common.submitForm(formId, url);			
			
			//var url = "skf/Skf3020Sc005/init";
			//$("#form2").attr("action", url);
			//$("#form2").submit();								
		}else if($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')){
			// 削除ボタン押下
			dialogTitle = "確認";
			dialogMessage = "削除します。よろしいですか？";
			var url = "skf/Skf3020Sc004/delete";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form2", url, "ok", "キャンセル", this, true);
		}else{
			// 何もしない
		}
	}

	$("span .im-ui-icon-common-16-update").mouseover(
			function(e) {
				$(this).css("cursor","pointer");
			}).mouseleave(
			function(e) {
				$(this).css("cursor","default");
			}
			);
	
	// 画面表示時に定義される処理
	$(document).ready(function(){
		
		document.getElementById('txtShainNo').focus();
		
		$(window).bind('resize', function(){			
			$('#mainList').setGridWidth($('#listTableArea').width(), true);		
		}).trigger('resize');			
		
		// 下部ボタン押下時のイベント
		preButtonEvent = function (mode) {
			var dialogTitle = "";
			var dialogMessage = "";
			var url = "";
			var grid = null;
			var row = null;
			var id = null;
			var shatakuKbn = null;

			switch (mode) {
				// 仮社員番号のデータ削除
				case 0:
					dialogTitle = "確認";
					dialogMessage = "仮社員番号の転任者調書データを一括削除します。よろしいですか？";
					url = "skf/Skf3020Sc004/shainDelete";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
					break;
				// 転任者調書取込
				case 1:
					// 転入者調書取込画面（SKF3020_SC002）
					$("#prePageId").val("Skf3020Sc004");
					var formId= "form";
					url = "skf/Skf3020Sc002/init";
					nfw.common.submitForm(formId, url);					
					
					//url = "skf/Skf3020Sc002/init";
					//$("#form").attr("action", url);
					//$("#form").submit();
					break;
				// 新規
				case 2:
					// 転任者登録画面（SKF3020_SC005）
					$("#prePageId").val("Skf3020Sc004");
					var formId= "form";
					url = "skf/Skf3020Sc005/init";
					nfw.common.submitForm(formId, url);					

					//url = "skf/Skf3020Sc005/init";
					//$("#form").attr("action", url);
					//$("#form").submit();
					break;
				// 登録
				case 3:
					dialogTitle = "登録";
					dialogMessage = "入居・退居情報を更新し、入退居予定データを作成します。よろしいですか？";
					url = "skf/Skf3020Sc004/regist";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
					break;
				default:
					nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
					break;
			};
		}
	});
	
	
})(jQuery);

</script>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">

	<input type="hidden" name="prePageId" id="prePageId" value="" />
	<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo}" />
	<input type="hidden" name="hdnShainName" id="hdnShainName" value="${form.hdnShainName}" />
	<input type="hidden" name="hdnNyukyo" id="hdnNyukyo" value="${form.hdnNyukyo}" />
	<input type="hidden" name="hdnTaikyo" id="hdnTaikyo" value="${form.hdnTaikyo}" />
	<input type="hidden" name="hdnHenko" id="hdnHenko" value="${form.hdnHenko}" />
	<input type="hidden" name="hdnGenShataku" id="hdnGenShataku" value="${form.hdnGenShataku}" />
	<input type="hidden" name="hdnGenShozoku" id="hdnGenShozoku" value="${form.hdnGenShozoku}" />
	<input type="hidden" name="hdnShinShozoku" id="hdnShinShozoku" value="${form.hdnShinShozoku}" />
	<input type="hidden" name="hdnNyutaikyoYoteiSakuseiKubun" id="hdnNyutaikyoYoteiSakuseiKubun" value="${form.hdnNyutaikyoYoteiSakuseiKubun}" />
	<input type="hidden" name="hdnBiko" id="hdnBiko" value="${form.hdnBiko}" />
	
	<div style="width:100%;" >
		<div class="imui-form-container-wide">
			<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<nfwui:Table use="search">
				<tbody>
					<tr>
						<th style="width: 8%;">
							<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF3020_SC004_SHAIN_NUMBER %>" />
						</th>
						<td>
							<imui:textbox id="txtShainNo" name="shainNo" style="ime-mode: disabled;width:150px;" placeholder="例　00123456（半角）" value="${f:h(form.shainNo)}" tabindex="3" maxlength="8"/>         
						</td>
						<th style="width: 8%;">
							<nfwui:LabelBox id="lblNyukyoTaikyo" code="<%=MessageIdConstant.SKF3020_SC004_NYUKYO_TAIKYO %>" />
						</th>
							
						<td style="width: 16%;">
						<!--  
	                          --> 
						 <nfwui:CheckBoxGroupTag id="nyukyo">                              	
	                           	<nfwui:CheckBox id="nyukyo" name="nyukyo" value="1" label="入居" tabindex="5"/>&nbsp;
	 					 </nfwui:CheckBoxGroupTag>
						 <nfwui:CheckBoxGroupTag id="taikyo">                              	
	                           	<nfwui:CheckBox id="taikyo" name="taikyo" value="1" label="退居" tabindex="6"/>&nbsp;
	 					 </nfwui:CheckBoxGroupTag>
						 <nfwui:CheckBoxGroupTag id="henko">                              	
	                           	<nfwui:CheckBox id="henko" name="henko" value="1" label="変更" tabindex="7"/>
	 					 </nfwui:CheckBoxGroupTag>
						</td>
						<th style="width: 6%;">
							<nfwui:LabelBox id="lblShinShozoku" code="<%=MessageIdConstant.SKF3020_SC004_SHIN_SHOZOKU %>" />
						</th>
						<td>
							<imui:textbox id="txtShinShozoku" name="shinShozoku" style="width:155px;" placeholder="例 名古屋支社" value="${form.shinShozoku}" tabindex="9" maxlength="192"/>
						</td>
						<th style="width: 12%;">
							<nfwui:LabelBox id="lblNyutaikyoYoteiSakuseiKubun" code="<%=MessageIdConstant.SKF3020_SC004_YOTEI_SAKUSEI %>" />
						</th>
						<td>
							<imui:select id="nyutaikyoYoteiSakuseiKubun" name="nyutaikyoYoteiSakuseiKubun" 
								width="80px" list="${form.yoteiSakuseiList}" tabindex="11" />
						</td>
					</tr>
					<tr>
						<th>
							<nfwui:LabelBox id="lblShainMei" code="<%=MessageIdConstant.SKF3020_SC004_SHAIN_NAME %>" />
						</th>
						<td>
							<imui:textbox id="txtShainMei" name="shainName" style="width:150px;" placeholder="例　中日本　太郎" value="${form.shainName}" tabindex="4" maxlength="20"/>
						</td>
						<th>
							<nfwui:LabelBox id="lblGenShataku" code="<%=MessageIdConstant.SKF3020_SC004_GEN_SHATAKU %>" />
						</th>
						<td>
							<imui:select id="genShatakuKubun" name="genShatakuKubun" 
								width="80px" list="${form.genShatakuKubunList}" tabindex="8" />
						</td>
						<th>
							<nfwui:LabelBox id="lblGenShozoku" code="<%=MessageIdConstant.SKF3020_SC004_GEN_SHOZOKU %>" />
						</th>
						<td>
							<imui:textbox id="txtGenShozoku" name="genShozoku" style="width:155px;" placeholder="例 名古屋支社" value="${form.genShozoku}" tabindex="10" maxlength="192"/>			
						</td>
						<th>
							<nfwui:LabelBox id="lblBiko" code="<%=MessageIdConstant.SKF3020_SC004_BIKO %>" />
						</th>
						<td colspan="2">
							<imui:textbox id="txtBiko" name="biko" style="width:250px;" value="${form.biko}" tabindex="12"  maxlength="100"/>
						</td>
					</tr>
				</tbody>
				</nfwui:Table>

			<div class="align-L">	
				<nfwui:Button id="search" name="search" code="<%=MessageIdConstant.SKF3020_SC004_BUTTON_SEARCH %>" cssClass="imui-small-button" 
					url="skf/Skf3020Sc004/search" formId="form" tabindex="13" />
			</div>
		</div>
		<!-- 明細＆細目未満 -->
		<div class="imui-form-container-wide">
			<!-- 明細部 -->
				<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
				<script type="text/javascript">
					(function($){
					$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
					})(jQuery);
				</script>
				<div id="listTableArea">
				<nfwui:CheckBoxGroupTag id="nyukyoChkVal">
				<nfwui:CheckBoxGroupTag id="taikyoChkVal">
				<nfwui:CheckBoxGroupTag id="henkouChkVal">
					<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect" onGridComplete="onGridComplete"
						multiSelect="false" data="${form.listTableData }"
						 height="400" maxHeight="400" rowNumWidth="35">
						<pager rowNum="${form.listTableMaxRowCount }"/>
						<cols sortable="false">
							<col name="col1" caption="入居" width="35" sortable="false" align="center" tabindex="14"/>
							<col name="col2" caption="退居" width="35" sortable="false" align="center" tabindex="15"/>
							<col name="col3" caption="変更" width="35" sortable="false" align="center" tabindex="16"/>
							<col name="col4" caption="社員番号" width="85" sortable="false" wrap="true"/>
							<col name="col5" caption="社員氏名" width="100" sortable="false" wrap="true"/>
							<col name="col6" caption="等級" width="35" sortable="false" wrap="true"/>
							<col name="col7" caption="年齢" width="35" sortable="false" align="right" wrap="true"/>
							<col name="col8" caption="新所属" width="185" sortable="false" wrap="true"/>
							<col name="col9" caption="現所属" width="185" sortable="false" wrap="true" />
							<col name="col10" caption="備考" width="115" sortable="false" wrap="true" />
							<col name="col11" caption="取込日" width="90" sortable="false" align="center" wrap="true"/>
							<col name="col12" caption="入退居予定作成区分" width="80" sortable="false" align="center" onCellAttr="onCellAttr" wrap="true"/>
							<!-- 
							<col name="col13" caption="現社宅" width="75" sortable="false" align="center" tabindex="15"/>
							 -->
							<col name="col13" caption="現社宅" width="46" sortable="false" align="center" tabindex="17">
								<showIcon iconClass="im-smart-icon-common-16-information" align="center" />
							</col>
							<!-- 
							<col name="col14" caption="詳細" width="70" sortable="false" align="center" tabindex="16"/>
							 -->
							<col name="col14" caption="詳細" width="45" sortable="false" align="center" tabindex="18">
								<showIcon iconClass="im-ui-icon-common-16-update" align="center" />
							</col>
							<!-- 
							<col name="col15" caption="削除" width="70" sortable="false" align="center" tabindex="17"/>
							 -->
							<col name="col15" caption="削除" width="45" sortable="false" align="center" tabindex="19">
								<showIcon iconClass="im-ui-icon-common-16-trashbox" align="center" />
							</col>
							<col name="col16" caption="更新日時" hidden="true" />
							<col name="col17" caption="入居フラグ(取得値)" hidden="true" />
							<col name="col18" caption="退居フラグ(取得値)" hidden="true" />
							<col name="col19" caption="変更フラグ(取得値)" hidden="true" />
						</cols>
					</imui:listTable>
				</nfwui:CheckBoxGroupTag>
				</nfwui:CheckBoxGroupTag>
				</nfwui:CheckBoxGroupTag>
				</div>
				<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>
	
				<div id="sampleListTable1-pager"></div>
			<br />
			<div class="align-R">
				<!-- 現社宅照会表示ボタン（非表示） -->
				<nfwui:PopupButton id="genshataku" style="visibility:hidden" value="a" cssClass="imui-medium-button" modalMode="true" popupWidth="580" popupHeight="650" parameter="hdnRowShainNo:hdnRowShainNo" screenUrl="skf/Skf3020Sc001/init" use="popup" />				
				<!-- 仮社員番号のデータ削除 ボタン -->
				<imui:button id="delete" name="delete" value="仮社員番号のデータ削除" class="imui-medium-button" onclick="preButtonEvent(0)" tabindex="20" />
				<!-- 転入者取込 ボタン -->
				<imui:button id="import" name="import" value="転入者調書取込" class="imui-medium-button" onclick="preButtonEvent(1)" tabindex="21" />
				<!-- 新規 ボタン -->
				<imui:button id="new" name="new" value="新規" class="imui-medium-button" onclick="preButtonEvent(2)" tabindex="22" />
				<!-- 登録 ボタン -->
				<imui:button id="regist" name="regist" value="登録" class="imui-medium-button" onclick="preButtonEvent(3)" tabindex="23" />
			</div>

		</div>
				
	</div>
</nfwui:Form>
	
<!-- 仮社員番号のデータ削除、転入者取込、新規、登録 -->
<br />
<div class="align-R">
	<nfwui:Form id="form2" name="form2" >
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3020_SC004 %>" />
		<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo}" />
		<input type="hidden" name="hdnShainName" id="hdnShainName" value="${form.hdnShainName}" />
		<input type="hidden" name="hdnNyukyo" id="hdnNyukyo" value="${form.hdnNyukyo}" />
		<input type="hidden" name="hdnTaikyo" id="hdnTaikyo" value="${form.hdnTaikyo}" />
		<input type="hidden" name="hdnHenko" id="hdnHenko" value="${form.hdnHenko}" />
		<input type="hidden" name="hdnGenShataku" id="hdnGenShataku" value="${form.hdnGenShataku}" />
		<input type="hidden" name="hdnGenShozoku" id="hdnGenShozoku" value="${form.hdnGenShozoku}" />
		<input type="hidden" name="hdnShinShozoku" id="hdnShinShozoku" value="${form.hdnShinShozoku}" />
		<input type="hidden" name="hdnNyutaikyoYoteiSakuseiKubun" id="hdnNyutaikyoYoteiSakuseiKubun" value="${form.hdnNyutaikyoYoteiSakuseiKubun}" />
		<input type="hidden" name="hdnBiko" id="hdnBiko" value="${form.hdnBiko}" />

		<!-- 選択行 -->
		<!-- 選択行:入居 -->
		<input type="hidden" name="hdnRowNyukyo" id="hdnRowNyukyo" value="" />
		<!-- 選択行:退居 -->
		<input type="hidden" name="hdnRowTaikyo" id="hdnRowTaikyo" value="" />
		<!-- 選択行:変更 -->
		<input type="hidden" name="hdnRowHenko" id="hdnRowHenko" value="" />
		<!-- 選択行:社員番号 -->
		<input type="hidden" name="hdnRowShainNo" id="hdnRowShainNo" value="" />
		<!-- 選択行:社員氏名 -->
		<input type="hidden" name="hdnRowShainName" id="hdnRowShainName" value="" />
		<!-- 選択行:等級 -->
		<input type="hidden" name="hdnRowTokyu" id="hdnRowTokyu" value="" />
		<!-- 選択行:年齢 -->
		<input type="hidden" name="hdnRowAge" id="hdnRowAge" value="" />
		<!-- 選択行:新所属 -->
		<input type="hidden" name="hdnRowNewAffiliation" id="hdnRowNewAffiliation" value="" />
		<!-- 選択行:現所属 -->
		<input type="hidden" name="hdnRowNowAffiliation" id="hdnRowNowAffiliation" value="" />
		<!-- 選択行:備考 -->
		<input type="hidden" name="hdnRowBiko" id="hdnRowBiko" value="" />
		<!-- 選択行:取込日 -->
		<input type="hidden" name="hdnRowTakingDate" id="hdnRowTakingDate" value="" />
		<!-- 選択行:入退居予定作成区分 -->
		<input type="hidden" name="hdnRowNyutaikyoKbn" id="hdnRowNyutaikyoKbn" value="" />
		<!-- 選択行:更新日時 -->
		<input type="hidden" name="hdnRowUpdateDate" id="hdnRowUpdateDate" value="" />
		
	</nfwui:Form>
</div>
	
<!-- コンテンツエリア　ここまで -->