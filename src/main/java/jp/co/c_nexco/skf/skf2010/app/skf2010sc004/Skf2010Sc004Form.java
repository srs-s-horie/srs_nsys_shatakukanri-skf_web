package jp.co.c_nexco.skf.skf2010.app.skf2010sc004;

import jp.co.c_nexco.skf.skf2010.app.skf2010common.Skf2010NyukyoCommonForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc004Form extends Skf2010NyukyoCommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 承認者１社員番号
	private String shonin1ShainNo;
	// 承認ボタン表示フラグ（true:表示、false:非表示）
	private String shoninBtnViewFlag;

	private int displayLevel;
	private String commentViewFlag;

	// 現社宅の退居日
	private String taikyobi;
	// 現社宅の駐車場返還日
	private String henkanbi;
	// 新社宅の入居日
	private String nyukyobi;
	// 新社宅の駐車場使用開始日
	private String shiyobi;
	// 新社宅の駐車場使用開始日2
	private String shiyobi2;

	// 各エラーClass設定
	private String taikyobiErr;
	private String henkanbiErr;
	private String nyukyobiErr;
	private String shiyobiErr;
	private String shiyobi2Err;

	// 再提示ボタンの表示非表示フラグ
	private String representBtnFlg;

	// 入力フォーム表示フラグ
	private String inputAreaVisible;

	// 操作ガイド
	private String operationGuide;

}
