#ifndef NODE_H
typedef enum { N_QUOTE, N_VAR, N_NUM, N_AND, N_OR, N_NOT, N_COMP, N_ELE, N_CASE } node_type_t;

typedef struct NODE {
    node_type_t type;
    int isbool;  /* Is this node a Boolean expression? */
    char *sval;
    struct NODE *arg1;
    struct NODE *arg2;
    int ref;     /* For var, how many times has it been referenced? */
    struct NODE *next;
} node_rec, *node_ptr;

void init_node(int argc, char **argv);
void finish_node(int check_ref);

node_ptr make_quote(char *qstring);
node_ptr make_var(char *name);
node_ptr make_num(char *name);
void set_bool(node_ptr varnode);
node_ptr make_not(node_ptr arg);
node_ptr make_and(node_ptr arg1, node_ptr arg2);
node_ptr make_or(node_ptr arg1, node_ptr arg2);
node_ptr make_comp(node_ptr op, node_ptr arg1, node_ptr arg2);
node_ptr make_ele(node_ptr arg1, node_ptr arg2);
node_ptr make_case(node_ptr arg1, node_ptr arg2);

node_ptr concat(node_ptr n1, node_ptr n2);

void insert_code(node_ptr qstring);
void add_arg(node_ptr var, node_ptr qstring, int isbool);
void gen_funct(node_ptr var, node_ptr expr, int isbool);
#define NODE_H
#endif

