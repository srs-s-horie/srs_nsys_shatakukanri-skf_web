/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2010.app.skf2010sc002;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.skf.skf2010.app.skf2010common.Skf2010NyukyoCommonForm;
import lombok.EqualsAndHashCode;

/**
 * 申請内容確認同期処理Form Skf2010Sc002Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc002Form extends Skf2010NyukyoCommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * 表示フラグ
	 */
	// 提示ボタン表示フラグ
	private String presenBtnViewFlg;
	// 申請ボタン表示フラグ
	private String ApplyBtnViewFlg;
	// コメント表示フラグ
	private String commentViewFlag;

	/**
	 * 画面表示
	 */

	// 申請状況
	private String status;
	private String applStatus;
	private String applStatusText;

	/**
	 * 添付ファイル
	 */
	private List<Map<String, Object>> attachedFileList;
	private List<Map<String, Object>> shatakuAttachedFileList;

	// 添付資料番号
	private String attachedNo;

	/** 画面表示用 **/
	private int displayLevel; // 表示レベル（１～３）
	// アコーディオン
	// 社宅入居希望等調書
	private String level1;
	// 貸与社宅などのご案内
	private String level2;
	// 退居届
	private String level3;

	// アコーディオン初期表示用フラグ
	private String level1Open;
	private String level2Open;
	private String level3Open;

	// コメント表示レベル
	private String commentDisplayLevel;

	private String prePageId;

	// 退居日日付変更フラグ
	private String taikyoDateFlg;
	// 駐車場日付変更フラグ
	private String parkingEDateFlg;

}
