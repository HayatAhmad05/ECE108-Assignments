// Lean compiler output
// Module: UW.Init
// Imports: Init UW.Init.Commands UW.Init.Syntax UW.Init.Macros UW.Init.Abbrevs UW.Init.Pos UW.Init.Sum UW.Init.List UW.Init.Bool UW.Init.Set UW.Init.ExistsOne UW.Init.Graph UW.Init.Tree
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Commands(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Syntax(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Macros(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Abbrevs(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Pos(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Sum(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_List(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Bool(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Set(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_ExistsOne(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Graph(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Tree(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_UW_Init(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Commands(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Syntax(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Macros(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Abbrevs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Pos(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Sum(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_List(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Bool(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Set(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_ExistsOne(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Graph(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Tree(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
