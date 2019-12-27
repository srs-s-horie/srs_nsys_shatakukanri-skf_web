/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3021.app.skf3021sc001;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3021Sc001AsyncForm 入退居予定一覧画面非同期Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3021Sc001AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	//エラー番号
	String errCode;
}
