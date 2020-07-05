; ModuleID = 'basic_mem_transfers-host-x86_64-unknown-linux-gnu.tmp.bc'
source_filename = "basic_mem_transfers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }

@.offload_maptypes = private unnamed_addr constant [1 x i64] [i64 35]
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@.__omp_offloading_10303_901e79_heavyComputation1_l8.region_id = weak constant i8 0
@.offload_sizes.1 = private unnamed_addr constant [1 x i64] [i64 8]
@.offload_maptypes.2 = private unnamed_addr constant [1 x i64] [i64 800]
@.__omp_offloading_10303_901e79_heavyComputation2_l20.region_id = weak constant i8 0
@.offload_maptypes.7 = private unnamed_addr constant [2 x i64] [i64 35, i64 35]
@.__omp_offloading_10303_901e79_heavyComputation3_l32.region_id = weak constant i8 0
@.offload_sizes.9 = private unnamed_addr constant [2 x i64] [i64 4, i64 0]
@.offload_maptypes.10 = private unnamed_addr constant [2 x i64] [i64 800, i64 544]
@.offload_maptypes.11 = private unnamed_addr constant [1 x i64] [i64 33]
@.omp_offloading.entry_name = internal unnamed_addr constant [51 x i8] c"__omp_offloading_10303_901e79_heavyComputation1_l8\00"
@.omp_offloading.entry.__omp_offloading_10303_901e79_heavyComputation1_l8 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_10303_901e79_heavyComputation1_l8.region_id, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@.omp_offloading.entry_name.12 = internal unnamed_addr constant [52 x i8] c"__omp_offloading_10303_901e79_heavyComputation2_l20\00"
@.omp_offloading.entry.__omp_offloading_10303_901e79_heavyComputation2_l20 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_10303_901e79_heavyComputation2_l20.region_id, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.omp_offloading.entry_name.12, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@.omp_offloading.entry_name.13 = internal unnamed_addr constant [52 x i8] c"__omp_offloading_10303_901e79_heavyComputation3_l32\00"
@.omp_offloading.entry.__omp_offloading_10303_901e79_heavyComputation3_l32 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_10303_901e79_heavyComputation3_l32.region_id, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.omp_offloading.entry_name.13, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.requires_reg, i8* null }]

; Function Attrs: nounwind uwtable
define dso_local double @heavyComputation1() local_unnamed_addr #0 {
entry:
  %a = alloca double, align 8
  %.offload_baseptrs = alloca [1 x i8*], align 8
  %.offload_ptrs = alloca [1 x i8*], align 8
  %.offload_baseptrs4 = alloca [1 x i8*], align 8
  %.offload_ptrs5 = alloca [1 x i8*], align 8
  %0 = bitcast double* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #3
  %call = tail call i32 (...) @rand() #3
  %rem = srem i32 %call, 777
  %conv = sitofp i32 %rem to double
  store double %conv, double* %a, align 8, !tbaa !5
  %call1 = tail call i32 (...) @rand() #3
  %1 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.offload_baseptrs, i64 0, i64 0
  %2 = bitcast [1 x i8*]* %.offload_baseptrs to double**
  store double* %a, double** %2, align 8
  %3 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.offload_ptrs, i64 0, i64 0
  %4 = bitcast [1 x i8*]* %.offload_ptrs to double**
  store double* %a, double** %4, align 8
  call void @__tgt_target_data_begin(i64 -1, i32 1, i8** nonnull %1, i8** nonnull %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_sizes.1, i64 0, i64 0), i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_maptypes, i64 0, i64 0))
  %5 = bitcast double* %a to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !5
  %7 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.offload_baseptrs4, i64 0, i64 0
  %8 = bitcast [1 x i8*]* %.offload_baseptrs4 to i64*
  store i64 %6, i64* %8, align 8
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.offload_ptrs5, i64 0, i64 0
  %10 = bitcast [1 x i8*]* %.offload_ptrs5 to i64*
  store i64 %6, i64* %10, align 8
  %11 = call i32 @__tgt_target_teams(i64 -1, i8* nonnull @.__omp_offloading_10303_901e79_heavyComputation1_l8.region_id, i32 1, i8** nonnull %7, i8** nonnull %9, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_sizes.1, i64 0, i64 0), i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_maptypes.2, i64 0, i64 0), i32 0, i32 0)
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %omp_offload.cont, label %omp_offload.failed

omp_offload.failed:                               ; preds = %entry
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_teams(%struct.ident_t* nonnull @0, i32 1, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64)* @.omp_outlined. to void (i32*, i32*, ...)*), i64 %6) #3
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %entry, %omp_offload.failed
  %conv2 = sitofp i32 %call1 to double
  call void @__tgt_target_data_end(i64 -1, i32 1, i8** nonnull %1, i8** nonnull %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_sizes.1, i64 0, i64 0), i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_maptypes, i64 0, i64 0))
  %13 = load double, double* %a, align 8, !tbaa !5
  %add = fadd double %13, %conv2
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #3
  ret double %add
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local i32 @rand(...) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @__tgt_target_data_begin(i64, i32, i8**, i8**, i64*, i64*) local_unnamed_addr #3

