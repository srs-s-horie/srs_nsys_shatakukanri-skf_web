<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.util.SkfDropDownUtils" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>

<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.arnx.jsonic.JSON"%>
<%@page import="org.terasoluna.gfw.common.message.ResultMessage"%>
<%@page import="org.springframework.web.servlet.support.RequestContext"%>
<%@page import="org.springframework.web.servlet.tags.RequestContextAwareTag"%>
<%@page import="org.springframework.context.MessageSource"%>
<%@page import="jp.co.c_nexco.nfw.common.bean.NfwResultMessages"%>
<%@page import="jp.co.c_nexco.nfw.core.constants.CommonConstant"%>

<!DOCTYPE html>
<!-- ツールバー -->
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<table class="imui-form-search-condition">
			<tbody style="background-color: #33333;">
				<tr>
					<!-- 左側の入力域の部分 -->
					<td style="width:70%; border: none;background-color:#fdfdff;" class="imui-form-container ">
						<div class="imui-form-container-wide">
							<table class="imui-form-search-condition">
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 10%;">
									<col style="width: 10%;">
									<col style="width: 20%;">
									<col style="width: 10%;">
									<col style="width: 10%;">
								</colgroup>
								<!-- タイトル（申請内容） -->
								<div class="imui-chapter-title" style="margin-bottom: 10px;">
									<h2>申請内容</h2>
								</div>
								<tbody>
									<!-- 所属 -->
									<tr>
										<th rowspan="4">
											<nfwui:LabelBox id="lblHeadBelong" code="<%= MessageIdConstant.SKF2020_SC002_BELONG %>" />
										</th>
										<!-- 機関 -->
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadAgency" code="<%= MessageIdConstant.SKF2020_SC002_AGENCY %>" />
										</th>
										<td colspan="3">
											${f:h(form.agencyName)}
										</td>
									</tr>
									<!-- 部等 -->
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadAffiliation1" code="<%= MessageIdConstant.SKF2020_SC002_AFFLIATION1 %>" />
										</th>
							   			<td colspan="3">
							   				${f:h(form.affiliation1Name)}
							 			</td>
									</tr>
									<!-- 室、チーム又は課 -->
									<tr>
									   	<th colspan="2">
									   		<nfwui:LabelBox id="lblHeadAffiliation2" code="<%= MessageIdConstant.SKF2020_SC002_AFFLIATION2 %>" />
										</th>
								   		<td colspan="3">
									   		${f:h(form.affiliation2Name)}
						   				</td>
									</tr>
									<!-- 勤務先のTEL -->
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadTel" code="<%= MessageIdConstant.SKF2020_SC002_TEL %>" />
										</th>
										<td colspan="3">
											<imui:textbox id="tel" name="tel" value="${f:h(form.tel)}" style="width: 50%;" placeholder="例　84-3549（半角）" />
										</td>
									</tr>			
									<!-- 申請者情報 -->
									<tr>
										<th rowspan="4">
											<nfwui:LabelBox id="lblHeadApplicant" code="<%= MessageIdConstant.SKF2020_SC002_APPLICANT %>" />
										</th>
										<!-- 社員番号 -->
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadShainNo" code="<%= MessageIdConstant.SKF2020_SC002_SHAIN_NO %>" />
										</th>
										<td colspan="3">
											${f:h(form.shainNo)}
										</td>
									</tr>
									<!-- 氏名 -->
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadName" code="<%= MessageIdConstant.SKF2020_SC002_NAME %>" />
										</th>
										<td colspan="3">
											${f:h(form.name)}
										</td>
									</tr>
									<!-- 等級 -->
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadTokyu" code="<%= MessageIdConstant.SKF2020_SC002_TOKYU %>" />	
										</th>
										<td colspan="3">
											${f:h(form.tokyuName)}
										</td>
									</tr>
									<!-- 性別 -->
									<tr>
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2020_SC002_GENDER %>" />
										</th>
										<td colspan="3">
											${f:h(form.genderName)}
										</td>
									</tr>
									<!-- 社宅を必要としますか？ -->
									<tr>
										<th colspan="3">
											<nfwui:LabelBox id="lblHeadAskedShataku" code="<%= MessageIdConstant.SKF2020_SC002_ASKED_SHATAKU %>" />
										</th>
										<td colspan="3">         
											<nfwui:RadioButtonGroup id="taiyoHituyo" dynamicMaskList="taiyoHituyoDynam">
												<nfwui:RadioButton name="taiyoHituyo" id="rdoHitsuyo" label="必要とする" 
													value="<%= CodeConstant.ASKED_SHATAKU_HITSUYO %>" checked="${form.rdoHitsuyoChecked}"/>
												<nfwui:RadioButton name="taiyoHituyo" id="rdoFuyou" label="必要としない"
													value="<%=CodeConstant.ASKED_SHATAKU_FUYOU %>" checked="${form.rdoFuyouChecked}"/>	
												<nfwui:RadioButton name="taiyoHituyo" id="rdoParkingOnly" label="駐車場のみ" 
													value="<%=CodeConstant.ASKED_SHATAKU_PARKING_ONLY %>"
												disabled="${form.rdoParkingOnlyDisabled}" checked="${form.rdoParkingOnlyChecked}"/>
											</nfwui:RadioButtonGroup>
										</td>
									</tr>
									<!-- 社宅を必要とする理由 -->
									<tr>
										<th colspan="3" >
											<nfwui:LabelBox id="lblHeadHitsuyoRiyu" code="<%= MessageIdConstant.SKF2020_SC002_HITSUYO_RIYU %>" />
										</th>
										<td colspan="3" class="${form.hitsuyoRiyuErr}">
											<nfwui:RadioButtonGroup id="hitsuyoRiyu" dynamicMaskList="hitsuyoRiyuDynam">
												<nfwui:RadioButton name="hitsuyoRiyu" id="rdoHitsuyoIdo" label="異動のため" 
													value="<%= CodeConstant.IDOU %>" disabled="true" checked="${form.rdoHitsuyoIdoChecked}"/>
												<nfwui:RadioButton name="hitsuyoRiyu" id="rdoHitsuyoKekkon" label="結婚のため" 
													value="<%= CodeConstant.KEKKON %>" disabled="true" checked="${form.rdoHitsuyoKekkonChecked}" />
												<nfwui:RadioButton name="hitsuyoRiyu" id="rdoHitsuyoSonota" label="その他" 
													value="<%= CodeConstant.HITUYO_RIYU_OTHERS %>" disabled="true" checked="${form.rdoHitsuyoSonotaChecked}" />
											</nfwui:RadioButtonGroup>
										</td>
									</tr>
									<!-- 社宅を必要としない理由 -->
									<tr>
										<th colspan="3">
											<nfwui:LabelBox id="lblHeadFuyouRiyu" code="<%= MessageIdConstant.SKF2020_SC002_FUYO_RIYU %>" />
										</th>
										<td colspan="3" class="${form.fuhitsuyoRiyuErr}" >
											<nfwui:RadioButtonGroup id="fuhitsuyoRiyu" >
												<nfwui:RadioButton name="fuhitsuyoRiyu" id="rdoFuyouJitakutsuukinn" label="自宅通勤" 
													value="<%= CodeConstant.JITAKU_TSUKIN %>" disabled="true" checked="${form.rdoFuyouJitakutsuukinnChecked}" />
												<nfwui:RadioButton name="fuhitsuyoRiyu" id="rdoFuyouJikokariage" label="自己借上" 
													value="<%= CodeConstant.JIKO_KARIAGE %>" disabled="true" checked="${form.rdoFuyouJikokariageChecked}" />
												<nfwui:RadioButton name="fuhitsuyoRiyu" id="rdoFuyouSonota" 
													label="その他" value="<%= CodeConstant.FUYO_RIYU_OTHERS %>" disabled="true" checked="${form.rdoFuyouSonotaChecked}" />
											</nfwui:RadioButtonGroup>
										</td>
									</tr>
									<!-- 新所属 -->
									<tr>
										<th rowspan="3">
											<nfwui:LabelBox id="lblHeadNewBelong" code="<%= MessageIdConstant.SKF2020_SC002_NEW_BELONG %>" />
										</th>
										<!-- 機関-->                           		
										<th colspan="2">
											<nfwui:LabelBox id="lblHeadNewAgency" code="<%= MessageIdConstant.SKF2020_SC002_NEW_AGENCY %>" />
										</th>
										<td colspan="3" class="${form.newAgencyErr}">
											<imui:select id="agencyCd" name="agencyCd" list="${form.ddlAgencyList}"  disabled="true" width="50%" />
											<div>
												<imui:textbox id="newAgency" name="newAgency" value="${f:h(form.newAgency)}" style="width: 50%;" placeholder="例 〇〇会社"  disabled="true"/>
											</div>
										</td>
										<!-- 部等-->                              	
										<tr>
										  	<th colspan="2">
										   		<nfwui:LabelBox id="lblHeadNewAffiliation1" dynamicMaskList="otherEnabled" code="<%= MessageIdConstant.SKF2020_SC002_NEW_AFFLIATION1 %>" />
											</th>
											<td colspan="3" class="${form.newAffiliation1Err}">
												<imui:select id="affiliation1Cd" name="affiliation1Cd" list="${form.ddlAffiliation1List}" disabled="true" width="50%"/>
												<div>
													<imui:textbox id="newAffiliation1Other" name="newAffiliation1Other" value="${f:h(form.newAffiliation1Other)}" style="width: 50%;" placeholder="例 〇〇部" class="${form.otherAffiliation1Err}" disabled="true" />
												</div>
											</td>
										</tr>
										<!-- 室、チーム又は課--> 
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHeadNewAffiliation2" code="<%= MessageIdConstant.SKF2020_SC002_NEW_AFFLIATION2 %>" />
											</th>
										 	<td colspan="3" class="${form.newAffiliation2Err}">
												<imui:select id="affiliation2Cd" name="affiliation2Cd" list="${form.ddlAffiliation2List}" width="50%" disabled="true" />
												<div>
													<imui:textbox id="newAffiliation2Other" name="newAffiliation2Other" value="${f:h(form.newAffiliation2Other)}" 
														style="width: 50%;" class="${form.otherAffiliation1Err}" placeholder="例 〇〇事業所" disabled="true" />
												</div>
											</td>
										</tr>
										<!-- 必要とする社宅 -->
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadHitsuyoShataku" code="<%= MessageIdConstant.SKF2020_SC002_HITSUYO_SHATAKU %>" />
											</th>
											<td id="hitsuyoShataku" colspan="3" class="${form.hitsuyoShatakuErr}">
												<nfwui:RadioButton name="rdoKikon" id="rdoKikon" label="既婚" disabled="${form.rdoKikonDisabled}"
													value="<%= CodeConstant.KIKON %>" checked="${form.rdoKikonChecked}" />
													<nfwui:RadioButtonGroup id="hitsuyoShataku" dynamicMaskList="hitsuyoShatakuDynam1"> 
														（
															<nfwui:RadioButton name="hitsuyoShataku" id="rdoHitsuyoSetai" label="世帯" 
																value="<%= CodeConstant.SETAI %>" disabled="${form.rdoHitsuyoSetaiDisabled}" checked="${form.rdoHitsuyoSetaiChecked}" />
															<nfwui:RadioButton name="hitsuyoShataku" id="rdoHitsuyoTanshin" label="単身" 
																value="<%= CodeConstant.TANSHIN %>" disabled="${form.rdoHitsuyoTanshinDisabled}" checked="${form.rdoHitsuyoTanshinChecked}" />
														）
															<br>
															<nfwui:RadioButton name="hitsuyoShataku" id="rdoHitsuyoDokushin" label="独身" 
																value="<%= CodeConstant.DOKUSHIN %>" disabled="${form.rdoHitsuyoDokushinDisabled}" checked="${form.rdoHitsuyoDokushinChecked}" />
													</nfwui:RadioButtonGroup>
											</td>
										</tr>
										<!-- 同居家族 -->                                	
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadDokyoKazoku" code="<%= MessageIdConstant.SKF2020_SC002_DOKYO_KAZOKU %>" />
											</th>
											<td colspan="3">
												<table class="imui-form-search-condition" style="width:100%;">
													<tbody>
														<tr>
															<!-- 続柄、氏名、年齢 --> 
															<th>
																<nfwui:LabelBox id="lblHeadZokugara" code="<%= MessageIdConstant.SKF2020_SC002_ZOKUGARA %>" />
															</th>
															<th>
																<nfwui:LabelBox id="lblHeadShrmei" code="<%= MessageIdConstant.SKF2020_SC002_SHIMEI %>" />
															</th>
															<th>
																<nfwui:LabelBox id="lblHeadNenrei" code="<%= MessageIdConstant.SKF2020_SC002_NENREI %>" />
															</th>
														</tr>
														<tr>
															<td style="text-align:center;">
																<imui:textbox id="dokyoRelation1" name="dokyoRelation1"  class="${form.dokyoRelation1Err}" value="${f:h(form.dokyoRelation1)}" style="width: 95%;" placeholder="例 祖父" disabled="true" /> 
															</td>
															<td style="text-align:center;" >
																<imui:textbox id="dokyoName1" name="dokyoName1" value="${f:h(form.dokyoName1)}" class="${form.dokyoName1Err}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" />
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoAge1" name="dokyoAge1" value="${f:h(form.dokyoAge1)}" class="${form.dokyoAge1Err}" style="width: 90%;" placeholder="例 半角数字" disabled="true" />
															</td>
														</tr>
														<tr>
															<td style="text-align:center;">
																<imui:textbox id="dokyoRelation2" name="dokyoRelation2" value="${f:h(form.dokyoRelation2)}"  class="${form.dokyoRelation2Err}" style="width: 95%;" placeholder="例 祖父" disabled="true" />
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoName2" name="dokyoName2" value="${f:h(form.dokyoName2)}"  class="${form.dokyoName2Err}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" />	    
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoAge2" name="dokyoAge2" value="${f:h(form.dokyoAge2)}"  class="${form.dokyoAge2Err}" style="width: 90%;" placeholder="例 半角数字" disabled="true" />
														    </td>
														</tr>
														<tr>
													    	<td  style="text-align:center;">
																<imui:textbox id="dokyoRelation3" name="dokyoRelation3" value="${f:h(form.dokyoRelation3)}"  class="${form.dokyoRelation3Err}" style="width: 95%;" placeholder="例 祖父" disabled="true" />		    
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoName3" name="dokyoName3" value="${f:h(form.dokyoName3)}"  class="${form.dokyoName3Err}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" />		    
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoAge3" name="dokyoAge3" value="${f:h(form.dokyoAge3)}"  class="${form.dokyoAge3Err}" style="width: 90%;" placeholder="例 半角数字" disabled="true" />
													    	</td>
														</tr>
														<tr>
															<td style="text-align:center;">
																<imui:textbox id="dokyoRelation4" name="dokyoRelation4" value="${f:h(form.dokyoRelation4)}"  class="${form.dokyoRelation4Err}" style="width: 95%;" placeholder="例 祖父" disabled="true" />   
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoName4" name="dokyoName4" value="${f:h(form.dokyoName4)}"  class="${form.dokyoName4Err}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" />    
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoAge4" name="dokyoAge4" value="${f:h(form.dokyoAge4)}"  class="${form.dokyoAge4Err}" style="width: 90%;" placeholder="例 半角数字" disabled="true" />
															</td>
														</tr>
														<tr>
															<td style="text-align:center;">
																<imui:textbox id="dokyoRelation5" name="dokyoRelation5"  class="${form.dokyoRelation5Err}" value="${f:h(form.dokyoRelation5)}" style="width: 95%;" placeholder="例 祖父" disabled="true" />
															</td>					  
															<td style="text-align:center;">
																<imui:textbox id="dokyoName5" name="dokyoName5"  class="${form.dokyoName5Err}" value="${f:h(form.dokyoName5)}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" />					    
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoAge5" name="dokyoAge5"  class="${form.dokyoAge5Err}" value="${f:h(form.dokyoAge5)}" style="width: 90%;" placeholder="例 半角数字" disabled="true" />
															</td>
														</tr>
														<tr>
															<td  style="text-align:center;">
																<imui:textbox id="dokyoRelation6" name="dokyoRelation6" class="${form.dokyoRelation6Err}" value="${f:h(form.dokyoRelation6)}" style="width: 95%;" placeholder="例 祖父" disabled="true" />                                                      
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoName6" name="dokyoName6" class="${form.dokyoName6Err}"  value="${f:h(form.dokyoName6)}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" /> 
															</td>
															<td style="text-align:center;">
																<imui:textbox id="dokyoAge6" name="dokyoAge6" class="${form.dokyoAge6Err}"  value="${f:h(form.dokyoAge6)}" style="width: 90%;" placeholder="例 半角数字" disabled="true" />
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr> 
										<!-- 入居情報 -->                                	
										<tr>
											<!--  入居希望日（予定日） -->
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadNyukyoKiboDate" code="<%= MessageIdConstant.SKF2020_SC002_NYUKYO_KIBO_DATA %>" />
											</th>
											<td colspan="3">
												<imui:textbox name="nyukyoYoteiDate" id="nyukyoYoteiDate" class="${form.nyukyoYoteiDateErr}" 
													value="${f:h(form.nyukyoYoteiDate)}" style="width:50%" disabled="true" />
												<im:calendar altField="#nyukyoYoteiDate" floatable="true" disabled="${form.nyukyoYoteiDateClDisabled}"/>   	                                  	
											</td>
										</tr>
										<!--  自動車の保管場所 -->  
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadCarPark" code="<%= MessageIdConstant.SKF2020_SC002_CAR_PARK %>" />
											</th>
											<td colspan="3" class="${form.parkingUmuErr}" >
												<nfwui:RadioButtonGroup id="parkingUmu" dynamicMaskList="parkingUmuDynam">
													<nfwui:RadioButton name="parkingUmu" id="rdoCarHitsuyo" label="必要とする" 
														value="<%= CodeConstant.CAR_PARK_HITUYO %>" disabled="true" checked="${form.rdoCarHitsuyoChecked}"/>
													<nfwui:RadioButton name="parkingUmu" id="rdoCarFuyo" label="必要としない" 
														value="<%= CodeConstant.CAR_PARK_FUYO %>" disabled="true"  checked="${form.rdoCarFuyoChecked}"/>
												</nfwui:RadioButtonGroup>
											</td>
										</tr>
										<!--  １台目 --> 
										<tr>
											<th rowspan="6">
												<nfwui:LabelBox id="lblHead1stCar" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR %>" />
											</th>
											<!-- 自動車の保有 --> 
											<th colspan="2">
												<nfwui:LabelBox id="lblHead1stCarNoInputFlg" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_NO_INPUT_FLG %>" />
											</th>
											<td colspan="3" class="${form.carNoInputFlgErr}">
												<nfwui:RadioButtonGroup id="carNoInputFlg" dynamicMaskList="carNoInputFlgDynam">
													<nfwui:RadioButton name="carNoInputFlg" id="rdo1stCarHoyu" label="保有している" value="<%= CodeConstant.CAR_HOYU %>" disabled="true" checked="${form.rdo1stCarHoyuChecked}"/>
													<nfwui:RadioButton name="carNoInputFlg" id="rdo1stCarYotei" label="購入を予定している" value="<%= CodeConstant.CAR_YOTEI %>" disabled="true" checked="${form.rdo1stCarYoteiChecked}"/>
												</nfwui:RadioButtonGroup>
											</td>
										</tr>	
										<!-- 自動車の車名 --> 								
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead1stCarName" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_NAME %>" />	
											</th>
											<td colspan="3">
												<imui:textbox id="carName" name="carName" class="${form.carNameErr}" value="${f:h(form.carName)}" style="width: 50%;" placeholder="例 プリウス" disabled="true" />
											</td>
										</tr>
										<!-- 自動車の登録番号 -->
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead1stCarNo" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_NO %>" />
											</th>
											<td colspan="3">
												<imui:textbox id="carNo" name="carNo" class="${form.carNoErr}" value="${f:h(form.carNo)}" style="width: 50%;" placeholder="例 名古屋 300 あ 1235" disabled="true" />
											</td>
										</tr>
										<!-- 車検の有効期間満了日 -->																	
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead1stCarExpirationDate" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_EXCEPTION_DATA %>" />
											</th>
											<td colspan="3">
												<imui:textbox name="carExpirationDate" id="carExpirationDate"  class="${form.carExpirationDateErr}" 
													value="${f:h(form.carExpirationDate)}" style="width:50%" disabled="true" />
												<im:calendar altField="#carExpirationDate" floatable="true" disabled="${form.carExpirationDateClDisabled}"/>	                                   
											</td>
										</tr>
										<!-- 自動車の使用者 -->
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead1stCarUser" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_USE %>" />
											</th>
											<td colspan="3">
												<imui:textbox id="carUser" name="carUser" class="${form.carUserErr}" value="${f:h(form.carUser)}" style="width: 50%;" placeholder="中日本 太郎" disabled="true" />
											</td>
										</tr>
										<!-- 自動車の保管場所使用開始日（予定日） -->
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead1stParkingUseDate" code="<%= MessageIdConstant.SKF2020_SC002_1ST_PARKING_USE_DATE %>" />
											</th>
											<td colspan="3">
												<imui:textbox name="parkingUseDate" id="parkingUseDate" class="${form.parkingUseDateErr}" 
													value="${f:h(form.parkingUseDate)}" style="width:50%" disabled="true" />
												<im:calendar altField="#parkingUseDate" floatable="true" disabled="${form.parkingUseDateClDisabled}"/>		                                   
											</td>
										</tr>
										<!-- ２台目 --> 
										<tr>
											<th rowspan="6">
												<nfwui:LabelBox id="lblHead2ndCar" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR %>" />
											</th>
											<!-- 自動車の保有 --> 
											<th colspan="2">
												<nfwui:LabelBox id="lblHead2ndCarNoInputFlg" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_NO_INPUT_FLG %>" />
											</th>
											<td colspan="2" class="${form.carNoInputFlg2Err}">
												<nfwui:RadioButtonGroup id="carNoInputFlg2" dynamicMaskList="carNoInputFlg2Dynam">
													<nfwui:RadioButton name="carNoInputFlg2" id="rdo2stCarHoyu" label="保有している" value="<%= CodeConstant.CAR_HOYU %>"
														disabled="true" checked="${form.rdo2stCarHoyuChecked}"/>
													<nfwui:RadioButton name="carNoInputFlg2" id="rdo2stCarYotei" label="購入を予定している" value="<%= CodeConstant.CAR_YOTEI %>"
														disabled="true" checked="${form.rdo2stCarYoteiChecked}"/>
												</nfwui:RadioButtonGroup>
											</td>
											<td rowspan="6" colspan="1" style="color:red;">
												<div>
													<nfwui:LabelBox id="lbl2ndExplanationCar" code="<%= MessageIdConstant.SKF2020_SC002_2ND_EXPLANATION_CAR %>" />
												</div>
											</td>
										</tr>
										<!-- 自動車の車名 -->                             	
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead2ndCarName" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_NAME %>" />
											</th>
											<td colspan="2">
												<imui:textbox id="carName2" name="carName2"  class="${form.carName2Err}" 
													value="${f:h(form.carName2)}" style="width: 85%;" placeholder="例 プリウス" disabled="true" />
											</td>
										</tr>
										<!-- 自動車の登録番号 --> 
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead2ndCarNo" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_NO %>" />
											</th>
											<td colspan="2">
											<imui:textbox id="carNo2" name="carNo2" class="${form.carNo2Err}"
												value="${f:h(form.carNo2)}" style="width: 85%;" placeholder="例 名古屋 300 あ 1235" disabled="true" />
											</td>
										</tr>
										<!-- 車検の有効期間満了日 -->																	
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead2ndCarExpirationDate" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_EXCEPTION_DATA %>" />
											</th>
											<td colspan="2">
												<imui:textbox name="carExpirationDate2" id="carExpirationDate2" class="${form.carExpirationDate2Err}"
													value="${f:h(form.carExpirationDate2)}" style="width:85%" disabled="true" />
												<im:calendar altField="#carExpirationDate2" floatable="true" disabled="${form.carExpirationDate2ClDisabled}"/> 	                                 
											</td>
										</tr>
										<!-- 自動車の使用者 -->	
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead2ndCarUser" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_USE %>" />
											</th>
											<td colspan="2">
												<imui:textbox id="carUser2" name="carUser2" class="${form.carUser2Err}" value="${f:h(form.carUser2)}" 
													style="width: 85%;" placeholder="中日本太郎" disabled="true" />
											</td>
										</tr>
										<!-- 自動車の保管場所使用開始日（予定日） -->
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHead2ndParkingUseDate" code="<%= MessageIdConstant.SKF2020_SC002_2ST_PARKING_USE_DATE %>" />
											</th>
											<td colspan="2">
												<imui:textbox name="parkingUseDate2" id="parkingUseDate2" class="${form.parkingUseDate2Err}" 
													value="${f:h(form.parkingUseDate2)}" style="width:85%" disabled="true" />
												<im:calendar altField="#parkingUseDate2" floatable="true" disabled="${form.parkingUseDate2ClDisabled}" />
											</td>
										</tr> 
										<!-- 現居住宅 --> 
										<tr>
											<th rowspan="5">
												<nfwui:LabelBox id="lblHeadNowShatakuName" code="<%= MessageIdConstant.SKF2020_SC002_NOW_JYUTAKU %>" />
											</th>
											<th colspan="2"><label></label></th>
											<td colspan="3" class="${form.nowShatakuErr}">
												<nfwui:RadioButtonGroup id="nowShataku" dynamicMaskList="nowShatakuDynam">
													<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuHoyu" label="保有(会社借上を含む)" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_HOYU %>" disabled="${form.rdoNowJutakuHoyuDisabled}" checked="${form.rdoNowJutakuHoyuChecked}" />
													<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuJitaku" label="自宅" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JITAKU %>" disabled="${form.rdoNowJutakuJitakuDisabeld}" checked="${form.rdoNowJutakuJitakuChecked}" />
													<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuKariage" label="自己借上" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JIKO_KARIAGE %>" disabled="${form.rdoNowJutakuKariageDisabled}" checked="${form.rdoNowJutakuKariageChecked}" />
													<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuSonota" label="その他" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_OTHERS %>" disabled="${form.rdoNowJutakuSonotaDisabled}"  checked="${form.rdoNowJutakuSonotaChecked}" />                             			
												</nfwui:RadioButtonGroup>
											</td>
										</tr>
										<!-- 保有社宅名 -->	
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHeadNowShatakuName" code="<%= MessageIdConstant.SKF2020_SC002_NOW_SHATAKU_NAME %>" />
											</th>
											<td colspan="3">
												<imui:select id="nowShatakuName" name="nowShatakuName" list="${form.ddlNowShatakuNameList}" 
													class="${form.nowShatakuNameErr}" value="" disabled="true"/>
											</td>
										</tr>
										<!--　室番号 -->	
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHeadNowRoomNo" code="<%= MessageIdConstant.SKF2020_SC002_NOW_ROOM_NO %>" />
											</th>
											<td colspan="3">                         
												<span id="nowShatakuNo">${f:h(form.nowShatakuNo)} </span>
											</td>
										</tr>
										<!--　規格（間取り） -->
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHeadNowRoomKikaku" code="<%= MessageIdConstant.SKF2020_SC002_NOW_ROOM_KIKAKU %>" />
											</th>
											<td colspan="3">
												<span id="nowShatakuKikakuName">${f:h(form.nowShatakuKikakuName)} </span>
											</td>
										</tr>
										<!--　面積-->
										<tr>
											<th colspan="2">
												<nfwui:LabelBox id="lblHeadNowRoomMenseki" code="<%= MessageIdConstant.SKF2020_SC002_NOW_ROOM_MENSEKI %>" />
											</th>
											<td colspan="3">
												<span id="nowShatakuMenseki">${f:h(form.nowShatakuMenseki)} </span>
											</td>
										</tr>
										<!-- 駐車場　1台目　保管場所 -->	                               	
										<tr>
											<th rowspan="2">
												<nfwui:LabelBox id="lblHeadParking" code="<%= MessageIdConstant.SKF2020_SC002_PARKING %>" />
											</th>
											<th colspan="1">
												<nfwui:LabelBox id="lblHeadParking1nd" code="<%= MessageIdConstant.SKF2020_SC002_PARKING_1ND %>" />
											</th>
											<th colspan="1">
												<nfwui:LabelBox id="lblHeadParking1ndPlace" code="<%= MessageIdConstant.SKF2020_SC002_PARKING_1ND_PLACE %>" />
											</th>
											<td colspan="3" >
												<span id="parking1stPlace">${f:h(form.parking1stPlace)} </span>
											</td>
										</tr>
										<!-- ２台目　保管場所 -->  
										<tr>
											<th colspan="1">
												<nfwui:LabelBox id="lblHeadParking2nd" code="<%= MessageIdConstant.SKF2020_SC002_PARKING_2ND %>" />
											</th>
											<th colspan="1">
												<nfwui:LabelBox id="lblHeadParking2ndPlace" code="<%= MessageIdConstant.SKF2020_SC002_PARKING_2ND_PLACE %>" />
											</th>
											<td colspan="3">
												<span id="parking2stPlace">${f:h(form.parking2stPlace)} </span>
											</td>
										</tr>
										<!-- 特殊事情等 -->  
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHead" code="<%= MessageIdConstant.SKF2020_SC002_TOKUSHU_JIJO %>" />
											</th>
											<td colspan="3">
												<imui:textArea id="tokushuJijo" name="tokushuJijo" class="${form.tokushuJijoErr}" value="${f:h(form.tokushuJijo)}" disabled="true" />
											</td>
										</tr>                            	
									<!-- 退居理由 -->
									<!-- 現保有社宅 -->   
									<tr>
										<th colspan="3">
											<nfwui:LabelBox id="lblHeadNowHoyuShataku" code="<%= MessageIdConstant.SKF2020_SC002_NOW_HOYU_SHATAKU %>" />
										</th>
										<td colspan="2" id="taikyoYotei" class="${form.taikyoYoteiErr}">
											<nfwui:RadioButtonGroup id="taikyoYotei" dynamicMaskList="taikyoYoteiDynam">
												<nfwui:RadioButton name="taikyoYotei" id="rdoNowHoyuShatakuTaikyo" label="退居する" value="<%= CodeConstant.LEAVE %>"
												disabled="true" checked="${form.rdoNowHoyuShatakuTaikyoChecked}"/>
												<nfwui:RadioButton name="taikyoYotei" id="rdoNowHoyuShatakuKeizoku" label="継続使用する" value="<%= CodeConstant.NOT_LEAVE %>" 
												disabled="true" checked="${form.rdoNowHoyuShatakuKeizokuChecked}"/>
											</nfwui:RadioButtonGroup>
										</td>
										<td rowspan="2" colspan="2" style="color:red;">
											<nfwui:LabelBox id="lblShatakuFuyouMsg" remove="${form.lblShatakuFuyouMsgRemove}"
												code="<%= MessageIdConstant.SKF2020_SC002_SHATAKU_FUYOU_MSG %>"  />
										</td>
									</tr> 
									<!-- 退居予定日 -->                               	
									<tr>
										<th colspan="3">
											<nfwui:LabelBox id="lblHeadTaikyoYoteiDate" code="<%= MessageIdConstant.SKF2020_SC002_TAIKYO_YOTEI_DATE %>" />
										</th>
										<td colspan="2">
										<imui:textbox name="taikyoYoteiDate" id="taikyoYoteiDate" 
										  	class="${form.taikyoYoteiDateErr}" value="${f:h(form.taikyoYoteiDate)}" style="width:50%"  disabled="true"/>
										<im:calendar altField="#taikyoYoteiDate" floatable="true" disabled="${form.taikyoYoteiDateClDisabled}" 
											onClose="onClose"/>
										</td>
									</tr>
									<!-- 社宅の状態 -->
									<c:if test="${form.taikyoViewFlag == 'true'}">
										<tr id="shatakuStatus">
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadShatakuStatus" code="<%= MessageIdConstant.SKF2020_SC002_SHATAKU_STATUS %>"
													remove="false"/>
											</th>
											<td colspan="3">
												<imui:textArea id="shatakuJyotai" name="shatakuJyotai"  class="${form.shatakuJyotaiErr}"
													value="${f:h(form.shatakuJyotai)}" style="width: 90%;" placeholder="例 壁紙に破損あり"  disabled="true" hidden="false"/>
											</td>
										</tr> 
										<!-- 退居理由 -->                               	
										<tr id="taikyoRiyuInfo">
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadTaikyoRiyu" code="<%= MessageIdConstant.SKF2020_SC002_TAIKYO_RIYU %>" />
											</th>
											<td colspan="3">
												<imui:select id="taikyoRiyuKbn" name="taikyoRiyuKbn"  style="width: 50%;" class="${form.ddlTaikyoRiyuKbnListErr}"
													list="${form.ddlTaikyoRiyuKbnList}"  disabled="true"/>
												<div>
													<imui:textArea id="taikyoRiyu" name="taikyoRiyu" class="${form.taikyoRiyuErr}"
														value="${f:h(form.taikyoRiyu)}" style="width: 90%;" placeholder="例 退職のため" disabled="true" />
												</div>
											</td>
										</tr> 
										<!-- 退居後の連絡先 -->
										<tr id="trTaikyogoRenrakuSaki">
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadTaikyogoRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC002_TAIKYOGO_RENRAKU_SAKI %>" />
											</th>
											<td colspan="3">
												<imui:textArea id="taikyogoRenrakuSaki" name="taikyogoRenrakuSaki" class="${form.taikyogoRenrakuSakiErr}"
													value="${f:h(form.taikyogoRenrakuSaki)}" style="width: 90%;" placeholder="例 090-0000-0000" disabled="true"/>
											</td>
										</tr>
										<!-- 返却備品 -->
										<tr id="returnEquipment">
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadReturnEquipment" code="<%= MessageIdConstant.SKF2020_SC002_RETURN_EQUIPMENT %>" />
											</th>
											<td colspan="3" id="lblReturnEquipment">
												<span id="returnEquipments">${form.returnEquipment)} </span>
											</td>
										</tr>
										<!-- 返却希望日 -->
										<tr id="returnWitnessRequestDate">
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadReturnWitnessRequestDate" code="<%= MessageIdConstant.SKF2020_SC002_RETURN_WITNESS_REQUEST_DATE %>" />
											</th>
											<td colspan="3">
												<imui:textbox name="sessionDay" id="sessionDay" class="${form.sessionDayErr}" 
													value="${f:h(form.sessionDay)}" style="width:150px"  disabled="${form.sessionDayDisabled}" />
												<im:calendar altField="#sessionDay" floatable="true" disabled="${form.sessionDayClDisabled}" onClose="onClose"/> 
												<imui:select id="sessionTime" name="sessionTime" class="${form.sessionTimeErr}" 
													list="${form.ddlReturnWitnessRequestDateList}" disabled="${form.sessionTimeDisabled}" />			
											</td>
										</tr>
										<!-- 連絡先 -->
										<tr id="trRenrakuSaki">
											<th colspan="3">
												<nfwui:LabelBox id="lblRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC002_RENRAKU_SAKI %>" />
											</th>
											<td colspan="3">
												<imui:textbox id="renrakuSaki" name="renrakuSaki" class="${form.renrakuSakiErr}"
													value="${f:h(form.renrakuSaki)}" style="width: 90%;" placeholder="例 090-0000-0000"  
													disabled="${form.renrakuSakiDisabled}" />
												<br>
												<span style="color:red;">
													<nfwui:LabelBox id="lblExplanationRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC002_EXPLANATION_RENRAKU_SAKI %>" />
												</span>
											</td>
										</tr> 
									</c:if>                           	                                                              
						   		</tbody>                     	
					   		</table>
						</div>
					</td>     
					<!-- ステータス -->
					<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.shainNo}" />
					<input type="hidden" name="hdnstatus" id="hdnstatus" value="${form.hdnstatus}" />					
					<input type="hidden" name="hdnSelectedNowShatakuName" id="hdnSelectedNowShatakuName" value="${form.hdnSelectedNowShatakuName}" />
					<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}"/>
					<input type="hidden" name="hdnShatakuRoomKanriNo" id="hdnShatakuRoomKanriNo" value="${form.hdnShatakuRoomKanriNo}"/>
					<input type="hidden" name="hdnNowShatakuKanriNo" id="hdnNowShatakuKanriNo" value="${form.hdnNowShatakuKanriNo}"/>
					<input type="hidden" name="hdnNowShatakuRoomKanriNo" id="hdnNowShatakuRoomKanriNo" value="${form.hdnNowShatakuRoomKanriNo}"/>
					<input type="hidden" name="hdnConfirmFlg" id="hdnConfirmFlg" value="${form.hdnConfirmFlg}" />
					<input type="hidden" name="hdnShatakuKikakuKbn" id="hdnShatakuKikakuKbn" value="${form.hdnShatakuKikakuKbn}"/>
					<input type="hidden" name="hdnParking1stNumber" id="hdnParking1stNumber" value="${form.hdnParking1stNumber}"/>
					<input type="hidden" name="hdnParking2ndNumber" id="hdnParking2ndNumber" value="${form.hdnParking2ndNumber}"/>
					<input type="hidden" name="hdnBihinHenkyakuUmu" id="hdnBihinHenkyakuUmu" value="${form.hdnBihinHenkyakuUmu}"/>
					<!-- 右側の入力ガイドの部分 -->
					<td style="width: 30%; border: none;background-color: #fdfdff;">
						<div class="imui-form-container-wide">
							<table >
								<div class="imui-chapter-title" style="margin-bottom: 10px;">
									<h2>操作ガイド</h2>
								</div>
								<div>
									${form.operationGuide}
								</div>
							</table>
						</div>
					</td>      
				</tr>
			</tbody>
		</table>
	</nfwui:Form>		
