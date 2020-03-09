/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040sc002;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * 退居（自動車の保管場所返還（アウトソース用））届非同期処理Form Skf2040Sc002AsyncForm
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2040Sc002AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 申請書類管理番号
	private String applNo;

}
