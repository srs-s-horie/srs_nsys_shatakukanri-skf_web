package jp.co.c_nexco.skf.skf3090.app.skf3090sc008;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc008Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	//お知らせ内容
	private String note;
	//公開開始日カレンダー
	private String openDateBox;
	
	/**
	 * listTable用
	 */
	//リストテーブル
    private List<Map<String, Object>> listTableData;
    //最大表示行数
    private String listTableMaxRowCount;
    
    // 操作ガイド
    private String operationGuide;
    
	/**
	 * 隠し項目
	 */
    // 公開開始日
    private String hdnOpenDate;
    // 内容
    private String hdnNote;
    // 確認ダイアログフラグ
    private String dialogFlg;

}
