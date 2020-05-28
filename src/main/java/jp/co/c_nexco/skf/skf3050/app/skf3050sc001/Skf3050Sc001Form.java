package jp.co.c_nexco.skf.skf3050.app.skf3050sc001;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.List;
import java.util.Map;

import lombok.EqualsAndHashCode;

/**
 * Skf3050Sc001Form 社員番号一括設定Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3050Sc001Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	//検索結果一覧用
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;
	
	//活性制御
	//社員情報確認ボタン
	private String btnShainInfoCheckDisabled;
	//登録ボタン
	private String btnRegistDisabled;
	
	//社員情報文字列
	private String shainListData;
	
	//表示ページ番号
	private String listPage;
}
