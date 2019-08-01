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

<!-- コンテンツエリア:モックのまま -->
<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th>
							<label style="width:115px;">転任者調書</label>
						</th>
						<td style="width:98%;">
							<input type="file" size="40" accept=".csv"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="align-L">	
				<input type="button" value="取込" class="imui-small-button" onclick="location.href='../../skf/Skf3020Sc003/init'"/>
			</div>
			<br /><br /><br />
			<div class="align-L">
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->