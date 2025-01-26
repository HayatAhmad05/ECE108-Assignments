// Lean compiler output
// Module: UW.Init.Tree
// Imports: Init UW.Init.ExistsOne UW.Init.List UW.Init.Graph
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
LEAN_EXPORT lean_object* l_leaves(lean_object*);
LEAN_EXPORT lean_object* l_descE___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_desc___boxed(lean_object*, lean_object*);
lean_object* lean_sorry(uint8_t);
static lean_object* l_desc___closed__1;
LEAN_EXPORT lean_object* l_leaves___boxed(lean_object*);
LEAN_EXPORT lean_object* l_descV___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidableIsLeaf(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_desc(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_descV(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidableIsLeaf___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_descE(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_leaves(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_leaves___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_leaves(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_descV(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_box(0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_descV___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_descV(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_descE(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_box(0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_descE___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_descE(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
static lean_object* _init_l_desc___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_2, 0, x_1);
lean_ctor_set(x_2, 1, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_desc(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_desc___closed__1;
return x_3;
}
}
LEAN_EXPORT lean_object* l_desc___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_desc(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_instDecidableIsLeaf(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = 0;
x_4 = lean_sorry(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_instDecidableIsLeaf___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_instDecidableIsLeaf(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_ExistsOne(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_List(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Graph(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_UW_Init_Tree(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_ExistsOne(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_List(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Graph(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_desc___closed__1 = _init_l_desc___closed__1();
lean_mark_persistent(l_desc___closed__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
