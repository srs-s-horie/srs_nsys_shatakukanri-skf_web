/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040sc001;

import java.util.Date;
import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2040Sc001 退居（自動車の保管場所返還）届画面Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2040Sc001Form extends NfwfileScDwdForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 機関
	private String agencyName;
	// 部等
	private String affiliation1Name;
	// 室、チーム又は課
	private String affiliation2Name;

	/**
	 * 現居住社宅
	 */
	// 現入居社宅
	private String nowShataku;
	// 保有社宅名
	private String nowShatakuName;
	// 室番号
	private String nowShatakuNo;
	// 規格（間取り）
	private String nowShatakuKikaku;
	// 規格名称（間取り）
	private String nowShatakuKikakuName;
	// 面積
	private String nowShatakuMenseki;
	// 社宅管理ID
	private long shatakuKanriId;
	// 社宅名
	private String shatakuName;
	// 社宅管理番号
	private long shatakuNo;

	// 現住所
	private String nowAddress;
	// 社員番号
	private String shainNo;
	// 氏名
	private String name;
	// 性別
	private String gender;
	// 性別名称
	private String genderName;
	// ユーザＩＤ
	private String userId;
	// 等級
	private String Tokyu;

	// 駐車場1台目
	private String parking1stPlace;
	// 駐車場2台目
	private String parking2ndPlace;

	// 退居(返還)日
	private String taikyoHenkanDate;
	// 退居(返還)する社宅又は自動車の保管場所
	private String[] taikyoType;
	// 退居理由区分
	private String taikyoRiyuKbn;
	// 退居(返還)理由
	private String taikyoHenkanRiyu;
	// 社宅の状態
	private String shatakuJotai;
	// 退居後の連絡先
	private String taikyogoRenrakuSaki;

	// 返却備品
	private String returnEquipment;
	// 返却立会希望日
	private String sessionDay;
	// 返却立会希望時間
	private String sessionTime;
	// 連絡先
	private String renrakuSaki;

	/**
	 * 活性非活性
	 */
	// 社宅を必要としますか？ 「社宅を退居する」ラジオボタン
	private String nowShatakuTaikyoDisabled;
	// 社宅を必要としますか？ 「駐車場１を返還する」ラジオボタン
	private String nowParking1TaikyoDisabled;
	// 社宅を必要としますか？ 「駐車場２を返還する」ラジオボタン
	private String nowParking2TaikyoDisabled;

	// 現保有の社宅（退居予定）
	private String rdoNowHoyuShatakuTaikyoDisabled;
	private String rdoNowHoyuShatakuKeizokuDisabled;

	// 返却立会希望日
	private String sessionTimeDisabled;
	private String sessionDayDisabled;
	// 連絡先
	private String renrakuSakiDisabled;

	// クリアボタン
	private boolean btnClearRemoved;
	// 申請内容を確認ボタン
	private boolean btnCheckDisabled;
	// 一時保存ボタン
	private boolean btnSaveDisabled;

	/**
	 * ドロップダウン
	 */
	/** ドロップダウン：退居理由リスト */
	private List<Map<String, Object>> ddlTaikyoRiyuKbnList;
	/** ドロップダウン：返却立会希望日(時)リスト */
	private List<Map<String, Object>> ddlReturnWitnessRequestDateList;
	/** ドロップダウン：現居住社宅名リスト */
	private List<Map<String, Object>> ddlNowShatakuNameList;

	/**
	 * 申請情報
	 */
	// 申請区分
	private String applKbn;

	// 申請書類履歴テーブル受け取り用申請日
	private Date applDate;
	// 申請書類履歴テーブル申請日
	private Date applHistroyApplDate;
	// 入居希望等調書テーブル申請日
	private String nyukyoApplDate;

	// 備品返却申請テーブル申請日
	private Date bihinHenkyakuApplDate;
	// 申請書番号
	private String applNo;
	// 申請ID
	private String applId;
	// 添付書類有無フラグ
	private Integer applTacFlg;
	// ステータス
	private String applStatus;

	/**
	 * フラグ
	 */
	// コメントボタン表示フラグ（true:表示、false:非表示）
	private boolean commentViewFlag;
	// 更新フラグ
	private String updateFlg;
	// 駐車場2台フラグ
	private String parkingFullFlg;

	// 代行ログインフラグ
	private String alterLoginFlg;

	/**
	 * 操作ガイド
	 */
	// 操作ガイド
	private String operationGuide;

	/**
	 * エラー項目
	 */
	// 保有社宅名
	private String nowShatakuNameErr;
	// 退居(返還)日
	private String taikyoHenkanDateErr;
	// 退居(返還)する社宅又は自動車の保管場所
	private String taikyoTypeErr;
	// 退居理由区分
	private String taikyoRiyuKbnErr;
	// 退居(返還)理由
	private String taikyoHenkanRiyuErr;
	// 社宅の状態
	private String shatakuJotaiErr;
	// 退居後の連絡先
	private String taikyogoRenrakuSakiErr;
	// 返却立会希望日
	private String sessionDayErr;
	// 返却立会希望時間
	private String sessionTimeErr;
	// 連絡先
	private String renrakuSakiErr;

	/**
	 * hidden
	 */

	// 社宅管理部屋番号
	private String hdnShatakuRoomKanriNo;
	// 社宅管理番号
	private String hdnShatakuKanriNo;
	// 現居住社宅部屋番号
	private String hdnNowShatakuRoomNo;
	// 現居住社宅部屋管理番号
	private String hdnNowShatakuRoomKanriNo;
	// 現居住社宅管理番号
	private String hdnNowShatakuKanriNo;
	// 備品返却有無
	private String hdnBihinHenkyakuUmu;
	// 現在の位置番号
	private String hdnParking1stNumber;
	// 現在の保管場所
	private String hdnParking1stPlace;
	// 現在の位置番号2
	private String hdnParking2ndNumber;
	// 現在の保管場所2
	private String hdnParking2ndPlace;
	// 選択社宅名
	private String hdnSelectedNowShatakuName;
	// 可否フラグ
	private String hdnConfirmFlg;
	// ステータス
	private String hdnstatus;
}
