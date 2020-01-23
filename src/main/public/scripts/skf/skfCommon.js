/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
/**
 * 名前空間。
 */
var skf = skf || {};
skf.common = skf.common || {};
skf.grid = skf.grid || {};
skf.util = skf.util || {};

/**
 * グローバル変数。
 */
var modalPopupInfoStack = modalPopupInfoStack || [];
var childWindowNo = 0;
var modelessMappingArray = modelessMappingArray || [];
var dynamicMaskControlArray = {};
var defaultDynamicMaskTargets = '';
var refreshInf = {url:"", formId:""};
var allCheckByButtonMap = allCheckByButtonMap || new Map();
var disabledControlsArray = [];
var onloadExecuteEvents = [];
var dynamicMaskDisabledNotClear = [];

/**
 * ページ情報追加。
 * <p>
 * ページ情報をFormに動的に追加する。
 * </p>
 * 
 * @param {string} formId フォームID
 */
skf.common.appendPageInfo = function(formId) {
	var jFormId = "#" + formId;
	var formObj = $(jFormId);
    var popupPrefix = "";
    if (modalPopupInfoStack.length > 0) {
		popupPrefix = formId.replace('form', '');
	}
		
	// アップロードエラー時親画面に戻る場合、要素が存在しなかったので、クローンを使う。
	if (formObj.find('#' + popupPrefix + 'pageId').length == 0) {
		$('#' + popupPrefix + 'pageId').clone().appendTo(jFormId);
		$('#' + popupPrefix + 'prePageId').clone().appendTo(jFormId);
		$('#' + popupPrefix + 'pageMode').clone().appendTo(jFormId);
		$('#' + popupPrefix + 'im_secure_token').clone().appendTo(jFormId);
		
		if (typeof skf.grid.getItemsSelectedJson == "function") {
			var itemsSelectedJsonObj = $('#' + popupPrefix + 'itemsSelectedJson');
			itemsSelectedJsonObj.val(skf.grid.getItemsSelectedJson());
			itemsSelectedJsonObj.clone().appendTo(jFormId);
		}
	
		// 表示項目を設定する
		skf.common.setVisibleItems(formId);
	}
};

skf.common.confirmPopup2 = function(message, title, formId, url, okText, cancelText, button) {
	alert(message + title);
};

/**
 * 確認用ポップアップ処理。
 * <p>
 * ボタン押下時に確認用のポップアップを表示する。
 * </p>
 * 
 * @param {string} message 確認用メッセージ
 * @param {string} title ポップアップのタイトル
 * @param {string} formId フォームID
 * @param {string} url 確定ボタン押下時のアクション先
 * @param {string} okText 確定ボタンの文言
 * @param {string} cancelText 閉じるボタンの文言
 * @param {Object} button this
 */
skf.common.confirmPopup = function(message, title, formId, url, okText, cancelText, button) {
	skf.common.confirmPopup(message, title, formId, url, okText, cancelText, button, false, null, null);
}
/**
 * 確認用ポップアップ処理。確定ボタンでコールバック関数実行
 * <p>
 * ボタン押下時に確認用のポップアップを表示する。OKの際に画面遷移せずコールバック関数を実行する
 * </p>
 * 
 * @param {string} message 確認用メッセージ
 * @param {string} title ポップアップのタイトル
 * @param {string} formId フォームID
 * @param {string} okText 確定ボタンの文言
 * @param {string} cancelText 閉じるボタンの文言
 * @param {Object} button this
 * @param {Object} function コールバック関数
 */
skf.common.confirmPopupForCallback = function(message, title, formId, okText, cancelText, button, callback) {
	skf.common.confirmPopup(message, title, formId, null, okText, cancelText, button, false, callback, null);	
}
/**
 * 確認用ポップアップ処理。キャンセルでコールバック関数実行
 * <p>
 * ボタン押下時に確認用のポップアップを表示する。キャンセルの際にコールバック関数を実行する。
 * コールバック関数が設定されていなければ処理を終了する。
 * なお、確定ボタンの方のコールバック関数は遷移先URLが設定されていない場合に実行する
 * </p>
 * 
 * @param {string} message 確認用メッセージ
 * @param {string} title ポップアップのタイトル
 * @param {string} formId フォームID
 * @param {string} url 確定ボタン押下時のアクション先
 * @param {string} okText 確定ボタンの文言
 * @param {string} cancelText 閉じるボタンの文言
 * @param {Object} button this
 * @param {Object} function 確定ボタンのコールバック関数
 * @param {Object} function キャンセルボタンのコールバック関数
 */
skf.common.confirmPopupCancelCallBack = function(message, title, formId, url, okText, cancelText, button, callback, cancelCallBack) {
	skf.common.confirmPopup(message, title, formId, url, okText, cancelText, button, false, callback, cancelCallBack);	
}

/**
 * 確認用ポップアップ処理。
 * <p>
 * ボタン押下時に確認用のポップアップを表示する。
 * </p>
 * 
 * @param {string} message 確認用メッセージ
 * @param {string} title ポップアップのタイトル
 * @param {string} formId フォームID
 * @param {string} url 確定ボタン押下時のアクション先
 * @param {string} okText 確定ボタンの文言
 * @param {string} cancelText 閉じるボタンの文言
 * @param {Object} button this
 * @param {boolean} popupDownload ポップアップダウンロード
 */