; Function Attrs: norecurse nounwind readnone uwtable
define internal void @.omp_outlined.(i32* noalias nocapture %.global_tid., i32* noalias nocapture %.bound_tid., i64 %a) #4 {
entry:
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare !callback !9 void @__kmpc_fork_teams(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @__tgt_target_teams(i64, i8*, i32, i8**, i8**, i64*, i64*, i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @__tgt_target_data_end(i64, i32, i8**, i8**, i64*, i64*) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @heavyComputation2(double* %a, i32 %size) local_unnamed_addr #0 {
entry:
  %size.addr = alloca i32, align 4
  %.offload_baseptrs = alloca [2 x i8*], align 8
  %.offload_ptrs = alloca [2 x i8*], align 8
  %.offload_sizes = alloca [2 x i64], align 8
  %.offload_baseptrs2 = alloca [2 x i8*], align 8
  %.offload_ptrs3 = alloca [2 x i8*], align 8
  store i32 %size, i32* %size.addr, align 4, !tbaa !11
  %call = tail call i32 (...) @rand() #3
  %conv = zext i32 %size to i64
  %0 = shl nuw nsw i64 %conv, 3
  %1 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i64 0, i64 0
  %2 = bitcast [2 x i8*]* %.offload_baseptrs to double**
  store double* %a, double** %2, align 8
  %3 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i64 0, i64 0
  %4 = bitcast [2 x i8*]* %.offload_ptrs to double**
  store double* %a, double** %4, align 8
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %.offload_sizes, i64 0, i64 0
  store i64 %0, i64* %5, align 8
  %6 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i64 0, i64 1
  %7 = bitcast i8** %6 to i32**
  store i32* %size.addr, i32** %7, align 8
  %8 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i64 0, i64 1
  %9 = bitcast i8** %8 to i32**
  store i32* %size.addr, i32** %9, align 8
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %.offload_sizes, i64 0, i64 1
  store i64 4, i64* %10, align 8
  call void @__tgt_target_data_begin(i64 -1, i32 2, i8** nonnull %1, i8** nonnull %3, i64* nonnull %5, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.7, i64 0, i64 0))
  %11 = load i32, i32* %size.addr, align 4, !tbaa !11
  %size.casted.sroa.0.0.insert.ext = zext i32 %11 to i64
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs2, i64 0, i64 0
  %13 = bitcast [2 x i8*]* %.offload_baseptrs2 to i64*
  store i64 %size.casted.sroa.0.0.insert.ext, i64* %13, align 8
  %14 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs3, i64 0, i64 0
  %15 = bitcast [2 x i8*]* %.offload_ptrs3 to i64*
  store i64 %size.casted.sroa.0.0.insert.ext, i64* %15, align 8
  %16 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs2, i64 0, i64 1
  %17 = bitcast i8** %16 to double**
  store double* %a, double** %17, align 8
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs3, i64 0, i64 1
  %19 = bitcast i8** %18 to double**
  store double* %a, double** %19, align 8
  %20 = call i32 @__tgt_target_teams(i64 -1, i8* nonnull @.__omp_offloading_10303_901e79_heavyComputation2_l20.region_id, i32 2, i8** nonnull %12, i8** nonnull %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_sizes.9, i64 0, i64 0), i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.10, i64 0, i64 0), i32 0, i32 0)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %omp_offload.cont, label %omp_offload.failed

omp_offload.failed:                               ; preds = %entry
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_teams(%struct.ident_t* nonnull @0, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, double*)* @.omp_outlined..4 to void (i32*, i32*, ...)*), i64 %size.casted.sroa.0.0.insert.ext, double* %a) #3
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %entry, %omp_offload.failed
  %rem = srem i32 %call, 7
  call void @__tgt_target_data_end(i64 -1, i32 2, i8** nonnull %1, i8** nonnull %3, i64* nonnull %5, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.7, i64 0, i64 0))
  ret i32 %rem
}

; Function Attrs: nofree norecurse nounwind uwtable
define internal void @.omp_outlined..4(i32* noalias nocapture readnone %.global_tid., i32* noalias nocapture readnone %.bound_tid., i64 %size, double* nocapture %a) #5 {
entry:
  %size.addr.sroa.0.0.extract.trunc = trunc i64 %size to i32
  %cmp6 = icmp eq i32 %size.addr.sroa.0.0.extract.trunc, 0
  br i1 %cmp6, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = and i64 %size, 4294967295
  %min.iters.check = icmp ult i64 %wide.trip.count, 4
  br i1 %min.iters.check, label %for.body.preheader9, label %vector.ph

