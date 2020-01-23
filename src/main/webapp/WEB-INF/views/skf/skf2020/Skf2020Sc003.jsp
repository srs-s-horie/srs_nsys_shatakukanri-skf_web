<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<link rel="stylesheet" type="text/css" href="styles/skf/theme.css" />
<%@ page import="jp.co.c_nexco.skf.skf2020.app.skf2020sc003.Skf2020Sc003Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2020Sc003Form form = (Skf2020Sc003Form)request.getAttribute("form"); %>

<%-- コンテンツエリア --%>
<style type="text/css">
    li.im-ui-icon-common-16-link-point-gray {
        line-height: 8px;
        height: 10px;
        margin-top: 10px;
        margin-bottom: 2px;
    }
    
    input {
       background-color: rgb(255, 255, 255);
    }
    
    table#dokyoList td {
    	height: 20px;
    } 
</style>

<script type="text/javascript">
// 前の画面に戻る
function back1() {
	var url="skf/Skf2010Sc005/init"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

$(function() {
	$(document).ready(function(){
		// 添付資料のリンクをクリックした時のイベント
		$("a[id*='attached_']").click(function(){
			attachedFileDownload(this);
		});
		
		
		// 備品希望が不可の時は備品一覧を非表示
		if ($("#bihinKiboFukano").attr("checked")) {
			$("#bihinKiboList").hide();	
		}

		// 備品希望のラジオボタンを変更した時のイベント
		$("input[name='bihinKibo']:radio").change(function() {
			var check = $(this).val();
			if (check == "<%= CodeConstant.BIHIN_KIBO_SHINSEI_FUYO %>") {
				$("#bihinKiboList").animate({
				    height: ['hide', 'swing']
				  }, 300);	
			} else {
				$("#bihinKiboList").animate({
				    height: ['show', 'swing']
				  }, 300);	
			}
		});
		
		// 初期表示時、「社宅の必要理由」の選択状態が「世帯」だった場合の制御
		if($("#hitsuyoShatakuSetai").is(":checked")) {
			$("input:radio:not(:checked)").prop("disabled", true);
		} else {
			$("input[name!='bihinKibo']:radio:not(:checked)").prop("disabled", true);
		}
		
		// 「独身」のラジオボタンをクリックした場合
		$("#hitsuyoShatakuDokushin").click(function() {
			// 「既婚」のラジオボタンのチェックを外して活性化
    		$("#hitsuyoShatakuKikon").prop("checked", false);
    		$("#hitsuyoShatakuKikon").prop("disabled", false);
    		// 「社宅の必要理由」のラジオボタンでチェックされているもの以外は非活性
    		$("input[name='hitsuyoShataku']:radio:not(:checked)").prop("disabled", true);
		});
		// 「既婚」のラジオボタンをクリックした場合
		$("#hitsuyoShatakuKikon").click(function() {
			// 「独身」のラジオボタンのチェックを外す
    		$("#hitsuyoShatakuDokushin").prop("checked", false);
			// 「社宅の必要理由」のラジオボタンを全て活性化
    		$("input[name='hitsuyoShataku']:radio").prop("disabled", false);
		});
		// 「世帯」または「単身」をクリックした場合
		$("#hitsuyoShatakuSetai, #hitsuyoShatakuTanshin").click(function() {
			// 「既婚」のラジオボタンのチェックを外して非活性
    		$("#hitsuyoShatakuKikon").prop("checked", false);
    		$("#hitsuyoShatakuKikon").prop("disabled", true);
		});
		
		// 「編集」ボタンを押下した時の処理
    	$("#edit").click(function() {
    		$("#editMode").show();
    		$("#readOnlyMode").hide();
    		if (!$("#hitsuyoShatakuDokushin").prop("checked")) {
    			$("input[name='hitsuyoShataku']:radio").prop("disabled", false);
    		}
    		//$("#hitsuyoShatakuKikon").prop("disabled", false);
    	});
    	// 「取消」ボタンを押下した時の処理
    	$("#cancel").click(function() {
    		$("#editMode").hide();
    		$("#readOnlyMode").show();
    		var defaultHitsuyoShataku = $("#default").val();
    		switch (defaultHitsuyoShataku) {
    		case "<%= CodeConstant.SETAI %>":
    			$("#hitsuyoShatakuSetai").prop("checked", true);
    			$("#hitsuyoShatakuTanshin").prop("checked", false);
    			$("#hitsuyoShatakuDokushin").prop("checked", false);
    			$("#hitsuyoShatakuKikon").prop("checked", true);
    			break;
    		case '<%= CodeConstant.TANSHIN %>':
    			$("#hitsuyoShatakuSetai").prop("checked", false);
    			$("#hitsuyoShatakuTanshin").prop("checked", true);
    			$("#hitsuyoShatakuDokushin").prop("checked", false);
    			$("#hitsuyoShatakuKikon").prop("checked", true);
    			break;
    		case '<%= CodeConstant.DOKUSHIN %>':
    			$("#hitsuyoShatakuSetai").prop("checked", false);
    			$("#hitsuyoShatakuTanshin").prop("checked", false);
    			$("#hitsuyoShatakuDokushin").prop("checked", true);
    			$("#hitsuyoShatakuKikon").prop("checked", false);
    			$("#hitsuyoShatakuKikon").prop("disabled", true);
    			break;
    		}
    		$("input[name='hitsuyoShataku']:radio(:checked)").prop("disabled", false);
    		$("input[name='hitsuyoShataku']:radio:not(:checked)").prop("disabled", true);
    	});
	});
	
	// 添付ファイルリンクからのファイルダウンロード処理
	attachedFileDownload = function(obj) {
		var id = $(obj).attr("id");
		var url = "skf/Skf2020Sc003/Download";
		var attachedNo = id.replace(/\attached_/, '');
		
		$("#attachedNo").val(attachedNo);
		$("#form").attr("action", url);
		$("#form").submit();
	}
	
	// 添付資料設定時に上部表示エリアに追記する処理
	updateAttachedFileArea = function () {
		var map = new Object();
		map['applNo'] = $("#applNo").val();
		nfw.common.doAjaxAction("skf/Skf2020Sc003/AttachedFileAreaAsync", map, true, function(res){
			$("#attachedFileAreaDiv").html(res.attachedFileArea);
			
			// 追記したリンクにはファイルダウンロード機能が無いため追加
			$("a[id*='attached_']").bind("click", function(){
				attachedFileDownload(this);
			});
		});
	}

});
</script>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" style="width: 95%" >
                    <table class="imui-form-search-condition" >
                       <tr>
                            <th width="100px"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2020_SC003_APPL_STATUS %>" /></th>
                            <td width="100px"><label>${form.applStatusText }</label></td>
                            <th width="100px"><nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2020_SC003_ATTACHED_FILE %>" /></th>
                            <td>
                            <div id="shatakuAttachedFileAreaDiv" style="float:left;">
<c:forEach var="objShataku" items="${form.shatakuAttachedFileList }">
                            <a id="attached_${f:h(objShataku.attachedNo)}">${f:h(objShataku.attachedName)}</a>&nbsp;
</c:forEach>
							</div>
                            <div id="attachedFileAreaDiv">
<c:forEach var="obj" items="${form.attachedFileList }">
                            <a id="attached_${f:h(obj.attachedNo)}">${f:h(obj.attachedName)}</a>&nbsp;
</c:forEach>
							</div>
                            </td>
                      </tr>
                    </table>
        <nfwui:Form id="form" name="form" modelAttribute="form">
        <nfwui:Hidden id="applNo" name="applNo" />
        <nfwui:Hidden id="applId" name="applId" />
        <nfwui:Hidden id="applStatus" name="applStatus" />
        <nfwui:Hidden id="shatakuKanriNo" name="shatakuKanriNo" />
        <input type="hidden" id="attachedNo" name="attachedNo" value="" />
        <input type="hidden" id="attachedType" name="attachedType" value="" />
        <table class="imui-form-search-condition" style="box-sizing:border-box;">
            <tbody>
                        
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff; max-width: 750px;">
                        <!-- 左側の入力域の部分 -->
                        <div class="imui-form-container-wide" >
                        <table class="imui-form-search-condition">
                            <tbody>
                            <div class="imui-chapter-title" style="margin-bottom: 10px;"><h2>申請内容表示</h2></div>
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2020_SC003_SHOZOKU %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2020_SC003_AGENCY %>" /></th>
                                    <td colspan="2" style="min-width: 400px;">
                                        ${f:h(form.agencyName)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2020_SC003_AFFILIATION1 %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation1Name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2020_SC003_AFFILIATION2 %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation2Name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2020_SC003_TEL %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.tel)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblApplcant" code="<%= MessageIdConstant.SKF2020_SC003_APPLICANT %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2020_SC003_SHAIN_NO %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.shainNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblShainName" code="<%= MessageIdConstant.SKF2020_SC003_NAME %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblTokyu" code="<%= MessageIdConstant.SKF2020_SC003_TOKYU %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.tokyu)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2020_SC003_GENDER %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.gender)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblAskedShataku" code="<%= MessageIdConstant.SKF2020_SC003_ASKED_SHATAKU %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="taiyoHituyo">
                                      <nfwui:RadioButton id="taiyoHitsuyoHitsuyo" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_HITSUYO %>" label="必要とする" />
                                      <nfwui:RadioButton id="taiyoHitsuyoFuyo" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_FUYOU %>" label="必要としない" />
                                      <nfwui:RadioButton id="taiyoHitsuyoParking" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_PARKING_ONLY %>" label="駐車場のみ" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblHitsuyoRiyu" code="<%= MessageIdConstant.SKF2020_SC003_HITSUYO_RIYU %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="hitsuyoRiyu">
                                      <nfwui:RadioButton id="hitsuyoRiyuIdo" name="hitsuyoRiyu" value="<%= CodeConstant.IDOU %>" label="異動のため" />
                                      <nfwui:RadioButton id="hitsuyoRiyuKekkon" name="hitsuyoRiyu" value="<%= CodeConstant.KEKKON %>" label="結婚のため" />
                                      <nfwui:RadioButton id="hitsuyoRiyuOther" name="hitsuyoRiyu" value="<%= CodeConstant.HITUYO_RIYU_OTHERS %>" label="その他" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblFuyoRiyu" code="<%= MessageIdConstant.SKF2020_SC003_FUYO_RIYU %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="fuhitsuyoRiyu">
                                      <nfwui:RadioButton id="fuhitsuyoRiyuJitaku" name="fuhitsuyoRiyu" value="<%= CodeConstant.JITAKU_TSUKIN %>" label="自宅通勤" />
                                      <nfwui:RadioButton id="fuhitsuyoRiyuKariage" name="fuhitsuyoRiyu" value="<%= CodeConstant.JIKO_KARIAGE %>" label="自己借上" />
                                      <nfwui:RadioButton id="fuhitsuyoRiyuOther" name="fuhitsuyoRiyu" value="<%= CodeConstant.FUYO_RIYU_OTHERS %>" label="その他" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="3"><nfwui:LabelBox id="lblNewShozoku" code="<%= MessageIdConstant.SKF2020_SC003_NEW_SHOZOKU %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewAgency" code="<%= MessageIdConstant.SKF2020_SC003_AGENCY %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newAgency)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewAffiliation1" code="<%= MessageIdConstant.SKF2020_SC003_AFFILIATION1 %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.newAffiliation1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewAffiliation2" code="<%= MessageIdConstant.SKF2020_SC003_AFFILIATION2 %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newAffiliation2)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblHitsuyoShataku" code="<%= MessageIdConstant.SKF2020_SC003_HITSUYO_SHATAKU %>" >

