
class Pose {
  String beginnersTip;
  String illustration;
  String name;
  String nickname;
  String poseLevel;
  String type;
  //List<StepByStep> stepByStep = [];

  Pose({
    this.beginnersTip,
    this.illustration,
    this.name,
    this.nickname,
    this.poseLevel,
    this.type,
    //this.stepByStep
  });

  Pose.fromJson(Map<String, dynamic> json) {
      beginnersTip = json['beginners-tip'];
      illustration = json['illustration'];
      name = json['name'];
      nickname = json['nickname'];
      poseLevel = json['pose-level'];
      type = json['type'];
      /*
      stepByStep = (json['stepByStep'] as List).map((i) {
        return StepByStep.fromJson(i);
      }).toList(),
       */
  }
}

/*
class StepByStep {
  final String step1;
  final String step2;
  final String step3;
  final String step4;
  final String step5;

  StepByStep({
    this.step1,
    this.step2,
    this.step3,
    this.step4,
    this.step5,
  });

  factory StepByStep.fromJson(Map<String, dynamic> json) {
    return StepByStep(
      json[0] as String,
      json[1] as String,
      json[2] as String,
      json[3] as String,
      json[4] as String,
    );
  }
}
*/