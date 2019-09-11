<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>

<table class="imui-form-search-condition">
	<tbody>
		<imart:condition validity="${form.henkyakuBihinNothing}" negative>>
			<nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2040_SC002_BIHIN %>" titleLevel="2" />
					<tr>
						<th></th>
						<th><nfwui:LabelBox id="lblBihinAppl" code="<%= MessageIdConstant.SKF2040_SC002_BIHIN_STATE %>" /></th>
						<th><nfwui:LabelBox id="lblBihinAdjust" code="<%= MessageIdConstant.SKF2040_SC002_BIHIN_RETURN %>" /></th>
					</tr>
	
	                <tr>
	                   <th><nfwui:LabelBox id="lblWasher" code="<%= MessageIdConstant.SKF2040_SC002_WASHER %>" /></th>
	                   <td>${f:h(form.bihinState11) }</td>
	                   <td>${f:h(form.bihinReturn11) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblFreezer" code="<%= MessageIdConstant.SKF2040_SC002_FREEZER %>" /></th>
	                   <td>${f:h(form.bihinState12) }</td>
	                   <td>${f:h(form.bihinReturn12) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblOven" code="<%= MessageIdConstant.SKF2040_SC002_OVEN %>" /></th>
	                   <td>${f:h(form.bihinState13) }</td>
	                   <td>${f:h(form.bihinReturn13) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblCleaner" code="<%= MessageIdConstant.SKF2040_SC002_CLEANER %>" /></th>
	                   <td>${f:h(form.bihinState14) }</td>
	                   <td>${f:h(form.bihinReturn14) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblRiceCook" code="<%= MessageIdConstant.SKF2040_SC002_RICE_COOK %>" /></th>
	                   <td>${f:h(form.bihinState15) }</td>
	                   <td>${f:h(form.bihinReturn15) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblTv" code="<%= MessageIdConstant.SKF2040_SC002_TV %>" /></th>
	                   <td>${f:h(form.bihinState16) }</td>
	                   <td>${f:h(form.bihinReturn16) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblTvStand" code="<%= MessageIdConstant.SKF2040_SC002_TV_STAND %>" /></th>
	                   <td>${f:h(form.bihinState17) }</td>
	                   <td>${f:h(form.bihinReturn17) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblKotatsu" code="<%= MessageIdConstant.SKF2040_SC002_KOTATSU %>" /></th>
	                   <td>${f:h(form.bihinState18) }</td>
	                   <td>${f:h(form.bihinReturn18) }</td>
	                </tr>
	                <tr>
	                   <th><nfwui:LabelBox id="lblKitchenCabinet" code="<%= MessageIdConstant.SKF2040_SC002_KITCHEN_CABNET %>" /></th>
	                   <td>${f:h(form.bihinState19) }</td>
	                   <td>${f:h(form.bihinReturn19) }</td>
	                </tr>
         </imart:condition>
                <imart:condition validity="${form.shatakuJyotaiViewFlg}">	
	                <tr>
		                <th><nfwui:LabelBox id="lblShatakuJyotai" code="<%= MessageIdConstant.SKF2040_SC002_SHATAKU_STATUS %>" /></th>
		                <td colspan="2">
		                    ${f:h(form.shatakuJyotai) }
		                </td>
	                </tr>
                </imart:condition>
				<imart:condition validity="${form.henkyakuBihinNothing}" negative>>
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