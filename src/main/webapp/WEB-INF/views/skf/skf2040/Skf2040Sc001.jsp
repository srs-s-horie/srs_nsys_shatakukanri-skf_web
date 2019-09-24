<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<% // 代行ログイン時CSS読み込み箇所ここから  %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<% // 代行ログイン時CSS読み込み箇所ここまで %>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<script src="scripts/skf/skfCommon.js"></script>

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
<%-- コンテンツエリア --%>
<script type="text/javascript">
	/**
	 * ひとつ前の画面に戻る
	 */
	function back1() {
		var url = "skf/Skf2010Sc007/init?SKF2010_SC007&tokenCheck=0";
		nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。編集内容を保存する場合は「一時保存」をクリックして下さい。");
	}  

(function($){
    // 画面表示時に定義される処理
    $(document).ready(function(){
    	if($("#hdnBihinHenkyakuUmu").val()=="0"){
    	//返却希望立会日　非活性
			$('#sessionDayDiv').prop('disabled', true);	
			$('#sessionDay').prop('disabled', true);			
		}else{
			$('#sessionDayDiv').prop('disabled', false);
			$('#sessionDay').prop('disabled', false);	
		}
    });


    // 「申請内容を確認」ボタン押下時のイベント
    onClickConfirm = function () {
        //nfw.common.submitForm("paramForm", "skf/Skf2060Sc001/Init");
        showConfirm(W_GFK_0001.replace('{0}', '申請内容を確認'), function() {
            var taikyoSyataku = false;
            var taikyoCar = false;

            $('input:checkbox[name="taikyoType"]:checked').each(function() {
                if ($(this).val() == 'syataku') {
                    taikyoSyataku = true;
                } else {
                    taikyoCar = true;
                }
               
            });
            if (taikyoSyataku === false && taikyoCar == false) {
            	showWarning(E_GFK_0001);
            } else {
            	nfw.common.submitForm("paramForm", "skf/Skf2040Sc001/Clear")
                $.StandardPost("../../skf/Skf2040_Sc001/init");
            }
       });
    }
    
 	// 退居(返還)理由変更時のイベント
    onChangeTaikyoRiyuKbn = function () {
    	//その他が選択された場合、その他ボックスを活性化する
		var selTaikyoRiyuKbnCd = $('#taikyoRiyuKbn option:selected').val();
		if(selTaikyoRiyuKbnCd == "9"){
			$('#taikyoRiyu').prop('disabled', false);
		}else{
			$('#taikyoRiyu').prop('disabled', true);
			$('#taikyoRiyu').val("")
		}
    }
    
 	// 「社宅を退居する」チェック時のイベント
    onClickTaikyoType01 = function () {
    	var isTaikyoChecked = $('#taikyoType01').prop('checked');
		if(isTaikyoChecked){
			// 「社宅を退居する」チェック時
			
			// 駐車場１，２がチェックされていない場合はチェックする
			if (!$('#taikyoType02').prop('disabled')) {
				$('#taikyoType02').prop('checked', true);
			}
			if (!$('#taikyoType03').prop('disabled')) {
				$('#taikyoType03').prop('checked', true);
			}
			
			$('#shatakuStatus').prop('disabled', false);
			$('#taikyogoRenrakuSaki').prop('disabled', false);
			
			// 備品返却関連
			$('#sessionDayDiv').removeClass("wj-state-disabled");
			$('#sessionDayDiv').prop('disabled', false);
			$('#sessionDay').prop('disabled', false);
			$('#sessionTime').prop('disabled', false);
			$('#renrakuSaki').prop('disabled', false);
		}else{
			// 「社宅を退居する」チェック外し時
			$('#shatakuStatus').prop('disabled', true);
			$('#taikyogoRenrakuSaki').prop('disabled', true);
			
			// 備品返却関連
			$('#sessionDayDiv').prop('disabled', true);
			$('#sessionDay').prop('disabled', true);
			$('#sessionTime').prop('disabled', true);
			$('#renrakuSaki').prop('disabled', true);
		}
    }
})(jQuery);
</script>

