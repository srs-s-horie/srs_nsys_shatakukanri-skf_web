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
<% // 代行ログイン時CSS読み込み箇所ここから  %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<% // 代行ログイン時CSS読み込み箇所ここまで %>

<!DOCTYPE html>
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
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
<!-- 代行ログイン時のみ表示-->
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
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
									<nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2020_SC002_SHINSEI_TITLE %>" titleLevel="2" />
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
												<imui:textbox id="tel" name="tel" value="${f:h(form.tel)}" style="width: 50%; ime-mode:disabled;" 
												 	placeholder="例　84-3549（半角）" tabindex="1"/>
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
												<nfwui:RadioButtonGroup id="taiyoHituyo" dynamicMaskList="taiyoHituyoDynam" tabindex="2">
													<nfwui:RadioButton name="taiyoHituyo" id="rdoHitsuyo" label="必要とする" tabindex="2"
														value="<%= CodeConstant.ASKED_SHATAKU_HITSUYO %>" checked="${form.rdoHitsuyoChecked}"/>
													<nfwui:RadioButton name="taiyoHituyo" id="rdoFuyou" label="必要としない" tabindex="2"
														value="<%=CodeConstant.ASKED_SHATAKU_FUYOU %>" checked="${form.rdoFuyouChecked}"/>	
													<nfwui:RadioButton name="taiyoHituyo" id="rdoParkingOnly" label="駐車場のみ" tabindex="2"
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
											<td colspan="3">
												<nfwui:RadioButtonGroup id="hitsuyoRiyu" dynamicMaskList="hitsuyoRiyuDynam" tabindex="3">
													<nfwui:RadioButton name="hitsuyoRiyu" id="rdoHitsuyoIdo" label="異動のため" tabindex="3" 
														value="<%= CodeConstant.IDOU %>" disabled="${form.rdoHitsuyoIdoDisabled}" checked="${form.rdoHitsuyoIdoChecked}"/>
													<nfwui:RadioButton name="hitsuyoRiyu" id="rdoHitsuyoKekkon" label="結婚のため" tabindex="3" 
														value="<%= CodeConstant.KEKKON %>" disabled="${form.rdoHitsuyoKekkonDisabled}" checked="${form.rdoHitsuyoKekkonChecked}"/>
													<nfwui:RadioButton name="hitsuyoRiyu" id="rdoHitsuyoSonota" label="その他" tabindex="3" 
														value="<%= CodeConstant.HITUYO_RIYU_OTHERS %>" disabled="${form.rdoHitsuyoSonotaDisabled}" checked="${form.rdoHitsuyoSonotaChecked}"/>
												</nfwui:RadioButtonGroup>
											</td>
										</tr>
										<!-- 社宅を必要としない理由 -->
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadFuyouRiyu" code="<%= MessageIdConstant.SKF2020_SC002_FUYO_RIYU %>" />
											</th>
											<td colspan="3">
												<nfwui:RadioButtonGroup id="fuhitsuyoRiyu" tabindex="4">
													<nfwui:RadioButton name="fuhitsuyoRiyu" id="rdoFuyouJitakutsuukinn" label="自宅通勤" tabindex="4" 
														value="<%= CodeConstant.JITAKU_TSUKIN %>" disabled="${form.rdoFuyouJitakuTsuukinnDisabled}" checked="${form.rdoFuyouJitakutsuukinnChecked}"/>
													<nfwui:RadioButton name="fuhitsuyoRiyu" id="rdoFuyouJikokariage" label="自己借上" tabindex="4" 
														value="<%= CodeConstant.JIKO_KARIAGE %>" disabled="${form.rdoFuyouJikoKariageDisabled}" checked="${form.rdoFuyouJikokariageChecked}"/>
													<nfwui:RadioButton name="fuhitsuyoRiyu" id="rdoFuyouSonota" tabindex="4" 
														label="その他" value="<%= CodeConstant.FUYO_RIYU_OTHERS %>" disabled="${form.rdoFuyouSonotaDisabled}" checked="${form.rdoFuyouSonotaChecked}"/>
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
											<td colspan="3">
												<imui:select id="agencyCd" name="agencyCd" list="${form.ddlAgencyList}"  disabled="true" width="50%" tabindex="5"/>
											</td>
											<!-- 部等-->                              	
											<tr>
											  	<th colspan="2">
											   		<nfwui:LabelBox id="lblHeadNewAffiliation1" dynamicMaskList="otherEnabled" code="<%= MessageIdConstant.SKF2020_SC002_NEW_AFFLIATION1 %>" />
												</th>
												<td colspan="3">
													<imui:select id="affiliation1Cd" name="affiliation1Cd" list="${form.ddlAffiliation1List}" disabled="true" width="50%" tabindex="6"/>
													<div>
														<imui:textbox id="newAffiliation1Other" name="newAffiliation1Other" value="${f:h(form.newAffiliation1Other)}" 
														style="width: 50%;" placeholder="例 〇〇部"  disabled="${form.newAffiliation1OtherDisabled}"  tabindex="7"/>
													</div>
												</td>
											</tr>
											<!-- 室、チーム又は課--> 
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHeadNewAffiliation2" code="<%= MessageIdConstant.SKF2020_SC002_NEW_AFFLIATION2 %>" />
												</th>
											 	<td colspan="3">
													<imui:select id="affiliation2Cd" name="affiliation2Cd" list="${form.ddlAffiliation2List}" width="50%" disabled="true" tabindex="8"/>
													<div>
														<imui:textbox id="newAffiliation2Other" name="newAffiliation2Other" value="${f:h(form.newAffiliation2Other)}" 
															style="width: 50%;"  placeholder="例 〇〇事業所" disabled="${form.newAffiliation2OtherDisabled}" tabindex="9"/>
													</div>
												</td>
											</tr>
											<!-- 必要とする社宅 -->
											<tr>
												<th colspan="3">
													<nfwui:LabelBox id="lblHeadHitsuyoShataku" code="<%= MessageIdConstant.SKF2020_SC002_HITSUYO_SHATAKU %>" />
												</th>
												<td id="hitsuyoShataku" colspan="3" >
													<nfwui:RadioButton name="rdoKikon" id="rdoKikon" label="既婚" disabled="${form.rdoKikonDisabled}"
														value="<%= CodeConstant.KIKON %>" checked="${form.rdoKikonChecked}" tabindex="10" />
														<nfwui:RadioButtonGroup id="hitsuyoShataku" dynamicMaskList="hitsuyoShatakuDynam1" tabindex="11"> 
															（
																<nfwui:RadioButton name="hitsuyoShataku" id="rdoHitsuyoSetai" label="世帯" 
																	value="<%= CodeConstant.SETAI %>" disabled="${form.rdoHitsuyoSetaiDisabled}" checked="${form.rdoHitsuyoSetaiChecked}" tabindex="11"/>
																<nfwui:RadioButton name="hitsuyoShataku" id="rdoHitsuyoTanshin" label="単身" 
																	value="<%= CodeConstant.TANSHIN %>" disabled="${form.rdoHitsuyoTanshinDisabled}" checked="${form.rdoHitsuyoTanshinChecked}" tabindex="11"/>
															）
																<br>
																<nfwui:RadioButton name="hitsuyoShataku" id="rdoHitsuyoDokushin" label="独身" 
																	value="<%= CodeConstant.DOKUSHIN %>" disabled="${form.rdoHitsuyoDokushinDisabled}" checked="${form.rdoHitsuyoDokushinChecked}" tabindex="19"/>
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
																	<imui:textbox id="dokyoRelation1" name="dokyoRelation1" value="${f:h(form.dokyoRelation1)}" style="width: 95%;" 
																		placeholder="例 祖父" disabled="true" tabindex="12"/> 
																</td>
																<td style="text-align:center;" >
																	<imui:textbox id="dokyoName1" name="dokyoName1" value="${f:h(form.dokyoName1)}" 
																		 style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" tabindex="13"/>
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoAge1" name="dokyoAge1" value="${f:h(form.dokyoAge1)}" 
																		style="width: 90%; ime-mode:disabled;" placeholder="例 半角数字" disabled="true" tabindex="14"/>
																</td>
															</tr>
															<tr>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoRelation2" name="dokyoRelation2" value="${f:h(form.dokyoRelation2)}" 
																	 style="width: 95%;" placeholder="例 祖父" disabled="true" tabindex="15" />
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoName2" name="dokyoName2" value="${f:h(form.dokyoName2)}" 
																	 style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" tabindex="16" />	    
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoAge2" name="dokyoAge2" value="${f:h(form.dokyoAge2)}" 
																		style="width: 90%; ime-mode:disabled;" placeholder="例 半角数字" disabled="true" tabindex="17"/>
															    </td>
															</tr>
															<tr>
														    	<td  style="text-align:center;">
																	<imui:textbox id="dokyoRelation3" name="dokyoRelation3" value="${f:h(form.dokyoRelation3)}"
																		 style="width: 95%;" placeholder="例 祖父" disabled="true" tabindex="18" />		    
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoName3" name="dokyoName3" value="${f:h(form.dokyoName3)}" 
																		 style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" tabindex="19" />		    
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoAge3" name="dokyoAge3" value="${f:h(form.dokyoAge3)}" 
																	 style="width: 90%; ime-mode:disabled;" placeholder="例 半角数字" disabled="true" tabindex="20"/>
														    	</td>
															</tr>
															<tr>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoRelation4" name="dokyoRelation4" value="${f:h(form.dokyoRelation4)}" 
																	 style="width: 95%;" placeholder="例 祖父" disabled="true" tabindex="21" />   
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoName4" name="dokyoName4" value="${f:h(form.dokyoName4)}" 
																		 style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" tabindex="22" />    
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoAge4" name="dokyoAge4" value="${f:h(form.dokyoAge4)}" 
																		 style="width: 90%; ime-mode:disabled;" placeholder="例 半角数字" disabled="true" tabindex="23" />
																</td>
															</tr>
															<tr>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoRelation5" name="dokyoRelation5" 
																	 value="${f:h(form.dokyoRelation5)}" style="width: 95%;" placeholder="例 祖父" disabled="true" tabindex="24" />
																</td>					  
																<td style="text-align:center;">
																	<imui:textbox id="dokyoName5" name="dokyoName5" value="${f:h(form.dokyoName5)}"
																		 style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" tabindex="25" />					    
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoAge5" name="dokyoAge5" 
																	 value="${f:h(form.dokyoAge5)}" style="width: 90%; ime-mode:disabled;" placeholder="例 半角数字" disabled="true" tabindex="26"/>
																</td>
															</tr>
															<tr>
																<td  style="text-align:center;">
																	<imui:textbox id="dokyoRelation6" name="dokyoRelation6" 
																	value="${f:h(form.dokyoRelation6)}" style="width: 95%;" placeholder="例 祖父" disabled="true" tabindex="27"/>                                                      
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoName6" name="dokyoName6" 
																	value="${f:h(form.dokyoName6)}" style="width: 95%;" placeholder="例 中日本 一郎" disabled="true" tabindex="28" /> 
																</td>
																<td style="text-align:center;">
																	<imui:textbox id="dokyoAge6" name="dokyoAge6" 
																	value="${f:h(form.dokyoAge6)}" style="width: 90%; ime-mode:disabled;" placeholder="例 半角数字" disabled="true" tabindex="29"/>
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
													<nfwui:DateBox id="nyukyoYoteiDate" name="nyukyoYoteiDate" value="${f:h(form.nyukyoYoteiDate)}" tabindex="30" disabled="true" cssStyle="width:100px"/> 	                                  	
												</td>
											</tr>
											<!--  自動車の保管場所 -->  
											<tr>
												<th colspan="3">
													<nfwui:LabelBox id="lblHeadCarPark" code="<%= MessageIdConstant.SKF2020_SC002_CAR_PARK %>" />
												</th>
												<td colspan="3"  >
													<nfwui:RadioButtonGroup id="parkingUmu" dynamicMaskList="parkingUmuDynam" tabindex="31">
														<nfwui:RadioButton name="parkingUmu" id="rdoCarHitsuyo" label="必要とする" 
															value="<%= CodeConstant.CAR_PARK_HITUYO %>" disabled="${form.rdoCarHitsuyoDisabled}" checked="${form.rdoCarHitsuyoChecked}" tabindex="31"/>
														<nfwui:RadioButton name="parkingUmu" id="rdoCarFuyo" label="必要としない" 
															value="<%= CodeConstant.CAR_PARK_FUYO %>" disabled="${form.rdoCarFuyoDisabled}"  checked="${form.rdoCarFuyoChecked}" tabindex="31"/>
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
												<td colspan="3" >
													<nfwui:RadioButtonGroup id="carNoInputFlg" dynamicMaskList="carNoInputFlgDynam" tabindex="32">
														<nfwui:RadioButton name="carNoInputFlg" id="rdo1stCarHoyu" label="保有している" value="<%= CodeConstant.CAR_HOYU %>" 
															disabled="${form.rdo1stCarHoyuDisabled}" checked="${form.rdo1stCarHoyuChecked}" tabindex="32"/>
														<nfwui:RadioButton name="carNoInputFlg" id="rdo1stCarYotei" label="購入を予定している" value="<%= CodeConstant.CAR_YOTEI %>" 
															disabled="${form.rdo1stCarYoteiDisabled}" checked="${form.rdo1stCarYoteiChecked}" tabindex="32"/>
													</nfwui:RadioButtonGroup>
												</td>
											</tr>	
											<!-- 自動車の車名 --> 								
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead1stCarName" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_NAME %>" />	
												</th>
												<td colspan="3">
													<imui:textbox id="carName" name="carName"  value="${f:h(form.carName)}"
													 style="width:200px;" placeholder="例 プリウス" disabled="true" tabindex="33"/>
												</td>
											</tr>
											<!-- 自動車の登録番号 -->
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead1stCarNo" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_NO %>" />
												</th>
												<td colspan="3">
													<imui:textbox id="carNo" name="carNo"  value="${f:h(form.carNo)}"
													 style="width:200px;" placeholder="例 名古屋 300 あ 1235" disabled="true" tabindex="34"/>
												</td>
											</tr>
											<!-- 車検の有効期間満了日 -->																	
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead1stCarExpirationDate" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_EXCEPTION_DATA %>" />
												</th>
												<td colspan="3">
													<nfwui:DateBox id="carExpirationDate" name="carExpirationDate" value="${f:h(form.carExpirationDate)}"
														 tabindex="35" disabled="true" cssStyle="width:100px"/>                                   
												</td>
											</tr>
											<!-- 自動車の使用者 -->
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead1stCarUser" code="<%= MessageIdConstant.SKF2020_SC002_1ST_CAR_USE %>" />
												</th>
												<td colspan="3">
													<imui:textbox id="carUser" name="carUser"  value="${f:h(form.carUser)}"
													 style="width:200px;" placeholder="例 中日本 太郎" disabled="true" tabindex="36"/>
												</td>
											</tr>
											<!-- 自動車の保管場所使用開始日（予定日） -->
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead1stParkingUseDate" code="<%= MessageIdConstant.SKF2020_SC002_1ST_PARKING_USE_DATE %>" />
												</th>
												<td colspan="3">
													<nfwui:DateBox id="parkingUseDate" name="parkingUseDate" value="${f:h(form.parkingUseDate)}"
														 tabindex="37" disabled="true" cssStyle="width:100px"/>
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
												<td colspan="1" >
													<nfwui:RadioButtonGroup id="carNoInputFlg2" dynamicMaskList="carNoInputFlg2Dynam" tabindex="38">
														<nfwui:RadioButton name="carNoInputFlg2" id="rdo2stCarHoyu" label="保有している" value="<%= CodeConstant.CAR_HOYU %>"
															disabled="${form.rdo2stCarHoyuDisabled}" checked="${form.rdo2stCarHoyuChecked}" tabindex="38"/>
														<nfwui:RadioButton name="carNoInputFlg2" id="rdo2stCarYotei" label="購入を予定している" value="<%= CodeConstant.CAR_YOTEI %>"
															disabled="${form.rdo2stCarHoyuDisabled}" checked="${form.rdo2stCarYoteiChecked}" tabindex="38"/>
													</nfwui:RadioButtonGroup>
												</td>
												<td rowspan="6" colspan="2" style="color:red;">
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
												<td colspan="1">
													<imui:textbox id="carName2" name="carName2" 
														value="${f:h(form.carName2)}" style="width:200px;" placeholder="例 プリウス" disabled="true" tabindex="39"/>
												</td>
											</tr>
											<!-- 自動車の登録番号 --> 
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead2ndCarNo" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_NO %>" />
												</th>
												<td colspan="1">
												<imui:textbox id="carNo2" name="carNo2" 
													value="${f:h(form.carNo2)}" style="width:200px;" placeholder="例 名古屋 300 あ 1235" disabled="true" tabindex="40"/>
												</td>
											</tr>
											<!-- 車検の有効期間満了日 -->																	
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead2ndCarExpirationDate" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_EXCEPTION_DATA %>" />
												</th>
												<td colspan="1">
													<nfwui:DateBox id="carExpirationDate2" name="carExpirationDate2" value="${f:h(form.carExpirationDate2)}"
														 tabindex="41" disabled="true" cssStyle="width:100px"/>
												</td>
											</tr>
											<!-- 自動車の使用者 -->	
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead2ndCarUser" code="<%= MessageIdConstant.SKF2020_SC002_2ST_CAR_USE %>" />
												</th>
												<td colspan="1">
													<imui:textbox id="carUser2" name="carUser2"  value="${f:h(form.carUser2)}" 
														style="width:200px;" placeholder="例 中日本 太郎" disabled="true" tabindex="42"/>
												</td>
											</tr>
											<!-- 自動車の保管場所使用開始日（予定日） -->
											<tr>
												<th colspan="2">
													<nfwui:LabelBox id="lblHead2ndParkingUseDate" code="<%= MessageIdConstant.SKF2020_SC002_2ST_PARKING_USE_DATE %>" />
												</th>
												<td colspan="1">
													<nfwui:DateBox id="parkingUseDate2" name="parkingUseDate2" value="${f:h(form.parkingUseDate2)}"
														 tabindex="43" disabled="true" cssStyle="width:100px"/>
												</td>
											</tr> 
											<!-- 現居住宅 --> 
											<tr>
												<th rowspan="5">
													<nfwui:LabelBox id="lblHeadNowShatakuName" code="<%= MessageIdConstant.SKF2020_SC002_NOW_JYUTAKU %>" />
												</th>
												<th colspan="2"><label></label></th>
												<td colspan="3">
													<nfwui:RadioButtonGroup id="nowShataku" dynamicMaskList="nowShatakuDynam" tabindex="44">
														<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuHoyu" label="保有(会社借上を含む)" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_HOYU %>" disabled="${form.rdoNowJutakuHoyuDisabled}" checked="${form.rdoNowJutakuHoyuChecked}" tabindex="44" />
														<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuJitaku" label="自宅" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JITAKU %>" disabled="${form.rdoNowJutakuJitakuDisabeld}" checked="${form.rdoNowJutakuJitakuChecked}" tabindex="44" />
														<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuKariage" label="自己借上" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JIKO_KARIAGE %>" disabled="${form.rdoNowJutakuKariageDisabled}" checked="${form.rdoNowJutakuKariageChecked}" tabindex="44" />
														<nfwui:RadioButton name="nowShataku" id="rdoNowJutakuSonota" label="その他" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_OTHERS %>" disabled="${form.rdoNowJutakuSonotaDisabled}"  checked="${form.rdoNowJutakuSonotaChecked}" tabindex="44" />                             			
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
														 value="" disabled="true" tabindex="45"/>
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
													<imui:textArea id="tokushuJijo" name="tokushuJijo" value="${form.tokushuJijo}" tabindex="46"
														style="width: 90%; height:100px"
														placeholder="例　希望地域、間取り、階層、具体の社宅名、車の規格（車高 X 車幅）など記入"/>
												</td>
											</tr>                            	
										<!-- 現保有社宅 -->   
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadNowHoyuShataku" code="<%= MessageIdConstant.SKF2020_SC002_NOW_HOYU_SHATAKU %>" />
											</th>
											<td colspan="1" id="taikyoYotei">
												<nfwui:RadioButtonGroup id="taikyoYotei" dynamicMaskList="taikyoYoteiDynam" tabindex="47">
													<nfwui:RadioButton name="taikyoYotei" id="rdoNowHoyuShatakuTaikyo" label="退居する" value="<%= CodeConstant.LEAVE %>"
														disabled="${form.rdoNowHoyuShatakuTaikyoDisabled}" checked="${form.rdoNowHoyuShatakuTaikyoChecked}" tabindex="47"/>
													<nfwui:RadioButton name="taikyoYotei" id="rdoNowHoyuShatakuKeizoku" label="継続使用する" value="<%= CodeConstant.NOT_LEAVE %>" 
														disabled="${form.rdoNowHoyuShatakuKeizokuDisabled}" checked="${form.rdoNowHoyuShatakuKeizokuChecked}" tabindex="47"/>
												</nfwui:RadioButtonGroup>
											</td>
											<td rowspan="2" colspan="3" style="color:red;font-size:11.5px;">
												<nfwui:LabelBox id="lblShatakuFuyouMsg" remove="${form.lblShatakuFuyouMsgRemove}"
													code="<%= MessageIdConstant.SKF2020_SC002_SHATAKU_FUYOU_MSG %>"  />
											</td>
										</tr> 
										<!-- 退居予定日 -->                               	
										<tr>
											<th colspan="3">
												<nfwui:LabelBox id="lblHeadTaikyoYoteiDate" code="<%= MessageIdConstant.SKF2020_SC002_TAIKYO_YOTEI_DATE %>" />
											</th>
											<td colspan="1">
												<nfwui:DateBox id="taikyoYoteiDate" name="taikyoYoteiDate" value="${f:h(form.taikyoYoteiDate)}"
												 	tabindex="48" disabled="true" cssStyle="width:100px"/>	
											</td>
										</tr>
										<!-- 社宅の状態 -->
											<tr id="shatakuStatus">
												<th colspan="3">
													<nfwui:LabelBox id="lblHeadShatakuStatus" code="<%= MessageIdConstant.SKF2020_SC002_SHATAKU_STATUS %>"
														remove="false"/>
												</th>
												<td colspan="3">
													<imui:textArea id="shatakuJotai" name="shatakuJotai" 
														value="${form.shatakuJotai}" style="width: 90%;" placeholder="例 壁紙に破損あり"
														  disabled="true" hidden="false"  tabindex="49"/>
												</td>
											</tr>											
											<!-- 退居理由 -->                               	
											<tr id="taikyoRiyuInfo">
												<th colspan="3">
													<nfwui:LabelBox id="lblHeadTaikyoRiyu" code="<%= MessageIdConstant.SKF2020_SC002_TAIKYO_RIYU %>" />
												</th>
												<td colspan="3">
													<imui:select id="taikyoRiyuKbn" name="taikyoRiyuKbn"  style="width: 50%;" 
														list="${form.ddlTaikyoRiyuKbnList}"  disabled="true" tabindex="50"/>
													<div>
														<imui:textArea id="taikyoRiyu" name="taikyoRiyu"
															value="${form.taikyoRiyu}" style="width: 90%;" placeholder="例 退職のため" disabled="true" tabindex="51" />
													</div>
												</td>
											</tr> 
											<!-- 退居後の連絡先 -->
											<tr id="trTaikyogoRenrakuSaki">
												<th colspan="3">
													<nfwui:LabelBox id="lblHeadTaikyogoRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC002_TAIKYOGO_RENRAKU_SAKI %>" />
												</th>
												<td colspan="3">
													<imui:textArea id="taikyogoRenrakuSaki" name="taikyogoRenrakuSaki" 
														value="${form.taikyogoRenrakuSaki}" style="width: 90%;" placeholder="例 090-0000-0000" disabled="true"
														 tabindex="52"/>
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
													<nfwui:DateBox id="sessionDay" name="sessionDay" value="${f:h(form.sessionDay)}"
												 		tabindex="53" disabled="${form.sessionDayDisabled}" cssStyle="width:100px"/>	
													<imui:select id="sessionTime" name="sessionTime" 
														list="${form.ddlReturnWitnessRequestDateList}" disabled="${form.sessionTimeDisabled}" tabindex="54" />			
												</td>
											</tr>
											<!-- 連絡先 -->
											<tr id="trRenrakuSaki">
												<th colspan="3">
													<nfwui:LabelBox id="lblRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC002_RENRAKU_SAKI %>" />
												</th>
												<td colspan="3">
													<imui:textbox id="renrakuSaki" name="renrakuSaki" 
														value="${f:h(form.renrakuSaki)}" style="width: 90%; ime-mode:disabled;" placeholder="例 090-0000-0000"  
														disabled="${form.renrakuSakiDisabled}" tabindex="55" />
													<br>
													<span style="color:red;">
														<nfwui:LabelBox id="lblExplanationRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC002_EXPLANATION_RENRAKU_SAKI %>" />
													</span>
												</td>
											</tr>
											                     	                                                              
							   		</tbody>                     	
						   		</table>
						</div> 
					</td>     
					<!-- ステータス -->
					<nfwui:Hidden id="applNo" name="applNo" />
				    <nfwui:Hidden id="applId" name="applId" />
				    <nfwui:Hidden id="shainNo" name="shainNo" />
					<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.shainNo}" />
					<input type="hidden" name="applStatus" id="applStatus" value="${form.applStatus}" />			
					<input type="hidden" name="hdnSelectedNowShatakuName" id="hdnSelectedNowShatakuName" value="${form.hdnSelectedNowShatakuName}" />
					<input type="hidden" name="hdnParking1stNumber" id="hdnParking1stNumber" value="${form.hdnParking1stNumber}"/>			
					<input type="hidden" name="hdnParking2stNumber" id="hdnParking2stNumber" value="${form.hdnParking2stNumber}"/>
					<input type="hidden" name="hdnNowShatakuKanriNo" id="hdnNowShatakuKanriNo" value="${form.hdnNowShatakuKanriNo}"/>
					<input type="hidden" name="hdnNowShatakuRoomKanriNo" id="hdnNowShatakuRoomKanriNo" value="${form.hdnNowShatakuRoomKanriNo}"/>
					<input type="hidden" name="hdnBihinHenkyakuUmu" id="hdnBihinHenkyakuUmu" value="${form.hdnBihinHenkyakuUmu}"/>
					<input type="hidden" name="hdnConfirmFlg" id="hdnConfirmFlg" value="${form.hdnConfirmFlg}" />
					<input type="hidden" name="hdnApplHistroyApplDate" id="hdnApplHistroyApplDate" value="${form.hdnApplHistroyApplDate}" />
					<input type="hidden" name="hdnParkingFullFlg" id="hdnParkingFullFlg" value="${form.parkingFullFlg}" />
					<input type="hidden" name="hdnParking1stPlace" id="hdnParking1stPlace" value="${form.parking1stPlace}" />
					<input type="hidden" name="hdnParking2stPlace" id="hdnParking2stPlace" value="${form.parking2stPlace}" />

					<!-- 右側の入力ガイドの部分 -->
					<td style="width: 30%; border: none;background-color: #fdfdff;">
						<div class="imui-form-container-wide">
							<table >
								<nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2020_SC002_OPERATION_GUIDE %>" titleLevel="2" />
								<div>
									${form.operationGuide}
								</div>
							</table>
						</div>
					</td>      
				</tr>
			</tbody>	
		</table>
	<!-- フッターエリア　ボタン -->
	<div class="imui-box-layout" style="width:100%; margin:0 auto;">
		<table>
			<tr>
				<!-- 左エリア -->
				<div class="btnLeft">
	 				<!-- 入力内容をクリア -->
					<nfwui:ConfirmButton cssStyle="width:150px;" id="clearBtn" formId="form" value="入力内容をクリア" 
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
					<nfwui:Button cssStyle="width:150px;" id="saveBtn" formId="form" value="一時保存"
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
	 				  <imui:button id="checkBtn" value="申請内容を確認" class="imui-medium-button" 
	 				  	style="width: 150px" onclick="checkConfrirm()"  disabled="${form.btnCheckDisabled}"/> 
	 			</div>
	 		</tr>	
	 	</table>
		</nfwui:Form>
	</div>
