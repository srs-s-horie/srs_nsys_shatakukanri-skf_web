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
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title" style="width:35%;"><h2>連携データ情報</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
				
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 15%;">
									会社コード
								</th>
								<td style="width: 20%;">
								<imui:textbox id="companyCd" name="companyCd" style="width: 95%;" value="${form.companyCd}" placeholder="C001とかR001とか"  tabindex="1" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									社員番号
								</th>
								<td style="width: 20%;">
								<imui:textbox id="shainNo" name="shainNo" style="width: 95%;" value="${form.shainNo}" placeholder="一応8桁以内"  tabindex="2" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									申請書類管理番号（入居）
								</th>
								<td style="width: 20%;">
								<imui:textbox id="applNoNyukyo" name="applNoNyukyo" style="width: 95%;" value="${form.applNoNyukyo}" placeholder="帳票ID＋社員番号＋日付＋枚数(26桁以内)"  tabindex="3" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									申請書類管理番号（退居）
								</th>
								<td style="width: 20%;">
								<imui:textbox id="applNoTaikyo" name="applNoTaikyo" style="width: 95%;" value="${form.applNoTaikyo}" placeholder="帳票ID＋社員番号＋日付＋枚数(26桁以内)"  tabindex="4" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									申請ステータス
								</th>
								<td style="width: 20%;">
								<imui:textbox id="applStatus" name="applStatus" style="width: 95%;" value="${form.applStatus}" placeholder="同意済みの場合は「22」"  tabindex="5" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									ユーザID
								</th>
								<td style="width: 20%;">
								<imui:textbox id="userID" name="userID" style="width: 95%;" value="${form.userID}" placeholder="ユーザID"  tabindex="5" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									画面ID
								</th>
								<td style="width: 20%;">
								<imui:textbox id="pageID" name="pageID" style="width: 95%;" value="${form.pageID}" placeholder="画面ID"  tabindex="5" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							</tbody>
							</nfwui:Table>

							<nfwui:Table use="search">
							<tbody>
							<div class="imui-chapter-title" style="width:35%;"><h2>エラーコードとか</h2></div>
							<tr>
								<th style="width: 15%;">
									エラーコード
								</th>
								<td style="width: 20%;">
								<imui:textbox id="errorCodeID" name="errorCodeID" style="width: 95%;" value="${form.errorCodeID}" placeholder="error.skf.e_skf_1089的なものが返ってくる" tabindex="6" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									個別文言
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
				<nfwui:Button id="registe" name="registe" value="検索" cssClass="imui-medium-button" 
						url="skf/Skf3090Sc999/execute" formId="form" tabindex="8" />
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->