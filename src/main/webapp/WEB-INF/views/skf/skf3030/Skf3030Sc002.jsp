<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<%-- コンテンツエリア --%>
<script type="text/javascript">
	function back1() {
		var url="skf/Skf3030Sc001/init?SKF3030_SC001&tokenCheck=0"
		nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
	}
</script>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3030_SC002 %>" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3030Sc001/init?SKF3030_SC001&tokenCheck=0" />
		<!-- ** サーバー連携用 ** -->
		<!-- 使用料パターンID -->	<input type="hidden" name="hdnSiyouryoId" id="hdnSiyouryoId" value="${form.hdnSiyouryoId}" />
		<!-- JSON可変ラベルリスト -->	<input type="hidden" name="jsonLabelList" id="jsonLabelList"/>
		<!-- JSON備品情報 -->		<input type="hidden" name="jsonBihin" id="jsonBihin" />
		<!-- 入退居区分 -->		<input type="hidden" name="hdnNyutaikyoKbn" id="hdnNyutaikyoKbn" value="${form.hdnNyutaikyoKbn }"/>
		<!-- 生年月日 -->			<input type="hidden" name="hdnBirthday" id="hdnBirthday" value="${form.hdnBirthday }"/>
		<!-- 入居予定日 -->		<input type="hidden" name="hdnNyukyoDate" id="hdnNyukyoDate" value="${form.hdnNyukyoDate }"/>
		<!-- 退居予定日 -->		<input type="hidden" name="hdnTaikyoDate" id="hdnTaikyoDate" value="${form.hdnTaikyoDate }"/>
		<!-- 利用開始日1 -->		<input type="hidden" name="hdnRiyouStartDayOne" id="hdnRiyouStartDayOne" value="${form.hdnRiyouStartDayOne }"/>
		<!-- 利用開始日2 -->		<input type="hidden" name="hdnRiyouStartDayTwo" id="hdnRiyouStartDayTwo" value="${form.hdnRiyouStartDayTwo }"/>
<%-- 		<!-- 区画1管理番号 -->		<input type="hidden" name="hdnChushajoNoOne" id="hdnChushajoNoOne" value="${form.HdnChushajoKanriNo1 }"/> --%>
		<!-- 旧区画1管理番号 -->	<input type="hidden" name="hdnChushajoNoOneOld" id="hdnChushajoNoOneOld" value="${form.hdnChushajoNoOneOld }"/>
<%-- 		<!-- 区画2管理番号 -->		<input type="hidden" name="hdnChushajoNoTwo" id="hdnChushajoNoTwo" value="${form.hdnChushajoKanriNo2 }"/> --%>
		<!-- 旧区画2管理番号 -->	<input type="hidden" name="hdnChushajoNoTwoOld" id="hdnChushajoNoTwoOld" value="${form.hdnChushajoNoTwoOld }"/>
		<!-- 区画１ 終了日 -->		<input type="hidden" name="hdnEndDayOne" id="hdnEndDayOne" value="${form.hdnEndDayOne }"/>
		<!-- 区画2終了日 -->		<input type="hidden" name="hdnEndDayTwo" id="hdnEndDayTwo" value="${form.hdnEndDayTwo }"/>
		<!-- 区画１更新日 -->		<input type="hidden" name="hdnShatakuParkingBlock1UpdateDate" id="hdnShatakuParkingBlock1UpdateDate" value="${form.hdnShatakuParkingBlock1UpdateDate }"/>
		<!-- 区画番号1 -->		<input type="hidden" name="hdnKukakuNoOne" id="hdnKukakuNoOne" value="${form.hdnKukakuNoOne }"/>
		<!-- 区画番号2 -->		<input type="hidden" name="hdnKukakuNoTwo" id="hdnKukakuNoTwo" value="${form.hdnKukakuNoTwo }"/>
		<!-- 協議中フラグ状態 -->	<input type="hidden" name="sc006KyoekihiKyogichuCheckState" id="sc006KyoekihiKyogichuCheckState" value="${form.sc006KyoekihiKyogichuCheck }"/>
		<!-- 処理状態 -->			<input type="hidden" name="sc006Status" id="sc006Status" value="${form.sc006Status }"/>
		<!-- 戻るボタンMSG -->		<input type="hidden" name="litMessageBack" id="litMessageBack" value="${form.litMessageBack }"/>
		<!-- 作成完了ボタンMSG -->	<input type="hidden" name="litMessageCreate" id="litMessageCreate" value="${form.litMessageCreate }"/>
		<!-- 一時保存ボタンMSG -->	<input type="hidden" name="litMessageTmpSave" id="litMessageTmpSave" value="${form.litMessageTmpSave }"/>
		<!-- 台帳登録ボタンMSG -->	<input type="hidden" name="litMessageShatakuLogin" id="litMessageShatakuLogin" value="${form.litMessageShatakuLogin }"/>
		<!-- ** 使用料計算非表示項目：パラメータ ** -->
		<!--  -->	<input type="hidden" name="hdnRentalPatternId" id="hdnRentalPatternId" value="${form.hdnRentalPatternId }"/>
		<!--  -->	<input type="hidden" name="hdnChushajoKanriNo1" id="hdnChushajoKanriNo1" value="${form.hdnChushajoKanriNo1 }"/>
		<!--  -->	<input type="hidden" name="hdnChushajoKanriNo2" id="hdnChushajoKanriNo2" value="${form.hdnChushajoKanriNo2 }"/>
		<!--  -->	<input type="hidden" name="hdnNengetsu" id="hdnNengetsu" value="${form.hdnNengetsu }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterShatakuShiyoryoHiwariKingaku" id="hdnKaiSanAfterShatakuShiyoryoHiwariKingaku" value="${form.hdnKaiSanAfterShatakuShiyoryoHiwariKingaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo" id="hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo" value="${form.hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku" id="hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku" value="${form.hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterShatakuShiyoryoGetsugaku" id="hdnKaiSanAfterShatakuShiyoryoGetsugaku" value="${form.hdnKaiSanAfterShatakuShiyoryoGetsugaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterShatakuShiyoryoGetsugakuChoseigo" id="hdnKaiSanAfterShatakuShiyoryoGetsugakuChoseigo" value="${form.hdnKaiSanAfterShatakuShiyoryoGetsugakuChoseigo }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterKukaku1ChushajoShiyoroGetsugaku" id="hdnKaiSanAfterKukaku1ChushajoShiyoroGetsugaku" value="${form.hdnKaiSanAfterKukaku1ChushajoShiyoroGetsugaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku" id="hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku" value="${form.hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterKukaku2ChushajoShiyoroGetsugaku" id="hdnKaiSanAfterKukaku2ChushajoShiyoroGetsugaku" value="${form.hdnKaiSanAfterKukaku2ChushajoShiyoroGetsugaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku" id="hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku" value="${form.hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku }"/>
		<!--  -->	<input type="hidden" name="hdnKaiSanAfterKojinFutanKyoekihiGetsugakuChoseigo" id="hdnKaiSanAfterKojinFutanKyoekihiGetsugakuChoseigo" value="${form.hdnKaiSanAfterKojinFutanKyoekihiGetsugakuChoseigo }"/>
		<!--  -->	<input type="hidden" name="hdnSougoRiyouFlg" id="hdnSougoRiyouFlg" value="${form.hdnSougoRiyouFlg }"/>

		<!-- ** 次月予約登録：パラメータ ** -->
		<!-- 提示番号 -->			<input type="hidden" name="hdnJigetuYoyakuTeijiNo" id="hdnJigetuYoyakuTeijiNo" value="${form.hdnJigetuYoyakuTeijiNo }"/>
		<!-- 基準年月 -->			<input type="hidden" name="hdnJigetuYoyakuYearMonth" id="hdnJigetuYoyakuYearMonth" value="${form.hdnJigetuYoyakuYearMonth }"/>
		<!-- 社宅管理台帳ID -->	<input type="hidden" name="hdnJigetuYoyakuShatakuKanriId" id="hdnJigetuYoyakuShatakuKanriId" value="${form.hdnJigetuYoyakuShatakuKanriId }"/>
		<!-- 社宅使用料月額 -->	<input type="hidden" name="hdnJigetuYoyakuRental" id="hdnJigetuYoyakuRental" value="${form.hdnJigetuYoyakuRental }"/>
		<!-- 個人負担共益費月額 -->	<input type="hidden" name="hdnJigetuYoyakuKyoekihiPerson" id="hdnJigetuYoyakuKyoekihiPerson" value="${form.hdnJigetuYoyakuKyoekihiPerson }"/>
		<!-- 駐車場1月額 -->		<input type="hidden" name="hdnJigetuYoyakuParkingRentalOne" id="hdnJigetuYoyakuParkingRentalOne" value="${form.hdnJigetuYoyakuParkingRentalOne }"/>
		<!-- 駐車場2月額 -->		<input type="hidden" name="hdnJigetuYoyakuParkingRentalTwo" id="hdnJigetuYoyakuParkingRentalTwo" value="${form.hdnJigetuYoyakuParkingRentalTwo }"/>

		<!-- ** 社宅管理台帳：パラメータ ** -->
		<!-- 社宅名 -->			<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.sc006ShatakuName}" />
		<!-- 社宅管理番号 -->		<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
		<!-- 部屋管理番号 -->		<input type="hidden" name="hdnRoomKanriNo" id="hdnRoomKanriNo" value="${form.hdnShatakuRoomKanriNo }" />
		<!-- 部屋管理番号 -->		<input type="hidden" name="hdnShatakuRoomKanriNo" id="hdnShatakuRoomKanriNo" value="${form.hdnShatakuRoomKanriNo }" />
		<!-- 部屋番号 -->			<input type="hidden" name="hdnRoomNo" id="hdnRoomNo" value="${form.sc006HeyaNo }" />
		<!-- 社宅管理台帳ID -->	<input type="hidden" name="hdnShatakuKanriId" id="hdnShatakuKanriId" value="${form.hdnShatakuKanriId }" />
		<!-- 管理会社コード -->		<input type="hidden" name="hdnCompanyCode" id="hdnCompanyCode" value="${form.hdnCompanyCode }" />
		<!-- 締め処理実行区分 -->	<input type="hidden" name="hdnBillingActKbn" id="hdnBillingActKbn" value="${form.hdnBillingActKbn }" />

		<!-- ** 駐車場入力支援：パラメータ(下記以外に社宅管理番号、社宅名もパラメータ) ** -->
		<!-- 利用開始日 -->		<input type="hidden" name="hdnRiyouStartDay" id="hdnRiyouStartDay" value="" />

		<!-- ** 駐車場入力支援：戻り値 ** -->
		<!-- 区画番号 -->			<input type="hidden" name="hdnParkingShienParkBlock" id="hdnParkingShienParkBlock" value="" />
		<!-- 駐車場管理番号 -->	<input type="hidden" name="hdnParkingShienParkNo" id="hdnParkingShienParkNo" value="" />
		<!-- 駐車場使用料月額 -->	<input type="hidden" name="hdnParkingShienParkRentalAsjust" id="hdnParkingShienParkRentalAsjust" value="" />
		<!-- 終了日 -->			<input type="hidden" name="hdnParkingShienEndDay" id="hdnParkingShienEndDay" value="" />

		<!-- ** 使用料計算入力支援：パラメータ(下記以外に社宅管理番号、部屋管理番号もパラメータ) ** -->
		<!-- 社員番号 -->			<input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.hdnShainNo }" />
		<!-- 社員番号 -->			<!-- <input type="hidden" name="hdnShainNo" id="hdnShainNo" value="K0000089" /> -->
		<!-- 役員区分 -->			<input type="hidden" name="hdnYakuinKbn" id="hdnYakuinKbn" value="${form.sc006YakuinSanteiSelect }" />
		<!-- 社宅賃貸料 -->		<input type="hidden" name="hdnShatakuChintairyo" id="hdnShatakuChintairyo" value="${form.sc006ChintaiRyo }" />
		<!-- 提示データフラグ -->		<input type="hidden" name="hdnTeijiFlag" id="hdnTeijiFlag" value="true" /><!-- 「true」固定 -->
		<!-- 申請書類管理番号 -->	<input type="hidden" name="hdnSyoruiKanriNo" id="hdnSyoruiKanriNo" value="${form.hdnShoruikanriNo }" />

		<!-- ** 使用料計算入力支援：戻り値 & パラメータ(部屋情報) ** -->
		<!-- 規格 -->				<input type="hidden" name="hdnRateShienKikaku" id="hdnRateShienKikaku" value="${form.hdnRateShienKikaku}" />
		<!-- 用途 -->				<input type="hidden" name="hdnRateShienYoto" id="hdnRateShienYoto" value="${form.hdnRateShienYoto}" />
		<!-- 延べ面積 -->			<input type="hidden" name="hdnRateShienNobeMenseki" id="hdnRateShienNobeMenseki" value="${form.hdnRateShienNobeMenseki}" />
		<!-- 基準面積 -->			<input type="hidden" name="hdnRateShienKijunMenseki" id="hdnRateShienKijunMenseki" value="${form.hdnRateShienKijunMenseki}" /><!-- 基準使用料算定上延べ面積 -->
		<!-- 社宅面積 -->			<input type="hidden" name="hdnRateShienShatakuMenseki" id="hdnRateShienShatakuMenseki" value="${form.hdnRateShienShatakuMenseki}" /><!-- 社宅使用料算定上延べ面積 -->

		<!-- ** 使用料計算入力支援：戻り値 ** -->
		<!-- 規格名 -->			<input type="hidden" name="hdnRateShienKikakuName" id="hdnRateShienKikakuName" value="${form.hdnRateShienKikakuName}" />
		<!-- 用途名 -->			<input type="hidden" name="hdnRateShienYotoName" id="hdnRateShienYotoName" value="${form.hdnRateShienYotoName}" />
		<!-- サンルーム面積 -->		<input type="hidden" name="hdnRateShienSunroomMenseki" id="hdnRateShienSunroomMenseki" value="${form.hdnRateShienSunroomMenseki}" />
		<!-- 階段面積 -->			<input type="hidden" name="hdnRateShienKaidanMenseki" id="hdnRateShienKaidanMenseki" value="${form.hdnRateShienKaidanMenseki}" />
		<!-- 物置面積 -->			<input type="hidden" name="hdnRateShienMonookiMenseki" id="hdnRateShienMonookiMenseki" value="${form.hdnRateShienMonookiMenseki}" />
		<!-- 単価 -->				<input type="hidden" name="hdnRateShienTanka" id="hdnRateShienTanka" value="${form.hdnRateShienTanka}" />
		<!-- 経年 -->				<input type="hidden" name="hdnRateShienKeinen" id="hdnRateShienKeinen" value="${form.hdnRateShienKeinen}" />
		<!-- 経年残価率 -->		<input type="hidden" name="hdnRateShienKeinenZankaRitsu" id="hdnRateShienKeinenZankaRitsu" value="${form.hdnRateShienKeinenZankaRitsu}" />
		<!-- 使用料パターン名 -->	<input type="hidden" name="hdnRateShienPatternName" id="hdnRateShienPatternName" value="${form.hdnRateShienPatternName}" />
		<!-- 使用料パターン月額 -->	<input type="hidden" name="hdnRateShienPatternGetsugaku" id="hdnRateShienPatternGetsugaku" value="${form.hdnRateShienPatternGetsugaku}" />
		<!-- 社宅使用料月額 -->	<input type="hidden" name="hdnRateShienShatakuGetsugaku" id="hdnRateShienShatakuGetsugaku" value="${form.hdnRateShienShatakuGetsugaku}" />
		<!-- 社宅基本使用料 -->	<input type="hidden" name="hdnRateShienKihonShiyoryo" id="hdnRateShienKihonShiyoryo" value="${form.hdnRateShienKihonShiyoryo}" />

		<!-- 社員名入力支援用 -->
		<input type="hidden" name="insertFormName" id="insertFormName" value="" />
		<input type="hidden" name="callbackFlag" id="callbackFlag" value="" />
		<input type="hidden" name="shainNo" id="shainNo" value="" />
		<input type="hidden" name="hdnShainName" id="hdnShainName" value="${form.hdnShainName}" />
		
		<nfwui:Table use="search">
			<tbody>
				<tr>
					<!-- 社員番号-->
					<th style="width: 8%;">