</div>


<!-- コンテンツエリア  text/JavaSclipt -->
<script type="text/javascript">
//項目表示設定
(function($) {	
	//初期表示活性非活性制御
	//非活性
	$('#nyukyoYoteiDate').imuiCalendar('disable');// 入居希望日カレンダー
	$('#carExpirationDate').imuiCalendar('disable');// 自動社の有効期間満了日 1台目カレンダー
	$('#parkingUseDate').imuiCalendar('disable');// 自動車の使用開始日 1台目カレンダー
	$('#carExpirationDate2').imuiCalendar('disable');// 自動社の有効期間満了日 2台目カレンダー
	$('#parkingUseDate2').imuiCalendar('disable');// 自動車の使用開始日 2台目カレンダー

	//非表示
	$('#lblShatakuFuyouMsg').hide();
	
		
	//社宅を必要としますか-必要とする（項目表示設定)
		$('#rdoHitsuyo').click(function() {	   
		// 社宅を必要としますか？の必要とするにチェックが入っている場合
			if($("#rdoHitsuyo").prop('checked')) {
				//活性
				//社宅を必要とする理由
				$('#rdoHitsuyoIdo').prop('disabled', false);
				$('#rdoHitsuyoKekkon').prop('disabled', false);
				$('#rdoHitsuyoSonota').prop('disabled', false);
				//必要とする社宅
				$('#rdoKikon').prop('disabled', false);
				$('#rdoHitsuyoDokushin').prop('disabled', false);
				//自動車の保管場所
				$('#rdoCarHitsuyo').prop('disabled', false);
				$('#rdoCarFuyo').prop('disabled', false);
				// 入居希望日カレンダー
				$('#nyukyoYoteiDate').imuiCalendar('enable');
				
				//非活性
				//社宅を必要としない理由
				$('#rdoFuyouJitakutsuukinn').prop('disabled', true);
				$('#rdoFuyouJikokariage').prop('disabled', true);
				$('#rdoFuyouSonota').prop('disabled', true);
				//チェック状態
				$('#rdoHitsuyoSonota').prop('checked', false);
				$('#rdoFuyouJitakutsuukinn').prop('checked', false);
				$('#rdoFuyouJikokariage').prop('checked', false);
				$('#rdoFuyouSonota').prop('checked', false);
				
	    		//表示（現社宅情報）
				$('#shatakuStatus').show();
				$('#taikyoRiyuInfo').show();
				$('#trTaikyogoRenrakuSaki').show();
				$('#returnEquipment').show();
				$('#returnWitnessRequestDate').show();
	  			$('#trRenrakuSaki').show();
	    		//非表示（社宅不要時のメッセージ）
	    		$('#lblShatakuFuyouMsg').hide();
			}
		});
	//社宅を必要としますか-必要としない（項目非表示設定)
		$('#rdoFuyou').click(function() {   
		 //社宅を必要としますか？の「必要としない」にチェックが入っている場合
			if($("#rdoFuyou").prop('checked')) {
				//活性
				//社宅を必要としない理由
				$('#rdoFuyouJitakutsuukinn').prop('disabled', false);
				$('#rdoFuyouJikokariage').prop('disabled', false);
				$('#rdoFuyouSonota').prop('disabled', false);
				//自動車の保管場所			
				$('#rdoCarFuyo').prop('disabled', false);
				//非活性
				//社宅を必要とする理由
				$('#rdoHitsuyoIdo').prop('disabled', true);
				$('#rdoHitsuyoKekkon').prop('disabled', true);
				$('#rdoHitsuyoSonota').prop('disabled', true);
				//新所属
				$("#agencyCd").prop('disabled', true);
				$("#affiliation1Cd").prop('disabled', true);
				$("#affiliation2Cd").prop('disabled', true);
				//必要とする社宅
				$('#rdoKikon').prop('disabled', true);
				$('#rdoHitsuyoSetai').prop('disabled', true);
				$('#rdoHitsuyoTanshin').prop('disabled', true);
				$('#rdoHitsuyoDokushin').prop('disabled', true);
				//自動車の保管場所
				$('#rdoCarHitsuyo').prop('disabled', true);
				// 入居希望日カレンダー 
				$('#nyukyoYoteiDate').imuiCalendar('disable');
				//チェック状態
				//社宅を必要としない理由
				$('#rdoHitsuyoIdo').prop('checked', false);
				$('#rdoHitsuyoKekkon').prop('checked', false);
				$('#rdoHitsuyoSonota').prop('checked', false);
				$('#rdoFuyouSonota').prop('checked', false);
				//必要とする社宅
				$('#rdoKikon').prop('checked', false);
				$('#rdoHitsuyoSetai').prop('checked', false);
				$('#rdoHitsuyoTanshin').prop('checked', false);
				$('#rdoHitsuyoDokushin').prop('checked', false);
	    		//表示（社宅不要時のメッセージ）
	    		$("#rdoCarFuyo").prop('checked',true)
	    		$('#lblShatakuFuyouMsg').show();
	    		//非表示（現社宅情報）
				$('#shatakuStatus').hide();
				$('#taikyoRiyuInfo').hide();
				$('#trTaikyogoRenrakuSaki').hide();
				$('#returnEquipment').hide();
				$('#returnWitnessRequestDate').hide();
				$('#trRenrakuSaki').hide();
			}
		});
		
	//社宅を必要としますか-駐車場のみ（項目非表示設定) 	
		$('#rdoParkingOnly').click(function() {
			// 社宅を必要としますか？の「駐車場のみ」にチェックが入っている場合
			if($("#rdoParkingOnly").prop('checked')) {		
				//非活性
				//社宅を必要とする理由、しない理由
				$('#rdoHitsuyoIdo').prop('disabled', true);
				$('#rdoHitsuyoKekkon').prop('disabled', true);
				$('#rdoHitsuyoSonota').prop('disabled', true);			
				$('#rdoFuyouJitakutsuukinn').prop('disabled', true);
				$('#rdoFuyouJikokariage').prop('disabled', true);
				$('#rdoFuyouSonota').prop('disabled', true);
				// 入居希望日カレンダー 
				$('#nyukyoYoteiDate').imuiCalendar('disable');
				//必要とする社宅
				$('#rdoKikon').prop('disabled', true);
				$('#rdoHitsuyoSetai').prop('disabled', true);
				$('#rdoHitsuyoTanshin').prop('disabled', true);
				$('#rdoHitsuyoDokushin').prop('disabled', true);
				//退居予定
				$("#rdoNowHoyuShatakuTaikyo").prop('disabled', true)
				//チェック状態
				$('#rdoHitsuyoSonota').prop('checked', true);// 社宅を必要とする理由　その他
				$('#rdoFuyouSonota').prop('checked', true);// 社宅を必要としない理由　その他	
				$('#rdoNowHoyuShatakuKeizoku').prop('checked', true);// 現在の社宅継続利用
				//必要とする社宅
				$('#rdoKikon').prop('checked', false);
				$('#rdoHitsuyoSetai').prop('checked', false);
				$('#rdoHitsuyoTanshin').prop('checked', false);
				$('#rdoHitsuyoDokushin').prop('checked', false);
				//表示  （現社宅情報）
				$('#shatakuStatus').show();
				$('#taikyoRiyuInfo').show();
				$('#trTaikyogoRenrakuSaki').show();
				$('#returnEquipment').show();
				$('#returnWitnessRequestDate').show();
				$('#trRenrakuSaki').show();
				//非表示（社宅不要時のメッセージ）
	    		$('#lblShatakuFuyouMsg').hide();
		     }
		 });
	
		//機関ドロップダウン
		$("#agencyCd").bind('change', function(){
			var map = new Object();
			map['agencyCd'] = $("#agencyCd").val();	
			var className  = $("#agencyCd").attr("class");
			nfw.common.doAjaxAction("skf/Skf2020Sc002/ChangeDropDownAsync",map,true,function(data) {
				$("#affiliation1Cd").imuiSelect('replace', data.ddlAffiliation1List);
				$("#affiliation2Cd").imuiSelect('replace', data.ddlAffiliation2List);
				$("#agencyCd").addClass(className);
			});
		});
	
		//部等ドロップダウン
		$("#affiliation1Cd").bind('change', function() {
			var map = new Object();
			map['agencyCd'] = $("#agencyCd").val();
			map['affiliation1Cd'] = $("#affiliation1Cd").val();
			var className  = $("#agencyCd").attr("class");
			nfw.common.doAjaxAction("skf/Skf2020Sc002/ChangeDropDownAsync",map,true,function(data) {
				$("#affiliation2Cd").imuiSelect('replace', data.ddlAffiliation2List);
				$("#agencyCd").addClass(className);
			});
			
			//その他が選択された場合、その他ボックスを活性化する
			var selAffiliation1Cd = $('#affiliation1Cd option:selected').val();
			if(selAffiliation1Cd　==　"99"){
				$('#newAffiliation1Other').prop('disabled', false);
			}else{
				$('#newAffiliation1Other').prop('disabled', true);
			}
		});
		
		//チーム又は課ドロップダウン
		$("#affiliation2Cd").bind('change', function() {	
			//その他が選択された場合、その他ボックスを活性化する
			var selAffiliation2Cd = $('#affiliation2Cd option:selected').val();
			if(selAffiliation2Cd　==　"99"){
				$('#newAffiliation2Other').prop('disabled', false);
			}else{
				$('#newAffiliation2Other').prop('disabled', true);
			}
						
		});
		
		//社宅プルダウン
		$("#nowShatakuName").bind('change', function() {
			var map = new Object();
			var hShainNo = $('#hdnShainNo').val();	
			map['shatakuKanriId'] = $('#nowShatakuName option:selected').val();	
			map['shainNo'] = hShainNo;	
			nfw.common.doAjaxAction("skf/Skf2020Sc002/ChangeDropDownAsync",map,true,function(data) {
				document.getElementById('nowShatakuNo').innerHTML = data.nowShatakuNo;
				document.getElementById('nowShatakuKikakuName').innerHTML = data.nowShatakuKikakuName;
				document.getElementById('nowShatakuMenseki').innerHTML = data.nowShatakuMenseki;
				document.getElementById('parking1stPlace').innerHTML = data.parking1stPlace;
				document.getElementById('parking2stPlace').innerHTML = data.parking2stPlace;
				document.getElementById('returnEquipments').innerHTML = data.returnEquipment;	
			});
		});
		
		//　退居理由
		$("#taikyoRiyuKbn").bind('change', function() {
			//その他が選択された場合、その他ボックスを活性化する
			var selTaikyoRiyuKbnCd = $('#taikyoRiyuKbn option:selected').val();
			if(selTaikyoRiyuKbnCd　==　"9"){
				$('#taikyoRiyu').prop('disabled', false);
			}else{
				$('#taikyoRiyu').prop('disabled', true);
			}			
		});	
		
		//必要とする社宅-共通
		$('#rdoKikon').click(function() {
			//必要とする社宅-既婚にチェックがある場合
			if($("#rdoKikon").prop('checked')) {		
				$('#rdoHitsuyoSetai').prop('disabled', false);
				$('#rdoHitsuyoTanshin').prop('disabled', false);
				
				$('#dokyoRelation1').prop('disabled', true);
				$('#dokyoName1').prop('disabled', true);
				$('#dokyoAge1').prop('disabled', true);
				$('#dokyoRelation2').prop('disabled', true);
				$('#dokyoName2').prop('disabled', true);
				$('#dokyoAge2').prop('disabled', true);
				$('#dokyoRelation3').prop('disabled', true);
				$('#dokyoName3').prop('disabled', true);
				$('#dokyoAge3').prop('disabled', true);
				$('#dokyoRelation4').prop('disabled', true);
				$('#dokyoName4').prop('disabled', true);
				$('#dokyoAge4').prop('disabled', true);
				$('#dokyoRelation5').prop('disabled', true);
				$('#dokyoName5').prop('disabled', true);
				$('#dokyoAge5').prop('disabled', true);
				$('#dokyoRelation6').prop('disabled', true);
				$('#dokyoName6').prop('disabled', true);
				$('#dokyoAge6').prop('disabled', true);
						
				$('#rdoHitsuyoSetai').prop('checked', false)
				$('#rdoHitsuyoTanshin').prop('checked', false)
				$('#rdoHitsuyoDokushin').prop('checked', false);
		     }
		 });
		
		$('#rdoHitsuyoSetai').click(function() {
			//必要とする社宅-世帯にチェックがある場合
			if($("#rdoHitsuyoSetai").prop('checked')) {
				$('#rdoKikon').prop('disabled', true);
				$('#rdoKikon').prop('checked', false);
		     }
		 });
		
		$('#rdoHitsuyoTanshin').click(function() {
			//必要とする社宅-単身にチェックがある場合
			if($("#rdoHitsuyoTanshin").prop('checked')) {
				$('#rdoKikon').prop('disabled', true);
				$('#rdoKikon').prop('checked', false);
		     }
		 });
		
		$('#rdoHitsuyoDokushin').click(function() {
			//必要とする社宅-独身にチェックがある場合
			if($("#rdoHitsuyoDokushin").prop('checked')) {		
				$('#rdoKikon').prop('checked', false);
				$('#rdoKikon').prop('disabled', false);
				$('#rdoHitsuyoSetai').prop('disabled', true);
				$('#rdoHitsuyoTanshin').prop('disabled', true);
		     }
		 });
		
		  // 自動車の保管場所の「必要とする」押下時に発動
		  $('#rdoCarHitsuyo').click(function() {	 	   
			// 自動車の保管場所の「必要とする」にチェックが入っている場合
			if($("#rdoCarHitsuyo").prop('checked')) {		
				// 活性
				$('#rdo1stCarHoyu').prop('disabled', false);
				$('#rdo1stCarYotei').prop('disabled', false);
				$('#rdo2stCarHoyu').prop('disabled', false);
				$('#rdo2stCarYotei').prop('disabled', false);
		    	$('#carExpirationDate').imuiCalendar('enable');// 自動社の有効期間満了日 2台目カレンダー
		    	$('#parkingUseDate').imuiCalendar('enable');// 自動車の利用開始日 1台目カレンダー
		    	$('#carExpirationDate2').imuiCalendar('enable');// 自動社の有効期間満了日 2台目カレンダー
		    	$('#parkingUseDate2').imuiCalendar('enable');// 自動車の利用開始日 1台目カレンダー
		      }
		  }); 
		  
		  // 自動車の保管場所の「必要としない」押下時に発動
		  $('#rdoCarFuyo').click(function() {	 	   
			// 自動車の保管場所の「必要としない」にチェックが入っている場合
			if($("#rdoCarFuyo").prop('checked')) {
		    	//非活性
				$('#rdo1stCarHoyu').prop('disabled', true);
				$('#rdo1stCarYotei').prop('disabled', true);
				$('#rdo2stCarHoyu').prop('disabled', true);
				$('#rdo2stCarYotei').prop('disabled', true);
				$('#carExpirationDate').imuiCalendar('disable');// 自動社の有効期間満了日 1台目カレンダー
				$('#parkingUseDate').imuiCalendar('disable');// 自動車の利用開始日 1台目カレンダー
				$('#carExpirationDate2').imuiCalendar('disable');// 自動社の有効期間満了日 2台目カレンダー
				$('#parkingUseDate2').imuiCalendar('disable');// 自動車の利用開始日 2台目カレンダー
		      }
		  }); 
		  
		  // 自動車の保有の「保有している1台目」押下時に発動
		  $('#rdo1stCarHoyu').click(function() { 	   
			// 自動車の保有の「保有している1台目」押下時にチェックが入っている場合
			if($("#rdo1stCarHoyu").prop('checked')) {		
				　　// 活性
		    	  $('#carExpirationDate').imuiCalendar('enable');// 自動社の有効期間満了日 1台目カレンダー
		    	  $('#parkingUseDate').imuiCalendar('enable');// 自動車の利用開始日 1台目カレンダー
		      }
		  });
	
		  // 自動車の保有の「購入を予定している1台目」押下時に発動
		  $('#rdo1stCarYotei').click(function() {  
			// 自動車の保有の「購入を予定している1台目」押下時にチェックが入っている場合
			if($("#rdo1stCarYotei").prop('checked')) {		
				　　// 活性
		    	  $('#parkingUseDate').imuiCalendar('enable');// 自動車の利用開始日 1台目カレンダー
		    	  //非活性
		    	  $('#carExpirationDate').imuiCalendar('disable');// 自動社の有効期間満了日 1台目カレンダー
		      }
		  }); 
		  
		  // 自動車の保有の「保有している2台目」押下時に発動
		  $('#rdo2stCarHoyu').click(function() {	   
			// 自動車の保有の「購入を予定している2台目」押下時にチェックが入っている場合
			if($("#rdo2stCarHoyu").prop('checked')) {		
				　　// 活性
		    	  $('#parkingUseDate2').imuiCalendar('enable');// 自動車の利用開始日 2台目カレンダー
		    	  $('#carExpirationDate2').imuiCalendar('enable');
		      }
		  }); 	
		  
		  // 自動車の保有の「購入を予定している2台目」押下時に発動
		  $('#rdo2stCarYotei').click(function() {	 	   
			// 自動車の保有の「購入を予定している2台目」押下時にチェックが入っている場合
			if($("#rdo2stCarYotei").prop('checked')) {		
				　　// 活性
		    	  $('#parkingUseDate2').imuiCalendar('enable');// 自動車の利用開始日 2台目カレンダー
		    	  //非活性
		    	  $('#carExpirationDate2').imuiCalendar('disable');// 自動社の有効期間満了日 2台目カレンダー
		      }
		  }); 	
		  	  
		  // 現保有の社宅の「退居する」押下時に発動
		  $('#rdoNowHoyuShatakuTaikyo').click(function() {	 	   
			// 退居する
			if($("#rdoNowHoyuShatakuTaikyo").prop('checked')) {		
				　　// 活性
		    	  $("#taikyoYoteiDate").imuiCalendar('enable');//退居予定日カレンダー
		    		//非表示
		    		$('#lblShatakuFuyouMsg').show();
		      }
		  }); 
	
		  //  現保有の社宅の「継続利用する」押下時に発動
		  $('#rdoNowHoyuShatakuKeizoku').click(function() {	 	   
			// 継続利用する
			if($("#rdoNowHoyuShatakuKeizoku").prop('checked')) {		
				　　// 活性
		    	  $('#taikyoYoteiDate').imuiCalendar('disable');//退居予定日カレンダー
		    		//表示
		    		$('#lblShatakuFuyouMsg').hide();
		      }
		  });
		})(jQuery);
	
	//ラジオボタン以外の活性制御
	//社宅を必要としますか？
	var taiyoHituyoDynam = {
			//社宅を必要としますか-必要とする
			"1" : {
				"enabled" : [ "nyukyoYoteiDate"]
			},
		//社宅を必要としますか-必要としない
			"0" : {
	  			"disabled" : ["nyukyoYoteiDate"]
			},
		//社宅を必要としますか-駐車場のみ
			"2" : {
				"disabled" : ["nyukyoYoteiDate"]
			}
	}

	
	//社宅を必要とする理由
	var hitsuyoRiyuDynam = {
			"1" : {
				//社宅を必要とする理由の「異動のため」にチェックが入っている場合
				"enabled" : [ "agencyCd", "affiliation1Cd","affiliation2Cd" ]
			},
			"2" : {
				// 社宅を必要とする理由の「結婚のため」押下時に発動
				"disabled" : [ "agencyCd","affiliation1Cd","affiliation2Cd"]
			},
			"9" : {
				// 社宅を必要とする理由の「その他」押下時に発動
				"disabled" : [ "agencyCd","affiliation1Cd","affiliation2Cd"]
			}
		}
	
	//必要とする社宅
	var hitsuyoShatakuDynam1 = {
			"1" : {
				// 必要とする社宅の「世帯」にチェックが入っている場合
				"enabled" : [ "dokyoRelation1","dokyoName1","dokyoAge1",
				              "dokyoRelation2","dokyoName2","dokyoAge2",
				              "dokyoRelation3","dokyoName3","dokyoAge3",
				              "dokyoRelation4","dokyoName4","dokyoAge4",
				              "dokyoRelation5","dokyoName5","dokyoAge5",
				              "dokyoRelation6","dokyoName6","dokyoAge6" ]
			},
			"2" : {
				// 必要とする社宅の「単身」にチェックが入っている場合
				"disabled" :  [	"dokyoRelation1","dokyoName1","dokyoAge1",
								"dokyoRelation2","dokyoName2","dokyoAge2",
								"dokyoRelation3","dokyoName3","dokyoAge3",
								"dokyoRelation4","dokyoName4","dokyoAge4",
								"dokyoRelation5","dokyoName5","dokyoAge5",
								"dokyoRelation6","dokyoName6","dokyoAge6" ]
			},				
			"3" : {
				// 必要とする社宅の「独身」にチェックが入っている場合
				"disabled" :  [ "dokyoRelation1","dokyoName1","dokyoAge1",
								"dokyoRelation2","dokyoName2","dokyoAge2",
								"dokyoRelation3","dokyoName3","dokyoAge3",
								"dokyoRelation4","dokyoName4","dokyoAge4",
								"dokyoRelation5","dokyoName5","dokyoAge5",
								"dokyoRelation6","dokyoName6","dokyoAge6" ]
			}
		}
		
	//自動車の保管場所
  	var parkingUmuDynam = {	
			"1" : {
				// 自動車の保管場所の「必要とする」にチェックが入っている場合
				"enabled" : ["carName", "carNo", "carExpirationDate","carUser", "parkingUseDate",
				             "carName2", "carNo2", "carExpirationDate2","carUser2", "parkingUseDate2"]
			},
			"0" : {
				// 自動車の保管場所の「必要としない」にチェックが入っている場合
				"disabled" : ["carName", "carNo", "carExpirationDate","carUser", "parkingUseDate",
				             "carName2", "carNo2", "carExpirationDate2","carUser2", "parkingUseDate2"]
			}
		}
	
	//1台目
	var carNoInputFlgDynam = {
			"0" : {
				// 自動車の保有　「保有している1台目」押下時に発動
				"enabled" : [ "carName", "carNo", "carExpirationDate","carUser", "parkingUseDate"]
			},
			"1" : {
				// 自動車の保有　「購入を予定している1台目」押下時に発動
				"enabled" : [ "carUser", "parkingUseDate"],
				"disabled" : ["carName", "carNo", "carExpirationDate"]
			}
		}
	
	//2台目
	var carNoInputFlg2Dynam = {
			"0" : {
				// 自動車の保有　「保有している2台目」押下時に発動
				"enabled" : [ "carName2", "carNo2", "carExpirationDate2","carUser2", "parkingUseDate2"]
			},
			"1" : {
				// 自動車の保有　「購入を予定している2台目」押下時に発動
				"enabled" : [ "carUser2", "parkingUseDate2"],
				"disabled" : ["carName2", "carNo2", "carExpirationDate2"]
			}
		}
	
	//現保有の社宅
	var nowShatakuDynam = {
			// 現保有の社宅　保有(会社借上を含む)にチェックがある場合
			"1" : {
					"enabled" : [ "rdoNowJutakuHoyu","nowShatakuName", "tokushuJijo", 
					              "rdoNowHoyuShatakuTaikyo","rdoNowHoyuShatakuKeizoku"]
			}
	}
	
	//現保有社宅
	var taikyoYoteiDynam = {
		"1" : {
				// 退居する
				"enabled" : [ "taikyoYoteiDate",
				              "shatakuJyotai", 
				              "taikyoRiyuKbn", 
				              "taikyogoRenrakuSaki"]
			},
		"2" : {
				// 継続利用する
					"disabled" : [ "taikyoYoteiDate",
					               "shatakuJyotai",
					               "taikyoRiyuKbn","taikyoRiyu",
					               "taikyogoRenrakuSaki"]
		}
}
</script>
<!-- フッターエリア CSS-->
<style type="text/css">
	div.btnLeft{
	    text-align: left;
	    float: left;
	}

	div.btnRight{
    	text-align: right;
	}
}
</style>
<!-- フッターエリア　ボタン -->
<div class="imui-box-layout">
	<table width="100%">
		<tr>
			<!-- 左エリア -->
			<div class="btnLeft">
 				<!-- 入力内容をクリア -->
				<nfwui:ConfirmButton cssStyle="width:150px;" id="clearButton" formId="form" value="入力内容をクリア" 
					cssClass="imui-medium-button" title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>" 
					message="<%= MessageIdConstant.I_SKF_2004 %>" 
					url="skf/Skf2020Sc002/Clear"/>	
 			</div>
			<!-- 右エリア -->
 			<div class="btnRight">
 				<!-- 申請要件を確認 -->
				<nfwui:Button cssStyle="width:150px;" id="download" name="download" value="申請要件を確認" 
					formID="form" cssClass="imui-medium-button" url="skf/Skf2020Sc002/Download" />   	 
				<!-- 一時保存 -->
				<nfwui:Button cssStyle="width:150px;" id="saveButton" formId="form" value="一時保存"
					cssClass="imui-medium-button" disabled="${form.btnSaveDisabeld}"
					url="skf/Skf2020Sc002/Save"/>
 			</div>
 		</tr>
 		<tr>
 			<!-- 左エリア -->
 			<div class="btnLeft">
				<!-- 前の画面へ -->
 				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" />
				<!-- コメントボタン -->
				<c:if test="${form.commentViewFlag == 'true'}">
				<nfwui:PopupButton id="commentPop" value="コメント表示" 
				cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
				modalMode="false" popupWidth="1350" popupHeight="550"
				parameter="applNo:applNo"
				screenUrl="skf/Skf2010Sc010/init" use="popup" />
				</c:if>
 			</div>
 			<!-- 右エリア -->
 			<div id="dCheck1" class="btnRight">
 				<!-- 申請内容を確認 -->
 				  <imui:button id="check1" value="申請内容を確認" class="imui-medium-button" style="width: 150px" onclick="checkConfrirm('no')" /> 
 			</div>
 			<div id="dCheck2" class="btnRight">
 				 <!-- 申請内容を確認 -->
 				  <imui:button id="check1" value="申請内容を確認（備品あり）" class="imui-medium-button" style="width: 150px" onclick="checkConfrirm('yes')" />
 			</div>
 		</tr>	
 	</table>
