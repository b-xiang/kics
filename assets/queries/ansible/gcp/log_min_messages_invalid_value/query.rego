package Cx

import data.generic.ansible as ansLib

CxPolicy[result] {
	task := ansLib.tasks[id][t]
	instance := task["google.cloud.gcp_sql_instance"]
	database_flags := instance.settings.database_flags

	ansLib.checkState(instance)
	database_flags[x].name == "log_min_messages"
	not check_database_flags_content(database_flags[x])

	result := {
		"documentId": id,
		"searchKey": sprintf("name=%s.{{google.cloud.gcp_sql_instance}}.settings.database_flags.log_min_messages", [task.name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("name=%s.{{google.cloud.gcp_sql_instance}}.settings.database_flags sets 'log_min_messages' to a valid value", [task.name]),
		"keyActualValue": sprintf("name=%s.{{google.cloud.gcp_sql_instance}}.settings.database_flags doesn't set 'log_min_messages' to a valid value", [task.name]),
	}
}

check_database_flags_content(database_flags) {
	cmd := ["fatal", "panic", "log", "error", "warning", "notice", "info", "debug1", "debug2", "debug3", "debug4", "debug5"]
	some k
	contains(database_flags.value, cmd[k])
}
