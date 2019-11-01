<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="utf-8" />
	<meta name="author" content="NTT DATA INTRAMART CORPORATION" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="google" content="notranslate">

	<!-- モック用にコメント <base href='http://localhost:8080/imart/' target="_self">-->
	<link rel="icon" href="http://localhost:8080/imart/favicon.ico" type="image/x-icon" />
	<link rel="Shortcut Icon" type="img/x-icon" href="http://localhost:8080/imart/favicon.ico" />

	<!-- 8.0.0 -->
	<link rel="stylesheet" type="text/css" href="../../ui/theme/im_theme_dropdown_orange/css/theme.css" />
	<link rel="stylesheet" type="text/css" href="../../ui/css/imui.css" />
	<link rel="stylesheet" type="text/css" href="../../ui/css/bootstrap.css">

	<!--[if lt IE 9]>
	<script type="text/javascript" src="ui/libs/html5.js"></script>
	<![endif]-->
	
	<script type="text/javascript" src="../../ui/libs/jquery-1.7.2.js" ></script>
	<script type="text/javascript" src="../../ui/libs/jquery-ui-1.8.21.custom.js" ></script>
	<script type="text/javascript" src="../../ui/libs/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../ui/libs/jstree_pre1.0_fix/jquery.jstree.js"></script>
	<script type="text/javascript" src="../../csjs/libs/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
	<script type="text/javascript" src="../../ui/libs/jquery.jqGrid-4.3.3/js/jquery.jqGrid.src.js" defer="defer"></script>

	<link rel="stylesheet" type="text/css" href="../../ui/libs/jQuery-File-Upload/css/jquery.fileupload-ui.css">

	<script type="text/javascript" src="../../ui/libs/jQuery-File-Upload/js/tmpl.min.js" defer="defer"></script>
	<script type="text/javascript" src="../../ui/libs/jQuery-File-Upload/js/jquery.iframe-transport.js" defer="defer"></script>
	<script type="text/javascript" src="../../ui/libs/jQuery-File-Upload/js/jquery.fileupload.js" defer="defer"></script>
	<script type="text/javascript" src="../../ui/libs/jQuery-File-Upload/js/jquery.fileupload-ip.js" defer="defer"></script>
	<script type="text/javascript" src="../../ui/libs/jQuery-File-Upload/js/jquery.fileupload-ui.js" defer="defer"></script>
	<script type="text/javascript" src="../../ui/libs/jQuery-File-Upload/js/jquery.fileupload-jui.js" defer="defer"></script>
	<script type="text/javascript" src="../../ui/js/jquery.imui.fileupload.js" defer="defer"></script>
	<script type="text/javascript" src="../../csjs/libs/lightbox2/js/lightbox.js"></script>
	<script type="text/javascript" src="../../ui/libs/chardinjs/js/chardinjs.js" defer="defer"></script>

	<link rel="stylesheet" type="text/css" href="../../ui/libs/chardinjs/css/chardinjs.css">

	<script type="text/javascript" src="../../ui/common/sessionkeeper"></script>
	<script type="text/javascript" src="../../ui/js/i18n/imui-ja.js" ></script>
	<script type="text/javascript" src="../../ui/js/imui.js" ></script>

	<script src="../../ui/js/imui-form-util.js"></script>

	<script type="text/javascript" src="../../ui/theme/im_theme_dropdown_orange/js/theme.js" ></script>
	<script type="text/javascript" src="../../csjs/im_json.js" ></script>
	<script type="text/javascript" src="../../csjs/im_window.js" ></script>
	<script type="text/javascript" src="../js/common/common.js" ></script>

	<link rel="stylesheet" type="text/css" href="../css/common/common.css" />

	<!-- OSK追加スタイルシート -->
	<link rel="stylesheet" type="text/css" href="../css/common/common_osk_add.css" />

	<script type="text/javascript" src="../../ui/libs/jquery-validation-1.9.0/jquery.validate.js" ></script>

	<!-- モック用にコメント <script type="text/javascript" src="gfk/js/gfk01/gfk01_sc001.js" ></script>-->

	<title>社宅申請システム</title>

	<script>
		(function($) {
			$(document).ready(function() {
				var message = '';
				var options = ({});
				var messageType = '';
				var detail = [];
				if(messageType == 'warning') {
				  $.imuiFormUtil.showWarningMessage(message, detail, options);
				} else {
				  $.imuiFormUtil.showSuccessMessage(message, options);
				}
				$('#imui-nav-global > div.imui-nav-global-wrap').css('visibility','visible');

				if (window.location.pathname.search('/home$') > 0) {
					$('.imui-logo').attr('data-intro','ホーム（ログイン後の画面）に戻ります。');
					$('#im_global_nav').attr('data-intro','メニューです。ここから各種画面へ遷移します。「サイトマップ」には全メニュー一覧を表示します。');
					$('#imui-nav-global-search-wrapper').children().attr({'data-intro':'全文検索を行います。','data-width':'145px','data-lineType':'short','data-align':'left'});
					$('#imui-user-utility').attr('data-intro','個人設定、ログアウトを行います。');
					$('.imui-nav-global-launcher').attr('data-intro','よく利用するメニューの設定・呼び出しができます。');
				}
				var home = '/home';
				if (window.location.pathname.search(home+'$') > 0) {
					$('#imui-nav-help-dropdown').imuiPopover({'title':'画面のヘルプを表示します','contents':'ヘルプドロップダウンを開いてヘルプを見てみましょう','store':'cookie'});
				}
			});
		})(jQuery);
	</script>
