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



<%-- コンテンツエリア --%>
<style type="text/css">

</style>
<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
  (function($){
    // 画面表示時に定義される処理
    $(document).ready(function(){

    });

   

  })(jQuery);
</script>


<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
	<div class="imui-form-container-wide">
		<!-- 検索条件-->
		<table class="imui-form-search-condition" width="100%" style="border: none;" >
		<nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF3070_SC001_SEARCH_TITLE %>" titleLevel="2" />
			 <table class="imui-form-search-condition" >
				<tr>
					<th style="width: 200px;">
						<nfwui:LabelBox id="lblOwnerName" code="<%= MessageIdConstant.SKF3070_SC001_OWNER_NAME %>" />
					</th>
					<td colspan="2">
   						<imui:textbox id="ownerName" name="ownerName" value="${form.ownerName}" placeholder="例 中日本 一郎" tabindex="1"/>
   					</td>
   					<th style="width: 200px;">
						<nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF3070_SC001_SHATAKU_NAME %>" />
					</th>
					<td colspan="2">
   						<imui:textbox id="shatakuName" name="shatakuName" value="${form.shatakuName}" placeholder="例 社宅名" />
   					</td>
				</tr>
				<tr>
					<th style="width: 200px;">
						<nfwui:LabelBox id="lblOwnerNameKk" code="<%= MessageIdConstant.SKF3070_SC001_OWNER_NAME_KK %>" />
					</th>
					<td colspan="2">
   						<imui:textbox id="ownerNameKk" name="ownerNameKk" value="${form.ownerName}" placeholder="例 ナカニホン　イチロウ" tabindex="2"/>
   					</td>
   					<th style="width: 200px;">
						<nfwui:LabelBox id="lblShatakuAddress" code="<%= MessageIdConstant.SKF3070_SC001_SHATAKU_ADDRESS %>" />
					</th>
					<td colspan="2">
   						<imui:textbox id="shatakuAddress" name="shatakuAddress" value="${form.shatakuAddress}" 
   						placeholder="例 愛知県名古屋市中区錦2-18-19" tabindex="2"/>
   					</td>
				</tr>
				<tr>
					<th style="width: 200px;">
						<nfwui:LabelBox id="lblAddress" code="<%= MessageIdConstant.SKF3070_SC001_ADDRESS %>" />
					</th>
					<td colspan="2">
   						<imui:textbox id="address" name="address" value="${form.address}"  width="100%" 
   							placeholder="例 愛知県名古屋市中区錦2-18-19"  tabindex="3"/>
   					</td>
   					<th style="width: 200px;">
						<nfwui:LabelBox id="lblTargetYear" code="<%= MessageIdConstant.SKF3070_SC001_TARGET_YEAR %>" />
					</th>
					<td colspan="2">
						<imui:select id="targetYear" name="targetYear" list="${form.ddlTargetYearList}" width="30%"  tabindex="4"/>
   					</td>
				</tr>
				<tr>
					<th style="width: 200px;">
						<nfwui:LabelBox id="lblBusinessKbn" code="<%= MessageIdConstant.SKF3070_SC001_BUSINESS_KBN %>" />
					</th>
					<td colspan="2">
   						<imui:select id="businessKbn" name="businessKbn" list="${form.ddlBusinessKbnList}" width="30%"
   							 tabindex="5"/>
   					</td>
   					<th style="width: 200px;">
						<nfwui:LabelBox id="lblTargetYear" code="<%= MessageIdConstant.SKF3070_SC001_ACCEPT_STATUS %>" />
					</th>
					<td colspan="2">
						<imui:select id="acceptFlg" name="acceptFlg" list="${form.ddlAcceptFlgList}" width="80%"
							 tabindex="6"/>
   					</td>
				</tr>
			 </table>
			<div class="align-L">
					<nfwui:Button id="search" name="search" value="検索" cssClass="imui-small-button" 
						url="skf/Skf3070Sc001/search" formId="form" tabindex="7" />
			</div>
		</table>
	</div>
	<!-- テーブル一覧箇所 -->
	<div class="imui-form-container-wide" style="top: 660px;">
	<!-- 明細部 -->
		<nfwui:Title id="listTitle" code="<%= MessageIdConstant.SKF3070_SC001_SEARCH_RESULT %>" titleLevel="2" />
	    <!-- listTable表示領域 -->
	    <div id="listTableArea">
            <imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true"
                autoResize="true" onCellSelect="onCellSelect"
                multiSelect="false" data="${form.listTableData}"
                style="max-height: 1000px" 
                height="232">
		         <pager rowNum="${form.listTableMaxRowCount}" />
					<cols sortable="false">
						<col name="ownerNo" hidden="true" />
						<col name="ownerName" caption="氏名又は名称" width="130" align="left" wrap="false"/>
						<col name="ownerNameKk" caption="氏名又は名称（フリガナ）" width="200" align="left" wrap="false" />
						<col name="address" caption="住所(居所）又は所在地" width="200" align="left" wrap="true" />
						<col name="businessKbn" caption="個人法人" width="50" align="center" wrap="false" />
						<col name="acceptFlg" caption="個人番号" width="200" align="left" wrap="false" />
						<col name="propertiesOwnedCnt" caption="所持物件数" width="60" align="right" wrap="false" />
						<col name="edit" caption="編集" width="30" sortable="false" align="center">
							<showIcon iconClass="im-ui-icon-common-16-update" />
						</col>
						<col name="properties" caption="物件" width="30" sortable="false" align="center" >
							<showIcon iconClass="im-smart-icon-common-16-information" />
						</col>
					</cols>
			</imui:listTable>
			<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>
	    </div>
    </div>
</nfwui:Form>

<%-- フッターエリア --%>
<div class="align-R">
	<input name="statutoryRecordOutput" id="" type="button" value="法定調書データ出力" class="imui-medium-button" style="width:150px"/>
	<input name="ownerInfoOutput" id="" type="button" value="賃貸人（代理人）情報出力" class="imui-medium-button"  style="width:200px"/>
	<nfwui:Button cssStyle="width:150px;" id="resistBtn" formId="form" value="新規登録"
		cssClass="imui-medium-button" url="skf/Skf3070Sc002/init"/>
</div>

