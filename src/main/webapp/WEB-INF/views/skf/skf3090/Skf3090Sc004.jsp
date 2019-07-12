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
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" >
			<div class="imui-form-container-wide"  style="width:95%;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
					<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC004 %>" />
					<!-- <input type="hidden" name="backUrl" id="backUrl" value="skf/Skf1010Sc001/init"/> -->
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF3090_SC004_SHAIN_NO %>" />
								</th>
								<td style="width: 15%;">
								<imui:textbox id="shainNo" name="shainNo" value="${form.shainNo}"  placeholder="例 00123456（半角）" tabindex="1" />
								
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblCompany" code="<%=MessageIdConstant.SKF3090_SC004_COMPANY %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="selectedCompanyCd" name="selectedCompanyCd" 
									width="185" list="${form.companyList}" tabindex="4" />

								</td>
								<td style="width: 10%;border:none;">
								</td>
								<td style="width: 15%;border:none;">
								</td>

							</tr>
							<tr>
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblName" code="<%=MessageIdConstant.SKF3090_SC004_NAME %>" />
								</th>
								<td style="width: 15%;">
								<imui:textbox id="name" name="name" value="${form.name}" 
									  placeholder="例 中日本　太郎" tabindex="2" />
								</td>
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblAgency" code="<%=MessageIdConstant.SKF3090_SC004_AGENCY %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="agencyCd" name="agencyCd" 
										width="185" list="${form.agencyList}" tabindex="5" />
								</td>

								<td style="width: 10%;border:none;">
								</td>
								<td style="width: 15%;border:none;">
								</td>

							<tr>
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblNameKk" code="<%=MessageIdConstant.SKF3090_SC004_NAME_KK %>" />
								</th>
								<td style="width: 15%;">
								<imui:textbox id="nameKk" name="nameKk" value="${form.nameKk}" placeholder="例 ナカニホン　タロウ" tabindex="3" />
								</td>

								<th style="width: 10%;">
									<nfwui:LabelBox id="lblAffiliation1" code="<%=MessageIdConstant.SKF3090_SC004_GROUP %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="affiliation1Cd" name="affiliation1Cd" 
										width="185" list="${form.affiliation1List}" tabindex="6" />
								<td style="width: 10%;border:none;">
								</td>
								<td style="width: 15%;border:none;">
								</td>
								
								</td>
							</tr>
							<td style="border:none;"></td>
							<td style="border:none;"></td>

								<th style="width: 10%;">
									<nfwui:LabelBox id="lbl" code="<%=MessageIdConstant.SKF3090_SC004_TEAM %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="affiliation2Cd" name="affiliation2Cd" 
										width="185" list="${form.affiliation2List}" tabindex="7" />
								</td>


						</tbody>
					</nfwui:Table>
				</nfwui:Form>
				<div class="align-L">
					<nfwui:Button id="search" name="search" value="検索" cssClass="imui-small-button" 
						url="skf/Skf3090Sc004/search" formId="form" tabindex="8" />
				</div>
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:95%;">
				<!-- 明細部 -->
				<nfwui:Form id="form2" name="form2" action="/skf/Skf3090Sc005/init" modelAttribute="form">
					<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC004 %>" />
					<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo}" />
					<input type="hidden" name="hdnName" id="hdnName" value="${form.hdnName}"  />
					<input type="hidden" name="hdnNameKk" id="hdnNameKk" value="${form.hdnNameKk}" />
					<input type="hidden" name="hdnOriginalCompanyCd" id="sendCompanyCd" value="" />
					<input type="hidden" name="hdnAgencyCd" id="hdnAgencyCd" value="${form.hdnAgencyCd}" />
					<input type="hidden" name="hdnAffiliation1Cd" id="hdnAffiliation1Cd" value="${form.hdnAffiliation1Cd}" />
					<input type="hidden" name="hdnAffiliation2Cd" id="hdnAffiliation2Cd" value="${form.hdnAffiliation2Cd}" />
					<input type="hidden" name="hdnSelectedShainNo" id="sendShainNo" value="" />
					<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3090Sc004/init"/>
				
					<input type="hidden" name="updateFlag" id="updateFlag" value="1" />
					<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
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
						<col name="col1" caption="社員番号" width="115" sortable="false" />
						<col name="col2" caption="氏名" width="200" sortable="false" />
						<col name="col3" caption="会社" width="200" sortable="false" />
						<col name="col4" caption="機関" width="180" sortable="false" />
						<col name="col5" caption="部等"　width="180" sortable="false" />
						<col name="col6" caption="室、チーム又は課" width="230" sortable="false" />
						<col name="col7" caption="会社コード" hidden="true" />
						<col name="col0" caption="詳細" width="50" sortable="false" >
							<showIcon iconClass="im-ui-icon-common-16-update" />
						</col>
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
									// col1：社員番号
									var shainNo = row.col1;
									// col7:会社コード
									var originalCompanyCd = row.col7;
									
									$("#sendShainNo").val(shainNo);
									$("#sendCompanyCd").val(originalCompanyCd);
									$("#form2").submit();
								}
								
							}
							
							$("#agencyCd").bind('change', function() {
								var map = new Object();
								map['selectedCompanyCd'] = $("#selectedCompanyCd").val();
								map['agencyCd'] = $("#agencyCd").val();
								
								nfw.common.doAjaxAction("skf/Skf3090Sc004/ChangeDropDownAsync",map,true,function(data) {
									$("#affiliation1Cd").imuiSelect('replace', data.affiliation1List);
									$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
								});
							});
							
							$("#affiliation1Cd").bind('change', function() {
								var map = new Object();
								map['selectedCompanyCd'] = $("#selectedCompanyCd").val();
								map['agencyCd'] = $("#agencyCd").val();
								map['affiliation1Cd'] = $("#affiliation1Cd").val();
								
								nfw.common.doAjaxAction("skf/Skf3090Sc004/ChangeDropDownAsync",map,true,function(data) {
									$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
								});
							});
							
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
			<div class="align-R">
			<nfwui:Form id="new" name="new" >
				<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC004 %>" />
				<input type="hidden" name="updateFlag" id="updateFlag" value="0"/>
				<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3090Sc004/init"/>
				<nfwui:Button id="regist" value="新規" cssClass="imui-medium-button" url="skf/Skf3090Sc005/init" formId="new"  tabindex="9"/>
				
			</nfwui:Form>
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->