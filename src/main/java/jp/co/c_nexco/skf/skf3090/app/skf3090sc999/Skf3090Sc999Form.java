/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc999;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * 従業員マスタ登録同期処理Form Skf3090Sc005Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc999Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String companyCd;
	private String shainNo;
	private String applNoNyukyo;
	private String applNoTaikyo;
	private String applStatus;
	private String errorCodeID;
	private String errorStrings;
	private String userID;
	private String pageID;

}
