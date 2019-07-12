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
     * 「同意する」ボタン押下時
     */
    function confreq() {
        showConfirm(W_GFK_0001.replace('{0}', '選択'), function() {
         $.StandardPost("../../skf/Skf2010_Sc003/init");
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

<!-- <div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!-- <div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!-- </div>  -->
<!-- </div> -->

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">


    <!-- コンテンツエリア -->
                          <table class="imui-form-search-condition">
                       <tr>
                            <th style="width: 10%;"><label>申請状況</label></th>
                            <td style="width: 10%;"><label>確認依頼</label></td>
                            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                      </tr>
                    </table>


<table align="center">
    <tr>
        <td>
            <div>
                <table class="imui-form-search-condition" width="1350px">
                    <td class="imui-form-container-wide" style="width: 50%; border: none;background-color: #fdfdff;" >
                     <div class="imui-form-container-wide" style="width: 650px;height:235px;">
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>借上物件提示対象者</h2>
                        </div>
                            <form id="form" class="target_form mt-10" action="" method="POST">
                                <table class="imui-form-search-condition">
                                    <tr>
                                        <th style="width: 80px;" rowspan="4">
                                            <label>所属</label>
                                        </th>
                                        <th style="width: 100px;">
                                            <label>機関</label>
                                        </th>
                                        <td colspan="2">
                                            本社
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="width: 100px;">
                                            <label>部等</label>
                                        </th>
                                        <td colspan="2">
                                            業務改革推進部
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="width: 100px;">
                                            <label>室、チームまたは課</label>
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        AAA
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 100px;">
                                            <label>勤務先のTEL</label>
                                            
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        000-1111-2222
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 80px;" rowspan="4">
                                            <label>提示対象者</label>
                                        </th>
                                        <th style="width: 100px;">
                                            <label>社員番号</label>
                                        </th>
                                        <td colspan="2">
                                            00013598
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px;">
                                            <label>氏名</label>
                                        </th>
                                        <td colspan="2">
                                            中日本 001
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="width: 100px;">
                                            <label>等級</label>
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        役員
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px;">
                                            <label>性別</label>
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        男
                                        </td>
                                    </tr>
                                </table>
                            </form>
                         </div>

            <td style="width: 50%; border: none;background-color: #fdfdff;">
                <div class="imui-form-container-wide" width="100%" style="width: 600px;height:235px;">
                <div style="overflow-y:scroll;max-height:220px;height:220px">
                    <table >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>操作ガイド</h2>
                        </div>
    <tr>
        <td width="25%" valign="top" align="left">
            選択
        </td>
        <td width="1%" valign="top" align="left">
            ：
        </td>
        <td width="74%" valign="top" align="left">
            承認者から提示された物件をチェックして選択します。<br>
            選択しない場合は、借上社宅名に「選択しない」と表示されている行にチェックを付けて「選択」します。<br>
        </td>
    </tr>
    <tr>
        <td width="25%" valign="top" align="left">
            選択しない理由
        </td>
        <td width="1%" valign="top" align="left">
            ：
        </td>
        <td width="74%" valign="top" align="left">
            提示された物件から選択しない場合は選択しない理由をドロップダウンから指定してください。<br>
            該当する理由がない場合は「その他」を指定し、テキストボックスに理由を記入します。
        </td>
    </tr>
    <tr>
        <td width="25%" valign="top" align="left">
            <span style="font-weight: bold;color:green;">「選択」</span>
        </td>
        <td width="1%" valign="top" align="left">
            ：
        </td>
        <td width="74%" valign="top" align="left">
            提示された物件を選択した、または提示された物件を選択しなかった結果を登録します。
        </td>
    </tr>
                        </div>
                    </table>
                </div>  
            </td>
</table>
</div>

</div>

</div>

<!-- テーブル一覧箇所 -->
<div class="imui-form-container" width="1200px" style="width: 100%; max-width: 1300px;">
  <table>
                                <tr>
                                    <td colspan="2">
                                        <table class="imui-form-search-condition" style="width:100%;">
                                            <tbody>
                                                <tr>
                                                    <th  style="width:90px;"><label>選択</label></th>
                                                    <th style="width:500px;"><label>借上社宅名</label></th>
                                                    <th style="width:400px;"><label>社宅所在地</label></th>
                                                    <th  style="width:200px;"><label>添付ファイル</label></th>
                                                </tr>

                                                <tr>
                                                    <td style="text-align:center;">
                                                        <input type="radio" name="example" checked>
                                                    </td>
                                                    <td style="text-align:left;">
                                                        リバーサイド墨田 105号室
                                                    </td>
                                                    <td style="text-align:left;">
                                                        東京都〇〇区△△△１-1-1
                                                    </td>
                                                    <td style="text-align:left;">
                                                        
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align:center;">
                                                        <input type="radio" name="example">
                                                    </td>
                                                    <td style="text-align:left;">
                                                        選択しない
                                                    </td>
                                                    <td style="text-align:left;" colspan="3">
                                                    <span style="font-weight: bold;color:red;">※選択しない理由を入力してください</span>
                                                    <br>
                                                    <select>
                                                    <option>自己借上のため</option>
                                                    <option>XXXXXXXXXXX</option>
                                                    <option>XXXXXXXXXXX</option>
                                                    <option>XXXXXXXXXXX</option>
                                                    <option>XXXXXXXXXXX</option>
                                                    </select>
                                                    <br>
                                                    <textarea rows="2"  cols="145" ></textarea>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </td>
                                </tr>

  </table>
</div>
</div>

</table>

<br>
<div class="align-L float-L">
      <input class="imui-medium-button check" type="button" value="前の画面へ" style="width:150px;" onclick="back1()">
</div> 

<div class="align-R">
      <input class="imui-medium-button check" type="button" value="選択" style="width:150px;"  onclick="confreq()">
</div> 


</div>
<!-- コンテンツエリア　ここまで -->