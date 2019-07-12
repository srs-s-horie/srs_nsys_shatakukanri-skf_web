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
            <li><a class="imui-toolbar-icon" title="戻る" tabindex="23"
                onclick="back1()" href="javascript:void(0);"><span class="im-ui-icon-common-16-back"></span></a>
            </li>

        </ul>
        <!-- ツールバー右側 -->
        <ul class="imui-list-box-toolbar-utility">
            <li>
                <a onclick="TOP()" class="imui-toolbar-icon" tabindex="16">
                <span class="im-ui-icon-common-16-home"></span>
                    社宅TOP
                </a>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>
</div>
<script type="text/javascript">
    /**
     * メニュー画面へ遷移する。
     */
    function back() {
        showConfirm(W_GFK_0002, function() {
            $.StandardPost("../common/top.html");
        });
    }

    /**
     * 「申請内容を確認」ボタン押下時
     */
    function confreq() {
        showConfirm(W_GFK_0001.replace('{0}', '申請内容を確認'), function() {
         $.StandardPost("../../skf/Skf2040_Sc002/init");
        });
    }
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
        showConfirm(W_GFK_0002, function() {
            history.back()
        });
    }
    /**
     * TOP画面へ遷移する。
     */
    function TOP() {
        showConfirm(W_GFK_0007, function() {
            $.StandardPost("../common/top.html");
        });
    }
</script>



    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
        <table class="imui-form-search-condition">
        
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">

				<!-- 明細部 -->
				<form id="sampleList1">
				<!--
					<div class="imui-chapter-title" style="max-width:900px;" ><h2></h2></div>
					-->
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
										"編集",
										"公開開始日",
										"お知らせ",
										"削除"
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":12,
									"width":"900",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"A001","width":"090","align":"center"}<!-- 編集 -->
										,{"name":"A002","width":"100","align":"center"}<!-- 公開開始日 -->
										,{"name":"A003","width":"520","align":"left"}<!-- お知らせ -->
										,{"name":"A004","width":"090","align":"center"}<!-- 削除 -->
									],
									"rownumbers":false,
									"height":"352"
								};
								parameter.data = [
									{
										"id":1,
										"A001":"<a hidden>編集</a><input type='button' value='編集' class='imui-small-button' onclick=\"location.href=''\">",
										"A002":"2017/02/20",
										"A003":"お知らせ",
										"A004":"<a hidden>削除</a><input type='button' value='削除' class='imui-small-button' onclick=\"location.href=''\">",
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
							/* ヘッダテキスト中央寄せ */
							.ui-jqgrid .ui-jqgrid-htable th div {
								display:table-cell;
							    height: 32px;
								text-align:center;
								vertical-align:middle;
							}
					</style>
				</form>

                    </td>
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                      <table >
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>操作ガイド</h2>
                        </div>
                        <div>
                        <div style="overflow-y:scroll;height:99%">
                            <span style="font-size: 100%; heigth:90%;">
                            ■お知らせの公開開始日とお知らせ内容を一覧表示します。
                            <br><br>
                            ■新規登録する場合は<span style="font-weight: bold;color:green;">「お知らせ内容を登録」</span>をクリックします。
                            <br><br>
                            ■削除する場合は<span style="font-weight: bold;color:green;">「削除」</span>をクリックします。
                            <br><br>
                            ■内容を変更する場合は一覧の<span style="font-weight: bold;color:green;">「編集」</span>をクリックし、お知らせ内容を編集してから
                            <span style="font-weight: bold;color:green;">「お知らせ内容を登録」</span>をクリックします。
                            <br>

                            </span>
                        </div>
                      </table>
                    </td>
                </tr>

            </tbody>
        </table>

                                   <table class="imui-form-search-condition">
                                  <th style="width:10%"><label>公開開始日</label></th>
                                  <td style="width:15%">
                                  <input type="text" name="cal001" id="cal001" value="9999/99/99"/>
                                  </td>
                                  <td style="border:none;">
                                  </td>

<!--------------------------------------------------------------------
          <tr>
            <th class="wd-20"><label class="imui-required">本文</label></th>
            <td>
              <div>
                <input name="edit_type" label="リッチテキスト" id="edittype-rich" type="radio" value="1" /><label for="edittype-rich" >リッチテキスト</label>
                <input name="edit_type" label="プレーンテキスト" id="edittype-plain" type="radio" value="2" /><label for="edittype-plain" >プレーンテキスト</label>
              </div>
              <div id="richtext-area">
                <div id="contents_html_parent" name="contents_html_parent">
                <textarea name="contents_html" style="width:650px;height:203px;" id="contents_html" style="visibility:hidden;" class="imui-richtextbox-textarea"></textarea>
                <textarea id="contents_html_plain" name="contents_html_plain" style="display:none;" class="imui-richtextbox-textarea"></textarea>
                </div>

<script type="text/javascript">
    (function($) {
        $(document).ready(function($) {
            if (window.tinyMCE != null) {
                tinyMCE.execCommand("mceRemoveEditor", true,'contents_html');
            }
            var writer = function() {
                $(tinymce.get('contents_html').getBody()).find('a[data-mce-href^="javascript:"]').each(function(){
                    $(this).removeAttr('href');
                })
                var content = $('#contents_html').tinymce().getContent();
                document.getElementById('contents_html').value = content;
                var plain = content.replace(/<br\/>/g, "\n");
                plain = plain.replace(/<br \/>/g, "\n");
                plain = plain.replace(/<("[^"]*"|\'[^\']*\'|[^\'">])*>/g, "");
                plain = plain.replace(/&lt;/g, '<');
                plain = plain.replace(/&gt;/g, '>');
                plain = plain.replace(/&nbsp;/g, ' ');
                plain = plain.replace(/&quot;/g, "\"");
                plain = plain.replace(/&amp;/g, '&');
                $('#contents_html_plain').val(plain);
            };

            window.tinyMCEPreInit = window.tinyMCEPreInit || {
                base: 'https://www2.intra-mart.jp/iapdemo/csjs/libs/tinymce/js/tinymce',
                suffix: '.min'
            };
            var options = {
                document_base_url : 'https://www2.intra-mart.jp/iapdemo/',
                script_url : '../../csjs/libs/tinymce/js/tinymce/tinymce.min.js',
                language : 'ja',
                entity_encoding : 'raw',
                content_css : '../../ui/libs/tinymce/css/content.css',
                formats: {
                  alignleft: [
                    {selector: 'figure,p,h1,h2,h3,h4,h5,h6,td,th,tr,div,ul,ol,li',styles: {textAlign: 'left'},inherit: !1,defaultBlock: 'div'},
                    {selector: 'img,table', collapsed: false, styles: {'float': 'left'}}
                  ],
                  alignright: [
                    {selector: 'figure,p,h1,h2,h3,h4,h5,h6,td,th,tr,div,ul,ol,li', styles: {textAlign: 'right'}, defaultBlock: 'div'},
                    {selector: 'img,table', collapsed: false, styles: {'float': 'right'}}
                  ]
                },
                branding : false,

                forced_root_block : 'p',

                theme : 'modern',
                toolbar_items_size: 'small',

                plugins : [
                  'paste searchreplace image insertdatetime preview textcolor colorpicker fullscreen table',
                  'hr charmap emoticons link media directionality print autolink lists contextmenu noneditable advlist'
                ],
                toolbar1 : 'newdocument | bold italic underline strikethrough | styleselect formatselect fontselect fontsizeselect | fullscreen',
                toolbar2 : 'cut copy paste pastetext | bullist numlist | alignleft aligncenter alignright alignjustify | outdent indent blockquote | forecolor backcolor | searchreplace | preview',
                toolbar3 : 'table | hr removeformat | subscript superscript | charmap emoticons link unlink image media | insertdatetime | ltr rtl | undo redo | print',

                fontsize_formats : '8px 10px 12px 14px 18px 24px 36px',

                menubar : false,
                resize : 'both',
                readonly : false,
                setup : function(ed) {
                    ed.on('NodeChange', function(e) {
                      writer();
                    });
                    ed.on('KeyUp', function(e) {
                      writer();
                    });

                },

            };

            $('#contents_html').tinymce(options);
        });
    })(jQuery);
