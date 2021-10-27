/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2100.app.skf2100sc009;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.PopupForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2100Sc009Form モバイルルーター入力支援Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc009Form extends PopupForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// リストテーブル情報
	private List<Map<String, Object>> listTableList;
	private String maxCount;
	/** テキストボックス */
	/** 「通しNo」 */
	private String routerNo;
	/** 「電話番号」 */
	private String tel;
	/** 「契約終了日From」テキスト */
	private String sc009ContractEndDateFrom;
	/** 「契約終了日To」テキスト */
	private String sc009ContractEndDateTo;
	/** 「備考」 */
	private String biko;


}
