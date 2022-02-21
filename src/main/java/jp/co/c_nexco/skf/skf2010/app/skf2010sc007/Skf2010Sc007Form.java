/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2010.app.skf2010sc007;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import lombok.EqualsAndHashCode;

/**
 * 申請条件確認画面の同期処理Formクラス。
 * 
 * @author NEXCOシステムズ
 * 
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
// public class Skf2010Sc007Form extends GridForm {
public class Skf2010Sc007Form extends NfwfileScDwdForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 画面表示区分
	private String confirmationKbn;

	// 申請書類名
	private String applYoken;
	// 申請書類ファイル
	private String pageMode = "0";
	// 申請書類ファイル名
	private String downloadFileName;
	// 機能ID
	private String functionId;
	// 申請書ID
	private String applId;
	// 申請書NO
	private String applNo;
	// 会社コード
	private String companyCd;
	// ユーザコード
	private String userId;
	// 社員番号
	private String shainNo;

	/**
	 * 現居住社宅
	 */
	// 現入居社宅
	private String nowShataku;

	// 代行ログインフラグ
	private String alterLoginFlg;

	/**
	 * データダウンロード処理。
	 */
	public static interface DataDownload {

	}
	
	// 申請要件を確認ボタン
	private String btnCheckDisabled;
}
