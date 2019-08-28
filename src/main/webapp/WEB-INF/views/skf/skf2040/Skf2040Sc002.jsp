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
			
			</tr>
		</table>
	</div>
	<!-- アコーディオンエリア -->
	<!-- 退居届-->
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="taikyoView" >
			<nfwui:AccordionItem id="taikyoItem" code="<%= MessageIdConstant.SKF2010_SC002_TAIKYO %>" defaultOpen="${form.level3Open }">
				<%@ include file="../skf2010/common/Skf2010TaikyoTodoke.jsp" %>
			</nfwui:AccordionItem>
		</nfwui:Accordion>
	</div>
	<!-- 備品表示欄-->	
		
	<!-- コメント欄 -->
	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
		<div class="imui-chapter-title" style="margin-bottom: 10px;">
			<h2>コメント</h2>
		</div>
		<!-- 承認者から申請者へ-->
		<imart:decision case="${form.commentDisplayLevel}" value="<%= CodeConstant.COMMENT_DISPLAY_LEVEL_2 %>">
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
		</imart:decision>
	</div>
	<br>
	<nfwui:Hidden id="applNo" name="applNo" />
	<nfwui:Hidden id="applId" name="applId" />
	<nfwui:Hidden id="shainNo" name="shainNo" />
	<nfwui:Hidden id="applUpdateDate" name="applUpdateDate" />
	<nfwui:Hidden id="prePageId" name="prePageId" value="${form.prePageId}" />
	<nfwui:Hidden id="attachedNo" name="attachedNo" />
	<!-- フッター -->
	<table width="100%">
		<tr>
			<td>
				<!-- 左側 -->
				<div class="align-L float-L">
					<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
					<imart:condition validity="${form.level1}">
						<input name="doDelRow1" id="doDelRow1" type="button" value="退居（自動車の保管場所変換）届PDF出力ボタン" class="imui-medium-button" onclick="" />
					</imart:condition>
					<imart:condition validity="${form.commentViewFlag}" >
						<br>
						<nfwui:PopupButton id="commentPop" value="コメント表示" 
							cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
							modalMode="false" popupWidth="1350" popupHeight="550"
							parameter="applNo:applNo"
							screenUrl="skf/Skf2010Sc010/init" use="popup" />
					</imart:condition>
				</div>
			</td>
			<!-- 右側 -->
			<td class="vertical-top" style="vertical-align:top">
				<div class="align-R">
					<!-- 提示ボタン -->
					<imart:condition validity="${form.presenBtnViewFlg}" >
						<nfwui:Button id="PresenBtn" name="PresenBtn"
							value="提示" cssClass="imui-medium-button" cssStyle="width: 150px" 
							title="<%= MessageIdConstant.SKF2010_SC002_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2011 %>"
							url="skf/Skf2010Sc002/Presentation" formId="form" removePatterns="LV1"
							remove="${form.presenBtnViewFlg }" />
					</imart:condition>
					<!-- 承認ボタン -->
					<imart:condition validity="${form.presenBtnViewFlg}" >
						<nfwui:Button id="PresenBtn" name="PresenBtn"
							value="提示" cssClass="imui-medium-button" cssStyle="width: 150px" 
							title="<%= MessageIdConstant.SKF2010_SC002_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2011 %>"
							url="skf/Skf2010Sc002/Presentation" formId="form" removePatterns="LV1"
							remove="${form.presenBtnViewFlg }" />
					</imart:condition>
	
				</div>
			</td>
		</tr>
	</table>
	</nfwui:Form>
</div>