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

<!-- コンテンツエリア:モックのまま -->
<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" enctype="multipart/form-data">
	<div style="width:100%;" >
		<div class="imui-form-container-wide">
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th>
							<label style="width:115px;">転任者調書</label>
						</th>
						<td style="width:98%;">
							<nfwui:FileBox id="fuTenninsha" name="fuTenninsha" />
							 <%-- <input type="file" size="40" accept=".csv"/> --%>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="align-L">
				<input type="button" value="取込" class="imui-medium-button" onclick="clickTorikomiBtn()"/>
			</div>
			<br /><br />
			<div class="align-L">
				<c:if test="${form.backBtnHiddenFlg == 'false'}">
					<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
				</c:if>
			</div>

		</div>
	</div>
</nfwui:Form>

		<script type="text/javascript">
			/*
			* 「取込」ボタンクリックイベント
			*/
			function clickTorikomiBtn() {
				var dialogTitle = "確認";
				var dialogMessage = "転任者調書ファイルの取込を開始します。よろしいですか？";
				var url = "skf/Skf3020Sc002/import";
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
			}
			
			 /**
		     * 一つ前の画面へ戻る
		     */
		    function back1() {
		    	var url = "skf/Skf3020Sc004/init?SKF3020_SC004&tokenCheck=0";
		    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
		    }
		</script>
	<!-- コンテンツエリア　ここまで -->