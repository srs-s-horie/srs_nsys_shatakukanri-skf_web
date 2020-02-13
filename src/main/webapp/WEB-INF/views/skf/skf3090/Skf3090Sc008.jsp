<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 共通JSP --%>
<%@ include
	file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp"%>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework"%>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui"%>
<%@ taglib prefix="imart"
	uri="http://www.intra-mart.co.jp/taglib/core/standard"%>
<%@ taglib prefix="workflow"
	uri="http://www.intra-mart.co.jp/taglib/imw/workflow"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions"%>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant"%>


<%-- コンテンツエリア --%>
<style type="text/css">
</style>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
<div class="imui-form-container-wide" style="width: 95%;">
		<table class="imui-form-search-condition">
			<tbody>
				<tr>
					<td style="width: 65%; border: none; background-color: #fdfdff;" id="testTableArea">
						<div id="listTableArea">
							<imui:listTable id="informationDataList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
								autoResize="true" onCellSelect="onCellSelect"
								multiSelect="false" data="${form.listTableData }"
								style="max-height: 800px;" >
								<pager rowNum="${form.listTableMaxRowCount }" />
								<cols sortable="false">
								<col name="edit" caption="編集" width="6" sortable="false" align="center" >
									<showIcon iconClass="im-ui-icon-common-16-update" />
								</col>
								<col name="openDate" caption="公開開始日" width="10" sortable="false" align="center" />
								<col name="information" caption="お知らせ" width="62.5" sortable="false" />
								<col name="delete" caption="削除" width="6" sortable="false" align="center" >
									<showIcon iconClass="im-ui-icon-common-16-trashbox" />
								</col>
								</cols>
							</imui:listTable>
						</div>

					</td>
					<td style="width: 35%; border: none; background-color: #fdfdff;">
						<table>
							<!-- 右側の操作ガイドの部分 -->
							<div class="imui-form-container-wide">
								<nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF3090_SC008_OPERATION_GUIDE %>" titleLevel="2" />									
								<div style="overflow-y: scroll; height: 99%">
									${form.operationGuide}
								</div>
							</div>
						</table>
					</td>
				</tr>

			</tbody>
		</table>

<br />
		<table class="imui-form-search-condition">
			<th style="width: 10%">
			<nfwui:LabelBox id="lblReleaseDate" code="<%= MessageIdConstant.SKF3090_SC008_OPEN_DATE %>" />
			</th>
			<td style="width: 20%">
			<nfwui:DateBox name="openDateBox" id="openDateBox" cssStyle="width:125px" tabindex="3" />
			<td style="border: none;"></td>
		</table>

		<!--------------------------------------------------------------------

		<!-- エディター-->
	<table>
		<tr>
		<div class="informationTinymce">
			<script type="text/javascript"src="csjs/libs/tinymce/js/tinymce/tinymce.min.js"></script>
			<script>
			tinymce.init({
			        selector: "#note",
			        language: "ja",
			        statusbar: false,
			        plugins: [
			                "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
			                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			                "table contextmenu directionality emoticons template textcolor paste fullpage textcolor"
			        ],
			
			        toolbar1: " undo redo | bold italic underline strikethrough | subscript superscript | ltr rtl | forecolor backcolor | removeformat | fontsizeselect",
			        toolbar2: " cut copy paste | outdent indent | alignleft aligncenter alignright alignjustify | numlist | link unlink ",
			
			        menubar: false,
			        toolbar_items_size: 'small',
			});</script>
			<imui:textbox id="note" name="note" value="${form.note}" tabindex="4" />
			</div>
		</tr>
	</table>
	<!----------------a---------------------------------------------------->
	<div class="imui-box-layout">
		<table style="width: 95%;">
			<tbody>
				<td align="right">
				<imui:button id="regist" name="regist" value="お知らせ内容を登録" class="imui-medium-button" tabindex="5" />
				</td>
			</tbody>
		</table>
	</div>
</div>
<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
	(function($) {
		//画面表示時
		$(document).ready(function(){	
			//高さ変更
			//$(".ui-jqgrid-view").height(300);
			$(".ui-jqgrid-bdiv").height(225);
		});	
		
		//「お知らせを登録」ボタンクリック時
		$("#regist").click(function(){
			skf.common.confirmPopupForCallback("入力した内容で登録します。よろしいですか？", "確認", "form", "ok", "キャンセル", this, function(){
				var map = new Object();
				//map['note'] = $("#note").val();
				map['openDateBox'] = $("#openDateBox").val();
			
				nfw.common.doAjaxAction("skf/Skf3090Sc008/CheckRegistAsync", map, true, function(data){
					var formId = "form";
					var url = "skf/Skf3090Sc008/Regist";
					if(data.dialogFlg){
						$('#dialogFlg').val(data.dialogFlg);
						nfw.common.confirmPopup("上書き登録処理を実行します。よろしいですか？", "確認", formId, url, "ok", "キャンセル", this, true);
					}else{
						nfw.common.submitForm(formId, url, this);
					}
				});		
			});
			
		});
		
		onCellSelect = function(rowId,iCol,cellcontent,e) {
			//編集アイコンクリック時
			if ($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
				// リストテーブル情報取得
				var grid = $("#informationDataList");
				// 行番号から選択した行の情報を取得
				var row = grid.getRowData(rowId);

				// 公開開始日
				var openDate = row.openDate;
				// 内容
				var note = row.information;
				
				$("#sendOpenDate").val(openDate);
				$("#sendNote").val(note);
				
				var formId = "form";
				var url = "skf/Skf3090Sc008/edit";
				
				skf.common.submitForm("form", url, this);
			}
			
			//削除アイコンクリック時
			if ($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')) {
				// リストテーブル情報取得
				var grid = $("#informationDataList");
				// 行番号から選択した行の情報を取得
				var row = grid.getRowData(rowId);

				// 公開開始日
				var openDate = row.openDate;
				
				$("#sendOpenDate").val(openDate);
				
				var dialogMessage = '<%=MessageIdConstant.I_SKF_3005 %>';
				var dialogTitle = '<%=MessageIdConstant.SKF3090_SC008_CONFIRM_TITLE %>';
				var formId = "form";
				var url = "skf/Skf3090Sc008/delete";
				
				nfw.common.confirmPopup("削除します。よろしいですか？", "確認", formId, url, "ok", "キャンセル", this, true);
			}
		}
		
	    //ウィンドウリサイズ時イベント
	    $(window).bind('resize', function(){
	        // 一覧の横幅を変更
	        $('#informationDataList').setGridWidth($("#listTableArea").width() * 0.95 ,true);
	    }).trigger('resize');
		
	})(jQuery);	
</script>
<style type="text/css">
.mce-ico {font-family:"tinymce",Arial !important;}
</style>

</div>
<!-- 隠し項目 -->
<input type="hidden" name="hdnOpenDate" id="sendOpenDate" value="" /> <!-- 公開開始日 -->
<input type="hidden" name="hdnNote" id="sendNote" value="" /> <!-- 内容 -->
<input type="hidden" name="dialogFlg" id="dialogFlg" value="" /> <!-- 確認ダイアログフラグ -->
<!-- 隠し項目終わり -->
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->