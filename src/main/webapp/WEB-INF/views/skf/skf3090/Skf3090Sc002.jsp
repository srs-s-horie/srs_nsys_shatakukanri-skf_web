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

<script src="scripts/skf/skfCommon.js">

</script>
<%-- コンテンツエリア --%>
<style type="text/css">

</style>
<script type="text/javascript">
function back1() {
	var url="skf/Skf3090Sc001/init?SKF3090_SC001&tokenCheck=0"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

(function($) {
    
	// 画面表示時に定義される処理
	$(document).ready(function(){
		$(".imui-toolbar-icon").removeAttr("onclick");
		$(".imui-toolbar-icon").click(function(e) {
			back1();
		});

		// フォーカスを合わせる
		document.getElementById('txtTodoufukenn01Div').focus();

		// リサイズ処理
		$(window).bind('resize', function(){			
			$('#mainList').setGridWidth($('#listTableArea').width(), true);		
		}).trigger('resize');		

		// ボタン押下時のイベント
		preButtonEvent = function (mode) {
			var dialogTitle = "";
			var dialogMessage = "";
			var url = "";
			var grid = null;
			var row = null;
			var id = null;
			var shatakuKbn = null;

			switch (mode) {
				// 登録
				case 0:
					dialogTitle = "確認";
					dialogMessage = "現物支給価額を登録します。よろしいですか？";
					url = "skf/Skf3090Sc002/registe";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
					break;
				// 複写
				case 1:
					// 遷移先へ渡すパラメータを設定
					$("#hdnEffectiveDate").val("");
					$("#hdnJyotaiKbn").val("3");
					
					//url = "skf/Skf3090Sc002/init";
					//$("#form").attr("action", url);
					//$("#form").submit();

					var formId= "form";
					url = "skf/Skf3090Sc002/init";
					nfw.common.submitForm(formId, url);					
					
					break;
				// 削除
				case 2:
					dialogTitle = "確認";
					dialogMessage = "現物支給価額を削除します。よろしいですか？";
					url = "skf/Skf3090Sc002/delete";
					nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
					break;
				default:
					nfw.common.showReserveMessage("warning", "未サポート(未実装機能)です。");
					break;
			};
		}
	});

})(jQuery);
</script>
<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">

	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC002 %>" />
	<input type="hidden" name="hdnEffectiveDate" id="hdnEffectiveDate" value="${form.hdnEffectiveDate}" />
	<input type="hidden" name="hdnJyotaiKbn " id="hdnJyotaiKbn" value="${form.hdnJyotaiKbn}" />

	<div style="width:100%;" >
	    <div class="imui-form-container-wide">
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3090_SC002 %>" />
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<th>
								<label style="width:115px;">改定日</label>
							</th>
							<td style="width:98%;">
                                <nfwui:DateBox id="effectiveDate" name="effectiveDate" value="${f:h(form.effectiveDate)}"
                                               cssClass="${form.effectiveDateErr}" disabled="${form.effectiveDateDisabled}" tabindex="1" cssStyle="width:110px"/>
							</td>
						</tr>
					</tbody>
				</nfwui:Table>
				<div style="height:30px; bottom:10px">住宅支払報酬額（1人・1日・1畳につき、円）</div>
				<nfwui:Table use="search">
					<tbody>
						<tr>
							<!-- 01 北海道 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn01}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn01" name="txtTodoufukenn01" max="9999" min="0"
									cssClass="${form.txtTodoufukenn01Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn01}"  tabindex="2" />
							</td>
							<!-- 13 東京都 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn13}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn13" name="txtTodoufukenn13" max="9999" min="0"
									cssClass="${form.txtTodoufukenn13Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn13}"  tabindex="14" />
							</td>
							<!-- 25 滋賀県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn25}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn25" name="txtTodoufukenn25" max="9999" min="0"
									cssClass="${form.txtTodoufukenn25Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn25}"  tabindex="26" />
							</td>
							<!-- 37 香川県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn37}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn37" name="txtTodoufukenn37" max="9999" min="0"
									cssClass="${form.txtTodoufukenn37Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn37}"  tabindex="38" />
							</td>
						</tr>
						<tr>
							<!-- 02 青森件 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn02}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn02" name="txtTodoufukenn02" max="9999" min="0"
									cssClass="${form.txtTodoufukenn02Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn02}"  tabindex="3" />
							</td>
							<!-- 14 神奈川県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn14}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn14" name="txtTodoufukenn14" max="9999" min="0"
									cssClass="${form.txtTodoufukenn14Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn14}"  tabindex="15" />
							</td>
							<!-- 26 京都府 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn26}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn26" name="txtTodoufukenn26" max="9999" min="0"
									cssClass="${form.txtTodoufukenn26Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn26}"  tabindex="27" />
							</td>
							<!-- 38 愛媛県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn38}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn38" name="txtTodoufukenn38" max="9999" min="0"
									cssClass="${form.txtTodoufukenn38Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn38}"  tabindex="39" />
							</td>
						</tr>
						<tr>
							<!-- 03 岩手県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn03}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn03" name="txtTodoufukenn03" max="9999" min="0"
									cssClass="${form.txtTodoufukenn03Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn03}"  tabindex="4" />
							</td>
							<!-- 15 新潟県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn15}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn15" name="txtTodoufukenn15" max="9999" min="0"
									cssClass="${form.txtTodoufukenn15Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn15}"  tabindex="16" />
							</td>
							<!-- 27 大阪府 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn27}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn27" name="txtTodoufukenn27" max="9999" min="0"
									cssClass="${form.txtTodoufukenn27Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn27}"  tabindex="28" />
							</td>
							<!-- 39 高知県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn39}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn39" name="txtTodoufukenn39" max="9999" min="0"
									cssClass="${form.txtTodoufukenn39Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn39}"  tabindex="40" />
							</td>
						</tr>
						<tr>
							<!-- 04 宮城県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn04}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn04" name="txtTodoufukenn04" max="9999" min="0"
									cssClass="${form.txtTodoufukenn04Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn04}"  tabindex="5" />
							</td>
							<!-- 16 富山県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn16}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn16" name="txtTodoufukenn16" max="9999" min="0"
									cssClass="${form.txtTodoufukenn16Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn16}"  tabindex="17" />
							</td>
							<!-- 28 兵庫県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn28}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn28" name="txtTodoufukenn28" max="9999" min="0"
									cssClass="${form.txtTodoufukenn28Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn28}"  tabindex="29" />
							</td>
							<!-- 40 福岡県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn40}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn40" name="txtTodoufukenn40" max="9999" min="0"
									cssClass="${form.txtTodoufukenn40Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn40}"  tabindex="41" />
							</td>
						</tr>
						<tr>
							<!-- 05 秋田県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn05}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn05" name="txtTodoufukenn05" max="9999" min="0"
									cssClass="${form.txtTodoufukenn05Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn05}"  tabindex="6" />
							</td>
							<!-- 17 石川県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn17}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn17" name="txtTodoufukenn17" max="9999" min="0"
									cssClass="${form.txtTodoufukenn17Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn17}"  tabindex="18" />
							</td>
							<!-- 29 奈良県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn29}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn29" name="txtTodoufukenn29" max="9999" min="0"
									cssClass="${form.txtTodoufukenn29Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn29}"  tabindex="30" />
							</td>
							<!-- 41 佐賀県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn41}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn41" name="txtTodoufukenn41" max="9999" min="0"
									cssClass="${form.txtTodoufukenn41Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn41}"  tabindex="42" />
							</td>
						</tr>
						<tr>
							<!-- 06 山形県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn06}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn06" name="txtTodoufukenn06" max="9999" min="0"
									cssClass="${form.txtTodoufukenn06Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn06}"  tabindex="7" />
							</td>
							<!-- 18 福井県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn18}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn18" name="txtTodoufukenn18" max="9999" min="0"
									cssClass="${form.txtTodoufukenn18Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn18}"  tabindex="19" />
							</td>
							<!-- 30 和歌山県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn30}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn30" name="txtTodoufukenn30" max="9999" min="0"
									cssClass="${form.txtTodoufukenn30Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn30}"  tabindex="31" />
							</td>
							<!-- 42 長崎県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn42}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn42" name="txtTodoufukenn42" max="9999" min="0"
									cssClass="${form.txtTodoufukenn42Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn42}"  tabindex="43" />
							</td>
						</tr>
						<tr>
							<!-- 07 福島県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn07}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn07" name="txtTodoufukenn07" max="9999" min="0"
									cssClass="${form.txtTodoufukenn07Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn07}"  tabindex="8" />
							</td>
							<!-- 19 山梨県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn19}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn19" name="txtTodoufukenn19" max="9999" min="0"
									cssClass="${form.txtTodoufukenn19Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn19}"  tabindex="20" />
							</td>
							<!-- 31 鳥取県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn31}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn31" name="txtTodoufukenn31" max="9999" min="0"
									cssClass="${form.txtTodoufukenn31Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn31}"  tabindex="32" />
							</td>
							<!-- 43 熊本県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn43}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn43" name="txtTodoufukenn43" max="9999" min="0"
									cssClass="${form.txtTodoufukenn43Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn43}"  tabindex="44" />
							</td>
						</tr>
						<tr>
							<!-- 08 茨城県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn08}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn08" name="txtTodoufukenn08" max="9999" min="0"
									cssClass="${form.txtTodoufukenn08Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn08}"  tabindex="9" />
							</td>
							<!-- 20 長野県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn20}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn20" name="txtTodoufukenn20" max="9999" min="0"
									cssClass="${form.txtTodoufukenn20Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn20}"  tabindex="21" />
							</td>
							<!-- 32 島根県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn32}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn32" name="txtTodoufukenn32" max="9999" min="0"
									cssClass="${form.txtTodoufukenn32Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn32}"  tabindex="33" />
							</td>
							<!-- 44 大分県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn44}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn44" name="txtTodoufukenn44" max="9999" min="0"
									cssClass="${form.txtTodoufukenn44Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn44}"  tabindex="45" />
							</td>
						</tr>
						<tr>
							<!-- 09 栃木県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn09}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn09" name="txtTodoufukenn09" max="9999" min="0"
									cssClass="${form.txtTodoufukenn09Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn09}"  tabindex="10" />
							</td>
							<!-- 21 岐阜県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn21}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn21" name="txtTodoufukenn21" max="9999" min="0"
									cssClass="${form.txtTodoufukenn21Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn21}"  tabindex="22" />
							</td>
							<!-- 33 岡山県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn33}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn33" name="txtTodoufukenn33" max="9999" min="0"
									cssClass="${form.txtTodoufukenn33Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn33}"  tabindex="34" />
							</td>
							<!-- 45 宮崎県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn45}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn45" name="txtTodoufukenn45" max="9999" min="0"
									cssClass="${form.txtTodoufukenn45Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn45}"  tabindex="46" />
							</td>
						</tr>
						<tr>
							<!-- 10 群馬県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn10}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn10" name="txtTodoufukenn10" max="9999" min="0"
									cssClass="${form.txtTodoufukenn10Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn10}"  tabindex="11" />
							</td>
							<!-- 22 静岡県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn22}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn22" name="txtTodoufukenn22" max="9999" min="0"
									cssClass="${form.txtTodoufukenn22Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn22}"  tabindex="23" />
							</td>
							<!-- 34 広島県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn34}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn34" name="txtTodoufukenn34" max="9999" min="0"
									cssClass="${form.txtTodoufukenn34Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn34}"  tabindex="35" />
							</td>
							<!-- 46 鹿児島県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn46}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn46" name="txtTodoufukenn46" max="9999" min="0"
									cssClass="${form.txtTodoufukenn46Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn46}"  tabindex="47" />
							</td>
						</tr>
						<tr>
							<!-- 11 埼玉県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn11}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn11" name="txtTodoufukenn11" max="9999" min="0"
									cssClass="${form.txtTodoufukenn11Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn11}"  tabindex="12" />
							</td>
							<!-- 23 愛知県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn23}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn23" name="txtTodoufukenn23" max="9999" min="0"
									cssClass="${form.txtTodoufukenn23Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn23}"  tabindex="24" />
							</td>
							<!-- 35 山口県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn35}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn35" name="txtTodoufukenn35" max="9999" min="0"
									cssClass="${form.txtTodoufukenn35Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn35}"  tabindex="36" />
							</td>
							<!-- 47 沖縄県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn47}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn47" name="txtTodoufukenn47" max="9999" min="0"
									cssClass="${form.txtTodoufukenn47Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn47}"  tabindex="48" />
							</td>
						</tr>
						<tr>
							<!-- 12 千葉県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn12}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn12" name="txtTodoufukenn12" max="9999" min="0"
									cssClass="${form.txtTodoufukenn12Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn12}"  tabindex="13" />
							</td>
							<!-- 24 三重県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn24}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn24" name="txtTodoufukenn24" max="9999" min="0"
									cssClass="${form.txtTodoufukenn24Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn24}"  tabindex="25" />
							</td>
							<!-- 36 徳島県 -->
							<th>
								<label style="width:100px;">${form.lblTodoufukenn36}</label>
							</th>
							<td>
								<nfwui:NumberBox id="txtTodoufukenn36" name="txtTodoufukenn36" max="9999" min="0"
									cssClass="${form.txtTodoufukenn36Err}" cssStyle="width: 70px;"
									maxlength="5" value="${form.txtTodoufukenn36}"  tabindex="37" />
							</td>
							<td colspan="2">
							</td>
						</tr>
						<tr>
							<th>
								<label style="width:100px;">備考</label>
							</th>
							<td colspan="7">
								<imui:textArea id="biko" name="biko" rows="2" style="width:990px;" maxlength="400" value="${form.biko}" class="${form.bikoErr}" tabindex="49" />
							</td>
						</tr>
					</tbody>
				</nfwui:Table>

			<div class="align-L">	
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()" tabindex="50"/>
			</div>
			<div class="align-R">	
				<imui:button id="regist" name="regist" value="登録" disabled="${form.registButtonDisabled }" class="imui-medium-button" onclick="preButtonEvent(0)" tabindex="51" />
				<imui:button id="copy" name="copy" value="複写" disabled="${form.copyButtonDisabled }" class="imui-medium-button" onclick="preButtonEvent(1)" tabindex="52" />
				<imui:button id="delete" name="delete" value="削除" disabled="${form.deleteButtonDisabled }" class="imui-medium-button" onclick="preButtonEvent(2)" tabindex="53" />
			</div>
		</div>
	</div>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->