<!-- コンテンツエリア-->
<!-- 代行ログイン時のみ表示-->
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
<nfwui:Form id="form" name="form" modelAttribute="form">
    <div class="imui-form-container-wide">
        <table class="imui-form-search-condition">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        
                        <div class="imui-form-container-wide" >
                        <table class="imui-form-search-condition">
                        <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2040_SC001_APPL_INFO %>" titleLevel="2" />
                            <tbody>
                                <!-- 機関 -->
                                <tr>
                                    
                                    <th colspan="3" style="width: 30%;">
                                        <nfwui:LabelBox id="lblHeadAgency" code="<%= MessageIdConstant.SKF2040_SC001_AGENCY %>" />
                                    </th>
                                    <td colspan="2">
                                        ${f:h(form.agencyName)}
                                    </td>
                                </tr>
                                <!-- 部等 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadAffiliation1" code="<%= MessageIdConstant.SKF2020_SC002_AFFLIATION1 %>" />
								    </th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation1Name)}
                                    </td>
                                </tr>
                                <!-- 室、チーム又は課 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadAffiliation2" code="<%= MessageIdConstant.SKF2020_SC002_AFFLIATION2 %>" />
									</th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation2Name)}
                                    </td>
                                </tr>
                                <!-- 保有住宅名 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadNowShatakuName" code="<%= MessageIdConstant.SKF2040_SC001_NOW_SHATAKU_NAME %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:select id="nowShatakuName" name="nowShatakuName" list="${form.ddlNowShatakuNameList}" 
													 value="" disabled="true" tabindex="45"/>
                                    </td>
                                </tr>
                                <!-- 現住所 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadNowAddress" code="<%= MessageIdConstant.SKF2040_SC001_NOW_ADDRESS %>" />
                                    </th>
                                    <td colspan="2">
                                            ${f:h(form.nowAddress)}
                                        </select>
                                    </td>
                                </tr>
                                <!-- 氏名 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadName" code="<%= MessageIdConstant.SKF2040_SC001_NAME %>" />
                                    </th>
                                    <td colspan="2">
                                            ${f:h(form.name)}
                                        </select>
                                    </td>
                                </tr>
                                <!-- 性別 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_GENDER %>" />
                                    </th>
                                    <td colspan="2">
                                            ${f:h(form.gender)}
                                        </select>
                                    </td>
                                </tr>
                                <!-- 駐車場1台目保管場所 -->
                                <tr>
                                    <th rowspan="2">
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_PERKING %>" />
                                    </th>
                                    <th width="70">
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_PARKING_1ST %>" />
                                    </th>
                                    <th>
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_PERKING_PLACE %>" />
                                    </th>
                                    <td colspan="2">
                                        <span id="parking1stPlace">${f:h(form.parking1stPlace)} </span>
                                    </td>
                                </tr>
                                <!-- 駐車場2台目保管場所 -->
                                <tr>
                                     <th width="70">
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_PARKING_2ND %>" />
                                    </th>
                                    <th>
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_PERKING_PLACE %>" />
                                    </th>
                                    <td colspan="2">
                                        <span id="parking2stPlace">${f:h(form.parking2ndPlace)} </span>
                                    </td>
                                </tr>
                                <!-- 退居(返還)日 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadTaikyoHenkanDate" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYO_HENKAN_DATE %>" />
                                    </th>
                                    <td colspan="2">
                                        <nfwui:DateBox id="taikyoHenkanDate" name="taikyoHenkanDate" value="${f:h(form.taikyoHenkanDate)}"
                                               cssClass="${f:h(form.taikyoHenkanDateErr)}" tabindex="1" cssStyle="width:100px"/>
                                    </td>
                                </tr>
                                <!-- 退居(返還)する社宅又は、自動車の保管場所 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadHenkanTarget" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYO_HENKAN_TARGET %>" />
                                    </th>
                                    <td colspan="2">
										<nfwui:CheckBoxGroupTag id="taikyoType">
										<table class="${f:h(form.taikyoTypeErr)}">
		                                    <tr style="height: 25px;">
		                                        <td>
			                                        <nfwui:CheckBox id="taikyoType01" name="taikyoType"
			                                                value="shataku_checked" label="社宅を退居する" tabindex="7"
			                                                disabled="${form.nowShatakuTaikyoDisabled}"
			                                                onclick="onClickTaikyoType01();" />
			                                    </td>
			                                    <td>
			                                        <nfwui:CheckBox id="taikyoType02" name="taikyoType"
			                                                value="park1_checked" label="駐車場1を返還する" tabindex="7"
			                                                disabled="${form.nowParking1TaikyoDisabled}" />
			                                    </td>
			                                    <td>
			                                        <nfwui:CheckBox id="taikyoType03" name="taikyoType"
			                                                value="park2_checked" label="駐車場2を返還する" tabindex="7"
			                                                disabled="${form.nowParking2TaikyoDisabled}" />
		                                        </td>
		                                    </tr>
		                                </table>
		                                </nfwui:CheckBoxGroupTag>
                                    </td>
                                </tr>
                                <!-- 退居(返還)理由 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadTaikyoHenkanRiyu" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYO_HENKAN_RIYU %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:select id="taikyoRiyuKbn" name="taikyoRiyuKbn"  style="width: 50%;" 
                                                     css="${f:h(form.taikyoRiyuKbnErr)}" onchange="onChangeTaikyoRiyuKbn();"
													 list="${form.ddlTaikyoRiyuKbnList}" tabindex="50"/>
                                        <br>
                                        <imui:textArea id="taikyoRiyu" name="taikyoRiyu"
												       value="${f:h(form.taikyoHenkanRiyu)}" style="width: 90%;" 
												       css="${f:h(form.taikyoHenkanRiyuErr)}"
												       placeholder="例 自宅購入のため" disabled="true" tabindex="51" />
                                    </td>
                                </tr>
                                <!-- 社宅の状態 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadShatakuStatus" code="<%= MessageIdConstant.SKF2040_SC001_SHATAKU_STATUS %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textArea id="shatakuStatus" name="shatakuStatus"
												       value="${f:h(form.shatakuJyotai)}" style="width: 90%;" 
												       css="${f:h(form.shatakuJyotaiErr)}"
												       placeholder="例  壁紙に破損あり" disabled="true" tabindex="51" />
                                    </td>
                                </tr>
                                <!-- 退居後の連絡先 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadTaikyogoRenrakuSaki" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYOGO_RENRAKU_SAKI %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textArea id="taikyogoRenrakuSaki" name="taikyogoRenrakuSaki" 
													   value="${f:h(form.taikyogoRenrakuSaki)}" style="width: 90%;" 
													   css="${f:h(form.taikyogoRenrakuSakiErr)}"
													   placeholder="例 090-0000-0000" disabled="true" tabindex="52"/>
                                    </td>
                                </tr>
                                <!-- 返却備品 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadReturnEquipment" code="<%= MessageIdConstant.SKF2040_SC001_RETURN_EQUIPMENT %>" />
                                    </th>
                                    <td colspan="2">
                                        <table>
                                        <tr>
                                        <td>・洗濯機</td>
                                        <td>・冷蔵庫</td>
                                        </tr>
                                        <tr>
                                        <td>・オーブンレンジ&nbsp;&nbsp;&nbsp;</td>
                                        <td>・掃除機</td>
                                        </tr>
                                        <tr>
                                        <td>・電子炊飯ジャー</td>
                                        <td>・テレビ</td>
                                        </tr>
                                        <tr>
                                        <td>・テレビ台</td>
                                        <td>・座卓(こたつ)</td>
                                        </tr>
                                        <tr></tr>
                                        
                                        </table>
                                    </td>
                                </tr>
                                <!-- 返却立合希望日 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadReturnWitnessRequestDate" code="<%= MessageIdConstant.SKF2040_SC001_RETURN_WITNESS_REQUEST_DATE %>" />
                                    </th>
                                    <td colspan="2">
                                        <nfwui:DateBox id="sessionDay" name="sessionDay" value="${f:h(form.sessionDay)}"
                                        			   cssClass="${f:h(form.sessionDayErr)}" cssStyle="width:100px"
													   tabindex="53" disabled="${form.sessionDayDisabled}"/>
										<imui:select id="sessionTime" name="sessionTime" 
													 css="${f:h(form.sessionTimeErr)}"
													 list="${form.ddlReturnWitnessRequestDateList}" disabled="${form.sessionTimeDisabled}" tabindex="54" />
                                    </td>
                                </tr>
                                <!-- 連絡先 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadRenrakuSaki" code="<%= MessageIdConstant.SKF2040_SC001_RENRAKU_SAKI %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textbox id="renrakuSaki" name="renrakuSaki" 
											          value="${f:h(form.renrakuSaki)}" style="width: 90%;" placeholder="例 090-0000-0000"  
											          css="${f:h(form.renrakuSakiErr)}"
											          disabled="${form.renrakuSakiDisabled}" tabindex="55" />
										<br>
										<span style="color:red;">
											<nfwui:LabelBox id="lblExplanationRenrakuSaki" code="<%= MessageIdConstant.SKF2040_SC001_EXPLANATION_RENRAKU_SAKI %>" />
										</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </td>
                    <!-- 右側の操作ガイドの部分 -->
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                        <div class="imui-form-container-wide" >
                        <div style="margin-left: 20px; background-color:#eeeeee;">
                            <nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2040_SC001_OPERATION_GUIDE %>" titleLevel="2" />
                            <div style="overflow-y:scroll; height:99%; margin-left: 20px;">
                                <span style="font-size: 100%; heigth:90%;">
                                    ${form.operationGuide}
                                </span>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
	<!-- フッターエリア -->
	<div class="imui-box-layout" style="width:100%; margin:0 auto;">
		<table>
			<tr>
				<!-- 左エリア -->
				<div class="btnLeft">
	 				<!-- 入力内容をクリア -->
					<nfwui:ConfirmButton cssStyle="width:150px;" id="clearBtn" formId="form" value="入力内容をクリア" 
						cssClass="imui-medium-button" title="<%= MessageIdConstant.SKF2040_SC001_CONFIRM_TITLE %>" 
						message="<%= MessageIdConstant.I_SKF_2004 %>" 
						url="skf/Skf2040Sc001/Clear"/>	
	 			</div>
				<!-- 右エリア -->
	 			<div class="btnRight">
	 				<!-- 申請要件を確認 -->
					<nfwui:Button cssStyle="width:150px;" id="download" name="download" value="申請要件を確認" 
						formID="form" cssClass="imui-medium-button" url="skf/Skf2040Sc001/Download" />   	 
					<!-- 一時保存 -->
					<nfwui:Button cssStyle="width:150px;" id="saveBtn" formId="form" value="一時保存"
						cssClass="imui-medium-button" disabled="${form.btnSaveDisabled}"
						url="skf/Skf2040Sc001/Save"/>
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
	 				  	style="width: 150px" onclick="onClickConfirm()"  disabled="${form.btnCheckDisabled}"/> 
	 			</div>
	 		</tr>	
	 	</table>
	</div>
<!-- NFWUIフォーム終了位置 -->
</nfwui:Form>

<!-- コンテンツエリア　ここまで -->