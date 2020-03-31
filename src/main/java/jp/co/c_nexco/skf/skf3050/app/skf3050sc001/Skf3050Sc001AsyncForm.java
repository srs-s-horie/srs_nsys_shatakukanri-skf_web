/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3050.app.skf3050sc001;

import java.util.List;
import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3050Sc001AsyncForm 社員番号一括設定画面の非同期Form
 * 
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3050Sc001AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = -5607227598489324931L;
	
	//検索結果一覧用
	private List<Map<String, Object>> listTableData;
	
	//表示ページ番号
	private String listPage;
}