</div>		

<!-- コンテンツエリア  text/JavaSclipt -->
<script type="text/javascript">

/**
 * 社宅を必要とする理由の活性制御
 * disabled:非活性　abled:活性
 */ 
function rdoHitsuyoDisabled(ischecked){
	
    if(ischecked == "disabled"){
			$('#rdoHitsuyoIdo').prop('disabled', true);
			$('#rdoHitsuyoKekkon').prop('disabled', true);
			$('#rdoHitsuyoSonota').prop('disabled', true);
			$('#rdoHitsuyoIdo').prop('checked', false);
			$('#rdoHitsuyoKekkon').prop('checked', false);
			$('#rdoHitsuyoSonota').prop('checked', false);
      } else {
	  		$('#rdoHitsuyoIdo').prop('disabled', false);
			$('#rdoHitsuyoKekkon').prop('disabled', false);
			$('#rdoHitsuyoSonota').prop('disabled', false);
      }
}

/**
 * 社宅を必要としない理由の活性制御
 * disabled:非活性　abled:活性
 */ 
function rdoFuyouDisabled(ischecked){
	
    if(ischecked == "disabled"){
		$('#rdoFuyouJitakutsuukinn').prop('disabled', true);
		$('#rdoFuyouJikokariage').prop('disabled', true);
		$('#rdoFuyouSonota').prop('disabled', true);
		$('#rdoFuyouJitakutsuukinn').prop('checked', false);
		$('#rdoFuyouJikokariage').prop('checked', false);
		$('#rdoFuyouSonota').prop('checked', false);
      } else {
		$('#rdoFuyouJitakutsuukinn').prop('disabled', false);
		$('#rdoFuyouJikokariage').prop('disabled', false);
		$('#rdoFuyouSonota').prop('disabled', false);
      }
}

