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
<script type="text/javascript">
function back1() {
	var url="skf/Skf3010Sc001/init?SKF3010_SC001&tokenCheck=0"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
}

// リストテーブルの貸与区分の文字色変更
function onCellAttr(rowId,val,rawObject,cm,rdata){
	  var style;
	  switch (val) {
	  case '貸与可能':
	      style = 'style="color:blue;"';
	      break;
	  case '貸与不可':
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
		<div class="imui-form-container-wide" >
			<div class="imui-form-container-wide"  style="width:95%;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
				<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC004 %>" />
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 5%;">
<!-- 									<label style="height:24px;">社宅名</label> -->
									<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC004_SHATAKU_NAME %>" />
								</th>
								<td style="width: 5%;">
 									<label>${form.shatakuName}<label>
								</td>
								<th style="width: 5%;">
<!-- 									<label>地域区分</label> -->
									<nfwui:LabelBox id="lblAreaKbn" code="<%=MessageIdConstant.SKF3010_SC004_AREA_KBN %>" />
								</th>
								<td style="width: 5%;">
									<label>${form.areaKbn}<label>
								</td>
								<th style="width: 5%;">
<!-- 									<label>社宅区分</label> -->
									<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC004_SHATAKU_KBN %>" />
								</th>
								<td style="width: 5%;">
									<label>${form.shatakuKbn}<label>
								</td>
								<th style="width: 6%;">
<!-- 									<label>空き部屋数</label> -->
									<nfwui:LabelBox id="lblEmptyRoomCount" code="<%=MessageIdConstant.SKF3010_SC004_EMPTY_ROOM_COUNT %>" />
								</th>
								<td style="width: 5%;">
									<label>${form.emptyRoomCount}<label>
								</td>
								<th style="width: 7%;">
<!-- 									<label>空き駐車場数</label> -->
									<nfwui:LabelBox id="lblEmptyParkingCount" code="<%=MessageIdConstant.SKF3010_SC004_EMPTY_PARKING_COUNT %>" />
								</th>
								<td style="width: 5%;">
									<label>${form.emptyParkingCount}<label>
								</td>
							</tr>
							<tr>
								<th style="width: 5%;">
<!-- 									<label>本来用途</label> -->
									<nfwui:LabelBox id="lblOriginalAuse" code="<%=MessageIdConstant.SKF3010_SC004_ORIGINAL_AUSE %>" />
								</th>
								<td style="width: 5%;">
								<imui:select id="originalAuse" name="originalAuse" 
									width="110" list="${form.auseList}" tabindex="1" />
								</td>
								<th style="width: 5%;">
<!-- 									<label>貸与区分</label> -->
									<nfwui:LabelBox id="lblLendKbn" code="<%=MessageIdConstant.SKF3010_SC004_LEND_KBN %>" />
								</th>
								<td style="width: 5%;">
								<imui:select id="lendKbn" name="lendKbn" 
									width="110" list="${form.lendList}" tabindex="2" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
				</nfwui:Form>
				<div class="align-L">	
					<nfwui:Button id="search" name="search" code="<%=MessageIdConstant.SKF3010_SC004_BUTTON_SEARCH %>" cssClass="imui-small-button" 
						url="skf/Skf3010Sc004/search" formId="form" tabindex="3" />
				</div>
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:95%;">
				<!-- 明細部 -->
				<nfwui:Form id="form2" name="form2" action="/skf/Skf3010Sc005/init" modelAttribute="form">
					<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC004 %>" />
					<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
					<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName}" />
					<input type="hidden" name="hdnAreaKbn" id="hdnAreaKbn" value="${form.hdnAreaKbn}" />
					<input type="hidden" name="hdnShatakuKbn" id="hdnShatakuKbn" value="${form.hdnShatakuKbn}" />
					<input type="hidden" name="hdnOriginalAuse" id="hdnOriginalAuse" value="${form.originalAuse}" />
					<input type="hidden" name="hdnLendKbn" id="hdnLendKbn" value="${form.lendKbn}" />
					<input type="hidden" name="hdnEmptyRoomCount" id="hdnEmptyRoomCount" value="${form.emptyRoomCount}" />
					<input type="hidden" name="hdnEmptyParkingCount" id="hdnEmptyParkingCount" value="${form.emptyParkingCount}" />
					<input type="hidden" name="hdnRoomKanriNo" id="sendRoomKanriNo" value="" />
					<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc004/init"/>
				
					<input type="hidden" name="updateFlag" id="updateFlag" value="1" />
					<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
					<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						})(jQuery);
					</script>

					<imui:listTable id="mainList" process="jssp" autoEncode="true" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect"
						multiSelect="false" data="${form.listTableData }"
						style="max-height: 800px" >
						<pager rowNum="${form.listTableMaxRowCount }" />
						<cols sortable="false">
						<col name="col1" caption="部屋番号" width="80" sortable="false" />
						<col name="col2" caption="本来用途" width="80" sortable="false" align="center" />
						<col name="col3" caption="本来規格" width="80" sortable="false" align="center" />
						<col name="col4" caption="本来延面積" width="90" sortable="false" align="right"/>
						<col name="col5" caption="貸与区分"　width="80" sortable="false"align="center" onCellAttr="onCellAttr" />
						<col name="col6" caption="使用者" width="120" sortable="false" />
						<col name="col7" caption="備考"  width="610" sortable="false" />
						<col name="col8" caption="詳細" width="80" sortable="false" align="center" >
							<showIcon iconClass="im-ui-icon-common-16-update" />
						</col>
						<col name="col9" hidden="true"/>
						
						</cols>
					</imui:listTable>

					<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>

					<div id="sampleListTable1-pager"></div>

					<script type="text/javascript">
						(function($) {
							onCellSelect = function(rowId,iCol,cellcontent,e) {
								if ($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
									// リストテーブル情報取得
									var grid = $("#mainList");
									// 行番号から選択した行の情報を取得
									var row = grid.getRowData(rowId);
									// col9：部屋管理番号
									var roomKanriNo = row.col9;									
									
									$("#sendRoomKanriNo").val(roomKanriNo);									
									$("#form2").submit();
								}
								
									}

							$("span .im-ui-icon-common-16-update").mouseover(
									function(e) {
										$(this).css("cursor","pointer");
									}).mouseleave(
									function(e) {
										$(this).css("cursor","default");
							}
							);

							})(jQuery);

					</script>

				</nfwui:Form>
			</div>
			<br />
			<div class="align-L float-L">	
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
			</div>
			<div class="align-R">
				<nfwui:Form id="new" name="new" >
					<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3010_SC004 %>" />
					<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
					<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.hdnShatakuName}" />
					<input type="hidden" name="hdnAreaKbn" id="hdnAreaKbn" value="${form.hdnAreaKbn}" />
					<input type="hidden" name="hdnShatakuKbn" id="hdnShatakuKbn" value="${form.hdnShatakuKbn}" />
					<input type="hidden" name="hdnEmptyRoomCount" id="hdnEmptyRoomCount" value="${form.emptyRoomCount}" />
					<input type="hidden" name="hdnEmptyParkingCount" id="hdnEmptyParkingCount" value="${form.emptyParkingCount}" />
					<input type="hidden" name="hdnOriginalAuse" id="hdnOriginalAuse" value="" />
					<input type="hidden" name="hdnRoomKanriNo" id="sendRoomKanriNo" value="" />
					<input type="hidden" name="hdnLendKbn" id="hdnLendKbn" value="" />
					<input type="hidden" name="updateFlag" id="updateFlag" value="0"/>
					<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3010Sc004/init"/>
				<nfwui:Button id="regist" code="<%=MessageIdConstant.SKF3010_SC004_BUTTON_NEW %>" cssClass="imui-medium-button" url="skf/Skf3010Sc005/init" formId="new"  tabindex="9"/>
				
				</nfwui:Form>
			</div>
		</div>
	</div>
	<!-- コンテンツエリア　ここまで -->