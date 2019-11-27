/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2010.app.skf2010fc001;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2010Fc001Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Fc001Form extends BaseForm {

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

	// 結果コード
	private String returnStatus;
	private String errorStrings;

}
