/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2100.app.skf2100sc005;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2100Sc005AsyncForm モバイルルーター貸出管理簿非同期処理Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc005AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 3459044975904406932L;

	/** 選択された「年」ドロップダウンリストの選択 */
	private String hdnAsyncYearSelect;
	/** 選択された「月」ドロップダウンリストの選択 */
	private String hdnAsyncMonthSelect;
	/** 選択された 「契約区分」ドロップダウンリストの選択 */
	private String hdnAsyncContaractKbnSelect;

	/** 「締め処理」ラベル */
	private String asyncLabelShimeShori;
	/** 「POSITIVE連携」ラベル */
	private String asyncLabelPositiveRenkei;

}
