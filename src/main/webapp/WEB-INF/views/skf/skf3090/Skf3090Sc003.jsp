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
<!--
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				-->
<!--
			</div>
			-->
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
			
				<table class="imui-form-search-condition">
					<tbody>
						<tr>
							<th style="width:10%;">
								<label>管理会社</label>
							</th>
							<td style="width:23%">
								<select style="width:95%">
									<option value="A"></option>
									<option value="B">NEXCO中日本</option>
									<option value="C">NEXCO東日本</option>
									<option value="D">NEXCO西日本</option>
									<option value="E">高速道路総合研究所</option>
									<option value="F">外部機関</option>
								</select>
							</td>
							<th style="width:10%">
								<label>事業領域コード</label>
							</th>
							<td style="width:23%">
							<input style="width: 60%;" placeholder="例 A001"></input>
							</td>
							<th style="width:10%;">
								<label style="width:80px;">事業領域名</label>
							</th>
							<td style="width:95%">
								<input style="width: 60%;" placeholder="例 本社 〇〇部1"></input>
							</td>
						</tr>

						<tr>
						<td style="border:none">
							<input type="button" value="検索" class="imui-small-button" onclick="location.href='S9003_JigyoRyouikiMasrerTouroku_after.html'"/>
						</td>
						</tr>
					</tbody>
					</table>
					
				<script type="text/javascript">
				  (function($){
				    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
				  })(jQuery);
				</script>

				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title" ><h2>検索結果</h2></div>
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
									"pager":false,
									"colNames":[
										"",
										"管理会社",
										"事業領域コード",
										"事業領域名",
										"管理機関",
										"削除"
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":12,
									"width":"1200	",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"A001","width":"250","align":"left"}<!-- 管理会社 -->
										,{"name":"A002","width":"160","align":"left"}<!-- 事業領域コード -->
										,{"name":"A003","width":"300","align":"left"}<!-- 事業領域名 -->
										,{"name":"A004","width":"300","align":"left"}<!-- 管理機関 -->
										,{"name":"A005","width":"080","align":"center"}<!-- 削除 -->
									],
									"rownumbers":false,
									"height":"352"
								};
								parameter.data = [
									{
										"id":1,
										"A001":"NEXCO中日本",
										"A002":"A001",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 監査役室'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":2,
										"A001":"NEXCO中日本",
										"A002":"A002",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 監査室'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":3,
										"A001":"NEXCO中日本",
										"A002":"A003",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 契約審査部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":4,
										"A001":"NEXCO中日本",
										"A002":"A004",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 経営企画部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":5,
										"A001":"NEXCO中日本",
										"A002":"A005",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 総務部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":6,
										"A001":"NEXCO中日本",
										"A002":"A006",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 広報部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":7,
										"A001":"NEXCO中日本",
										"A002":"A007",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 経理部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":8,
										"A001":"NEXCO中日本",
										"A002":"A008",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 情報システム部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":9,
										"A001":"NEXCO中日本",
										"A002":"A009",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 人事部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":10,
										"A001":"NEXCO中日本",
										"A002":"A010",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 建設事業部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
									{
										"id":11,
										"A001":"NEXCO中日本",
										"A002":"A011",
										"A003":"<input style=\"width: 95%;\" placeholder='例 本社 〇〇部' value='本社 契約審査部'></input>",
										"A004":"<select style=\"width:95%\"><option value='A'></option><option value='B' selected='selected'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
									},
								];

								grid.jqGrid(parameter);

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
						-->
					</style>
				</form>
			<br>
			<br>
			
				<table class="imui-form-search-condition">
				<tbody>
				<!-- 明細部 -->
				<!-- 明細部 -->
				<form id="sampleList2">
					<script type="text/javascript">
					  (function($){
						    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
						  })(jQuery);
					</script>

					<table name="imui-8eqlrzst4hv6std" id="sampleListTable2"></table>

					<div id="sampleListTable2-pager"></div>

					<script type="text/javascript">
						(function() {
							function imuiListTable() {
								var grid = jQuery('#sampleListTable2');
								var parameter = {
									"multiselect":false,
									"pager":false,
									"colNames":[
										"",
										"管理会社",
										"事業領域コード",
										"事業領域名",
										"管理機関",
										"追加"
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":12,
									"width":"1200	",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"A001","width":"250","align":"left"}<!-- 管理会社 -->
										,{"name":"A002","width":"160","align":"center"}<!-- 事業領域コード -->
										,{"name":"A003","width":"300","align":"left"}<!-- 事業領域名 -->
										,{"name":"A004","width":"300","align":"left"}<!-- 管理機関 -->
										,{"name":"A005","width":"080","align":"center"}<!-- 追加 -->
									],
									"rownumbers":false,
									"height":"37"
								};
								parameter.data = [
									{
										"id":1,
										"A001":"<select style='width:97%'><option value='A'></option><option value='B'>NEXCO中日本</option><option value='C'>NEXCO東日本</option><option value='D'>NEXCO西日本</option><option value='E'>高速道路総合研究所</option><option value='F'>外部機関</option></select>",
										"A002":"<input style=\"width: 97%;\" placeholder='例 A001'></input>",
										"A003":"<input style=\"width: 97%;\" placeholder='例 本社 〇〇部'></input>",
										"A004":"<select style=\"width:97%\"><option value='A'></option><option value='B'>本社</option></option><option value='C'>東京支社</option></option><option value='D'>八王子支社</option></option><option value='E'>名古屋支社</option></option><option value='F'>金沢支社</option>",
										"A005":"<a hidden>追加</a><input type='button' value='追加' class='imui-small-button' onclick=\"location.href=''\">",
									},
								];

								grid.jqGrid(parameter);

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
						-->
					</style>
				</form>
				</tbody>
			</table>
			<!--
			<div class="align-L">	
				<input type="button" value="CSV取込" class="imui-small-button" onclick="location.href='../../skf/Skf3020_Sc003/init'"/>
				<input type="button" value="取込状況を確認" class="imui-small-button" onclick="location.href='../../skf/Skf3020_Sc003/init'"/>
			</div>
			<br /><br /><br />
			
			<div class="align-L">
				<input style="width:150px;" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
			</div>
			-->
			<br>
			<div class="align-R">
				<input style="width:150px;" type="button" value="登録" class="imui-medium-button" onclick=""/>
			</div>
		</div>
			<br />

					</div>
	</div>
	<!-- コンテンツエリア　ここまで -->