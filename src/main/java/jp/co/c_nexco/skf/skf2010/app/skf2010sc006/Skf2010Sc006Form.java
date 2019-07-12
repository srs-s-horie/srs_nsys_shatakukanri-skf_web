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
}