<!--						<label style="width:60px;"></label> -->
						<nfwui:LabelBox id="lblSc006ShainNo" code="<%=MessageIdConstant.SKF3022_SC006_SHAIN_NO %>" />
					</th>
					<td style="width: 10%;">
						<label id="sc006ShainNo" name="sc006ShainNo">${form.sc006ShainNo }</label>
					</td>
					<!-- 社員入力-->
					<td style="width: 7%;">
						<nfwui:PopupButton id="sc006ShinseiNaiyo" name="sc006ShinseiNaiyo" value="社員入力支援" use="popup"
							cssClass="imui-small-button" popupWidth="650" popupHeight="700"
							modalMode="true" screenUrl="skf/Skf2010Sc001/init"
							disabled="${form.sc006ShinseiNaiyoDisableFlg }"
							preOnclick="setShainShienPreparation(0)"  tabindex="3"/> 
					</td>
					<!-- 社宅名 -->
					<th style="width: 8%;">
					<!--	<label style="width:60px;">社宅名</label> -->
						<nfwui:LabelBox id="lblSc006ShatakuName" code="<%=MessageIdConstant.SKF3022_SC006_SHATAKU_NAME %>" />
					</th>
					<td style="width: 15%;">
						<label id="sc006ShatakuName" name="sc006ShatakuName">${form.sc006ShatakuName }</label>
					</td>
					<!-- 貸与規格 -->
					<th style="width: 11%;">
					<!--	<label style="width:100px;">貸与規格</label> -->
						<nfwui:LabelBox id="lblSc006SiyoryoPatName" code="<%=MessageIdConstant.SKF3022_SC006_SIYORYO_PAT_NAME %>" />
					</th>
					<td colspan="2" style="width: 15%;">
						<label id="sc006SiyoryoPatName" name="sc006SiyoryoPatName">${form.sc006SiyoryoPatName }</label>
					</td>
					<td style="width: 3%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
					<!-- 対象年月 -->
					<th style="width: 7%;text-align:center;">
					<!--	<label style="width:60px;text-align:center;">対象年月</label> -->
						<nfwui:LabelBox id="lblSc006TaishoNengetsu" code="<%=MessageIdConstant.SKF3030_SC002_TAISHO_NENGETU %>" style="text-align:center;" />
					</th>
					<!-- 社宅提示 -->
					<th style="width: 7%;text-align:center;white-space: nowrap;">
					<!--	<label style="width:60px;text-align:center;">社宅提示</label> -->
						<nfwui:LabelBox id="lblSc006ShatakuStts" code="<%=MessageIdConstant.SKF3022_SC006_SHATAKU_STTS %>" style="text-align:center;" />
					</th>
					<!-- 備品提示 -->
					<th style="width: 7%;text-align:center;white-space: nowrap;">
					<!--	<label style="width:60px;text-align:center;">備品提示</label> -->
						<nfwui:LabelBox id="lblSc006BihinStts" code="<%=MessageIdConstant.SKF3022_SC006_BIHIN_STTS %>" style="text-align:center;" />
					</th>
					<td style="width: 2%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
				</tr>
				<tr>
					<!-- 社員氏名-->
					<th>
						<!-- <label style="width:60px;">社員氏名</label> -->
						<nfwui:LabelBox id="lblSc006ShainName" code="<%=MessageIdConstant.SKF3022_SC006_SHAIN_NAME %>" />
					</th>
					<td colspan="2">
						<label id="sc006ShainName" name="sc006ShainName">${form.sc006ShainName }</label>
					</td>
					<!-- 部屋番号-->
					<th>
						<!-- <label style="width:60px;">部屋番号</label> -->
						<nfwui:LabelBox id="lblSc006HeyaNo" code="<%=MessageIdConstant.SKF3022_SC006_HEYA_NO %>"/>
					</th>
					<td style="width: 9%;">
						<label id="sc006HeyaNo" name="sc006HeyaNo">${form.sc006HeyaNo }</label>
					</td>
					<!-- 社宅使用料月額-->
					<th>
						<nfwui:LabelBox id="lblSc006SiyoryoMonthPay" code="<%=MessageIdConstant.SKF3022_SC006_SIYORYO_MONTH_PAY %>" />
					</th>
					<td style="width: 9%;">
						<label id="sc006SiyoryoMonthPay" name="sc006SiyoryoMonthPay">${form.sc006SiyoryoMonthPay }</label>
					</td>
					<td style="width: 6%;">
						<nfwui:PopupButton id="shiyoryoShien" name="shiyoryoShien" value="使用料入力支援" use="popup" 
								cssClass="imui-small-button" popupWidth="800" popupHeight="700"  
								modalMode="true" screenUrl="skf/Skf3022Sc003/init" preOnclick="setShiyoryoShienParam()"
								parameter="hdnShatakuKanriNo:hdnShatakuKanriNo,hdnRoomKanriNo:hdnRoomKanriNo,hdnShainNo:hdnShainNo,hdnYakuinKbn:hdnYakuinKbn,hdnShatakuChintairyo:hdnShatakuChintairyo,hdnTeijiFlag:hdnTeijiFlag,hdnSyoruiKanriNo:hdnSyoruiKanriNo,hdnRateShienKikaku:hdnRateShienKikaku,hdnRateShienYoto:hdnRateShienYoto,hdnRateShienNobeMenseki:hdnRateShienNobeMenseki,hdnRateShienKijunMenseki:hdnRateShienKijunMenseki,hdnRateShienShatakuMenseki:hdnRateShienShatakuMenseki"
								disabled="${form.shiyoryoShienDisableFlg }" callbackFunc="shiyoryoShienCallback()" tabindex="5"/> 
					</td>
					<td style="border:none; background-color:#ffffff; box-shadow:none;" ></td>
					<!-- 対象年月-->
					<td style="text-align:center;">
						<label id="sc006TaishoNengetsu" name="sc006TaishoNengetsu" style="text-align:center;">
							${form.sc006TaishoNengetsu }
						</label>
					</td>
					<!-- 社宅提示-->
					<td style="text-align:center;">
						<label id="sc006ShatakuStts" name="sc006ShatakuStts" style="text-align:center;${form.sc006ShatakuSttsColor }">
							${form.sc006ShatakuStts }
						</label>
					</td>
					<!-- 備品提示-->
					<td style="text-align:center;">
						<label id="sc006BihinStts" name="sc006BihinStts" style="text-align:center;${form.sc006BihinSttsColor }">
							${form.sc006BihinStts }
						</label>
					</td>
				</tr>
			</tbody>
		</nfwui:Table>
		<div id="tabs">
			<ul>
				<li><a href="#shataku_info">社宅情報</a></li>
				<li><a href="#bihin_info">備品情報</a></li>
				<li><a href="#officer_info">役員情報／相互利用情報</a></li>
			</ul>
			<div id="shataku_info">
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<!-- 入居者情報 -->
							<th rowspan="2" style="width: 10%;">
								<!-- <label style="width:115px;">入居者情報</label> -->
								<nfwui:LabelBox id="lblSc006NyukyoShaInfo" code="<%=MessageIdConstant.SKF3022_SC006_NYUKYO_SHAINFO %>" />
							</th>
							<!-- 原籍会社 -->
							<th style="width: 20%;">
								<!-- <label style="width:198px;">原籍会社名</label> -->
								<nfwui:LabelBox id="lblSc006OldKaisyaName" code="<%=MessageIdConstant.SKF3022_SC006_OLD_KAISYA_NAME %>" />
							</th>
							<td style="width: 20%;">
								<imui:select id="sc006OldKaisyaNameSelect" name="sc006OldKaisyaNameSelect" width="160" disabled="${form.sc006OldKaisyaNameSelectDisableFlg }"
								list="${form.sc006OldKaisyaNameSelectList}" class="${form.sc006OldKaisyaNameSelectErr}" tabindex="6" />
							</td>
							<!-- 貸与駐車場 -->
							<th rowspan="12" style="width: 10%;">
								<!-- <label style="width:100px;">貸与駐車場</label> -->
								<nfwui:LabelBox id="lblSc006TaiyoTyusyajou" code="<%=MessageIdConstant.SKF3022_SC006_TAIYO_TYUSYAJOU %>" />
							</th>
							<!-- 区画1 -->
							<th rowspan="5" style="width: 8%;">
								<!-- <label style="width:100px;">区画1</label> -->
								<nfwui:LabelBox id="lblSc006KukakuOne" code="<%=MessageIdConstant.SKF3022_SC006_KUKAKU_ONE %>" />
								&nbsp;
								<nfwui:PopupButton id="parkingShien1" name="parkingShien1" value="支援" use="popup" 
										cssClass="imui-small-button" popupWidth="650" popupHeight="700"  
										modalMode="true" screenUrl="skf/Skf3022Sc002/init" preOnclick="setParkingShienParam(1)"
										parameter="hdnShatakuKanriNo:hdnShatakuKanriNo,hdnShatakuName:hdnShatakuName,hdnRiyouStartDay:hdnRiyouStartDay"
										disabled="${form.parkingShien1DisableFlg }" callbackFunc="parkingShienCallback(1)" tabindex="17"/> 
								<br/>&nbsp;
								<imui:button id="clearParking1" name="clearParking1" value="クリア" disabled="${form.clearParking1DisableFlg }"
																			class="imui-small-button" onclick="clearParking(1)" tabindex="18" />
							</th>
							<!-- 区画番号1 -->
							<th style="width: 14%;">
								<!-- <label style="width:130px;">区画番号</label> -->
								<nfwui:LabelBox id="lblSc006KukakuNoOne" code="<%=MessageIdConstant.SKF3022_SC006_KUKAKU_NO_ONE %>" />
							</th>
							<td style="width: 18%;">
								<!-- <div style="width:185px;"> -->
								<label id="sc006KukakuNoOne" name="sc006KukakuNoOne">${form.sc006KukakuNoOne }</label>
							</td>
							<!-- <td style="width:38%;border:none;"></td> -->
						</tr>
						<tr>
							<!-- 給与支給会社名 -->
							<th>
								<nfwui:LabelBox id="lblSc006KyuyoKaisya" code="<%=MessageIdConstant.SKF3022_SC006_KYUYO_KAISYA %>" />
							</th>
							<td>
								<imui:select id="sc006KyuyoKaisyaSelect" name="sc006KyuyoKaisyaSelect" width="160" disabled="${form.sc006KyuyoKaisyaSelectDisableFlg }"
								list="${form.sc006KyuyoKaisyaSelectList}" class="${form.sc006KyuyoKaisyaSelectErr}" tabindex="7" />
							</td>
							<!-- 利用開始日1 -->
							<th>
								<nfwui:LabelBox id="lblSc006RiyouStartDayOne" code="<%=MessageIdConstant.SKF3022_SC006_RIYOU_START_DAY_ONE %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006RiyouStartDayOne" name="sc006RiyouStartDayOne" value="${f:h(form.sc006RiyouStartDayOne)}"
								disabled="${form.sc006RiyouStartDayOneDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006RiyouStartDayOneErr }" tabindex="19"/>
							</td>
						</tr>
						<tr>
							<!-- 貸与社宅 -->
							<th rowspan="15">
								<nfwui:LabelBox id="lblSc006TaiyoShataku" code="<%=MessageIdConstant.SKF3022_SC006_TAIYO_SHATAKU %>" />
							</th>
							<!-- 入居予定日 -->
							<th>
								<nfwui:LabelBox id="lblSc006NyukyoYoteiDay" code="<%=MessageIdConstant.SKF3022_SC006_NYUKYO_YOTEI_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006NyukyoYoteiDay" name="sc006NyukyoYoteiDay" value="${f:h(form.sc006NyukyoYoteiDay)}"
									disabled="${form.sc006NyukyoYoteiDayDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006NyukyoYoteiDayErr }" tabindex="8"/>
							</td>
							<!-- 利用終了日1 -->
							<th>
								<nfwui:LabelBox id="lblSc006RiyouEndDayOne" code="<%=MessageIdConstant.SKF3022_SC006_RIYOU_END_DAY_ONE %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006RiyouEndDayOne" name="sc006RiyouEndDayOne" value="${f:h(form.sc006RiyouEndDayOne)}"
								disabled="${form.sc006RiyouEndDayOneDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006RiyouEndDayOneErr }" tabindex="20"/>
							</td>
						</tr>
						<tr>
							<!-- 退居予定日 -->
							<th>
								<nfwui:LabelBox id="lblSc006TaikyoYoteiDay" code="<%=MessageIdConstant.SKF3022_SC006_TAIKYO_YOTEI_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006TaikyoYoteiDay" name="sc006TaikyoYoteiDay" value="${f:h(form.sc006TaikyoYoteiDay)}"
												disabled="${form.sc006TaikyoYoteiDayDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006TaikyoYoteiDayErr }" tabindex="9"/>
							</td>
							<!-- 駐車場使用料月額1 -->
							<th>
								<nfwui:LabelBox id="lblSc006TyusyaMonthPayOne" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYA_MONTH_PAY_ONE %>" />
							</th>
							<td>
								<label id="sc006TyusyaMonthPayOne" name="sc006TyusyaMonthPayOne">${form.sc006TyusyaMonthPayOne }</label>&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 居住者区分 -->
							<th>
								<nfwui:LabelBox id="lblSc006KyojyusyaKbn" code="<%=MessageIdConstant.SKF3022_SC006_KYOJYUSYA_KBN %>" />
							</th>
							<td>
								<imui:select id="sc006KyojyusyaKbnSelect" name="sc006KyojyusyaKbnSelect" width="160"
								disabled="${form.sc006KyojyusyaKbnSelectDisableFlg }" list="${form.sc006KyojyusyaKbnSelectList}" class="${form.sc006KyojyusyaKbnSelectErr}" tabindex="10" />
							</td>
							<!-- 駐車場使用料日割金額1 -->
							<th style="white-space: nowrap;">
								<nfwui:LabelBox id="lblSc006TyusyaDayPayOne" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYA_DAY_PAY_ONE %>" />
							</th>
							<td>
								<label id="sc006TyusyaDayPayOne" name="sc006TyusyaDayPayOne">${form.sc006TyusyaDayPayOne }</label>&nbsp;円
							</td>
						</tr>
						<tr>
							<!--貸与用途-->
							<th>
								<nfwui:LabelBox id="lblSc006TaiyoYouto" code="<%=MessageIdConstant.SKF3022_SC006_TAIYO_YOUTO %>" />
							</th>
							<td>
								<label id="sc006TaiyoYouto" name="sc006TaiyoYouto">${form.sc006TaiyoYouto }</label>
							</td>
							<!-- 区画2 -->
							<th rowspan="5">
								<nfwui:LabelBox id="lblSc006KukakuTwo" code="<%=MessageIdConstant.SKF3022_SC006_KUKAKU_TWO %>" />
								&nbsp;
								<nfwui:PopupButton id="parkingShien2" name="parkingShien2" value="支援" use="popup" 
										cssClass="imui-small-button" popupWidth="650" popupHeight="700"  
										modalMode="true" screenUrl="skf/Skf3022Sc002/init" preOnclick="setParkingShienParam(2)"
										parameter="hdnShatakuKanriNo:hdnShatakuKanriNo,hdnShatakuName:hdnShatakuName,hdnRiyouStartDay:hdnRiyouStartDay" 
										disabled="${form.parkingShien2DisableFlg }" callbackFunc="parkingShienCallback(2)" tabindex="21"/> 
								<br />&nbsp;
								<imui:button id="clearParking2" name="clearParking2" value="クリア"
										disabled="${form.clearParking2DisableFlg }" class="imui-small-button" onclick="clearParking(2)" tabindex="22" />
							</th>
							<!-- 区画番号2 -->
							<th>
								<nfwui:LabelBox id="lblSc006KukakuNoTwo" code="<%=MessageIdConstant.SKF3022_SC006_KUKAKU_NO_TWO %>" />
							</th>
							<td>
								<label id="sc006KukakuNoTwo" name="sc006KukakuNoTwo">${form.sc006KukakuNoTwo }</label>
							</td>
						</tr>
						<tr>
							<!-- 貸与規格 -->
							<th>
								<nfwui:LabelBox id="lblSc006TaiyoKikaku" code="<%=MessageIdConstant.SKF3022_SC006_TAIYO_KIKAKU %>" />
							</th>
							<td>
								<label id="sc006TaiyoKikaku" name="sc006TaiyoKikaku">${form.sc006TaiyoKikaku }</label>
							</td>
							<!-- 利用開始日2 -->
							<th>
								<nfwui:LabelBox id="lblSc006RiyouStartDayTwo" code="<%=MessageIdConstant.SKF3022_SC006_RIYOU_START_DAY_TWO %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006RiyouStartDayTwo" name="sc006RiyouStartDayTwo" value="${f:h(form.sc006RiyouStartDayTwo)}"
								disabled="${form.sc006RiyouStartDayTwoDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006RiyouStartDayTwoErr }" tabindex="23"/>
							</td>
						</tr>
						<tr>
							<!-- 役員算定 -->
							<th>
								<nfwui:LabelBox id="lblSc006YakuinSantei" code="<%=MessageIdConstant.SKF3022_SC006_YAKUIN_SANTEI %>" />
							</th>
							<td>
								<imui:select id="sc006YakuinSanteiSelect" name="sc006YakuinSanteiSelect" width="90"
								disabled="${form.sc006YakuinSanteiSelectDisableFlg }" list="${form.sc006YakuinSanteiSelectList}" class="${form.sc006YakuinSanteiSelectErr}" tabindex="11" />
							</td>
							<!-- 利用終了日2 -->
							<th>
								<nfwui:LabelBox id="lblSc006RiyouEndDayTwo" code="<%=MessageIdConstant.SKF3022_SC006_RIYOU_END_DAY_TWO %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006RiyouEndDayTwo" name="sc006RiyouEndDayTwo" value="${f:h(form.sc006RiyouEndDayTwo)}"
								disabled="${form.sc006RiyouEndDayTwoDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006RiyouEndDayTwoErr }" tabindex="24"/>
							</td>
						</tr>
						<tr>
							<!-- 社宅使用料月額 -->
							<th>
								<nfwui:LabelBox id="lblSc006ShiyoryoTsukigaku" code="<%=MessageIdConstant.SKF3022_SC006_SHIYORYO_TSUKIGAKU %>" />
							</th>
							<td>
								<label id="sc006ShiyoryoTsukigaku" name="sc006ShiyoryoTsukigaku">${form.sc006ShiyoryoTsukigaku }</label>&nbsp;円
							</td>
							<!-- 駐車場使用料月額2 -->
							<th>
								<nfwui:LabelBox id="lblSc006TyusyaMonthPayTwo" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYA_MONTH_PAY_TWO %>" />
							</th>
							<td>
								<label id="sc006TyusyaMonthPayTwo" name="sc006TyusyaMonthPayTwo">${form.sc006TyusyaMonthPayTwo }</label>&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 社宅使用料日割金額 -->
							<th>
								<nfwui:LabelBox id="lblSc006SiyoryoHiwariPay" code="<%=MessageIdConstant.SKF3022_SC006_SIYORYO_HIWARI_PAY %>" />
							</th>
							<td>
								<label id="sc006SiyoryoHiwariPay" name="sc006SiyoryoHiwariPay">${form.sc006SiyoryoHiwariPay }</label>&nbsp;円
							</td>
							<!-- 駐車場使用料日割金額 2-->
							<th>
								<nfwui:LabelBox id="lblSc006TyusyaDayPayTwo" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYA_DAY_PAY_TWO %>" />
							</th>
							<td>
								<label id="sc006TyusyaDayPayTwo" name="sc006TyusyaDayPayTwo">${form.sc006TyusyaDayPayTwo }</label>&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 社宅使用料調整金額 -->
							<th>
								<nfwui:LabelBox id="lblSc006SiyoroTyoseiPay" code="<%=MessageIdConstant.SKF3022_SC006_SIYORO_TYOSEI_PAY %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006SiyoroTyoseiPay" name="sc006SiyoroTyoseiPay" max="999999" min="-999999"
									cssClass="${form.sc006SiyoroTyoseiPayErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006SiyoroTyoseiPay}" disabled="${form.sc006SiyoroTyoseiPayDisableFlg }" tabindex="12" />&nbsp;円
							</td>
							<!-- 駐車場使用料調整金額 -->
							<th colspan="2">
								<nfwui:LabelBox id="lblSc006TyusyaTyoseiPay" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYA_TYOSEI_PAY %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006TyusyaTyoseiPay" name="sc006TyusyaTyoseiPay" max="999999" min="-999999"
									cssClass="${form.sc006TyusyaTyoseiPayErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006TyusyaTyoseiPay}" disabled="${form.sc006TyusyaTyoseiPayDisableFlg }" tabindex="25" />&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 社宅使用料月額(調整後) -->
							<th>
								<nfwui:LabelBox id="lblSc006SyatauMonthPayAfter" code="<%=MessageIdConstant.SKF3022_SC006_SYATAU_MONTH_PAY_AFTER %>" />
							</th>
							<td>
								<label id="sc006SyatauMonthPayAfter" name="sc006SyatauMonthPayAfter">${form.sc006SyatauMonthPayAfter }</label>&nbsp;円
							</td>
							<!-- 駐車場使用料月額(調整後) -->
							<th colspan="2">
								<nfwui:LabelBox id="lblSc006TyusyaMonthPayAfter" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYA_MONTH_PAY_AFTER %>" />
							</th>
							<td>
								<label id="sc006TyusyaMonthPayAfter" name="sc006TyusyaMonthPayAfter">${form.sc006TyusyaMonthPayAfter }</label>&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 個人負担共益費月額 -->
							<th>
								<nfwui:LabelBox id="lblSc006KyoekihiMonthPay" code="<%=MessageIdConstant.SKF3022_SC006_KYOEKIHI_MONTH_PAY %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006KyoekihiMonthPay" name="sc006KyoekihiMonthPay" max="999999" min="-999999"
									cssClass="${form.sc006KyoekihiMonthPayErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006KyoekihiMonthPay}" disabled="${form.sc006KyoekihiMonthPayDisableFlg }" tabindex="14" />&nbsp;円
							</td>
							<!-- 備考 -->
							<th rowspan="4">
								<nfwui:LabelBox id="lblSc006Bicou" code="<%=MessageIdConstant.SKF3022_SC006_BICOU %>" />
							</th>
							<td rowspan="4" colspan="3">
								<imui:textArea id="sc006Bicou" name="sc006Bicou" rows="6" clols="35" maxlength="400"
									style="width:425px;" value="${form.sc006Bicou}" disabled="${form.sc006BicouDisableFlg }" tabindex="26" />
							</td>
						</tr>
						<tr>
							<!-- 個人負担共益費調整金額 -->
							<th>
								<nfwui:LabelBox id="lblSc006KyoekihiTyoseiPay" code="<%=MessageIdConstant.SKF3022_SC006_KYOEKIHI_TYOSEI_PAY %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006KyoekihiTyoseiPay" name="sc006KyoekihiTyoseiPay" max="999999" min="-999999"
									cssClass="${form.sc006KyoekihiTyoseiPayErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006KyoekihiTyoseiPay}" disabled="${form.sc006KyoekihiTyoseiPayDisableFlg }" tabindex="15" />&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 個人負担共益費月額(調整後) -->
							<th>
								<nfwui:LabelBox id="lblSc006KyoekihiPayAfter" code="<%=MessageIdConstant.SKF3022_SC006_KYOEKIHI_PAY_AFTER %>" />
							</th>
							<td>
								<label id="sc006KyoekihiPayAfter" name="sc006KyoekihiPayAfter">${form.sc006KyoekihiPayAfter }</label>&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 共益費支払月 -->
							<th>
								<nfwui:LabelBox id="lblSc006KyoekihiPayMonth" code="<%=MessageIdConstant.SKF3022_SC006_KYOEKIHI_PAY_MONTH %>" />
							</th>
							<td>
								<imui:select id="sc006KyoekihiPayMonthSelect" name="sc006KyoekihiPayMonthSelect" width="80"
								disabled="${form.sc006KyoekihiPayMonthSelectDisableFlg }" list="${form.sc006KyoekihiPayMonthSelectList}" class="${form.sc006KyoekihiPayMonthSelectErr}" tabindex="16" />
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
			<div id="bihin_info">
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<!-- <td style="width: 35%;border:none;"> -->
							<td style="width:575px;border:none;">
								<imui:listTable id="bihinInfoList" process="jssp" autoEncode="false" autoWidth="false" rowNumbers="true" autoResize="false" 
										onCellSelect="onCellSelect" multiSelect="false" data="${form.bihinInfoListTableData }" style="max-height: 800px;" height="auto">
									<cols sortable="false">
										<col name="rId" caption="RelativeID" hidden="true" key="true"/>
										<col name="bihinCd" caption="備品コード" hidden="true" />
										<col name="bihinName" caption="備品名称" width="200" sortable="false" align="left" wrap="true" />
										<col name="heyaSonaetukeSttsStr" caption="部屋備付状態" width="100" sortable="false" align="center" wrap="true" />
										<col name="bihinTaiyoStts" caption="備品貸与状態" width="100" sortable="false" align="center" wrap="true" />
										<col name="bihinStatusOld" caption="旧備品状態" hidden="true" />
										<col name="updateDate" caption="更新日時" hidden="true" />
										<col name="updateFlg" caption="更新フラグ" hidden="true" />
										<col name="heyaSonaetukeStts" caption="部屋備付状態区分(DB取得値)" hidden="true" />
										<col name="bihinTaiyoSttsKbn" caption="備品貸与状態選択値" hidden="true" />
									</cols>
								</imui:listTable>
							</td>
							<td style="width: 5px; border:none; background-color:#ffffff; box-shadow:none;" ></td>
							<!-- <td style="width: 80%;border:none;"> -->
							<td style="width:530px;border:none;white-space: nowrap;">
								<nfwui:Table use="search">
									<tbody>
										<tr>
											<!-- 貸与日 -->
											<th colspan="2" style="width:250px">
												<nfwui:LabelBox id="lblSc006TaiyoDay" code="<%=MessageIdConstant.SKF3022_SC006_TAIYO_DAY %>" />
											</th>
											<td style="width:250px">
												<nfwui:DateBox id="sc006TaiyoDay" name="sc006TaiyoDay" value="${f:h(form.sc006TaiyoDay)}"
												disabled="${form.sc006TaiyoDayDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006TaiyoDayErr }" tabindex="27"/>
											</td>
										</tr>
										<tr>
											<!-- 返却日 -->
											<th colspan="2">
												<nfwui:LabelBox id="lblSc006HenkyakuDay" code="<%=MessageIdConstant.SKF3022_SC006_HENKYAKU_DAY %>" />
											</th>
											<td>
												<nfwui:DateBox id="sc006HenkyakuDay" name="sc006HenkyakuDay" value="${f:h(form.sc006HenkyakuDay)}"
												disabled="${form.sc006HenkyakuDayDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006HenkyakuDayErr }" tabindex="28"/>
											</td>
										</tr>
										<tr>
											<!-- 搬入 -->
											<th rowspan="5" style="width:100px;">
												<nfwui:LabelBox id="lblSc006HannyuDay" code="<%=MessageIdConstant.SKF3022_SC006_HANNYU_DAY %>" />
											</th>
											<!-- 搬入希望日時 -->
											<th style="width:150px">
												<nfwui:LabelBox id="lblSc006KibouDayTimeIn" code="<%=MessageIdConstant.SKF3022_SC006_KIBOU_DAY_TIME_IN %>" />
											</th>
											<td>
												<nfwui:DateBox id="sc006KibouDayIn" name="sc006KibouDayIn" value="${f:h(form.sc006KibouDayIn)}"
												disabled="${form.sc006KibouDayInDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006KibouDayInErr }" tabindex="29"/>
												<imui:select id="sc006KibouTimeInSelect" name="sc006KibouTimeInSelect" width="158"
												disabled="${form.sc006KibouTimeInSelectDisableFlg }" list="${form.sc006KibouTimeInSelectList}" class="${form.sc006KibouTimeInSelectErr}" tabindex="30" />
											</td>
										</tr>
										<tr>
											<!-- 搬入本人連絡先 -->
											<th>
												<nfwui:LabelBox id="lblSc006HonninAddrIn" code="<%=MessageIdConstant.SKF3022_SC006_HONNIN_ADDR_IN %>" />
											</th>
											<td>
												<imui:textbox id="sc006HonninAddrIn" name="sc006HonninAddrIn" style="width:283px;"
												maxlength="15" value="${f:h(form.sc006HonninAddrIn)}" tabindex="31" disabled="${form.sc006HonninAddrInDisableFlg }"
												class="${form.sc006HonninAddrInErr}" placeholder="例　090-0000-0000"/>
											</td>
										</tr>
										<tr>
											<!-- 受取代理人 -->
											<th>
												<nfwui:LabelBox id="lblSc006UketoriDairiIn" code="<%=MessageIdConstant.SKF3022_SC006_UKETORI_DAIRI_IN %>" />
											</th>
											<!-- 受取代理人名 -->
											<td>
												<!-- <input type="text" style="100px;" /> -->
												<imui:textbox id="sc006UketoriDairiInName" name="sc006UketoriDairiInName" style="width:178px;"
												maxlength="30" value="${f:h(form.sc006UketoriDairiInName)}" tabindex="32" disabled="${form.sc006UketoriDairiInNameDisableFlg }"
												class="${form.sc006UketoriDairiInNameErr}" placeholder="例　中日本　太郎"/>
												<nfwui:PopupButton id="sc006UketoriDairiInShien" name="sc006UketoriDairiInShien" value="社員入力支援" use="popup"
													cssClass="imui-small-button" popupWidth="650" popupHeight="700"
													modalMode="true" screenUrl="skf/Skf2010Sc001/init"
													disabled="${form.sc006UketoriDairiInShienDisableFlg }"
													preOnclick="setShainShienPreparation(1)" tabindex="33"/> 
											</td>
										</tr>
										<tr>
											<!-- 受取代理人連絡先 -->
											<th>
												<nfwui:LabelBox id="lblSc006UketoriDairiAddr" code="<%=MessageIdConstant.SKF3022_SC006_UKETORI_DAIRI_ADDR %>" />
											</th>
											<td>
												<!-- <input class="ime-off" type="text" style="width:244px;"/> -->
												<imui:textbox id="sc006UketoriDairiAddr" name="sc006UketoriDairiAddr" style="width:283px;"
												maxlength="15" value="${f:h(form.sc006UketoriDairiAddr)}" tabindex="34" disabled="${form.sc006UketoriDairiAddrDisableFlg }"
												class="${form.sc006UketoriDairiAddrErr}" placeholder="例　090-0000-0000"/>
											</td>
										</tr>
										<tr>
											<!-- レンタル指示書発行日 -->
											<th>
												<nfwui:LabelBox id="lblHannyuRentalBihinShijishoZenkaiHakkoubi" code="<%=MessageIdConstant.SKF3030_SC002_RENTAL_SHIJISHO_HAKKOUBI %>" />
											</th>
											<td>
												${f:h(form.sc006HannyuShijisyoHakkoubi)}
											</td>
										</tr>
										<tr>
											<!-- 搬出 -->
											<th rowspan="5">
												<nfwui:LabelBox id="lblSc006Hansyutu" code="<%=MessageIdConstant.SKF3022_SC006_HANSYUTU %>" />
											</th>
											<!-- 搬出希望日時 -->
											<th>
												<nfwui:LabelBox id="lblSc006KibouDayTimeOut" code="<%=MessageIdConstant.SKF3022_SC006_KIBOU_DAY_TIME_OUT %>" />
											</th>
											<td>
												<nfwui:DateBox id="sc006KibouDayOut" name="sc006KibouDayOut" value="${f:h(form.sc006KibouDayOut)}"
												disabled="${form.sc006KibouDayOutDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006KibouDayOutErr }" tabindex="35"/>
												<imui:select id="sc006KibouTimeOutSelect" name="sc006KibouTimeOutSelect" width="158" disabled="${form.sc006KibouTimeOutSelectDisableFlg }"
												list="${form.sc006KibouTimeOutSelectList}" class="${form.sc006KibouTimeOutSelectErr}" tabindex="36" />
											</td>
										</tr>
										<tr>
											<!-- 搬出本人連絡先 -->
											<th>
												<nfwui:LabelBox id="lblSc006HonninAddrOut" code="<%=MessageIdConstant.SKF3022_SC006_HONNIN_ADDR_OUT %>" />
											</th>
											<td>
												<!-- <input class="ime-off" type="text" style="width:244px;" disabled/> -->
												<imui:textbox id="sc006HonninAddrOut" name="sc006HonninAddrOut" style="width:283px;"
												maxlength="15" value="${f:h(form.sc006HonninAddrOut)}" tabindex="37" disabled="${form.sc006HonninAddrOutDisableFlg }"
												class="${form.sc006HonninAddrOutErr}" placeholder="例　090-0000-0000"/>
											</td>
										</tr>
										<tr>
											<!-- 搬出立会代理人 -->
											<th>
												<nfwui:LabelBox id="lblSc006TachiaiDairi" code="<%=MessageIdConstant.SKF3022_SC006_TACHIAI_DAIRI %>" />
											</th>
											<td>
												<!-- <input class="ime-off" type="text" style="100px;" disabled/> -->
												<imui:textbox id="sc006TachiaiDairi" name="sc006TachiaiDairi" style="width:178px;"
												maxlength="30" value="${f:h(form.sc006TachiaiDairi)}" tabindex="38" disabled="${form.sc006TachiaiDairiDisableFlg }"
												class="${form.sc006TachiaiDairiErr}" placeholder="例　中日本　太郎"/>
												<!-- <input type="button" value="社員入力支援" class="imui-small-button" disabled/> -->
												<nfwui:PopupButton id="sc006TachiaiDairiShien" name="sc006TachiaiDairiShien" value="社員入力支援" use="popup"
													cssClass="imui-small-button" popupWidth="650" popupHeight="700"
													modalMode="true" screenUrl="skf/Skf2010Sc001/init"
													disabled="${form.sc006TachiaiDairiShienDisableFlg }"
													preOnclick="setShainShienPreparation(2)" tabindex="39"/> 
											</td>
										</tr>
										<tr>
											<!-- 搬出立会代理人連絡先 -->
											<th>
												<nfwui:LabelBox id="lblSc006TachiaiDairiAddr" code="<%=MessageIdConstant.SKF3022_SC006_TACHIAI_DAIRI_ADDR %>" />
											</th>
											<td>
												<!-- <input class="ime-off" type="text" style="width:244px;" disabled/> -->
												<imui:textbox id="sc006TachiaiDairiAddr" name="sc006TachiaiDairiAddr" style="width:283px;"
												maxlength="15" value="${f:h(form.sc006TachiaiDairiAddr)}" tabindex="40"
												class="${form.sc006TachiaiDairiAddrErr}" disabled="${form.sc006TachiaiDairiAddrDisableFlg }" placeholder="例　090-0000-0000"/>
											</td>
										</tr>
										<tr>
											<!-- レンタル指示書発行日 -->
											<th>
												<nfwui:LabelBox id="lblHanshutsuRentalBihinShijishoZenkaiHakkoubi" code="<%=MessageIdConstant.SKF3030_SC002_RENTAL_SHIJISHO_HAKKOUBI %>" />
											</th>
											<td>
												${f:h(form.sc006HanshutuShijisyoHakkoubi)}
											</td>
										</tr>
										<tr>
											<!-- 代理人備考 -->
											<th rowspan="3">
												<!-- <label style="width:100px;">代理人備考</label> -->
												<nfwui:LabelBox id="lblSc006DairiBiko" code="<%=MessageIdConstant.SKF3022_SC006_DAIRI_BIKO %>" />
											</th>
											<td rowspan="3" colspan="2">
												<!-- <textarea style="width:450px;" rows="5"></textarea> -->
												<imui:textArea id="sc006DairiBiko" name="sc006DairiBiko" rows="5" maxlength="100"
													style="width:470px;" value="${form.sc006DairiBiko}" disabled="${form.sc006DairiBikoDisableFlg }" tabindex="41" />
											</td>
										</tr>
										<tr style="display:table-row;"></tr>
										<tr style="display:table-row;"></tr>
										<tr>
											<!-- 備品備考 -->
											<th rowspan="3">
												<nfwui:LabelBox id="lblSc006BihinBiko" code="<%=MessageIdConstant.SKF3022_SC006_BIHIN_BIKO %>" />
											</th>
											<td rowspan="3" colspan="2">
												<!-- <textarea style="width:450px;" rows="5"></textarea> -->
												<imui:textArea id="sc006BihinBiko" name="sc006BihinBiko" rows="5" maxlength="400"
													style="width:470px;" value="${form.sc006BihinBiko}" disabled="${form.sc006BihinBikoDisableFlg }" tabindex="42" />
											</td>
										</tr>
										<tr style="display:table-row;"></tr>
										<tr style="display:table-row;"></tr>
									</tbody>
								</nfwui:Table>
							</td>
							<td style="width: 40%; border:none; background-color:#ffffff; box-shadow:none;" ></td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
			<div id="officer_info">
				<nfwui:Table use="search">
					<tbody>
						<tr >
							<!-- 相互利用協定 -->
							<th rowspan="9">
								<!-- <label style="width:115px">相互利用協定</label> -->
								<nfwui:LabelBox id="lblSc006SougoRiyouKyotei" code="<%=MessageIdConstant.SKF3022_SC006_SOUGO_RIYOU_KYOTEI %>" />
							</th>
							<!-- 管理会社 -->
							<th>
								<!-- <label style="width:198px">管理会社</label> -->
								<nfwui:LabelBox id="lblSc006KanriKaisya" code="<%=MessageIdConstant.SKF3022_SC006_KANRI_KAISYA %>" />
							</th>
							<td>
								<!-- <div style="width:200px;">NEXCO中日本</div> -->
								<label id="sc006KanriKaisya" name="sc006KanriKaisya">${form.sc006KanriKaisya }</label>
							</td>
							<!-- 配属データ -->
							<th rowspan="5">
								<!-- <label style="width:100px;">配属データ</label> -->
								<nfwui:LabelBox id="lblSc006HaizokuData" code="<%=MessageIdConstant.SKF3022_SC006_HAIZOKU_DATA %>" />
							</th>
							<!-- 配属会社名 -->
							<th>
								<!-- <label style="width:125px;">配属会社名</label> -->
								<nfwui:LabelBox id="lblSc006HaizokuKaisya" code="<%=MessageIdConstant.SKF3022_SC006_HAIZOKU_KAISYA %>" />
							</th>
							<td>
								<imui:select id="sc006HaizokuKaisyaSelect" name="sc006HaizokuKaisyaSelect" width="185"
								disabled="${form.sc006HaizokuKaisyaSelectDisableFlg }" list="${form.sc006HaizokuKaisyaSelectList}"
																		class="${form.sc006HaizokuKaisyaSelectErr}" tabindex="54" />
							</td>
							<!-- <td style="width:40%;border:none;"></td> -->
						</tr>
						<tr>
							<!-- 相互利用状況 -->
							<th>
								<nfwui:LabelBox id="lblSc006SogoRyojokyo" code="<%=MessageIdConstant.SKF3030_SC002_SOUGORIYO_JOKYO %>" />
							</th>
							<td>
								<imui:select id="sc006SogoRyojokyoSelect" name="sc006SogoRyojokyoSelect" width="60"
								disabled="${form.sc006SogoRyojokyoSelectDisableFlg }" list="${form.sc006SogoRyojokyoSelectList}"
																		class="${form.sc006SogoRyojokyoSelectErr}" tabindex="43" />
							</td>
							<!-- 所属機関 -->
							<th>
								<nfwui:LabelBox id="lblSc006SyozokuKikan" code="<%=MessageIdConstant.SKF3022_SC006_SYOZOKU_KIKAN %>" />
							</th>
							<td>
								<!-- <input type="text" style="width:306px;"/> -->
								<imui:textbox id="sc006SyozokuKikan" name="sc006SyozokuKikan" style="width:305;height:98%"
								disabled="${form.sc006SyozokuKikanDisableFlg }" maxlength="30" value="${f:h(form.sc006SyozokuKikan)}" tabindex="55"
								class="${form.sc006SyozokuKikanErr}" placeholder="例　○○会社"/>
							</td>
						</tr>
						<tr>
							<!-- 貸付会社 -->
							<th>
								<nfwui:LabelBox id="lblSc006TaiyoKaisya" code="<%=MessageIdConstant.SKF3022_SC006_TAIYO_KAISYA %>" />
							</th>
							<td>
								<imui:select id="sc006TaiyoKaisyaSelect" name="sc006TaiyoKaisyaSelect" width="185"
								disabled="${form.sc006TaiyoKaisyaSelectDisableFlg }" list="${form.sc006TaiyoKaisyaSelectList}"
																	class="${form.sc006TaiyoKaisyaSelectErr}" tabindex="44" />
							</td>
							<!-- 室・部名 -->
							<th>
								<nfwui:LabelBox id="lblSc006SituBuName" code="<%=MessageIdConstant.SKF3022_SC006_SITU_BU_NAME %>" />
							</th>
							<td>
								<!-- <input type="text" style="width:306px;"/> -->
								<imui:textbox id="sc006SituBuName" name="sc006SituBuName" style="width:305;height:98%"
								disabled="${form.sc006SituBuNameDisableFlg }" maxlength="30" value="${f:h(form.sc006SituBuName)}" tabindex="56"
								class="${form.sc006SituBuNameErr}" placeholder="例　○○部"/>
							</td>
						</tr>
						<tr>
							<!-- 借受会社 -->
							<th>
								<nfwui:LabelBox id="lblSc006KariukeKaisya" code="<%=MessageIdConstant.SKF3022_SC006_KARIUKE_KAISYA %>" />
							</th>
							<td>
								<imui:select id="sc006KariukeKaisyaSelect" name="sc006KariukeKaisyaSelect" width="185"
								disabled="${form.sc006KariukeKaisyaSelectDisableFlg }" list="${form.sc006KariukeKaisyaSelectList}"
																		class="${form.sc006KariukeKaisyaSelectErr}" tabindex="45" />
							</td>
							<!-- 課等名 -->
							<th>
								<nfwui:LabelBox id="lblSc006KanadoMei" code="<%=MessageIdConstant.SKF3022_SC006_KANADO_MEI %>" />
							</th>
							<td>
								<imui:textbox id="sc006KanadoMei" name="sc006KanadoMei" style="width:305;height:98%"
								disabled="${form.sc006KanadoMeiDisableFlg }" maxlength="30" value="${f:h(form.sc006KanadoMei)}" tabindex="57"
								class="${form.sc006KanadoMeiErr}" placeholder="例　○○事業所"/>
							</td>
						</tr>
						<tr>
							<!-- 相互利用判定区分 -->
							<th>
								<nfwui:LabelBox id="lblSc006SogoHanteiKbn" code="<%=MessageIdConstant.SKF3022_SC006_SOGO_HANTEI_KBN %>" />
							</th>
							<td>
								<imui:select id="sc006SogoHanteiKbnSelect" name="sc006SogoHanteiKbnSelect" width="60"
								disabled="${form.sc006SogoHanteiKbnSelectDisableFlg }" list="${form.sc006SogoHanteiKbnSelectList}"
																		class="${form.sc006SogoHanteiKbnSelectErr}" tabindex="46" />
							</td>
							<!-- 配属データコード番号 -->
							<th style="white-space: nowrap;">
								<nfwui:LabelBox id="lblSc006HaizokuNo" code="<%=MessageIdConstant.SKF3022_SC006_HAIZOKU_NO %>" />
							</th>
							<td>
								<imui:textbox id="sc006HaizokuNo" name="sc006HaizokuNo" style="width:305;height:98%"
								disabled="${form.sc006HaizokuNoDisableFlg }" maxlength="30" value="${f:h(form.sc006HaizokuNo)}" tabindex="58"
								class="${form.sc006HaizokuNoErr}" placeholder="例　000000000"/>
							</td>
						</tr>
						<tr>
							<!-- 社宅使用料会社間送金区分 -->
							<th style="white-space: nowrap;">
								<nfwui:LabelBox id="lblSc006SokinShataku" code="<%=MessageIdConstant.SKF3022_SC006_SOKIN_SHATAKU %>" />
							</th>
							<td>
								<imui:select id="sc006SokinShatakuSelect" name="sc006SokinShatakuSelect" width="60"
								disabled="${form.sc006SokinShatakuSelectDisableFlg }" list="${form.sc006SokinShatakuSelectList}"
																			class="${form.sc006SokinShatakuSelectErr}" tabindex="47" />
							</td>
						</tr>
						<tr>
							<!-- 共益費会社間送付区分 -->
							<th>
								<nfwui:LabelBox id="lblSc006SokinKyoekihi" code="<%=MessageIdConstant.SKF3022_SC006_SOKIN_KYOEKIHI %>" />
							</th>
							<td>
								<imui:select id="sc006SokinKyoekihiSelect" name="sc006SokinKyoekihiSelect" width="60"
								disabled="${form.sc006SokinKyoekihiSelectDisableFlg }" list="${form.sc006SokinKyoekihiSelectList}"
																			class="${form.sc006SokinKyoekihiSelectErr}" tabindex="48" />
							</td>
						</tr>
						<tr>
							<!-- 開始日 -->
							<th>
								<nfwui:LabelBox id="lblSc006StartDay" code="<%=MessageIdConstant.SKF3022_SC006_START_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006StartDay" name="sc006StartDay" value="${f:h(form.sc006StartDay)}"
								disabled="${form.sc006StartDayDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006StartDayErr }" tabindex="49"/>
							</td>
						</tr>
						<tr>
							<!-- 終了日 -->
							<th>
								<nfwui:LabelBox id="lblSc006EndDay" code="<%=MessageIdConstant.SKF3022_SC006_END_DAY %>" />
							</th>
							<td>
								<nfwui:DateBox id="sc006EndDay" name="sc006EndDay" value="${f:h(form.sc006EndDay)}"
								disabled="${form.sc006EndDayDisableFlg }" cssStyle="width:100px" cssClass="${form.sc006EndDayErr }" tabindex="50"/>
							</td>
						</tr>
						<tr>
							<!-- 社宅賃貸料 -->
							<th colspan="2">
								<nfwui:LabelBox id="lblSc006ChintaiRyo" code="<%=MessageIdConstant.SKF3022_SC006_CHINTAI_RYO %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006ChintaiRyo" name="sc006ChintaiRyo" max="999999" min="-999999"
									cssClass="${form.sc006ChintaiRyoErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006ChintaiRyo}" disabled="${form.sc006ChintaiRyoDisableFlg }" tabindex="51" />&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 駐車場料金 -->
							<th colspan="2">
								<nfwui:LabelBox id="lblSc006TyusyajoRyokin" code="<%=MessageIdConstant.SKF3022_SC006_TYUSYAJO_RYOKIN %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006TyusyajoRyokin" name="sc006TyusyajoRyokin" max="999999" min="-999999"
									cssClass="${form.sc006TyusyajoRyokinErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006TyusyajoRyokin}" disabled="${form.sc006TyusyajoRyokinDisableFlg }" tabindex="52" />&nbsp;円
							</td>
						</tr>
						<tr>
							<!-- 共益費(事業者負担) -->
							<th colspan="2">
								<nfwui:LabelBox id="lblSc006Kyoekihi" code="<%=MessageIdConstant.SKF3022_SC006_KYOEKIHI %>" />
							</th>
							<td>
								<nfwui:NumberBox id="sc006Kyoekihi" name="sc006Kyoekihi" max="999999" min="-999999"
									cssClass="${form.sc006KyoekihiErr }" cssStyle="width: 100px;"
									maxlength="7" value="${form.sc006Kyoekihi}" disabled="${form.sc006KyoekihiDisableFlg }" tabindex="53" />&nbsp;円
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
			</div>
		</div>
		<br />
		<div class="align-L float-L">	
			<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="59" />
		</div>
		<!-- メッセージ表示判定 -->
		<label style="${form.sc006MsgBoxStyle}">
				${form.sc006Msg }
		</label>
		<div class="align-R">
			<nfwui:Button id="btnUnyonGuide" url="skf/Skf3030Sc002/OperationGuideDownload" value="運用ガイド" cssClass="imui-medium-button" cssStyle="width: 150px" tabindex="60" disabled="${form.btnUnyonGuideDisableFlg }" />
