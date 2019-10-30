/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3022.app.skf3022sc001;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.PopupForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3022Sc001Form 社宅部屋入力支援Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3022Sc001Form extends PopupForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// リストテーブル情報
	private List<Map<String, Object>> listTableList;
	private String maxCount;
	/** テキストボックス */
	// 社宅名
	private String shatakuName;
	// 部屋番号
	private String roomNo;

	/** ドロップダウン */
	// 空き部屋ドロップダウン選択値
	private String sc001EmptyRoomSelect;
	// 空き部屋ドロップダウンリスト
	private List<Map<String, Object>> sc001EmptyRoomSelectList;
	// 空き駐車場ドロップダウン選択値
	private String sc001EmptyParkingSelect;
	// 空き駐車場ドロップダウンリスト
	private List<Map<String, Object>> sc001EmptyParkingSelectList;
	// 規格ドロップダウン選択値
	private String sc001KikakuSelecte;
	// 規格ドロップダウンリスト
	private List<Map<String, Object>> sc001KikakuSelecteList;
	// 用途ドロップダウン選択値
	private String sc001YoutoSelect;
	// 用途ドロップダウンリスト
	private List<Map<String, Object>> sc001YoutoSelectList;
}
