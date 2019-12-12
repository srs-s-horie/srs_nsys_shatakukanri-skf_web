/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skfbatc.app.skfbatchutils1;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * 排他チェックテストForm SkfBatchUtilsForm
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class SkfBatchUtils1Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 初期表示
	private String shainNo;
	// 結果コード
	private String returnStatus;

	/** 提示データ */
	private String teijiDataTeijiNo;

	/** 入居予定データ */
	private String ntYoteiDataShainNo;
	private String ntYoteiDataNyutaikyoKbn;

	/** 社宅管理台帳基本 */
	private String sLedgerShatakuKanriId;

	/** 社宅駐車場区画情報マスタ */
	private String sParkingBlockShatakuKanriNo;
	private String sParkingBlockParkingKanriNo;

	/** 社宅部屋情報マスタ */
	private String sRoomShatakuKanriNo;
	private String sRoomRoomKanriNo;

	/** 社宅管理台帳備品基本 */
	private String sBihinShatakuKanriId;

	/** 提示備品データ */
	private String tBihinDataTeijiNo;
	private String tBihinDataBihinCd;

	private String checkFlg;

}
