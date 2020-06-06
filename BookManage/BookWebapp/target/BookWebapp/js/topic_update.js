// 点击修改主题加载页面
$optArea.on("click", ".topicUpdate", function() {
	var topicName = this.id.split(":")[1];
	var topicId = this.id.split(":")[0];
	var $newList = $("#opt_area>ul").empty();
	$newList.load("/News_chapter_3/newspages/topic_update.jsp #opt_area>*",
			"tid=" + topicId + "&topicName=" + topicName);
});
$optArea.on("click", "#updateTopicSubmit", function() {
	$msg.fadeIn(1000).fadeOut(5000);
	var $tname = $optArea.find("#tname");
	var id = $tname.attr("class");
	var nameValue = $tname.val();
	if (nameValue == "") {
		$msg.html("请输入主题名称！");
		$name.focus();
		return false;
	}
	$.getJSON("/News_chapter_3/util/topic_control.jsp", "opr=update&tid=" + id
			+ "&name=" + nameValue, afterTopic);
});
// 点击删除标题
$optArea.on("click", ".topicDel", function() {
	$msg.fadeIn(1000).fadeOut(5000);
	if (confirm("确定要删除吗?")) {
		var id = this.id.split(":")[0];
		$.getJSON("/News_chapter_3/util/topic_control.jsp",
				"opr=del&tid=" + id, function(data) {
					var topicId = this.id;
					if ("success" == data.statu) {
						$msg.html(data.message);
					} else if ("error" == data.statu) {
						$msg.html(data.message);
					} else if ("exist" == data.statu) {
						$msg.html(data.message);
					}
					$optArea.load("/News_chapter_3/util/topic_control.jsp",
							"opr=list");
				});
	}

});
