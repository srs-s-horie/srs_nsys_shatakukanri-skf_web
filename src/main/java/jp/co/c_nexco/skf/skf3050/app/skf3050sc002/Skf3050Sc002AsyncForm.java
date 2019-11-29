/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3050.app.skf3050sc002;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3050Sc002AsyncForm 月次運用管理画面の非同期Form
 * 
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3050Sc002AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = -5607227598489324931L;
	
	/** タスクマネージャーへ設定されたメッセージID */
	private String taskMsgId;
	/** チェック処理等で表示する警告メッセージ */
	private String hdnWarnMsg;
	/** 実行指示予定処理年月 */
	private String hdnJikkouShijiYoteiNengetsu;
	/** 備品貸与日について警告が出ている状態でも処理続行するか判定するフラグ */
	private String hdnBihinTaiyoWarnContinueFlg;
	/** 備品返却日について警告が出ている状態でも処理続行するか判定するフラグ */
	private String hdnBihinHenkyakuWarnContinueFlg;

}
