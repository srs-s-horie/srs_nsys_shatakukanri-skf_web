package jp.co.c_nexco.skf.skf2020.app.skf2020sc003;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2020Sc003AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String applNo;

	private String attachedFileArea;

}
