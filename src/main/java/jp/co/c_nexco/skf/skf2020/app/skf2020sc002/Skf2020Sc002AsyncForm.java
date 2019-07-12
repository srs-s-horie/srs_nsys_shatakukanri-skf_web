/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2020.app.skf2020sc002;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf2020Sc002.Skf2020Sc002GetShatakuInfoExp;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2020Sc002AsyncForm 入居希望等調書申請登録非同期処理Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2020Sc002AsyncForm extends AsyncBaseForm {

	/**
	 * シリアルナンバー
	 */
	private static final long serialVersionUID = 1L;

	// 機関 コード
	private String agencyCd;
	// 部等 コード
	private String affiliation1Cd;
	// 室、チーム又は課コード
	private String affiliation2Cd;

	/**
	 * 自動車1台目
	 */
	// 自動車の保有
	private String parkingUmu;
	// 自動車の登録番号入力フラグ
	private String carNoInputFlg;

	/**
	 * 自動車2台目
	 */
	// 自動車の登録番号入力フラグ
	private String carNoInputFlg2;

	/**
	 * 現居住社宅
	 */
	// 現入居社宅
	private String nowShataku;
	// 保有社宅名
	private String nowShatakuName;
	// 室番号
	private String nowShatakuNo;
	// 規格（間取り）
	private String nowShatakuKikaku;
	// 規格名称（間取り）
	private String nowShatakuKikakuName;
	// 面積
	private String nowShatakuMenseki;
	// 社宅管理ID
	private long shatakuKanriId;

	/**
	 * 駐車場
	 */
	// 駐車場1台目
	private String parking1stPlace;
	// 駐車場2台目
	private String parking2stPlace;

	/**
	 * Hidden
	 */
	// 備品返却有無
	private String hdnBihinHenkyakuUmu;

	// 勤務先のTEL
	private String tel;

	/**
	 * 新たに社宅を必要としますか
	 */
	// 社宅貸与必要
	private String taiyoHituyo;

	/**
	 * 社宅を必要とする理由
	 */
	// 社宅を必要とする理由
	private String hitsuyoRiyu;

	/**
	 * 社宅を必要としない理由
	 */
	// 社宅を不必要とする理由
	private String fuhitsuyoRiyu;

	/**
	 * 必要とする社宅
	 */
	// 必要理由
	private String hitsuyoShataku;

	/**
	 * 新所属
	 */
	// 新機関 名称
	private String newAgency;
	// 新部等 名称
	private String newAffiliation1;
	// 新室、チームまたは課 名称
	private String newAffiliation2;

	// 新機関(フラグ)
	private String newAgencyOther;
	// 新部等（フラグ）
	private String newAffiliation1Other;
	// 新室、チームまたは課（フラグ)
	private String newAffiliation2Other;

	/**
	 * 同居家族
	 */
	// 続柄1
	private String dokyoRelation1;
	// 氏名1
	private String dokyoName1;
	// 年齢1
	private String dokyoAge1;

	// 続柄2
	private String dokyoRelation2;
	// 氏名2
	private String dokyoName2;
	// 年齢2
	private String dokyoAge2;

	// 続柄3
	private String dokyoRelation3;
	// 氏名3
	private String dokyoName3;
	// 年齢3
	private String dokyoAge3;

	// 続柄4
	private String dokyoRelation4;
	// 氏名4
	private String dokyoName4;
	// 年齢4
	private String dokyoAge4;

	// 続柄5
	private String dokyoRelation5;
	// 氏名5
	private String dokyoName5;
	// 年齢5
	private String dokyoAge5;

	// 続柄6
	private String dokyoRelation6;
	// 氏名6
	private String dokyoName6;
	// 年齢6
	private String dokyoAge6;

	/**
	 * 入居希望日（予定日）
	 */
	// 入居希望日（予定日）
	private String nyukyoYoteiDate;

	/**
	 * 自動車の保管場所
	 */
	/**
	 * 自動車1台目
	 */
	// 自動車の車名
	private String carName;
	// 自動車の登録番号
	private String carNo;
	// 自動車の有効期間満了日
	private String carExpirationDate;
	// 自動車の利用者
	private String carUser;
	// 自動車の保管場所使用開始日
	private String parkingUseDate;

	/**
	 * 自動車2台目
	 */
	// 自動車の車名
	private String carName2;
	// 自動車の登録番号
	private String carNo2;
	// 自動車の有効期間満了日
	private String carExpirationDate2;
	// 自動車の利用者
	private String carUser2;
	// 自動車の保管場所使用開始日
	private String parkingUseDate2;

	/**
	 * 特殊事情など
	 */
	// 特殊事情など
	private String tokushuJijo;

	/**
	 * 現保有の社宅（退居予定）
	 */
	// 退居する
	private String taikyoYotei;

	/**
	 * 退居予定日
	 */
	// 退居予定日
	private String taikyoYoteiDate;

	/**
	 * 社宅の状態
	 */
	// 社宅の状態
	private String shatakuJyotai;

	/**
	 * 退居理由
	 */
	// 退居理由
	private String taikyoRiyu;
	// 退居理由区分
	private String taikyoRiyuKbn;

	/**
	 * 退居後の連絡先
	 */
	// 退居後の連絡先
	private String taikyogoRenrakuSaki;

	/**
	 * 返却備品
	 */
	// 返却備品
	private String returnEquipment;

	/**
	 * 返却立会希望日
	 */
	// 返却立会希望日
	private String sessionDay;
	// 返却立会希望時間
	private String sessionTime;

	/**
	 * 連絡先
	 */
	// 連絡先
	private String renrakuSaki;

	/**
	 * エラー表示関連
	 */

	// 勤務先のTEL
	private String telErr;
	// 社宅貸与必要
	private String taiyoHituyoErr;
	// 社宅を必要とする理由
	private String hitsuyoRiyuErr;
	// 社宅を不必要とする理由
	private String fuhitsuyoRiyuErr;
	// 新機関
	private String newAgencyErr;
	// 新機関その他
	private String otherAgencyErr;
	// 新部等
	private String newAffiliation1Err;
	// 新部等コードその他
	private String otherAffiliation1Err;
	// 新室、チームまたは課コード
	private String newAffiliation2Err;
	// 新室、チームまたは課コードその他
	private String otherAffiliation2Err;
	// 必要とする社宅
	private String hitsuyoShatakuErr;
	// 続柄1
	private String dokyoRelation1Err;
	// 氏名1
	private String dokyoName1Err;
	// 年齢1
	private String dokyoAge1Err;

	// 続柄2
	private String dokyoRelation2Err;
	// 氏名2
	private String dokyoName2Err;
	// 年齢2
	private String dokyoAge2Err;

	// 続柄3
	private String dokyoRelation3Err;
	// 氏名3
	private String dokyoName3Err;
	// 年齢3
	private String dokyoAge3Err;

	// 続柄4
	private String dokyoRelation4Err;
	// 氏名4
	private String dokyoName4Err;
	// 年齢4
	private String dokyoAge4Err;

	// 続柄5
	private String dokyoRelation5Err;
	// 氏名5
	private String dokyoName5Err;
	// 年齢5
	private String dokyoAge5Err;

	// 続柄6
	private String dokyoRelation6Err;
	// 氏名6
	private String dokyoName6Err;
	// 年齢6
	private String dokyoAge6Err;

	// 入居希望日（予定日）
	private String nyukyoYoteiDateErr;

	// 自動車の保有
	private String parkingUmuErr;
	// 自動車の登録番号入力フラグ
	private String carNoInputFlgErr;
	// 自動車の車名
	private String carNameErr;
	// 自動車の登録番号
	private String carNoErr;
	// 自動車の有効期間満了日
	private String carExpirationDateErr;
	// 自動車の利用者
	private String carUserErr;
	// 自動車の保管場所使用開始日
	private String parkingUseDateErr;

	/**
	 * 自動車2台目
	 */
	// 自動車の登録番号入力フラグ
	private String carNoInputFlg2Err;
	// 自動車の車名
	private String carName2Err;
	// 自動車の登録番号
	private String carNo2Err;
	// 自動車の有効期間満了日
	private String carExpirationDate2Err;
	// 自動車の利用者
	private String carUser2Err;
	// 自動車の保管場所使用開始日
	private String parkingUseDate2Err;

	// 現入居社宅
	private String nowShatakuErr;
	// 保有社宅名
	private String nowShatakuNameErr;
	// 室番号
	private String nowShatakuNoErr;
	// 規格（間取り）
	private String nowShatakuKikakuErr;
	// 面積
	private String nowShatakuMensekiErr;
	// 社宅管理ID
	private long shatakuKanriIdErr;
	// 社宅管理部屋番号
	private long shatakuKanriNoErr;
	// 特殊事情など
	private String tokushuJijoErr;
	// 退居する
	private String taikyoYoteiErr;
	// 退居予定日
	private String taikyoYoteiDateErr;
	// 社宅の状態
	private String shatakuJyotaiErr;
	// 退居理由(ドロップダウン)
	private String ddlTaikyoRiyuKbnListErr;
	// 退居理由
	private String taikyoRiyuErr;
	// 退居後の連絡先
	private String taikyogoRenrakuSakiErr;
	// 返却立会希望日
	private String sessionDayErr;
	// 返却立会希望時間
	private String sessionTimeErr;
	// 連絡先
	private String renrakuSakiErr;

	/**
	 * ドロップダウン
	 */
	/** ドロップダウン：機関リスト */
	private List<Map<String, Object>> ddlAgencyList;
	/** ドロップダウン：部等リスト */
	private List<Map<String, Object>> ddlAffiliation1List;
	/** ドロップダウン：室、チーム又は課リスト */
	private List<Map<String, Object>> ddlAffiliation2List;
	/** ドロップダウン：退居理由リスト */
	private List<Map<String, Object>> ddlTaikyoRiyuKbnList;
	/** ドロップダウン：返却立会希望日(時)リスト */
	private List<Map<String, Object>> ddlReturnWitnessRequestDateList;
	/** ドロップダウン：現居住社宅名リスト */
	private List<Map<String, Object>> ddlNowShatakuNameList;
	private List<Skf2020Sc002GetShatakuInfoExp> shatakuList;

	/**
	 * 申請者
	 */
	// 社員番号
	private String shainNo;

	/**
	 * Hidden
	 */

	// 社宅管理部屋番号
	private long hdnShatakuRoomKanriNo;
	// 社宅管理番号
	private long hdnShatakuKanriNo;
	// 現居住社宅部屋管理番号
	private long hdnNowShatakuRoomKanriNo;
	// 現居住社宅管理番号
	private long hdnNowShatakuKanriNo;
	// 規格(間取り)
	private String hdnShatakuKikakuKbn;
	// 現在の位置番号
	private String hdnParking1stNumber;
	// 現在の保管場所
	private String hdnParking1stPlace;
	// 現在の位置番号2
	private String hdnParking2stNumber;
	// 現在の保管場所2
	private String hdnParking2stPlace;
	// 選択された社宅名
	private String hdnSelectedNowShatakuName;

	/**
	 * エラーフラグ
	 */
	// 更新不可フラグ
	private String updateErrorFlg;

}
