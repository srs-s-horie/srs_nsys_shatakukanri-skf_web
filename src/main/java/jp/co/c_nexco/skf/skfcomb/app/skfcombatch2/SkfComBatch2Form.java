/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skfcomb.app.skfcombatch2;

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
public class SkfComBatch2Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String teijiNo;
	private String yearMonth;
	private String returnStatus;

}
