/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3022.app.skf3022sc003;

import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3022Sc003AsyncForm 使用料入力支援非同期Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3022Sc003AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 非同期処理連携パラメータ
	private Map<String, String> mapParam;

	// 非同期処理戻り値
	private String kijunMenseki2;
	private String shatakuMenseki2;
	private String keinenChouseinashiShiyoryo2;
	private String kijunTanka2;
	private String patternShiyoryo2;
	private String nenreikasanKeisu;
	private String shatakuShiyoryo2;
	private String sc003HdnRateShienTanka;
	private String sc003HdnRateShienKeinen;
	private String sc003HdnRateShienKeinenZankaRitsu;
}
