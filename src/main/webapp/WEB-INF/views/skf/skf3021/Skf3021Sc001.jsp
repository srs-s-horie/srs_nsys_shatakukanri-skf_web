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

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->
		<!-- 以下ツールバー -->
		<div class="imui-toolbar-wrap">
			<div class="imui-toolbar-inner">
				<!-- ツールバー左側 -->
				<ul class="imui-list-toolbar">
					<!-- 戻る -->
					<li>
						<a class="imui-toolbar-icon" title="戻る" tabindex="23" onclick="back1()" href="javascript:void(0);">
							<span class="im-ui-icon-common-16-back"></span>
						</a>
					</li>
				</ul>
				<!-- ツールバー右側 -->
				<ul class="imui-list-box-toolbar-utility">
					<li>
						<a onclick="back()" class="imui-toolbar-icon" tabindex="16">
							<span class="im-ui-icon-common-16-home"></span>
							社宅TOP
						</a>
					</li>
					<li>
						<a class="imui-toolbar-icon" title="最新情報"  tabindex="26">
							<span class="im-ui-icon-common-16-refresh" onclick="refresh()"></span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
			/**
			* 一つ前の画面へ戻る
			*/
			function back1() {
				showConfirm(W_GFK_0002, function() {
					history.back()
				});
			}

			/**
			* メニュー画面へ遷移する。
			*/
			function back() {
				showConfirm(W_GFK_0007, function() {
					$.StandardPost("../common/top.html");
				});
			}
		</script>