/**
 * 必要とする社宅の活性制御
 * disabled:非活性　abled:活性
 */ 
function rdoHitsuyoShatakuDisabled(ischecked){
	
    if(ischecked == "disabled"){
		$('#rdoKikon').prop('disabled', true);
		$('#rdoHitsuyoDokushin').prop('disabled', true);
		$('#rdoKikon').prop('checked', false);
		$('#rdoHitsuyoDokushin').prop('checked', false);
      } else {
		$('#rdoKikon').prop('disabled', false);
		$('#rdoHitsuyoDokushin').prop('disabled', false);
      }
}

/**
 * 同居家族の活性制御
 * disabled:非活性　abled:活性
 */ 
function dokyoKazokuDisabled(ischecked){
	
    if(ischecked == "disabled"){
		$('#dokyoRelation1').prop('disabled', true);
		$('#dokyoRelation2').prop('disabled', true);
		$('#dokyoRelation3').prop('disabled', true);
		$('#dokyoRelation4').prop('disabled', true);
		$('#dokyoRelation5').prop('disabled', true);
		$('#dokyoRelation6').prop('disabled', true);
		
		$('#dokyoName1').prop('disabled', true);
		$('#dokyoName2').prop('disabled', true);
		$('#dokyoName3').prop('disabled', true);
		$('#dokyoName4').prop('disabled', true);
		$('#dokyoName5').prop('disabled', true);
		$('#dokyoName6').prop('disabled', true);

		$('#dokyoAge1').prop('disabled', true);
		$('#dokyoAge2').prop('disabled', true);
		$('#dokyoAge3').prop('disabled', true);
		$('#dokyoAge4').prop('disabled', true);
		$('#dokyoAge5').prop('disabled', true);
		$('#dokyoAge6').prop('disabled', true);
		
      }
}

