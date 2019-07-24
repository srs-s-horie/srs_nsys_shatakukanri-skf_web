/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2020.app.skf2020sc002;

import java.util.Date;
import java.util.List;
import java.util.Map;
import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf2020Sc002.Skf2020Sc002GetBihinItemToBeReturnExp;
import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf2020Sc002.Skf2020Sc002GetShainInfoExp;
import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf2020Sc002.Skf2020Sc002GetShatakuInfoExp;
import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import lombok.EqualsAndHashCode;

/**
 * 入居希望等調書申請同期処理Form Skf2020Sc002Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2020Sc002Form extends NfwfileScDwdForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * 表示項目
	 */

	/**
	 * 所属
	 */
	// 機関
	private String agencyName;
	// 部等コード
	private String affiliation1Name;
	// 室、チームまたは課コード
	private String affiliation2Name;
	// 勤務先のTEL
	private String tel;

	/**
	 * 申請者
	 */
	// 社員番号
	private String shainNo;
	// 社員名
	private String name;
	// 等級
	private String tokyu;
	// 等級名
	private String tokyuName;
	// 性別
	private String gender;
	// 性別名称
	private String genderName;

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

	// 機関（ドロップダウンリスト）
	private String agencyCd;
	// 新部等（ドロップダウンリスト）
	private String affiliation1Cd;
	// 室、チーム又は課（ドロップダウンリスト）
	private String affiliation2Cd;

	/**
	 * 必要とする社宅
	 */
	// 必要社宅
	private String hitsuyoShataku;
	// 必要理由(ラジオボタン 既婚)
	private String rdoKikon;
	// 必要理由(ラジオボタン 世帯か単身か独身)
	// private String rdoHitsuyoShataku;

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
	// 自動車の保有
	private String parkingUmu;
	// 自動車の登録番号入力フラグ
	private String carNoInputFlg;
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
	// 自動車の登録番号入力フラグ
	private String carNoInputFlg2;
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
	// 社宅名
	private String shatakuName;
	// 社宅管理番号
	private long shatakuNo;

	/**
	 * 駐車場
	 */
	// 駐車場1台目
	private String parking1stPlace;
	// 駐車場2台目
	private String parking2stPlace;

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
	 * 入居希望等調書登録テーブル
	 */
	// 位置番号 1台目
	private String parkngBlocK1;
	// 位置番号 2台目
	private String parkngBlocK2;
	// 現在の保管場所
	private String nowParkingArea;
	// 現在の保管場所
	private String nowCarIchiNo;
	// 現在の保管場所2
	private String nowParkingArea2;
	// 現在の保管場所2
	private String nowCarIchiNo2;

	/**
	 * その他
	 */
	// 年月
	private String yearMonth;
	// 日付
	private String yearMonthDay;
	// 操作ガイド
	private String operationGuide;
	// 退居情報エリア表示フラグ（true:表示、false:非表示）
	private String taikyoViewFlag;
	// コメントボタン表示フラグ（true:表示、false:非表示）
	private String commentViewFlag;

	/**
	 * hidden
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
	// 備品返却有無
	private String hdnBihinHenkyakuUmu;
	// 現在の位置番号
	private String hdnParking1stNumber;
	// 現在の保管場所
	private String hdnParking1stPlace;
	// 現在の位置番号2
	private String hdnParking2stNumber;
	// 現在の保管場所2
	private String hdnParking2stPlace;
	// 選択社宅名
	private String hdnSelectedNowShatakuName;
	// 可否フラグ
	private String hdnConfirmFlg;
	// 自動車 駐車場番号
	private String hdnParking2ndNumber;

	// 申請書類履歴テーブル 申請日hidden値
	private Date hdnApplHistroyApplDate;

	// ステータス
	private String hdnstatus;

	/**
	 * 制御用
	 */
	/**
	 * 表示
	 */
	// 退居届を促すメッセージ
	private String lblShatakuFuyouMsgRemove;

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

	// 入居希望日カレンダー
	private String nyukyoYoteiDateClDisabled;
	// 自動社の有効期間満了日 1台目カレンダー
	private String carExpirationDateClDisabled;
	// 自動車の使用開始日 1台目カレンダー
	private String parkingUseDateClDisabled;
	// 自動社の有効期間満了日 2台目カレンダー
	private String carExpirationDate2ClDisabled;
	// 自動車の使用開始日 2台目カレンダー
	private String parkingUseDate2ClDisabled;
	// 退居予定日 2台目カレンダー
	private String taikyoYoteiDateClDisabled;
	// 返却立会希望日カレンダー
	private String sessionDayClDisabled;

	// 申請内容を確認ボタン
	private String btnCheckDisabled;
	// 一時保存ボタン
	private String btnSaveDisabeld;

	/**
	 * ラジオボタンチェック状態判定用
	 */
	// ラジオボタン 社宅を必要としますか？ 必要
	private String rdoHitsuyoChecked;
	// ラジオボタン社宅を必要としますか？ 不要
	private String rdoFuyouChecked;
	// ラジオボタン 社宅を必要としますか？ 駐車場のみ
	private String rdoParkingOnlyChecked;

	// ラジオボタン 社宅を必要とする理由 異動のため
	private String rdoHitsuyoIdoChecked;
	// ラジオボタン 社宅を必要とする理由 結婚のため
	private String rdoHitsuyoKekkonChecked;
	// ラジオボタン 社宅を必要とする理由その他
	private String rdoHitsuyoSonotaChecked;

	// ラジオボタン 社宅を必要としない理由 自宅通勤
	private String rdoFuyouJitakutsuukinnChecked;
	// ラジオボタン 社宅を必要としない理由 自己借上
	private String rdoFuyouJikokariageChecked;
	// ラジオボタン 社宅を必要としない理由 その他
	private String rdoFuyouSonotaChecked;

	// ラジオボタン必要とする社宅 既婚
	private String rdoKikonChecked;
	// ラジオボタン必要とする社宅 世帯
	private String rdoHitsuyoSetaiChecked;
	// ラジオボタン必要とする社宅 単身
	private String rdoHitsuyoTanshinChecked;
	// ラジオボタン必要とする社宅 独身
	private String rdoHitsuyoDokushinChecked;

	// ラジオボタン自動車の保管場所 必要とする
	private String rdoCarHitsuyoChecked;
	// ラジオボタン自動車の保管場所 必要としない
	private String rdoCarFuyoChecked;

	// 1台目
	// ラジオボタン自動車の保有 保有している
	private String rdo1stCarHoyuChecked;
	// ラジオボタン自動車の保有 購入を予定している
	private String rdo1stCarYoteiChecked;
	// 2台目
	// ラジオボタン自動車の保有 保有している
	private String rdo2stCarHoyuChecked;
	// ラジオボタン自動車の保有 購入を予定している
	private String rdo2stCarYoteiChecked;

	// ラジオボタン現住居情報 保有(会社借上を含む)
	private String rdoNowJutakuHoyuChecked;
	// ラジオボタン現住居情報 自宅
	private String rdoNowJutakuJitakuChecked;
	// ラジオボタン現住居情報 保有(会社借上を含む)
	private String rdoNowJutakuKariageChecked;
	// ラジオボタン現住居情報 自宅
	private String rdoNowJutakuSonotaChecked;
	// ラジオボタン退居理由 退居する
	private String rdoNowHoyuShatakuTaikyoChecked;
	// ラジオボタン退居理由 継続使用する
	private String rdoNowHoyuShatakuKeizokuChecked;

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

	/**
	 * listTable用
	 */
	private List<Map<String, Object>> listTableData;
	// 社員情報のリスト
	private List<Skf2020Sc002GetShainInfoExp> shainList;
	// 現在居住社宅のリスト
	private List<Skf2020Sc002GetShatakuInfoExp> shatakuList;
	// 備品返却リスト
	List<Skf2020Sc002GetBihinItemToBeReturnExp> resultBihinItemList;
	// 備品表示用
	private List<Map<String, Object>> bihinItemList;

	/**
	 * ファイルダウンロード用
	 */
	// 申請書類ファイル
	private String pageMode = "0";
	// 申請書類ファイル名
	private String downloadFileName;
	// 機能ID
	private String functionId;

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
	 * 申請情報
	 */
	// 申請区分
	private String applKbn;

	// 申請書類履歴テーブル受け取り用申請日
	private Date applDate;
	// 申請書類履歴テーブル申請日
	private Date applHistroyApplDate;
	// 入居希望等調書テーブル申請日
	private String nyukyoApplDate;

	// 備品返却申請テーブル申請日
	private Date bihinHenkyakuApplDate;
	// 申請書番号
	private String applNo;
	// 申請ID
	private String applId;
	// 添付書類有無フラグ
	private Integer applTacFlg;
	// ステータス
	private String status;

	/**
	 * 添付ファイル作業
	 */
	// 添付ファイル名
	private String attachedName;
	// 添付ファイル番号
	private String attachedNo;
	// ファイルサイズ
	private String fileSize;
	// ファイル
	private byte fileStram;

	/**
	 * 退居届必要時
	 */
	// 備品返却申請番号 フラグ
	private String bihinHenkaykuShinseiApplNo;
	// 退居申請書番号
	private String taikyoApplNo;

	/**
	 * 更新フラグ
	 */
	private String updateFlg;

	private String rdoParkingOnly;

	/**
	 * データダウンロード処理。
	 */
	public static interface DataDownload {

	}

}