skf.common.confirmPopup = function(message, title, formId, url, okText, cancelText, button, popupDownload, callback, cancelCallBack) {
	var buttons = [ 
		   {
			'id': 'okbutton',
			'text' : okText,
			'click' : function() {
			   $(this).remove(); 
			   var preOkFunc = $(button).attr('preOnclick');
			   if (preOkFunc) {
				   // evalではreturn falseの記述はJavaScriptエラーとなるため削除して処理を分ける
				   if (preOkFunc.match(/return[ \(]+false[\);]/i)) {
					   // return falseの記述があれば削除して処理実行後後続を実行しないよう終了する。
					   preOkFunc = preOkFunc.replace(/return[ \(]+false[\);]/i, "");
					   eval(preOkFunc);
					   return;
				   } else {
					   // return falseの記述がなければそのまま実行し継続して処理を行う。
					   eval(preOkFunc)
				   }
			   };
			   if (url != null && url != "") {
				   skf.common.submitForm(formId, url, button, popupDownload);
			   } else if (callback != null) {
				   callback();
			   }
			}
			}, 
			{
			'text' : cancelText,
			'click' : function() {
				if (cancelCallBack == null) {
					$(this).remove(); 
				} else {
					cancelCallBack();
				}
				}
			} 
		]
		
	imuiMessageDialogFunction = $("<div>" + message + "</div>").imuiMessageDialog({
		iconType : 'question',
		title : title,
		modal : true,
		buttons : buttons
	});
};

/**
 * Formサブミットの共通処理。
 * <p>
 * Formのサブミット時にグリッドの状態を保存し、サブミット直前にDisabled項目を活性にする。
 * </p>
 * 
 * @param {string} formId フォームID
 * @param {string} url URL
 * @param {Object} btn 押下されたボタン
 */
skf.common.submitForm = function(formId, url, btn) {
	skf.common.submitForm(formId, url, btn, false);
}

/**
 * Formサブミットの共通処理。
 * <p>
 * Formのサブミット時にグリッドの状態を保存し、サブミット直前にDisabled項目を活性にする。
 * </p>
 * 
 * @param {string} formId フォームID
 * @param {string} url URL
 * @param {Object} btn 押下されたボタン
 * @param {boolean} popupDownload ポップアップダウンロード
 */
skf.common.submitForm = function(formId, url, btn, popupDownload) {
	if (btn && btn.type == 'button') {
		// 二重クリック制御
		$(btn).addClass("imui-disabled-button");
		$(btn).prop("disabled", true);
	}
	// Waiting画面を表示する
	$(document.body).imuiIndicator();
	skf.common.appendPageInfo(formId);
	
	var formObj = $('#' + formId);
	
	var onsubmitFlag = false;
	if (formObj.attr('onsubmit') == "return false;") {
		formObj.attr('onsubmit', "");
		onsubmitFlag = true;
	}
	
	formObj.attr("action", url);
	
	// サブミット処理前の処理
	$.when(skf.common.wait(1),
		skf.common.submitFormExecute(formId))
	.done(function() {
		// Waiting画面を解放する
		//$(document.body).imuiIndicator("destroy");
	});
	
	// ポップアップの場合かつダウンロード以外の同期処理は、タイムをスキップする
	if (modalPopupInfoStack.length > 0 && !popupDownload) {
	    // 理由：親画面＋ダウンロード以外の場合、画面リフレッシューされるためタイムが消える
		//     親画面＋ダウンロードの場合、ダウンロード終了後タイムが消える
	    //     子画面＋ダウンロード以外の場合は、画面リフレッシューされずタイムがずっと残る　　　この場合は、タイム設定をスキップする必要
		//     子画面＋ダウンロードの場合、ダウンロード終了後タイムが消える
	} else {
		var reserveCookie = setInterval(function() {
			var resultMessages = $.cookie("resultMessages");
			if (resultMessages != null) {
				// ダウンロード後に解除したdisabled項目を再度diabledする
				skf.common.recoverDisabled();
				if (resultMessages != "") {
					var resultStatus = $.cookie("resultStatus");
					// メッセージ表示
					skf.common.showReserveMessage(resultStatus, resultMessages);
				}
				$.removeCookie("resultStatus", {path : "/"});
				$.removeCookie("resultMessages", {path : "/"});
				// グリッドダウンロード後処理
				var changedDataClearFlg = $.cookie("changedDataClearFlg");
				if (changedDataClearFlg != null) {
					var gridId = $.cookie("gridId");
					if (changedDataClearFlg == "1") {
						skf.grid.clearGridChangedData(gridId);
					}
					// コールバック関数をコール
					skf.grid.execCallbackAfterDownload(gridId);
					$.removeCookie("gridId", {path : "/"});
					$.removeCookie("changedDataClearFlg", {path : "/"});
					
					// 項目状態をリフレッシュする（データ型スラッシュとか）
					skf.common.submitFormDone(formId);
				}
				// 二重クリック制御
				$(btn).prop("disabled", false);
				$(btn).removeClass("imui-disabled-button");
				// Waiting画面を解放する
				$(document.body).imuiIndicator("destroy");
				clearInterval(reserveCookie);
			}
		}, 1000);
	}

	// サブミット処理を実行する
	skf.common.doSubmitForm(formObj, popupDownload);

	// サブミット処理終了後処理
	// skf.common.submitFormDone(formId);
	
	if (onsubmitFlag == true) {
		formObj.attr('onsubmit', "return false;");
	}
};

	
/**
 * Formサブミットの実行処理。
 * <p>
 * Formのサブミットを行う処理。
 * </p>
 * 
 * @param {string} formObj フォームオブジェクト
 * @param {boolean} popupDownload ポップアップダウンロード
 */