/**
 * 自動車の保管場所の活性制御
 * disabled:非活性　abled:活性
 */ 
function rdoCarUmuDisabled(ischecked){
	
    if(ischecked == "disabled"){
		$('#rdoCarHitsuyo').prop('disabled', true);
		$('#rdoCarFuyo').prop('disabled', true);
		$('#rdoCarHitsuyo').prop('checked', false);
		$('#rdoCarFuyo').prop('checked', false);
      } else {
		$('#rdoCarHitsuyo').prop('disabled', false);
		$('#rdoCarFuyo').prop('disabled', false);
      }
}

/**
 * 自動車の保有の活性制御 チェック制御
 * disabled:非活性　abled:活性
 */ 
function rdoCarHoyuDisabled(ischecked){
	
    if(ischecked == "disabled"){
			$('#rdo1stCarHoyu').attr('checked', false);
			$('#rdo1stCarYotei').attr('checked', false);
			$('#rdo2stCarHoyu').attr('checked', false);
			$('#rdo2stCarYotei').attr('checked', false);
	    		
			$('#rdo1stCarHoyu').prop('disabled', true);
			$('#rdo1stCarYotei').prop('disabled', true);
			$('#rdo2stCarHoyu').prop('disabled', true);
			$('#rdo2stCarYotei').prop('disabled', true);
      } else {			
			$('#rdo1stCarHoyu').prop('disabled', false);
			$('#rdo1stCarYotei').prop('disabled', false);
			$('#rdo2stCarHoyu').prop('disabled', false);
			$('#rdo2stCarYotei').prop('disabled', false);
      }
}

