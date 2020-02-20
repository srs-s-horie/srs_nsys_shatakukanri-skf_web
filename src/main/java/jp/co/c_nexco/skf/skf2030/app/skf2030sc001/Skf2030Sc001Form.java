package jp.co.c_nexco.skf.skf2030.app.skf2030sc001;

import jp.co.c_nexco.skf.skf2030.app.Skf2030common.Skf2030CommonForm;
import java.util.*;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2030Sc001Form extends Skf2030CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 読み取り専用フラグ
	private boolean bihinReadOnly;
	// 「申請中」フラグ
	private boolean status01Flag;
	// 「搬入済」フラグ
	private boolean status24Flag;
	// 備品申請ラジオボタンフラグ
	private String bihinCheckFlag;

	// 希望時間ドロップダウンリスト
	private List<Map<String, Object>> ddlWishTime;

	// 備品希望設定
	// 洗濯機
	private String bihinAppl11;
	private String bihinAdjust11;
	private String bihinState11;
	private String bihinApplText11;
	private String bihinAdjustText11;
	private String bihinStateText11;
	private boolean bihinDisabled11;
	// 冷蔵庫
	private String bihinAppl12;
	private String bihinAdjust12;
	private String bihinState12;
	private String bihinApplText12;
	private String bihinAdjustText12;
	private String bihinStateText12;
	private boolean bihinDisabled12;
	// オーブンレンジ
	private String bihinAppl13;
	private String bihinAdjust13;
	private String bihinState13;
	private String bihinApplText13;
	private String bihinAdjustText13;
	private String bihinStateText13;
	private boolean bihinDisabled13;
	// 掃除機
	private String bihinAppl14;
	private String bihinAdjust14;
	private String bihinState14;
	private String bihinApplText14;
	private String bihinAdjustText14;
	private String bihinStateText14;
	private boolean bihinDisabled14;
	// 電子炊飯ジャー
	private String bihinAppl15;
	private String bihinAdjust15;
	private String bihinState15;
	private String bihinApplText15;
	private String bihinAdjustText15;
	private String bihinStateText15;
	private boolean bihinDisabled15;
	// テレビ
	private String bihinAppl16;
	private String bihinAdjust16;
	private String bihinState16;
	private String bihinApplText16;
	private String bihinAdjustText16;
	private String bihinStateText16;
	private boolean bihinDisabled16;
	// テレビ台
	private String bihinAppl17;
	private String bihinAdjust17;
	private String bihinState17;
	private String bihinApplText17;
	private String bihinAdjustText17;
	private String bihinStateText17;
	private boolean bihinDisabled17;
	// 座卓（こたつ）
	private String bihinAppl18;
	private String bihinAdjust18;
	private String bihinState18;
	private String bihinApplText18;
	private String bihinAdjustText18;
	private String bihinStateText18;
	private boolean bihinDisabled18;
	// キッチンキャビネット
	private String bihinAppl19;
	private String bihinAdjust19;
	private String bihinState19;
	private String bihinApplText19;
	private String bihinAdjustText19;
	private String bihinStateText19;
	private boolean bihinDisabled19;
	// コメント
	private String commentNote;
	private boolean commentBtnVisibled;

	/** ボタン表示非表示 */
	// 搬入完了ボタン
	private String btnImportFinidhedDisabled;

	// 一時保存ボタン
	private String btnSaveDisabled;

	// 申請ボタン
	private String btnApplicationDisabled;
}
