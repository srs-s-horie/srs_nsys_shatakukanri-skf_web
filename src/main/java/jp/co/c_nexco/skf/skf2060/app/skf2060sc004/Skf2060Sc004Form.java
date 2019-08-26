package jp.co.c_nexco.skf.skf2060.app.skf2060sc004;

import java.util.List;
import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2060Sc004Form extends BaseForm {
    
    private static final long serialVersionUID = 5285848663756806913L;

       /**
     * listTable用
     */
    private List<Map<String, Object>> listTableData;
    private String listTableMaxRowCount;
    // チェックされた完了チェックボックス値の配列
    private String[] completeChkVal;
    // チェックされた督促チェックボックス値の配列
    private String[] reminderChkVal;

    /**
     * 検索フォーム用
     */
    // 提示日From
    private String candidateDateFrom;
    // 提示日To
    private String candidateDateTo;
    // 提示対象者名
    private String candidatePersonName;
    // 借上社宅名
    private String shatakuName;
    // 社宅所在地
    private String shatakuAddressName;
    // 提示状況
    private String[] candidateStatus;

    /**
     * 操作ガイド
     */
    // 操作ガイド
    private String operationGuide;
}
