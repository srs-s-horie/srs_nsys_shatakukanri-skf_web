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
	// 申請書番号
	private String applNo;

	/**
	 * Hidden
	 */
	// 選択された社宅名
	private String hdnSelectedNowShatakuName;
	// 現在の位置番号
	private String hdnParking1stNumber;
	// 現在の位置番号2
	private String hdnParking2stNumber;
	// 現居住社宅管理番号
	private long hdnNowShatakuKanriNo;
	// 現居住社宅部屋管理番号
	private long hdnNowShatakuRoomKanriNo;
	// 備品返却有無
	private String hdnBihinHenkyakuUmu;

	/**
	 * 活性非活性
	 */
	// 社宅を必要としますか？ 駐車場のみ
	private String rdoParkingOnlyDisabled;

	// 必要とする理由
	private String rdoHitsuyoIdoDisabled;
	private String rdoHitsuyoKekkonDisabled;
	private String rdoHitsuyoSonotaDisabled;

	// 必要としない理由
	private String rdoFuyouJitakuTsuukinnDisabled;
	private String rdoFuyouJikoKariageDisabled;
	private String rdoFuyouSonotaDisabled;

	// 既婚
	private String rdoKikonDisabled;
	// 必要とする社宅 世帯
	private String rdoHitsuyoSetaiDisabled;
	// 必要とする社宅 単身
	private String rdoHitsuyoTanshinDisabled;
	// 必要とする社宅 独身
	private String rdoHitsuyoDokushinDisabled;

	// 駐車場を必要とするか？
	private String rdoCarHitsuyoDisabled;
	private String rdoCarFuyoDisabled;

	// 自動車の保有（1台目）
	private String rdo1stCarHoyuDisabled;
	private String rdo1stCarYoteiDisabled;

	// 自動車の保有（2台目）
	private String rdo2stCarHoyuDisabled;
	private String rdo2stCarYoteiDisabled;

	// 現居住宅 保有(会社借上を含む)
	private String rdoNowJutakuHoyuDisabled;
	// 現居住宅 自宅
	private String rdoNowJutakuJitakuDisabeld;
	// 現居住宅 自己借上
	private String rdoNowJutakuKariageDisabled;
	// 現居住宅 保有(会社借上を含む)
	private String rdoNowJutakuSonotaDisabled;

	// 現保有の社宅（退居予定）
	private String rdoNowHoyuShatakuTaikyoDisabled;
	private String rdoNowHoyuShatakuKeizokuDisabled;

	// 返却立会希望日
	private String sessionTimeDisabled;
	private String sessionDayDisabled;
	// 連絡先
	private String renrakuSakiDisabled;

	/**
	 * フラグ
	 */
	// 更新不可フラグ
	private String updateErrorFlg;
	// 駐車場2台フラグ
	private String parkingFullFlg;

	// ユーザＩＤ
	private String userId;

}