</head>

<body>

	<div id="imui-container" style="width:650px;min-width:650px;max-width: 1000px;">
		<!-- ヘッド情報 -->

		<script type="text/javascript">
			var INFO=""
				if(INFO!=""){
					imuiShowSuccessMessage(INFO);
				}
			window.onload=function(){
				$(".hasDatepicker").each(function(e){
					$(this).css("width","100px");
				});
				if($("#errMainDiv").children().length!=undefined && $("#errMainDiv").children().length>1){
					$("#errMainDiv").css("display","inline-block");
				}
				
			};
			var W_GFK_0001 = "{0}を行います。<br/>よろしいですか？";
			var W_GFK_0002 = "前画面に戻ります。<br/>入力途中のものがあれば破棄されます。よろしいですか？";
			var W_GFK_0003 = "画面の再表示を行います。<br/>よろしいですか？";
			var W_GFK_0004 = "入力情報が破棄されますが、よろしいですか？";
			var W_GFK_0005 = "復旧工事を「無」に選択した工事担当の工事費用登録情報は削除されますが、よろしいですか？";
			var W_GFK_0006 = "登録後の修正はできません。登録を続けてよろしいですか？";
			var W_GFK_0007 = "社宅TOPに戻ります。<br/>入力途中のものがあれば破棄されます。よろしいですか？";
			var I_GFK_0001 = "{0}処理が正常に終了しました。{1}";

			var E_GFK_0001 = "未入力の項目があります。";
			var E_GFK_1001 = "当該データは他のユーザによって既に処理されました。{0}";
			var E_GFK_0006 = "指定した文字列の属性が不正です。{type}";
			var E_GFK_0012 = "登録対象を選択してください。";
			var E_GFK_0014 = "選択されたファイルはCSVファイルでないため取込できません。";
			var E_GFK_0015 = "取込対象ファイルが0件です。";
			var E_GFK_0016 = "取込対象ファイルの項目数が不正です。";
			var E_GFK_0020 = "削除対象を選択してください。";
			var E_GFK_0022 = "登録ボタン押下前に計算ボタンを押下してください。";
			var E_GFK_0023 = "債権の明細が0件となるため削除できません。";
			var E_GFK_0070 = "{0}に、締め年月以前の日付は設定できません。";
			var E_GFK_0071 = "{0}が締め年月以前のため、取消できません。";
			var E_GFK_0073 = "削除対象の明細が存在しません。";
			var E_GFK_0075 = "メニューグループが設定されていません。";
			var E_GFK_0076 = "認可設定が存在しません。";
		</script>

		<div name="imui-8euruuk0pdn95tq" id="confirm_dialog" style="display: none;">
			<div>
				<div style="float:left;width:15%;">
					<span class="im-ui-icon-common-32-question imui-icon-float-left"></span>
				</div>
				<div style="float:left;width:85%;padding-top:10px;">
					<span
						id="message_confirm"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript">jQuery(function () {jQuery("#confirm_dialog").imuiDialog({"buttons":[{"name":"imui-8euruuk0pdn97tq","text":"はい","id":"imui-8euruuk0pdn96tq","click":button_ok},{"name":"imui-8euruuk0pdn99tq","text":"いいえ","id":"imui-8euruuk0pdn98tq","click":button_ng}],"autoOpen":false,"show":{"effect":"fade"},"title":"確認","modal":true});});
		</script>
		<div name="imui-8euruuk0pdn9atq" id="alert_dialog" style="display: none;">
			<span class="im-ui-icon-common-32-tick imui-icon-float-left"></span>
			<span style="width:30px;"></span>
			<span id="message_alert"></span>
			
		</div>
		<script type="text/javascript">jQuery(function () {jQuery("#alert_dialog").imuiDialog({"buttons":[{"name":"imui-8euruuk0pdn9ctq","text":"確認","id":"imui-8euruuk0pdn9btq","click":button_alert}],"autoOpen":false,"show":{"effect":"fade"},"modal":true});});
		</script>
		<div name="imui-8euruuk0pdn9dtq" id="warning_dialog" style="display: none;">
			<span class="im-ui-icon-common-32-warning imui-icon-float-left"></span>
			<span id="message_warning"></span>
		</div>
		<script type="text/javascript">jQuery(function () {jQuery("#warning_dialog").imuiDialog({"buttons":[{"name":"imui-8euruuk0pdn9ftq","text":"確認","id":"imui-8euruuk0pdn9etq","click":button_warning}],"autoOpen":false,"show":{"effect":"fade"},"modal":true});});
		</script>

		<!-- 画面タイトル -->
		<div class="imui-title">
			<h1>賃貸人（代理人）選択</h1>
		</div>
		<!-- 以下ツールバー -->

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
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="550px" style="width:100%; min-width:550px;max-width: 550px;">
			<div style="height:30px; bottom:10px">検索条件を指定して、<font color="green">「検索」</font>をクリックしてください。</div>
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<form id="form" class="target_form mt-10" action="" method="POST">
					<table class="imui-form-search-condition">
						<tbody>
							<!--<tr>
								<th style="width: 7%;">
									<label>賃貸人（代理人）番号</label>
								</th>
								<td style="width: 10%;">
									<input style="width:260px;" type="text" value="">
								</td>
							</tr>-->
							<tr>
								<th style="width: 7%;">
									<label>氏名又は名称</label>
								</th>
								<td style="width: 10%;">
									<input style="width:260px;" type="text" value="">
								</td>
							</tr>
								<th style="width: 7%;">
									<label>氏名又は名称（フリガナ）</label>
								</th>
								<td style="width: 10%;">
									<input style="width:260px;" type="text" value="">
								</td>
							</tr>
							<tr>
								<th style="width: 7%;">
									<label>住所</label>
								</th>
								<td style="width: 10%;">
									<input style="width:260px;" type="text" value="">
								</td>
							</tr>
							<tr>
								<th style="width: 7%;">
									<label>個人法人区分</label>
								</th>
								<td style="width: 10%;">
							     <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="     width:50%;">
                                    <option style="    " value="0" label=""></option>
                                    <option style="    " value="1" label="個人">個人</option>
                                    <option style="    " value="2" label="法人">法人</option>
                                </select>
								</td>
							</tr>

						</tbody>
					</table>
				</form>
				<div class="align-L">	
					<input type="button" value="検索" class="imui-small-button" >
					<!--<input type="button" value="クリア" class="imui-small-button" >-->
				</div>