/**
 * 自動車1台目の情報の活性制御
 *
 * disabled:非活性　abled:活性
 */ 
function carInfo1Disabled(ischecked){
	
    if(ischecked == "disabled"){
		$('#carName').prop('disabled', true);
		$('#carNo').prop('disabled', true);
		$('#carExpirationDateDiv').addClass("wj-state-disabled");
		$('#carExpirationDateDiv').prop('disabled', true);
		$('#carExpirationDate').prop('disabled', true);
		$('#carUser').prop('disabled', true);
		$('#parkingUseDateDiv').addClass("wj-state-disabled");
		$('#parkingUseDateDiv').prop('disabled', true);
		$('#parkingUseDate').prop('disabled', true);
      } else {
    	  //自動車の保有が購入を予定しているの場合は自動車の車名～車検有効期間満了日まで非活性
    	  if($("#rdo1stCarYotei").prop('checked')) {
     			$('#carName').prop('disabled', true);
       			$('#carNo').prop('disabled', true);
       			$('#carExpirationDateDiv').addClass("wj-state-disabled");
       			$('#carExpirationDateDiv').prop('disabled', true);
       			$('#carExpirationDate').prop('disabled', true);
    	  }else{
	  			$('#carName').prop('disabled', false);
				$('#carNo').prop('disabled', false);
				$('#carExpirationDateDiv').removeClass("wj-state-disabled");
				$('#carExpirationDateDiv').prop('disabled', false);
				$('#carExpirationDate').prop('disabled', false);
    	  }    	  
			$('#carUser').prop('disabled', false);  
			$('#parkingUseDateDiv').removeClass("wj-state-disabled");
			$('#parkingUseDateDiv').prop('disabled', false);
			$('#parkingUseDate').prop('disabled', false);
      }
}

/**
 * 自動車2の情報の活性制御
 * disabled:非活性　abled:活性
 */ 
function carInfo2Disabled(ischecked){
	
    if(ischecked == "disabled"){
	  	  $('#carName2').prop('disabled', true);
		  $('#carNo2').prop('disabled', true);
    	  $('#carExpirationDate2Div').removeClass("wj-state-disabled");	
    	  $('#carExpirationDate2Div').prop('disabled', true);
		  $('#carExpirationDate2').prop('disabled', true);
		  $('#carUser2').prop('disabled', true);
    	  $('#parkingUseDate2Div').removeClass("wj-state-disabled");
    	  $('#parkingUseDate2Div').prop('disabled', true);
		  $('#parkingUseDate2').prop('disabled', true);
      } else {
    	//自動車の保有が購入を予定しているの場合は自動車の車名～車検有効期間満了日まで非活性
    	  if($("#rdo2stCarYotei").prop('checked')) {
     			$('#carName2').prop('disabled', true);
       			$('#carNo2').prop('disabled', true);
       			$('#carExpirationDate2Div').addClass("wj-state-disabled");
       			$('#carExpirationDate2Div').prop('disabled', true);
       			$('#carExpirationDate2').prop('disabled', true);
    	  }else{
        	  $('#carName2').prop('disabled', false);
        	  $('#carNo2').prop('disabled', false);
        	  $('#carExpirationDate2Div').removeClass("wj-state-disabled");	
        	  $('#carExpirationDate2Div').prop('disabled', false);
        	  $('#carExpirationDate2').prop('disabled', false);
    	  }   

    	  $('#carUser2').prop('disabled', false);
    	  $('#parkingUseDate2Div').removeClass("wj-state-disabled");
    	  $('#parkingUseDate2Div').prop('disabled', false);
    	  $('#parkingUseDate2').prop('disabled', false);
      }
}

/**
 * 現保有の社宅の活性制御
 * disabled:非活性　abled:活性
 */ 
function rdoNowHoyuShatakuDisabled(ischecked){
	
    if(ischecked == "disabled"){
		$('#rdoNowHoyuShatakuTaikyo').prop('disabled', true);
		$('#rdoNowHoyuShatakuKeizoku').prop('disabled', true);
      } else {
		$('#rdoNowHoyuShatakuTaikyo').prop('disabled', false);
		$('#rdoNowHoyuShatakuKeizoku').prop('disabled', false);
      }
}

/**
 * 退居項目の活性制御
 * disabled:非活性　abled:活性
 */ 
function taikyoItemDisabled(ischecked){
	
    if(ischecked == "disabled"){
			$('#taikyoYoteiDateDiv').addClass("wj-state-disabled");
   			$('#taikyoYoteiDateDiv').prop('disabled', true);
			$('#taikyoYoteiDate').prop('disabled', true);
			$('#shatakuJotai').prop('disabled', true);
			$('#taikyoRiyuKbn').prop('disabled', true);
			$('#taikyoRiyu').prop('disabled', true);
			$('#taikyogoRenrakuSaki').prop('disabled', true);
      } else {
			$('#taikyoYoteiDateDiv').removeClass("wj-state-disabled");
   			$('#taikyoYoteiDateDiv').prop('disabled', false);
			$('#taikyoYoteiDate').prop('disabled', false);
			$('#shatakuJotai').prop('disabled', false);
			$('#taikyoRiyuKbn').prop('disabled', false);
			var selTaikyoRiyuKbnCd = $('#taikyoRiyuKbn option:selected').val();
			if(selTaikyoRiyuKbnCd　==　"9"){
				$('#taikyoRiyu').prop('disabled', false);
			}else{
				$('#taikyoRiyu').prop('disabled', true);
				$('#taikyoRiyu').val("")
			}	
			$('#taikyogoRenrakuSaki').prop('disabled', false);
      }
}

/**
 * 備品返却項目の活性制御
 * disabled:非活性　abled:活性
 */ 
function returnEquipmentDisabled(ischecked){
	
    if(ischecked == "disabled"){
			$('#sessionDayDiv').addClass("wj-state-disabled");
			$('#sessionDayDiv').prop('disabled', true);
			$('#sessionDay').prop('disabled', true);
			$('#sessionTime').prop('disabled', true);	
			$('#renrakuSaki').prop('disabled', true);
      } else {
			$('#sessionDayDiv').removeClass("wj-state-disabled");
			$('#sessionDayDiv').prop('disabled', false);
			$('#sessionDay').prop('disabled', false);
			$('#sessionTime').prop('disabled', false);	
			$('#renrakuSaki').prop('disabled', false);
      }
}

