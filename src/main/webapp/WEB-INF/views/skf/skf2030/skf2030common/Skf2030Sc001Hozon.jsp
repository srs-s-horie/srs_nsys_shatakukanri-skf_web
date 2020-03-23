<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<table class="imui-form-search-condition">
<tbody>
<tr>
	<th rowspan="4" style="width: 10%;"><nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2030_SC001_SHOZOKU %>" /></th>
	<th colspan="2"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2030_SC001_AGENCY %>" /></th>
	<td colspan="2">
	${f:h(form.agency) }
	</td>
</tr>
<tr>
<th colspan="2"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2030_SC001_AFFILIATION1 %>" /></th>
	<td colspan="2">
${f:h(form.affiliation1) }
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2030_SC001_AFFILIATION2 %>" /></th>
	<td colspan="2">
${f:h(form.affiliation2) }
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2030_SC001_TEL %>" /></th>
	<td colspan="2">
	<imui:textbox id="tel" name="tel" maxlength="13" style="ime-mode:disabled;" value="${f:h(form.tel) }" tabindex="1" />
</td>
</tr>
<tr>
	<th rowspan="4"><nfwui:LabelBox id="lblShinseisha" code="<%= MessageIdConstant.SKF2030_SC001_SHINSEISHA %>" /></th>
	<th colspan="2"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2030_SC001_SHAIN_NO %>" /></th>
	<td colspan="2">
${f:h(form.shainNo) }
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2030_SC001_NAME %>" /></th>
	<td colspan="2">
${f:h(form.name) }
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblTokyu" code="<%= MessageIdConstant.SKF2030_SC001_TOKYU %>" /></th>
	<td colspan="2">
${f:h(form.tokyu) }
</td>
</tr>

<tr>
	<th colspan="2"><nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2030_SC001_GENDER %>" /></th>
	<td colspan="2">
${f:h(form.gender) }
</td>
</tr>
<tr>
	<th rowspan="4"><nfwui:LabelBox id="lblNyukyoShataku" code="<%= MessageIdConstant.SKF2030_SC001_NYUKYO_SHATAKU %>" /></th>
	<th colspan="2"><nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_NAME %>" /></th>
	<td colspan="2">${form.shatakuName}
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblShatakuNo" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_NO %>" /></th>
	<td colspan="2">
${f:h(form.shatakuNo) }
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblShatakuKikaku" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_KIKAKU %>" /></th>
	<td colspan="2">
${f:h(form.shatakuKikaku) }
</td>
</tr>
<tr>
	<th colspan="2"><nfwui:LabelBox id="lblShatakuMenseki" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_MENSEKI %>" /></th>
	<td colspan="2">
	${f:h(form.shatakuMenseki) }
	</td>
</tr>

<tr>
	<th rowspan="2"><nfwui:LabelBox id="lblBihinHannyu" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_HANNYU %>" /></th>
	<th colspan="2"><nfwui:LabelBox id="lblBihinKiboDate" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_KIBO_DATE %>" /></th>
	<td colspan="2">
	<nfwui:DateBox  id="sessionDay" name="sessionDay" cssStyle="width: 150px;" disabledPatterns="ST01" tabindex="2" />
	<imui:select id="sessionTime" name="sessionTime" list="${form.ddlWishTime }" tabindex="3" />
	</td>
</tr>
<tr>
<th colspan="2"><nfwui:LabelBox id="lblRenrakusaki" code="<%= MessageIdConstant.SKF2030_SC001_RENRAKUSAKI %>" /></th>
<td colspan="2">
  <div style="float: left; width: 170px;">
	<imui:textbox id="renrakuSaki" name="renrakuSaki" value="${f:h(form.renrakuSaki) }" placeholder="例　090-0000-0000" maxlength="13" style="width: 150px; ime-mode:disabled;" tabindex="4" />
  </div>
  <div style="margin-left: 170px; -ms-word-break: keep-all;">
	<span style="color:red;">※搬入業者から連絡がありますので、連絡先は必ず入力してください。</span>
  </div>
	</td>
</tr>
<tr style="border:none">
	<td style="border:none">
	</td>
</tr>