skf.common.doSubmitForm = function(formObj, popupDownload) {
	// ポップアップモード
	var formId = formObj.attr("id");

	// ポップアップの場合
	if (modalPopupInfoStack.length > 0 && !popupDownload) {
		var currentPopupObj = $(formObj).parents(".ui-dialog-content");
		// カレントポップアップをクリア
		var formActionUrl = formObj.attr("action");
		var params = {};
		params["tokenCheck"] = "0"; // tokenチェックなし
		
		$.each(formObj.serializeArray(), 
			function() {
				if (params[this.name] !== undefined) {
					if (!params[this.name].push) {
						params[this.name] = [params[this.name]];
					}
					params[this.name].push(this.value);
				} else {
					params[this.name] = this.value;
				}
			}
		);
		var currentDialogObj = $(formObj).parents(".ui-dialog");
		skf.common.modalPopup(skf.common.getPopupPageId(), formActionUrl, modalPopupInfoStack[modalPopupInfoStack.length - 1].mapping,
				params, currentDialogObj.width(), currentDialogObj.height(), currentPopupObj.attr("doCallbackFuncName"));
		
		// カレントポップアップWINDOWを閉じる
		currentPopupObj.imuiPageDialog("close");
		// Waiting画面を解放する
		$(document.body).imuiIndicator("destroy");
	} else {
		// 標準画面の場合
		formObj.submit();
	}
};

/**
 * ポップアップページID取得。
 * <p>
 * ポップアップページIDを取得する。
 * </p>
 * 
 */
skf.common.getPopupPageId = function() {
	var pageIdObj = $('input[id$=_pageId]').last();
	return pageIdObj.val();
};

/**
 * メッセージダイアログ表示。
 * <p>
 * 処理結果およびメッセージ内容に基づきメッセージダイアログを表示する。
 * </p>
 * 
 * @param {string} resultStatus 処理結果ステータス(error,warning,info)
 * @param {string} message 確認用メッセージ
 */
skf.common.showReserveMessage = function(resultStatus, message) {
	var buttons = [
		{
			'id' : 'okbutton',
			'text' : 'ok',
			'click' : function() {
				$(this).imuiMessageDialog('close');
			}
		}
	]
	
	imuiMessageDialogFunction = $("<div>" + message + "</div>").imuiMessageDialog({
		iconType : resultStatus,
		title : '結果メッセージ',
		modal : true,
		buttons : buttons
	});
};

/**
 * サブミット後、フォームにある必要なコンポーネントの値を回復する。
 * 
 * @param {string} formId フォームID 
 */
skf.common.submitFormDone = function(formId) {
	// 必要な値を回復する。
	for (var i = 0; i < document.forms[formId].length; ++i) {
		if (document.forms[formId].elements[i].id) {
			var elementId = document.forms[formId].elements[i].id;
			var obj = document.getElementById(elementId);
			// wijmoコンポーネントである場合、フォーマット系のコンポーネントかどうかチェックする。
			if (obj.className.match("wj-")) {
				var divId = elementId + "Div";
				var wjObj = document.getElementById(divId);
				// InputMask、InputNumber、InputDateとInputTimeの値を回復
				if (wjObj.className.match("wj-inputmask") || wjObj.className.match("wj-inputnumber") 
						|| wjObj.className.match("wj-inputdate") || wjObj.className.match("wj-inputtime")) {
					wijmo.Control.getControl('#' + divId).refresh();
				}
			}
		}
	}
};

/**
 * Formサブミットの共通処理実行関数。
 * <p>
 * Formのサブミット時にグリッドの状態を保存し、サブミット直前にDisabled項目を活性にする実行関数。
 * </p>
 * 
 * @param {string} formId フォームID
 */
skf.common.submitFormExecute = function(formId) {
	// グリッド状態を保持する
	if (typeof skf.grid.saveAllGridState == "function") {
		skf.grid.saveAllGridState();
	}
	
	// サブミット直前に、Disabled項目を活性にする。
	skf.common.clearDisabled(formId);
	// サブミット直前に、フォーマット系コンポーネントのデータを設定する。
	skf.common.setRawValue(formId);
};

/**
 * 画面遷移の共通処理。
 * <p>
 * グリッドの状態を保存し、Formサブミットの共通処理にURLを引き渡す。
 * </p>
 * 
 * @param {string} url URL
 * @param {Array.<string>} paramIds パラメータID
 */
skf.common.transferPage = function(url, paramIds) {
	// パラメータ設定
	for (var idx in paramIds) {
		$('#' + paramIds[idx]).appendTo("#transferForm");
    }
	
    // グリッド状態を保持する
	if (typeof skf.grid.saveAllGridState == "function") {
		skf.grid.saveAllGridState();
	}
    
	skf.common.submitForm("transferForm", url);
};


/**
 * 指定フォームへの操作モード設定・追加。
 * <p>
 * 指定するフォームに、操作モードを設定・追加する。
 * </p>
 *
 * @param {string} formId フォームID
 * @param {string} mode モード
 */
