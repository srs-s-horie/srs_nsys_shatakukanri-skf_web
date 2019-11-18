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

    $('#addManageCompany').imuiSelect({"width":"200px"});

(function($) {
	
	onCellSelect = function(rowId,iCol,cellcontent,e) {
		
		$("#hdnAddCompanyCd").val($("#addManageCompany").val());
		// 事業領域コード
		$("#hdnAddBusinessAreaCd").val($("#addBusinessAreaCd").val());
		// 事業領域名
		$("#hdnAddBusinessAreaName").val($("#addBusinessAreaName").val());
		// 管理機関
		$("#hdnAddAgencyCd").val($("#addaAency").val());
		
		// リストテーブル情報取得
		var grid = $("#mainList");
		// 行番号から選択した行の情報を取得
		var row = grid.getRowData(rowId);
		
		// 行番号
		var rowNo = rowId - 1;
		
		// 管理会社コード
		$("#hdnRowCompanyCd").val(row.col2);
		// 事業領域コード
		$("#hdnRowBusinessAreaCd").val(row.col3);
		// 事業領域名
		var divCol4 = document.createElement('div');
		divCol4.style.display = 'none';
		divCol4.innerHTML = row.col4;
		document.body.appendChild(divCol4); //bodyに追加
		var bAreaName = document.getElementById("businessAreaName"+rowNo).value;
		document.body.removeChild(divCol4); //bodyから削除								
		$("#hdnRowBusinessAreaName").val(bAreaName);
		// 管理機関
		var divCol6 = document.createElement('div');
		divCol6.style.display = 'none';
		divCol6.innerHTML = row.col6;
		document.body.appendChild(divCol6); //bodyに追加
		var agencyCd = document.getElementById("agency"+rowNo).value;
		document.body.removeChild(divCol6); //bodyから削除			
		$("#hdnRowAgencyCd").val(agencyCd);
		// 更新日時
		$("#hdnRowUpdateDate").val(row.col9);
		
		// リストテーブル情報取得
		var datas = grid.getGridParam("data");//全行
		
		if( datas.length > 0 )
		{	
			var row2 = grid.getRowData(datas);
			var strs = [];
			for( var i=0; i<datas.length; ++i ){
				var rowList = datas[i];

				var divCol4List = document.createElement('div');
				divCol4List.style.display = 'none';
				divCol4List.innerHTML = rowList.col4;
				document.body.appendChild(divCol4List); //bodyに追加
				var bAreaNameList = document.getElementById("businessAreaName"+i).value;
				document.body.removeChild(divCol4List); //bodyから削除								

				var divCol6List = document.createElement('div');
				divCol6List.style.display = 'none';
				divCol6List.innerHTML = rowList.col6;
				document.body.appendChild(divCol6List); //bodyに追加
				var agencyCdList = document.getElementById("agency"+i).value;
				document.body.removeChild(divCol6List); //bodyから削除								
				
				var tempStr = [];
				tempStr.push(bAreaNameList); 		// 現在入力されている事業領域名
				tempStr.push(agencyCdList);			// 現在選択されている管理機関コード
				strs.push(tempStr.join("/--separater--/"));	//配列で格納
			}
			//$("#registEditData").val(strs.join(";"));
			$("#registEditData").val(strs.join("EndOfEditData"));
		}
		
		if($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')){
			// 削除ボタン押下
			dialogTitle = "確認";
			dialogMessage = "事業領域情報を削除します。よろしいですか？";
			var url = "skf/Skf3090Sc003/delete";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
		}else{
			// 何もしない
		}
	}

	// 検索結果一覧に表示する最大行数
	onGridComplete = function(rowId,iCol,cellcontent,e) {
		// リストテーブル情報取得
		var grid = $("#mainList");		
		// 検索結果一覧に表示する最大行数を再設定
		var maxRowCount = grid.getGridParam("rowNum");	
    	// 現在のページ番号
		var pageNo = grid.getGridParam('page'); 
    	var datas = grid.getGridParam("data");//全行
		if( datas.length > 0 )
		{	
			// ページング範囲
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
				var targetId = "businessAreaName"+ i; 
		    	// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
		    	document.getElementById(targetId).addEventListener('click', function(){
		    		$(this).select();
		    		return false;
		    	}, false);    	
			}
		}
	}
	
	
	onCellAddSelect = function(rowId,iCol,cellcontent,e) {
		
		if($(cellcontent).hasClass('im-ui-icon-common-16-plus')){

			// 管理会社コード
			$("#hdnAddCompanyCd").val($("#addManageCompany").val());
			// 事業領域コード
			$("#hdnAddBusinessAreaCd").val($("#addBusinessAreaCd").val());
			document.getElementById("addBusinessAreaCd").value = $("#addBusinessAreaCd").val();
			// 事業領域名
			$("#hdnAddBusinessAreaName").val($("#addBusinessAreaName").val());
			// 管理機関
			$("#hdnAddAgencyCd").val($("#addaAency").val());
			
			// リストテーブル情報取得
			var grid = $("#mainList");					
			var datas = grid.getGridParam("data");//全行
			
			if( datas.length > 0 )
			{	
				var row2 = grid.getRowData(datas);
				var strs = [];
				for( var i=0; i<datas.length; ++i ){
					var row = datas[i];

					var divCol4 = document.createElement('div');
					divCol4.style.display = 'none';
					divCol4.innerHTML = row.col4;
					document.body.appendChild(divCol4); //bodyに追加
					var bAreaName = document.getElementById("businessAreaName"+i).value;
					document.body.removeChild(divCol4); //bodyから削除								

					var divCol6 = document.createElement('div');
					divCol6.style.display = 'none';
					divCol6.innerHTML = row.col6;
					document.body.appendChild(divCol6); //bodyに追加
					var agencyCd = document.getElementById("agency"+i).value;
					document.body.removeChild(divCol6); //bodyから削除								
					
					var tempStr = [];
					tempStr.push(bAreaName); 		// 現在入力されている事業領域名
					tempStr.push(agencyCd);			// 現在選択されている管理機関コード
					strs.push(tempStr.join("/--separater--/"));	//配列で格納
				}
				//$("#registEditData").val(strs.join(";"));
				$("#registEditData").val(strs.join("EndOfEditData"));
			}
			
			// 追加ボタン押下
			dialogTitle = "確認";
			dialogMessage = "事業領域情報を追加します。よろしいですか？";
			var url = "skf/Skf3090Sc003/AddRegist";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
		}else{
			// 何もしない
		}
	}

	onAddGridComplete = function(rowId,iCol,cellcontent,e) {
    	// テキストボックス、テキストエリアにフォーカス時、入力済み文字列全選択
    	document.getElementById("txtBusinessAreaCd").addEventListener('click', function(){
    		$(this).select();
    		return false;
    	}, false);    	
    	document.getElementById("txtBusinessAreaName").addEventListener('click', function(){
    		$(this).select();
    		return false;
    	}, false);    	
    	document.getElementById("addBusinessAreaCd").addEventListener('click', function(){
    		$(this).select();
    		return false;
    	}, false);    	
    	document.getElementById("addBusinessAreaName").addEventListener('click', function(){
    		$(this).select();
    		return false;
    	}, false);    	
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
		
		document.getElementById('selectedManageCompanyCd').focus();
		
		$(window).bind('resize', function(){			
			$('#mainList').setGridWidth($('#listTableArea').width(), true);		
			$('#mainAddList').setGridWidth($('#listAddTableArea').width(), true);		
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
				// 登録
				case 0:
					
					// 管理会社コード
					$("#hdnAddCompanyCd").val($("#addManageCompany").val());
					// 事業領域コード
					$("#hdnAddBusinessAreaCd").val($("#addBusinessAreaCd").val());
					document.getElementById("addBusinessAreaCd").value = $("#addBusinessAreaCd").val();
					// 事業領域名
					$("#hdnAddBusinessAreaName").val($("#addBusinessAreaName").val());
					// 管理機関
					$("#hdnAddAgencyCd").val($("#addaAency").val());
					
					// リストテーブル情報取得
					var grid = $("#mainList");					
					var datas = grid.getGridParam("data");//全行
					
					if( datas.length > 0 )
					{	
						var row2 = grid.getRowData(datas);
						var strs = [];
						for( var i=0; i<datas.length; ++i ){
							var row = datas[i];

							var divCol4 = document.createElement('div');
							divCol4.style.display = 'none';
							divCol4.innerHTML = row.col4;
							document.body.appendChild(divCol4); //bodyに追加
							var bAreaName = document.getElementById("businessAreaName"+i).value;
							document.body.removeChild(divCol4); //bodyから削除								

							var divCol6 = document.createElement('div');
							divCol6.style.display = 'none';
							divCol6.innerHTML = row.col6;
							document.body.appendChild(divCol6); //bodyに追加
							var agencyCd = document.getElementById("agency"+i).value;
							document.body.removeChild(divCol6); //bodyから削除								
							
							var tempStr = [];
							tempStr.push(bAreaName); 		// 現在入力されている事業領域名
							tempStr.push(agencyCd);			// 現在選択されている管理機関コード
							strs.push(tempStr.join("/--separater--/"));	//配列で格納
						}
						//$("#registEditData").val(strs.join(";"));
						$("#registEditData").val(strs.join("EndOfEditData"));
					}
					
					dialogTitle = "登録";
					dialogMessage = "上書き登録処理を実行します。よろしいですか？";
					url = "skf/Skf3090Sc003/registe";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
					break;
				// 検索
				case 1:
					$("#hdnAddCompanyCd").val($("#addManageCompany").val());
					// 事業領域コード
					$("#hdnAddBusinessAreaCd").val($("#addBusinessAreaCd").val());
					// 事業領域名
					$("#hdnAddBusinessAreaName").val($("#addBusinessAreaName").val());
					// 管理機関
					$("#hdnAddAgencyCd").val($("#addaAency").val());

					//url = "skf/Skf3090Sc003/search";
					//$("#form").attr("action", url);
					//$("#form").submit();
					
					formId= "form";
					url = "skf/Skf3090Sc003/search";
					nfw.common.submitForm(formId, url);					
					
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
	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC003 %>" />
	<input type="hidden" name="hdnSelectedCompanyCd" id="hdnSelectedCompanyCd" value="${form.hdnSelectedCompanyCd}" />
	<input type="hidden" name="hdnBusinessAreaCd" id="hdnBusinessAreaCd" value="${form.hdnBusinessAreaCd}" />
	<input type="hidden" name="hdnBusinessAreaName" id="hdnBusinessAreaName" value="${form.hdnBusinessAreaName}" />
	
	<input type="hidden" name="listTableData" id="listTableData" value="${form.listTableData}" />
	
	<!-- 検索結果一覧部 -->
	<input type="hidden" name="hdnRowCompanyCd" id="hdnRowCompanyCd" value="" />
	<input type="hidden" name="hdnRowBusinessAreaCd" id="hdnRowBusinessAreaCd" value="" />
	<input type="hidden" name="hdnRowBusinessAreaName" id="hdnRowBusinessAreaName" value="" />
	<input type="hidden" name="hdnRowAgencyCd" id="hdnRowAgencyCd" value="" />
	<input type="hidden" name="hdnRowUpdateDate" id="hdnRowUpdateDate" value="" />
	<input type="hidden" name="registEditData" id="registEditData" value="" />
	<!-- 追加領域部 -->
	<input type="hidden" name="hdnAddCompanyCd" id="hdnAddCompanyCd" value="" />
	<input type="hidden" name="hdnAddBusinessAreaCd" id="hdnAddBusinessAreaCd" value="" />
	<input type="hidden" name="hdnAddBusinessAreaName" id="hdnAddBusinessAreaName" value="" />
	<input type="hidden" name="hdnAddAgencyCd" id="hdnAddAgencyCd" value="" />

	<div style="width:100%;" >
		<div class="imui-form-container-wide">
			<div class="imui-chapter-title"><h2>検索条件</h2></div>
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC003 %>" />
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th style="width: 12%;">
								<nfwui:LabelBox id="lblNyutaikyoYoteiSakuseiKubun" code="<%=MessageIdConstant.SKF3090_SC003_MANAGE_COMPANY %>" />
							</th>
							<td>
								<imui:select id="selectedManageCompanyCd" name="selectedManageCompanyCd" 
									width="200px" list="${form.manageCompanyList}" tabindex="3" />
							</td>
							<th style="width: 12%;">
								<nfwui:LabelBox id="lblBusinessAreaCd" code="<%=MessageIdConstant.SKF3090_SC003_BUSINESS_CODE %>" />
							</th>
							<td>
								<imui:textbox id="txtBusinessAreaCd" name="businessAreaCd" style="ime-mode: disabled;width:100px;" placeholder="例 A001" value="${form.businessAreaCd}" tabindex="4" maxlength="4"/>
							</td>
							<th style="width: 12%;">
								<nfwui:LabelBox id="lblBusinessAreaName" code="<%=MessageIdConstant.SKF3090_SC003_BUSINESS_NAME %>" />
							</th>
							<td>
								<imui:textbox id="txtBusinessAreaName" name="businessAreaName" style="width:300px;" placeholder="例 本社 〇〇部" value="${form.businessAreaName}" tabindex="5" maxlength="255"/>
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
			<div class="align-L">	
				<imui:button id="search" name="search" value="検索" class="imui-small-button" onclick="preButtonEvent(1)" tabindex="6" />
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
					<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect" onGridComplete="onGridComplete"
						multiSelect="false" data="${form.listTableData }"
						style="max-height: 100px" >
						<pager rowNum="${form.listTableMaxRowCount }" />
						<cols sortable="false">
							<col name="col1" caption="管理会社" width="200" sortable="false" align="left" wrap="true"/>
							<col name="col2" caption="管理会社(隠し)" width="200" sortable="false" align="left" hidden="true" />
							<col name="col3" caption="事業領域コード" width="100" sortable="false" align="left" wrap="true"/>
							<col name="col4" caption="事業領域名" width="300" sortable="false" align="left"/>
							<col name="col5" caption="事業領域名(隠し)" width="300" sortable="false" align="left" hidden="true" />
							<col name="col6" caption="管理機関" width="200" sortable="false" align="left" wrap="true"/>
							<col name="col7" caption="管理機関(隠し)" width="200" sortable="false" align="left" wrap="true" hidden="true" />
							<col name="col8" caption="削除" width="45" sortable="false" align="center" tabindex="7">
								<showIcon iconClass="im-ui-icon-common-16-trashbox" align="center" />
							</col>
							<col name="col9" caption="更新日時" hidden="true" />
						</cols>
					</imui:listTable>
				</div>
			<br />
			<!-- 追加データ入力部 -->
			<div id="listAddTableArea">
					<imui:listTable id="mainAddList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellAddSelect" onGridComplete="onAddGridComplete"
						multiSelect="false" data="${form.listAddTableData }"
						style="max-height: 35px" height="auto" >
						<cols sortable="false">
							<col name="colAdd1" caption="管理会社" width="200" sortable="false" align="left" wrap="true" tabindex="8"/>
							<col name="colAdd2" caption="事業領域コード" width="100" sortable="false" align="left" wrap="true" tabindex="9"/>
							<col name="colAdd3" caption="事業領域名" width="300" sortable="false" align="left" tabindex="10"/>
							<col name="colAdd4" caption="管理機関" width="200" sortable="false" align="left" wrap="true" tabindex="11"/>
							<col name="colAdd5" caption="追加" width="45" sortable="false" align="center" tabindex="12">
								<showIcon iconClass="im-ui-icon-common-16-plus" align="center" />
							</col>
							<col name="colAdd6" caption="" width="8" sortable="false" align="center"/>
						</cols>
					</imui:listTable>
			</div>
			<br />
			<div class="align-R">
				<!-- 登録 ボタン -->
				<imui:button id="regist" name="regist" value="登録" disabled="${form.registButtonDisabled }" class="imui-medium-button" onclick="preButtonEvent(0)" tabindex="13" />
			</div>
		</div>
	</div>
		<script type="text/javascript">
				(function($) {
					$(document).ready(function(){
						$("#addManageCompany").bind('change', function() {
					        var str = $(this).val();
							var map = new Object();
							map['selectedAddManageCompanyCd'] = $("#addManageCompany").val();
							var selectBefor = document.getElementById('addaAency');
							var options = selectBefor.options;
							for (var i = options.length - 1; 0 <= i; --i) {
								selectBefor.remove(i);
							}							
							if($("#addManageCompany").val() == ""){
						        let op = document.createElement("option");
						        op.text = "";  //value値
						        op.value = "";   //テキスト値						        	
						        selectBefor.appendChild(op);							        
							}else{
								// ドロップダウンチェンジイベント
								nfw.common.doAjaxAction("skf/Skf3090Sc003/ChangeDropDownAsync",map,true,function(data) {
								        var optionList = data.addManageAgencyList;
								    	var select = document.getElementById('addaAency');
								        for(var i=0; i<optionList.length; i++){
									        let op = document.createElement("option");
									        op.text = optionList[i].label;  //value値
									        op.value = optionList[i].value;   //テキスト値						        	
									        select.appendChild(op);							        
								        }
								});
							}
						});
					});
				})(jQuery);
			</script>	
</nfwui:Form>

<!-- コンテンツエリア　ここまで -->

