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

//リストテーブルの入退去予定作成区分の文字色変更
function onCellAttr(rowId,val,rawObject,cm,rdata){
	  var style;
	  switch (val) {
	  case '作成済':
	      style = 'style="color:blue;"';
	      break;
	  case '未作成':
	      style = 'style="color:red;"';
	      break;	  
	  default:
	      style = 'style="color:black;"';
    break;
	  }
    return style;
}

</script>

<!-- コンテンツエリア -->
<div id="imui-container" style="width:650px;min-width:650px;max-width: 1000px;">
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="550px" style="width:100%; min-width:550px;max-width: 550px;">
<div style="height:30px; bottom:10px">現在の社宅入居状況です。</div>
	<nfwui:Title code="<%= MessageIdConstant.SKF2010_SC001_SEARCH_TITLE %>" titleLevel="2" />
	<nfwui:Form id="searchForm" name="searchForm" modelAttribute="form" >
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2010_SC001_SHAIN_NO %>" />
					</th>
					<td style="width: 10%;">
					    <imui:textbox id="shainNo" name="shainNo" style="width:260px;" value="${form.shainNo}" class="${form.errShainNo}" />
					</td>
				</tr>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2010_SC001_NAME %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="name" name="name" style="width:260px;" value="${form.name}" class="${form.errName}" />
					</td>
				</tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblNameKk" code="<%= MessageIdConstant.SKF2010_SC001_NAME_KK %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="nameKk" name="nameKk" style="width:260px;" value="${form.nameKk}" class="${form.errNameKk}" />
					</td>
				</tr>
				<tr>
					<th style="width: 7%;">
					  <nfwui:LabelBox id="lblGenShozoku" code="<%= MessageIdConstant.SKF2010_SC001_AGENCY %>" />
					</th>
					<td style="width: 10%;">
					  <imui:textbox id="agency" name="agency" style="width:260px;" value="${form.agency}" class="${form.errAgency}" />
					</td>
				</tr>

			</tbody>
		</nfwui:Table>
	</nfwui:Form>
	<div class="align-L">	
	    <nfwui:Button id="search" name="search" value="検索"
	    cssClass="imui-small-button" url="skf/Skf2010Sc001/Search"
	    formId="searchForm" />
		<!--<input type="button" value="クリア" class="imui-small-button" >-->
				</div>
<br>
			<!-- 明細＆細目未満 -->
	<!-- 明細部 -->
	<nfwui:Form id="sampleList1" name="sampleList1" modelAttribute="form" secureToken="false">
	    <nfwui:Title code="<%= MessageIdConstant.SKF2010_SC001_SEARCH_RESULT %>" titleLevel="2" />
		<script type="text/javascript">
			(function($){
			$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			})(jQuery);
		</script>

		<imui:listTable id="shainList" name="shainList"
		data="${form.listTableList}" onCellSelect="onCellSelect"
		width="550" height="200" multiSelect="false">
		<pager rowNum="1000" />
		<cols>
		  <col name="shainNo" width="100" sortable="false" caption="社員番号" />
		  <col name="name" width="200" sortable="false" caption="氏名" />
		  <col name="nameKk" hidden="true" />
		  <col name="agency" width="255" sortable="false" caption="現所属" />
		</cols>
		</imui:listTable>

		<style type="text/css">  
			<!--
				/* ヘッダテキスト中央寄せ */
				.ui-jqgrid .ui-jqgrid-htable th div {
					display:table-cell;
				    height: 32px;
					text-align:center;
					vertical-align:middle;
				}
				/** 1行間隔で網掛け挑戦
				.testcss {
					border: 1px solid #a6c9e2;
					background-color: #e6e6fa ;
					color: #222222;
				}

				.ui-row-even {
					background-color: #e6e6fa ;
				}
				*/

				/* データ行の改行許容 */
				#shainList tr td{
					white-space:normal;
				}
			-->
		</style>
	</nfwui:Form>
	<br>
<div class="align-R">
	<imui:button id="closeBtn" name="closeBtn" value="画面を閉じる" style="width:100px;" class="imui-small-button" />
	<imui:button id="selectBtn" name="selectBtn" value="選択" style="width:100px;" class="imui-small-button" />
	<!--<input style="width:100px;" id="" type="button" value="キャンセル" class="imui-small-button"  onclick="window.close()"/>-->
	<input type="hidden" id="targetRowId" value="" />
</div>
</div>
</div>
<!-- コンテンツエリア　ここまで -->