/**
 * 返却希望立会日の活性制御
 * disabled:非活性　abled:活性
 */ 
function sessionDayDisabled(ischecked){
	
	if($("#hdnBihinHenkyakuUmu").val()=="0"){
		//返却希望立会日　非活性
			$('#sessionDayDiv').addClass("wj-state-disabled");
			$('#sessionDayDiv').prop('disabled', true);	
			$('#sessionDay').prop('disabled', true);
		}else{					
			$('#sessionDayDiv').removeClass("wj-state-disabled");
			$('#sessionDayDiv').prop('disabled', false);
			$('#sessionDay').prop('disabled', false);
		}
}


/**
 * 退居項目表示制御
 * yes:表示　no:非表示
 */ 
function shatakuDisplayControl(isShow){
	
    if(isShow == "yes"){
		$('#shatakuStatus').show();
		$('#taikyoRiyuInfo').show();
		$('#trTaikyogoRenrakuSaki').show();
		$('#returnEquipment').show();
		$('#returnWitnessRequestDate').show();
		$('#trRenrakuSaki').show();
  } else {
		$('#shatakuStatus').hide();
		$('#taikyoRiyuInfo').hide();
		$('#trTaikyogoRenrakuSaki').hide();
		$('#returnEquipment').hide();
		$('#returnWitnessRequestDate').hide();
		$('#trRenrakuSaki').hide();

  }    if(isShow == "yes"){
		$('#shatakuStatus').show();
		$('#taikyoRiyuInfo').show();
		$('#trTaikyogoRenrakuSaki').show();
		$('#returnEquipment').show();
		$('#returnWitnessRequestDate').show();
		$('#trRenrakuSaki').show();
  } else {
		$('#shatakuStatus').hide();
		$('#taikyoRiyuInfo').hide();
		$('#trTaikyogoRenrakuSaki').hide();
		$('#returnEquipment').hide();
		$('#returnWitnessRequestDate').hide();
		$('#trRenrakuSaki').hide();

  }
}

/**
 * 退居メッセージ表示制御
 * yes:表示　no:表示
 */ 
function mesDisplayControl(isShow){
	
    if(isShow == "yes"){
    	$('#lblShatakuFuyouMsg').show();
      } else {
		//非表示（「社宅を「必要としない」場合は、別途「社宅（自動車保管場所）退居届」を申請してください。」)）
		$('#lblShatakuFuyouMsg').hide();
      }
    
}


