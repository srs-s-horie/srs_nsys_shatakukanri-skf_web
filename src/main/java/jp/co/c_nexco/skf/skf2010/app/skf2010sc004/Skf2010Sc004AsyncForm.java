package jp.co.c_nexco.skf.skf2010.app.skf2010sc004;

import jp.co.c_nexco.skf.skf2010.app.skf2010common.Skf2010NyukyoCommonAsyncForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc004AsyncForm extends Skf2010NyukyoCommonAsyncForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 承認者１社員番号
	private String shonin1ShainNo;
	// 承認ボタン表示フラグ（true:表示、false:非表示）
	private String shoninBtnViewFlag;
	// ダイアログ表示フラグ
	private boolean dialogFlg;

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
	// 備品希望申請の申請管理番号
	private String bihinApplNo;

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

	// 初期退居日
	private String syokiTaikyoDate;
	// 初期駐車場返還日
	private String syokiParkingDate;

	// 操作ガイド
	private String operationGuide;

}
