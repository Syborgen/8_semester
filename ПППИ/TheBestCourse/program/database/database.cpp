#include "database.hpp"
#incldue <pqxx/pqxx>

void Database::connection() {
  connection_ = pqxx::connection("localhost", 5432).to_ptr();
}

std::string Database::Query(const std::string& query) {
  // pass
}