<!--			<imui:button id="btnUnyonGuide" value="運用ガイド" class="imui-medium-button" style="width: 150px" onclick="window.open('/skf/template/skf3022/skf3022mn006/運用ガイド.zip', '_blank', 'menubar=no,toolbar=no,resizable=yes,location=no,status=no');return false;" tabindex="60" disabled="${form.btnUnyonGuideDisableFlg }" /> -->
<!--			<imui:button id="btnUnyonGuide" value="運用ガイド" class="imui-medium-button" style="width: 150px" onclick="operationGuidDownLoad();" tabindex="60" disabled="${form.btnUnyonGuideDisableFlg }" /> -->
			<imui:button id="btnTmpSave" value="登録" class="imui-medium-button" style="width: 150px" onclick="sc006PreButtonEvent(0)" tabindex="61" disabled="${form.btnRegistDisableFlg }" />		</div>
		<div class="align-R">
			<nfwui:PopupButton id="btnJigetuYoyaku" name="btnJigetuYoyaku" value="次月予約" use="popup"
					cssClass="imui-medium-button" popupWidth="700" popupHeight="560"  cssStyle="width:150px;"
					modalMode="true" screenUrl="skf/Skf3022Sc004/init" preOnClick="backUpStatus();" preUrl="skf/Skf3030Sc002/PreJigetsuYoyaku"
					parameter="hdnJigetuYoyakuTeijiNo:hdnJigetuYoyakuTeijiNo,hdnJigetuYoyakuYearMonth:hdnJigetuYoyakuYearMonth,hdnJigetuYoyakuShatakuKanriId:hdnJigetuYoyakuShatakuKanriId,hdnJigetuYoyakuRental:hdnJigetuYoyakuRental,hdnJigetuYoyakuKyoekihiPerson:hdnJigetuYoyakuKyoekihiPerson,hdnJigetuYoyakuParkingRentalOne:hdnJigetuYoyakuParkingRentalOne,hdnJigetuYoyakuParkingRentalTwo:hdnJigetuYoyakuParkingRentalTwo"
					disabled="${form.btnJigetuYoyakuDisableFlg }" callbackFunc="jigetuYoyakuCallback()" tabindex="63"/> 
			<imui:button id="btnKeizokuLogin" value="削除" class="imui-medium-button" style="width: 150px" onclick="sc006PreButtonEvent(3)" tabindex="64" disabled="${form.btnDeleteDisableFlg }" />		</div>
		<br>
		<script type="text/javascript">
			(function($) {
				// 画面表示時に定義される処理
				$(document).ready(function(){

					// 運用ガイドダウンロード
					operationGuidDownLoad = function() {
						$('#downloadForm').submit();
					}

					// JSON可変ラベルリスト設定
					// 可変値ラベルをリスト形式にし、JSON文字列に変換後
					// formのhidden変数「jsonLabelList」に格納する
					sc006SetVariableLabelList = function() {
						// 可変ラベルリスト
						var labelArray = new Array();
						{
							// 可変ラベルリスト作成
							var labelMap = new Object();
							//　社員番号
							labelMap['sc006ShainNo'] = $("#sc006ShainNo").text().trim();
							//　社員名
							labelMap['sc006ShainName'] = $("#sc006ShainName").text().trim();
							// 社宅名
							labelMap['sc006ShatakuName'] = $("#sc006ShatakuName").text().trim();
							// 部屋番号
							labelMap['sc006HeyaNo'] = $("#sc006HeyaNo").text().trim();
							// 駐車場使用料月額(調整後)
							labelMap['sc006TyusyaMonthPayAfter'] = $("#sc006TyusyaMonthPayAfter").text().trim();
							// 社宅使用料日割金額
							labelMap['sc006SiyoryoHiwariPay'] = $("#sc006SiyoryoHiwariPay").text().trim();
							// 社宅使用料月額(調整後)
							labelMap['sc006SyatauMonthPayAfter'] = $("#sc006SyatauMonthPayAfter").text().trim();
							// 社宅使用料月額
							labelMap['sc006ShiyoryoTsukigaku'] = $("#sc006ShiyoryoTsukigaku").text().trim();
							// 駐車場使用料日割金額1
							labelMap['sc006TyusyaDayPayOne'] = $("#sc006TyusyaDayPayOne").text().trim();
							// 駐車場使用料月額1
							labelMap['sc006TyusyaMonthPayOne'] = $("#sc006TyusyaMonthPayOne").text().trim();
							// 駐車場使用料日割金額 2
							labelMap['sc006TyusyaDayPayTwo'] = $("#sc006TyusyaDayPayTwo").text().trim();
							// 駐車場使用料月額2
							labelMap['sc006TyusyaMonthPayTwo'] = $("#sc006TyusyaMonthPayTwo").text().trim();
							// ヘッダ項目貸与用途(使用料計算パターン名)
							labelMap['sc006SiyoryoPatName'] = $("#sc006SiyoryoPatName").text().trim();
							// 社宅使用料月額
							labelMap['sc006SiyoryoMonthPay'] = $("#sc006SiyoryoMonthPay").text().trim();
							// 貸与用途
							labelMap['sc006TaiyoYouto'] = $("#sc006TaiyoYouto").text().trim();
							// 貸与規格
							labelMap['sc006TaiyoKikaku'] = $("#sc006TaiyoKikaku").text().trim();
							// 区画１ 区画番号
							labelMap['sc006KukakuNoOne'] = $("#sc006KukakuNoOne").text().trim();
							// 区画2 区画番号
							labelMap['sc006KukakuNoTwo'] = $("#sc006KukakuNoTwo").text().trim();
							// 個人負担共益費月額(調整後)
							labelMap['sc006KyoekihiPayAfter'] = $("#sc006KyoekihiPayAfter").text().trim();
							// 利用開始日
//							labelMap['sc006RiyouStartDayOne'] = $("#sc006RiyouStartDayOne").val().trim();
//							labelMap['sc006RiyouStartDayTwo'] = $("#sc006RiyouStartDayTwo").val().trim();
							// 利用終了日
//							labelMap['sc006RiyouEndDayOne'] = $("#sc006RiyouEndDayOne").val().trim();
//							labelMap['sc006RiyouEndDayTwo'] = $("#sc006RiyouEndDayTwo").val().trim();
							//開始日
							labelMap['sc006StartDay'] = $("#sc006StartDay").val().trim();
							//終了日
							labelMap['sc006EndDay'] = $("#sc006EndDay").val().trim();
							labelArray.push(labelMap);
						}
						// 可変ラベルリストをJSON文字列に変換
						$('#jsonLabelList').val(JSON.stringify(labelArray));
					}

					// JSON備品リスト設定
					// 備品リストをJSON文字列に変換し
					// formのhidden変数「jsonBihin」に格納する
					sc006SetJsonBihinList = function() {
						// 備品情報リスト
						var bihinArray = new Array();
						{
							// 備品情報取得
							var bihinArrrows = $("#bihinInfoList").getRowData();
							// 備品行数取得
							var bihinRowNum = bihinArrrows.length;
							// 備品情報リスト作成
							for (var i = 0; i < bihinRowNum; i++) {
								var bihinMap = new Object();
								bihinMap['bihinCd'] = bihinArrrows[i].bihinCd;
								bihinMap['bihinName'] = bihinArrrows[i].bihinName;
								bihinMap['heyaSonaetukeSttsStr'] = bihinArrrows[i].heyaSonaetukeSttsStr;
								bihinMap['bihinTaiyoStts'] = $("#bihinTaiyoStatus" + i).val();
								bihinMap['bihinStatusOld'] = bihinArrrows[i].bihinStatusOld;
								bihinMap['updateFlg'] = bihinArrrows[i].updateFlg;
								bihinMap['updateDate'] = bihinArrrows[i].updateDate;
								bihinMap['heyaSonaetukeStts'] = bihinArrrows[i].heyaSonaetukeStts;
								bihinMap['bihinTaiyoSttsKbn'] = bihinArrrows[i].bihinTaiyoSttsKbn;
								bihinArray.push(bihinMap);
							}
						}
						// 備品情報リストをJSON文字列に変換
						$('#jsonBihin').val(JSON.stringify(bihinArray));
					}

					/**
					 * 使用料計算(提示データ登録内部)戻り値設定(非同期))
					 * 使用料計算の戻り値をラベルに設定する
					 *
					 * @param resultMap	使用料計算(提示データ登録画面)戻り値
					 */
					function setSiyoryoKeiSanResultAsync(resultMap) {
						// 駐車場使用料月額(調整後)
						if (resultMap['sc006TyusyaMonthPayAfter']) {
							$("#sc006TyusyaMonthPayAfter").text(resultMap.sc006TyusyaMonthPayAfter);
						}
						// 社宅使用料日割金額
						if (resultMap['sc006SiyoryoHiwariPay']) {
							$("#sc006SiyoryoHiwariPay").text(resultMap.sc006SiyoryoHiwariPay);
						}
						// 社宅使用料月額(調整後)
						if (resultMap['sc006SyatauMonthPayAfter']) {
							$("#sc006SyatauMonthPayAfter").text(resultMap.sc006SyatauMonthPayAfter);
						}
						// 社宅使用料月額
						if (resultMap['sc006ShiyoryoTsukigaku']) {
							$("#sc006ShiyoryoTsukigaku").text(resultMap.sc006ShiyoryoTsukigaku);
						}
						// 駐車場使用料日割金額1
						if (resultMap['sc006TyusyaDayPayOne']) {
							$("#sc006TyusyaDayPayOne").text(resultMap.sc006TyusyaDayPayOne);
						}
						// 駐車場使用料月額1
						if (resultMap['sc006TyusyaMonthPayOne']) {
							$("#sc006TyusyaMonthPayOne").text(resultMap.sc006TyusyaMonthPayOne);
						}
						// 駐車場使用料日割金額 2
						if (resultMap['sc006TyusyaDayPayTwo']) {
							$("#sc006TyusyaDayPayTwo").text(resultMap.sc006TyusyaDayPayTwo);
						}
						// 駐車場使用料月額2
						if (resultMap['sc006TyusyaMonthPayTwo']) {
							$("#sc006TyusyaMonthPayTwo").text(resultMap.sc006TyusyaMonthPayTwo);
						}
						
						// 共益費月額(調整後)
						if (resultMap['sc006KyoekihiPayAfter']) {
							$("#sc006KyoekihiPayAfter").text(resultMap.sc006KyoekihiPayAfter);
						}
						
						if (resultMap['hdnKaiSanAfterShatakuShiyoryoGetsugaku']) {
							$("#hdnKaiSanAfterShatakuShiyoryoGetsugaku").val(resultMap.hdnKaiSanAfterShatakuShiyoryoGetsugaku);
						}
						if (resultMap['hdnKaiSanAfterShatakuShiyoryoHiwariKingaku']) {
							$("#hdnKaiSanAfterShatakuShiyoryoHiwariKingaku").val(resultMap.hdnKaiSanAfterShatakuShiyoryoHiwariKingaku);
						}
						if (resultMap['hdnKaiSanAfterShatakuShiyoryoGetsugakuChoseigo']) {
							$("#hdnKaiSanAfterShatakuShiyoryoGetsugakuChoseigo").val(resultMap.hdnKaiSanAfterShatakuShiyoryoGetsugakuChoseigo);
						}
						if (resultMap['hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo']) {
							$("#hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo").val(resultMap.hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo);
						}
						if (resultMap['hdnKaiSanAfterKukaku1ChushajoShiyoroGetsugaku']) {
							$("#hdnKaiSanAfterKukaku1ChushajoShiyoroGetsugaku").val(resultMap.hdnKaiSanAfterKukaku1ChushajoShiyoroGetsugaku);
						}
						if (resultMap['hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku']) {
							$("#hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku").val(resultMap.hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku);
						}
						if (resultMap['hdnKaiSanAfterKukaku2ChushajoShiyoroGetsugaku']) {
							$("#hdnKaiSanAfterKukaku2ChushajoShiyoroGetsugaku").val(resultMap.hdnKaiSanAfterKukaku2ChushajoShiyoroGetsugaku);
						}
						if (resultMap['hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku']) {
							$("#hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku").val(resultMap.hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku);
						}
						if (resultMap['hdnKaiSanAfterKojinFutanKyoekihiGetsugakuChoseigo']) {
							$("#hdnKaiSanAfterKojinFutanKyoekihiGetsugakuChoseigo").val(resultMap.hdnKaiSanAfterKojinFutanKyoekihiGetsugakuChoseigo);
						}
					}

					/** 使用料計算パラメータ設定(非同期) */
					function createSiyoryoKeiSanParamAsync() {
						var map = new Object();
						map['sc006YakuinSanteiSelect'] = $("#sc006YakuinSanteiSelect").val();
						map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
						map['hdnRateShienYoto'] = $("#hdnRateShienYoto").val();
						map['hdnRateShienNobeMenseki'] = $("#hdnRateShienNobeMenseki").val();
						map['hdnRateShienSunroomMenseki'] = $("#hdnRateShienSunroomMenseki").val();
						map['hdnRateShienKaidanMenseki'] = $("#hdnRateShienKaidanMenseki").val();
						map['hdnRateShienMonookiMenseki'] = $("#hdnRateShienMonookiMenseki").val();
						map['hdnRateShienKijunMenseki'] = $("#hdnRateShienKijunMenseki").val();
						map['hdnRateShienShatakuMenseki'] = $("#hdnRateShienShatakuMenseki").val();
						map['hdnBirthday'] = $("#hdnBirthday").val();
						map['sc006ChintaiRyo'] = $("#sc006ChintaiRyo").val();
						map['sc006TyusyajoRyokin'] = $("#sc006TyusyajoRyokin").val();
						map['sc006SiyoroTyoseiPay'] = $("#sc006SiyoroTyoseiPay").val();
						map['hdnNyutaikyoKbn'] = $("#hdnNyutaikyoKbn").val();
						map['sc006NyukyoYoteiDay'] = $("#sc006NyukyoYoteiDay").val();
						map['hdnNyukyoDate'] = $("#hdnNyukyoDate").val();
						map['sc006TaikyoYoteiDay'] = $("#sc006TaikyoYoteiDay").val();
						map['sc006TyusyaDayPayOne'] = $("#sc006TyusyaDayPayOne").text();
						map['sc006TyusyaDayPayTwo'] = $("#sc006TyusyaDayPayTwo").text();
						map['sc006RiyouStartDayOne'] = $("#sc006RiyouStartDayOne").val();
						map['hdnRiyouStartDayOne'] = $("#hdnRiyouStartDayOne").val();
						map['sc006RiyouEndDayOne'] = $("#sc006RiyouEndDayOne").val();
						map['sc006RiyouStartDayTwo'] = $("#sc006RiyouStartDayTwo").val();
						map['hdnRiyouStartDayTwo'] = $("#hdnRiyouStartDayTwo").val();
						map['sc006RiyouEndDayTwo'] = $("#sc006RiyouEndDayTwo").val();
						map['sc006TyusyaTyoseiPay'] = $("#sc006TyusyaTyoseiPay").val();
						
						map['sc006KyoekihiMonthPay'] = $("#sc006KyoekihiMonthPay").val();
						map['sc006KyoekihiTyoseiPay'] = $("#sc006KyoekihiTyoseiPay").val();
						map['sc006Kyoekihi'] = $("#sc006Kyoekihi").val();
						map['hdnRentalPatternId'] = $("#hdnRentalPatternId").val();
						map['hdnChushajoKanriNo1'] = $("#hdnChushajoKanriNo1").val();
						map['hdnChushajoKanriNo2'] = $("#hdnChushajoKanriNo2").val();
						map['hdnNengetsu'] = $("#hdnNengetsu").val();
						map['hdnKaiSanAfterShatakuShiyoryoHiwariKingaku'] = $("#hdnKaiSanAfterShatakuShiyoryoHiwariKingaku").val();
						map['hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo'] = $("#hdnKaiSanAfterChushajoShiyoryoGetsugakuChoseigo").val();
						map['hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku'] = $("#hdnKaiSanAfterKukaku1ChushajoShiyoroHiwariKingaku").val();
						map['hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku'] = $("#hdnKaiSanAfterKukaku2ChushajoShiyoroHiwariKingaku").val();
						return map;
					};

					// 駐車場入力支援パラメータ設定
					setParkingShienParam = function(p) {
						// 区画判定
						if (p == 1) {
							// 利用開始日1をパラメータに設定
							$("#hdnRiyouStartDay").val($("#sc006RiyouStartDayOne").val().replace(/\//g, "").trim());
						} else {
							// 利用開始日2をパラメータに設定
							$("#hdnRiyouStartDay").val($("#sc006RiyouStartDayTwo").val().replace(/\//g, "").trim());
						}
					}

					// 社員入力支援クリック
					setShainShienPreparation = function(p) {
						// 種別判定
						if (p == 0) {
							// 社員番号入力支援
							$("#insertFormName").val("sc006ShainName");
							$("#callbackFlag").val("true");
						} else if (p == 1) {
							// 受取代理人入力支援
							$("#insertFormName").val("sc006UketoriDairiInName");
						} else {
							// 立会代理人入力支援
							$("#insertFormName").val("sc006TachiaiDairi");
						}
					}

					// 区画クリアボタン押下処理
					clearParking = function(p) {
						// 区画判定
						if (p == 1) {
							
							// パラメータ作成 
							var map = new Object();
							map['hdnNengetsu'] = $("#hdnNengetsu").val();
							map['hdnShatakuKanriId'] = $("#hdnShatakuKanriId").val();
							map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
							map['hdnChushajoKanriNo'] = $("#hdnChushajoKanriNo1").val();
							map['parkingLendNo'] = "1";
							// 使用料再計算
							nfw.common.doAjaxAction("skf/Skf3030Sc002/ParkingBlockClearCheckAsync", map, true, function(data) {
								//戻り値
								var result = data.checkResult;
								if(result == "true"){
									// 区画番号、利用開始日、利用終了日、終了日をクリア
									$("#hdnChushajoKanriNo1").val("");
									$("#hdnKukakuNoOne").val("");
									$("#hdnEndDayOne").val("");
									$("#sc006KukakuNoOne").text("");
									$("#sc006RiyouStartDayOne").val("");
									$("#sc006RiyouEndDayOne").val("");
									// 背景色をクリア
									$("#sc006RiyouStartDayOne").removeClass("nfw-validation-error");
									$("#sc006RiyouEndDayOne").removeClass("nfw-validation-error");
									// 駐車場使用料月額、駐車場使用料日割金額に0を設定
									$("#sc006TyusyaMonthPayOne").text("0");
									$("#sc006TyusyaDayPayOne").text("0");
									
									// パラメータ作成 
									var map = new Object();
									map['mapParam'] = createSiyoryoKeiSanParamAsync();
									// 使用料再計算
									nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
										// 戻り値設定(使用料再計算分)
										setSiyoryoKeiSanResultAsync(data);
									});
								}
							});

						} else {
							// パラメータ作成 
							var map = new Object();
							map['hdnNengetsu'] = $("#hdnNengetsu").val();
							map['hdnShatakuKanriId'] = $("#hdnShatakuKanriId").val();
							map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
							map['hdnChushajoKanriNo'] = $("#hdnChushajoKanriNo2").val();
							map['parkingLendNo'] = "2";
							// 使用料再計算
							nfw.common.doAjaxAction("skf/Skf3030Sc002/ParkingBlockClearCheckAsync", map, true, function(data) {
								//戻り値
								var result = data.checkResult;
								if(result == "true"){
									// 区画番号、利用開始日、利用終了日、終了日をクリア
									$("#hdnChushajoKanriNo2").val("");
									$("#hdnKukakuNoTwo").val("");
									$("#hdnEndDayTwo").val("");
									$("#sc006KukakuNoTwo").text("");
									$("#sc006RiyouStartDayTwo").val("");
									$("#sc006RiyouEndDayTwo").val("");
									// 背景色をクリア
									$("#sc006RiyouStartDayTwo").removeClass("nfw-validation-error");
									$("#sc006RiyouEndDayTwo").removeClass("nfw-validation-error");
									// 駐車場使用料月額、駐車場使用料日割金額に0を設定
									$("#sc006TyusyaMonthPayTwo").text("0");
									$("#sc006TyusyaDayPayTwo").text("0");
									
									// パラメータ作成 
									var map = new Object();
									map['mapParam'] = createSiyoryoKeiSanParamAsync();
									// 使用料再計算
									nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
										// 戻り値設定(使用料再計算分)
										setSiyoryoKeiSanResultAsync(data);
									});
								}
							});

						}
					}

					// 下部ボタン押下時のイベント
					sc006PreButtonEvent = function (mode) {
						// 押下ボタン判定
						switch (mode) {
							case 0:
								// 登録
								// 現在状態バックアップ
								backUpStatus();
								$("#sc006Status").val("0");
								//infomation.skf.i_skf_3027=すべてのタブの画面項目を登録します。よろしいですか？
								nfw.common.confirmPopup("すべてのタブの画面項目を登録します。よろしいですか？",
										"確認", "form", "skf/Skf3030Sc002/regist", "ok", "キャンセル", this, true);
								break;
// 							case 1:
// 								// 作成完了★
// 								// 現在状態バックアップ
// 								backUpStatus();
// 								$("#sc006Status").val("1");
// 								nfw.common.submitForm("form", "skf/Skf3022Sc006/SetCheckMsg");
// 								break;
// 							case 2:
// 								// 社宅管理台帳登録★
// 								// 現在状態バックアップ
// 								backUpStatus();
// 								$("#sc006Status").val("2");
// 								nfw.common.submitForm("form", "skf/Skf3022Sc006/SetCheckMsg");
// 								break;
							case 3:
								// 削除
								// 現在状態バックアップ
								backUpStatus();
								$("#sc006Status").val("");
								var mes = "社宅管理台帳データ（" +$("#sc006ShainName").text().trim() + "）を削除します。よろしいですか？";
								// 確認ダイアログ表示(infomation.skf.i_skf_3029=社宅管理台帳データ（{0}）を削除します。よろしいですか？)
								nfw.common.confirmPopup(mes,
										"確認", "form", "skf/Skf3030Sc002/delete", "ok", "キャンセル", this, true);
								break;
							default:
								$("#sc006Status").val("");
								nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
								break;
						};
					}

					// 使用料入力支援パラメータ設定
					setShiyoryoShienParam = function() {
						$("#hdnShainNo").val($("#sc006ShainNo").text().trim());
						$("hdnYakuinKbn").val($("#sc006YakuinSanteiSelect").val().trim());	// 未使用
						$("#hdnShatakuChintairyo").val($("#sc006ChintaiRyo").val().replace(/,/g, "").trim());
					}

					// 現在状態バックアップ
					// 可変ラベル、備品リストテーブル、協議中フラグのバックアップを行う
					backUpStatus = function() {
						// 可変ラベルリスト作成
						sc006SetVariableLabelList();
						// 備品リスト作成
						sc006SetJsonBihinList();
						// 協議中フラグ状態
						//$("#sc006KyoekihiKyogichuCheckState").val($("#sc006KyoekihiKyogichuCheck:checked").val());
					}

					// 社宅情報:個人負担共益費 協議中フラグ判定

// 					// 社宅部屋入力支援コールバック
// 					shatakuShienCallback = function() {
// 						// 状態クリア
// 						$("#sc006Status").val("");
// 						// 社宅名
// 						$("#sc006ShatakuName").text($("#hdnShatakuName").val().trim());
// 						// 部屋番号
// 						$("#sc006HeyaNo").text($("#hdnRoomNo").val().trim());
// 						// 現在状態バックアップ
// 						backUpStatus();
// 						url = "skf/Skf3022Sc006/ShatakuSupportCallBack";
// 						nfw.common.submitForm("form", url);
// 					}

					// 社員入力支援コールバック
					shainInfoCallback = function() {
						// 社員番号
						$("#hdnShainNo").val($("#shainNo").val().trim());
						$("#sc006ShainNo").text($("#shainNo").val().trim());
						$("#hdnShainName").val($("#sc006ShainName").val());
						$("#callbackFlag").val("false");
						// 現在状態バックアップ
						backUpStatus();
						url = "skf/Skf3030Sc002/ShainSupportCallBack";
						nfw.common.submitForm("form", url);
					}
					
					// 使用料支援コールバック
					shiyoryoShienCallback = function() {
						// 状態クリア
						$("#sc006Status").val("");
						// ヘッダ項目貸与用途(使用料計算パターン名)
						$("#sc006SiyoryoPatName").text($("#hdnRateShienPatternName").val());
						// 社宅使用料月額
						$("#sc006SiyoryoMonthPay").text($("#hdnRateShienShatakuGetsugaku").val());
						$("#hdnShatakuShiyoryoGetsugaku").text($("#hdnRateShienShatakuGetsugaku").val());
						// 貸与用途
						$("#sc006TaiyoYouto").text($("#hdnRateShienYotoName").val());
						// 貸与規格
						$("#sc006TaiyoKikaku").text($("#hdnRateShienKikakuName").val());
						// 寒冷地減免
						// 'Me.lblKanreiti.Text = shiyoryokeisanPatternShienInfo.Kanreichi
						// '狭小減免
						// 'Me.lblKyosyo.Text = shiyoryokeisanPatternShienInfo.Kyosho
						// 使用料パターンID（hidden変数）
						// 【使用料計算機能対応】ここでは画面制御として値を設定する。実際の使用料パターンIDは別処理にて付番する。
						$("#hdnRentalPatternId").val("1");
						// 現在状態バックアップ
						backUpStatus();
						url = "skf/Skf3030Sc002/ShiyoryoSupportCallBack";
						nfw.common.submitForm("form", url);
					}

					// 駐車場入力支援(区画)コールバック
					parkingShienCallback = function(p) {
						// 区画判定
						if (p == 1) {
							// 区画1 駐車場管理番号
							$("#hdnChushajoKanriNo1").val($("#hdnParkingShienParkNo").val());
							// 区画1 区画番号
							$("#sc006KukakuNoOne").text($("#hdnParkingShienParkBlock").val());
							// 区画１ 駐車場使用料月額
							$("#sc006TyusyaMonthPayOne").text($("#hdnParkingShienParkRentalAsjust").val());
							// 区画１ 終了日
							$("#hdnEndDayOne").val($("#hdnParkingShienEndDay").val());
							// パラメータ作成 
							var map = new Object();
							map['mapParam'] = createSiyoryoKeiSanParamAsync();
// 							map['hdnChushajoKanriNo1'] = $("#hdnParkingShienParkNo").val();
// 							map['sc006TyusyaMonthPayOne'] = $("#hdnParkingShienParkRentalAsjust").val();
// 							map['hdnEndDayOne'] = $("#hdnParkingShienEndDay").val();
// 							map['sc006KukakuNoOne'] = $("#hdnParkingShienParkBlock").val();
							// 使用料再計算と更新日時取得
							nfw.common.doAjaxAction("skf/Skf3030Sc002/ParkingSupportCallBackAsync", map, true, function(data) {
								// 戻り値設定(使用料再計算分)
								setSiyoryoKeiSanResultAsync(data);
							});
						} else {
							// 区画2 駐車場管理番号
							$("#hdnChushajoKanriNo2").val($("#hdnParkingShienParkNo").val());
							// 区画2 区画番号
							$("#sc006KukakuNoTwo").text($("#hdnParkingShienParkBlock").val());
							// 区画2 駐車場使用料月額
							$("#sc006TyusyaMonthPayTwo").text($("#hdnParkingShienParkRentalAsjust").val());
							// 区画2 終了日
							$("#hdnEndDayTwo").val($("#hdnParkingShienEndDay").val());
							// パラメータ作成 
							var map = new Object();
							map['mapParam'] = createSiyoryoKeiSanParamAsync();
// 							map['sc006ChushajoKanriNo'] = $("#hdnParkingShienParkNo").val();
// 							map['sc006ParkBlockKind'] = "2";
// 							map['hdnShatakuKanriNo'] = $("#hdnShatakuKanriNo").val();
							// 使用料再計算と更新日時取得
							nfw.common.doAjaxAction("skf/Skf3030Sc002/ParkingSupportCallBackAsync", map, true, function(data) {
								// 戻り値設定(使用料再計算分)
								setSiyoryoKeiSanResultAsync(data);
							});
						}
					}

					// 相互利用自動判定処理
					sogoriyoAutoSet = function(kind) {
						// 種別判定
						switch(kind) {
							case 1:	// 給与支給
								if ($("#sc006KyuyoKaisyaSelect").val() == $("#sc006KariukeKaisyaSelect").val()) {
									$("#sc006SokinShatakuSelect").val("0");
									$("#sc006SokinKyoekihiSelect").val("0");
								} else {
									$("#sc006SokinShatakuSelect").val("1");
									$("#sc006SokinKyoekihiSelect").val("1");
								}
								break;
							case 2:	// 貸付
								if ($("#sc006TaiyoKaisyaSelect").val() == $("#sc006KariukeKaisyaSelect").val()) {
									$("#sc006SogoHanteiKbnSelect").val("0");
								} else {
									$("#sc006SogoHanteiKbnSelect").val("1");
								}
								break;
							case 3:	// 借受
								if ($("#sc006KyuyoKaisyaSelect").val() == $("#sc006KariukeKaisyaSelect").val()) {
									$("#sc006SokinShatakuSelect").val("0");
									$("#sc006SokinKyoekihiSelect").val("0");
								} else {
									$("#sc006SokinShatakuSelect").val("1");
									$("#sc006SokinKyoekihiSelect").val("1");
								}
								if ($("#sc006TaiyoKaisyaSelect").val() == $("#sc006KariukeKaisyaSelect").val()) {
									$("#sc006SogoHanteiKbnSelect").val("0");
								} else {
									$("#sc006SogoHanteiKbnSelect").val("1");
								}
								break;
						};
					}

					//相互利用判定区分変更時チェック処理
					validateInput= function(kind) {
					
						// 貸付会社
						if($("#sc006TaiyoKaisyaSelect").val() == ""){
							$("#sc006TaiyoKaisyaSelect").addClass("nfw-validation-error");
						}
						// 借受会社
						if($("#sc006KariukeKaisyaSelect").val() == ""){
							$("#sc006KariukeKaisyaSelect").addClass("nfw-validation-error");
						}
						//開始日
						if($("#sc006StartDay").val() == ""){
							$("#sc006StartDay").addClass("nfw-validation-error");
						}
					}

					
					/** テキストチェンジイベント */
					// 入居予定日チェンジ
					$("#sc006NyukyoYoteiDay").blur(function() {
//					$("#sc006NyukyoYoteiDay").bind('change', function() {
						// エラークリア
						$("#sc006NyukyoYoteiDay").removeClass("nfw-validation-error");
//						$("#hdnNyukyoDate").val($("#sc006NyukyoYoteiDay").val());
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/ChangeNyutaikyoYoteiAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
					});

					// 退居予定日チェンジ
					$("#sc006TaikyoYoteiDay").blur(function() {
//					$("#sc006TaikyoYoteiDay").bind('change', function() {
						// エラークリア
						$("#sc006TaikyoYoteiDay").removeClass("nfw-validation-error");
//						$("#hdnTaikyoDate").val($("#sc006TaikyoYoteiDay").val());
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/ChangeNyutaikyoYoteiAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
					});

					// 給与支給会社ドロップダウンチェンジ
					$("#sc006KyuyoKaisyaSelect").bind('change', function() {
						// 給与支給会社ドロップダウン変更
						sogoriyoAutoSet(1);
					});

					// 貸付会社ドロップダウンチェンジ
					$("#sc006TaiyoKaisyaSelect").bind('change', function() {
						// 貸付会社ドロップダウン変更
						sogoriyoAutoSet(2);
					});

					// 借受会社ドロップダウンチェンジ
					$("#sc006KariukeKaisyaSelect").bind('change', function() {
						// 借受会社ドロップダウン変更
						sogoriyoAutoSet(3);
					});

					// 出向の有無(相互利用状況)ドロップダウンチェンジ
					$("#sc006SogoRyojokyoSelect").bind('change', function() {
						if ($("#hdnSougoRiyouFlg").val() == "true") {
							//相互利用タブ有効な場合
							if($("#sc006SogoRyojokyoSelect").val() == "0"){
								//相互利用状況(なし) ⇒ 相互利用関連項目は非活性
								//SetSougoRiyoJokyoControlStatus(false)
								// 相互利用判定区分
								$("#sc006SogoHanteiKbnSelect").prop('disabled', true);
								$("#sc006SogoHanteiKbnSelect").val("");
								$("#sc006SogoHanteiKbnSelect").removeClass("nfw-validation-error");
								// 送金区分
								$("#sc006SokinShatakuSelect").prop('disabled', true);
								$("#sc006SokinShatakuSelect").val("");
								$("#sc006SokinShatakuSelect").removeClass("nfw-validation-error");
								// 共益費会社間送付区分
								$("#sc006SokinKyoekihiSelect").prop('disabled', true);
								$("#sc006SokinKyoekihiSelect").val("");
								$("#sc006SokinKyoekihiSelect").removeClass("nfw-validation-error");
								// 貸付会社
								$("#sc006TaiyoKaisyaSelect").prop('disabled', true);
								$("#sc006TaiyoKaisyaSelect").removeClass("nfw-validation-error");
								$("#sc006TaiyoKaisyaSelect").val("");
								// 借受会社
								$("#sc006KariukeKaisyaSelect").prop('disabled', true);
								$("#sc006KariukeKaisyaSelect").removeClass("nfw-validation-error");
								$("#sc006KariukeKaisyaSelect").val("");
								// 開始日
								$("#sc006StartDay").val("");
								$("#sc006StartDay").prop('disabled', true);
								$("#sc006StartDay").removeClass("nfw-validation-error");
								$("#sc006StartDayDiv").addClass("wj-state-disabled");
								// 終了日
								$("#sc006EndDay").val("");
								$("#sc006EndDay").prop('disabled', true);
								$("#sc006EndDay").removeClass("nfw-validation-error");
								$("#sc006EndDayDiv").addClass("wj-state-disabled");
								// 配属情報
								$("#sc006HaizokuKaisyaSelect").prop('disabled', true);
								$("#sc006HaizokuKaisyaSelect").removeClass("nfw-validation-error");
								$("#sc006HaizokuKaisyaSelect").val("");
								// 所属機関
								$("#sc006SyozokuKikan").prop('disabled', true);
								$("#sc006SyozokuKikan").removeClass("nfw-validation-error");
								$("#sc006SyozokuKikan").val("");
								// 室・部名
								$("#sc006SituBuName").prop('disabled', true);
								$("#sc006SituBuName").removeClass("nfw-validation-error");
								$("#sc006SituBuName").val("");
								// 課等名
								$("#sc006KanadoMei").prop('disabled', true);
								$("#sc006KanadoMei").removeClass("nfw-validation-error");
								$("#sc006KanadoMei").val("");
								// 配属データコード番号
								$("#sc006HaizokuNo").prop('disabled', true);
								$("#sc006HaizokuNo").removeClass("nfw-validation-error");
								$("#sc006HaizokuNo").val("");
								
							}else{
								// 相互利用判定区分
								$("#sc006SogoHanteiKbnSelect").prop('disabled', false);
								// 送金区分
								$("#sc006SokinShatakuSelect").prop('disabled', false);
								// 共益費会社間送付区分
								$("#sc006SokinKyoekihiSelect").prop('disabled', false);
								// 貸付会社
								$("#sc006TaiyoKaisyaSelect").prop('disabled', false);
								// 借受会社
								$("#sc006KariukeKaisyaSelect").prop('disabled', false);
								// 社宅賃貸料
								$("#sc006ChintaiRyo").prop('disabled', false);
								// 駐車場賃貸料
								$("#sc006TyusyajoRyokin").prop('disabled', false);
								// 共益費
								$("#sc006Kyoekihi").prop('disabled', false);
								// 配属情報
								$("#sc006HaizokuKaisyaSelect").prop('disabled', false);
								// 所属機関
								$("#sc006SyozokuKikan").prop('disabled', false);
								// 室・部名
								$("#sc006SituBuName").prop('disabled', false);
								// 課等名
								$("#sc006KanadoMei").prop('disabled', false);
								// 配属データコード番号
								$("#sc006HaizokuNo").prop('disabled', false);
								// 開始日
								$("#sc006StartDay").prop('disabled', false);
								$("#sc006StartDayDiv").prop('disabled', false);
								$("#sc006StartDayDiv").removeClass("wj-state-disabled");
								// 終了日
								$("#sc006EndDay").prop('disabled', false);
								$("#sc006EndDayDiv").prop('disabled', false);
								$("#sc006EndDayDiv").removeClass("wj-state-disabled");
								// 借受会社ドロップダウン変更
								sogoriyoAutoSet(3);
							}
						}
					});
					// 出向の有無(相互利用状況)ドロップダウンチェンジ
					$("#sc006SogoHanteiKbnSelect").bind('change', function() {
						//相互利用タブ有効な場合
						if ($("#hdnSougoRiyouFlg").val() == "true") {
							//相互利用判定区分が”あり”の場合
							if($("#sc006SogoHanteiKbnSelect").val() == "1"){
								validateInput();
							}else{
								// 貸付会社
								$("#sc006TaiyoKaisyaSelect").removeClass("nfw-validation-error");
								// 借受会社
								$("#sc006KariukeKaisyaSelect").removeClass("nfw-validation-error");
								//開始日
								$("#sc006StartDay").removeClass("nfw-validation-error");
							}
						}
					});

					// 備品ドロップダウンチェンジ
					$("select[id^='bihinTaiyoStts']").bind('change', function(data) {
						// RelativeID取得
						var rId = data.target.id.replace("bihinTaiyoStts", "");
						// 行データ取得
						var rowData = $("#bihinInfoList").getRowData(rId);
						// 備品貸与状態取得
						var bihinTaiyoStts = $("#bihinTaiyoStts" + rId).val();
						// 部屋備付状態取得
						var heyaSonaetukeSttsStr = rowData.heyaSonaetukeSttsStr;
						// 旧指示書
						var shijishoOld = rowData.shijishoOld;
						// 入退居区分判定
						switch ($("#hdnNyutaikyoKbn").val()) {
							case "1":	// 入退居区分＝"1"（入居）の場合
								// 貸与状態判定
								if(bihinTaiyoStts == '3' && (heyaSonaetukeSttsStr == 'なし' || heyaSonaetukeSttsStr == '共有')) {
									// 貸与状態ドロップダウンリストが"3"（レンタル）で、表示されてる部屋備付状態が「なし」「共有」の場合、指示書欄に「搬入」を表示させる。
									$("#shijisho" + rId).val("搬入");
								} else {
									$("#shijisho" + rId).val("");
								}
								// 変更前指示書文字列と異なる文言を設定した指示書欄の背景色は、ピンク色に設定する。
								if($("#shijisho" + rId).val() != shijishoOld) {
									$("#shijisho" + rId).css('background-color','#ffcecf')
								} else {
									$("#shijisho" + rId).css('background-color','transparent')
								}
								break;
							case "2":	// 入退居区分＝"2"（退居）の場合
								// 貸与状態判定
								if(bihinTaiyoStts == '2' && (heyaSonaetukeSttsStr == 'なし' || heyaSonaetukeSttsStr == '共有')) {
									// 貸与状態ドロップダウンリストが"2"（会社保有）で、表示されてる部屋備付状態が「なし」「共有」の場合、指示書欄に「下取」を表示させる
									$("#shijisho" + rId).val("下取");
								} else if(bihinTaiyoStts == '3' && (heyaSonaetukeSttsStr == 'なし' || heyaSonaetukeSttsStr == '共有')) {
									// 貸与状態ドロップダウンリストが"3"（レンタル）で、表示されてる部屋備付状態が「なし」「共有」の場合、指示書欄に「搬出」を表示させる。
									$("#shijisho" + rId).val("搬出");
								} else {
									$("#shijisho" + rId).val("");
								}
								// 変更前指示書文字列と異なる文言を設定した指示書欄の背景色は、ピンク色に設定する。
								if($("#shijisho" + rId).val() != shijishoOld) {
									$("#shijisho" + rId).css('background-color','#ffcecf')
								} else {
									$("#shijisho" + rId).css('background-color','transparent')
								}
								break;
							default:	// 入退居区分が上記以外（変更）の場合
								break;
						};
					});

					// 役員算定ドロップダウンチェンジ
					$("#sc006YakuinSanteiSelect").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						map['sc006KukakuNoOne'] = $("#sc006KukakuNoOne").text();
						map['hdnChushajoKanriNo1'] = $("#hdnChushajoKanriNo1").val();
						map['sc006KukakuNoTwo'] = $("#sc006KukakuNoTwo").text();
						map['hdnChushajoKanriNo2'] = $("#hdnChushajoKanriNo2").val();
						map['yakuinSanteiSelectedValue'] = $("#sc006YakuinSanteiSelect").val();
						map['txtShatakuChintairyo'] = $("#sc006ChintaiRyo").val();
						map['litKukaku1No'] = $("#sc006KukakuNoOne").text();
						map['litKukaku2No'] = $("#sc006KukakuNoTwo").text();
						map['txtChishajoRyokin'] = $("#sc006TyusyajoRyokin").val();

						
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/ChangeYakuinSanteiAsync", map, true, function(data) {
							//戻り値
							var sc006ChintaiRyoErr = data.sc006ChintaiRyoErr;
							if(sc006ChintaiRyoErr != ""){
								$("#sc006ChintaiRyo").addClass("nfw-validation-error");
							}
							var sc006TyusyajoRyokinErr = data.sc006TyusyajoRyokinErr;
							if(sc006TyusyajoRyokinErr != ""){
								$("#sc006TyusyajoRyokin").addClass("nfw-validation-error");
							}
							if(sc006ChintaiRyoErr == "" && sc006TyusyajoRyokinErr == ""){
								// 戻り値設定(使用料再計算分)
								setSiyoryoKeiSanResultAsync(data);
							}
							
						});
					});

					// 社宅使用料調整金額チェンジ
					$("#sc006SiyoroTyoseiPay").blur(function() {
//					$("#sc006SiyoroTyoseiPay").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 社宅使用料調整金額 
// 						if ($("#sc006SiyoroTyoseiPay").val() != null && $("#sc006SiyoroTyoseiPay").val().length > 0) {
// 							// エラークリア
// 							$("#sc006SiyoroTyoseiPay").removeClass("nfw-validation-error");
// 							// 社宅使用料日割金額
// 							var hiwariPay = 0;
// 							if ($("#sc006SiyoryoHiwariPay").text() != null && $("#sc006SiyoryoHiwariPay").text().trim().length > 0) {
// 								hiwariPay = parseInt($("#sc006SiyoryoHiwariPay").text().trim().replace(/,/g, ""));
// 							}
// 							// 社宅使用料調整金額
// 							var tyoseiPay = 0;
// 							tyoseiPay = parseInt($("#sc006SiyoroTyoseiPay").val().trim().replace(/,/g, ""));
// 							// 社宅使用料月額(調整後)
// 							$("#sc006SyatauMonthPayAfter").text((hiwariPay + tyoseiPay).toLocaleString());
// 						} else {
// 							if ($("#sc006SiyoryoHiwariPay").text() != null && $("#sc006SiyoryoHiwariPay").text().trim().length > 0) {
// 								// 社宅使用料月額(調整後)を日割金額と同額に設定
// 								$("#sc006SyatauMonthPayAfter").text($("#sc006SiyoryoHiwariPay").text().trim());
// 							} else {
// 								// 社宅使用料月額(調整後)を「0」に設定
// 								$("#sc006SyatauMonthPayAfter").text("0");
// 							}
// 						}
					});

					// 個人負担共益費月額チェンジ
					$("#sc006KyoekihiMonthPay").blur(function() {
//					$("#sc006KyoekihiMonthPay").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 個人負担共益費月額
// 						if ($("#sc006KyoekihiMonthPay").val() != null && $("#sc006KyoekihiMonthPay").val().length > 0) {
// 							// エラークリア
// 							$("#sc006KyoekihiMonthPay").removeClass("nfw-validation-error");
// 							// 共益費月額
// 							var monthKyoekiPay = 0;
// 							monthKyoekiPay = parseInt($("#sc006KyoekihiMonthPay").val().trim().replace(/,/g, ""));
// 							// 共益費調整金額
// 							var tyoseiKyoekiPay = 0;
// 							if ($("#sc006KyoekihiTyoseiPay").val() != null && $("#sc006KyoekihiTyoseiPay").val().trim().length > 0) {
// 								tyoseiKyoekiPay = parseInt($("#sc006KyoekihiTyoseiPay").val().trim().replace(/,/g, ""));
// 							}
// 							// 個人負担共益費月額(調整後)
// 							$("#sc006KyoekihiPayAfter").text((monthKyoekiPay + tyoseiKyoekiPay).toLocaleString());
// 						} else {
// 							if ($("#sc006KyoekihiTyoseiPay").val() != null && $("#sc006KyoekihiTyoseiPay").val().trim().length > 0) {
// 								// 社宅使用料月額(調整後)を日割金額と同額に設定
// 								$("#sc006KyoekihiPayAfter").text($("#sc006KyoekihiTyoseiPay").val().trim());
// 							} else {
// 								// 社宅使用料月額(調整後)を「0」に設定
// 								$("#sc006KyoekihiPayAfter").text("0");
// 							}
// 						}
					});

					// 個人負担共益費調整金額チェンジ
					$("#sc006KyoekihiTyoseiPay").blur(function() {
//					$("#sc006KyoekihiTyoseiPay").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 個人負担共益費調整金額
// 						if ($("#sc006KyoekihiTyoseiPay").val() != null && $("#sc006KyoekihiTyoseiPay").val().length > 0) {
// 							// エラークリア
// 							$("#sc006KyoekihiTyoseiPay").removeClass("nfw-validation-error");
// 							// 共益費月額
// 							var monthKyoekiPay = 0;
// 							// 当月以前に退居の場合は0とする
// 							if ($("#sc006KyoekihiMonthPay").val() != null && $("#sc006KyoekihiMonthPay").val().trim().length > 0) {
// 								monthKyoekiPay = parseInt($("#sc006KyoekihiMonthPay").val().trim().replace(/,/g, ""));
// 							}
// 							// 共益費調整金額
// 							var tyoseiKyoekiPay = 0;
// 							tyoseiKyoekiPay = parseInt($("#sc006KyoekihiTyoseiPay").val().trim().replace(/,/g, ""));
// 							// 個人負担共益費月額(調整後)
// 							$("#sc006KyoekihiPayAfter").text((monthKyoekiPay + tyoseiKyoekiPay).toLocaleString());
// 						} else {
// 							if ($("#sc006KyoekihiMonthPay").val() != null && $("#sc006KyoekihiMonthPay").val().trim().length > 0) {
// 								// 個人負担共益費月額(調整後)を日割金額と同額に設定
// 								$("#sc006KyoekihiPayAfter").text($("#sc006KyoekihiMonthPay").val().trim());
// 							} else {
// 								// 個人負担共益費月額(調整後)を「0」に設定
// 								$("#sc006KyoekihiPayAfter").text("0");
// 							}
// 						}
					});

					// 駐車場利用日チェンジ