skf.common.setActionMode = function(formId, mode) {
	$("#actionMode").val(mode);
	$('#actionMode').appendTo("#" + formId);
};

/**
 * Disabled解除処理。
 * <p>
 * Disabled項目を活性にする。
 * </p>
 * 
 * @param {string} formId フォームID
 */
skf.common.clearDisabled = function(formId) {
	for (var i = 0; i < document.forms[formId].length; ++i) {
		if (document.forms[formId].elements[i].id) {
			var elementId = document.forms[formId].elements[i].id;
			var obj = document.getElementById(elementId);
			// wijmo解除。
			if (obj.className.match("wj-")) {
				var divId = elementId + "Div";
				var wjObj = wijmo.Control.getControl('#' + divId);
				if (wjObj.isDisabled == true) {
					disabledControlsArray.push(wjObj);
				}
				wjObj.isDisabled = false;
			// Imart解除。(ボタン以外)
			} else if (obj.type != "button") {
				if (obj.disabled == true) {
					disabledControlsArray.push(obj);
				}
				obj.disabled = false;
			}
		}
	}
};

/**
 * フォーマット系コンポーネントのデータを設定。
 * <p>
 * フォーマット系コンポーネントのデータを設定する。
 * </p>
 * 
 * @param {string} formId フォームID
 */
skf.common.setRawValue = function(formId) {
	for (var i = 0; i < document.forms[formId].length; ++i) {
		if (document.forms[formId].elements[i].id) {
			var elementId = document.forms[formId].elements[i].id;
			var obj = document.getElementById(elementId);
			// wijmoコンポーネントである場合、フォーマット系のコンポーネントかどうかチェックする。
			if (obj.className.match("wj-")) {
				var divId = elementId + "Div";
				var wjObj = document.getElementById(divId);
				// 郵便番号、電話番号、携帯電話番号、クレジットカード番号の場合。
				if (wjObj.className.match("wj-inputmask")) {
					wjObj = wijmo.Control.getControl('#' + divId);
					$('#' + elementId).attr("value", wjObj.rawValue);
				// ナンバーボックスの場合。
				} else if (wjObj.className.match("wj-inputnumber")) {
					wjObj = wijmo.Control.getControl('#' + divId);
					$('#' + elementId).attr("value", wjObj.value);
				// カレンダーの場合。
				} else if (wjObj.className.match("wj-inputdate") || wjObj.className.match("wj-inputtime")) {
					wjObj = wijmo.Control.getControl('#' + divId);
					$('#' + elementId).attr("value", wjObj.text.replace(/[^0-9]/g, ''));
				}
			}
		}
	}
};

/**
 * 画面上に表示している項目を設定する。
 * <p>
 * 画面上に表示している項目をすべて取得してフォームに設定する。
 * </p>
 * 
 * @param {string} formId フォームID
 */
skf.common.setVisibleItems = function(formId) {
	var visibleItems = [];
	$("#" + formId + " input,textarea").filter(':visible').each(function(i, elem) {
		if (elem.name) {
			visibleItems.push(elem.name);
		} else {
			// ドロップダウンリスト
			visibleItems.push(elem.id);
		}
	});
	
	$('<input>').attr({
		type:'hidden',
		id:'visibleItems',
		name:'visibleItems',
		value:$.unique(visibleItems)
	}).appendTo("#" + formId);
};

/**
 * 動的マスク処理実行関数。
 * <p>
 * トリガーコポーネントの値が変更された時に、動的マスク処理を行う実行関数。
 * </p>
 * 
 * @param {Array.<string>} maskAry 動的マスク設定情報 
 * @param {string} element this
 */