<tr>
	<th rowspan="2" colspan="3"><nfwui:LabelBox id="lblBihin" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN %>" /></th>
	<tr>
	<th style="width:10%;"><nfwui:LabelBox id="lblBihinState" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_STATE %>" /></th>
	<th style="width:65%;"><nfwui:LabelBox id="lblBihinYohi" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_YOHI %>" /></th>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblWasher" code="<%= MessageIdConstant.SKF2030_SC001_WASHER %>" /></th>
	<td>${f:h(form.bihinStateText11) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl11">
	 <nfwui:RadioButton id="bihinTrue11" name="bihinAppl11" value="2" label="申請する" disabled="${form.bihinDisabled11 }" /> 
	 <nfwui:RadioButton id="bihinFalse11" name="bihinAppl11" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblFreezer" code="<%= MessageIdConstant.SKF2030_SC001_FREEZER %>" /></th>
	<td>${f:h(form.bihinStateText12) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl12" >
	 <nfwui:RadioButton id="bihinTrue12" name="bihinAppl12" value="2" label="申請する" disabled="${form.bihinDisabled12 }" /> 
	 <nfwui:RadioButton id="bihinFalse12" name="bihinAppl12" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblOven" code="<%= MessageIdConstant.SKF2030_SC001_OVEN %>" /></th>
	<td>${f:h(form.bihinStateText13) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl13" >
	  <nfwui:RadioButton id="bihinTrue13" name="bihinAppl13" value="2" label="申請する" disabled="${form.bihinDisabled13}" /> 
	  <nfwui:RadioButton id="bihinFalse13" name="bihinAppl13" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>
 
<tr>
	<th colspan="3"><nfwui:LabelBox id="lblCleaner" code="<%= MessageIdConstant.SKF2030_SC001_CLEANER %>" /></th>
	<td>${f:h(form.bihinStateText14) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl14" >
	 <nfwui:RadioButton id="bihinTrue14" name="bihinAppl14" value="2" label="申請する" disabled="${form.bihinDisabled14 }" /> 
	 <nfwui:RadioButton id="bihinFalse14" name="bihinAppl14" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblRiceCook" code="<%= MessageIdConstant.SKF2030_SC001_RICE_COOK %>" /></th>
	<td>${f:h(form.bihinStateText15) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl15" >
	 <div style="float: left; width: 170px;">
		<nfwui:RadioButton id="bihinTrue15" name="bihinAppl15" value="2" label="申請する" disabled="${form.bihinDisabled15 }" /> 
	 	<nfwui:RadioButton id="bihinFalse15" name="bihinAppl15" value="1" label="申請しない" /> 
	 </div>
	 <div style="margin-left: 170px; -ms-word-break: keep-all;"><nfwui:LabelBox id="lblRiceCookComment" code="<%= MessageIdConstant.SKF2030_SC001_RICE_COOK_COMMENT %>" /></div>
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblTv" code="<%= MessageIdConstant.SKF2030_SC001_TV %>"  /></th>
	<td>${f:h(form.bihinStateText16) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl16">
	 <nfwui:RadioButton id="bihinTrue16" name="bihinAppl16" value="2" label="申請する" disabled="${form.bihinDisabled16 }" /> 
	 <nfwui:RadioButton id="bihinFalse16" name="bihinAppl16" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblTvStand" code="<%= MessageIdConstant.SKF2030_SC001_TV_STAND %>" /></th>
	<td>${f:h(form.bihinStateText17) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl17" >
	 <nfwui:RadioButton id="bihinTrue17" name="bihinAppl17" value="2" label="申請する" disabled="${form.bihinDisabled17 }" /> 
	 <nfwui:RadioButton id="bihinFalse17" name="bihinAppl17" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblKotatsu" code="<%= MessageIdConstant.SKF2030_SC001_KOTATSU %>" /></th>
	<td>${f:h(form.bihinStateText18) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl18" >
	 <nfwui:RadioButton id="bihinTrue18" name="bihinAppl18" value="2" label="申請する" disabled="${form.bihinDisabled18 }" /> 
	 <nfwui:RadioButton id="bihinFalse18" name="bihinAppl18" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>

<tr>
	<th colspan="3"><nfwui:LabelBox id="lblKitchenCabinet" code="<%= MessageIdConstant.SKF2030_SC001_KITCHEN_CABNET %>" /></th>
	<td>${f:h(form.bihinStateText19) }</td>
	<td colspan="2">
	<nfwui:RadioButtonGroup id="bihinAppl19" >
	 <nfwui:RadioButton id="bihinTrue19" name="bihinAppl19" value="2" label="申請する" disabled="${form.bihinDisabled19 }" /> 
	 <nfwui:RadioButton id="bihinFalse19" name="bihinAppl19" value="1" label="申請しない" /> 
	</nfwui:RadioButtonGroup>
	</td>
</tr>


</tr>
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>" negative>
<tr style="border:none">
	<td style="border:none">
	</td>
</tr>
<tr>
	<th colspan="3"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2030_SC001_COMMENT %>" /></th>
	<td colspan="3" >
		<imui:textArea id="commentNote" name="commentNote" rows="4" placeholder="例  承認者へのコメント" style="width: 90%; ime-mode:active;" tabindex="6"></imui:textArea>
	</td>
</tr>
</imart:condition>
</tbody>
</table>