//					$("input[id^='sc006Riyou']").blur(function() {
					$("input[id^='sc006Riyou']").bind('change', function() {
						var id = $(this).attr("id");
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// コントロール判定
						switch (id) {
							case "sc006RiyouStartDayOne":	// 利用開始日1
								map['sc006ChushajoKanriNo'] = $("#hdnChushajoKanriNo1").val();
								map['sc006ParkBlockKind'] = "1";
								// エラークリア
								$("#sc006RiyouStartDayOne").removeClass("nfw-validation-error");
								break;
							case "sc006RiyouEndDayOne":		// 利用終了日1
								map['sc006ChushajoKanriNo'] = $("#hdnChushajoKanriNo1").val();
								map['sc006ParkBlockKind'] = "1";
								// エラークリア
								$("#sc006RiyouEndDayOne").removeClass("nfw-validation-error");
								break;
							case "sc006RiyouStartDayTwo":	// 利用開始日2
								map['sc006ChushajoKanriNo'] = $("#hdnChushajoKanriNo2").val();
								map['sc006ParkBlockKind'] = "2";
								// エラークリア
								$("#sc006RiyouStartDayTwo").removeClass("nfw-validation-error");
								break;
							case "sc006RiyouEndDayTwo":		// 利用終了日2
								map['sc006ChushajoKanriNo'] = $("#hdnChushajoKanriNo2").val();
								map['sc006ParkBlockKind'] = "2";
								// エラークリア
								$("#sc006RiyouEndDayTwo").removeClass("nfw-validation-error");
								break;
						};
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
					});

					// 駐車場使用料調整金額チェンジ
					$("#sc006TyusyaTyoseiPay").blur(function() {
//					$("#sc006TyusyaTyoseiPay").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 駐車場１日割金額
// 						var parkingOnePay = 0;
// 						if ($("#sc006TyusyaDayPayOne").text() != null && $("#sc006TyusyaDayPayOne").text().trim().length > 0) {
// 							parkingOnePay = parseInt($("#sc006TyusyaDayPayOne").text().trim().replace(/,/g, ""));
// 						}
// 						// 駐車場２日割金額
// 						var parkingTwoPay = 0;
// 						if ($("#sc006TyusyaDayPayTwo").text() != null && $("#sc006TyusyaDayPayTwo").text().trim().length > 0) {
// 							parkingTwoPay = parseInt($("#sc006TyusyaDayPayTwo").text().trim().replace(/,/g, ""));
// 						}
// 						// 駐車場使用料調整金額 
// 						if ($("#sc006TyusyaTyoseiPay").val() != null && $("#sc006TyusyaTyoseiPay").val().trim().length > 0) {
// 							// 駐車場使用料調整金額
// 							var tyoseiPay = 0;
// 							tyoseiPay = parseInt($("#sc006TyusyaTyoseiPay").val().trim().replace(/,/g, ""));
// 							$("#sc006TyusyaMonthPayAfter").text((parkingOnePay + parkingTwoPay + tyoseiPay).toLocaleString());
// 						} else {
// 							$("#sc006TyusyaMonthPayAfter").text((parkingOnePay + parkingTwoPay).toLocaleString());
// 						}
					});

					// 貸与日チェンジ
					$("#sc006TaiyoDay").bind('change', function() {
						// エラークリア
						$("#sc006TaiyoDay").removeClass("nfw-validation-error");
					});

					// 返却日チェンジ
					$("#sc006HenkyakuDay").bind('change', function() {
						// エラークリア
						$("#sc006HenkyakuDay").removeClass("nfw-validation-error");
					});

					// 搬入日チェンジ
					$("#sc006KibouDayIn").bind('change', function() {
						// エラークリア
						$("#sc006KibouDayIn").removeClass("nfw-validation-error");
					});

					// 搬出日チェンジ
					$("#sc006KibouDayOut").bind('change', function() {
						// エラークリア
						$("#sc006KibouDayOut").removeClass("nfw-validation-error");
					});

					// 開始日チェンジ
					$("#sc006StartDay").bind('change', function() {
						// エラークリア
						$("#sc006StartDay").removeClass("nfw-validation-error");
					});

					// 終了日チェンジ
					$("#sc006EndDay").bind('change', function() {
						// エラークリア
						$("#sc006EndDay").removeClass("nfw-validation-error");
					});

					// 社宅賃貸料チェンジ