skf.common.dynamicMask = function(maskAry, element) {

	// 動的マスク制御用配列に設定するトリガーキーとトリガーコンポーネントのonchange後の値を取得
	var triggerElementKey = $(element).attr('id');
	if (triggerElementKey == undefined) {
		return;
	}
	
	var currentValue;
	if ($(element).attr('type') == "checkbox" || $(element).attr('type') == "radio") {
		var elementValue = $("[name=" + $(element).attr('name') + "]:checked").map(
			function() {
				return $(this).val();
			}
		);
		currentValue = elementValue.get().join(",");
		triggerElementKey = $(element).attr('name');
	} else {
		currentValue = $(element).val();
		// コンボボックス系
		var requestId = $(element).attr('id') + "Request";
		if ($("#" + requestId).length > 0) {
			currentValue = $("#" + requestId).val().split(",").join(" ");
		}
	}

	// グリッドが存在する場合
	var existGridFlg = false;
	if (typeof skf.grid.getReadonlyById == "function") {
		existGridFlg = true;
	}

	// 引数のマスク用配列に対象の値がある場合
	if (maskAry[currentValue]) {
		// 動的マスク制御用配列作成(enabled用)
		var beforeMask;
		if (maskAry[currentValue]["enabled"]) {
			for (var i = 0; i < maskAry[currentValue]["enabled"].length; ++i) {
				var enabledTargetId = skf.common.getCurPageItemId(maskAry[currentValue]["enabled"][i]);
				if (existGridFlg) {
					// グリッドの読取専用フラグを取得
					beforeMask = skf.grid.getReadonlyById(enabledTargetId);
				}
				if (beforeMask == null) {
					// フォームからdisabled状態を取得
					beforeMask = ($('#' + enabledTargetId).is(':disabled')).toString();
				}
				// 動的マスク制御用配列の中にターゲットID配列が設定されていない場合、初期化宣言
				if (!dynamicMaskControlArray[enabledTargetId]) {
					dynamicMaskControlArray[enabledTargetId] = {};
					// 動的マスク制御用配列内のターゲットID配列に静的マスク制御内容を設定
					dynamicMaskControlArray[enabledTargetId]["initMask"] = beforeMask;
					// 動的マスク制御用配列内のターゲットID配列にトリガーキーとマスク制御内容を設定
					dynamicMaskControlArray[enabledTargetId][triggerElementKey] = "false";
				} else {
					// 動的マスク制御用配列内のターゲットID配列にトリガーキーとマスク制御内容を設定
					dynamicMaskControlArray[enabledTargetId][triggerElementKey] = "false";
				}
			}
		}
		// 動的マスク制御用配列作成(disabled用)
		if (maskAry[currentValue]["disabled"]) {
			// 動的マスクDisabled制御時、値のクリアを行わない項目の設定
			dynamicMaskDisabledNotClear = [];

			for (var n = 0; n < maskAry[currentValue]["disabled"].length; ++n) {
				var disabledTargetId = skf.common.getCurPageItemId(maskAry[currentValue]["disabled"][n]);
				if (existGridFlg) {
					// グリッドの読取専用フラグを取得
					beforeMask = skf.grid.getReadonlyById(disabledTargetId);
				}
				if (beforeMask == null) {
					// フォームからdisabled状態を取得
					beforeMask = ($('#' + disabledTargetId).is(':disabled')).toString();
				}
				// 動的マスク制御用配列の中にターゲットID配列が設定されていない場合、初期化宣言
				if (!dynamicMaskControlArray[disabledTargetId]) {
					dynamicMaskControlArray[disabledTargetId] = {};
					// 動的マスク制御用配列内のターゲットID配列に静的マスク制御内容を設定
					dynamicMaskControlArray[disabledTargetId]["initMask"] = beforeMask;
					// 動的マスク制御用配列内のターゲットID配列にトリガーキーとマスク制御内容を設定
					dynamicMaskControlArray[disabledTargetId][triggerElementKey] = "true";
				} else {
					// 動的マスク制御用配列内のターゲットID配列にトリガーキーとマスク制御内容を設定
					dynamicMaskControlArray[disabledTargetId][triggerElementKey] = "true";
				}

				// 動的マスクDisabled制御時、値のクリアを行わない項目の設定
				if (maskAry[currentValue]["disabledNotClear"]) {
					if (maskAry[currentValue]["disabledNotClear"].indexOf(maskAry[currentValue]["disabled"][n]) != -1) {
						dynamicMaskDisabledNotClear.push(disabledTargetId);
					}
				}
			}
		}
		// 動的マスク制御用配列マスク処理
		skf.common.dynamicMaskControl();
		// 最新のenabledマスク処理
		if (maskAry[currentValue]["enabled"]) {
			for (var i = 0; i < maskAry[currentValue]["enabled"].length; ++i) {
				var targetId = skf.common.getCurPageItemId(maskAry[currentValue]["enabled"][i]);
				var obj = document.getElementById(targetId);
				// enabledマスク処理
				skf.common.enabledMask(obj, targetId);
			}
		}
		
		// 引数のマスク用配列に対象の値がない場合、動的マスク制御用配列内の対象のトリガーキーの値を全て空にする
	} else {
		for (targetId in dynamicMaskControlArray) {
			for (triggerKey in dynamicMaskControlArray[targetId]) {
				if (triggerKey == triggerElementKey) {
					dynamicMaskControlArray[targetId][triggerKey] = "";
				}
			}
		}
		// 動的マスク制御用配列マスク処理
		skf.common.dynamicMaskControl();
	}
};

/**
 * 動的マスク制御用配列マスク処理。
 * <p>
 * 動的マスク処理で呼ばれる動的マスク制御用配列マスク処理。
 * </p>
 */
skf.common.dynamicMaskControl = function() {
	for (targetId in dynamicMaskControlArray) {
		var curPagePrefixId = skf.common.getCurPageIdPrefix();
		var curPageItemId = skf.common.getCurPageItemId(targetId);
		// 親画面で、popup画面キーの場合
		if (curPagePrefixId == "" && targetId.indexOf("_popup_") != -1) {
			continue;
		}
		// ポップアップ画面で、親画面キーの場合
		if (curPagePrefixId != "" && targetId.indexOf("_popup_") == -1) {
			continue;
		}
		
		var maskControlDecisionAry = [];
		for (triggerKey in dynamicMaskControlArray[targetId]) {
			if (triggerKey == "initMask") {
				var initMaskControl = dynamicMaskControlArray[targetId][triggerKey];
			} else {
				maskControlDecisionAry
						.push(dynamicMaskControlArray[targetId][triggerKey]);
			}
		}
		var obj = document.getElementById(targetId);
		// 優先順位1 動的マスクでdisabled履歴が存在する場合
		if (maskControlDecisionAry.indexOf("true") >= 0) {
			// disabledマスク処理
			skf.common.disabledMask(obj, targetId);
			// 優先順位2 動的マスクでenabled履歴が存在する場合
		} else if (maskControlDecisionAry.indexOf("false") >= 0) {
			// enabledマスク処理
			skf.common.enabledMask(obj, targetId);
			// 優先順位3 静的マスク
		} else {
			if (initMaskControl == "true") {
				// disabledマスク処理
				skf.common.disabledMask(obj, targetId);
			} else {
				// enabledマスク処理
				skf.common.enabledMask(obj, targetId);
			}
		}
	}
};

