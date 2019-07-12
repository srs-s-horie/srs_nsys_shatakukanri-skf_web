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
				<form id="form" class="target_form mt-10" action="" method="POST">
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th style="width: 5%;">
									<label>管理会社</label>
								</th>
								<td style="width: 7%;">
									<select style="width:185px;">
										<option value="0"></option>
										<option value="1">NEXCO中日本</option>
										<option value="2">NEXCO東日本</option>
										<option value="4">NEXCO西日本</option>
										<option value="5">高速道路総合研究所</option>
										<option value="6">外部機関</option>
									</select>
								</td>
								<th style="width: 5%;">
									<label>社宅区分</label>
								</th>
								<td style="width: 5%;">
									<select style="width:128px;">
										<option value="0"></option>
										<option value="1">保有</option>
										<option value="2">借上</option>
										<option value="3">区分所有</option>
										<option value="4">一棟借上</option>
									</select>
								</td>
								<th style="width: 5%;">
									<label>空き部屋</label>
								</th>
								<td style="width: 3%;">
									<select style="width:74px;">
										<option value="0"></option>
										<option value="1">なし</option>
										<option value="2">あり</option>
									</select>
								</td>
								<th style="width: 7%;">
									<label>社宅名</label>
								</th>
								<td style="width: 10%;">
									<input style="width:260px;" type="text" value="" placeholder="例　社宅名">
								</td>
							</tr>
							<tr>
								<th>
									<label>管理機関</label>
								</th>
								<td>
									<select style="width:185px;"><br />
										<option value="0"></option>
										<option value="1">本社</option>
										<option value="2">支社①</option>
										<option value="3">支社②</option>
										<option value="4">支社③</option>
										<option value="5">支社④</option>
									</select>
								</td>
								<th>
									<label>利用区分</label>
								</th>
								<td>
									<select style="width:128px;">
										<option value="1">使用中</option>
										<option value="2">廃止</option>
										<option value="3">解約済</option>
									</select>
								</td>
								<th>
									<label>空き駐車場</label>
								</th>
								<td>
									<select style="width:74px;">
										<option value="0"></option>
										<option value="1">なし</option>
										<option value="2">あり</option>
									</select>
								</td>
								<th>
									<label>社宅所在地</label>
								</th>
								<td>
									<input style="width:260px;" type="text" value="" placeholder="例　愛知県名古屋市中区錦2-18-19">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="align-L">	
					<input type="button" value="検索" class="imui-small-button" >
				</div>
				<script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>
				
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container"  style="width:1280px;">
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
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
										"管理会社",				
										"管理機関",							
										"社宅区分",						
										"利用区分",				
										"社宅名",						
										"社宅所在地",			
										"構造",				
										"経年",						
										"空き<br/>部屋数",					
										"空き<br/>駐車場数",						
										"基本",					
										"部屋",					
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
										,{"name":"kanri_kaisya","width":"115","align":"left"}<!-- 管理会社 -->
										,{"name":"kanri_kikan","width":"100","align":"left"}<!-- 管理機関 -->
										,{"name":"syataku_kubun","width":"60","align":"center"}<!-- 社宅区分 -->
										,{"name":"riyou_kubun","width":"60","align":"center"}<!-- 利用区分 -->
										,{"name":"syataku_mei","width":"175","align":"left"}<!-- 社宅名 -->
										,{"name":"syataku_syozaiti","width":"343","align":"left"}<!-- 社宅所在地 -->
										,{"name":"kouzou","width":"40","align":"center"}<!-- 構造 -->
										,{"name":"keinen","width":"40","align":"right"}<!-- 経年 -->
										,{"name":"aki_heyasuu","width":"50","align":"right"}<!-- 空き部屋数 -->
										,{"name":"aki_tyuusyajousuu","width":"60","align":"right"}<!-- 空き駐車場数 -->
										,{"name":"kihon","width":"65","align":"center"}<!-- メンテ -->
										,{"name":"heya","width":"65","align":"center"}<!-- ナンス -->
									],
									"rownumbers":true,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"kanri_kaisya":"NEXCO西日本",
										"kanri_kikan":"中国支社",
										"syataku_kubun":"保有",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"高陽寮",
										"syataku_syozaiti":"広島県広島市安佐北区亀崎3-6-12",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc002/init'\">",
										"heya":" <input type='button' title='部屋' value='部屋' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc004/init'\">"
									},{
										"id":2,
										"kanri_kaisya":"NEXCO東日本",
										"kanri_kikan":"関東支社",
										"syataku_kubun":"保有",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｱﾝﾌﾞﾗｯｾ新検見川",
										"syataku_syozaiti":"千葉県千葉市花見川区花園2-9-8",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc002/init'\">",
										"heya":" <input type='button' title='部屋' value='部屋' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc004/init'\">"
									},{
										"id":3,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"金沢支社",
										"syataku_kubun":"保有",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"泉ｹ丘寮",
										"syataku_syozaiti":"石川県金沢市泉が丘2-6-25",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc002/init'\">",
										"heya":" <input type='button' title='部屋' value='部屋' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc004/init'\">"
									},{
										"id":4,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"本社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"AREX丸の内",
										"syataku_syozaiti":"愛知県名古屋市中区丸の内2-12-8",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":5,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"本社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"AXIS桜通内山",
										"syataku_syozaiti":"愛知県名古屋市千種区内山1-19-28",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":6,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"本社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"REGALO覚王山",
										"syataku_syozaiti":"愛知県名古屋市千種区向陽町3-20-1",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":7,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"本社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"鶴舞ｶﾞｰﾃﾞﾝｺｰﾄ",
										"syataku_syozaiti":"愛知県名古屋市中区千代田3-15-7",
										"kouzou":"鉄筋",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":8,
										"kanri_kaisya":"高速道路総合研究所",
										"kanri_kikan":"高速道路総合研究所",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ﾙ･ｿﾚｲﾕ",
										"syataku_syozaiti":"神奈川県相模原市中央区上溝7",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":9,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｼｬﾝﾌﾟﾚﾝﾊｲﾂつくし野Ⅱ",
										"syataku_syozaiti":"東京都町田市南つくし野1-3-32",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":10,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":11,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":12,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":13,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":14,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":15,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":16,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":17,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":18,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":19,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									},{
										"id":20,
										"kanri_kaisya":"NEXCO中日本",
										"kanri_kikan":"東京支社",
										"syataku_kubun":"借上",
										"riyou_kubun":"<font style='color:blue'>使用中",
										"syataku_mei":"ｻﾝ・ﾄﾞﾏｰﾆ",
										"syataku_syozaiti":"静岡県静岡市清水区八坂東2-11-25",
										"kouzou":"木造",
										"keinen":"10年",
										"aki_heyasuu":"1室",
										"aki_tyuusyajousuu":"1台",
										"kihon":" <input type='button' title='基本' value='基本' class='imui-small-button' onclick=\"location.href='../../skf/Skf3010_Sc006/init'\">",
										"heya":""
									}
								];

								grid.jqGrid(parameter);

