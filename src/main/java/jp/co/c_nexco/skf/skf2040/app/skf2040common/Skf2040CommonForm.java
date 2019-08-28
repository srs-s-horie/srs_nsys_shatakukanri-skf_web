/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040common;

import jp.co.c_nexco.skf.skf2010.app.skf2010common.Skf2010NyukyoCommonForm;
import lombok.EqualsAndHashCode;

/**
 * 入居希望等調書申請同期処理Form Skf2020Sc002Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2040CommonForm extends Skf2010NyukyoCommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * 表示項目
	 */

	/**
	 * 社宅の状態
	 */
	// 社宅の状態
	private String shatakuJyotai;

	/**
	 * 返却立会希望日
	 */
	// 返却立会希望日
	private String sessionDay;
	// 返却立会希望時間
	private String sessionTime;

	/**
	 * 連絡先
	 */
	// 連絡先
	private String renrakuSaki;
}