</div>
<!-- フッターエリア  text/JavaSclipt -->
<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
    
	//申請要件確認（ダイアログ表示あり）を非表示にする
	document.getElementById('dCheck2').style.display="none";

	/**
	 * ひとつ前の画面に戻る
	 */
    function back1() {
    	var url = "skf/Skf2010Sc007/init?SKF2010_SC007&tokenCheck=0";
    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。編集内容を保存する場合は「一時保存」をクリックして下さい。");
    }  
	
	/**
	 * 社宅を必要とするか？取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */   
    function getRdoTaiyoHituyo(){
    	var result;
    	if($("#rdoHitsuyo").prop('checked')){
			  result = $("#rdoHitsuyo").val();
		  }else if($("#rdoFuyou").prop('checked')){
			  result = $("#rdoFuyou").val();
		  }else if($("#rdoParkingOnly").prop('checked')){
			  result = $("#rdoParkingOnly").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
    /**
	 * 必要とする理由取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getRdoHitsuyoRiyu(){
    	var result;
    	if($("#rdoHitsuyoIdo").prop('checked')){
			  result = $("#rdoHitsuyoIdo").val();
		  }else if($("#rdoHitsuyoKekkon").prop('checked')){
			  result = $("#rdoHitsuyoKekkon").val();
		  }else if($("#rdoHitsuyoSonota").prop('checked')){
			  result = $("#rdoHitsuyoSonota").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 必要としない理由取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getFuhitsuyoRiyu(){
    	var result;
    	if($("#rdoFuyouJitakutsuukinn").prop('checked')){
			  result = $("#rdoFuyouJitakutsuukinn").val();
		  }else if($("#rdoFuyouJikokariage").prop('checked')){
			  result = $("#rdoFuyouJikokariage").val();
		  }else if($("#rdoFuyouSonota").prop('checked')){
			  result = $("#rdoFuyouSonota").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 必要とする社宅
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getHitsuyoShataku(){
    	var result;
    	if($("#rdoHitsuyoSetai").prop('checked')){
			  result = $("#rdoHitsuyoSetai").val();
		  }else if($("#rdoHitsuyoTanshin").prop('checked')){
			  result = $("#rdoHitsuyoTanshin").val();
		  }else if($("#rdoHitsuyoDokushin").prop('checked')){
			  result = $("#rdoHitsuyoDokushin").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 自動車の保管場所取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getParkingUmu(){
    	var result;
    	if($("#rdoCarHitsuyo").prop('checked')){
			  result = $("#rdoCarHitsuyo").val();
		  }else if($("#rdoCarFuyo").prop('checked')){
			  result = $("#rdoCarFuyo").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 自動車の保有(1台目)取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getCarNoInputFlg(){
    	var result;
    	if($("#rdo1stCarHoyu").prop('checked')){
			  result = $("#rdo1stCarHoyu").val();
		  }else if($("#rdo1stCarYotei").prop('checked')){
			  result = $("#rdo1stCarYotei").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 自動車の保有(2台目)取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getCarNoInputFlg2(){
    	var result;
    	if($("#rdo2stCarHoyu").prop('checked')){
			  result = $("#rdo2stCarHoyu").val();
		  }else if($("#rdo2stCarYotei").prop('checked')){
			  result = $("#rdo2stCarYotei").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 現居住宅取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getNowShataku(){
    	var result;
    	if($("#rdoNowJutakuHoyu").prop('checked')){
			  result = $("#rdoNowJutakuHoyu").val();
		  }else if($("#rdoNowJutakuJitaku").prop('checked')){
			  result = $("#rdoNowJutakuJitaku").val();
		  }else if($("#rdoNowJutakuKariage").prop('checked')){
			  result = $("#rdoNowJutakuKariage").val();
		  }else if($("#rdoNowJutakuSonota").prop('checked')){
			  result = $("#rdoNowJutakuSonota").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
    
	/**
	 * 退居予定取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * return 選択された値
	 */ 
    function getTaikyoYotei(){
    	var result;
    	if($("#rdoNowHoyuShatakuTaikyo").prop('checked')){
			  result = $("#rdoNowHoyuShatakuTaikyo").val();
		  }else if($("#rdoNowHoyuShatakuKeizoku").prop('checked')){
			  result = $("#rdoNowHoyuShatakuKeizoku").val();
		  }else{
			  result = "";
		  }
    	return result;
    }
               
	/**
	 * 退居予定取得
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 * @param {string} dialogue 退居予定日と返却希望立会日の確認ダイアログ表示判定　yes:あり　no:なし
	 */ 
    function checkConfrirm(dialogue) {
    	//入力チェック判定用の値設定を行う    	
		var map = new Object();
 	
    	map['tel'] = $("#tel").val(); //TEL
      	
		map['taiyoHituyo'] = getRdoTaiyoHituyo();　//社宅を必要としますか？
    	map['hitsuyoRiyu'] = getRdoHitsuyoRiyu(); //社宅を必要とする理由
		map['fuhitsuyoRiyu'] = getFuhitsuyoRiyu(); //社宅を必要としない理由
				
		map['agencyCd'] = $("#agencyCd").val(); //新所属 機関
		map['affiliation1Cd'] = $("#affiliation1Cd").val();	//新所属 部等
    	map['newAffiliation1Other'] = $("#newAffiliation1Other").val(); //新所属 部等 その他
		map['affiliation2Cd'] = $("#affiliation2Cd").val();	//新所属 室チームまたは課
    	map['newAffiliation2Other'] = $("#newAffiliation2Other").val(); //新所属 室チームまたは課 その他
    	
		map['hitsuyoShataku'] = getHitsuyoShataku(); //必要社宅
    	map['dokyoRelation1'] = $("#dokyoRelation1").val();
		map['dokyoName1'] = $("#dokyoName1").val();	
    	map['dokyoAge1'] = $("#dokyoAge1").val();
    	map['dokyoRelation2'] = $("#dokyoRelation2").val();
		map['dokyoName2'] = $("#dokyoName2").val();	
    	map['dokyoAge2'] = $("#dokyoAge2").val();
    	map['dokyoRelation3'] = $("#dokyoRelation3").val();
		map['dokyoName3'] = $("#dokyoName3").val();	
    	map['dokyoAge3'] = $("#dokyoAge3").val();
    	map['dokyoRelation4'] = $("#dokyoRelation4").val();
		map['dokyoName4'] = $("#dokyoName4").val();	
    	map['dokyoAge4'] = $("#dokyoAge4").val();
    	map['dokyoRelation5'] = $("#dokyoRelation5").val();
		map['dokyoName5'] = $("#dokyoName5").val();	
    	map['dokyoAge5'] = $("#dokyoAge5").val();
    	map['dokyoRelation6'] = $("#dokyoRelation6").val();
		map['dokyoName6'] = $("#dokyoName6").val();	
    	map['dokyoAge6'] = $("#dokyoAge6").val();  	
    	
    	map['nyukyoYoteiDate'] = $("#nyukyoYoteiDate").val();
    	
		map['parkingUmu'] = getParkingUmu();	
    	map['carNoInputFlg'] = getCarNoInputFlg();
		map['carName'] = $("#carName").val();	
    	map['carNo'] = $("#carNo").val();
		map['carExpirationDate'] = $("#carExpirationDate").val();	
    	map['carUser'] = $("#carUser").val();
		map['parkingUseDate'] = $("#parkingUseDate").val();
    	
    	map['carNoInputFlg2'] = getCarNoInputFlg2();
		map['carName2'] = $("#carName2").val();	
    	map['carNo2'] = $("#carNo2").val();
		map['carExpirationDate2'] = $("#carExpirationDate2").val();	
    	map['carUser2'] = $("#carUser2").val();
		map['parkingUseDate2'] = $("#parkingUseDate2").val();	
		
		map['nowShataku'] = getNowShataku();
		map['shatakuKanriId'] = $('#nowShatakuName option:selected').val();	
		
		map['taikyoYotei'] = getTaikyoYotei();
    	map['taikyoYoteiDate'] = $("#taikyoYoteiDate").val();
		map['shatakuJyotai'] = $("#shatakuJyotai").val();	
    	map['taikyoRiyuKbn'] = $("#taikyoRiyuKbn option:selected").val();
		map['taikyoRiyu'] = $("#taikyoRiyu").val();
    	map['taikyogoRenrakuSaki'] = $("#taikyogoRenrakuSaki").val();
    	
    	map['hdnBihinHenkyakuUmu'] = $("#hdnBihinHenkyakuUmu").val();
    	
		map['sessionDay'] = $("#sessionDay").val();	
    	map['sessionTime'] = $("#sessionTime option:selected").val();
		map['renrakuSaki'] = $("#renrakuSaki").val();

		//入力チェック非同期処理呼び出し
		nfw.common.doAjaxAction("skf/Skf2020Sc002/checkAsync",map,true,function(data) {
		
				//エラーが無い場合
		    	var form = "form"; //受け渡すformId
		    	var url = "skf/Skf2020Sc002/Confirm"; //遷移先サービス
		  		
				if(dialogue=="yes"){
		    	//退居予定日と返却希望立会日の確認ダイアログが必要な場合
					//ダイアログ
					skf.common.confirmPopup("返却立会希望日が退居予定日以降で入力されています。申請してもよろしいですか？", "申請書類を作成する確認", form ,url, "OK", "CANCEL",this);			
				}else if(dialogue=="no"){
					//退居予定日と返却希望立会日の確認ダイアログが不要な場合
					nfw.common.submitForm(form,url,"check1");
				}						
		});
    }

	/**
	 * 退居予定日と返却希望立会日の相関確認
	 * <p>
	 * 退居予定日と返却希望立会日のテキストボックスが変更された場合に実行
	 * </p>
	 * 
	 */ 
	(function($){
		$("#taikyoYoteiDate","sessionDay").on('change', function() {
		//値からスラッシュを除いて日付に
		function toDate (str, delim) {
			  var arr = str.split(delim)
			  return new Date(arr[0], arr[1] - 1, arr[2]);
		};			
		var sTaikyoYoteiDate = $("#taikyoYoteiDate").val(); //退居予定日
		var sSessionDay = $("#sessionDay").val(); //返却希望立会日
		if(sTaikyoYoteiDate != "" && sSessionDay != ""){
		//退居予定日と返却希望立会日が空白じゃない場合		
			var dTaikyoYoteiDate = toDate(sTaikyoYoteiDate, '/');	//退居予定日
			var dSessionDay = toDate(sSessionDay, '/');				//返却希望立会日
			
			if(dSessionDay.getTime() > dTaikyoYoteiDate.getTime()){
				//申請内容確認ボタン（ダイアログあり）を表示
				document.getElementById("dCheck1").style.display="none";
				document.getElementById("dCheck2").style.display="block";
			}else{
				//申請内容確認ボタン（ダイアログなし）を表示
				document.getElementById("dCheck1").style.display="block";
				document.getElementById("dCheck2").style.display="none";
			}
		}else{
			//申請内容確認ボタン（ダイアログなし）を表示
			document.getElementById("dCheck1").style.display="block";
			document.getElementById("dCheck2").style.display="none";
		}		
	});
	
//カレンダーアイコン閉じたとき時
window.onClose = function(){
		function toDate (str, delim) {
			  var arr = str.split(delim)
			  return new Date(arr[0], arr[1] - 1, arr[2]);
		};	
		var sTaikyoYoteiDate = $("#taikyoYoteiDate").val();
		var sSessionDay = $("#sessionDay").val();	
		if(sTaikyoYoteiDate != "" && sSessionDay != ""){
			//退居予定日
			var dTaikyoYoteiDate = toDate(sTaikyoYoteiDate, '/');
			//備品返却
			var dSessionDay = toDate(sSessionDay, '/');				
			if(dSessionDay.getTime() > dTaikyoYoteiDate.getTime()){
				document.getElementById("dCheck1").style.display="none";
				document.getElementById("dCheck2").style.display="block";
			}else{
				document.getElementById("dCheck1").style.display="block";
				document.getElementById("dCheck2").style.display="none";
			}
		}else{
			document.getElementById("dCheck1").style.display="block";
			document.getElementById("dCheck2").style.display="none";		
		}	
	};
})(jQuery);
</script>