package jp.co.c_nexco.skf.skf2030.app.skf2030sc002;

import jp.co.c_nexco.skf.skf2030.app.Skf2030common.Skf2030CommonForm;
import java.util.*;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2030Sc002Form extends Skf2030CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 読み取り専用フラグ
	private boolean bihinReadOnly;
	// 「申請中」フラグ
	private boolean status01Flag;
	// 「搬入済」フラグ
	private boolean status24Flag;
	// 備品申請ラジオボタンフラグ
	private String bihinCheckFlag;
	// 提示可能フラグ
	private boolean createCompleteFlag;
	// 「搬入完了日」表示フラグ
	private boolean completionDayVisible;
	// ボタン表示モードレベル
	private int dispMode;
	// CSS折り返し埋め込み用変数
	private String floatL;

	// 希望時間ドロップダウンリスト
	private List<Map<String, Object>> ddlWishTime;

	// 備品希望設定
	private List<Map<String, String>> bihinList;
	// 洗濯機
	private String bihinAppl11;
	private String bihinApplText11;
	private String bihinAdjust11;
	private String bihinAdjustText11;
	private String bihinState11;
	private boolean bihinDisabled11;
	// 冷蔵庫
	private String bihinAppl12;
	private String bihinApplText12;
	private String bihinAdjust12;
	private String bihinState12;
	private boolean bihinDisabled12;
	// オーブンレンジ
	private String bihinAppl13;
	private String bihinApplText13;
	private String bihinAdjust13;
	private String bihinState13;
	private boolean bihinDisabled13;
	// 掃除機
	private String bihinAppl14;
	private String bihinApplText14;
	private String bihinAdjust14;
	private String bihinState14;
	private boolean bihinDisabled14;
	// 電子炊飯ジャー
	private String bihinAppl15;
	private String bihinApplText15;
	private String bihinAdjust15;
	private String bihinState15;
	private boolean bihinDisabled15;
	// テレビ
	private String bihinAppl16;
	private String bihinApplText16;
	private String bihinAdjust16;
	private String bihinState16;
	private boolean bihinDisabled16;
	// テレビ台
	private String bihinAppl17;
	private String bihinApplText17;
	private String bihinAdjust17;
	private String bihinState17;
	private boolean bihinDisabled17;
	// 座卓（こたつ）
	private String bihinAppl18;
	private String bihinApplText18;
	private String bihinAdjust18;
	private String bihinState18;
	private boolean bihinDisabled18;
	// キッチンキャビネット
	private String bihinAppl19;
	private String bihinApplText19;
	private String bihinAdjust19;
	private String bihinState19;
	private boolean bihinDisabled19;
	// コメント
	private String commentNote;
	private boolean commentBtnVisibled;

	// ボタン非活性フラグ
	// 「提示」ボタン非活性フラグ
	private boolean presentBtnDisabled = false;

}
