import '../../domain/entities/building.dart';

class BuildingModel extends Building {
  const BuildingModel(
      {required String data})
      : super(data: data);

  BuildingModel copyWith({
    String? data,
  }) {
    return BuildingModel(
      data: data ?? this.data  ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
    data: json["data"],
  );
}

