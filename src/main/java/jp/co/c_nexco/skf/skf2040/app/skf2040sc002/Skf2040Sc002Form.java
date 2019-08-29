/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040sc002;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.skf.skf2040.app.skf2040common.Skf2040CommonForm;
import lombok.EqualsAndHashCode;

/**
 * 退居（自動車の保管場所返還（アウトソース用））届同期処理Form Skf2040Sc002Form
 * 
 * @author NEXCOシステムズ
 *
 */

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2040Sc002Form extends Skf2040CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/*
	 * 退居（自動車の保管場所返還）届
	 */

	// 申請状況（ヘッダ部分）
	private String applStatusText;

	// 社宅管理番号
	private String shatakuKanriNo;

	/*
	 * 添付資料
	 */
	// 添付資料情報
	private List<Map<String, Object>> attachedFileList; // 添付資料
	// 添付資料番号
	private String attachedNo;
	// 添付資料種別
	private String attachedType;

	/*
	 * 返却備品設定
	 */
	// 洗濯機
	private String bihinState11;
	private String bihinReturn11;
	// 冷蔵庫
	private String bihinState12;
	private String bihinReturn12;
	// オーブンレンジ
	private String bihinState13;
	private String bihinReturn13;
	// 掃除機
	private String bihinState14;
	private String bihinReturn14;
	// 電子炊飯ジャー
	private String bihinState15;
	private String bihinReturn15;
	// テレビ
	private String bihinState16;
	private String bihinReturn16;
	// テレビ台
	private String bihinState17;
	private String bihinReturn17;
	// 座卓（こたつ）
	private String bihinState18;
	private String bihinReturn18;
	// キッチンキャビネット
	private String bihinState19;
	private String bihinReturn19;

	// 社宅の状態
	private String shatakuStatus;

	// コメント
	private String commentNote;

	/*
	 * 表示フラグ類
	 */
	// 備品返却欄
	private boolean bihinVisible;
	// 帳票ボタン表示フラグ
	private boolean level1;
	// コメントボタン表示フラグ
	private boolean commentViewFlag;
	// ボタン表示フラグ
	private boolean presenBtnViewFlg;

	private boolean commentDisplayLevel;

}
