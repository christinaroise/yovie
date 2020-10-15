// To parse this JSON data, do
//
//     final pose = poseFromJson(jsonString);

import 'dart:convert';

Pose poseFromJson(String str) => Pose.fromJson(json.decode(str));

String poseToJson(Pose data) => json.encode(data.toJson());

class Pose {
  Pose({
    this.documents,
  });

  List<Document> documents;

  factory Pose.fromJson(Map<String, dynamic> json) => Pose(
    documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
  };
}

class Document {
  Document({
    this.name,
    this.fields,
    this.createTime,
    this.updateTime,
  });

  String name;
  Fields fields;
  DateTime createTime;
  DateTime updateTime;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    name: json["name"],
    fields: Fields.fromJson(json["fields"]),
    createTime: DateTime.parse(json["createTime"]),
    updateTime: DateTime.parse(json["updateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "fields": fields.toJson(),
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime.toIso8601String(),
  };
}

class Fields {
  Fields({
    this.description,
    this.name,
    this.stepByStep,
    this.illustration,
    this.poseLevel,
    this.deepenThePose,
    this.nickname,
    this.type,
    this.beginnersTip,
    this.modificationsAndProps,
  });

  BeginnersTip description;
  BeginnersTip name;
  StepByStep stepByStep;
  BeginnersTip illustration;
  PoseLevel poseLevel;
  BeginnersTip deepenThePose;
  BeginnersTip nickname;
  BeginnersTip type;
  BeginnersTip beginnersTip;
  BeginnersTip modificationsAndProps;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    description: BeginnersTip.fromJson(json["description"]),
    name: BeginnersTip.fromJson(json["name"]),
    stepByStep: StepByStep.fromJson(json["step-by-step"]),
    illustration: BeginnersTip.fromJson(json["illustration"]),
    poseLevel: PoseLevel.fromJson(json["pose-level"]),
    deepenThePose: BeginnersTip.fromJson(json["deepen-the-pose"]),
    nickname: BeginnersTip.fromJson(json["nickname"]),
    type: BeginnersTip.fromJson(json["type"]),
    beginnersTip: BeginnersTip.fromJson(json["beginners-tip"]),
    modificationsAndProps: BeginnersTip.fromJson(json["modifications-and-props"]),
  );

  Map<String, dynamic> toJson() => {
    "description": description.toJson(),
    "name": name.toJson(),
    "step-by-step": stepByStep.toJson(),
    "illustration": illustration.toJson(),
    "pose-level": poseLevel.toJson(),
    "deepen-the-pose": deepenThePose.toJson(),
    "nickname": nickname.toJson(),
    "type": type.toJson(),
    "beginners-tip": beginnersTip.toJson(),
    "modifications-and-props": modificationsAndProps.toJson(),
  };
}

class BeginnersTip {
  BeginnersTip({
    this.stringValue,
  });

  String stringValue;

  factory BeginnersTip.fromJson(Map<String, dynamic> json) => BeginnersTip(
    stringValue: json["stringValue"],
  );

  Map<String, dynamic> toJson() => {
    "stringValue": stringValue,
  };
}

class PoseLevel {
  PoseLevel({
    this.integerValue,
  });

  String integerValue;

  factory PoseLevel.fromJson(Map<String, dynamic> json) => PoseLevel(
    integerValue: json["integerValue"],
  );

  Map<String, dynamic> toJson() => {
    "integerValue": integerValue,
  };
}

class StepByStep {
  StepByStep({
    this.arrayValue,
  });

  ArrayValue arrayValue;

  factory StepByStep.fromJson(Map<String, dynamic> json) => StepByStep(
    arrayValue: ArrayValue.fromJson(json["arrayValue"]),
  );

  Map<String, dynamic> toJson() => {
    "arrayValue": arrayValue.toJson(),
  };
}

class ArrayValue {
  ArrayValue({
    this.values,
  });

  List<BeginnersTip> values;

  factory ArrayValue.fromJson(Map<String, dynamic> json) => ArrayValue(
    values: List<BeginnersTip>.from(json["values"].map((x) => BeginnersTip.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "values": List<dynamic>.from(values.map((x) => x.toJson())),
  };
}
