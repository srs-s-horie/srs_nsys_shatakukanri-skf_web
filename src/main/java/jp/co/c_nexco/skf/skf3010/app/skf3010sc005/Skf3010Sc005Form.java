package jp.co.c_nexco.skf.skf3010.app.skf3010sc005;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3010Sc005Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;


	// 部屋管理番号
	private Long shatakuRoomKanriNo;
		
	/**
	 * 検索フォーム用
	 */
	// 社宅名
	private String shatakuName;
	// 地域区分
	private String areaKbn;
	// 社宅区分
	private String shatakuKbn;
	// 空き部屋数
	private String emptyRoomCount;
	// 空き駐車場数
	private String emptyParkingCount;
	
	/** 部屋登録画面hidden項目連携用 */
	// 社宅管理番号
	private String hdnShatakuKanriNo;
	// 部屋管理番号
	private String hdnRoomKanriNo;
	// 社宅名
	private String hdnShatakuName;
	// 地域区分
	private String hdnAreaKbn;
	// 社宅区分
	private String hdnShatakuKbn;
	// 本来用途
	private String hdnOriginalAuse;
	// 貸与区分
	private String hdnLendKbn;
	// 空き部屋数
	private String hdnEmptyRoomCount;
	// 空き駐車場数
	private String hdnEmptyParkingCount;
}
