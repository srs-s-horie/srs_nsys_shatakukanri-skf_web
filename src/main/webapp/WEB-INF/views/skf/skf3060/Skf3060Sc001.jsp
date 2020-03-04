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

</style>
<script type="text/javascript">
(function($) {
	
	// チェックボックスの前状態保持リスト
	let checkBoxBeforStatus = [];
	
	// 検索結果一覧に表示する最大行数
	var maxRowCount = 0;
	
    // jqGrid読み込み時のイベント
    onGridComplete = function(rowId, iCol, cellContent, e) {

    	// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
    	/*
    	document.getElementById("txtShainNo").addEventListener('click', function(){
    		$(this).select();
    		return false;
    	}, false);
    	*/

    	// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
    	/*
    	document.getElementById("txtName").addEventListener('click', function(){
    		$(this).select();
    		return false;
    	}, false);    	
    	*/
    	
    	
    	// ヘッダ行を変更
    	var $list = $('#mainList');
    	$list[0].grid.headers[1].el.innerHTML = "メール\n" + "<div id=\"jqgh_mainList_cb\"><input class=\"cbox\" id=\"cb_mainList\" role=\"checkbox\" type=\"checkbox\" onchange=\"onSelectCheckBoxAll()\"><span class=\"s-ico\" style=\"display: none;\"><span class=\"ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr\" sort=\"asc\"></span><span class=\"ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr\" sort=\"desc\"></span></span></div>";
    	$list[0].grid.headers[1].el.style.textAlign = "center";
    	$('#mainList_cb').width("40px");
    	// データ行のチェックボックス列の幅を設定
		$list[0].tBodies[0].rows[0].children[1].style.width = "41px";

    	// 現在のページ番号
		var pageNo = $('#mainList').getGridParam('page'); 
    	
    	// 検索結果一覧に表示する最大行数を再設定（Serviceからもらった値で置き換える）
    	//alert($("#mainList").getGridParam("rowNum"));
    	maxRowCount = $("#mainList").getGridParam("rowNum");
    	
		// 全データ行の設定
		var grid = $("#mainList");					
		var datas = grid.getGridParam("data");//全行
		if( datas.length > 0 )
		{	
			var row2 = grid.getRowData(datas);
			
			// ページング範囲設定
			var iMin = 0;
			var iMax = 0;
			if(pageNo == 1){
				if(datas.length > maxRowCount){
					iMin = 0;
					iMax = maxRowCount;
				}else{
					iMin = 0;
					iMax = datas.length ;
				}
			}else{
				// 2ページ以降
				var pageNoCalc = pageNo - 1;
				if(datas.length > (maxRowCount * pageNo)){
					// 指定ページよりもデータ数の方が多い
					iMin = maxRowCount * pageNoCalc;
					iMax = maxRowCount * pageNo;
				}else{
					iMin = maxRowCount * pageNoCalc;
					iMax = datas.length ;
				}
			}
			
			for( var i=iMin; i<iMax; ++i ){

			//for( var i=0; i<datas.length; ++i ){

				// チェックボックスの前状態保持リストをすべて「False」へ
				checkBoxBeforStatus[i] = "false";
				// 行データの取り出し
				var row = datas[i];
				var rowNo = i + 1;
				let targetName = "jqg_mainList_" + rowNo;
				let targetI = i;
				
				if(row.col18 == "true"){
					// 仮社員番号のものはチェックボックス非活性状態とする
			    	$('input:checkbox[name=' + targetName + ']').prop({'disabled':true});
				}else{
					// チェックボックス用のイベントを追加（チェックボックス自体をクリックされた場合）
			    	document.getElementById(targetName).addEventListener('click', function(){
			    		// チェックボックスの前状態保持リストのデータをもとに判別
			    		if(checkBoxBeforStatus[targetI] == "false"){
			    			// 前状態がfalse(チェックなし)　→　現状態をfalse(チェックなし)で再設定（再設定しないとチェックが入った状態でoncellectが呼ばれてしまう）
					    	$('input[name=' + targetName + ']').prop("checked",false);
			    		}else{
			    			// 前状態がtrue(チェックあり)　→　現状態をtrue(チェックあり)で再設定（再設定しないとチェックがない状態でoncellectが呼ばれてしまう）
					    	$('input[name=' + targetName + ']').prop("checked",true);
			    		}
					}, false);
				}
				// データ行の背景色スタイルをクリア
				var colorId = "#" + rowNo;
				$(colorId).children('td, th').css('background-color','');
			}
		}
    }	
	
    onPaging = function(pgButton){

    	const result = document.getElementsByClassName('ui-pg-input');
    	var test =result.item(0).value;
    	//var test = $("#sp_1_mainList-pager").val;
    	//alert(test);
    }
    
	// 使ってないけど、とりあえず残しておく
    onBeforeSelectRow = function(rowId, iCol, cellContent, e) {
		// リストテーブル情報取得
		var grid = $("#mainList");
		// 行番号から選択した行の情報を取得
		var row = grid.getRowData(rowId);

		if(row.col18 == "true"){
			// 仮社員番号の場合はチェックを外す
			return false;
		}else{
			return true;	
		}
    }
    
 	// jqGridセル選択時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
    	
		// リストテーブル情報取得
		var grid = $("#mainList");
		// 行番号から選択した行の情報を取得
		var row = grid.getRowData(rowId);
    	var rowNo = rowId;
		var targetName = "jqg_mainList_" + rowNo;

		// 行選択情報をクリア（未選択状態へ）
		$("#mainList").jqGrid("setGridParam", { selarrrow: null }, true);
		
		// ヘッダのチェックボックスチェック（いらないかも？）
    	if ($("#cb_mainList").prop("checked") == true){
			// 全選択チェックボックスにチェックが入っていた　→　チェックを外す
	    	$('input[id=cb_mainList]').prop("checked",false);
    	}
		
    	// チェックボックスの状態を変更し、選択セルの1行分の背景色変更
    	var targetId = "#jqg_mainList_" + rowNo;
    	if ($(targetId).prop("checked") == true){
    		// チェックが入っている場合、チェックを外す
	    	$('input[name=' + targetName + ']').prop("checked",false);
	    	// 背景色のスタイルをクリア（行全体）
			var colorId = "#" + rowNo;
			$(colorId).children('td, th').css('background-color','');
    	}else{
    		// チェックが入っていない場合、チェックをつける
	    	$('input[name=' + targetName + ']').prop("checked",true);
	    	// 背景色のスタイルを設定（行全体）
			var colorId = "#" + rowNo;
			$(colorId).children('td, th').css('background-color','#fbec88');
    	}
    	
    	if(row.col18 == "true"){
			// 仮社員番号の場合はチェックを外す
	    	$('input[name=' + targetName + ']').prop("checked",false);
		}
    	
    	// 行選択情報を再設定するために全行チェック
		var datas = grid.getGridParam("data");//全行
		if( datas.length > 0 )
		{	
			var rowData = grid.getRowData(datas);

    		var strs = [];
			for( var i=0; i<datas.length; ++i ){
				var targetRow = i + 1;
				var strNo = "" + targetRow + ""; // 数値を文字列へ変換
				var targetRowId = "#jqg_mainList_" + targetRow;
				if(targetRow == rowId){
					// 選択行
					if($(targetRowId).prop("checked") == false){
						// 行選択情報に格納する行番号をPush
				    	strs.push(strNo);
				    	checkBoxBeforStatus[i] = "false";				    	
					}else{
				    	checkBoxBeforStatus[i] = "true";				    	
					}
				}else{
					// 選択行以外	
					if($(targetRowId).prop("checked") == true){
						// 行選択情報に格納する行番号をPush
				    	strs.push(strNo);
				    	checkBoxBeforStatus[i] = "true";				    	
					}else{
				    	checkBoxBeforStatus[i] = "false";				    	
					}
				}
			}
			// 行選択情報を詰め替え
	    	$("#mainList").jqGrid("setGridParam", { selarrrow: strs }, true);
			var test = grid.getGridParam("selarrrow");
		}
    }
 	
	// ヘッダ行のチェックボックスクリック時の処理（jqGridのメソッドではなく、自作メソッド）   
    onSelectCheckBoxAll = function(rowId, iCol, cellContent, e) {
		var grid = $("#mainList");					
		var datas = grid.getGridParam("data");//全行
		
		var test2 = grid.getGridParam("selarrrow");
    	
		if( datas.length > 0 )
		{	
			var row2 = grid.getRowData(datas);

	    	if ($("#cb_mainList").prop("checked") == true){
	    		// 全選択チェックがTrue（チェックされた）
	    		var strs = [];
				for( var i=0; i<datas.length; ++i ){
					var row = datas[i];
					var rowNo = i + 1;
					var targetName = "jqg_mainList_" + rowNo; // 文字列に変換
					if(row.col18 == "true"){
						// 仮社員番号のものはチェックを外す
						// (念のため)非活性にする
				    	$('input:checkbox[name=' + targetName + ']').prop({'disabled':true});
						// チェックを外す
				    	$('input[name=' + targetName + ']').prop("checked",false);
				    	// チェックボックスの前状態保持リストのデータをfalse（チェックなし）に変更
				    	checkBoxBeforStatus[i] = "false";
					}else{
						// チェックをつける
				    	$('input[name=' + targetName + ']').prop("checked",true);
						// 背景色を選択色へ
						var colorId = "#" + rowNo;
						$(colorId).children('td, th').css('background-color','#fbec88');
						// チェックボックスの前状態保持リストのデータをtrue（チェックあり）に変更
				    	checkBoxBeforStatus[i] = "true";
				    	// 行選択情報に格納する行番号をPush
						var strNo = "" + rowNo + ""; 
				    	strs.push(strNo);
					}
				}

				// 行選択情報を詰め替え
		    	$("#mainList").jqGrid("setGridParam", { selarrrow: strs }, true);
				var test = grid.getGridParam("selarrrow");
	    	} else{
				for( var i=0; i<datas.length; ++i ){
					var row = datas[i];
					var rowNo = i + 1;
					var targetName = "jqg_mainList_" + rowNo;// 文字列に変換
					
					if(row.col18 == "true"){
						// 仮社員番号のものはチェックを外す
						// (念のため)非活性にする
				    	$('input:checkbox[name=' + targetName + ']').prop({'disabled':true});
						// チェックを外す
				    	$('input[name=' + targetName + ']').prop("checked",false);
					}else{
						// チェックを外す
				    	$('input[name=' + targetName + ']').prop("checked",false);
					}
					// 背景色をクリア
					var colorId = "#" + rowNo;
					$(colorId).children('td, th').css('background-color','#ffffff');
					// チェックボックスの前状態保持リストのデータをfalse（チェックなし）に変更
			    	checkBoxBeforStatus[i] = "false";
				}
				//行選択情報を詰め替え（クリア）
		    	$("#mainList").jqGrid("setGridParam", { selarrrow: null }, true);
				var test = grid.getGridParam("selarrrow");
	    	}
		}
    }
    
	// jqGridの全選択チェックボックス(multiselect)をクリックした際のイベント
	// とりあえず残しておく。。。
    onSelectAll = function(rowId, iCol, cellContent, e) {
		var grid = $("#mainList");					
		var datas = grid.getGridParam("data");//全行
    	
		if( datas.length > 0 )
		{	
			var row2 = grid.getRowData(datas);
			
			for( var i=0; i<datas.length; ++i ){
				var row = datas[i];
				
				if(row.col18 == "true"){
					// 仮社員番号のものはチェックを外す
					var rowNo = i + 1;
					var targetName = "jqg_mainList_" + rowNo;
					// (念のため)非活性にする
			    	$('input:checkbox[name=' + targetName + ']').prop({'disabled':true});
					// チェックを外す
			    	$('input[name=' + targetName + ']').prop("checked",false);
				}
				
			}
			
		}
    }
    
	// 画面表示時に定義される処理
	$(document).ready(function(){

		// フォーカスを合わせる（nfwui:DateBoxを使うと、指定したID+"Div"が新しいidになる模様
		document.getElementById('baseTermFromDiv').focus();

		// リサイズ処理は組み込まない
		/*
			$(window).bind('resize', function(){			
				$('#mainList').setGridWidth($('#listTableArea').width(), true);		
			}).trigger('resize');		
		*/

		// ボタン押下時のイベント
		preButtonEvent = function (mode) {
			var dialogTitle = "";
			var dialogMessage = "";
			var url = "";
			var grid = null;
			var row = null;
			var id = null;
			var shatakuKbn = null;

			switch (mode) {
				// 検索
				case 0:
					//url = "skf/Skf3060Sc001/search";
					//$("#form").attr("action", url);
					//$("#form").submit();

					var formId= "form";
					var url = "skf/Skf3060Sc001/search";
					nfw.common.submitForm(formId, url);
					
					break;
				// CSV出力
				case 1:
					$("#hdnBaseTermFrom").val($("#baseTermFrom").val());
					$("#hdnBaseTermTo").val($("#baseTermTo").val());

					$("#baseTermFrom").val($("#baseTermFrom").val());
					$("#baseTermTo").val($("#baseTermTo").val());
					
					// 日付入力域のスタイルをもとに戻す（サーバ側では戻せない？）
					document.getElementById('baseTermFrom').className = "";
					document.getElementById('baseTermTo').className = "";
					
					// WARNINGメッセージ領域を削除
					$('.imui-box-warning').css('display','none');
					
					dialogTitle = "確認";
					dialogMessage = "年齢加算対象者一覧CSVを出力します。よろしいですか？";
					url = "skf/Skf3060Sc001/download";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
					break;
				// メール送信
				case 2:
					// 検索結果一覧の中からチェックの行データを取得する
			        var grid = jQuery("#mainList");
					var datas = grid.getGridParam("data");//全行
					
					var ids = grid.getGridParam("selarrrow");
					
					var strs = [];
					for( var i=0; i<datas.length; ++i ){
						var row = datas[i];
						if(row.col18 == "false"){
							// 仮社員番号のものはチェックを外す
							var rowNo = i + 1;
							var targetName = "#jqg_mainList_" + rowNo;
							if($(targetName).prop("checked") == true){
								var tempStr = [];
								tempStr.push(rowNo);
								strs.push(tempStr.join(","));	//配列で格納
							}
						}
					}
					/*
					for( var i=0; i<ids.length; ++i )
					{
						var row2 = datas[i];
						if(row2.col18 == "false"){
							
							var id = ids[i];
							var row = grid.getRowData(id);
							
							var tempStr = [];
							tempStr.push(id);
							strs.push(tempStr.join(","));	//配列で格納
						}
					}
					*/
					
					$("#mailSendData").val(strs.join(";"));

					// 日付入力域のスタイルをもとに戻す（サーバ側では戻せない？）
					document.getElementById('baseTermFrom').className = "";
					document.getElementById('baseTermTo').className = "";
					
					dialogTitle = "確認";
					dialogMessage = "年齢加算対象の電子メールを送信します。よろしいですか？";
					url = "skf/Skf3060Sc001/sendMail";
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
<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">
	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3060_SC001 %>" />
	<input type="hidden" name="hdnBaseTermFrom" id="hdnBaseTermFrom" value="${form.hdnBaseTermFrom}" />
	<input type="hidden" name="hdnBaseTermTo" id="hdnBaseTermTo" value="${form.hdnBaseTermTo}" />
	<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo}" />
	<input type="hidden" name="hdnName" id="hdnName" value="${form.hdnName}" />
	<input type="hidden" name="hdnOriginalCompanyCd" id="hdnOriginalCompanyCd" value="${form.hdnOriginalCompanyCd}" />
	<input type="hidden" name="hdnSalaryCompanyCd" id="hdnSalaryCompanyCd" value="${form.hdnSalaryCompanyCd}" />
	<input type="hidden" name="hdnSendMailStatus" id="hdnSendMailStatus" value="${form.hdnSendMailStatus}" />

	<input type="hidden" name="mailSendData" id="mailSendData" value="" />
	<input type="hidden" name="listTableMaxRowCount" id="listTableMaxRowCount" value="${form.listTableMaxRowCount}" />

    <div class="imui-form-container-wide">
        <table class="imui-form-search-condition" width="100%" style="border: none;" >
            <td style="width: 59%; border: none;" >
	            <!-- 左側の検索部分 -->
                <div>
					<div class="imui-chapter-title"><h2>検索条件</h2></div>
                    <table class="imui-form-search-condition">
						<tr>
							<!-- 基準期間 -->
							<th style="width: 11%;">
								<nfwui:LabelBox id="lblBaseTerm" code="<%=MessageIdConstant.SKF3060_SC001_BASE_TERM %>" />
							</th>
							<td colspan="2" style="width: 410px;">
                                <nfwui:DateBox id="baseTermFrom" name="baseTermFrom" value="${f:h(form.baseTermFrom)}"
                                               cssClass="${f:h(form.baseTermFromErr)}" tabindex="3" cssStyle="width:100px"/>
								&nbsp;～&nbsp;
                                <nfwui:DateBox id="baseTermTo" name="baseTermTo" value="${f:h(form.baseTermTo)}"
                                               cssClass="${f:h(form.baseTermToErr)}" tabindex="4" cssStyle="width:100px"/>
                                               <!-- 
                                <nfwui:DateBox id="baseTermFrom" name="baseTermFrom"
                                               cssClass="${f:h(form.baseTermFromErr)}" tabindex="1" cssStyle="width:100px"/>
								&nbsp;～&nbsp;
                                <nfwui:DateBox id="baseTermTo" name="baseTermTo"
                                               cssClass="${f:h(form.baseTermToErr)}" tabindex="2" cssStyle="width:100px"/>

                                                -->
								<!-- 
								<nfwui:DateBox name="baseTermFrom" id="baseTermFrom" cssStyle="width:100px" tabindex="1"/>
								<nfwui:DateBox name="baseTermTo" id="baseTermTo" cssStyle="width:100px" tabindex="2"/>					
								 -->	
							</td>
							<!-- 原籍会社 -->
							<th style="width: 16%;">
								<nfwui:LabelBox id="lblOriginalCompanyCd" code="<%=MessageIdConstant.SKF3060_SC001_ORIGINAL_COMPANY_CD %>" />
							</th>
							<td>
								<imui:select id="selectedOriginalCompanyCd" name="selectedOriginalCompanyCd" 
									width="200px" list="${form.originalCompanyCdList}" tabindex="7" />
							</td>
						</tr>
						<tr>
							<!-- 社員番号 -->
							<th style="width: 11%;">
								<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF3060_SC001_SHAIN_NO %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="txtShainNo" name="shainNo" style="ime-mode: disabled;width:150px;" placeholder="例  00123456(半角)" value="${f:h(form.shainNo)}" tabindex="5" maxlength="8"/>
							</td>
							<!-- 給与支給会社名 -->
							<th style="width: 16%;">
								<nfwui:LabelBox id="lblSalaryCompanyCd" code="<%=MessageIdConstant.SKF3060_SC001_SALARY_COMPANY_CD %>" />
							</th>
							<td>
								<imui:select id="selectedSalaryCompanyCd" name="selectedSalaryCompanyCd" 
									width="200px" list="${form.salaryCompanyCdList}" tabindex="8" />
							</td>
						</tr>
						<tr>
							<!-- 社員名 -->
							<th style="width: 11%;">
								<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3060_SC001_NAME %>" />
							</th>
							<td colspan="2">
								<imui:textbox id="txtName" name="name" style="disabled;width:150px;" placeholder="例  中日本　太郎" value="${f:h(form.name)}" tabindex="6" maxlength="20"/>
							</td>
							<!-- 送信状態 -->
							<th style="width: 16%;">
								<nfwui:LabelBox id="lblSendMailStatus" code="<%=MessageIdConstant.SKF3060_SC001_SEND_MAIL_STATUS %>" />
							</th>
							<td>
								<imui:select id="selectedSendMailStatus" name="selectedSendMailStatus" 
									width="100px" list="${form.sendMailStatusList}" tabindex="9" />
							</td>
						</tr>
					</table>    
					<div class="align-L">	
						<imui:button id="search" name="search" value="検索" class="imui-small-button" onclick="preButtonEvent(0)" tabindex="10" />
					</div>
                </div>
                <!-- 操作ガイド -->
                <td style="width: 45%; border: none;background-color: #fdfdff;">
                    <div style="overflow-y:scroll; max-height:140px; height:140px; margin-left: 20px; background-color:#eeeeee;">
                        <div class="imui-chapter-title" style="margin-bottom: 10px;"><h2>操作ガイド</h2></div>
                        <div style="margin-left: 20px;">
                            ${form.operationGuide}
                        </div>
                    </div>  
                </td>
            </td>
	    </table>
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
			<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
				autoResize="true" onGridComplete="onGridComplete" onSelectAll="onSelectAll" onCellSelect="onCellSelect" onPaging="onPaging"
				multiSelect="true" onBeforeSelectRow="onBeforeSelectRow" data="${form.listTableData }"
				height="310" shrinkToFit="false">
				<pager rowNum="${form.listTableMaxRowCount }" />
				<cols sortable="false">
					<!-- 
					<col name="col1" caption="メール" width="200" sortable="false" align="center" wrap="true"　tabindex="9"/>
					 -->
					<col name="col2" caption="原籍会社名" width="110" sortable="false" align="left" wrap="true"/>
					<col name="col3" caption="給与支給会社名" width="110" sortable="false" align="left" wrap="true"/>
					<col name="col4" caption="社員番号" width="70" sortable="false" align="left" wrap="true"/>
					<col name="col5" caption="氏名" width="100" sortable="false" align="left" wrap="true"/>
					<col name="col6" caption="生年月日" width="80" sortable="false" align="center" wrap="true"　/>
					<col name="col7" caption="年齢" width="30" sortable="false" align="center" wrap="true"　/>
					<col name="col8" caption="社宅名" width="200" sortable="false" align="left" wrap="true"/>
					<col name="col9" caption="部屋番号" width="60" sortable="false" align="left" wrap="true"/>
					<col name="col10" caption="現使用料" width="100" sortable="false" align="right" wrap="true"/>
					<col name="col11" caption="年齢加算使用料" width="100" sortable="false" align="right" wrap="true"/>
					<col name="col12" caption="送信状況(送信日)" width="100" sortable="false" align="center" wrap="true"　/>
					<col name="col13" caption="入居日" width="80" sortable="false" align="center" wrap="true"　/>
					<col name="col14" caption="退居日" width="80" sortable="false" align="center" wrap="true"　/>
					<col name="col15" caption="用途" width="50" sortable="false" align="center" wrap="true"　/>
					<col name="col16" caption="役員区分" width="80" sortable="false" align="center" wrap="true"　/>
					<col name="col17" caption="所属" width="400" sortable="false" align="left" wrap="true"　/>
					<col name="col18" caption="仮社員フラグ" width="400" sortable="false" align="left" wrap="true"　hidden="true" />
				</cols>
			</imui:listTable>
		</div>
		<br />
		<div class="align-R">
			<!-- CSV出力 ボタン -->
			<imui:button id="csvOut" name="csvOut" value="CSV出力" disabled="${form.csvOutButtonDisabled }" class="imui-medium-button" onclick="preButtonEvent(1)" tabindex="12" />
			<!-- メール送信 ボタン -->
			<imui:button id="sendMail" name="sendMail" value="メール送信" disabled="${form.sendMailButtonDisabled }"  class="imui-medium-button" onclick="preButtonEvent(2)" tabindex="13" />
		</div>
	</div>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->
