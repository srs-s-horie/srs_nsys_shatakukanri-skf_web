package jp.co.c_nexco.skf.skf3070.app.skf3070sc004;

import java.util.List;
import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.PopupForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3070Sc004Form extends PopupForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	private String pageMode = "0";

	// 氏名又は名称
	private String popOwnerName;
	// 氏名又は名称（フリガナ）
	private String popOwnerNameKk;
	// 住所
	private String popAddress;
	// 個人法人区分
	private String popBusinessKbn;
	// 個人法人区分ドロップダウン
	private List<Map<String, Object>> popBusinessKbnList;

	// リストテーブル情報
	private List<Map<String, Object>> popListTableList;
	
	// リストテーブルの１ページ最大表示行数
	private String listTableMaxRowCount;

}