</script>
                <div id="html-range"></div>
              </div>
              <div id="plaintext-area">
                <!--
                <textarea id="contents_text" name="contents_text" style="width:650px;height:203px;"></textarea>
                -->
                <!--
<script type="text/javascript">
  (function($){
  
  })(jQuery);
</script>
                <div id="text-range"></div>
              </div>
              <textarea name="plaintext" style="display:none;"></textarea>
            </td>
          </tr>
-------------------------------------------------------------------->
</table>

<!-- エディター-->
<table>
<tr>
  <meta charset="UTF-8">
  <script src="csjs/libs/tinymce/js/tinymce/tinymce.min.js"></script>
  <script>tinymce.init({
    selector: "textarea",
    language: "ja", // 言語 = 日本語
    plugins: "textcolor",
    branding: false, // クレジットの削除
    menubar: false,   // メニューバーを隠す
    statusbar: false,   // ステータスバーを隠す
    
    toolbar: [ // ツールバー(2段)
            // 戻る 進む | フォーマット | 太字 斜体 | 左寄せ 中央寄せ 右寄せ 均等割付 | 箇条書き 段落番号 インデントを減らす インデント
            "undo redo | formatselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor | fontsizeselect ",
            // 文字サイズ 文字色 画像 リンク
            //"fontsizeselect forecolor image link"
        ],
    init_instance_callback: function (editor) {
      editor.on('blur', function (e) {
        console.log('Editor was blurred!');
      });
    }
  });
  </script>
  <textarea></textarea>

</tr>
</table>
<!----------------a---------------------------------------------------->
<div class="imui-box-layout">
    <table style="width:100%;">
    <tbody>
<!--
<td align="left">
      <input class="imui-medium-button check" type="button" value="" style="width:150px;">
</td> 
-->
<td align="right">
      <input class="imui-medium-button check" type="button" value="お知らせ内容を登録" style="width:150px;">
</td>
    </tbody>
        <tbody>

    </tbody>

    </table>


    </div>

    </div>

    <!-- メッセージを表示するためのJavaScript（モック時はコメント）
    <script type="text/javascript">
        $(function() {
            showWarningDialog('', 'true');
        });

(function($){ $.imDateUtil.setOffset(540); $(function () { $("#jikoHaseiYmd").imuiCalendar({
"altField":"#jikoHaseiYmd","buttonText":"カレンダー","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"USA_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); 
})(jQuery);

    
    </script>
-->    

    
<script type="text/javascript">
    <!-- カレンダー出力用スクリプト -->
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



</div>
	<!-- コンテンツエリア　ここまで -->