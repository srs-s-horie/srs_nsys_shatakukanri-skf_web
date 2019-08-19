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

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide"  style="width: 95% ;">
				<div class="imui-chapter-title"><h2>組織情報</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblCompanyCd" code="<%= MessageIdConstant.SKF3090_SC007_COMPANY %>" />
								</th>
								<td style="width: 30%;">
									<imui:select id="companyCd" name="companyCd"
									width="185" tabindex="1" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAgencyCd" code="<%= MessageIdConstant.SKF3090_SC007_AGENCY_CODE %>" />
								</th>

								<td style="width: 30%;">
								<imui:textbox id="agencyCd" name="agencyCd" style="width: 55%" placeholder="例 00" tabindex="2" />
								<input type='button' value='名称を検索' class='imui-small-button' onclick="location.href=''">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation1Cd" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION1_CODE %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="affiliation1Cd" name="affiliation1Cd" style="width: 55%" placeholder="例 01" tabindex="4" />
								<input type="button" value="名称を検索" class="imui-small-button" onclick="location.href=''">
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation2Cd" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION2_CODE %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="affiliation2Cd" name="affiliation2Cd" style="width: 95%" placeholder="例 001" tabindex="6" />
								</td>
							</tr>
							
							 <!-- スペース-->
							<tr style="border:none">
								<td style="border:none">
								</td>
							</tr>

							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAgencyName" code="<%= MessageIdConstant.SKF3090_SC007_AGENCY %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="agencyName" name="agencyName" style="width: 95%" placeholder="例 機関の名称" tabindex="7" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation1Name" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION1 %>" />
								</th>
								<td style="width: 30%;">
									<imui:textbox id="affiliation1Name" name="affiliation1Name" style="width: 95%" placeholder="例 部等の名称" tabindex="8" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%;">
									<nfwui:LabelBox id="lblAffiliation2Name" code="<%= MessageIdConstant.SKF3090_SC007_AFFILIATION2 %>" />
								</th>
								<td style="width: 30%;">
								<imui:textbox id="affiliation2Name" name="affiliation2Name" style="width: 95%" placeholder="例 室、チーム又は課の名称" tabindex="9" />
								</td>
							</tr>
							<tr>

								<th style="width: 15%;">
									<nfwui:LabelBox id="lblBusinessAreaCd" code="<%= MessageIdConstant.SKF3090_SC007_BUSINESS_AREA %>" />
								</th>
								<td style="width: 30%;">
								<imui:select id="businessAreaCd" name="businessAreaCd" 
									width="185" tabindex="10" />
								
								</td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</nfwui:Table>
				</nfwui:Form>	
			</div>

			<br />
			                        <div class="align-L float-L">    
                <input style="width:150px;" name="doSendBack" id="" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
            </div>

			<div class="align-R">
				<input style="width:150px;" id="" type="button" value="登録" class="imui-medium-button"  onclick="location.href=''"/>
				<input style="width:150px;" id="" type="button" value="削除" class="imui-medium-button"  onclick="location.href=''" disabled/>
			</div>
		</div>
	</div>
	    <!-- カレンダー出力用スクリプト -->
    <script type="text/javascript">
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal001").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal002").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal003").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal004").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal005").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal006").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal007").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal008").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);      
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal009").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
    </script>
	<!-- コンテンツエリア　ここまで -->