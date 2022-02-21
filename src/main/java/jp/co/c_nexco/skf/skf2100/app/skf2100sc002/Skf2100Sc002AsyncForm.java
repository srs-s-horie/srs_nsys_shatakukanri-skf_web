/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2100.app.skf2100sc002;

import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * モバイルルーター借用希望申請書非同期処理Form Skf2100Sc002AsyncForm
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc002AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 非同期処理連携パラメータ
	private Map<String, String> mapParam;
	
	// 申請書類管理番号
	private String applNo;
	private String attachedType;
	private String attachedFileArea;
	private Long mobileRouterNo;
	private String iccid;
	private String imei;
	private Long hdnMobileRouterNo;
}
