var $optArea = $("#opt_area");
var $msg = $("#msg");

$optArea.on("click", "#addTopicSubmit", function() {
	$msg.fadeIn(1000).fadeOut(5000);
	var $tname = $optArea.find("#tname");
	var tnameValue = $tname.val();
	if (tnameValue == "") {
		$msg.html("请输入主题名称!");
		$tname.focus();
		return false;
	}
	$.getJSON("/News_chapter_3/util/topic_control.jsp", "opr=add&tname="
			+ tnameValue, afterTopic);
});
function afterTopic(data) {
	var $tname = $optArea.find("#tname");
	if ("exist" == data.statu) {
		// 主题存在
		$msg.html(data.message);
		$tname.select();
	} else if ("success" == data.statu) {
		$msg.html(data.message);
		$optArea.load("/News_chapter_3/util/topic_control.jsp","opr=list");
	} else if ("error" == data.statu) {
		$msg.html(data.message);
		$optArea.load("/News_chapter_3/util/topic_control.jsp","opr=list");
	}
}