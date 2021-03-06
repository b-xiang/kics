package Cx

import data.generic.ansible as ansLib

CxPolicy[result] {
	task := ansLib.tasks[id][t]
	bucket := task["amazon.aws.s3_bucket"]

	bucket.policy.Statement[_].Effect == "Allow"
	bucket.policy.Statement[_].Principal == "*"

	result := {
		"documentId": id,
		"searchKey": sprintf("name={{%s}}.{{amazon.aws.s3_bucket}}.policy.Statement", [task.name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("amazon.aws.s3_bucket[%s] does not allow Action From All Principals", [bucket.name]),
		"keyActualValue": sprintf("amazon.aws.s3_bucket[%s] allows Action From All Principals", [bucket.name]),
	}
}
