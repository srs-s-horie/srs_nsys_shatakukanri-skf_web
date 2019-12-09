/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3070.app.skf3070sc003;

import java.util.List;
import java.util.Map;

import jp.co.c_nexco.skf.skf3070.app.skf3070common.Skf3070CommonForm;
import lombok.EqualsAndHashCode;

/**
 * 賃貸人（代理人）所有物件一覧画面同期処理Form Skf3070Sc003Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3070Sc003Form extends Skf3070CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;
	
	// 所有物件一覧表示用
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;

}
