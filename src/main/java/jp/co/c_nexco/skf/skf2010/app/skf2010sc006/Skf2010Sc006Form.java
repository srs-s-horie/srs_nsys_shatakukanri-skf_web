package jp.co.c_nexco.skf.skf2010.app.skf2010sc006;

import jp.co.c_nexco.skf.skf2010.app.skf2010common.Skf2010NyukyoCommonForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc006Form extends Skf2010NyukyoCommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 退居取り消し線フラグ
	private String taikyoTorikeshiFlag;
	// 自動車の保管場所返還取消線フラグ
	private String parkingHenkanTorikeshiFlag;
	// コメント欄表示フラグ
	private boolean commentAreaVisibled = true;
	// 承認ボタン表示フラグ（true:表示、false:非表示）
	private String shoninBtnViewFlag;
	// 特殊ダイアログ必要入居承認ボタン表示フラグ（true:表示、false:非表示）
	private String nyukyoShoninBtnViewFlag;
	// 通常承認ボタン表示フラグ（true:表示、false:非表示）
	private String comShoninBtnViewFlag;
	// 退居申請チェック表示用 社員番号
	private String taikyoShain;
}
