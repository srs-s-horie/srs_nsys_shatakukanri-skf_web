/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3022.app.skf3022sc006;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.*;

import lombok.EqualsAndHashCode;

/**
 * Skf3022Sc006Form 提示データ登録Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3022Sc006Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	//画面項目(ヘッダ）
	// 社宅名
	private String shatakuName;
	// 部屋番号
	private String roomNo;

	//非表示項目
	// 社宅管理番号
	private String hdnShatakuKanriNo;
	// 部屋管理番号
	private String hdnRoomKanriNo;
	
	
	//提示データ一覧画面連携項目
	//提示番号
	private String hdnTeijiNo;
	//入居予定日
	private String hdnNyukyoDate;
	//退居予定日
	private String hdnTaikyoDate;
	//申請書類管理番号
	private String hdnShoruikanriNo;
	//入退居区分
	private String hdnNyutaikyoKbn;
	//申請区分
	private String hdnApplKbn;
	//社員番号変更フラグ
	private String hdnShainNoChangeFlg;

	//提示データ一覧検索条件退避
	//社員番号
	private String searchInfoShainNo;
	//社員氏名
	private String searchInfoShainName;
	//社宅名
	private String searchInfoShatakuName;
	//入退居区分
	private String searchInfoNyutaikyoKbn;
	//社宅提示状況
	private String searchInfoStJyokyo;
	//社宅提示確認督促
	private String searchInfoStKakunin;
	//備品提示状況
	private String searchInfoBhJyokyo;
	//備品提示確認督促
	private String searchInfoBhKakunin;
	//備品搬入搬出督促
	private String searchInfoMoveInout;

}