for.body.preheader9:                              ; preds = %middle.block, %for.body.preheader
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

vector.ph:                                        ; preds = %for.body.preheader
  %n.mod.vf = and i64 %size, 3
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = getelementptr inbounds double, double* %a, i64 %index
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %1, align 8, !tbaa !5
  %2 = getelementptr inbounds double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load8 = load <2 x double>, <2 x double>* %3, align 8, !tbaa !5
  %4 = fadd <2 x double> %wide.load, <double 1.000000e+00, double 1.000000e+00>
  %5 = fadd <2 x double> %wide.load8, <double 1.000000e+00, double 1.000000e+00>
  %6 = fmul <2 x double> %4, <double 0x4009220BC382A130, double 0x4009220BC382A130>
  %7 = fmul <2 x double> %5, <double 0x4009220BC382A130, double 0x4009220BC382A130>
  %8 = bitcast double* %0 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8, !tbaa !5
  %9 = bitcast double* %2 to <2 x double>*
  store <2 x double> %7, <2 x double>* %9, align 8, !tbaa !5
  %index.next = add i64 %index, 4
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader9

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader9, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader9 ]
  %arrayidx = getelementptr inbounds double, double* %a, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8, !tbaa !5
  %inc = fadd double %11, 1.000000e+00
  %mul = fmul double %inc, 0x4009220BC382A130
  store double %mul, double* %arrayidx, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body, !llvm.loop !15
}

; Function Attrs: nounwind uwtable
define dso_local i32 @heavyComputation3(double* noalias %a, i32 %size) local_unnamed_addr #0 {
entry:
  %size.addr = alloca i32, align 4
  %.offload_baseptrs = alloca [2 x i8*], align 8
  %.offload_ptrs = alloca [2 x i8*], align 8
  %.offload_sizes = alloca [2 x i64], align 8
  %.offload_baseptrs2 = alloca [2 x i8*], align 8
  %.offload_ptrs3 = alloca [2 x i8*], align 8
  store i32 %size, i32* %size.addr, align 4, !tbaa !11
  %call = tail call i32 (...) @rand() #3
  %conv = zext i32 %size to i64
  %0 = shl nuw nsw i64 %conv, 3
  %1 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i64 0, i64 0
  %2 = bitcast [2 x i8*]* %.offload_baseptrs to double**
  store double* %a, double** %2, align 8
  %3 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i64 0, i64 0
  %4 = bitcast [2 x i8*]* %.offload_ptrs to double**
  store double* %a, double** %4, align 8
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %.offload_sizes, i64 0, i64 0
  store i64 %0, i64* %5, align 8
  %6 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i64 0, i64 1
  %7 = bitcast i8** %6 to i32**
  store i32* %size.addr, i32** %7, align 8
  %8 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i64 0, i64 1
  %9 = bitcast i8** %8 to i32**
  store i32* %size.addr, i32** %9, align 8
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %.offload_sizes, i64 0, i64 1
  store i64 4, i64* %10, align 8
  call void @__tgt_target_data_begin(i64 -1, i32 2, i8** nonnull %1, i8** nonnull %3, i64* nonnull %5, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.7, i64 0, i64 0))
  %11 = load i32, i32* %size.addr, align 4, !tbaa !11
  %size.casted.sroa.0.0.insert.ext = zext i32 %11 to i64
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs2, i64 0, i64 0
  %13 = bitcast [2 x i8*]* %.offload_baseptrs2 to i64*
  store i64 %size.casted.sroa.0.0.insert.ext, i64* %13, align 8
  %14 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs3, i64 0, i64 0
  %15 = bitcast [2 x i8*]* %.offload_ptrs3 to i64*
  store i64 %size.casted.sroa.0.0.insert.ext, i64* %15, align 8
  %16 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs2, i64 0, i64 1
  %17 = bitcast i8** %16 to double**
  store double* %a, double** %17, align 8
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs3, i64 0, i64 1
  %19 = bitcast i8** %18 to double**
  store double* %a, double** %19, align 8
  %20 = call i32 @__tgt_target_teams(i64 -1, i8* nonnull @.__omp_offloading_10303_901e79_heavyComputation3_l32.region_id, i32 2, i8** nonnull %12, i8** nonnull %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_sizes.9, i64 0, i64 0), i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.10, i64 0, i64 0), i32 0, i32 0)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %omp_offload.cont, label %omp_offload.failed

omp_offload.failed:                               ; preds = %entry
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_teams(%struct.ident_t* nonnull @0, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, double*)* @.omp_outlined..8 to void (i32*, i32*, ...)*), i64 %size.casted.sroa.0.0.insert.ext, double* %a) #3
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %entry, %omp_offload.failed
  %rem = srem i32 %call, 7
  call void @__tgt_target_data_end(i64 -1, i32 2, i8** nonnull %1, i8** nonnull %3, i64* nonnull %5, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.7, i64 0, i64 0))
  ret i32 %rem
}