/**
 * 動的マスクdisabledマスク処理。
 * <p>
 * 動的マスク制御用配列マスク処理で呼ばれる動的マスクdisabledマスク処理。
 * </p>
 * 
 * @param {Object} obj マスク対象のオブジェクト 
 * @param {string} targetId　マスク対象のID
 */
skf.common.disabledMask = function(obj, targetId) {
	// オブジェクトが存在しない場合、何もしない
	if(obj == null || obj == undefined || obj.className == null || obj.className == undefined){
		return;
	}
	
	var jObj = $(obj);
	// Wijmoの場合
	if (obj.className.match("wj-")) {
		// グリッドの場合
		if (obj.className.match("wj-flexgrid")) {
			if (typeof skf.grid.setReadonlyById == "function"
				&& typeof skf.grid.changeButtonMask == "function"
				&& typeof skf.grid.setCustmizeCell == "function") {
				skf.grid.setReadonlyById(targetId, true);
				skf.grid.changeButtonMask(targetId, "init");
				skf.grid.setCustmizeCell(targetId);
			}
		// グリッド以外のWijmoコンポーネントの場合
		} else {
			var divId = targetId + "Div";
			var wjObj = wijmo.Control.getControl('#' + divId);
			wjObj.isDisabled = true;
		}
		
		// コンポネント値をクリアする
		// クリア除外対象に設定された項目の場合クリアしない(dynamicMaskDisabledNotClearに項目がなければクリアする)
		if (dynamicMaskDisabledNotClear.indexOf(targetId) == -1) {
			if ($("#" + targetId + "Request").length > 0) {
				// コンボボックス系
				var comboboxObj = wijmo.Control.getControl('#' + skf.wijmo.getWijmoId(targetId));
				comboboxObj.selectedIndex = -1;
				// マルチドロップダウン
				if (comboboxObj.checkedItems && comboboxObj.checkedItems.length > 0) {
					comboboxObj.checkedItems = [];
				}
				// マルチオートコンプリート
				if (comboboxObj.selectedItems && comboboxObj.selectedItems.length > 0) {
					comboboxObj.selectedItems = [];
				}
			} else {
				// textbox
				if (jObj.attr("value") && jObj.attr('type') != "button") {
					jObj.val("");
				}
			}
		}
		
	// Imartの場合
	} else {
		obj.disabled = true;
		// textarea
		if (jObj.attr("value") && jObj.attr('type') != "button") {
			// クリア除外対象に設定された項目の場合クリアしない(dynamicMaskDisabledNotClearに項目がなければクリアする)
			if (dynamicMaskDisabledNotClear.indexOf(targetId) == -1) {
				jObj.val("");
			}
		}
		// checkboxGroup, RadioButtonGroup
		var checkboxGroupChildren = jObj.find('input[name='+ targetId + ']'); 
		// checkbox
		if (jObj.attr('type') == "checkbox" || jObj.attr('type') == "radio") {
			// クリア除外対象に設定された項目の場合クリアしない(dynamicMaskDisabledNotClearに項目がなければクリアする)
			if (dynamicMaskDisabledNotClear.indexOf(targetId) == -1) {
				jObj.prop('checked', false);
			}
		} else if (checkboxGroupChildren.length > 0) {
			checkboxGroupChildren.each(function(i) {
				if ($(this).attr('type') == "checkbox" || $(this).attr('type') == "radio") {
					$(this).prop('disabled', true);
					// クリア除外対象に設定された項目の場合クリアしない(dynamicMaskDisabledNotClearに項目がなければクリアする)
					// グループ指定なら配下すべてを対象、個別指定なら個別に対応
					if (dynamicMaskDisabledNotClear.indexOf(targetId) == -1
							&& dynamicMaskDisabledNotClear.indexOf($(this).attr('id')) == -1) {
						$(this).prop('checked', false);
					}
				}
			});
		}
		// アイコンの場合
		if (jObj.hasClass("skf-icon-identify-class")) {
			jObj.css('pointer-events', 'none');
		}
		if (jObj.attr('type') == "button") {
			jObj.addClass('imui-disabled-button');
		}
	}
};

/**
 * 動的マスクenabledマスク処理。
 * <p>
 * 動的マスク制御用配列マスク処理で呼ばれる動的マスクenabledマスク処理。
 * </p>
 * 
 * @param {Object} obj マスク対象のオブジェクト 
 * @param {string} targetId　マスク対象のID
 */
