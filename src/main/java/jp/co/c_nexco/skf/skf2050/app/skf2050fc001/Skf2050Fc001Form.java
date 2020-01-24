/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2050.app.skf2050fc001;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * データ連携_備品希望申請Form SkfJoinTestForm
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2050Fc001Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

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
