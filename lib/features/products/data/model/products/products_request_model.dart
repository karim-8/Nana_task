import 'package:equatable/equatable.dart';

class ProductsRequestModel extends Equatable {
  final Info? info;
  final List<Results>? results;

  const ProductsRequestModel({this.info, this.results});

  factory ProductsRequestModel.fromJson(Map<String, dynamic> json) {
    return ProductsRequestModel(
      info: json['info'] != null ? Info.fromJson(json['info']) : null,
      results: json['results'] != null
          ? (json['results'] as List).map((e) => Results.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info': info?.toJson(),
      'results': results?.map((e) => e.toJson()).toList(),
    };
  }

  ProductsRequestModel copyWith({
    Info? info,
    List<Results>? results,
  }) {
    return ProductsRequestModel(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [info, results];
}

class Info extends Equatable {
  final int? count;
  final int? pages;
  final String? next;

  const Info({this.count, this.pages, this.next});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
    };
  }

  Info copyWith({
    int? count,
    int? pages,
    String? next,
  }) {
    return Info(
      count: count ?? this.count,
      pages: pages ?? this.pages,
      next: next ?? this.next,
    );
  }

  @override
  List<Object?> get props => [count, pages, next];
}

// ignore: must_be_immutable
class Results extends Equatable {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'] != null ? Origin.fromJson(json['origin']) : null,
      location:
          json['location'] != null ? Origin.fromJson(json['location']) : null,
      image: json['image'],
      episode: json['episode'].cast<String>(),
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }

  Results copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Origin? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) {
    return Results(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created
      ];
}

class Origin extends Equatable {
  final String? name;
  final String? url;

  const Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }

  Origin copyWith({
    String? name,
    String? url,
  }) {
    return Origin(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
