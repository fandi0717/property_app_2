import '../../domain/entities/account.dart';

class AccountModel extends Account {
  const AccountModel(
      {required String data})
      : super(data: data);

  AccountModel copyWith({
    String? data,
  }) {
    return AccountModel(
      data: data ?? this.data  ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    data: json["data"],
  );
}

