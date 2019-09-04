<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.skf2010.app.skf2010sc002.Skf2010Sc002Form" %>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
	<!-- 状況、資料ヘッダ -->
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;border:none;" height="100px">
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<table class="imui-form-search-condition">
			<tr>
				<th width="100px">
					<nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC006_LBL_APPL_STATUS %>" />
				</th>
				<td width="100px">
					${form.applStatusText }
				</td>
				<nfwui:Accordion id="taikyoPdfViewFlg" >
					<th width="100px">
						<nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2010_SC006_LBL_ATTACHED_FILE %>" />
					</th>
					<td>
						<div id="attachedFileAreaDiv">
							<c:forEach var="obj" items="${form.attachedFileList }">
								<a id="attached_${obj.attachedNo}">${obj.attachedName }</a>&nbsp;
							</c:forEach>
						</div>
					</td>
				</nfwui:Accordion>
			</tr>
		</table>
	</div>
	<!-- アコーディオンエリア -->
	<!-- 退居届-->
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="taikyoPdfViewFlg" >
			<nfwui:AccordionItem id="taikyoItem" code="<%= MessageIdConstant.SKF2010_SC002_TAIKYO %>" defaultOpen="${form.level3Open }">
				<%@ include file="../skf2010/common/Skf2010TaikyoTodoke.jsp" %>
			</nfwui:AccordionItem>
		</nfwui:Accordion>
	</div>
	<!-- 備品表示欄-->
		<imart:condition validity="${form.bihinVisible}">	
			<%@ include file="skf2040common/Skf2040Sc002HenkyakuBihin.jsp" %>
		</imart:condition>		
	<!-- コメント欄 -->
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
		<div class="imui-chapter-title" style="margin-bottom: 10px;">
			<h2>コメント</h2>
		</div>
		<!-- 承認者から申請者へ-->
			<table class="imui-form-search-condition">
				<tr　style="width: 100%; max-width: 1000px;text-align:center;">
					<th style="width: 200px; max-width: 200px;">
						<label>申請者へのコメント</label>
					</th>
					<td>
						<imui:textArea id="commentNote" name="commentNote" style="height:50px;width:100%;" placeholder="例 添付資料が間違っています。" />
					</td>
				</tr>
			</table>
	</div>
	<br>
	<nfwui:Hidden id="applNo" name="applNo" />
	<nfwui:Hidden id="applId" name="applId" />
	<nfwui:Hidden id="shainNo" name="shainNo" />
	<nfwui:Hidden id="applUpdateDate" name="applUpdateDate" />
	<nfwui:Hidden id="prePageId" name="prePageId" value="${form.prePageId}" />
	<nfwui:Hidden id="attachedNo" name="attachedNo" />
</nfwui:Form>
<!-- フッターエリア　ボタン -->
<div class="imui-box-layout">
	<table width="100%">
		<tr>
			<!-- 左エリア -->
			<div class="btnLeft">
 				<!-- 退居届PDFダウンロード -->
					<imart:condition validity="${form.taikyoPdfViewFlg}">
						<input name="doDelRow1" id="doDelRow1" type="button" value="退居（自動車の保管場所変換）届PDF出力ボタン" class="imui-medium-button" onclick="" />
					</imart:condition>
 			</div>
			<!-- 右エリア -->
 			<div class="btnRight">
 				<!-- 修正依頼 -->
				      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn" value="修正依頼"
				       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
				       title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>"
				       message="<%= MessageIdConstant.SKF2040_SC002_REVISION_MSG %>"
				       url="skf/Skf2040Sc002/Revision" removePatterns=""
				       remove="${form.revisionBtnViewFlg }"/>
 			</div>
 		</tr>
 		<tr>
 			<!-- 左エリア -->
 			<div class="btnLeft">
				<!-- 前の画面へ -->
 				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" />
				<!-- コメントボタン -->
				<imart:condition validity="${form.commentViewFlag}">
					<nfwui:PopupButton id="commentPop" value="コメント表示" 
					cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
					modalMode="false" popupWidth="1350" popupHeight="550"
					parameter="applNo:applNo"
					screenUrl="skf/Skf2010Sc010/init" use="popup" />
				</imart:condition>
 			</div>
 			<!-- 右エリア -->
 			<div id="dCheck1" class="btnRight">
 					<!-- 資料を添付 -->
 					<imart:condition validity="${form.shiryoBtnViewFlg}">
						<nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
						cssClass="imui-medium-button" cssStyle="width: 150px" 
						use="popup" popupWidth="750" popupHeight="600"
						parameter="applNo:applNo,applId:applId" modalMode="false" 
						screenUrl="skf/Skf2010Sc009/init" formId="form" />
					</imart:condition>
					<!-- 差戻しボタン -->
						<nfwui:ConfirmButton id="remandBtn" name="remandBtn" value="差戻し"
						cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
						title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>"
						message="<%= MessageIdConstant.SKF2040_SC002_REMAND_MSG %>"
						url="skf/Skf2040Sc002/Remand" remove="${form.remandBtnViewFlg }"/>
					<!-- 提示ボタン --> 
						<nfwui:Button id="PresentBtn" name="PresentBtn"
							value="提示" cssClass="imui-medium-button" cssStyle="width: 150px" 
							title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2011 %>"
							url="skf/Skf2040Sc002/Presentation" formId="form" removePatterns="LV1"
							remove="${form.presentBtnViewFlg }" 
							disabled="${form.btnSaveDisabeld}"/>
					<!-- 承認ボタン -->
						<nfwui:Button id="approveBtn" name="approveBtn"
							value="承認" cssClass="imui-medium-button" cssStyle="width: 150px" 
							title="<%= MessageIdConstant.SKF2040_SC002_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2011 %>"
							url="skf/Skf2040Sc002/Approval" formId="form" removePatterns="LV1"
							remove="${form.approveBtnViewFlg}"
							disabled="${form.btnSaveDisabeld}"/>
 			</div>
 		</tr>	
 	</table>
</div>	


