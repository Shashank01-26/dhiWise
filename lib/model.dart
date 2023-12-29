// import 'package:flutter/material.dart';
part of home_page;

class _HomeScreenModel {
  final unfocusNode = FocusNode();
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  Future<_Data> init() async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("goals").doc("x4QAYHSVBHMgjRB0T9jo");

    final doc = await docRef.get() as DocumentSnapshot;
    final data = doc.data() as Map<String, dynamic>;
    print(data);
    return _Data.fromJson(data);
  }
}

class _Data {
  int amount;
  int you_saved;
  int goal_amount;
  int monthly_salary;
  int bonus;
  int monthly_saving_pro;
  int need_more_savings;
  int savings;

  _Data({
    required this.amount,
    required this.goal_amount,
    required this.you_saved,
    required this.monthly_salary,
    required this.bonus,
    required this.monthly_saving_pro,
    required this.need_more_savings,
    required this.savings,
  });

  _Data copyWith({
    int? amount,
    int? you_saved,
    int? goal_amount,
    int? monthly_salary,
    int? bonus,
    int? monthly_saving_pro,
    int? need_more_savings,
    int? savings,
  }) =>
      _Data(
        amount: amount ?? this.amount,
        you_saved: you_saved ?? this.you_saved,
        goal_amount: goal_amount ?? this.goal_amount,
        monthly_salary: monthly_salary ?? this.monthly_salary,
        bonus: bonus ?? this.bonus,
        monthly_saving_pro: monthly_saving_pro ?? this.monthly_saving_pro,
        need_more_savings: need_more_savings ?? this.need_more_savings,
        savings: savings ?? this.savings,
      );

  factory _Data.fromJson(Map<String, dynamic> json) {
    return _Data(
      amount: json['amount'] as int,
      you_saved: json['you_saved'] as int,
      goal_amount: json['goal_amount'] as int,
      monthly_salary: json['monthly_salary'] as int,
      bonus: json['bonus'] as int,
      monthly_saving_pro: json['monthly_saving_pro'] as int,
      need_more_savings: json['need_more_savings'] as int,
      savings: json['savings'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'you_saved' : you_saved,
      'goal_amount' : goal_amount,
      'monthly_salary': monthly_salary,
      'bonus' : bonus,
      'monthly_saving_pro': monthly_saving_pro,
      'need_more_savings': need_more_savings,
      'savings' : savings,
    };
  }
}
