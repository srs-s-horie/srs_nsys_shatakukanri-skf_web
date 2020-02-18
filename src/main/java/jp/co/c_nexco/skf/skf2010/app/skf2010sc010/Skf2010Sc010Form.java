package jp.co.c_nexco.skf.skf2010.app.skf2010sc010;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc010Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String applNo;
	private String applStatus;
	private List<Map<String, String>> commentList;

}
