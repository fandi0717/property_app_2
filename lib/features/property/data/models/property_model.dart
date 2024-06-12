import '../../domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  // const PropertyModel({
  //   required String? id,
  //   required String? name,
  //   required String? location,
  //   required String? img,
  //   required DateTime? deadlines,
  //   required double? price,
  //   required String? propertyType,
  //   required List<Transaction> transaction,
  //   required DateTime? currentDate,
  //   required double? fine,
  // }) : super(
  //           id: id,
  //           name: name,
  //           location: location,
  //           img: img,
  //           deadlines: deadlines,
  //           price: price,
  //           propertyType: propertyType,
  //           transaction: transaction,
  //           currentDate: currentDate,
  //           fine: fine);

  const PropertyModel({required List<Property> property})
      : super(property: property);

  // PropertyModel copyWith({
  //   String? id,
  //   i
  // }) {
  //   return PropertyModel(
  //     id: id ?? this.id,
  //     data: data ?? this.data  ?? '',
  //   );
  // }
  // PropertyModel copyWith({
  //   required String? id,
  //   required String? name,
  //   required String? location,
  //   required String? img,
  //   required DateTime? deadlines,
  //   required double? price,
  //   required String? propertyType,
  //   required List<Transaction> transaction,
  //   required DateTime? currentDate,
  //   required double? fine,
  // }) {
  //   return PropertyModel(
  //       id: id ?? this.id ?? "",
  //       name: name ?? this.name ?? "",
  //       location: location ?? this.location ?? "",
  //       img: img ?? this.img ?? "",
  //       deadlines: deadlines ?? this.deadlines ?? DateTime.now(),
  //       price: price ?? this.price ?? 0.0,
  //       propertyType: propertyType ?? this.propertyType ?? "",
  //       transaction: transaction,
  //       currentDate: currentDate ?? this.currentDate ?? DateTime.now(),
  //       fine: fine ?? this.fine);
  // }

  // Map<String, dynamic> toJson() => {
  //       "data": data,
  //     };

  // factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
  //       id: json["id"],
  //       name: json["name"],
  //       location: json["location"],
  //       img: json["img"],
  //       deadlines: DateTime.tryParse(json["deadlines"] ?? ""),
  //       price: json["price"],
  //       propertyType: json["property_type"],
  //       transaction: json["transaction"] == null
  //           ? []
  //           : List<Transaction>.from(
  //               json["transaction"]!.map((x) => Transaction.fromJson(x))),
  //       currentDate: DateTime.tryParse(json["current_date"] ?? ""),
  //       fine: json["fine"],
  //     );

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    var propertyJson = json["property"] as List<dynamic>;
    var result = propertyJson
        .map(
          (e) => Property.fromJson(e),
        )
        .toList();
    return PropertyModel(property: result);
  }
}