<br>
			<!-- 明細＆細目未満 -->
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
					<script type="text/javascript">
						(function($){
						$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
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
										"氏名又は名称",				
										"氏名又は名称<br>（フリガナ）",
										"個人法人区分",
										"住所",							
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":1000,
									"width":"550",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"A001","width":"110","align":"left"}<!-- 氏名又は名称 -->
										,{"name":"A002","width":"120","align":"left"}<!-- 氏名又は名称（フリガナ） -->
										,{"name":"A004","width":"060","align":"left"}<!-- 個人法人区分 -->
										,{"name":"A003","width":"320","align":"left"}<!-- 住所 -->
									],
									"rownumbers":false,
									"height":"200"
								};
								parameter.data = [
									{
										"id":1,
										"A001":"中日本 001",
										"A002":"ナカニホン 001",
										"A003":"○○県△△市××町",
										"A004":"個人",
									},
									{
										"id":2,
										"A001":"中日本 002",
										"A002":"ナカニホン 002",
										"A003":"○○県△△市××町",
										"A004":"個人",
									},									{
										"id":3,
										"A001":"NEXCO中日本",
										"A002":"ネクスコナカニホン",
										"A003":"○○県△△市××町",
										"A004":"法人",
									},								];

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
							
						    .ui-jqgrid-labels div{
						        white-space:normal;
						    }
						-->
					</style>
				</form>
				<br>
			<div class="align-R">
				<input style="width:100px;" id="" type="button" value="画面を閉じる" class="imui-small-button"  onclick="window.close()"/>
				<input style="width:100px;" id="selectBtn" type="button" value="選択" class="imui-small-button" />
				<!--<input style="width:100px;" id="" type="button" value="キャンセル" class="imui-small-button"  onclick="window.close()"/>-->
				
			</div>
			<script type="text/javascript">
			jQuery(function ($) {
				$("#selectBtn").click (function() {
					//alert("1");
					var array = [];
				    $('area-selected:true').each(function() {
				        array.push($(this).attr('id'));
				        alert($(this).attr('id'));
				    });

					//alert(array);
				});			  
			});

			</script>
			</div>
		</div>

</body>
</html>
