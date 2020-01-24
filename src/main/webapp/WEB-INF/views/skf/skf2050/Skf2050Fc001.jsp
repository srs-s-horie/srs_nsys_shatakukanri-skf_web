<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
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
	
	
</script>
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1100px;max-width: 1150px;">
			<div class="imui-form-container-wide"  style="width:1100px;">
				<div class="imui-chapter-title" style="width:35%;"><h2>備品返却確認データ連携</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
					<hidden id=pageId name=pageId value="testPage" />
					
					<nfwui:Table use="search">
						Skf2050Fc001備品返却確認データ連携
						<tbody>
							<tr>
								<th style="width: 15%;">
									会社コード
								</th>
								<td style="width: 20%;">
								<imui:textbox id="skf2050Fc001CompanyCd" name="skf2050Fc001CompanyCd" style="width: 95%;" value="${form.skf2050Fc001CompanyCd}"   tabindex="1" />
								</td>
								<td style="border:none">
								</td>
								<th style="width: 15%;">
									社員番号
								</th>
								<td style="width: 20%;">
								<imui:textbox id="skf2050Fc001ShainNo" name="skf2050Fc001ShainNo" style="width: 95%;" value="${form.skf2050Fc001ShainNo}"   tabindex="2" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									申請書類管理番号
								</th>
								<td style="width: 20%;">
								<imui:textbox id="skf2050Fc001ApplNo" name="skf2050Fc001ApplNo" style="width: 95%;" value="${form.skf2050Fc001ApplNo}"  tabindex="1" />
								</td>
								<td style="border:none">
								</td>
								<th style="width: 15%;">
									申請ステータス
								</th>
								<td style="width: 20%;">
								<imui:textbox id="skf2050Fc001ApplStatus" name="skf2050Fc001ApplStatus" style="width: 95%;" value="${form.skf2050Fc001ApplStatus}"   tabindex="2" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									ユーザID
								</th>
								<td style="width: 20%;">
								<imui:textbox id="skf2050Fc001UserID" name="skf2050Fc001UserID" style="width: 95%;" value="${form.skf2050Fc001UserID}"   tabindex="2" />
								</td>
								<td style="border:none">
								</td>
								<th style="width: 15%;">
									画面ID
								</th>
								<td style="width: 20%;">
								<imui:textbox id="skf2050Fc001PageID" name="skf2050Fc001PageID" style="width: 95%;" value="${form.skf2050Fc001PageID}"   tabindex="2" />
								</td>
								<td style="border:none">
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					
					<nfwui:Table use="search">
						<tbody>
							<div class="imui-chapter-title" style="width:35%;"><h2>処理終了コード</h2></div>
							<tr>
								<th style="width: 15%;">
									処理終了コード
								</th>
								<td style="width: 20%;">
								<imui:textbox id="returnStatus" name="returnStatus" style="width: 95%;" value="${form.returnStatus}" placeholder="正常：0 異常：9" tabindex="6" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									エラー個別文言
								</th>
								<td style="width: 20%;">
								<imui:textbox id="errorStrings" name="errorStrings" style="width: 95%;" value="${form.errorStrings}" placeholder="エラー文言が返ってくる"  tabindex="7" />
								</td>
								<td style="border:none">
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					
					
				</nfwui:Form>
			</div>
			<br />
			
			<div class="align-R">
				<nfwui:Button id="registe" name="registe" value="実行！" cssClass="imui-medium-button" 
						url="skf/Skf2050Fc001/execute" formId="form" tabindex="8" />
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->