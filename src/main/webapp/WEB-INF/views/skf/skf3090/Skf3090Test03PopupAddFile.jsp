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
<style type="text/css">
	/* ヘッダテキスト中央寄せ */
	.ui-jqgrid .ui-jqgrid-htable th div {
		display:table-cell;
	    height: 32px;
		text-align:center;
		vertical-align:middle;
	}
	
	/* データ行の改行許容 */
	#sampleListTable1 tr td{
		white-space:normal;
	}

</style>
<div id="imui-container" style="width:650px;min-width:650px;max-width: 1000px;">
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="550px" style="width:100%; min-width:550px;max-width: 550px;">
	<div class="imui-chapter-title"><h2>添付資料選択</h2></div>
	<div style="height:75px">１、<font color="green">「参照」</font>をクリックし、添付資料を選択してください。<br>
	２、選択後、<font color="green">「申請書類に添付」</font>をクリックしてください。<br>
	３．添付書類の登録終了後、<font color="green">「画面を閉じる」</font>をクリックすると、<br>　　申請画面に戻ります。</div>
	<nfwui:Table use="serch">
		<tbody>
			<tr>
				<th style="width: 3%;">
					<label>申請書類名</label>
				</th>
				<td style="width: 10%;">
					入居希望等申請
				</td>
			</tr>
			<!--<tr>
				<th style="width: 3%;">
					<label>添付資料検索</label>
				</th>
				<td style="width: 10%;">
					
				</td>
			</tr>  -->

		</tbody>
	</nfwui:Table>
<br>
	<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data" secureToken="false">
	<!-- 明細部 -->
		<div class="imui-chapter-title"><h2>添付資料一覧</h2></div>

		<table name="imui-8eqlrzst4hv6std" id="sampleListTable1" style="width: 550px">
		<tr><td>
			<nfwui:FileUpload outerFormId="form" onSuccess="upDown1" />
			<nfwui:FileDownload uploadId="form" pageId="Skf3090_Test03" name="dlFile" componentId="upDown1" />
		</td></tr>
		</table>

		<div id="sampleListTable1-pager"></div>
	</nfwui:Form>

	<br>
	<div class="align-R">
		<input style="width:100px;" id="" type="button" value="画面を閉じる" class="imui-small-button"  onclick="window.close()"/>
		
	</div>
</div>
</div>