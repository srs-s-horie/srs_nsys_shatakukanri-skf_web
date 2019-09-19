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

jQuery(function ($) {
	$("#closeBtnTest").click(function() {
		window.open('about:blank','_self').close();
	});
});
</script>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
<div style="width:100%;" >
	<div class="imui-form-container-wide">
		<div style="height:30px; bottom:10px">現在の社宅入居状況です。</div>

		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3020_SC001 %>" />

		<!-- 社員情報 -->
		<div class="imui-chapter-title"><h2>社員情報</h2></div>
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- 社員番号 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblShainNoTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_SHAIN_NUMBER %>" />
					</th>
					<td>
						<label>${form.shainNo}<label>
					</td>
					<!-- 社員氏名 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblShainNameTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_SHAIN_NAME %>" />
					</th>
					<td>
						<label>${form.shainName}<label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>

		<!-- 社宅入居状況 -->
		<div class="imui-chapter-title"><h2>社宅入居状況</h2></div>
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- 居住者区分 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblKyojyuKbnTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_KYOJYU_KBN %>" />
					</th>
					<td>
						<label>${form.jyukyoKbn}<label>
					</td>
				</tr>
				<tr>
					<!-- 社宅区分 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblShatakuKbnTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_SHATAKU_KBN %>" />
					</th>
					<td>
						<label>${form.shatakuKbn}<label>
					</td>
				</tr>
				<tr>
					<!-- 社宅名 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblShatakuNameTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_SHATAKU_NAME %>" />
					</th>
					<td>
						<label>${form.shatakuName}<label>
					</td>
				</tr>
				<tr>
					<!-- 住所 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblAddressTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_ADDRESS %>" />
					</th>
					<td>
						<label>${form.address}<label>
					</td>
				</tr>
				<tr>
					<!-- 部屋番号 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblRoomNoTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_ROOMNO %>" />
					</th>
					<td>
						<label>${form.roomNo}<label>
					</td>
				</tr>
				<tr>
					<!-- 用途 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblOriginalAuseTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_ORIGINALAUSE %>" />
					</th>
					<td>
						<label>${form.ause}<label>
					</td>
				</tr>
				<tr>
					<!-- 規格 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblKikakuTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_NOW_ROOM_KIKAKU %>" />
					</th>
					<td>
						<label>${form.kikaku}<label>
					</td>
				</tr>
				<tr>
					<!-- 面積 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblMensekiTitle" code="<%=MessageIdConstant.SKF3020_SC001_LBL_NOW_ROOM_MENSEKI %>" />
					</th>
					<td>
						<label>${form.menseki}<label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>

		<nfwui:Table use="search" remove="${form.remove}">
			<tbody>
				<tr>
					<!-- 居住者区分 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblKyojyuKbnTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_KYOJYU_KBN %>" />
					</th>
					<td>
						<label>${form.jyukyoKbn2}<label>
					</td>
				</tr>
				<tr>
					<!-- 社宅区分 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblShatakuKbnTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_SHATAKU_KBN %>" />
					</th>
					<td>
						<label>${form.shatakuKbn2}<label>
					</td>
				</tr>
				<tr>
					<!-- 社宅名 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblShatakuNameTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_SHATAKU_NAME %>" />
					</th>
					<td>
						<label>${form.shatakuName2}<label>
					</td>
				</tr>
				<tr>
					<!-- 住所 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblAddressTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_ADDRESS %>" />
					</th>
					<td>
						<label>${form.address2}<label>
					</td>
				</tr>
				<tr>
					<!-- 部屋番号 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblRoomNoTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_ROOMNO %>" />
					</th>
					<td>
						<label>${form.roomNo2}<label>
					</td>
				</tr>
				<tr>
					<!-- 用途 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblOriginalAuseTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_ORIGINALAUSE %>" />
					</th>
					<td>
						<label>${form.ause2}<label>
					</td>
				</tr>
				<tr>
					<!-- 規格 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblKikakuTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_NOW_ROOM_KIKAKU %>" />
					</th>
					<td>
						<label>${form.kikaku2}<label>
					</td>
				</tr>
				<tr>
					<!-- 面積 -->
					<th style="width: 20%;">
						<nfwui:LabelBox id="lblMensekiTitle2" code="<%=MessageIdConstant.SKF3020_SC001_LBL_NOW_ROOM_MENSEKI %>" />
					</th>
					<td>
						<label>${form.menseki2}<label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div class="align-R">
			<!-- 画面を閉じる ボタン -->
			<nfwui:PopupButton id="closeBtn" value="画面を閉じる" cssClass="imui-medium-button" modalMode="true" use="cancel" />				
		</div>

	</div>
</div>
</br>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->


