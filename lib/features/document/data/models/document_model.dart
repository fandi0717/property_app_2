import '../../domain/entities/document.dart';

class DocumentModel extends Document {
  const DocumentModel(
      {required String data})
      : super(data: data);

  DocumentModel copyWith({
    String? data,
  }) {
    return DocumentModel(
      data: data ?? this.data  ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
    data: json["data"],
  );
}

