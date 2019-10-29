/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040sc001;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2040Sc001 退居（自動車の保管場所返還）届画面Form(非同期処理)
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2040Sc001AsyncForm extends AsyncBaseForm {

	/**
	 * シリアルナンバー
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * フォーム情報
	 */
	// 現入居社宅
	private String nowShataku;
	// 保有社宅名
	private String nowShatakuName;
	// 社宅管理ID
	private long shatakuKanriId;

	// 社員番号
	private String shainNo;
	// 現住所
	private String nowAddress;
	/**
	 * 駐車場情報
	 */
	private String parking1stPlace;
	private String parking2ndPlace;

	/**
	 * フォーム情報
	 */
	// 退居(返還)日
	private String taikyoHenkanDate;
	// 退居(返還)する社宅又は自動車の保管場所
	private String[] taikyoType;
	private String taikyoTypeShataku;
	private String taikyoTypeParking1;
	private String taikyoTypeParking2;
	// 退居理由区分
	private String taikyoRiyuKbn;
	// 退居(返還)理由
	private String taikyoHenkanRiyu;
	// 社宅の状態
	private String shatakuJotai;
	// 退居後の連絡先
	private String taikyogoRenrakuSaki;

	// 返却備品HTML
	private String returnEquipment;
	// 返却立会希望日
	private String sessionDay;
	// 返却立会希望時間
	private String sessionTime;
	// 連絡先
	private String renrakuSaki;

}
