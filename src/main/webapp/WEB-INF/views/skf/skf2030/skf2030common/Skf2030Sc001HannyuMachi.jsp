<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<table class="imui-form-search-condition">
    <tbody>
        <tr>
            <th rowspan="4" style="width: 10%;"><nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2030_SC001_SHOZOKU %>" /></th>
            <th colspan="3" style="width: 20%;"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2030_SC001_AGENCY %>" /></th>
            <td colspan="3">
                ${f:h(form.agency) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2030_SC001_AFFILIATION1 %>" /></th>
            <td colspan="3">
                ${f:h(form.affiliation1) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2030_SC001_AFFILIATION2 %>" /></th>
            <td colspan="3">
               ${f:h(form.affiliation2) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2030_SC001_TEL %>" /></th>
            <td colspan="3">
                ${f:h(form.tel) }
            </td>
        </tr>

        <tr>
            <th rowspan="4"><nfwui:LabelBox id="lblShinseisha" code="<%= MessageIdConstant.SKF2030_SC001_SHINSEISHA %>" /></th>
            <th colspan="3"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2030_SC001_SHAIN_NO %>" /></th>
            <td colspan="3">
                ${f:h(form.shainNo) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2030_SC001_NAME %>" /></th>
            <td colspan="3">
               ${f:h(form.name) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblTokyu" code="<%= MessageIdConstant.SKF2030_SC001_TOKYU %>" /></th>
            <td colspan="3">
                ${f:h(form.tokyu) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2030_SC001_GENDER %>" /></th>
            <td colspan="3">
                ${f:h(form.gender) }
            </td>
        </tr>
        
        <tr>
            <th rowspan="4"><nfwui:LabelBox id="lblNyukyoShataku" code="<%= MessageIdConstant.SKF2030_SC001_NYUKYO_SHATAKU %>" /></th>
              <th colspan="3"><nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_NAME %>" /></th>
            <td colspan="3">
                ${form.shatakuName}
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblShatakuNo" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_NO %>" /></th>
            <td colspan="3">
                ${f:h(form.shatakuNo) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblShatakuKikaku" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_KIKAKU %>" /></th>
            <td colspan="3">
                ${f:h(form.shatakuKikaku) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblShatakuMenseki" code="<%= MessageIdConstant.SKF2030_SC001_SHATAKU_MENSEKI %>" /></th>
            <td colspan="3">
                ${f:h(form.shatakuMenseki) }
            </td>
        </tr>

        <tr>
            <th rowspan="2"><nfwui:LabelBox id="lblDairinin" code="<%= MessageIdConstant.SKF2030_SC001_DAIRININ %>" /></th>
            <th colspan="3"><nfwui:LabelBox id="lblDairininName" code="<%= MessageIdConstant.SKF2030_SC001_DAIRININ_NAME %>" /></th>
            <td colspan="3">
            ${f:h(form.dairiName) }
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblDairiRenrakusaki" code="<%= MessageIdConstant.SKF2030_SC001_DAIRI_RENRAKUSAKI %>" /></th>
            <td colspan="3">
            ${f:h(form.dairiRenrakusaki) }
            </td>
        </tr>

        <tr>
            <th rowspan="2"><nfwui:LabelBox id="lblBihinHannyu" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_HANNYU %>" /></th>
            <th colspan="3"><nfwui:LabelBox id="lblBihinKiboDate" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_KIBO_DATE %>" /></th>
            <td colspan="3">
                ${f:h(form.sessionDay) }&nbsp;${f:h(form.sessionTimeText) } 
            </td>
        </tr>
        <tr>
            <th colspan="3"><nfwui:LabelBox id="lblRenrakusaki" code="<%= MessageIdConstant.SKF2030_SC001_RENRAKUSAKI %>" /></th>
            <td colspan="3">
                ${f:h(form.renrakuSaki) }
            </td>
        </tr>
        <tr>
            <th colspan="4"><nfwui:LabelBox id="lblCompleteDate" code="<%= MessageIdConstant.SKF2030_SC001_COMPLETE_DATE %>" /></th>
                                    <td colspan="3">
<imart:condition validity="<%= String.valueOf(form.isCompletionDayDisabled()) %>" negative>
		<div style="float: left; width: 170px;">
               <nfwui:DateBox id="completionDay" name="completionDay" cssStyle="width: 150px;" />
        </div>
        <div style="margin-left: 170px;">
               <span style="color:red;">※備品の搬入が完了した日を入力してください</span>
        </div>
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isCompletionDayDisabled()) %>">
               <imui:textbox id="completionDay" name="completionDay" value="${f:h(form.completionDay) }" cssStyle="width: 150px;" disabled="true" tabindex="5"  />
</imart:condition>
                                    </td>
                                </tr>


<tr style="border:none">
<td style="border:none">
   </td>
</tr>

                                <tr>
                                    <th rowspan="2" colspan="4"><nfwui:LabelBox id="lblBihin" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN %>" /></th>
                        <tr>
                            <th><nfwui:LabelBox id="lblBihinState" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_STATE %>" /></th>
                            <th><nfwui:LabelBox id="lblBihinAppl" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_APPL %>" /></th>
                            <th><nfwui:LabelBox id="lblBihinAdjust" code="<%= MessageIdConstant.SKF2030_SC001_BIHIN_ADJUST %>" /></th>
                        </tr>

                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblWasher" code="<%= MessageIdConstant.SKF2030_SC001_WASHER %>" /></th>
                           <td>${f:h(form.bihinState11) }</td>
                           <td>${f:h(form.bihinApplText11) }</td>
                           <td>${f:h(form.bihinAdjust11) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblFreezer" code="<%= MessageIdConstant.SKF2030_SC001_FREEZER %>" /></th>
                           <td>${f:h(form.bihinState12) }</td>
                           <td>${f:h(form.bihinApplText12) }</td>
                           <td>${f:h(form.bihinAdjust12) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblOven" code="<%= MessageIdConstant.SKF2030_SC001_OVEN %>" /></th>
                           <td>${f:h(form.bihinState13) }</td>
                           <td>${f:h(form.bihinApplText13) }</td>
                           <td>${f:h(form.bihinAdjust13) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblCleaner" code="<%= MessageIdConstant.SKF2030_SC001_CLEANER %>" /></th>
                           <td>${f:h(form.bihinState14) }</td>
                           <td>${f:h(form.bihinApplText14) }</td>
                           <td>${f:h(form.bihinAdjust14) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblRiceCook" code="<%= MessageIdConstant.SKF2030_SC001_RICE_COOK %>" /></th>
                           <td>${f:h(form.bihinState15) }</td>
                           <td>${f:h(form.bihinApplText15) }</td>
                           <td>${f:h(form.bihinAdjust15) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblTv" code="<%= MessageIdConstant.SKF2030_SC001_TV %>" /></th>
                           <td>${f:h(form.bihinState16) }</td>
                           <td>${f:h(form.bihinApplText16) }</td>
                           <td>${f:h(form.bihinAdjust16) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblTvStand" code="<%= MessageIdConstant.SKF2030_SC001_TV_STAND %>" /></th>
                           <td>${f:h(form.bihinState17) }</td>
                           <td>${f:h(form.bihinApplText17) }</td>
                           <td>${f:h(form.bihinAdjust17) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblKotatsu" code="<%= MessageIdConstant.SKF2030_SC001_KOTATSU %>" /></th>
                           <td>${f:h(form.bihinState18) }</td>
                           <td>${f:h(form.bihinApplText18) }</td>
                           <td>${f:h(form.bihinAdjust18) }</td>
                        </tr>
                        <tr>
                           <th colspan="4"><nfwui:LabelBox id="lblKitchenCabinet" code="<%= MessageIdConstant.SKF2030_SC001_KITCHEN_CABNET %>" /></th>
                           <td>${f:h(form.bihinState19) }</td>
                           <td>${f:h(form.bihinApplText19) }</td>
                           <td>${f:h(form.bihinAdjust19) }</td>
                                                </tr>
                                </tr>
<imart:condition validity="<%= String.valueOf(form.isStatus24Flag()) %>" negative>
<tr style="border:none">
<td style="border:none">
   </td>
</tr>
                                <tr>
                                    <th colspan="4"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2030_SC001_COMMENT %>" /></th>
            <td colspan="3" >
                <imui:textArea id="commentNote" name="commentNote" rows="4" placeholder="例  承認者へのコメント" style="width: 98%;"></imui:textArea></textarea>
            </td>
        </tr>
</imart:condition>        
    </tbody>
</table>
