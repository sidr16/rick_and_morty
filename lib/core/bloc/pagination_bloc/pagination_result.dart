import 'package:equatable/equatable.dart';

class PaginationResultInfo extends Equatable {
  const PaginationResultInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory PaginationResultInfo.fromJson(Map<String, dynamic> json) {
    return PaginationResultInfo(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );
  }

  final int pages;
  final int count;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [pages, count, next, prev];
}

class PaginationResult<T extends Object> extends Equatable {
  const PaginationResult({
    required this.info,
    required this.results,
  });

  factory PaginationResult.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final rawResults = json['results'] as List<dynamic>;
    final resultsList =
        rawResults.map((item) {
          return fromJsonT(item as Map<String, dynamic>);
        }).toList();

    return PaginationResult<T>(
      info: PaginationResultInfo.fromJson(
        json['info'] as Map<String, dynamic>,
      ),
      results: resultsList,
    );
  }

  final PaginationResultInfo info;
  final List<T> results;

  @override
  List<Object?> get props => [info, results];
}
