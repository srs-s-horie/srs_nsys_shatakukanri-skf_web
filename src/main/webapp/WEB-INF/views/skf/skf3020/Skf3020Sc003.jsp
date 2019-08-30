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

</style>

<!-- コンテンツエリア:モックのまま -->
<!-- コンテンツエリア -->
		<div class="imui-form-container-wide"  style="width:1280px;">
			<nfwui:Form id="form">
				<script type="text/javascript">
					(function($){
					$.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
					})(jQuery);
				</script>
				
				<imui:listTable id="grvTenninshaIchiran" process="jssp" autoEncode="false" autoWidth="true"
					autoResize="true" height="400" style="word-wrap:break-word;"
					multiSelect="false" data="${form.tenninshaChoshoDataTable }" >
					<pager rowNum="100" />
					<cols sortable="false">
					<col name="col1" caption="社員番号" width="80" sortable="false" align="left" />
					<col name="col2" caption="社員氏名" width="140" sortable="false" align="left" />
					<col name="col3" caption="等級" width="60" sortable="false" align="left" />
					<col name="col4" caption="年齢" width="60" sortable="false" align="right" />
					<col name="col5" caption="新所属"　width="400" sortable="false" align="left" />
					<col name="col6" caption="現所属" width="400" sortable="false" align="left" />
					<col name="col7" caption="備考"  width="158" sortable="false" align="left" />
					<col name="col8" hidden="true"/>	
					<showIcon iconClass="im-ui-icon-common-16-update" />
					</cols>
				</imui:listTable>
			<br />
			<div class="align-L float-L">	
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			<div class="align-R">
			<%-- <nfwui:Button id="confirmBtn" name="confirmBtn" value="取込実行" cssStyle="width:150px;" formId="form" onclick="clickTorikomiBtn()" disabledPatterns="NOT_DATA" /> --%>
				<input id="torikomiBtn" style="width:150px;" type="button" value="取込実行" class="imui-medium-button" onclick="clickTorikomiBtn()" />
			</div>
		</nfwui:Form>
		
		<script type="text/javascript">
			$(document).ready(function() {
				var grid = $("#grvTenninshaIchiran"); // 転任者情報テーブル
				var datas = grid.getGridParam("data"); // テーブル内全行
				
				// 画面項目初期設定
				initDispItems();
				// エラー設定
				setErrStatus();
				
				if (datas.length == 0) {
					// 「取込実行」ボタン非活性
					$("#torikomiBtn").css("color", "#cccccc");
					$("#torikomiBtn").attr("disabled", true);
				}
			});
			
		   /*
			* 画面項目の初期設定
			*/
			function initDispItems() {
				$("#torikomiBtn").css("color", "#333333");
				$("#torikomiBtn").attr("disabled", false);
			}
			
			/*
			 * エラー状態に設定する
			 */
			function setErrStatus() {
				var grid = $("#grvTenninshaIchiran"); // 転任者情報テーブル
				var datas = grid.getGridParam('data'); // テーブル内全行
				
				 for (var i in datas) {
					 console.log(datas[i]);
					 var errCol = datas[i].col8; // エラー項目（カンマ区切）
					 console.log('エラー： ' + errCol);
					 if (errCol !== '' && errCol !== undefined) {
						 var array = errCol.split(',');
						 
						 // エラー項目の配列にセットされているカラムの背景色を変更する。
						 for (var j=0; j < array.length; j++) {
							console.log('エラー配列： ' + array[j]);
							grid.setCell(datas[i].id, array[j], '', { background: '#FF6666' });
						 }
					 }
				 }
			}
			
		   /*
			* 「取込実行」ボタンクリックイベント
			*/
			function clickTorikomiBtn() {
				var dialogTitle = "確認";
				var dialogMessage = "転任者調書データを取り込みます。よろしいですか？";
				var url = "skf/Skf3020Sc003/import";
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
			}
			
			/*
		     * 一つ前の画面へ戻る
		     */
		    function back1() {
		    	var url = "skf/Skf3020Sc002/init?SKF3020_SC002&tokenCheck=0";
		    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
		    }
		</script>
	</div>
	<!-- コンテンツエリア　ここまで -->