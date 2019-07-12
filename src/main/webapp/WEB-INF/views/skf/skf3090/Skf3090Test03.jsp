<%@page import="jp.co.intra_mart.common.aid.jdk.java.util.PropertiesUtil"%>
<%@page import="java.util.*" %>
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

</style>


		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" >
			<div class="imui-form-container-wide"  style="width:95%;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 10%;">
									<label>社員番号${form.shainNo}</label>
								</th>
								<td style="width: 15%;">
								<imui:textbox id="shainNo" name="shainNo" value="${form.shainNo}" style="width: 95%;" placeholder="例 00123456（半角）" />
								<nfwui:PopupButton id="popupAddFile" name="popupAddFile" value="添付ファイル選択"
	use="popup" cssClass="imui-small-button" popupWidth="650" popupHeight="550" modalMode="false"
 	screenUrl="skf/Skf3090_Test03PopupAddFile/init" removePatterns="REG"
 	parameter="preOpenPage:preOpenPagePopup,shainNo:shainNoPopup" />
 	<nfwui:ConfirmButton name="registe" id="registe" url="skf/Skf3090_Test03/registe" cssClass="imui-medium-button"
 value="登録" title="登録確認" message="この情報を登録しますか？" removePatterns="REG" />
								<th style="width: 10%;">
									<label>会社</label>
								</th>
								<td style="width: 15%;">
									<imui:select id="originalCompanyCd" name="originalCompanyCd" 
									width="185" list="${form.companyList}" />

								</td>
								<td style="width: 10%;border:none;">
								</td>
								<td style="width: 15%;border:none;">
								</td>

							</tr>
							<tr>
								<th style="width: 10%;">
									<label>氏名${form.name}</label>
								</th>
								<td style="width: 15%;">
								<imui:textbox id="name" name="name" value="${form.name}" 
									required="true" style="width: 95%;" placeholder="例 中日本　太郎" />
								</td>
								<th style="width: 10%;">
									<label>機関</label>
								</th>
								<td style="width: 15%;">
									<imui:select id="agencyCd" name="agencyCd" 
										width="185" list="${form.agencyList}" />
								</td>

								<td style="width: 10%;border:none;">
								</td>
								<td style="width: 15%;border:none;">
								</td>

							<tr>
															<th style="width: 10%;">
									<label>氏名カナ</label>
								</th>
								<td style="width: 15%;">
								<imui:textbox id="nameKk" name="nameKk" value="${form.nameKk}" style="width: 95%;" placeholder="例 ナカニホン　タロウ" />
								</td>

								<th style="width: 10%;">
									<label>部等</label>
								</th>
								<td style="width: 15%;">
									<imui:select id="affiliation1Cd" name="affiliation1Cd" 
										width="185" list="${form.affiliation1List}" />
								<td style="width: 10%;border:none;">
								</td>
								<td style="width: 15%;border:none;">
								</td>
								
								</td>
							</tr>
							<td style="border:none;"></td>
							<td style="border:none;"></td>

								<th style="width: 10%;">
									<label>室、チーム又は課</label>
								</th>
								<td style="width: 15%;">
									<imui:select id="affiliation2Cd" name="affiliation2Cd" 
										width="185" list="${form.affiliation2List}" />
								</td>


						</tbody>
					</nfwui:Table>
				</nfwui:Form>
				<div class="align-L">
					<nfwui:Button id="search" name="search" value="検索" cssClass="imui-small-button" 
						url="skf/Skf3090_Test03/search" formId="form" />
					<nfwui:Hidden id="preOpenPage" name="preOpenPage" />	
<%-- 					<nfwui:PopupButton id="popupAddFile" name="popupAddFile" value="添付ファイル選択" --%>
<%-- 	use="popup" cssClass="imui-small-button" popupWidth="650" popupHeight="550" modalMode="false" --%>
<%-- 	screenUrl="skf/Skf3090_Test03PopupAddFile/init" removePatterns="REG" --%>
<%-- 	parameter="preOpenPage:preOpenPagePopup,shainNo:shainNoPopup" /> --%>
				</div>
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:95%;">
				<!-- 明細部 -->
				<nfwui:Form id="form2" name="form2" action="/test/TestPrjInput/init" modelAttribute="form">
					<input type="hidden" name="shainNo" id="sendShainNo" value="" />
					<input type="hidden" name="originalCompanyCd" id="sendCompanyCd" value="" />
					<input type="hidden" name="updateFlg" id="updateFlg" value="1" />
					<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
					<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						})(jQuery);
					</script>

					<imui:listTable id="mainList" process="jssp" autoEncode="true" autoWidth="true" rowNumber="true"
						autoResize="true" onCellSelect="onCellSelect"
						multiSelect="false" data="${form.listTableData }"
						style="max-height: 800px" >
						<pager rowNum="100" />
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
									var companyCd = row.col7;
									
									$("#sendShainNo").val(shainNo);
									$("#sendCompanyCd").val(companyCd);
									$("#form2").submit();
								}
								
							}
							
							$("#originalCompanyCd").bind('change', function() {
								var map = new Object();
								map['originalCompanyCd'] = $("#originalCompanyCd").val();
								
								nfw.common.doAjaxAction("skf/Skf3090_Test03/ChangeDropDownAsync",map,true,function(data) {
									$("#agencyCd").imuiSelect('replace', data.agencyList);
									$("#affiliation1Cd").imuiSelect('replace', data.affiliation1List);
									$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
								});
							});
							
							$("#agencyCd").bind('change', function() {
								var map = new Object();
								map['originalCompanyCd'] = $("#originalCompanyCd").val();
								map['agencyCd'] = $("#agencyCd").val();
								
								nfw.common.doAjaxAction("skf/Skf3090_Test03/ChangeDropDownAsync",map,true,function(data) {
									$("#affiliation1Cd").imuiSelect('replace', data.affiliation1List);
									$("#affiliation2Cd").imuiSelect('replace', data.affiliation2List);
								});
							});
							
							$("#affiliation1Cd").bind('change', function() {
								var map = new Object();
								map['originalCompanyCd'] = $("#originalCompanyCd").val();
								map['agencyCd'] = $("#agencyCd").val();
								map['affiliation1Cd'] = $("#affiliation1Cd").val();
								
								nfw.common.doAjaxAction("skf/Skf3090_Test03/ChangeDropDownAsync",map,true,function(data) {
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
				<nfwui:Button id="regist" value="新規" cssClass="imui-medium-button" url="skf/Skf3090_Sc005/init" formId="new" />
				<!-- <input style="width:150px;" id="" type="button" value="新規" class="imui-medium-button"  onclick="location.href='../../skf/Skf3090_Sc005/init'"/> -->
			</nfwui:Form>
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->