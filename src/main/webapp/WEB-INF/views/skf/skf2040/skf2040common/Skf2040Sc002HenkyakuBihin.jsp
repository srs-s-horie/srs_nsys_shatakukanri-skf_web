<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>

<table class="imui-form-search-condition">
	<tbody>
		<imart:condition validity="${form.bihinViewFlg}">
			<nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2040_SC002_BIHIN %>" titleLevel="2" />
					<tr>
						<th></th>
						<th><nfwui:LabelBox id="lblBihinAppl" code="<%= MessageIdConstant.SKF2040_SC002_BIHIN_STATE %>" /></th>
						<th><nfwui:LabelBox id="lblBihinAdjust" code="<%= MessageIdConstant.SKF2040_SC002_BIHIN_RETURN %>" /></th>
					</tr>
	
					<c:forEach var="bihinObj" items="${form.henkyakuList }">
	                    <tr>
	                        <th colspan="1"><label>${f:h(bihinObj.bihinName)}</label></th>
	                        <td colspan="1"><label>${f:h(bihinObj.bihinStateText)}</label></td>
	                        <td colspan="1"><label>${f:h(bihinObj.bihinReturnText)}</label></td>
	                    </tr>
					</c:forEach>
		</imart:condition>
                <imart:condition validity="${f:h(form.shatakuJotaiViewFlg)}">	
	                <tr>
		                <th><nfwui:LabelBox id="lblShatakuJotai" code="<%= MessageIdConstant.SKF2040_SC002_SHATAKU_STATUS %>" /></th>
		                <td colspan="2">
		                    ${f:h(form.shatakuJotai) }
		                </td>
	                </tr>
                </imart:condition>
				<imart:condition validity="${f:h(form.henkyakuBihinNothing)}" negative>
	                <tr>
		                <th><nfwui:LabelBox id="lblSessionDay" code="<%= MessageIdConstant.SKF2040_SC002_RETURN_WITNESS_REQUEST_DATE %>" /></th>
		                <td colspan="2">
		                    ${f:h(form.sessionDay) }
		                </td>
	                </tr>
	                <tr>
		                <th><nfwui:LabelBox id="lblRenrakusaki" code="<%= MessageIdConstant.SKF2040_SC002_RENRAKU_SAKI %>" /></th>
		                <td colspan="2">
		                    ${f:h(form.renrakuSaki) }
		                </td>
	                </tr>
				</imart:condition>
	</tbody>
</table>