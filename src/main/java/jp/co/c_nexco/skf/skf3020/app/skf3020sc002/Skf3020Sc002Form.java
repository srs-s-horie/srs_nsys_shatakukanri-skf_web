/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3020.app.skf3020sc002;

import jp.co.c_nexco.nfw.webcore.app.GridForm;

import org.springframework.web.multipart.MultipartFile;

import lombok.EqualsAndHashCode;

/**
 * Skf3020Sc002 転任者調書取込Formクラス
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3020Sc002Form extends GridForm {
	
	private static final long serialVersionUID = 5285848663756806913L;
	
	/** 転任者調書取込ファイル */
	private MultipartFile fuTenninsha;
	
	/** 「前に戻る」ボタン非表示フラグ（hidden） */
	private String backBtnHiddenFlg;

}
