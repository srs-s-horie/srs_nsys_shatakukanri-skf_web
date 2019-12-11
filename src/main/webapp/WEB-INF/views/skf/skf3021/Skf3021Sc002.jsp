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
<script src="scripts/skf/skfCommon.js"></script>

<style type="text/css">

</style>

<!-- コンテンツエリア -->
<div id="imui-container" style="width:760px;min-width:760px;max-width: 760px;">
<nfwui:Form id="skf3020sc001Form" name="skf3020sc001Form" modelAttribute="form" secureToken="false">
	<div class="imui-form-container-wide">
		<div style="height:30px; bottom:10px">入退居予定者における入退居申請内容を照会します。</div>
			<nfwui:Table use="search">
				<tbody>
					<tr>
						<td style="width: 40%;">
							<table class="imui-form-search-condition">
								<tr>
									<th rowspan="4" style="width: 15%">
<!-- 												<label >申請者</label> -->
										<nfwui:LabelBox id="lblShinseisha" code="<%=MessageIdConstant.SKF3021_SC002_SHINSEISHA %>" />
									</th>
									<th style="width: 15%;">
<!-- 												<label>社員番号</label> -->
										<nfwui:LabelBox id="lblShainNumber" code="<%=MessageIdConstant.SKF3021_SC002_SHAIN_NUMBER %>" />
									</th>
									<td  style="width: 20%;" >
										${f:h(form.hdnRowShainNo)}
									</td>
								</tr>
								<tr>
									<th>
<!-- 												<label>氏名</label> -->
										<nfwui:LabelBox id="lblShainNumber" code="<%=MessageIdConstant.SKF3021_SC002_SHAIN_NAME %>" />
									</th>
									<td  >
										${f:h(form.shainName)}
									</td>
								</tr>
								<tr>
									<th >
<!-- 												<label>等級</label> -->
										<nfwui:LabelBox id="lblTokyu" code="<%=MessageIdConstant.SKF3021_SC002_TOKYU %>" />
									</th>
									<td  >
										${f:h(form.tokyu)}
									</td>
								</tr>
								<tr>
									<th>
<!-- 												<label>年齢</label> -->
										<nfwui:LabelBox id="lblNenrei" code="<%=MessageIdConstant.SKF3021_SC002_NENREI %>" />
									</th>
									<td  >
										${f:h(form.nenrei)}
									</td>
								</tr>	
								<tr> <td colspan="3">&nbsp;</td></tr>
								<tr>
									<th colspan="2">
<!-- 												<label>社宅の必要・不要</label> -->
										<nfwui:LabelBox id="lblHitsuyoFuyo" code="<%=MessageIdConstant.SKF3021_SC002_HITSUYOFUYO %>" />
									</th>
									<td  >
										${f:h(form.hitsuyofuyo)}
									</td>
								</tr>
								<tr>
									<th colspan="2">
<!-- 												<label>社宅を必要とする理由</label> -->
										<nfwui:LabelBox id="lblHitsuyoRiyu" code="<%=MessageIdConstant.SKF3021_SC002_HITSUYORIYU %>" />
									</th>
									<td  >
										${f:h(form.hitsuyoriyu)}
									</td>
								</tr>
								<tr>
									<th colspan="2">
<!-- 												<label>社宅の不要理由</label> -->
										<nfwui:LabelBox id="lblFuyoRiyu" code="<%=MessageIdConstant.SKF3021_SC002_FUYORIYU %>" />
									</th>
									<td  >
										${f:h(form.fuyoriyu)}
									</td>
								</tr>
								<tr>
									<th colspan="2">
<!-- 												<label>必要とする社宅</label> -->
										<nfwui:LabelBox id="lblHitsuyoShataku" code="<%=MessageIdConstant.SKF3021_SC002_HITSUYO_SHATAKU %>" />
									</th>
									<td  >
										${f:h(form.hitsuyoShataku)}
									</td>
								</tr>
								<tr>
									<th colspan="2">
<!-- 												<label>入居希望日（予定日）</label> -->
										<nfwui:LabelBox id="lblNyukyoKibobi" code="<%=MessageIdConstant.SKF3021_SC002_NYUKYO_KIBOBI %>" />
									</th>
									<td  >
										${f:h(form.nyukyoKibobi)}
									</td>
								</tr>
								<tr>
									<th colspan="2">
<!-- 												<label>自動車の保管場所</label> -->
										<nfwui:LabelBox id="lblJidoshaHokambasho" code="<%=MessageIdConstant.SKF3021_SC002_JIDOSHA_HOKAN %>" />
									</th>
									<td  >
										${f:h(form.jidoshaHokan)}
									</td>
								</tr>	
							</table>
						</td>
						<td>&nbsp;</td>
						<td style="width: 60%;">
							<table class="imui-form-search-condition">
									<tr>
										<th colspan="2" style="width: 60%">
<!-- 													<label>退居（返還）する社宅又は駐車場</label> -->
											<nfwui:LabelBox id="lblTaikyoShatakuOrChushajo" code="<%=MessageIdConstant.SKF3021_SC002_TAIKYO_SHATAKU_OR_CHUSHAJO %>" />
										</th>
										<td >
											${f:h(form.taikyoShatakuOrChushajo)}
										</td>

									</tr>
									<tr><td colspan="3">&nbsp;</td></tr>
									<tr>
										<th rowspan="9" style="width: 20%">