skf.common.enabledMask = function(obj, targetId) {
	// オブジェクトが存在しない場合、何もしない
	if(obj == null || obj == undefined || obj.className == null || obj.className == undefined){
		return;
	}
	
	var jObj = $(obj);
	// Wijmoの場合
	if (obj.className.match("wj-")) {
		// グリッドの場合
		if (obj.className.match("wj-flexgrid")) {
			if (typeof skf.grid.setReadonlyById == "function"
				&& typeof skf.grid.changeButtonMask == "function"
				&& typeof skf.grid.setCustmizeCell == "function") {
				skf.grid.setReadonlyById(targetId, false);
				skf.grid.changeButtonMask(targetId, "init");
				skf.grid.setCustmizeCell(targetId);
			}
		// グリッド以外のWijmoコンポーネントの場合
		} else {
			var divId = targetId + "Div";
			var wjObj = wijmo.Control.getControl('#' + divId);
			wjObj.isDisabled = false;
		}
	// Imartの場合
	} else {
		obj.disabled = false;
		// checkboxGroup, RadioButtonGroup
		var checkboxGroupChildren = jObj.find('input[name='+ targetId + ']'); 
		if (checkboxGroupChildren.length > 0) {
			checkboxGroupChildren.each(function(i) {
				if ($(this).attr('type') == "checkbox" || $(this).attr('type') == "radio") {
					$(this).prop('disabled', false);
				}
			});
		}
		// アイコンの場合
		if ($(obj).hasClass("skf-icon-identify-class")) {
			$(obj).css('pointer-events', 'auto');
		}
		if (jObj.attr('type') == "button") {
			jObj.removeClass('imui-disabled-button');
		}
	}
};

/**
 * 待機処理。
 * <p>
 * 指定された秒数待つ。
 * </p>
 * 
 * @param {number} sec 秒
 * @return {Object} DefferredのPromiseオブジェクト
 */
skf.common.wait = function(sec) {
	var d = $.Deferred();
	
	setTimeout(function() {
		d.resolve();
	}, sec * 1000);
	
	return d.promise();
};


/**
 * リンク実行。
 * <p>
 * リンクに設定されたFunctionを実行する。
 * </p>
 * 
 * @param {string} link リンクに設定されたFunction
 * @return {boolean} false
 */
skf.common.linkFunction = function(link){
	if (typeof link == "function") {
		// Waiting画面を表示する
		$(document.body).imuiIndicator();
		$.when(skf.common.wait(0), link())
		.done(function() {
			// Waiting画面を解放する
			$(document.body).imuiIndicator("destroy");
		});
	}
	return false;
};

/**
 * INPUTの入力イベントを除いて、Browserのデフォルトキー処理を抑制する。
 * <p>
 * Backspace, F5, Ctrl+F5, ESC, Alt+LEFT, Alt+RIGHTのデフォルト処理を抑制する。
 * IE11のみ抑制するため、他のブラウザのサポートを行っていない。
 * </p>
 * 
 * @param {object} e キーイベント
 */
skf.common.banKeyDefaultAction = function(e) {
	var ev = e || window.event;
	var obj = ev.relatedTarget || ev.srcElement || ev.target || ev.currentTarget;
	var banFlag = false;     // キー抑制フラグ
	var banIpAndTa = false;  // InputとTextAreaのキー抑制フラグ
	var banBtn = false;      // button系のキー抑制フラグ
	var banRoAndDis = false  // InputとTextAreaのReadOnly、Disabled時キー抑制フラグ
	
	switch (ev.keyCode || ev.which) {
		case 8:  // BackSpace
			banFlag = true;
			banBtn = true;
			banRoAndDis = true;
			break;
		case 116:  // F5
			if (ev.ctrlKey == true || (ev.ctrlKey == false && ev.shiftKey == false && ev.altKey == false)) {
				banFlag = true;
				banIpAndTa = true;
				banBtn = true;
				banRoAndDis = true;
			}
			break;
		case 27:  // ESC
			banFlag = true;
			banIpAndTa = true;
			banBtn = true;
			banRoAndDis = true;
			break;
		case 37:  // LEFT
		case 39:  // RIGHT
			if (ev.altKey == true) {
				banFlag = true;
				banIpAndTa = true;
				banBtn = true;
				banRoAndDis = true;
			}
			break;
	}

	if (banFlag == true) {
		var tagName = obj.nodeName;
		if (tagName != "INPUT" && tagName != "TEXTAREA") {
			ev.preventDefault();
			return false;
		}
		if (banIpAndTa && (tagName == "INPUT" || tagName == "TEXTAREA")) {
			ev.preventDefault();
			return false;
		}
		var tagType = obj.type.toUpperCase();
		if (banBtn && tagName == "INPUT" && (tagType != "TEXT" && tagType != "TEXTAREA" && tagType != "PASSWORD" && tagType != "TEL")) {
			ev.preventDefault();
			return false;
		}
		if (banRoAndDis && (tagName == "INPUT" || tagName == "TEXTAREA") && (obj.readOnly == true || obj.disabled == true)) {
			ev.preventDefault();
			return false;
		}
	}
};

/**
 * ダウンロード後やワークフローボタンをクリックし画面リフレッシュ後、解除したDisabled項目を再度Disabledにする。
 * 
 */
skf.common.recoverDisabled = function() {
	for (var i = 0; i < disabledControlsArray.length; i++) {
		if (disabledControlsArray[i].isDisabled != "undefined") {
			disabledControlsArray[i].isDisabled = true;
		}
		if (disabledControlsArray[i].disabled != "undefined") {
			disabledControlsArray[i].disabled = true;
		}		
	}
	disabledControlsArray = [];
};

/**
 * メッセージボックスを閉じる。
 */
skf.common.closeMessageBox = function(button) {
	$(button).parent().remove();
};


