abstract class AbstractConverter<T> {
  T fromJson(Map<String, dynamic> json);
  List<T> fromJsonList(List jsonList);
  Map<String, dynamic> toJson(T entity);
}
