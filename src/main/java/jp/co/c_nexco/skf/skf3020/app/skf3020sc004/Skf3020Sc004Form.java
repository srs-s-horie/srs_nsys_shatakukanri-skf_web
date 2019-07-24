package jp.co.c_nexco.skf.skf3020.app.skf3020sc004;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3020Sc004Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * listTable用
	 */
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;
	
	//private FlexGridDefineInfo mainGrid;
	
	/**
	 * 検索フォーム用
	 */
	// 社員番号
	private String shainNo;
	// 社員氏名
	private String shainName;
	// 入居
	private String nyukyo;
	// 入居
	private String[] chkNyukyo;
	// 退去
	private String taikyo;
	// 変更
	private String henko;
	// 現社宅区分
	private String genShatakuKubun;
	//　現所属
	private String genShozoku;
	//　新所属
	private String shinShozoku;
	//　入退居予定作成区分
	private String nyutaikyoYoteiSakuseiKubun;
	//備考
	private String biko;
	// 入退居予定作成区分リスト
	private List<Map<String, Object>> yoteiSakuseiList;
	// 現社宅区分リスト
	private List<Map<String, Object>> genShatakuKubunList;
	
	/** hidden項目連携用 */
	//社員番号
	private String hdnShainNo;
	//社員氏名
	private String hdnShainName;
	//入居
	private String hdnNyukyo;
    //退居
	private String hdnTaikyo;
    //入居状態変更
	private String hdnHenko;
    //現社宅区分
	private String hdnGenShataku;
    //現所属
	private String hdnGenShozoku;
    //新所属
	private String hdnShinShozoku;
    //入退居予定作成区分
	private String hdnNyutaikyoYoteiSakuseiKubun;
    //備考
	private String hdnBiko;

}
