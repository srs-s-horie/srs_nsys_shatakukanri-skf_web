package jp.co.c_nexco.skf.skf2030.app.Skf2030common;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2030CommonForm extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 申請書類番号
	private String applNo;
	// 申請書類ID
	private String applId;
	// 申請状況
	private String applStatus;
	private String sendApplStatus;
	private String applStatusText;
	// 社員番号
	private String hdnShainNo;

	// 【所属】
	// 機関
	private String agency;
	// 部等
	private String affiliation1;
	// 室、チームまたは課
	private String affiliation2;
	// 勤務先のTEL
	private String tel;
	// 申請者社員番号
	private String shainNo;
	// 氏名
	private String name;
	// 等級
	private String tokyu;
	// 性別
	private String gender;

	// 【 入居社宅 】
	// 社宅名
	private String shatakuName;
	// 室番号
	private String shatakuNo;
	// 規格(間取り)
	private String shatakuKikaku;
	// 面積
	private String shatakuMenseki;

	// 【 代理人 】
	// 代理受取人
	private String dairiName;
	// 代理連絡先
	private String dairiRenrakusaki;

	// 【 備品搬入 】
	// 備品搬入希望日
	private String sessionDay;
	// 備品搬入希望時間
	private String sessionTime;
	private String sessionTimeText;
	// 連絡先
	private String renrakuSaki;

	// 【 備品搬入完了 】
	// 備品搬入完了日
	private String completionDay;

	// 搬入完了日
	private String hannyuKanryoDate;

	// 表示フラグ系
	// コメントボタン表示フラグ
	private boolean commentViewFlag;
	// 「搬入完了日」非活性フラグ
	private boolean completionDayDisabled;

	// 操作ガイド
	private String operationGuide;

}
