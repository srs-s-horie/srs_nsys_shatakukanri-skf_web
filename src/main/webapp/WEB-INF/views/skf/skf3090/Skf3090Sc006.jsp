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


		<!-- コンテンツエリア -->
		<div style="width:100%">
			<div class="imui-form-container-wide">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
					<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC006 %>" />
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblCompany" code="<%= MessageIdConstant.SKF3090_SC006_COMPANY %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="companyCd" name="companyCd"
									width="185" list="${form.companyList}" tabindex="3" />
								</td>
								<th style="width: 10%;">
									<nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF3090_SC006_AFFILIATION1 %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="affiliation1Cd" name="affiliation1Cd"
									width="185" list="${form.affiliation1List}" tabindex="5" />
								</td>

								<th style="width: 10%;">
									<nfwui:LabelBox id="lblBusinessArea" code="<%= MessageIdConstant.SKF3090_SC006_BUSINESS_AREA %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="businessAreaCd" name="businessAreaCd"
									width="185" list="${form.businessAreaList}" tabindex="7" />
								</td>
							</tr>
							<tr>

								<th style="width: 10%;">
									<nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF3090_SC006_AGENCY %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="agencyCd" name="agencyCd"
									width="185" list="${form.agencyList}" tabindex="4" />
								</td>

								<th style="width: 10%;">
									<nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF3090_SC006_AFFILIATION2 %>" />
								</th>
								<td style="width: 15%;">
									<imui:select id="affiliation2Cd" name="affiliation2Cd"
									width="185" list="${form.affiliation2List}" tabindex="6" />
								</td>

							</tr>
						</tbody>

					</nfwui:Table>
				</nfwui:Form>	
				<div class="align-L">	
					<nfwui:Button id="search" name="search" value="検索" cssClass="imui-small-button"
						url="skf/Skf3090Sc006/search" formId="form" tabindex="8" />
				</div>
				
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide">
				<!-- 明細部 -->
				<nfwui:Form id="form2" name="form2"  modelAttribute="form">
					<input type="hidden" name="hdnCompanyCd" id="sendCompanyCd" value="" />
					<input type="hidden" name="hdnAgencyCd" id="sendAgencyCd" value="" />
					<input type="hidden" name="hdnAffiliation1Cd" id="sendAffiliation1Cd" value="" />
					<input type="hidden" name="hdnAffiliation2Cd" id="sendAffiliation2Cd" value="" />
					<input type="hidden" name="hdnCompanyCd" id="hdnCompanyCd" value="${form.hdnCompanyCd}" />
					<input type="hidden" name="hdnAgenyCd" id="hdnAgencyCd" value="${form.hdnAgencyCd}" />
					<input type="hidden" name="hdnAffiliation1Cd" id="hdnAffiliation1Cd" value="${form.hdnAffiliation1Cd}" />
					<input type="hidden" name="hdnAffiliation2Cd" id="hdnAffiliation2Cd" value="${form.hdnAffiliation2Cd}" />
					<input type="hidden" name="hdnBusinessAreaCd" id="hdnBusinessAreaCd" value="${form.hdnBusinessAreaCd}" />
					<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3090Sc006/init"/>
					<input type="hidden" name="registFlag" id="registFlag" value="${form.registFlag}" />
					<input type="hidden" name="updateFlag" id="updateFlag" value="1" />
					
					<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
					
					<div id="listTableArea">
					<imui:listTable id="mainList" process="java" autoEncode="true" autoWidth="true"
						autoResize="true"  onCellSelect="onCellSelect"
						style="max-height: 800px" multiSelect="false" rowNumbers="true" data="${form.createTableList}">
						<pager rowNum="${form.listTableMaxRowCount }" />
						<cols sortable="false">
							<col name="companyName" caption="会社名"　width="200" wrap="true" align="left" sortable="false" />
							<col name="agencyName" caption="機関名"　width="200" wrap="true" align="left" sortable="false" />
							<col name="affiliation1Name" caption="部等" width="250" wrap="true" align="left" sortable="false" />
							<col name="affiliation2Name" caption="室、チーム又は課"　width="300" wrap="true" align="left" sortable="false" />
							<col name="businessAreaName" caption="事業領域" width="150" wrap="true" align="left" sortable="false" />
							<col name="companyCd" caption="会社コード" hidden="true" />
							<col name="agencyCd" caption="機関コード" hidden="true" />
							<col name="affiliation1Cd" caption="部等コード" hidden="true" />
							<col name="affiliation2Cd" caption="室、チーム又は課コード" hidden="true" />
							<col name="details" caption="詳細" width="100" align="center" sortable="false" >
								<showIcon iconClass="im-ui-icon-common-16-update" />
							</col>
						</cols> 
						</imui:listTable>
					</div>
						</nfwui:Form>
					<br />
					<div class="align-R">
							<nfwui:Form id="new" name="new">
								<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC006 %>" />
								<input type="hidden" name="updateFlag" id="updateFlag" value="0" />
								<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3090Sc006/init" />
								<nfwui:Button id="regist"  value="新規" cssClass="imui-medium-button" url="skf/Skf3090Sc007/init" formId="new" tabindex="9" />
							</nfwui:Form>
					</div>

					<script type="text/javascript">
					(function($) {
						$(document).ready(function() {
							// リサイズ時イベント
							$(window).bind('resize', function() {
								$("#mainList").setGridWidth($("#listTableArea").width().true);
							}).trigger('resize');
						});
						
						onCellSelect = function(rowId,iCol,cellcontent,e) {
							if ($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
								// リストテーブル情報取得
								var grid = $("#mainList");
								// 行番号から選択した行の情報を取得
								var row = grid.getRowData(rowId);
								// companyCd:会社コード
								var companyCd = row.companyCd;
								// agencyCd:機関コード
								var agencyCd = row.agencyCd;
								// affiliation1Cd:部等コード
								var affiliation1Cd = row.affiliation1Cd;
								// affiliation2Cd:室、チーム又は課コード
								var affiliation2Cd = row.affiliation2Cd;
								
								
								$("#sendCompanyCd").val(companyCd);
								$("#sendAgencyCd").val(agencyCd);
								$("#sendAffiliation1Cd").val(affiliation1Cd);
								$("#sendAffiliation2Cd").val(affiliation2Cd);
								
								nfw.common.submitForm("form2", "skf/Skf3090Sc007/init");
								
							}
						}
						$("#companyCd").bind('change', function() {
							var map = new Object();
							map['companyCd'] = $("#companyCd").val();
					
							nfw.common.doAjaxAction("skf/Skf3090Sc006/ChangeDropDownAsync",map,true,function(data) {
								$("#agencyCd").imuiSelect('replace', data.agencyList);
								$("#affiliation1Cd").imuiSelect('replace', data.affiliation1List);
								$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
								$("#businessAreaCd").imuiSelect('replace', data.businessAreaList);
							});	
						});
					
						$("#agencyCd").bind('change', function() {
							var map = new Object();
							map['companyCd'] = $("#companyCd").val();
							map['agencyCd'] = $("#agencyCd").val();
						
							nfw.common.doAjaxAction("skf/Skf3090Sc006/ChangeDropDownAsync",map,true,function(data){
								$("#affiliation1Cd").imuiSelect('replace', data.affiliation1List);
								$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
								$("#businessAreaCd").imuiSelect('replace', data.businessAreaList);
							});
						});
					
						$("#affiliation1Cd").bind('change', function() {
							var map = new Object();
							map['companyCd'] = $("#companyCd").val();
							map['agencyCd'] = $("#agencyCd").val();
							map['affiliation1Cd'] = $("#affiliation1Cd").val();
						
							nfw.common.doAjaxAction("skf/Skf3090Sc006/ChangeDropDownAsync",map,true,function(data) {
								$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
							});
						});
					})(jQuery);	
					</script>
				
					
			</div>
			
		</div>