//					$("#sc006ChintaiRyo").blur(function() {
					$("#sc006ChintaiRyo").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 社宅賃貸料 入力チェック
// 						if ($("#sc006ChintaiRyo").val() != null && $("#sc006ChintaiRyo").val().trim().length > 0) {
// 							// エラークリア
// 							$("#sc006ChintaiRyo").removeClass("nfw-validation-error");
// 							// パラメータ作成 
// 							var map = new Object();
// 							map['mapParam'] = createSiyoryoKeiSanParamAsync();
// 							map['sc006KukakuNoOne'] = $("#sc006KukakuNoOne").text();
// 							map['hdnChushajoNoOne'] = $("#hdnChushajoNoOne").val();
// 							map['hdnChushajoNoOneOld'] = $("#hdnChushajoNoOneOld").val();
// 							map['sc006KukakuNoTwo'] = $("#sc006KukakuNoTwo").text();
// 							map['hdnChushajoNoTwo'] = $("#hdnChushajoNoTwo").val();
// 							map['hdnChushajoNoTwoOld'] = $("#hdnChushajoNoTwoOld").val();
// 							// 使用料再計算
// 							nfw.common.doAjaxAction("skf/Skf3022Sc006/ChangeShatakuChintaiRyoAsync", map, true, function(data) {
// 								// 戻り値設定(使用料再計算分)
// 								setSiyoryoKeiSanResultAsync(data);
// 							});
// 						}
					});

					// 駐車場料金チェンジ
					$("#sc006TyusyajoRyokin").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 駐車場料金入力チェック
