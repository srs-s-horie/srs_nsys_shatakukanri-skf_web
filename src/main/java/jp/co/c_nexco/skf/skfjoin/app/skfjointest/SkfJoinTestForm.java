/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skfjoin.app.skfjointest;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * データ連携必須入力チェック合同テスト（入退居以外）Form SkfJoinTestForm
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class SkfJoinTestForm extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/** Skf2010Fc001社宅管理台帳データ登録（社宅情報） */
	// 会社コード
	private String skf2010Fc001CompanyCd;
	// 提示番号
	private String skf2010Fc001TeijiNo;
	// ユーザID
	private String skf2010Fc001UserID;
	// 画面ID
	private String skf2010Fc001PageID;

	/** Skf2010Fc002社宅管理台帳データ登録（備品情報） */
	// 会社コード
	private String skf2010Fc002CompanyCd;
	// 提示番号
	private String skf2010Fc002TeijiNo;
	// ユーザID
	private String skf2010Fc002UserID;
	// 画面ID
	private String skf2010Fc002PageID;

	/** Skf2030Fc001備品希望申請データ連携 */
	// 会社コード
	private String skf2030Fc001CompanyCd;
	// 社員番号
	private String skf2030Fc001ShainNo;
	// 申請書類管理番号
	private String skf2030Fc001ApplNo;
	// 申請ステータス
	private String skf2030Fc001ApplStatus;
	// ユーザID
	private String skf2030Fc001UserID;
	// 画面ID
	private String skf2030Fc001PageID;

	/** Skf2050Fc001備品返却確認データ連携 */
	// 会社コード
	private String skf2050Fc001CompanyCd;
	// 社員番号
	private String skf2050Fc001ShainNo;
	// 申請書類管理番号
	private String skf2050Fc001ApplNo;
	// 申請ステータス
	private String skf2050Fc001ApplStatus;
	// ユーザID
	private String skf2050Fc001UserID;
	// 画面ID
	private String skf2050Fc001PageID;

	// 結果コード
	private String returnStatus;
	private String errorStrings;

}
