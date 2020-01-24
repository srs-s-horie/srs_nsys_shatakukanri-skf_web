<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<script src="scripts/skf/skfCommon.js"></script>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>
<script type="text/javascript">
(function($) {
    
	// 画面表示時に定義される処理
	$(document).ready(function(){

		// フォーカスを合わせる
		document.getElementById('carryingInOutTermFromDiv').focus();

		// ボタン押下時のイベント
		preButtonEvent = function (mode) {
			var dialogTitle = "";
			var dialogMessage = "";
			var url = "";
			var grid = null;
			var row = null;
			var id = null;

			// 日付入力域のスタイルをもとに戻す（サーバ側では戻せない？）
			document.getElementById('carryingInOutTermFrom').className = "";
			document.getElementById('carryingInOutTermTo').className = "";
			
			// WARNINGメッセージ領域を削除
			$('.imui-box-warning').css('display','none');
			$('.imui-box-caution').css('display','none');
			
			dialogTitle = "確認";
			dialogMessage = "備品搬入搬出確認リストを出力します。よろしいですか？";
			url = "skf/Skf3040Sc002/download";
			nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
		}
	});

})(jQuery);
</script>
<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">

	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3040_SC002 %>" />

	<div style="width:100%;" >
	    <div class="imui-form-container-wide">
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3040_SC002 %>" />
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th style="width: 11%;">
								<nfwui:LabelBox id="lblCarryingInOutTerm" code="<%=MessageIdConstant.SKF3040_SC002_CARRYING_IN_OUT_TERM %>" />
							</th>
							<td colspan="2" style="width: 410px;">
                                <nfwui:DateBox id="carryingInOutTermFrom" name="carryingInOutTermFrom" value="${f:h(form.carryingInOutTermFrom)}"
                                               cssClass="${f:h(form.carryingInOutTermFromErr)}" tabindex="1" cssStyle="width:100px"/>
								&nbsp;～&nbsp;
                                <nfwui:DateBox id="carryingInOutTermTo" name="carryingInOutTermTo" value="${f:h(form.carryingInOutTermTo)}"
                                               cssClass="${f:h(form.carryingInOutTermToErr)}" tabindex="2" cssStyle="width:100px"/>
							</td>
						</tr>
						<tr>
							<th>
								<nfwui:LabelBox id="lblOutSituation" code="<%=MessageIdConstant.SKF3040_SC002_OUT_SITUATION %>" />
							</th>
							<td colspan="2" style="width: 410px;">
                                <nfwui:RadioButtonGroup id="outSituation">
                                	<nfwui:RadioButton id="outSituationNotInclude" name="outSituation" value="<%=CodeConstant.NO %>" label="出力済みを含まない" tabindex="3"/>
                                	&nbsp;<nfwui:RadioButton id="outSituationInclude" name="outSituation" value="<%=CodeConstant.YES %>" label="出力済みを含む" tabindex="4"/>
                                </nfwui:RadioButtonGroup>
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
			<br/>
			<div class="align-R">	
				<imui:button id="download" name="download" value="備品搬入・搬出確認リスト出力" class="imui-medium-button" onclick="preButtonEvent()" tabindex="5" />
			</div>
		</div>
    </div>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->

