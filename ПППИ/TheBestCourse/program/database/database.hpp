#pragma once
#include <string>

/**
 * @brief Класс для работы с базой данных
 * @author Кирилл Данильчук
 */
class Database {
  Database() = default;
  bool Connect();
  /**
   * @brief Отправляет запрос в базу данных
   * @param query Строка запроса
   * @return Ответ от базы данных
   */
  std::string Query(const std::string& query);

 private:
  void* connection_;
  bool is_open_;
};