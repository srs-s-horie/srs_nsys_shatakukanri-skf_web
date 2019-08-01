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
<!DOCTYPE html>
<!-- コンテンツエリア -->
<div class="common-page">
<nfwui:Form id="form" name="form" modelAttribute="form">
	<br><br><br><br><br>
	<br><br><br><br><br>
    	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
			<!-- 説明文表示 -->	
			<table> 
				<div class="align-C"  style="border-radius: 10px; border:"> 
     				${form.applYoken}
				<br>
				<!-- 申請要件を確認ボタン -->
					<nfwui:Button cssStyle="width:150px;" id="download" name="download" value="申請要件を確認" 
					formID="form" 
					cssClass="imui-medium-button"
					url="skf/Skf2010Sc007/download"  />   	
						<input type="hidden" name="downloadFileName" id="downloadFileName" value="${form.downloadFileName}" />
						<input type="hidden" name="functionId" id="functionId" value="${form.functionId}" />	      						
		       	</div>
	       </table>
		</div>
		<br><br>
    	<div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
			<!-- 説明文表示 -->	
			<table> 
				<div class="align-C"  style="border-radius: 10px; border:"> 
					<span class="im-ui-icon-common-24-warning"></span>
					<nfwui:LabelBox id="lblShatakuFuyouMsg" code="<%= MessageIdConstant.SKF2010_SC007_WARNING_MESSAGE %>"  />
				</div>
	       </table>
		</div>
	<br><br><br><br><br><br><br><br><br>
		<!-- 下部ボタン -->
		<table width="100%">
			<div class="align-L float-L">
	   			<nfwui:Button id="doSendBack" name="doSendBack" formId="form" cssStyle="width:150px;"
	   				value="前の画面へ" cssClass="imui-medium-button" url="skf/Skf1010Sc001/init" />  
			</div>    
			<div class="align-R">
				<nfwui:Button id="transfer" value="申請書類を作成" 
				cssClass="imui-medium-button" cssStyle="width:150px;"
				url="skf/Skf2010Sc007/transfer" formID="form" />
				<input type="hidden" name="prePageId" id="prePageId" value="Skf2010Sc007" />    
	  		</div>
  		</table>
</nfwui:Form>
</div>