<!-- 		<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!-- 			<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!-- 			</div>  -->
<!-- 		</div> -->

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<table class="imui-form-search-condition">
					<tbody>
						<tr>
							<th>
								<label style="width:60px;">社員番号</label>
							</th>
							<td>
								<input class="ime-off" style="width:200px;" type="text" placeholder="例　00123456（半角）"/>
							</td>
							<th>
								<label style="width:60px;">入退居区分</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">入居</option>
									<option value="2">退居</option>
									<option value="3">変更</option>
								</select>
							</td>
							<th>
								<label style="width:100px;">入退居申請状況</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">申請なし</option>
									<option value="2">申請あり</option>
								</select>
							</td>
							<th>
								<label style="width:80px;">特殊事情</label>
							</th>
							<td style="width:50%;">
								<select style="width:80px;">
									<option value="0"></option>
									<option value="1">なし</option>
									<option value="2">あり</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label>社員氏名</label>
							</th>
							<td>
								<input style="width:200px;" type="text" placeholder="例　中日本　太郎"/>
							</td>
							<th>
								<label style="width:120px;">提示対象</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">未設定</option>
									<option value="2">設定</option>
								</select>
							</td>
							<th>
								<label>入退居申請督促</label>
							</th>
							<td colspan="3">
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">未送付</option>
									<option value="2">送付済</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="align-L">	
					<input type="button" value="検索" class="imui-small-button" >
				</div>
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
					<script type="text/javascript">
					  (function($){
					    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
					  })(jQuery);
					</script>

					<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>

					<div id="sampleListTable1-pager"></div>

					<script type="text/javascript">
						(function() {
							function imuiListTable() {
								var grid = jQuery('#sampleListTable1');
								var parameter = {
									"multiselect":false,
									"pager":"#sampleListTable1-pager",
									"colNames":[
										"",
										"提示<br /><INPUT type='checkbox'>",
										"入退居<br/>区分",
										"社員番号",
										"社員氏名",
										"申請<br />区分",
										"入居予定日",
										"退居予定日",
										"用途",
										"駐車場<br />希望",
										"申請<br/>状況",
										"督促<br /><INPUT type='checkbox'>",
										"申請<br>督促",
										"特殊<br />事情",
										"提示対象",
										"申請内容",
										"削除",
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":1000,
									"width":"1280",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"teiji_flg","width":"50","align":"center"}<!-- 提示 -->
										,{"name":"nyutaikyo_kbn","width":"60","align":"center"}<!-- 入退居区分 -->
										,{"name":"syain_no","width":"80","align":"left"}<!-- 社員番号 -->
										,{"name":"shain_name","width":"160","align":"left"}<!-- 社員氏名 -->
										,{"name":"shinsei_kbn","width":"50","align":"center"}<!-- 申請区分 -->
										,{"name":"nyukyo_yotei_date","width":"100","align":"center"}<!-- 入居予定日 -->
										,{"name":"taikyo_yotei_date","width":"100","align":"center"}<!-- 退居予定日 -->
										,{"name":"youto","width":"53","align":"center"}<!-- 用途-->
										,{"name":"parking_request","width":"60","align":"center"}<!-- 駐車場希望 -->
										,{"name":"status","width":"60","align":"center"}<!-- 状況 -->
										,{"name":"mail","width":"60","align":"center"}<!-- メール -->
										,{"name":"tokusoku","width":"60","align":"center"}<!-- 督促 -->
										,{"name":"tokusyu_jijo","width":"40","align":"center"}<!-- 特殊事情-->
										,{"name":"teiji_create_kbn","width":"80","align":"center"}<!-- 提示データ作成区分 -->
										,{"name":"shinsei_naiyo","width":"90","align":"center"}<!-- 申請内容 -->
										,{"name":"delete","width":"80","align":"center"}<!-- 削除 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"teiji_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00000001＊",
										"shain_name":"中日本 2148",
										"shinsei_kbn":"―",
										"nyukyo_yotei_date":"―",
										"taikyo_yotei_date":"―",
										"youto":"―",
										"parking_request":"―",
										"status":"<font style='color:green'>―</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"―",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:red'>未設定",
										"shinsei_naiyo":"",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":2,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00002241",
										"shain_name":"中日本 2241",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"2018/06/29",
										"youto":"単身",
										"parking_request":"",
										"status":"<font style='color:green'>審査中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>設定",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":3,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00015154",
										"shain_name":"中日本 5154",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"2018/07/18",
										"youto":"世帯",
										"parking_request":"1",
										"status":"<font style='color:blue'>承認</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>設定",
										"shinsei_naiyo":"",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":4,
										"teiji_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00016164",
										"shain_name":"中日本 6164",
										"shinsei_kbn":"",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"単身",
										"parking_request":"",
										"status":"<font style='color:green'>審査中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:red'>未設定",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":5,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016164",
										"shain_name":"中日本 6164",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"2018/09/20",
										"youto":"単身",
										"parking_request":"1",
										"status":"",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>設定",
										"shinsei_naiyo":"",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":6,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00016193",
										"shain_name":"中日本 6193",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/10/10",
										"taikyo_yotei_date":"",
										"youto":"独身",
										"parking_request":"1",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>設定",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":7,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00016500",
										"shain_name":"中日本 6500",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"2018/07/20",
										"youto":"単身",
										"parking_request":"",
										"status":"<font style='color:blue'>承認</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"〇",
										"teiji_create_kbn":"<font style='color:blue'>設定",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":8,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016501",
										"shain_name":"中日本 6501",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":9,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016502",
										"shain_name":"中日本 6502",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":10,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016503",
										"shain_name":"中日本 6503",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":11,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016504",
										"shain_name":"中日本 6504",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":12,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016505",
										"shain_name":"中日本 6505",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":13,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016506",
										"shain_name":"中日本 6506",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":14,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016507",
										"shain_name":"中日本 6507",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":15,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016508",
										"shain_name":"中日本 6508",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":16,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016509",
										"shain_name":"中日本 6509",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":17,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016510",
										"shain_name":"中日本 6510",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":18,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016511",
										"shain_name":"中日本 6511",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":19,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016512",
										"shain_name":"中日本 6512",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":20,
										"teiji_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00016513",
										"shain_name":"中日本 6513",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"youto":"世帯",
										"parking_request":"",
										"status":"<font style='color:green'>申請中</font>",
										"mail":"<input type='checkbox' disabled></input>",
										"tokusoku":"",
										"tokusyu_jijo":"",
										"teiji_create_kbn":"<font style='color:blue'>作成済",
										"shinsei_naiyo":"<input type='button' style='text-align:center' value='申請内容' id='btnShisei' class='imui-small-button'></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									}
								];

								grid.jqGrid(parameter);

//								// ヘッダ結合
//								grid.jqGrid('setGroupHeaders', {
//									useColSpanStyle: true,
//									groupHeaders:[
//										{startColumnName: 'status', numberOfColumns: 3,  titleText: '入退居申請'},
//									]
//								});

// as
//									// 1行づつ網掛け挑戦
//									jQuery('#sampleListTable1').jqGrid({
//										loadComplete: function () {
//											var rowIDs = jQuery('#sampleListTable1').getDataIDs(); 
//											$.each(rowIDs, function (i, item) {
//												if (i % 2 == 0) {
//													$('#'+item).removeClass('ui-widget-content');
//													$('#'+item).addClass('testcss');
//												}
//											});
//										},
//									});
//									jQuery('#sampleListTable1').jqGrid({
//										gridComplete: function () {
//											$('tbody > tr:even', this).addClass('ui-row-even');
//										}
//									});
// ae

								grid.jqGrid('navGrid','#sampleListTable1-pager',{
									edit: false,
									add: false,
									del: false,
									search: false,
								});

								var gboxGridId     = 'gbox_sampleListTable1';
								var gboxGrid       = jQuery('#' + gboxGridId);
								var parentWidthOld = Number.MIN_VALUE;
							}

							(function($) {
								$(document).ready(function() {
									imuiListTable();
								});
							})(jQuery);
							
							$(function () {
								$("#createData").click(function() {
									//alert("1");
									window.location.href = "../../skf/Skf3030_Sc002/init"
								});

								$("#btnShisei").click(function() {
									openWindow();
								});
								
								function openWindow(e){
								info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
								'scrollbars=no,left=0,top=0,resizable=yes,width=850px,height=820px,title=no';
								var window1 = window.open("../pop/pop_NyutaikyoShinseiShokai.html","window1",info);
								window1.moveTo(0, 0);
								window.opener = self;
								}
							});

						})();
					</script>
					<style type="text/css">  
						<!--
							/* ヘッダテキスト中央寄せ */
							.ui-jqgrid .ui-jqgrid-htable th div {
								display:table-cell;
							    height: 32px;
								text-align:center;
								vertical-align:middle;
							}
							/** 1行間隔で網掛け挑戦
							.testcss {
								border: 1px solid #a6c9e2;
								background-color: #e6e6fa ;
								color: #222222;
							}

							.ui-row-even {
								background-color: #e6e6fa ;
							}
							*/

							/* データ行の改行許容 */
							#sampleListTable1 tr td{
								white-space:normal;
							}
						-->
					</style>
				</form>
			</div>
			<br />
			<div class="align-R">
				<input style="width:150px;" type="button" value="空き社宅リスト出力" class="imui-medium-button" onclick=""/>
				<input style="width:150px;" type="button" value="入退居申請督促" class="imui-medium-button" onclick=""/>
				<input style="width:160px;" type="button" value="入退居予定リスト出力" class="imui-medium-button" onclick=""/>
				<input style="width:150px;" id="createData" type="button" value="提示データ作成" class="imui-medium-button"/>
			</div>
		</div>
	</div>
<!-- コンテンツエリア　ここまで -->