//項目表示設定
(function($) {	
	//表示制御
	//退居届を促すメッセージの設定
	$('#lblShatakuFuyouMsg').hide();
	
		
	//クリックイベント		
	//社宅を必要としますか-必要とする押下時
		$('#rdoHitsuyo').click(function() { 	   
		// 社宅を必要としますか？の必要とするにチェックが入っている場合
			if($("#rdoHitsuyo").prop('checked')) {
				//社宅を必要とする理由 活性
				rdoHitsuyoDisabled("abled");
				//社宅を必要としない理由 非活性
				rdoFuyouDisabled("disabled");
				//必要とする社宅  活性
				rdoHitsuyoShatakuDisabled("abled");
				//自動車の保管場所  活性
				rdoCarUmuDisabled("abled");
				//自動車の入力箇所1 活性
				carInfo1Disabled("disabled");
				//自動車の入力箇所2 活性
				carInfo2Disabled("disabled");
				//現居住宅が保有
				if($("#rdoNowJutakuHoyu").prop('checked')){
					//現保有の社宅　活性化
					rdoNowHoyuShatakuDisabled("abled");
				}
				//現居住社宅を退居するの場合
				if($("#rdoNowHoyuShatakuTaikyo").prop('checked')){
					//社宅退居項目の活性化
					taikyoItemDisabled("abled");					
				}
				//備品項目の表示非表示
				if($("#hdnBihinHenkyakuUmu").val()=="0"){
					returnEquipmentDisabled("disabled");
				}else if($("#hdnBihinHenkyakuUmu").val()=="1" && $("rdoNowHoyuShatakuTaikyo").prop('checked')){
					returnEquipmentDisabled("abled");
				}
			  		
	    		//表示制御（現社宅情報） 表示
				shatakuDisplayControl("yes");
	    		//退居を促すメッセージ制御（現社宅情報）　非表示
				mesDisplayControl("no");
			}
		});
	
	//社宅を必要としますか-必要としない押下時
		$('#rdoFuyou').click(function() {   
		 //社宅を必要としますか？の「必要としない」にチェックが入っている場合
			if($("#rdoFuyou").prop('checked')) {			
				//社宅を必要とする理由　非活性
				rdoHitsuyoDisabled("disabled");
				//社宅を必要としない理由 活性
				rdoFuyouDisabled("abled");	
				//自動車の保管場所	不要　活性	
				$('#rdoCarFuyo').prop('disabled', false);
				//自動車の保管場所　必要　非活性
				$('#rdoCarHitsuyo').prop('disabled', true);
				//新所属　非活性
				$("#agencyCd").prop('disabled', true);
				$("#affiliation1Cd").prop('disabled', true);
				$("#affiliation2Cd").prop('disabled', true);
				$('#newAffiliation1Other').prop('disabled', true);
				$('#newAffiliation2Other').prop('disabled', true);
				//同居家族
				dokyoKazokuDisabled("disabled");
				//必要とする社宅　非活性
				$('#rdoKikon').prop('disabled', true);
				$('#rdoHitsuyoSetai').prop('disabled', true);
				$('#rdoHitsuyoTanshin').prop('disabled', true);
				$('#rdoHitsuyoDokushin').prop('disabled', true);
				$('#rdoKikon').prop('checked', false);
				$('#rdoHitsuyoSetai').prop('checked', false);
				$('#rdoHitsuyoTanshin').prop('checked', false);
				$('#rdoHitsuyoDokushin').prop('checked', false);
				//自動車の保有　非活性
				rdoCarHoyuDisabled("disabled");				
				$('#rdoCarFuyo').prop('checked', true);　//駐車場を必要とするか
				//自動車の入力箇所1 活性
				carInfo1Disabled("disabled");
				//自動車の入力箇所2 活性
				carInfo2Disabled("disabled");
				//現居住宅が保有
				if($("#rdoNowJutakuHoyu").prop('checked')){
					//現保有の社宅　活性化
					rdoNowHoyuShatakuDisabled("abled");
				}
								
				//表示制御（現社宅情報） 非表示
				shatakuDisplayControl("no");
	    		if($("#rdoNowHoyuShatakuTaikyo").prop('checked')){
					//退居日活性
	    			$('#taikyoYoteiDateDiv').removeClass("wj-state-disabled");
	       			$('#taikyoYoteiDateDiv').prop('disabled', false);
	    			$('#taikyoYoteiDate').prop('disabled', false);
	    			//退居を促すメッセージ制御（現社宅情報）　表示	
	    			mesDisplayControl("yes");
	    		}else{
	    			//退居日非活性
	    			$('#taikyoYoteiDateDiv').addClass("wj-state-disabled");
	       			$('#taikyoYoteiDateDiv').prop('disabled', true);
	    			$('#taikyoYoteiDate').prop('disabled', true);
		    		//退居を促すメッセージ制御（現社宅情報）　非表示	    			
					mesDisplayControl("no");
	    		}
			}
		});
		
	//社宅を必要としますか-駐車場のみ（項目非表示設定) 	
		$('#rdoParkingOnly').click(function() {
			// 社宅を必要としますか？の「駐車場のみ」にチェックが入っている場合
			if($("#rdoParkingOnly").prop('checked')) {	
				//社宅を必要とする理由　非活性
				rdoHitsuyoDisabled("disabled");
				//社宅を必要としない理由　非活性
				rdoFuyouDisabled("disabled");
				//新所属　非活性
				$("#agencyCd").prop('disabled', true);
				$("#affiliation1Cd").prop('disabled', true);
				$("#affiliation2Cd").prop('disabled', true);
				$('#newAffiliation1Other').prop('disabled', true);
				$('#newAffiliation2Other').prop('disabled', true);
				//同居家族
				dokyoKazokuDisabled("disabled");
				//自動車の保管場所　必要　活性
				$('#rdoCarHitsuyo').prop('disabled', false);
				//自動車の保管場所	不要　非活性		
				$('#rdoCarFuyo').prop('disabled', true);
				//自動車の保有　活性
				rdoCarHoyuDisabled("abled");
				//自動車の入力箇所1 活性
				carInfo1Disabled("abled");
				//自動車の入力箇所2 活性
				carInfo2Disabled("abled");
				//現保有の社宅　非活性化
				rdoNowHoyuShatakuDisabled("disabled");
				//必要とする社宅
				$('#rdoKikon').prop('disabled', true);
				$('#rdoHitsuyoSetai').prop('disabled', true);
				$('#rdoHitsuyoTanshin').prop('disabled', true);
				$('#rdoHitsuyoDokushin').prop('disabled', true);
				//社宅項目の非活性化
				taikyoItemDisabled("disabled");

				//返却希望立会日　非活性
				returnEquipmentDisabled("disabled");			
				//チェック状態
				$('#rdoHitsuyoSonota').prop('checked', true);// 社宅を必要とする理由　その他
				$('#rdoFuyouSonota').prop('checked', true);// 社宅を必要としない理由　その他
				$('#rdoCarHitsuyo').prop('checked', true);　//駐車場を必要とするか
				$('#rdoNowHoyuShatakuTaikyo').prop('checked', false); //現保有の社宅　退居する
				$('#rdoNowHoyuShatakuKeizoku').prop('checked', false); //継続利用する

	    		//表示制御（現社宅情報） 表示
				shatakuDisplayControl("yes");
	    		//退居を促すメッセージ制御（現社宅情報）　非表示
				mesDisplayControl("no");
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
				$('#newAffiliation1Other').val("");
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
				$('#newAffiliation2Other').val("");
			}
						
		});
				
		//社宅プルダウン
		$("#nowShatakuName").bind('change', function() {
			var map = new Object();
			var hShainNo = $('#hdnShainNo').val();	
			map['shatakuKanriId'] = $('#nowShatakuName option:selected').val();	
			map['shainNo'] = hShainNo;	
			
			map['taiyoHituyo'] = getRdoTaiyoHituyo();　//社宅を必要としますか？
	    	map['hitsuyoRiyu'] = getRdoHitsuyoRiyu(); //社宅を必要とする理由
			map['fuhitsuyoRiyu'] = getFuhitsuyoRiyu(); //社宅を必要としない理由
			map['parkingUmu'] = getParkingUmu();			   	
		
			nfw.common.doAjaxAction("skf/Skf2020Sc002/ChangeDropDownAsync",map,true,function(data) {
				//値の変更
				document.getElementById('nowShatakuNo').innerHTML = data.nowShatakuNo;
				document.getElementById('nowShatakuKikakuName').innerHTML = data.nowShatakuKikakuName;
				document.getElementById('nowShatakuMenseki').innerHTML = data.nowShatakuMenseki;
				document.getElementById('parking1stPlace').innerHTML = data.parking1stPlace;
				document.getElementById('parking2stPlace').innerHTML = data.parking2stPlace;
				document.getElementById('returnEquipments').innerHTML = data.returnEquipment;
				
				//値の設定
				$('#hdnSelectedNowShatakuName').val(data.hdnSelectedNowShatakuName);
				$('#hdnParking1stNumber').val(data.hdnParking1stNumber);
				$('#hdnParking2stNumber').val(data.hdnParking2stNumber);		
				$('#hdnBihinHenkyakuUmu').val(data.hdnBihinHenkyakuUmu);
				$('#hdnParkingFullFlg').val(data.parkingFullFlg);
											
				//画面制御
		    	var parkingFullFlg = data.parkingFullFlg;
		    	var bihinHenkyakuUmu = data.hdnBihinHenkyakuUmu;
		    	
		    	//駐車場の貸与可否
				if(parkingFullFlg=="1"){
					//2台借りている場合は、駐車場のみを非活性			
					$('#rdoParkingOnly').prop('disabled', true);		
				}else{
					$('#rdoParkingOnly').prop('disabled', false);		
				}
		    		  	
				if(bihinHenkyakuUmu=="0"){
					//貸与遺品がない場合は、備品返却項目を非活性	
					returnEquipmentDisabled("disabled");		
				}else{
					returnEquipmentDisabled("abled");
				}			
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
				$('#taikyoRiyu').val("")
			}			
		});	
		
		//必要とする社宅-共通
		$('#rdoKikon').click(function() {
			//必要とする社宅-既婚にチェックがある場合
			if($("#rdoKikon").prop('checked')) {		
				$('#rdoHitsuyoSetai').prop('disabled', false);
				$('#rdoHitsuyoTanshin').prop('disabled', false);
				
				// 同居人情報の欄を非活性（世帯が選択されていないため）
				$("input[id^='dokyo']").prop('disabled', true);
						
				$('#rdoHitsuyoSetai').prop('checked', false)
				$('#rdoHitsuyoTanshin').prop('checked', false)
				$('#rdoHitsuyoDokushin').prop('checked', false);
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
				//自動車の保有  活性
				rdoCarHoyuDisabled("abled");	

		      }
		  }); 
		  
		  // 自動車の保管場所の「必要としない」押下時に発動
		  $('#rdoCarFuyo').click(function() {	 	   
			// 自動車の保管場所の「必要としない」にチェックが入っている場合
			if($("#rdoCarFuyo").prop('checked')) {
				//自動車の保有 活性
				rdoCarHoyuDisabled("disabled");
		      }
		  }); 
		  		  		  			  	  
		  // 現保有の社宅の「退居する」押下時に発動
		  $('#rdoNowHoyuShatakuTaikyo').click(function() {	
			// 社宅を不要とするが選択されていた場合
			if($("#rdoFuyou").prop('checked')) {		
	    		//退居を促すメッセージ制御（現社宅情報）　表示
				mesDisplayControl("yes");				
		     }
			
			if($("#hdnBihinHenkyakuUmu").val()=="0"){
	    		//備品項目非活性
				returnEquipmentDisabled("disabled");
			}else{		
				// 社宅を必要としますか？の「駐車場のみ」にチェックが入っている場合
				if($("#rdoParkingOnly").prop('checked')) {
		    		//備品項目非活性
					returnEquipmentDisabled("disabled");
				}else{
					returnEquipmentDisabled("abled");
				}
			}
		  }); 
		  
		  // 現保有の社宅の「継続利用する」押下時に発動
		  $('#rdoNowHoyuShatakuKeizoku').click(function() {	 	   
			// 社宅を不要とするが選択されていた場合
			if($("#rdoNowHoyuShatakuKeizoku").prop('checked')) {		
	    		//退居を促すメッセージ制御（現社宅情報）　非表示
				mesDisplayControl("no");
	    		//備品項目非活性
				returnEquipmentDisabled("disabled");
		      }
		  }); 
		  	  
	    	//駐車場の貸与可否
			if($("hdnParkingFullFlg")=="1"){
				//2台借りている場合は、駐車場のみを非活性			
				$('#rdoParkingOnly').prop('disabled', true);		
			}else{
				$('#rdoParkingOnly').prop('disabled', false);		
			}
    						
			//退居理由その他が選択された場合、その他ボックスを活性化する
			if($('#taikyoRiyuKbn option:selected').val()　==　"9"){
				$('#taikyoRiyu').prop('disabled', false);
			}else{
				$('#taikyoRiyu').prop('disabled', true);
			}
						
			//返却希望立会日
			$(document).ready(function(){
				if($("#hdnBihinHenkyakuUmu").val()=="0"){
		    	//返却希望立会日　非活性
		    		$('#sessionDayDiv').addClass("wj-state-disabled");
					$('#sessionDayDiv').prop('disabled', true);	
					$('#sessionDay').prop('disabled', true);
				}else{					
					// 社宅を必要としますか？の「必要とする」かつ「退居する」にチェックが入っている場合
					if($("#rdoHitsuyo").prop('checked')　&& $('#rdoNowHoyuShatakuTaikyo').prop('checked')) {
						$('#sessionDayDiv').removeClass("wj-state-disabled");
						$('#sessionDayDiv').prop('disabled', false);
						$('#sessionDay').prop('disabled', false);
					}else{
						//返却希望立会日　非活性
						$('#sessionDayDiv').addClass("wj-state-disabled");
						$('#sessionDayDiv').prop('disabled', true);	
						$('#sessionDay').prop('disabled', true);
					}
				}
				
				//社宅が不要の場合は、退去項目を非表示
				if ($("#rdoFuyou").attr("checked")) {
					$("#shatakuStatus,#taikyoRiyuInfo,#trTaikyogoRenrakuSaki,#returnEquipment,#returnWitnessRequestDate,#trRenrakuSaki").hide();	
				}
				
				// 「社宅の必要理由」活性非活性制御
				// 初期表示時、「社宅の必要理由」の選択状態が「世帯」「単身」だった場合、「既婚」にもチェックを入れる
				if($("#rdoHitsuyoSetai, #rdoHitsuyoTanshin").is(":checked")) {
					$("#rdoKikon").prop("checked", true);
					$("#rdoKikon").prop("disabled", false);
				}else{
					$("#rdoKikon").prop("checked", false);
					$("#rdoKikon").prop("disabled",true);
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
					"enabled" : [ "agencyCd", "affiliation1Cd","affiliation2Cd"]
				},
				"2" : {
					// 社宅を必要とする理由の「結婚のため」押下時に発動
					"disabled" : [ "agencyCd","affiliation1Cd","affiliation2Cd","newAffiliation1Other","newAffiliation2Other"]
				},
				"9" : {
					// 社宅を必要とする理由の「その他」押下時に発動
					"disabled" : [ "agencyCd","affiliation1Cd","affiliation2Cd","newAffiliation1Other","newAffiliation2Other"]
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
						"enabled" : [ "nowShatakuName"]
				},
				"2" : {
					"disabled" : [ "nowShatakuName"]
				},
				"3" : {
					"disabled" : [ "nowShatakuName"]
				},
				"9" : {
					"disabled" : [ "nowShatakuName"]
				}
		}
		
		//現保有社宅
		var taikyoYoteiDynam = {
			"1" : {
					// 退居する
					"enabled" : [ "taikyoYoteiDate",
					              "shatakuJotai", 
					              "taikyoRiyuKbn", 
					              "taikyogoRenrakuSaki"]
				},
			"2" : {
					// 継続利用する
						"disabled" : [ "taikyoYoteiDate",
						               "shatakuJotai",
						               "taikyoRiyuKbn",
						               "taikyogoRenrakuSaki"]
			}
	}
</script>


<!-- フッターエリア  text/JavaSclipt -->
<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
    
	/**
	 * ひとつ前の画面に戻る
	 */
    function back1() {
    	var prePageId = $("#prePageId").val();
    	var url = "";
    	//前の画面のＵＲＬ判定
    		if(prePageId=="Skf2010Sc007"){
    			//入居希望等調書申請
    			url = "skf/Skf2010Sc007/init?SKF2010_SC007&tokenCheck=0";
    		}else if(prePageId=="Skf2020Sc002"){
    			//申請条件一覧
    			url="skf/Skf2010Sc003/init?SKF2010_SC003";
			}else if(prePageId=="Skf2010Sc003"){
    			//申請条件一覧
    			url="skf/Skf2010Sc003/init?SKF2010_SC003";
			}
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
	 * 日付型変換
	 * <p>
	 * 文字列をスラッシュを除いて日付に変換		
	 * </p>
	 * 
	 * return 選択された値
	 */ 
	function toDate (str, delim) {
		  var arr = str.split(delim)
		  return new Date(arr[0], arr[1] - 1, arr[2]);
	};	
               
	/**
	 * 申請内容確認ボタンを押下時の処理
	 * <p>
	 * ラジオボタンの選択された値を取得する
	 * </p>
	 * 
	 */ 
    function checkConfrirm() {
		 
		 if($("#rdoHitsuyo").prop('checked')){ 
			//社宅を必要とする場合のみ、退居予定日と返却希望立会日の確認ダイアログ表示判定　yes:あり　no:なし
				var sTaikyoYoteiDate = $("#taikyoYoteiDate").val(); //退居予定日
				var sSessionDay = $("#sessionDay").val(); //返却希望立会日
				if(sTaikyoYoteiDate != "" && sSessionDay != ""){
				//退居予定日と返却希望立会日が空白じゃない場合		
					var dTaikyoYoteiDate = toDate(sTaikyoYoteiDate, '/');	//退居予定日
					var dSessionDay = toDate(sSessionDay, '/');				//返却希望立会日
					
					if(dSessionDay.getTime() > dTaikyoYoteiDate.getTime()){
						//申請内容確認ボタン（ダイアログあり）を表示
						dialogue　= "yes"
					}else{
						//申請内容確認ボタン（ダイアログなし）を表示
						dialogue　= "no"
					}
				}else{
					//申請内容確認ボタン（ダイアログなし）を表示
					dialogue　= "no"
				}
		 	}else{
				//申請内容確認ボタン（ダイアログなし）を表示
				dialogue　= "no"
		 	}
		 
		 		 
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
		
		map['hdnParking1stPlace'] = $("#hdnParking1stPlace").val();
		map['hdnParking2stPlace'] = $("#hdnParking2stPlace").val();
		
		map['taikyoYotei'] = getTaikyoYotei();
    	map['taikyoYoteiDate'] = $("#taikyoYoteiDate").val();
		map['tokushuJijo'] =  $("#tokushuJijo").val();
		map['shatakuJotai'] = $("#shatakuJotai").val();	
    	map['taikyoRiyuKbn'] = $("#taikyoRiyuKbn option:selected").val();
		map['taikyoRiyu'] = $("#taikyoRiyu").val();
    	map['taikyogoRenrakuSaki'] = $("#taikyogoRenrakuSaki").val();
    	
    	map['hdnBihinHenkyakuUmu'] = $("#hdnBihinHenkyakuUmu").val();
    	
		map['sessionDay'] = $("#sessionDay").val();	
    	map['sessionTime'] = $("#sessionTime option:selected").val();
		map['renrakuSaki'] = $("#renrakuSaki").val();
		
		map['pageId'] = $("#hdnPageId").val();
		
		var errorCheck = false;
		
		//入力チェック非同期処理呼び出し
		$.when(
			nfw.common.doAjaxAction("skf/Skf2020Sc002/checkAsync",map,true,function(data) {
			
					//エラーが無い場合
					$(".imui-box-caution, .imui-box-warning").remove();
					errorCheck = true;
			    	var form = "form"; //受け渡すformId
			    	var url = "skf/Skf2020Sc002/Confirm"; //遷移先サービス
					if(dialogue=="yes"){
			    	//退居予定日と返却希望立会日の確認ダイアログが必要な場合
						//ダイアログ
						skf.common.confirmPopup("返却立会希望日が退居予定日以降で入力されています。申請してもよろしいですか？", "確認", form ,url, "ok", "キャンセル",this);			
					}else if(dialogue=="no"){
						//退居予定日と返却希望立会日の確認ダイアログが不要な場合
						nfw.common.submitForm(form,url,"checkBtn");
					}
			}),wait(1)
		)
		.done(function(data) {
			console.log(errorCheck);
			if(!errorCheck){
				 scrollTo(0, 0);
			}
		});
    }
	
	function wait(sec) {
	    var d = $.Deferred();
	    setTimeout(function() {
	        d.resolve();
	    }, sec * 100);
	    return d.promise();
	}
</script>