// 						if ($("#sc006TyusyajoRyokin").val() != null && $("#sc006TyusyajoRyokin").val().trim().length > 0) {
// 							// エラークリア
// 							$("#sc006TyusyajoRyokin").removeClass("nfw-validation-error");
// 							// パラメータ作成 
// 							var map = new Object();
// 							map['mapParam'] = createSiyoryoKeiSanParamAsync();
// 							map['sc006KukakuNoOne'] = $("#sc006KukakuNoOne").text();
// 							map['hdnChushajoNoOne'] = $("#hdnChushajoNoOne").val();
// 							map['hdnChushajoNoOneOld'] = $("#hdnChushajoNoOneOld").val();
// 							map['sc006KukakuNoTwo'] = $("#sc006KukakuNoTwo").text();
// 							map['hdnChushajoNoTwo'] = $("#hdnChushajoNoTwo").val();
// 							map['hdnChushajoNoTwoOld'] = $("#hdnChushajoNoTwoOld").val();
// 							// 使用料再計算
// 							nfw.common.doAjaxAction("skf/Skf3022Sc006/ChangeParkingPayAsync", map, true, function(data) {
// 								// 戻り値設定(使用料再計算分)
// 								setSiyoryoKeiSanResultAsync(data);
// 							});
// 						}
					});

					// 共益費チェンジ
					$("#sc006Kyoekihi").bind('change', function() {
						// パラメータ作成 
						var map = new Object();
						map['mapParam'] = createSiyoryoKeiSanParamAsync();
						// 使用料再計算
						nfw.common.doAjaxAction("skf/Skf3030Sc002/SiyoryoKeisanAsync", map, true, function(data) {
							// 戻り値設定(使用料再計算分)
							setSiyoryoKeiSanResultAsync(data);
						});
// 						// 共益費入力チェック
// 						if ($("#sc006Kyoekihi").val() != null && $("#sc006Kyoekihi").val().trim().length > 0) {
// 							// エラークリア
// 							$("#sc006Kyoekihi").removeClass("nfw-validation-error");
// 						}
					});

					
					// 受け取り代理人名欄でDeleteKeyまたはBackSpaceを押下時イベント
					sc006UketoriDairiInName_KeyDown = function(e) {
						var c = e.keyCode;
						if (c == 46 || c == 8) {
							$("#sc006UketoriDairiInName").val("");
						}
					};
					
					
					// 立会代理人名欄でDeleteKeyまたはBackSpaceを押下時イベント
					sc006TachiaiDairi_KeyDown = function(e) {
						var c = e.keyCode;
						if (c == 46 || c == 8) {
							$("#sc006TachiaiDairi").val("");
						}
					};
					