; Function Attrs: nofree norecurse nounwind uwtable
define internal void @.omp_outlined..8(i32* noalias nocapture readnone %.global_tid., i32* noalias nocapture readnone %.bound_tid., i64 %size, double* nocapture %a) #5 {
entry:
  %size.addr.sroa.0.0.extract.trunc = trunc i64 %size to i32
  %cmp6 = icmp eq i32 %size.addr.sroa.0.0.extract.trunc, 0
  br i1 %cmp6, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = and i64 %size, 4294967295
  %min.iters.check = icmp ult i64 %wide.trip.count, 4
  br i1 %min.iters.check, label %for.body.preheader9, label %vector.ph

for.body.preheader9:                              ; preds = %middle.block, %for.body.preheader
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

vector.ph:                                        ; preds = %for.body.preheader
  %n.mod.vf = and i64 %size, 3
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = getelementptr inbounds double, double* %a, i64 %index
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %1, align 8, !tbaa !5
  %2 = getelementptr inbounds double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load8 = load <2 x double>, <2 x double>* %3, align 8, !tbaa !5
  %4 = fadd <2 x double> %wide.load, <double 1.000000e+00, double 1.000000e+00>
  %5 = fadd <2 x double> %wide.load8, <double 1.000000e+00, double 1.000000e+00>
  %6 = fmul <2 x double> %4, <double 0x4009220BC382A130, double 0x4009220BC382A130>
  %7 = fmul <2 x double> %5, <double 0x4009220BC382A130, double 0x4009220BC382A130>
  %8 = bitcast double* %0 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8, !tbaa !5
  %9 = bitcast double* %2 to <2 x double>*
  store <2 x double> %7, <2 x double>* %9, align 8, !tbaa !5
  %index.next = add i64 %index, 4
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader9

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader9, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader9 ]
  %arrayidx = getelementptr inbounds double, double* %a, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8, !tbaa !5
  %inc = fadd double %11, 1.000000e+00
  %mul = fmul double %inc, 0x4009220BC382A130
  store double %mul, double* %arrayidx, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body, !llvm.loop !18
}

; Function Attrs: nounwind uwtable
define dso_local i32 @dataTransferOnly1(double* noalias %a, i32 %size) local_unnamed_addr #0 {
entry:
  %.offload_baseptrs = alloca [1 x i8*], align 8
  %.offload_ptrs = alloca [1 x i8*], align 8
  %.offload_sizes = alloca [1 x i64], align 8
  %call = tail call i32 (...) @rand() #3
  %conv = zext i32 %size to i64
  %0 = shl nuw nsw i64 %conv, 3
  %1 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.offload_baseptrs, i64 0, i64 0
  %2 = bitcast [1 x i8*]* %.offload_baseptrs to double**
  store double* %a, double** %2, align 8
  %3 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.offload_ptrs, i64 0, i64 0
  %4 = bitcast [1 x i8*]* %.offload_ptrs to double**
  store double* %a, double** %4, align 8
  %5 = getelementptr inbounds [1 x i64], [1 x i64]* %.offload_sizes, i64 0, i64 0
  store i64 %0, i64* %5, align 8
  call void @__tgt_target_data_begin(i64 -1, i32 1, i8** nonnull %1, i8** nonnull %3, i64* nonnull %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_maptypes.11, i64 0, i64 0))
  %rem = urem i32 %call, %size
  call void @__tgt_target_data_end(i64 -1, i32 1, i8** nonnull %1, i8** nonnull %3, i64* nonnull %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_maptypes.11, i64 0, i64 0))
  ret i32 %rem
}

; Function Attrs: nounwind uwtable
define internal void @.omp_offloading.requires_reg() #0 section ".text.startup" {
entry:
  tail call void @__tgt_register_requires(i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_register_requires(i64) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!omp_offload.info = !{!0, !1, !2}
!llvm.module.flags = !{!3}
!llvm.ident = !{!4}

!0 = !{i32 0, i32 66307, i32 9444985, !"heavyComputation1", i32 8, i32 0}
!1 = !{i32 0, i32 66307, i32 9444985, !"heavyComputation2", i32 20, i32 1}
!2 = !{i32 0, i32 66307, i32 9444985, !"heavyComputation3", i32 32, i32 2}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!"clang version 11.0.0 (git@github.com:hamax97/llvm-project.git 37cca7a7f26b3642e19fde1ccddb21d94c7195fe)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10}
!10 = !{i64 2, i64 -1, i64 -1, i1 true}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !7, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = distinct !{!15, !16, !14}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !16, !14}
