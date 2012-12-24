#ifndef _NUODB_COMMON_H_
#define _NUODB_COMMON_H_

#include "nuodb_capi.h"

struct db_context_t
{
	nuodb_connection_t * connection;
};

typedef struct sql_result_t
{
    nuodb_result_t * result_set;
    char const * query;
    size_t num_fields;
    size_t num_rows;
    size_t * lengths;	
} sql_result_t;

int _connect_to_db(struct db_context_t * dbc);

int _disconnect_from_db(struct db_context_t * dbc);

int _db_init(
	char const * database,
	char const * username,
	char const * password,
	const char * timezone,
	char const * schema);

/**
 * Commit the transaction.
 */
int commit_transaction(
    struct db_context_t * dbc);

/**
 * Rollback the transaction.
 */
int rollback_transaction(
    struct db_context_t * dbc);

int dbt2_sql_execute(
    struct db_context_t * dbc,
    char const * query,
    struct sql_result_t * sql_result,
    char const * query_name);

int dbt2_sql_close_cursor(
    struct db_context_t * dbc,
    struct sql_result_t * sql_result);

int dbt2_sql_fetchrow(
    struct db_context_t * dbc,
    struct sql_result_t * sql_result);

char * dbt2_sql_getvalue(
    struct db_context_t * dbc,
    struct sql_result_t * sql_result,
    int field);

#endif /* _NUODB_COMMON_H_ */
