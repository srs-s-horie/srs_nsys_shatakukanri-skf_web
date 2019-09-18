/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2040.app.skf2040sc001;

import java.util.Date;
import java.util.List;
import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2040Sc001 退居（自動車の保管場所返還）届画面Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2040Sc001Form extends BaseForm {

    private static final long serialVersionUID = 5285848663756806913L;

    // 機関
    private String agencyName;
    // 部等
    private String affiliation1Name;
    // 室、チーム又は課
    private String affiliation2Name;
    
    // 現入居社宅
    private String nowShataku;
    // 保有社宅名
    private String nowShatakuName;
    // 社宅管理番号
    private long shatakuNo;
    // 現住所
    private String nowAddress;
    // 氏名
    private String name;
    // 性別
    private String gender;

    // 駐車場1台目
    private String parking1stPlace;
    // 駐車場2台目
    private String parking2ndPlace;

    // 退居(返還)日
    private String taikyoHenkanDate;
    // 退居(返還)する社宅又は自動車の保管場所
    private String[] taikyoType;
    // 退居理由区分
    private String taikyoRiyuKbn;
    // 退居(返還)理由
    private String taikyoHenkanRiyu;
    // 社宅の状態
    private String shatakuJyotai;
    // 退居後の連絡先
    private String taikyogoRenrakuSaki;

    // 返却備品
    private String returnEquipment;
    // 返却立会希望日
    private String sessionDay;
    // 返却立会希望時間
    private String sessionTime;
    // 連絡先
    private String renrakuSaki;
    
    /**
     * 活性非活性
     */
    // 社宅を必要としますか？ 「社宅を退居する」ラジオボタン
    private String nowShatakuTaikyoDisabled;
    // 社宅を必要としますか？ 「駐車場１を返還する」ラジオボタン
    private String nowPerking1TaikyoDisabled;
    // 社宅を必要としますか？ 「駐車場２を返還する」ラジオボタン
    private String nowPerking2TaikyoDisabled;
    

    // 現保有の社宅（退居予定）
    private String rdoNowHoyuShatakuTaikyoDisabled;
    private String rdoNowHoyuShatakuKeizokuDisabled;

    // 返却立会希望日
    private String sessionTimeDisabled;
    private String sessionDayDisabled;
    // 連絡先
    private String renrakuSakiDisabled;

    // 申請内容を確認ボタン
    private String btnCheckDisabled;
    // 一時保存ボタン
    private String btnSaveDisabled;
    
    /**
     * ドロップダウン
     */
    /** ドロップダウン：退居理由リスト */
    private List<Map<String, Object>> ddlTaikyoRiyuKbnList;
    /** ドロップダウン：返却立会希望日(時)リスト */
    private List<Map<String, Object>> ddlReturnWitnessRequestDateList;
    /** ドロップダウン：現居住社宅名リスト */
    private List<Map<String, Object>> ddlNowShatakuNameList;
    
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
     * フラグ
     */
    // 退居情報エリア表示フラグ（true:表示、false:非表示）
    private String taikyoViewFlag;
    // コメントボタン表示フラグ（true:表示、false:非表示）
    private String commentViewFlag;
    // 更新フラグ
    private String updateFlg;
    // 駐車場2台フラグ
    private String parkingFullFlg;
    
    // 代行ログインフラグ
    private String alterLoginFlg;
    
    /**
     * 操作ガイド
     */
    // 操作ガイド
    private String operationGuide;
    
    /**
     *  エラー項目
     */
    // 保有社宅名
    private String nowShatakuNameErr;
    // 退居(返還)日
    private String taikyoHenkanDateErr;
    // 退居(返還)する社宅又は自動車の保管場所
    private String taikyoTypeErr;
    // 退居理由区分
    private String taikyoRiyuKbnErr;
    // 退居(返還)理由
    private String taikyoHenkanRiyuErr;
    // 社宅の状態
    private String shatakuJyotaiErr;
    // 退居後の連絡先
    private String taikyogoRenrakuSakiErr;
    // 返却立会希望日
    private String sessionDayErr;
    // 返却立会希望時間
    private String sessionTimeErr;
    // 連絡先
    private String renrakuSakiErr;


}
