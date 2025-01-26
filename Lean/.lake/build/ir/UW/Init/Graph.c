// Lean compiler output
// Module: UW.Init.Graph
// Imports: Init UW.Init.Abbrevs UW.Init.List UW.Init.Set
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
lean_object* l_List_back(lean_object*);
LEAN_EXPORT lean_object* l_Graph_next(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Graph_startPt(lean_object*);
static lean_object* l_Graph_emptyGraph___closed__1;
LEAN_EXPORT lean_object* l_Graph_startPt___boxed(lean_object*);
LEAN_EXPORT lean_object* l_Graph_pathVToPathE(lean_object*);
LEAN_EXPORT lean_object* l_Graph_next___boxed(lean_object*, lean_object*);
lean_object* l_List_head_x21___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Graph_edges(lean_object*);
extern lean_object* l_instInhabitedNat;
LEAN_EXPORT lean_object* l_Graph_emptyGraph;
LEAN_EXPORT lean_object* l_Graph_vertices(lean_object*);
LEAN_EXPORT lean_object* l_Graph_vertices___boxed(lean_object*);
LEAN_EXPORT lean_object* l_Graph_edges___boxed(lean_object*);
LEAN_EXPORT lean_object* l_Graph_endPt(lean_object*);
LEAN_EXPORT lean_object* l_Graph_edges(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_ctor_get(x_1, 1);
lean_inc(x_2);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Graph_edges___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Graph_edges(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Graph_vertices(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc(x_2);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Graph_vertices___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Graph_vertices(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_Graph_emptyGraph___closed__1() {
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
static lean_object* _init_l_Graph_emptyGraph() {
_start:
{
lean_object* x_1; 
x_1 = l_Graph_emptyGraph___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_Graph_next(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_box(0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Graph_next___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Graph_next(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Graph_startPt(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = l_instInhabitedNat;
x_3 = l_List_head_x21___rarg(x_2, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Graph_startPt___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Graph_startPt(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Graph_endPt(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_2 = l_instInhabitedNat;
x_3 = l_List_back(lean_box(0));
x_4 = lean_apply_2(x_3, x_2, x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Graph_pathVToPathE(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; 
x_3 = lean_ctor_get(x_1, 1);
lean_inc(x_3);
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_4; 
lean_dec(x_1);
x_4 = lean_box(0);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_1);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; uint8_t x_8; 
x_6 = lean_ctor_get(x_1, 0);
x_7 = lean_ctor_get(x_1, 1);
lean_dec(x_7);
x_8 = !lean_is_exclusive(x_3);
if (x_8 == 0)
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_9 = lean_ctor_get(x_3, 0);
lean_inc(x_9);
x_10 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_10, 0, x_6);
lean_ctor_set(x_10, 1, x_9);
x_11 = l_Graph_pathVToPathE(x_3);
lean_ctor_set(x_1, 1, x_11);
lean_ctor_set(x_1, 0, x_10);
return x_1;
}
else
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_12 = lean_ctor_get(x_3, 0);
x_13 = lean_ctor_get(x_3, 1);
lean_inc(x_13);
lean_inc(x_12);
lean_dec(x_3);
lean_inc(x_12);
x_14 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_14, 0, x_6);
lean_ctor_set(x_14, 1, x_12);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_12);
lean_ctor_set(x_15, 1, x_13);
x_16 = l_Graph_pathVToPathE(x_15);
lean_ctor_set(x_1, 1, x_16);
lean_ctor_set(x_1, 0, x_14);
return x_1;
}
}
else
{
lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; 
x_17 = lean_ctor_get(x_1, 0);
lean_inc(x_17);
lean_dec(x_1);
x_18 = lean_ctor_get(x_3, 0);
lean_inc(x_18);
x_19 = lean_ctor_get(x_3, 1);
lean_inc(x_19);
if (lean_is_exclusive(x_3)) {
 lean_ctor_release(x_3, 0);
 lean_ctor_release(x_3, 1);
 x_20 = x_3;
} else {
 lean_dec_ref(x_3);
 x_20 = lean_box(0);
}
lean_inc(x_18);
x_21 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_21, 0, x_17);
lean_ctor_set(x_21, 1, x_18);
if (lean_is_scalar(x_20)) {
 x_22 = lean_alloc_ctor(1, 2, 0);
} else {
 x_22 = x_20;
}
lean_ctor_set(x_22, 0, x_18);
lean_ctor_set(x_22, 1, x_19);
x_23 = l_Graph_pathVToPathE(x_22);
x_24 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_24, 0, x_21);
lean_ctor_set(x_24, 1, x_23);
return x_24;
}
}
}
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Abbrevs(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_List(uint8_t builtin, lean_object*);
lean_object* initialize_UW_Init_Set(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_UW_Init_Graph(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Abbrevs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_List(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_UW_Init_Set(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Graph_emptyGraph___closed__1 = _init_l_Graph_emptyGraph___closed__1();
lean_mark_persistent(l_Graph_emptyGraph___closed__1);
l_Graph_emptyGraph = _init_l_Graph_emptyGraph();
lean_mark_persistent(l_Graph_emptyGraph);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