//								// ヘッダ結合
//								grid.jqGrid('setGroupHeaders', {
//									useColSpanStyle: true,
//									groupHeaders:[
//										{startColumnName: 'kihon', numberOfColumns: 2,  titleText: 'メンテナンス'},
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
<!-- 				<input style="width:150px;" id="" type="button" value="契約情報出力" class="imui-medium-button"  onclick="location.href=''"/> -->
<!-- 				<input style="width:150px;" id="" type="button" value="新規（借上）" class="imui-medium-button"  onclick="location.href='../../skf/Skf3010_Sc006/init'"/> -->
<!-- 				<input style="width:150px;" id="" type="button" value="複写（借上）" class="imui-medium-button"  onclick="location.href='../../skf/Skf3010_Sc006/init'"/> -->
<!-- 				<input style="width:150px;" id="" type="button" value="新規（一棟）" class="imui-medium-button" onclick="location.href='../../skf/Skf3010_Sc002/init'"/> -->
<!-- 				<input style="width:150px;" id="" type="button" value="新規（保有・区分）" class="imui-medium-button" onclick="location.href='../../skf/Skf3010_Sc002/init'"/> -->
<input style="width:150px;" id="" type="button" value="契約情報出力" class="imui-medium-button"  onclick="location.href=''"/>
					<input style="width:150px;" id="" type="button" value="新規（借上）" class="imui-medium-button"  onclick="location.href='../../skf/Skf3010_Sc006/init'"/>
					<input style="width:150px;" id="" type="button" value="複写（借上）" class="imui-medium-button"  onclick="location.href='../../skf/Skf3010_Sc006/init'"/>
					<input style="width:150px;" id="" type="button" value="新規（一棟）" class="imui-medium-button" onclick="location.href='../../skf/Skf3010_Sc002/init'"/>
					<input style="width:150px;" id="" type="button" value="新規（保有・区分）" class="imui-medium-button" onclick="location.href='../../skf/Skf3010_Sc002/init'"/>
			</div>
		</div>
	</div>
	<!-- コンテンツエリア　ここまで -->