<!-- 													<label>現居住宅</label> -->
											<nfwui:LabelBox id="lblGenkyoJutaku" code="<%=MessageIdConstant.SKF3021_SC002_GENKYO_JUTAKU %>" />
										</th>
										<th 　style="width: 15%" >
<!-- 													<label>社宅名</label> -->
											<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3021_SC002_SHATAKU_NAME %>" />
										</th>
										<td >
											${f:h(form.shatakuName)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 													<label>部屋番号</label> -->
											<nfwui:LabelBox id="lblRoomNo" code="<%=MessageIdConstant.SKF3021_SC002_ROOM_NO %>" />
										</th>
										<td  >
											${f:h(form.roomNo)}
										</td>
									
									</tr>	
									<tr>
										<th  >
<!-- 												<label>規格（間取り）</label> -->
										<nfwui:LabelBox id="lblKikaku" code="<%=MessageIdConstant.SKF3021_SC002_KIKAKU %>" />
										</th>
										<td >
											${f:h(form.kikaku)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 												<label>用途</label> -->
										<nfwui:LabelBox id="lblYoto" code="<%=MessageIdConstant.SKF3021_SC002_YOTO %>" />
										</th>
										<td >
											${f:h(form.yoto)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 												<label>面積</label> -->
										<nfwui:LabelBox id="lblMenseki" code="<%=MessageIdConstant.SKF3021_SC002_MENSEKI %>" />
										</th>
										<td >
											${f:h(form.menseki)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 												<label>使用状況</label> -->
										<nfwui:LabelBox id="lblShiyojokyo" code="<%=MessageIdConstant.SKF3021_SC002_SHIYOJOKYO %>" />
										</th>
										<td >
											${f:h(form.shiyojokyo)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 												<label>退居予定日</label> -->
										<nfwui:LabelBox id="lblTaikyoYoteibi" code="<%=MessageIdConstant.SKF3021_SC002_TAIKYO_YOTEIBI %>" />
										</th>
										<td >
											${f:h(form.taikyoYoteibi)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 												<label>退居理由</label> -->
										<nfwui:LabelBox id="lblTaikyoRiyu" code="<%=MessageIdConstant.SKF3021_SC002_TAIKYO_RIYU %>" />
										</th>
										<td >
											${f:h(form.taikyoRiyu)}
										</td>
									</tr>
									<tr>
										<th  >
<!-- 												<label>退居後連絡先</label> -->
										<nfwui:LabelBox id="lblTaikyogoRenrakusaki" code="<%=MessageIdConstant.SKF3021_SC002_TAIKYOGO_RENRAKUSAKI %>" />
										</th>
										<td >
											${f:h(form.taikyogoRenrakusaki)}
										</td>
									</tr>
							</table>
						</td>
					</tr>
					<tr>
					<td colspan="3">
															
						<table class="imui-form-search-condition">
								<tbody>
									<tr>
									<th style="width: 15%;">
<!-- 												<label>特殊事情</label> -->
										<nfwui:LabelBox id="lblTokushuJijo" code="<%=MessageIdConstant.SKF3021_SC002_TOKUSHUJIJO %>" />
									</th>
									<td >
										<imui:textArea id="tokushujijo" name="tokushujijo" readonly="true" style="width:98%;" value="${f:h(form.tokushujijo)}"  cols="30" rows="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr>
					<tr>
						<td colspan="3">
						</td>
					</tr>
					<tr>
						<td style="width: 40%;">
							<imui:listTable id="listDokyoKazokuIchiran" process="jssp" autoEncode="true" autoWidth="true" 
								data="${form.dokyoKazokuIchiranList}" multiSelect="false" rowNumbers="true" height="auto">
								<cols sortable="false">
									<col name="colDokyoName" width="130" sortable="false" align="left" caption="氏名" wrap="true" />
									<col name="colZokugara" width="50" sortable="false" align="center" caption="続柄" wrap="true" />
									<col name="colNenrei" width="50" sortable="false" align="left" caption="年齢" wrap="true" />
								</cols>
							</imui:listTable>
						</td>
						<td>&nbsp;</td>
						<td style="width: 50%;">
							<imui:listTable id="listJidoshaIchiran" process="jssp" autoEncode="true" autoWidth="true" autoResize="true"
								data="${form.jidoshaIchiranList}" multiSelect="false" rowNumbers="true" >
								<cols>
									<col name="colCarName" width="100" sortable="false" align="left" caption="車名" wrap="true" />
									<col name="colTorokuNo" width="90" sortable="false" align="left" caption="登録番号" wrap="true" />
									<col name="colCarUser" width="90" sortable="false" align="left" caption="使用者" wrap="true" />
									<col name="colShiyokaishibi" width="85" sortable="false" align="left" caption="使用開始日" wrap="true" />
								</cols>
							</imui:listTable>
						</td>
					</tr>

				</tbody>
		</nfwui:Table>
		<br>
		<div class="align-R">
			<nfwui:PopupButton id="closebtn" value="画面を閉じる" cssStyle="width:100px;" cssClass="imui-small-button" modalMode="true" use="cancel"/>
		</div>
	</div>
</nfwui:Form>
</div>
<!-- コンテンツエリア　ここまで -->