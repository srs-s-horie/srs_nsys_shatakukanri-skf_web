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
    <header id="imui-header">
        <nav id="imui-nav-global">
            <div class="imui-nav-global-wrap">
                <h1 class="imui-logo" data-lineType="short"><a href="#"><img src="../../ui/theme/im_theme_dropdown_orange/images/logo.png" height="35"></a></h1>

    <!-- メニュー用 -->
    <ul data-width="400px" id="im_global_nav" class="imui-nav-global-list">
        <!-- Topのメニュー用（モック作成時は特に変更する必要なし） -->
        <li >
            <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">Top</span></span></a>
            <ul >
                <li >
                    <a href="../../index.html"><span><span class="imui-dropdown-label">Portal</span></span></a>
                </li>
                <li >
                    <a href="../../index.html"><span><span class="imui-dropdown-label">FileExchange</span></span></a>
                </li>
            </ul>
        </li>

        <!-- システムのメニュー用 -->
        <li>
        <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">System</span></span></a>
        <ul>
        <!-- 社宅申請システムのメニュー用 -->
        <li >
            <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">社宅申請システム&nbsp;&nbsp;</span></span></a>
            <ul >
                <li >
                    <a href="../common/top.html"><span><span class="imui-dropdown-label">TOP画面</span></span></a>
                </li>
                <li >
                    <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">社宅管理&nbsp;&nbsp;</span></span></a>
                    <ul >
                        <li >
                            <a href="../S1001/S1001_ShatakuSearchPage.html"><span><span class="imui-dropdown-label">社宅一覧</span></span></a>
                        </li>
                    </ul>
                </li>
                <li >
                    <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">Menu2</span></span></a>
                    <ul >
                        <li >
                            <a href="#"><span><span class="imui-dropdown-label">Menu2-1</span></span></a>
                        </li>
                    </ul>
                </li>
                <li >
                    <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">Menu3</span></span></a>
                    <ul >
                        <li >
                            <a href="#"><span><span class="imui-dropdown-label">Menu3-1</span></span></a>
                        </li>
                    </ul>
                </li>
                <li >
                    <a href="javascript: void(0);" ><span><span class="imui-dropdown-label">Menu4</span></span></a>
                    <ul >
                        <li >
                            <a href="#"><span><span class="imui-dropdown-label">Menu4-1</span></span></a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    </ul>

    <!-- メニューを制御するためのJavaScript（削除しないこと） -->
    <script>
        (function($){
            $("#im_global_nav").imuiDropdown({"lazy":true});
        })(jQuery);
    </script>

    <!-- tenantのメニュー用（モック作成時は特に変更する必要なし） -->
    <div id="imui-nav-global-utility" style="position:absolute;right:0">
    <script type="text/javascript" src="../../im_menu/csjs/im_menu.js"></script>
        <ul data-width="200px" style="display:inline-block;margin-top:10px;vertical-align:top;margin-right:0" id="imui-user-utility" >
            <li class="imui-nav-global-pulldown">
                <a href="javascript:void(0);">tenant</a>
                <ul class="imui-nav-global-pulldown-inner" style="display:none">
                    <li>
                        <a href="javascript:void(0)"><span><span class="imui-menu-item-label imui-dropdown-label">個人設定</span></span></a>
                        <ul>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">パスワード</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">カレンダー</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">ロケール</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">日付と時刻の形式</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">テーマ</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">メニュー表示</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">プライベートグループ</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">プロファイル</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">メッセージ通知</span></span></a>
                            </li>
                            <li>
                                <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">数値形式</span></span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../../index.html"><span><span class="imui-menu-item-label imui-dropdown-label">スマートフォン版へ</span></span></a>
                    </li>
                    <li>
                        <a href="logout"><span><span class="imui-menu-item-label imui-dropdown-label">ログアウト</span></span></a>
                    </li>
                </ul>
            </li>
        </ul>

        <ul id="imui-nav-global-launcher-wrapper" style="display:inline-block;">
            <li class="imui-nav-global-launcher" data-align="left" data-width="200px" data-lineType="long">
                <a class="action"><img src="../../ui/theme/im_theme_dropdown_orange/images/btn_im_01.png" height="45"></a>
            </li>
        </ul>
        <ul id="imui-nav-help-dropdown">
            <li>
                <a data-im-icon-class="im-ui-icon-compornent-help-white" ><span><span class="imui-dropdown-label"></span></span></a>
                <ul>
                    <li id="start_help_pc">
                        <a href="empty" ><span><span class="imui-dropdown-label">ヘルプを表示する</span></span></a>
                    </li>
                    <li id="terms_and_conditions_of_use_pc">
                        <a href="http://www.intra-mart.jp/document/library/iap/public/operation/user_guide/texts/conditions_of_use/index.html" target="_blank" ><span><span class="imui-dropdown-label">ブラウザの利用条件</span></span></a>
                    </li>
                    <li id="user_guide_pc">
                        <a href="http://www.intra-mart.jp/general/user/" target="_blank" ><span><span class="imui-dropdown-label">ユーザ操作ガイド</span></span></a>
                    </li>
                    <li id="admin_guide_pc">
                        <a href="http://www.intra-mart.jp/general/admin/" target="_blank" ><span><span class="imui-dropdown-label">管理者操作ガイド</span></span></a>
                    </li>
                </ul>
            </li>
        </ul>

    <!-- メニューを制御するためのJavaScript（削除しないこと） -->
    <script>
        (function($){
            $("#imui-nav-help-dropdown").imuiDropdown({});
        })(jQuery);
    </script>


    </div>
        <form name="loginForm" action="login" method="POST">
            <input type="hidden" name="im_url" value="">
        </form>

            </div>
        </nav>
    </header>

    <div id="imui-container">
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

    <h1>賃貸人（代理人）情報登録</h1>
