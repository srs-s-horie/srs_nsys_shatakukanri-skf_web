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


<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3050_SC001%>" />
	<input type="hidden" name="shainListData" id="shainListData" value="" /><!-- 社員情報リスト -->
	<input type="hidden" name="hdnPageMax" id="hdnPageMax" value="${form.listTableMaxRowCount}" /><!-- ページ最大数 -->
	<input type="hidden" name="listPage" id="listPage" value="${form.listPage}" />
	<div class="imui-form-container-wide" >
		<div id="listTableArea">
			<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="false"
				autoResize="true" multiSelect="false" data="${form.listTableData}" page="${form.listPage}" onPaging="onPaging"
				 tabindex="1">
				<pager rowNum="${form.listTableMaxRowCount}" />
				<cols sortable="false">
				<col name="colShainNo" caption="社員番号" width="120" sortable="false" align="left" wrap="true"/>
				<col name="colShainName" caption="社員氏名" width="200" sortable="false" align="left" wrap="true"/>
				<col name="colShozoku" caption="所属"　width="250" sortable="false" align="left" wrap="true"/>
				<col name="colTxtShainNo" caption="社員番号" width="120" sortable="false" align="center" wrap="true"/>
				<col name="colShainNameJugyoin" caption="従業員マスタ:社員氏名"  width="200" sortable="false" align="left" wrap="true"/>
				<col name="colShozokuJugyoin" caption="従業員マスタ:所属" width="250" sortable="false" align="left" wrap="true"/>
				<col name="hdnCompanyCd" caption="" hidden="true"/>
				<col name="hdnShainNoChangeFlg" caption="" hidden="true"/>
				<col name="hdnUpdateDateSS" caption="" hidden="true"/>
				<col name="hdnUpdateDateSL" caption="" hidden="true"/>
				<col name="hdnShatakuKanriId" caption="" hidden="true"/>
				<col name="hdnUpdateDateNew" caption="" hidden="true"/>
				<col name="hdnFlg" caption="" hidden="true"/>
				<col name="hdnTaikyoDate" caption="" hidden="true"/>
				<col name="hdnKyojushaKbn" caption="" hidden="true"/>
				<col name="hdnTxtBoxName" caption="" hidden="true"/>
				</cols>
			</imui:listTable>
		</div>
		<br />
		<script type="text/javascript">
			//社員情報リスト生成
			function setShainListData(){
                $("#regist").attr("disabled", true); // 登録ボタンを非活性にする
                $('#regist').addClass("imui-disabled-button");
				//選択行
				var shainList=[];
				var grid = $('#mainList');
				var rows = grid.getRowData(); //get data
				for (var idx in rows) {
					var row = rows[idx];
					var page = $('#mainList').getGridParam('page');
					var pagem = $('#hdnPageMax').val();
					var pagemax =  Number(pagem);
					var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
					$("#listPage").val(page);
					
					//行データ取得
					var boxName= row.hdnTxtBoxName;
					var tempStr = [];
					var shainNo = row.colShainNo;//社員番号
					var shainName = row.colShainName;//社員名
					var txtShainNo = $('#'+ boxName).val();//社員番号(txt)
					var shainNameJugyoin = row.colShainNameJugyoin;//従業員マスタ:社員氏名
					var shozokuJugyoin = row.colShozokuJugyoin//従業員マスタ:所属
					var updateDateNew = row.hdnUpdateDateNew;//入退居予定更新日時
					
					tempStr.push(shainNo);
					tempStr.push(shainName);
					tempStr.push(txtShainNo);
					tempStr.push(shainNameJugyoin);
					tempStr.push(shozokuJugyoin);
					tempStr.push(updateDateNew);
					tempStr.push(boxName);
					
					shainList.push(tempStr.join(","));		//配列で格納						
					
				}
				//送信データ設定
				$("#shainListData").val(shainList.join(";"));
				
				nfw.common.submitForm("form", "skf/Skf3050Sc001/shainConfirm");
			};
			
			function setRegistListData(){
				//選択行
				var shainList=[];
				var grid = $('#mainList');
				var rows = grid.getRowData(); //get data
				for (var idx in rows) {
					var row = rows[idx];
					var page = $('#mainList').getGridParam('page');
					var pagem = $('#hdnPageMax').val();
					var pagemax =  Number(pagem);
					var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
					$("#listPage").val(page);
					
					//行データ取得
					var boxName= row.hdnTxtBoxName;
					var tempStr = [];
					var shainNo = row.colShainNo;//社員番号
					var shainName = row.colShainName;//社員名
					var txtShainNo = $('#'+ boxName).val();//社員番号(txt)
					var shainNameJugyoin = row.colShainNameJugyoin;//従業員マスタ:社員氏名
					var shozokuJugyoin = row.colShozokuJugyoin//従業員マスタ:所属
					var shainNoChangeFlg = row.hdnShainNoChangeFlg
					var shatakuKanriId = row.hdnShatakuKanriId
					var companyCd = row.hdnCompanyCd
					var flg = row.hdnFlg
					var taikyoDate = row.hdnTaikyoDate
					var kyojushaKbn = row.hdnKyojushaKbn
					var updateDateSL = row.hdnUpdateDateSL
					var updateDateSS = row.hdnUpdateDateSS
					var updateDateNew = row.hdnUpdateDateNew;//入退居予定更新日時
					
					tempStr.push(shainNo);
					tempStr.push(shainName);
					tempStr.push(txtShainNo);
					tempStr.push(shainNameJugyoin);
					tempStr.push(shozokuJugyoin);
					tempStr.push(shainNoChangeFlg);
					tempStr.push(shatakuKanriId);
					tempStr.push(companyCd);
					tempStr.push(flg);
					tempStr.push(taikyoDate);
					tempStr.push(kyojushaKbn);
					tempStr.push(updateDateSL);
					tempStr.push(updateDateSS);
					tempStr.push(updateDateNew);
					tempStr.push(boxName);
					
					shainList.push(tempStr.join(","));		//配列で格納						
					
				}
				//送信データ設定
				$("#shainListData").val(shainList.join(";"));
				dialogTitle = "確認";
				dialogMessage = "社員番号一括設定処理を実行します。よろしいですか？";//infomation.skf.i_skf_3034
		    	nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3050Sc001/regist", "ok", "キャンセル", this, true);	
				//nfw.common.submitForm("form", "skf/Skf3050Sc001/regist");
			};
			
	        $(document).ready(function() {
	            // 入力された社員番号の変更イベント
	        	jQuery(document).on("focus", "input", function() {
	        		 $(this).attr("data-old-val",$(this).val());
	    		});
	            
	        	jQuery(document).on("blur", "input", function() {
                    var oldVal=($(this).attr("data-old-val")); // 変更前社員番号
                    var newVal=($(this).val()); // 変更後社員番号
                    if (oldVal!=newVal)
                    {
                        $("#regist").attr("disabled", true); // 登録ボタンを非活性にする
                        $('#regist').addClass("imui-disabled-button");
                    }
	    		});
				

	        });
			(function($) {
				onPaging = function(e,index) {
	                $("#regist").attr("disabled", true); // 登録ボタンを非活性にする
	                $('#regist').addClass("imui-disabled-button");
				}
			})(jQuery);
		</script>
		<div class="align-R">
			<imui:button id="shainInfoCheck" name="shainInfoCheck" value="社員情報確認" class="imui-medium-button" 
			style="width: 150px" tabindex="3" disabled="${form.btnShainInfoCheckDisabled}" onclick="setShainListData()"/>
			<imui:button id="regist" name="regist" value="登録" class="imui-medium-button" 
			style="width: 150px" tabindex="4" disabled="${form.btnRegistDisabled}" onclick="setRegistListData()"/>
		</div>
	</div>
</div>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->