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
(function($) {

    // jqGrid読み込み時のイベント
    onGridComplete = function(rowId, iCol, cellContent, e) {

 		var $list = $('#mainList');
 		//$list[0].grid.headers[2].el.innerText = "メンテナンス\n詳細";
		$list[0].grid.headers[1].el.style.textAlign = "center";
		$list[0].grid.headers[2].el.style.textAlign = "center";
		//$list[0].grid.headers[3].el.innerText = "メンテナンス\nEXCEL出力";
		$list[0].grid.headers[3].el.style.textAlign = "center";
    	
    }
    
 	// jqGridセル選択時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {

		// リストテーブル情報取得
		var grid = $("#mainList");
		// 行番号から選択した行の情報を取得
		var row = grid.getRowData(rowId);

		// 遷移先へ渡すパラメータを設定
		$("#hdnEffectiveDate").val(row.col1);

		if ($(cellContent).hasClass('im-ui-icon-common-16-update')) {
			// 詳細ボタン押下

			$("#hdnJyotaiKbn").val("2");
			
			//var url = "skf/Skf3090Sc002/init";
			//$("#form").attr("action", url);
			//$("#form").submit();		
			
			var formId= "form";
			var url = "skf/Skf3090Sc002/init";
			nfw.common.submitForm(formId, url);			
			
		}else if($(cellContent).hasClass('im-ui-icon-common-16-excel-export')){
			// Excel出力ボタン押下
			
			// WARNINGメッセージ領域を削除
			$('.imui-box-warning').css('display','none');
			
			$("#hdnJyotaiKbn").val("");
			//var url = "skf/Skf3090Sc001/download";
			//$("#form").attr("action", url);
			//$("#form").submit();			
			
			var formId= "form";
			var url = "skf/Skf3090Sc001/download";
			nfw.common.submitForm(formId, url);			
			
		}else{
			// 何もしない
		}
 	}
    
	// 画面表示時に定義される処理
	$(document).ready(function(){

		// フォーカスを合わせる（nfwui:DateBoxを使うと、指定したID+"Div"が新しいidになる模様
		document.getElementById('listGenbutsuShikyuKagaku').focus();

		// リサイズ処理は組み込まない
		$(window).bind('resize', function(){			
			$('#mainList').setGridWidth($('#listTableArea').width(), true);		
		}).trigger('resize');		

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
				// EXCEL取込
				case 0:
					dialogTitle = "確認";
					dialogMessage = "現物支給価額ファイルの取込を開始します。よろしいですか？";
					url = "skf/Skf3090Sc001/import";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
					break;
				// 新規
				case 1:
					// 遷移先へ渡すパラメータを設定
					$("#hdnEffectiveDate").val("");
					$("#hdnJyotaiKbn").val("1");
					
					//url = "skf/Skf3090Sc002/init";
					//$("#form").attr("action", url);
					//$("#form").submit();
					
					var formId= "form";
					url = "skf/Skf3090Sc002/init";
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
<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">

	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC001 %>" />
	<input type="hidden" name="hdnEffectiveDate" id="hdnEffectiveDate" value="${form.hdnEffectiveDate}" />
	<input type="hidden" name="hdnJyotaiKbn " id="hdnJyotaiKbn" value="${form.hdnJyotaiKbn}" />

	<div style="width:100%;" >
	    <div class="imui-form-container-wide">
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC001 %>" />
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th>
								<label style="width:115px;">取込ファイル</label>
							</th>
							<td style="width:98%;border: none;">
								<nfwui:FileBox id="listGenbutsuShikyuKagaku" name="listGenbutsuShikyuKagaku" cssClass="${form.fileBoxErr}"/>
								 <%-- <input type="file" size="40" accept=".csv"/> --%>
								<imui:button id="import" name="import" value="EXCEL取込" class="imui-small-button" onclick="preButtonEvent(0)" tabindex="3" />
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
				<br/>
				<div id="listTableArea">
					<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect" onGridComplete="onGridComplete"
						multiSelect="false" data="${form.listTableData }" height="300" maxHeight="800"
						>
						<cols sortable="false">
							<col name="col1" caption="改定日" width="70" sortable="false" align="center" wrap="true"/>
							<col name="col2" caption="備考" width="400" sortable="false" align="left" wrap="true"/>
							<col name="col3" caption="詳細" width="35" sortable="false" align="center" wrap="true">
								<showIcon iconClass="im-ui-icon-common-16-update" align="center" />
							</col>
							<col name="col4" caption="EXCEL出力" width="35" sortable="false" align="center" wrap="true">
								<showIcon iconClass="im-ui-icon-common-16-excel-export" align="center" />
							</col>
							<!-- 
							<col name="col4" caption="更新日時" hidden="true" />
							 -->
						</cols>
					</imui:listTable>
				</div>
				<br/>
			<div class="align-R">	
				<imui:button id="regist" name="regist" value="新規" class="imui-medium-button" onclick="preButtonEvent(1)" tabindex="4" />
			</div>
		</div>
    </div>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->