</div>
<!-- 以下ツールバー -->
<div class="imui-toolbar-wrap">
    <div class="imui-toolbar-inner">
        <!-- ツールバー左側 -->
        <ul class="imui-list-toolbar">
            <!-- 戻る -->
            <li><a class="imui-toolbar-icon" title="戻る" tabindex="23"
                onclick="back1()" href="javascript:void(0);"><span
                    class="im-ui-icon-common-16-back"></span></a></li>


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
        showConfirm(W_GFK_0002, function() {
            $.StandardPost("../common/top.html");
        });
    }
    
    
        /**
     * 「登録」ボタン押下時
     */
    function touroku() {
        showConfirm(W_GFK_0001.replace('{0}', '登録'), function() {
                 
            $.StandardPost("S0000_ShoyushaJouhouIchiran.html");
      var INFO="登録が正常に終了しました。"
      
      if(INFO!=""){
      imuiShowSuccessMessage(INFO);
}
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

<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv">
<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;">
</div>
</div>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
    <table>
        <tr>
            <td>
                <div>
                    <table class="imui-form-search-condition" width="1350px">
                        <td class="imui-form-container-wide" style="width: 100%; border: none;max-width:1300px;width:1300px" >
                                <div class="imui-chapter-title" style="margin-bottom: 1px;">
                                    <h2>賃貸人（代理人）情報</h2>
                                </div>
                                <form id="form" class="target_form mt-10" action="" method="POST">
                                <table class="imui-form-search-condition">
                                <tbody>
                                    <tr>
                                        <th rowspan="5" style="width:110px">
                                            <label>
                                                賃貸人（代理人）
                                            </label>
                                        </th>

                                        <th  style="width: 170px;"><label>氏名又は名称</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 250px;" type="text" value="中日本　太郎" placeholder="例 中日本 一郎"></input>
                                        </td>
                                    <th  style="width: 150px;" rowspan="2"><label>住所（居所）又は所在地</label></th>
                                    <th  style="width: 80px;"><label>郵便番号</label></th>
                                    <td>
  									<input class="ime-off" style="width:85px;" type="text" value="" placeholder="例　4600003">
									<input type="button" value="住所検索" class="imui-small-button"/>

                                    </td>
                                </tr>

                                <tr>
                                    <th  style="width: 170px;"><label>氏名又は名称（フリガナ）</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 250px;" type="text" value="ナカニホン　タロウ" placeholder="例 ナカニホン　タロウ"></input>
                                    </td>
                                    <th  style="width: 80px;"><label>住所</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 350px;" type="text"  placeholder="例　愛知県名古屋市中区錦2-18-19"></input>
                                    </td>


                                </tr>
                                <tr>
                                    <th  style="width: 170px;"><label>個人法人区分</label></th>
                                    <td  colspan="4">
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="width:10%;" >
                                            <option  value="0" label=""></option>
                                            <option  value="1" label="個人">個人</option>
                                            <option  value="2" label="法人">法人</option>
                                        </select>
                                    </td>

                                </tr>
                                <tr>
                                    <th  style="width: 170px;"><label>個人番号</label></th>
                                    <td colspan="5">
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="width:32%;">
                                            <option style="    " value="0" label=""></option>
                                            <option style="    " value="1" label="提出済">提出済</option>
                                            <option style="    " value="2" label="未提出（拒否議事録提出済）">未提出（拒否議事録提出済）</option>
                                            <option style="    " value="3" label="未提出（収集中）">未提出（収集中）</option>
                                            <option style="    " value="4" label="提出不要（個人への支払い、かつ、15万未満）">提出不要（個人への支払い、かつ、15万未満）</option>
                                            <option style="    " value="4" label="提出不要（法人への支払い）">提出不要（法人への支払い）</option>
                                        </select>
                                        <input class="ime-off" style="width: 35%;" type="text" placeholder="例　督促状況"></input>
                                    
                                </tr>
                                 <tr>
                                    <th  style="width: 170px;"><label>備考</label></th>
                                    <td colspan="4">
                                    <textarea rows="2"  cols="150" placeholder="例　共有持分不明につき総額"></textarea>
                                    </td>
                                </tr>
                        </div>
                            </tbody>
                        </table>

<!--
                                <form id="form" class="target_form mt-10" action="" method="POST">
                                <table class="imui-form-search-condition">
                                <tbody>
                                    <tr>
                                        <th rowspan="11" style="width:80px">
                                            <label>
                                                口座
                                            </label>
                                        </th>

                                    <th  style="width: 170px;"><label>口座名義</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 250px;" type="text" placeholder="例 ナカニホン　タロウ"></input>
                                        </td>
                                    <td  style="width: 200px;border:none;"></td>
                                    <td style="width: 200px;border:none;">
                                    </td>

                                </tr>


                                <tr>
                                <th  style="width: 170px;" ><label><input type="radio" name="1" checked>銀行</label></th>
                                        
                                </tr>

                                <tr>
                                    <th  style="width: 170px;"><label>銀行名</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 200px;" type="text" placeholder="例 〇〇銀行"></input>
                                        </td>
                                    <th  style="width: 200px;"><label>フリガナ（銀行名）</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 200px;" type="text" placeholder="例 全角カナ"></input>
                                    </td>

                                </tr>

                                 <tr>
                                        <th  style="width: 170px;"><label>支店名</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 200px;" type="text" placeholder="例 名古屋"></input>
                                        </td>
                                    <th  style="width: 200px;"><label>フリガナ（支店名）</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 200px;" type="text" placeholder="例 全角カナ"></input>
                                    </td>
                                </tr>

                                 <tr>
                                        <th  style="width: 170px;"><label>銀行コード</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 200px;" type="text" placeholder="例 半角数字"></input>
                                        </td>
                                    <th  style="width: 200px;"><label>店番号</label></th>
                                    <td>
                                    <input style="width:200px;" type="text" value="" placeholder="例 半角数字">
                                                

                                    </td>
                                </tr>
                                <tr>
                                    <th  style="width: 170px;"><label>口座番号</label></th>
                                    <td>
                                    <input style="width:200px;" type="text" value="" placeholder="例 半角数字">
                                    </td>
                                    <th  style="width: 170px;"><label> 口座種別 </label></th>
                                    <td>
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="width:50%;">
                                            <option  value="0" label=""></option>
                                            <option  value="1" label="普通預金">普通預金</option>
                                            <option  value="2" label="定期預金">定期預金</option>
                                        </select>
                                    </td>
                                </tr>


                                <tr>
                                <th  style="width: 170px;" ><label><input type="radio" name="1">ゆうちょ</label></th>
                                        
                                </tr>
                                
                                <tr>
                                                                        <th  style="width: 170px;"><label>ゆうちょ銀行記号・番号</label></th>
                                        <td  style="width: 350px;" colspan="4">
                                            &nbsp;1&nbsp;<input class="ime-off" style="width: 200px;" type="text" placeholder="例 半角数字"></input>&nbsp;0&nbsp;━&nbsp;<input class="ime-off" style="width: 200px;" type="text" placeholder="例 半角数字"></input>
                                        </td>
                                </tr>
                                
                                

                        </div>
                            </tbody>
                        </table>

                            </form>


                                <form id="form" class="target_form mt-10" action="" method="POST">
                                <table class="imui-form-search-condition">
                                <tbody>

                                    <tr>

                                        <th rowspan="10" style="width:80px">
                                            <label>
                                                口座
                                            </label>
                                        </th>
                                        <th  style="width: 170px;" rowspan="5" ><label><input type="radio" name="1" checked>銀行</label></th>
                                        
                                </tr>
                                
                                
                                <tr>
                                                                        <th  style="width: 170px;"><label>銀行名</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 200px;" type="text"></input>
                                        </td>
                                    <th  style="width: 200px;"><label>フリガナ（銀行名）</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 200px; text-align: right;" type="text"></input>
                                    </td>

                                </tr>

                                 <tr>
                                        <th  style="width: 170px;"><label>支店名</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 200px;" type="text"></input>
                                        </td>
                                    <th  style="width: 200px;"><label>フリガナ（支店名）</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 200px; text-align: right;" type="text"></input>
                                    </td>
                                </tr>

                                 <tr>
                                        <th  style="width: 170px;"><label>銀行コード</label></th>
                                        <td  style="width: 350px;">
                                            <input class="ime-off" style="width: 200px;" type="text"></input>
                                        </td>
                                    <th  style="width: 200px;"><label>店番号</label></th>
                                    <td>
                                    <input style="width:200px;" type="text" value="">
                                                

                                    </td>
                                </tr>
                                <tr>
                                    <th  style="width: 170px;"><label>口座番号</label></th>
                                    <td>
                                    <input style="width:200px;" type="text" value="">
                                    </td>
                                    <th  style="width: 170px;"><label> 口座種別 </label></th>
                                    <td>
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="width:50%;">
                                            <option  value="0" label=""></option>
                                            <option  value="1" label="普通預金">普通預金</option>
                                            <option  value="2" label="定期預金">定期預金</option>
                                        </select>
                                    </td>
                                </tr>


                                <tr>
                                <th  style="width: 170px;" rowspan="2" ><label><input type="radio" name="1">ゆうちょ</label></th>
                                        
                                </tr>
                                
                                <tr>
                                                                        <th  style="width: 170px;"><label>ゆうちょ銀行記号・番号</label></th>
                                        <td  style="width: 350px;" colspan="3">
                                            &nbsp;1&nbsp;<input class="ime-off" style="width: 200px;" type="text"></input>&nbsp;0&nbsp;━&nbsp;<input class="ime-off" style="width: 200px;" type="text"></input>
                                        </td>
                                </tr>
                                
                                

                        </div>
                            </tbody>
                        </table>

                            </form>
                            -->
</table>
</div>

</div>

                <div class="align-L float-L">
                <input class="imui-medium-button check" type="button" value="前の画面へ" style="width:150px;" onclick="back1()" style="width:150px;">
                </div>
                
                <div class="align-R">
                    <input name="doSendBack" id="" type="button" value="登録" class="imui-medium-button" onclick="touroku()"  style="width:150px;">
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


</table>
</div>


<!--
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;border:none;">
            <div class="imui-box-layout">
                <div class="align-R">
                    <input name="doSendBack" id="" type="button" value="登録" class="imui-medium-button" onclick="touroku()" />
                </div>
</div>
</div>
-->
<br>
    <!-- フッター表示域（モック作成時は特に変更する必要なし） -->
    <footer id="imui-footer">
        <div class="imui-footer-inner">
            <p class="imui-copy">Copyright &#169; 2012 NTT DATA INTRAMART CORPORATION</p>
            <ul class="imui-footer-utility">
              <li><img src="../../ui/theme/im_theme_dropdown_orange/images/poweredbyim.png"/></li>
              <li><p id="imui-to-top"><a>top &uarr;</a></p></li>
            </ul>
        </div>
    </footer>

</body>
</html>
