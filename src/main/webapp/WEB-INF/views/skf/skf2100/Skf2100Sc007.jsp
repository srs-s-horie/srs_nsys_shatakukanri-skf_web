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
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<%-- コンテンツエリア --%>
<script type="text/javascript">
	/**
	* メニュー画面へ遷移する。
	*/
	function back1() {
		var backMessage = "前の画面へ戻ります。よろしいですか？";
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf2100Sc007/prevPage", "OK", "キャンセル", this, true);	
	}
	
	/*
	 * リストテーブルの文字色を取得する。
	 */
	function onCellStatusAttr(rowId, val, rawObject, cm, rdata) {
		var style;
			
		switch (val) {
		case '契約中':
			style = 'style="color:blue;"';
			break;
		case '解約済':
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
<div style="width:100%;">

	<div class="imui-form-container-wide" >
		<div class="imui-chapter-title"><h2>検索条件</h2></div>
			<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">
			<!-- hidden項目 -->
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF2100_SC007 %>" />
			<input type="hidden" id="hdnContractKbnSelect" name="hdnContractKbnSelect" value="${form.hdnContractKbnSelect}" />
			<input type="hidden" id="hdnChkFaultSelect" name="hdnChkFaultSelect" value="${form.hdnChkFaultSelect}" />
			<input type="hidden" id="hdnSelIdx" name="hdnSelIdx" value="${form.hdnSelIdx}" />
			
			<nfwui:Table use="search">
				<tbody>
					<tr>
						<th  style="width:8%;white-space: nowrap;">
							<nfwui:LabelBox id="lblRouterNo" code="<%=MessageIdConstant.SKF2100_SC007_ROUTER_NO %>" />
						</th>
						<td colspan="3" style="width:15%;">
							<imui:textbox id="txtRouterNo" name="txtRouterNo" style="ime-mode: disabled;width:95%;" oninput="value = value.replace(/[^0-9]+/i,'');" 
 								type="tel" value="${f:h(form.txtRouterNo)}" cssClass="${form.txtRouterNoErr }" maxlength="10" placeholder="例 1" tabindex="3"/> 
<%-- 							<nfwui:NumberBox id="txtRouterNo" name="txtRouterNo" cssStyle="width: 160px;text-align:left;" --%>
<%--  									maxlength="30" value="${f:h(form.txtRouterNo)}" inputFormat="f0" tabindex="3" />  --%>
						</td>
						<th style="width:8%;white-space: nowrap;">
							<nfwui:LabelBox id="lblIccid" code="<%=MessageIdConstant.SKF2100_SC007_ICCID %>" />
						</th>
						<td colspan="3" style="width:15%;">
							<imui:textbox id="txtIccid" name="txtIccid" class="ime-off"  style="ime-mode: disabled;width:95%;"
								type="text" value="${f:h(form.txtIccid)}" maxlength="20" placeholder="" tabindex="5"/>
						</td>
						<th style="width:8%;white-space: nowrap;">
							<nfwui:LabelBox id="lblArrivalDate" code="<%=MessageIdConstant.SKF2100_SC007_ARRIVAL_DATE %>" />
						</th>
						<td colspan="3" style="width:25%;">
							<nfwui:DateBox id="txtArrivalDateFrom" name="txtArrivalDateFrom" value="${f:h(form.txtArrivalDateFrom)}"
							 cssStyle="width:120px" cssClass="${form.txtArrivalDateFromErr }" tabindex="7"/>
							&nbsp;～&nbsp;&nbsp;
							<nfwui:DateBox id="txtArrivalDateTo" name="txtArrivalDateTo" value="${f:h(form.txtArrivalDateTo)}"
							 cssStyle="width:120px" cssClass="${form.txtArrivalDateToErr }" tabindex="8"/>
							
						</td>
						<th style="width:8%;white-space: nowrap;">
							<nfwui:LabelBox id="lblContractKbn" code="<%=MessageIdConstant.SKF2100_SC007_CONTRACT_KBN %>" />
						</th>
						<td >
							<imui:select id="contractKbnDropDown" name="contractKbnDropDown" width="100px" list="${form.contractKbnDropDownList}" 
								 tabindex="11" />
						</td>
					</tr>
					<tr>
						<th style="width:10%;"> 
							<nfwui:LabelBox id="lblTel" code="<%=MessageIdConstant.SKF2100_SC007_TEL %>" />
						</th>
						<td colspan="3" >
							<imui:textbox id="txtTel" name="txtTel" class="ime-off" style="ime-mode: disabled;width:95%;"
								type="text" value="${f:h(form.txtTel)}" maxlength="13" placeholder="例 000-0000-0000" tabindex="4"/>	
						</td>
						<th style="width:8%;white-space: nowrap;">
							<nfwui:LabelBox id="lblImei" code="<%=MessageIdConstant.SKF2100_SC007_IMEI %>" />
						</th>
						<td colspan="3">
							<imui:textbox id="txtImei" name="txtImei" class="ime-off" style="ime-mode: disabled;width:95%;"
								type="text" value="${f:h(form.txtImei)}" maxlength="15" placeholder="" tabindex="6"/>	
						</td>
						<th style="width:8%;white-space: nowrap;">
							<nfwui:LabelBox id="lblContractEndDate" code="<%=MessageIdConstant.SKF2100_SC007_CONTRACT_END_DATE %>" />
						</th>
						<td colspan="3">
							<nfwui:DateBox id="txtContractEndDateFrom" name="txtContractEndDateFrom" value="${f:h(form.txtContractEndDateFrom)}"
							 cssStyle="width:120px" cssClass="${form.txtContractEndDateFromErr }" tabindex="9"/>
							&nbsp;～&nbsp;&nbsp;
							<nfwui:DateBox id="txtContractEndDateTo" name="txtContractEndDateTo" value="${f:h(form.txtContractEndDateTo)}"
							 cssStyle="width:120px" cssClass="${form.txtContractEndDateToErr }" tabindex="10"/>
							
						</td>
						<th>
							<nfwui:LabelBox id="lblFault" code="<%=MessageIdConstant.SKF2100_SC007_FAULT_FLAG %>" />
						</th>
						<td>
							&nbsp;<imui:checkbox id="chkFault" name="chkFault" value="1" 
								checked="${form.hdnChkFaultSelect}"  tabindex="12"/>
						</td>
					</tr>
				</tbody>
			</nfwui:Table>
			<div class="align-L">
				<imui:button id="search" name="search" value="検索" class="imui-small-button" tabindex="13" />
			</div>
		</div>

		<!-- 明細＆細目未満 -->
		<div class="imui-form-container-wide">
			<!-- 明細部 -->
			<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
			<script type="text/javascript">
			  (function($){
			    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			  })(jQuery);
			</script>
			<imui:listTable id="mainList" process="jssp" autoWidth="true" shrinkToFit="false" rowNumbers="true" height="320" rowNumWidth="35"
				autoResize="true" onCellSelect="onCellSelect" multiSelect="false" data="${form.searchDataList }"
				style="max-height:1000px;" >
				<pager rowNum="100" />
				<cols sortable="false">

					<col name="col1" caption="通しNo" width="60" sortable="false" wrap="true" align="left"/>
					<col name="col2" caption="電話番号" width="200" sortable="false" wrap="true" align="left"/>
					<col name="col3" caption="ICCID(識別番号)" width="200" sortable="false" wrap="true" align="left"/>
					<col name="col4" caption="IMEI(製造番号)" width="200" sortable="false" wrap="true" align="left"/>
					<col name="col5" caption="ルーター入荷日" width="150" sortable="false" wrap="true" align="center"/>
					<col name="col6" caption="ルーター契約終了日" width="150" sortable="false" wrap="true" align="center"/>
					<col name="col7" caption="契約区分" width="150" sortable="false" wrap="true" align="left" onCellAttr="onCellStatusAttr"/>
					<col name="col8" caption="故障" width="100" sortable="false" wrap="true" align="left" />
					<col name="col9" caption="詳細" width="100" sortable="false" align="center" tabindex="14">
						<showIcon iconClass="im-ui-icon-common-16-update" align="center" />
					</col>
					<col name="col10" hidden="true"/>
				</cols>
			</imui:listTable>
				<br />
			<div class="align-R">
				<imui:button id="new" name="new" value="新規" class="imui-medium-button" style="width: 150px" tabindex="15" />
			</div>
		
		</div>
	
	</nfwui:Form>
</div>


	<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			$(".imui-toolbar-icon").removeAttr("onclick");
			$(".imui-toolbar-icon").click(function(e) {
				back1();
			});
			
			
			/*
			 * 「検索」ボタン押下時
			 */
			$("#search").bind('click', function() {
				var element = document.getElementById( "chkFault" ) ;
				
				if ( element.checked ) {
					// チェックされている
					$("#hdnChkFaultSelect").val("true");
				} else {
					// チェックされていない
					$("#hdnChkFaultSelect").val(null);
				}
				$("#hdnContractKbnSelect").val($("#contractKbnDropDown").val());
				
				nfw.common.submitForm("form", "skf/Skf2100Sc007/search");
			});
			
			/*
			 * 「新規」ボタン押下時
			 */
			$("#new").bind('click', function() {

				$("#hdnContractKbnSelect").val($("#contractKbnDropDown").val());
				$("#hdnSelIdx").val('');
				
				nfw.common.submitForm("form", "skf/Skf2100Sc007/details");
			});
			
		});
		/*
		 * リストテーブル選択時
		 * 処理がされるのは、「詳細」アイコン押下時のみ（「貸出管理簿登録」画面へ遷移）
		 */
		onCellSelect = function(rowId, iCol, cellcontent, e) {
			
			if($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
				$("#hdnSelIdx").val(rowId);
				
				var url = "skf/Skf2100Sc007/details";
				nfw.common.submitForm('form', url);
			}
		}
		
	})(jQuery);
	</script>
<!-- コンテンツエリア　ここまで -->