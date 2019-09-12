/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040sc002;

import java.util.Date;
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
	// 社宅管理番号
	private String shatakuKanriNo;
	// 氏名
	private String name;
	// 社員番号
	private String shainNo;
	// 申請書ID
	private String applId;
	// 申請書類管理番号
	private String applNo;
	// ステータス
	private String applStatus;
	// ステータス（表示用）
	private String applStatusText;
	// 現所属：機関
	private String nowAgency;
	// 現所属：部等
	private String nowAffiliation1;
	// 現所属：室、チーム又は課
	private String nowAffiliation2;

	// アコーディオン初期表示
	private String levelOpen;

	// 申請書類履歴テーブル申請日
	private Date applHistoryDate;

	/*
	 * 添付資料
	 */
	// 添付資料情報
	private List<Map<String, Object>> attachedFileList; // 添付資料
	// 添付資料番号
	private String attachedNo;
	// 添付資料種別
	private String attachedType;
	// 添付書類有無
	private String applTacFlg;

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

	// コメント
	private String commentNote;

	/*
	 * リスト
	 */
	// 備品の返却リスト
	List<Map<String, Object>> henkyakuList;

	/*
	 * 活性制御類
	 */

	// 承認ボタン
	private String btnApproveDisabled;
	// 提示ボタン
	private String btnPresentDisabeld;

	/*
	 * フラグ類
	 */
	// 添付資料欄表示フラグ
	private String tenpViewFlg;
	// 退居（自動車の保管場所変換）届表示フラグ
	private String taikyoViewFlg;
	// 社宅状態表示フラグ
	private String shatakuJyotaiViewFlg;
	// 退居（自動車の保管場所変換）届PDF出力ボタン表示フラグ
	private String taikyoPdfViewFlg;

	// 資料を添付ボタン表示フラグ
	private boolean shiryoBtnViewFlg;
	// コメントボタン表示フラグ
	private String commentViewFlg;

	// 返却情報表示フラグ true:あり false:なし
	private String henkyakuInfoViewFlg;
	// 返却備品なしフラグ true:あり false:なし
	private String henkyakuBihinNothing;

	/*
	 * hidden
	 */
	// 備品返却申請の書類管理番号
	private String hdnBihinHenkyakuApplNo;
	// 社員番号
	private String hdnApplShainNo;
}
