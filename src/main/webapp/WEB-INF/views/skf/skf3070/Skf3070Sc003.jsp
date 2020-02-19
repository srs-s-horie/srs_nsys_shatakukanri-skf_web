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
<style>
.ui-jqgrid .ui-jqgrid-htable th div{
	height: 34px;
    white-space:normal;
}
</style>
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" style="width: 95%;">
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<div class="imui-form-container-wide" style="width:95%;">
			<table class="imui-form-search-condition">
				<nfwui:Title id="ownerInfoTitle" code="<%= MessageIdConstant.SKF3070_SC003_OWNER_INFO_TITLE %>" titleLevel="2" />
				 	<tr>
                        　				<th rowspan="5" style="width:9%;">
						<nfwui:LabelBox id="lblOwner" code="<%= MessageIdConstant.SKF3070_SC003_OWNER %>" />
                        </th>
                        <th style="width:12.5%;">
                        	<nfwui:LabelBox id="lblOwnerName" code="<%= MessageIdConstant.SKF3070_SC003_OWNER_NAME %>" />
                        </th>
                        <td style="width:30%;">
                        	${f:h(form.ownerName)}
                        </td>
                        <th  style="width:11%;" rowspan="2">
                        	<nfwui:LabelBox id="lblAddressLocation" code="<%= MessageIdConstant.SKF3070_SC003_ADDRESS_LOCATION %>" />
                        </th>
                        <th style="width:6%;">
                         	<nfwui:LabelBox id="lblZipCode" code="<%= MessageIdConstant.SKF3070_SC003_ZIP_CODE %>" />
                        </th>
                        <td>
                         	${f:h(form.zipCode)}
                     	</td>
                     </tr>
                     <tr>
                     	<th  style="width:12.5%;">
                         	<nfwui:LabelBox id="lblOwnerNameKk" code="<%= MessageIdConstant.SKF3070_SC003_OWNER_NAME_KK %>" />
                     	</th>
                        <td style="width:30%;">
                         	${f:h(form.ownerNameKk)}
                        </td>
                        <th style="width:6%;">
                        	<nfwui:LabelBox id="lblAddress" code="<%= MessageIdConstant.SKF3070_SC003_ADDRESS %>" />
                        </th>
                        <td>
                         	${f:h(form.address)}                              
                        </td>
                     </tr>
                     <tr>
                     	<th style="width:12.5%;">
                     		<nfwui:LabelBox id="lblBusinessKbn" code="<%= MessageIdConstant.SKF3070_SC003_BUSINESS_KBN %>" />
                     	</th>
                        <td style="width:30%;" colspan="5">
							${f:h(form.businessKbn)}
                        </td>
                     </tr>
                     <tr>
                     	<th style="width:12.5%;">
                     		<nfwui:LabelBox id="lblAcceptFlg" code="<%= MessageIdConstant.SKF3070_SC003_ACCEPT_FLG %>" />
                     	</th>
                        <td style="width:30%;" colspan="5">
                        	${f:h(form.acceptFlg)}&nbsp;&nbsp;${f:h(form.acceptStatus)}
                        </td>
                     </tr>
                     <tr>
                     	<th style="width:12.5%;">
                     		<nfwui:LabelBox id="lblRemarks" code="<%= MessageIdConstant.SKF3070_SC003_REMARKS %>" />
                     	</th>
                        <td style="width:30%;" colspan="5">
                        	${form.remarks}
                        </td>
                     </tr>
			</table>
		</div>
		<!-- テーブル一覧箇所 -->
		<div class="imui-form-container-wide" style="width:95%;">
		<!-- 明細部 -->
			<nfwui:Title id="listTitle" code="<%= MessageIdConstant.SKF3070_SC003_BUKKEN_RESULT %>" titleLevel="2" />
		    <!-- listTable表示領域 -->
		    <div id="listTableArea">
	            <imui:listTable id="mainList" process="jssp" autoEncode="true" autoWidth="true" rowNumbers="true"
	                autoResize="true" onCellSelect="onCellSelect"
	                multiSelect="false" data="${form.listTableData}"
	                style="max-height: 1000px"  height="232">
	                	<cols>
							<col name="agencyName" caption="管理機関" width="120" align="left" wrap="true" sortable="false"/>
							<col name="shatakuName" caption="社宅名" width="130" align="left" wrap="true" sortable="false" onCellAttr="cellAttrEllipsis"/>
							<col name="contractKbn" caption="社宅・駐車場区分" width="90" align="left" wrap="false" sortable="false" />
							<col name="address" caption="住所" width="265" align="left" wrap="true" sortable="false" onCellAttr="cellAttrEllipsis"/>
							<col name="roomNo" caption="部屋番号" width="70" align="center" wrap="false" sortable="false"/>
							<col name="structureSupplement" caption="構造" width="65" align="center" wrap="false" sortable="false" />
							<col name="originalMenseki" caption="面積(㎡)" width="50" sortable="false" align="right" wrap="false" sortable="false" />
							<col name="assetRegisterNo" caption="経理連携用管理番号" width="100" align="center" wrap="false" sortable="false" />
							<col name="contractStartDate" caption="契約開始日" width="75" align="center" wrap="false" sortable="false" />
							<col name="contractEndDate" caption="契約終了日" width="75" align="center" wrap="false" sortable="false" />
							<col name="rent" caption="賃料" width="60" align="right" wrap="false" sortable="false" />
							<col name="kyoekihi" caption="共益費" width="60" align="right" wrap="false" sortable="false" />
							<col name="landRent" caption="駐車場料（地代）" width="60" align="right" wrap="false" sortable="false" />
						</cols>
				</imui:listTable>
				<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>
		    </div>
		</div>
		<!-- hidden項目 -->
		<input type="hidden" name="ownerNo" id="ownerNo" value="" />
		<input type="hidden" name="recodeDadefrom" id="recodeDadefrom" value="" />
		<input type="hidden" name="recodeDadeto" id="recodeDadeto" value="" />
		<!-- hidden項目終わり -->
	</nfwui:Form>
	<script type="text/javascript">
	(function($) {
		$(document).ready(function(){
			//リストテーブルのヘッダの内容を書き換える
			$("#jqgh_mainList_contractKbn").html("社宅・駐車場<br />区分");
			$("#jqgh_mainList_originalMenseki").html("面積<br />(㎡)");
			$("#jqgh_mainList_assetRegisterNo").html("経理連携用管理<br />番号");
			$("#jqgh_mainList_landRent").html("駐車場料<br />（地代）");
		});
	})(jQuery);	
	</script>
	<br>
	<%-- フッターエリア --%>
  	<div class="align-L">
    	<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="3" />
	</div>
</div>

<script type="text/javascript">
/**
 * 一つ前の画面へ戻る
 */
function back1() {
	var url = "skf/Skf3070Sc001/init?SKF3070_SC001&tokenCheck=0";
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
}
</script>