// 					// 処理状態判定
// 					// 押下ボタン判定
// 					switch ($("#sc006Status").val()) {
// 						case "0":
// 							// 一時保存★
// 							// 状態クリア
// 							$("#sc006Status").val("");
// 							// 現在状態バックアップ
// 							backUpStatus();
// 							// 確認ダイアログ表示
// 							nfw.common.confirmPopup($("#litMessageTmpSave").val(),
// 									"確認", "form", "skf/Skf3022Sc006/tmpSave", "ok", "キャンセル", this, true);
// 							break;
// 						case "1":
// 							// 作成完了★
// 							// 状態クリア
// 							$("#sc006Status").val("");
// 							// 現在状態バックアップ
// 							backUpStatus();
// 							// 確認ダイアログ表示
// 							nfw.common.confirmPopup($("#litMessageCreate").val(),
// 									"確認", "form", "skf/Skf3022Sc006/create", "ok", "キャンセル", this, true);
// 							break;
// 						case "2":
// 							// 社宅管理台帳登録★
// 							// 状態クリア
// 							$("#sc006Status").val("");
// 							// 現在状態バックアップ
// 							backUpStatus();
// 							// 確認ダイアログ表示
// 							nfw.common.confirmPopup($("#litMessageShatakuLogin").val(),
// 									"確認", "form", "skf/Skf3022Sc006/shatakuLogin", "ok", "キャンセル", this, true);
// 							break;
// 						default:
// 							// 状態クリア
// 							$("#sc006Status").val("");
// 							break;
// 					};
				});
			})(jQuery);
		</script>
		<script>
			$(function() {
				// タブ活性/非活性設定
				var setTabDisp = new Array();
				if (${form.tbpBihinInfo}) {
					setTabDisp.push(1);
				}
				if (${form.tbpSougoRiyouInfo}) {
					setTabDisp.push(2);
				}
				$( "#tabs" ).tabs();
				$("#tabs").tabs({
					selected:parseInt(${form.hdnTabIndex}),
					disabled:setTabDisp
				});
			});
		</script>
	</nfwui:Form>
	<form id="downloadForm" action="tenant/maintenance/storage/file_download" method="post">
		<input name="path" type="hidden" value="${form.operationGuidePath }" />
		<input name="imui-theme-builder-module" type="hidden" value="notheme" />
	</form>
</div>
<!-- コンテンツエリア　ここまで -->