/**
 * ajax通信。
 * <p>
 * ajax通信を行い、エラーの場合はエラーメッセージを表示する。
 * </p>
 *
 * @param {string} url 送信先URL
 * @param {Array.<String>} data 送信データ
 * @param {boolean} asyncFlg 非同期フラグ(true:非同期、false:同期)
 * @param {function} afterSuccess 成功時のコールバック処理
 * @param {Object} btn 押下されたボタン
 * @param {boolean} fileFlg dataにファイルデータがあるかどうか
 */
skf.common.doAjaxAction = function(url, data, asyncFlg, afterSuccess, btn, fileFlg) {

	if (btn && btn.type == 'button') {
		// 二重クリック制御
		$(btn).addClass("imui-disabled-button");
		$(btn).prop("disabled", true);
	}
	
	if (!fileFlg) {
		fileFlg = false;
	}
	
	// ajax本体生成
	// セキュアトークンをリクエストデータに追加する
	data["secureToken"] = $('[name=im_secure_token]').val();
	
	// ページモード
	if (modalPopupInfoStack.length > 0) {
		data["pageMode"] = "1";
	} else {
		data["pageMode"] = "0";
	}
	
	// 入力チェックメッセージクリア（トップ階層のみ）
	var fields = [];
	// 表示項目の配列
	var visibleItems = [];
	for (key in data) {
		fields.push(key);
		var itemObj = nfw.common.getCurPageObj(key);
		
		if (data["skipValidationCheck"] && data["skipValidationCheck"] == "true") {
		} else if (nfw.common.isVisible(itemObj)) {
			if (itemObj.attr("name")) {
				visibleItems.push(itemObj.attr("name"));
			} else {
				// ドロップダウンリスト
				visibleItems.push(itemObj.attr("id"));
			}
		}
	}
	
	// 最も近いDIV要素の取得
	var parentDivTarget = $(btn).closest('div');
	
	// 入力可能な項目を設定
	data["visibleItems"] = visibleItems.join(',');
	
	url = $("#contextPath").val() + "/async/" + url;
	
	var cam;
	if (fileFlg) {
		var formData = new FormData();
		for (var k in data) {
			formData.append(k, data[k]);
		}
		cam = skf.util.createAjaxForFile(url, formData, asyncFlg);
	} else {
		cam = skf.util.createAjax(url, data, asyncFlg);
	}
	
	// 成功時処理
	cam.done(function(res, status, xhr) {
		// 業務エラークリア
		// nfw.common.clearBusinessMessage();
		nfw.common.clearValidationMessage(fields);

		if (res.secureToken && res.secureToken.length > 0) {
			// セキュアトークンを更新
			$('[name=im_secure_token]').val(res.secureToken);
		}
		var resultStatus = res.status;
		if (resultStatus == "1" || resultStatus == "2" || resultStatus == "3"
				|| resultStatus == "9") {
			// エラーハンドル処理
			nfw.common.doAjaxException(resultStatus, res.validationMessages,
					res.resultMessages, res.errorTargets, afterSuccess);
		} else {
			// 正常
			// 通知メッセージ
			nfw.common.setResultMessage("success", res.resultMessages);
			if (afterSuccess) {
				// コールバック処理
				afterSuccess(res.data);
			}
		}

		if (btn && btn.type == 'button') {
			// 二重クリック制御
			$(btn).prop("disabled", false);
			$(btn).removeClass("imui-disabled-button");
		}
		if (parentDivTarget && (res.validationMessages != null || res.resultMessages != null)) {
			// スクロールが先頭に移動
			parentDivTarget.scrollTop(0);
		}
	});
	// 失敗時処理
	cam.fail(function(xhr, status, error) {
		if (xhr.responseText && false) {
			document.open();
			document.write(xhr.responseText);
			document.close();
		} else {
			nfw.common.clearBusinessMessage();
			nfw.common.setResultMessage('error', "[" + error + "]");
		}
		if (btn && btn.type == 'button') {
			// 二重クリック制御
			$(btn).prop("disabled", false);
			$(btn).removeClass("imui-disabled-button");
		}
		if (parentDivTarget) {
			// スクロールが先頭に移動
			parentDivTarget.scrollTop(0);
		}
		return null;
	});
};

/**
 * ajax本体生成。
 * <p>
 * POST通信を行うためのajax本体を生成する。
 * </p>
 *
 * @param {string} url 送信先URL
 * @param {Array.<string>} data 送信データ
 * @param {boolean} asyncFlg 非同期フラグ(true:非同期、false:同期)
 */
skf.util.createAjax = function(url, data, asyncFlg) {
	return $.ajax({
		type: 'POST',
		url: url,
		contentType:"application/json;charset=UTF-8",
		dataType: 'json',
		data: JSON.stringify(data),
		timeout: 10000,
		async: asyncFlg
	});
};

/**
 * ajax本体生成(ファイル送信用)。
 * <p>
 * POST通信を行うためのajax本体を生成する。
 * </p>
 *
 * @param {string} url 送信先URL
 * @param {Array.<string>} data 送信データ
 * @param {boolean} asyncFlg 非同期フラグ(true:非同期、false:同期)
 */
skf.util.createAjaxForFile = function(url, data, asyncFlg) {
	return $.ajax({
		type: 'POST',
		url: url,
		contentType: false,
		processData: false,
		data: data,
		timeout: 30000000,
		async: asyncFlg
	});
};
