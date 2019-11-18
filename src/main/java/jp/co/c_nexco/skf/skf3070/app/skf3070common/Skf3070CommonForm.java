/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3070.app.skf3070common;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import lombok.EqualsAndHashCode;

/**
 * 法定調書データ関連共通同期処理Form Skf3070CommonForm
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3070CommonForm extends NfwfileScDwdForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String pageMode = "0";

	// 賃貸人（代理人） ID
	private String ownerNo;
	// 基準年（対象年プルダウン 作成基準値）
	private String standardYear;
	// 対象年（対象年プルダウン 選択値）
	private String targetYear;
	// 社宅名
	private String shatakuName;
	// 社宅住所
	private String shatakuAddress;
	// 対象年 開始日
	private String recodeDadefrom;
	// 対象年 終了日
	private String recodeDadeto;

	/* 賃貸人（代理人） 項目 */
	// 賃貸人（代理人） 氏名又は名称
	private String ownerName;
	// 賃貸人（代理人） 氏名又は名称（フリガナ）
	private String ownerNameKk;
	// 住所(居所）又は所在地
	private String address;
	// 個人法人区分
	private String businessKbn;
	// 個人番号受領フラグ(個人番号督促状況）
	private String acceptFlg;
	// 督促状況（コメント）
	private String acceptStatus;

}