<imart:condition validity="<%= String.valueOf(form.isEditBtnVisible()) %>" >
                                    <div id="readOnlyMode" class="align-R float-R">
                                    <imui:button id="edit" name="edit" class="imui-small-button check" value="編集" />
                                    </div>
                                    <div id="editMode" class="align-R float-R" style="display:none;">
                                    <nfwui:Button id="commit" name="commit" cssClass="imui-small-button check" value="確定"
                                    formId="form" url="skf/Skf2020Sc003/Update" /><br>
                                    <imui:button id="cancel" name="cancel" class="imui-small-button check" value="取消" /></div>
</imart:condition>
                                    </nfwui:LabelBox>
                                    </th>
                                    <td id="hitsuyoShataku" colspan="3" >
                                    <input type="hidden" id="default" name="defaultHitsuyoShataku" value="${form.hitsuyoShataku }" />
										<nfwui:RadioButton name="rdoKikon" id="hitsuyoShatakuKikon" label="既婚"
											value="<%= CodeConstant.KIKON %>" tabindex="10" />
											<nfwui:RadioButtonGroup id="hitsuyoShataku" tabindex="11"> 
												（
													<nfwui:RadioButton name="hitsuyoShataku" id="hitsuyoShatakuSetai" label="世帯" 
														value="<%= CodeConstant.SETAI %>" checked="${form.rdoHitsuyoSetaiChecked}" tabindex="11"/>
													<nfwui:RadioButton name="hitsuyoShataku" id="hitsuyoShatakuTanshin" label="単身" 
														value="<%= CodeConstant.TANSHIN %>" checked="${form.rdoHitsuyoTanshinChecked}" tabindex="11"/>
												）
													<br>
													<nfwui:RadioButton name="hitsuyoShataku" id="hitsuyoShatakuDokushin" label="独身" 
														value="<%= CodeConstant.DOKUSHIN %>" tabindex="19"/>
											</nfwui:RadioButtonGroup>
									</td>

                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblDokyoKazoku" code="<%= MessageIdConstant.SKF2020_SC003_DOKYO_KAZOKU %>" /></th>
                                    <td colspan="2">
                                        <table class="imui-form-search-condition" id="dokyoList" style="width:100%;">
                                            <tbody>
                                                <tr>
                                                    <th><nfwui:LabelBox id="lblDokyoRelation" code="<%= MessageIdConstant.SKF2020_SC003_DOKYO_RELATION %>" /></th>
                                                    <th><nfwui:LabelBox id="lblDokyoName" code="<%= MessageIdConstant.SKF2020_SC003_DOKYO_NAME %>" /></th>
                                                    <th><nfwui:LabelBox id="lblDokyoAge" code="<%= MessageIdConstant.SKF2020_SC003_DOKYO_AGE %>" /></th>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoRelation1)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                       ${f:h(form.dokyoName1)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge1)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoRelation2)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName2)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge2)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation3)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName3)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge3)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation4)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName4)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge4)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation5)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName5)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge5)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation6)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName6)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge6)}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblNyukyoYoteiDate" code="<%= MessageIdConstant.SKF2020_SC003_NYUKYO_YOTEI_DATE %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.nyukyoYoteiDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblParkingUmu" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_UMU %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="parkingUmu">
                                      <nfwui:RadioButton id="parkingUmuHitsuyo" name="parkingUmu" value="<%= CodeConstant.CAR_PARK_HITUYO %>" label="必要とする" />
                                      <nfwui:RadioButton id="parkingUmuFuyo" name="parkingUmu" value="<%= CodeConstant.CAR_PARK_FUYO %>" label="必要としない" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="6"><nfwui:LabelBox id="lbl1stCar" code="<%= MessageIdConstant.SKF2020_SC003_1ST_CAR %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarFlag" code="<%= MessageIdConstant.SKF2020_SC003_CAR_FLAG %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="carNoInputFlg">
                                      <nfwui:RadioButton id="carNoInputFlgHoyu" name="carNoInputFlg" value="<%= CodeConstant.CAR_HOYU %>" label="保有している" />
                                      <nfwui:RadioButton id="carNoInputFlgNotHoyu" name="carNoInputFlg" value="<%= CodeConstant.CAR_YOTEI %>" label="購入を予定している" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarName" code="<%= MessageIdConstant.SKF2020_SC003_CAR_NAME %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.carName)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarNo" code="<%= MessageIdConstant.SKF2020_SC003_CAR_NO %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.carNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarExceptionDate" code="<%= MessageIdConstant.SKF2020_SC003_CAR_EXCEPTION_DATE %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.carExpirationDate)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarUser" code="<%= MessageIdConstant.SKF2020_SC003_CAR_USER %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.carUser)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblParkingUseDate" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_USE_DATE %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.parkingUseDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="6"><nfwui:LabelBox id="lbl2ndCar" code="<%= MessageIdConstant.SKF2020_SC003_2ND_CAR %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarFlag2" code="<%= MessageIdConstant.SKF2020_SC003_CAR_FLAG %>" /></th>
                                    <td>
                                    <nfwui:RadioButtonGroup id="carNoInputFlg2">
                                      <nfwui:RadioButton id="carNoInputFlgHoyu2" name="carNoInputFlg2" value="<%= CodeConstant.CAR_HOYU %>" label="保有している" />
                                      <nfwui:RadioButton id="carNoInputFlgNotHoyu2" name="carNoInputFlg2" value="<%= CodeConstant.CAR_YOTEI %>" label="購入を予定している" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarName2" code="<%= MessageIdConstant.SKF2020_SC003_CAR_NAME %>" /></th>
                                    <td>
                                      ${f:h(form.carName2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarNo2" code="<%= MessageIdConstant.SKF2020_SC003_CAR_NO %>" /></th>
                                    <td>
                                      ${f:h(form.carNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarExceptionDate2" code="<%= MessageIdConstant.SKF2020_SC003_CAR_EXCEPTION_DATE %>" /></th>
                                    <td>
                                      ${f:h(form.carExpirationDate2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblCarUser2" code="<%= MessageIdConstant.SKF2020_SC003_CAR_USER %>" /></th>
                                    <td>
                                      ${f:h(form.carUser2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblParkingUseDate2" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_USE_DATE %>" /></th>
                                    <td>
                                      ${f:h(form.parkingUseDate2)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="5"><nfwui:LabelBox id="lblNowShataku" code="<%= MessageIdConstant.SKF2020_SC003_NOW_SHATAKU %>" /></th>
                                    <th colspan="2"><label></label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="nowShataku">
                                      <nfwui:RadioButton id="nowShatakuHoyu" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_HOYU %>" label="保有（会社借上含む）" />
                                      <nfwui:RadioButton id="nowShatakuJitaku" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JITAKU %>" label="自宅" />
                                      <nfwui:RadioButton id="nowShatakuJikoKariage" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JIKO_KARIAGE %>" label="自己借上" />
                                      <nfwui:RadioButton id="nowShatakuOther" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_OTHERS %>" label="その他" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNowShatakuName" code="<%= MessageIdConstant.SKF2020_SC003_NOW_SHATAKU_NAME %>" /></th>
                                    <td>${form.nowShatakuName}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNowShatakuNo" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_NO %>" /></th>
                                    <td>
                                    ${f:h(form.nowShatakuNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNowShatakuKikaku" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_KIKAKU %>" /></th>
                                    <td>
                                    ${f:h(form.nowShatakuKikaku)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNowShatakuMenseki" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_MENSEKI %>" /></th>
                                    <td>
                                    ${f:h(form.nowShatakuMenseki)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="2"><nfwui:LabelBox id="lblParking" code="<%= MessageIdConstant.SKF2020_SC003_PARKING %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblParking1stCar" code="<%= MessageIdConstant.SKF2020_SC003_1ST_CAR %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingPlace1" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_PLACE %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.parking1stPlace)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblParking2ndCar" code="<%= MessageIdConstant.SKF2020_SC003_2ND_CAR %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingPlace2" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_PLACE %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.parking2stPlace)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblTokushuJijo" code="<%= MessageIdConstant.SKF2020_SC003_TOKUSHU_JIJO %>" /></th>
                                    <td colspan="2">
                                    ${form.tokushuJijo}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblHoyuShataku" code="<%= MessageIdConstant.SKF2020_SC003_HOYU_SHATAKU %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="taikyoYotei">
                                      <nfwui:RadioButton id="taikyoYoteiTaikyo" name="taikyoYotei" value="<%= CodeConstant.LEAVE %>" label="退居する" />
                                      <nfwui:RadioButton id="taikyoYoteiKeizoku" name="taikyoYotei" value="<%= CodeConstant.NOT_LEAVE %>" label="継続使用する" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblTaikyoYoteiDate" code="<%= MessageIdConstant.SKF2020_SC003_TAIKYO_YOTEI_DATE %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.taikyoYoteiDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblShatakuStatus" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_STATUS %>" /></th>
                                    <td colspan="2">
                                    ${form.shatakuJotai}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblTaikyoRiyu" code="<%= MessageIdConstant.SKF2020_SC003_TAIKYO_RIYU %>" /></th>
                                    <td colspan="2">
                                    ${form.taikyoRiyu}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblTaikyogoRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC003_TAIKYOGO_RENRAKU_SAKI %>" /></th>
                                    <td colspan="2">
                                    ${form.taikyogoRenrakuSaki}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblReturnBihin" code="<%= MessageIdConstant.SKF2020_SC003_RETURN_EQUIPMENT %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.returnEquipment)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblSessionDay" code="<%= MessageIdConstant.SKF2020_SC003_SESSION_DAY %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.sessionDay)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblRenrakuSaki" code="<%= MessageIdConstant.SKF2020_SC003_RENRAKU_SAKI %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.renrakuSaki)}
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                        </div>

                        <div class="imui-form-container-wide" >
                        <table class="imui-form-search-condition-blue">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                            <tbody>
                            <div class="imui-chapter-title-blue"style="margin-bottom: 10px;"><h2>承認者入力欄</h2></div>
                                <tr>
                                    <th rowspan="23"><nfwui:LabelBox id="lblShatakuInfo" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_INFO %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewShozaichi" code="<%= MessageIdConstant.SKF2020_SC003_NEW_SHOZAICHI %>" /></th>
                                    <td colspan="2" style="min-width: 400px;">
                                        ${f:h(form.newShozaichi)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewShatakuName" code="<%= MessageIdConstant.SKF2020_SC003_NEW_SHATAKU_NAME %>" /></th>
                                    <td colspan="2">
                                        ${form.newShatakuName}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewShatakuNo" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_NO %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewShatakuKikaku" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_KIKAKU %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuKikaku)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewShatakuMenseki" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_MENSEKI %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuMenseki)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewRental" code="<%= MessageIdConstant.SKF2020_SC003_NEW_RENTAL %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newRental)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNewKyoekihi" code="<%= MessageIdConstant.SKF2020_SC003_NEW_KYOEKIHI %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.newKyoekihi)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblNyukyoKanoDate" code="<%= MessageIdConstant.SKF2020_SC003_NYUKYO_KANO_DATE %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.nyukyoKanoDate)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5"><nfwui:LabelBox id="lblRyochoJichiKaicho" code="<%= MessageIdConstant.SKF2020_SC003_RYOCHO_JICHIKAICHO %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageShataku" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_SHATAKU %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.manegeShatakuNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageName" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_NAME %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.manegeName1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageMailAddress" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_MAIL_ADDRESS %>" /></th>
                                    <td colspan="2">
                                      ${f:h(form.manegeMailAddress1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageTel" code="<%= MessageIdConstant.SKF2020_SC003_TEL %>" /></th>
                                    <td colspan="2">
                                      ${f:h(form.manegeTelNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageExtensionNo" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_EXTENSION_NO %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeExtensionNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5"><nfwui:LabelBox id="lblKeyManager" code="<%= MessageIdConstant.SKF2020_SC003_KEY_MANAGER %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageShataku2" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_SHATAKU %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.manegeShatakuNo2)}
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageName2" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_NAME %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeName2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageMailAddress2" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_MAIL_ADDRESS %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeMailAddress2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageTel2" code="<%= MessageIdConstant.SKF2020_SC003_TEL %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeTelNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageExtensionNo2" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_EXTENSION_NO %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeExtensionNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5"><nfwui:LabelBox id="lblShatakuManager" code="<%= MessageIdConstant.SKF2020_SC003_SHATAKU_MANAGER %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageShataku3" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_SHATAKU %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeShatakuNo3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageName3" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_NAME %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeName3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageMailAddress3" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_MAIL_ADDRESS %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeMailAddress3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageTel3" code="<%= MessageIdConstant.SKF2020_SC003_TEL %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeTelNo3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblManageExtensionNo3" code="<%= MessageIdConstant.SKF2020_SC003_MANAGE_EXTENSION_NO %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeExtensionNo3)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="8"><nfwui:LabelBox id="lblParkingInfo" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_INFO %>" /></th>
                                    <th rowspan="4"><nfwui:LabelBox id="lblNew1stCar" code="<%= MessageIdConstant.SKF2020_SC003_1ST_CAR %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingAddress" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_ADDRESS %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.parkingAddress1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblCarIchiNo" code="<%= MessageIdConstant.SKF2020_SC003_CAR_ICHI_NO %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.carIchiNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingRental" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_RENTAL %>" /></th>
                                    <td colspan="2" vertical-align="middle">
                                        ${f:h(form.parkingRental1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingStartDate" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_START_DATE %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.parking1StartDate)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblNew2ndCar" code="<%= MessageIdConstant.SKF2020_SC003_2ND_CAR %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingAddress2" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_ADDRESS %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.parkingAddress2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblCarIchiNo2" code="<%= MessageIdConstant.SKF2020_SC003_CAR_ICHI_NO %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.carIchiNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingRental2" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_RENTAL %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.parkingRental2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><nfwui:LabelBox id="lblParkingStartDate2" code="<%= MessageIdConstant.SKF2020_SC003_PARKING_START_DATE %>" /></th>
                                    <td colspan="2">
                                    ${f:h(form.parking2StartDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblBihinKiboShinsei" code="<%= MessageIdConstant.SKF2020_SC003_BIHIN_KIBO %>" /></th>
                                    <th colspan="2"><label></label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="bihinKibo">
                                      <nfwui:RadioButton id="bihinKiboKano" name="bihinKibo" value="<%= CodeConstant.BIHIN_KIBO_SHINSEI_HITSUYO %>" label="可" disabledPatterns="TeijiNG" />
                                      <nfwui:RadioButton id="bihinKiboFukano" name="bihinKibo" value="<%= CodeConstant.BIHIN_KIBO_SHINSEI_FUYO %>" label="不可" disabledPatterns="TeijiNG" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblBihinName" code="<%= MessageIdConstant.SKF2020_SC003_NAME %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblBihinGender" code="<%= MessageIdConstant.SKF2020_SC003_GENDER %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.gender)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblBihinHitsuyoShataku" code="<%= MessageIdConstant.SKF2020_SC003_BIHIN_HITSUYO_SHATAKU %>" /></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="bihinHitsuyoShataku">
                                      <nfwui:RadioButton id="newHitsuyoShatakuSetai" name="bihinHitsuyoShataku" value="<%= CodeConstant.SETAI %>" label="世帯" />
                                      <nfwui:RadioButton id="newHitsuyoShatakuTanshin" name="bihinHitsuyoShataku" value="<%= CodeConstant.TANSHIN %>" label="単身" />
                                      <nfwui:RadioButton id="newHitsuyoShatakuDokushin" name="bihinHitsuyoShataku" value="<%= CodeConstant.DOKUSHIN %>" label="独身" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
<imart:condition validity="<%= String.valueOf(form.isBihinVisible()) %>" >
<div id="bihinKiboList">
                        <table class="imui-form-search-condition-blue">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                            <tbody>
                                <tr>
                                    <th colspan="3"></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblBihinStatus" code="<%= MessageIdConstant.SKF2020_SC003_BIHIN_STATUS %>" /></th>
                                    <th colspan="1"><nfwui:LabelBox id="lblBihinWish" code="<%= MessageIdConstant.SKF2020_SC003_BIHIN_WISH %>" /></th>
                                </tr>
<c:forEach var="bihinObj" items="${form.bihinShinseiList }">
                                <tr>
                                    <th colspan="3"><label>${f:h(bihinObj.bihinName)}</label></th>
                                    <td colspan="1"><label>${f:h(bihinObj.bihinState)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish${f:h(bihinObj.bihinCd)}" name="bihinWish${f:h(bihinObj.bihinCd)}" list="${bihinObj.dropDown}" disabled="${bihinObj.disabled}" />
                                    </td>
                                </tr>
</c:forEach>
                            </tbody>
                        </table>
</div>
</imart:condition>
                        </div>
                        
                        <div class="imui-form-container-wide" >
                        <nfwui:Title id="title" code="<%= MessageIdConstant.SKF2020_SC003_TITLE_COMMENT %>" titleLevel="2" />
                        <table class="imui-form-search-condition">
                        <colgroup span="1" style= "width:140px;">
                            <tbody>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2020_SC003_COMMENT %>" /></th>
                                    <td colspan="1">
                                        <imui:textArea id="commentNote" name="commentNote" rows="4" cols="118" placeholder="修正依頼/差戻し理由" style="max-width: 700px;"></imui:textArea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </td>
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                      <table>
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                            <nfwui:Title id="titleOperationGuide" code="<%= MessageIdConstant.SKF2020_SC003_OPERATION_GUIDE %>" titleLevel="2" />
                        <div style="overflow-y:scroll;height:99%">
                            ${form.operationGuide}
                        </div>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<div class="imui-box-layout">
    <table style="width:100%;">
    <tbody>
<tr>
<td align="left">
            <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="550"
          parameter="applNo:applNo" formId="form"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</td> 
<td align="right">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn" value="修正依頼"
       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
       title="<%= MessageIdConstant.SKF2020_SC003_CONFIRM_TITLE %>"
       message="<%= MessageIdConstant.SKF2020_SC003_REVISION_MSG %>"
       url="skf/Skf2020Sc003/Revision" />
</td>
</tr>
    </tbody>

        <tbody>

<tr>
<td align="left">
</td> 
<td align="right">

           <nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           use="popup" popupWidth="780" popupHeight="700"
           parameter="applNo:popApplNo,applId:popApplId" modalMode="true" 
           screenUrl="skf/Skf2010Sc009/init" formId="form" />
      <nfwui:ConfirmButton id="remandBtn" name="remandBtn" value="差戻し"
       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
       title="<%= MessageIdConstant.SKF2020_SC003_CONFIRM_TITLE %>"
       message="<%= MessageIdConstant.SKF2020_SC003_REMAND_MSG %>"
       url="skf/Skf2020Sc003/Remand" />
      <nfwui:Button id="confirmBtn" name="confirmBtn" value="提示内容を確認"
       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
       url="skf/Skf2020Sc003/Confirm" disabledPatterns="TeijiNG" />
</td>
</tr>
    </tbody>

    </table>
</nfwui:Form>
    </div>
  </div>
	<!-- コンテンツエリア　ここまで -->