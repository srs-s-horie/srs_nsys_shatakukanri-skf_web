/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3020.app.skf3020sc003;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.List;
import java.util.Map;

import lombok.EqualsAndHashCode;

/**
 * Skf3020Sc003 転任者調書確認Formクラス
 *
 * @author NEXCOシステムズ
*/
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3020Sc003Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * 転任者情報table用
	 */
	private List<Map<String, Object>> tenninshaChoshoDataTable;

}
