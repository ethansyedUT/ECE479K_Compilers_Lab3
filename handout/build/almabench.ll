; ModuleID = '<stdin>'
source_filename = "../tests/almabench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FD8C637FD3B6253, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FE725849423E3E0, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FF000011136AEF5, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FF860FD96F0D223, double 3.000000e-10, double 0.000000e+00], [3 x double] [double 0x4014CF7737365089, double 1.913200e-06, double -3.900000e-09], [3 x double] [double 0x40231C1D0EBB7C0F, double -2.138960e-05, double 4.440000e-08], [3 x double] [double 0x403337EC14C35EFA, double -3.716000e-07, double 0x3E7A47A3038502A4], [3 x double] [double 0x403E1C425059FB17, double -1.663500e-06, double 6.860000e-08]], align 16
@dlm = internal constant [8 x [3 x double]] [[3 x double] [double 0x406F88076B035926, double 0x41F40BBCADEE3CB4, double -1.927890e+00], [3 x double] [double 0x4066BF5A874FEAFA, double 0x41DF6432F5157881, double 5.938100e-01], [3 x double] [double 0x40591DDA6DBF7622, double 0x41D34FC2F3B56502, double -2.044110e+00], [3 x double] [double 0x407636ED90F7B482, double 0x41C4890A4B784DFD, double 9.426400e-01], [3 x double] [double 0x40412CFE90EA1D96, double 0x419A0C7E6F1EA0BA, double 0xC03E9A915379FA98], [3 x double] [double 0x404909E9B1DFE17D, double 0x4184FA9E14756430, double 0x4052E76ED677707A], [3 x double] [double 0x4073A0E14D09C902, double 0x416D6BA57E0EFDCA, double -1.750830e+00], [3 x double] [double 0x4073059422411D82, double 0x415E0127CD46B26C, double 2.110300e-01]], align 16
@e = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FCA52242A37D430, double 0x3F2ABF4B9459E7F4, double -2.834900e-06], [3 x double] [double 0x3F7BBCDE77820827, double 0xBF3F4DAC25FB4BC2, double 9.812700e-06], [3 x double] [double 0x3F911C1175CC9F7B, double 0xBF3B8C8FA536F731, double -1.267340e-05], [3 x double] [double 0x3FB7E91AD74BF5B0, double 0x3F4DA66143B5E407, double -8.064100e-06], [3 x double] [double 0x3FA8D4B857E48742, double 0x3F5ABE2B9A18B7B5, double -4.713660e-05], [3 x double] [double 0x3FAC70CE5FA41E66, double 0xBF6C6594A86FD58E, double -6.436390e-05], [3 x double] [double 0x3FA7BF479022D287, double 0xBF31E2FE6AE927D8, double 7.891300e-06], [3 x double] [double 0x3F835D88E0FE76D8, double 6.032630e-05, double 0.000000e+00]], align 16
@pi = internal constant [8 x [3 x double]] [[3 x double] [double 0x40535D310DE9F882, double 0x40B6571DAB9F559B, double -4.830160e+00], [3 x double] [double 0x40607209DADFB507, double 0x4065EF9096BB98C8, double 0xC07F27B59DDC1E79], [3 x double] [double 0x4059BBFD82CD2461, double 0x40C6AE2D2BD3C361, double 0x404AA34C6E6D9BE5], [3 x double] [double 0x407500F6B7DFD5BE, double 0x40CF363AC3222920, double -6.232800e+01], [3 x double] [double 0x402CA993F265B897, double 0x40BE4EC06AD2DCB1, double 0x40703F599ED7C6FC], [3 x double] [double 0x405743A9C7642D26, double 0x40D3EADFA415F45E, double 0x4067C84DFCE3150E], [3 x double] [double 0x4065A02B58283528, double 0x40A91F1FF04577D9, double 0xC0410BE37DE939EB], [3 x double] [double 0x40480F65305B6785, double 0x40906AE060FE4799, double 0x403B65ACEEE0F3CB]], align 16
@dinc = internal constant [8 x [3 x double]] [[3 x double] [double 0x401C051B1D92B7FE, double 0xC06AC83387160957, double 2.897700e-01], [3 x double] [double 0x400B28447E34386C, double 0xC03ED828A1DFB939, double 0xC0275B52007DD441], [3 x double] [double 0.000000e+00, double 0x407D5F90F51AC9B0, double -3.350530e+00], [3 x double] [double 0x3FFD987ACB2252BB, double 0xC072551355475A32, double -8.118300e+00], [3 x double] [double 0x3FF4DA2E7A10E830, double 0xC051E3C504816F00, double 0x4027E7EBAF102364], [3 x double] [double 0x4003E939471E778F, double 0x4056F686594AF4F1, double 0xC031A989374BC6A8], [3 x double] [double 0x3FE8BE07677D67B5, double 0xC04E5D15DF6555C5, double 1.257590e+00], [3 x double] [double 0x3FFC51B9CE9853F4, double 0x40203F251C193B3A, double 8.135000e-02]], align 16
@omega = internal constant [8 x [3 x double]] [[3 x double] [double 0x40482A5AB400A313, double 0xC0B1A3379F01B867, double 0xC03FCC8605681ECD], [3 x double] [double 0x40532B83CFF8FC2B, double 0xC0C38C3DA31A4BDC, double 0xC049A9BEF49CF56F], [3 x double] [double 0x4065DBF10E4FF9E8, double 0xC0C0F3A29A804966, double 0x402EAF0ED3D859C9], [3 x double] [double 0x4048C76F992A88EB, double 0xC0C4BE7350092CCF, double 0xC06CD25F84CAD57C], [3 x double] [double 0x40591DB8D838BBB3, double 0x40B8DA091DBCA969, double 0x4074685935FC3B4F], [3 x double] [double 0x405C6A9797E1B38F, double 0xC0C20C1986983516, double 0xC0508F320D9945B7], [3 x double] [double 0x405280619982C872, double 0x40A4DA4CF80DC337, double 0x40623E1187E7C06E], [3 x double] [double 0x40607916FEBF632D, double 0xC06BBE2EDBB59DDC, double -7.872800e-01]], align 16
@kp = internal constant [8 x [9 x double]] [[9 x double] [double 6.961300e+04, double 7.564500e+04, double 8.830600e+04, double 5.989900e+04, double 1.574600e+04, double 7.108700e+04, double 1.421730e+05, double 3.086000e+03, double 0.000000e+00], [9 x double] [double 2.186300e+04, double 3.279400e+04, double 2.693400e+04, double 1.093100e+04, double 2.625000e+04, double 4.372500e+04, double 5.386700e+04, double 2.893900e+04, double 0.000000e+00], [9 x double] [double 1.600200e+04, double 2.186300e+04, double 3.200400e+04, double 1.093100e+04, double 1.452900e+04, double 1.636800e+04, double 1.531800e+04, double 3.279400e+04, double 0.000000e+00], [9 x double] [double 6.345000e+03, double 7.818000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 1.416300e+04, double 1.107000e+03, double 4.872000e+03, double 0.000000e+00], [9 x double] [double 1.760000e+03, double 1.454000e+03, double 1.167000e+03, double 8.800000e+02, double 2.870000e+02, double 2.640000e+03, double 1.900000e+01, double 2.047000e+03, double 1.454000e+03], [9 x double] [double 5.740000e+02, double 0.000000e+00, double 8.800000e+02, double 2.870000e+02, double 1.900000e+01, double 1.760000e+03, double 1.167000e+03, double 3.060000e+02, double 5.740000e+02], [9 x double] [double 2.040000e+02, double 0.000000e+00, double 1.770000e+02, double 1.265000e+03, double 4.000000e+00, double 3.850000e+02, double 2.000000e+02, double 2.080000e+02, double 2.040000e+02], [9 x double] [double 0.000000e+00, double 1.020000e+02, double 1.060000e+02, double 4.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 0.000000e+00]], align 16
@kq = internal constant [8 x [10 x double]] [[10 x double] [double 3.086000e+03, double 1.574600e+04, double 6.961300e+04, double 5.989900e+04, double 7.564500e+04, double 8.830600e+04, double 1.266100e+04, double 2.658000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.186300e+04, double 3.279400e+04, double 1.093100e+04, double 7.300000e+01, double 4.387000e+03, double 2.693400e+04, double 1.473000e+03, double 2.157000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 1.600200e+04, double 2.186300e+04, double 1.093100e+04, double 1.473000e+03, double 3.200400e+04, double 4.387000e+03, double 7.300000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 6.345000e+03, double 7.818000e+03, double 1.107000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 5.320000e+02, double 1.000000e+01, double 0.000000e+00], [10 x double] [double 1.900000e+01, double 1.760000e+03, double 1.454000e+03, double 2.870000e+02, double 1.167000e+03, double 8.800000e+02, double 5.740000e+02, double 2.640000e+03, double 1.900000e+01, double 1.454000e+03], [10 x double] [double 1.900000e+01, double 5.740000e+02, double 2.870000e+02, double 3.060000e+02, double 1.760000e+03, double 1.200000e+01, double 3.100000e+01, double 3.800000e+01, double 1.900000e+01, double 5.740000e+02], [10 x double] [double 4.000000e+00, double 2.040000e+02, double 1.770000e+02, double 8.000000e+00, double 3.100000e+01, double 2.000000e+02, double 1.265000e+03, double 1.020000e+02, double 4.000000e+00, double 2.040000e+02], [10 x double] [double 4.000000e+00, double 1.020000e+02, double 1.060000e+02, double 8.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 4.000000e+00, double 1.020000e+02]], align 16
@ca = internal constant [8 x [9 x double]] [[9 x double] [double 4.000000e+00, double -1.300000e+01, double 1.100000e+01, double -9.000000e+00, double -9.000000e+00, double -3.000000e+00, double -1.000000e+00, double 4.000000e+00, double 0.000000e+00], [9 x double] [double -1.560000e+02, double 5.900000e+01, double -4.200000e+01, double 6.000000e+00, double 1.900000e+01, double -2.000000e+01, double -1.000000e+01, double -1.200000e+01, double 0.000000e+00], [9 x double] [double 6.400000e+01, double -1.520000e+02, double 6.200000e+01, double -8.000000e+00, double 3.200000e+01, double -4.100000e+01, double 1.900000e+01, double -1.100000e+01, double 0.000000e+00], [9 x double] [double 1.240000e+02, double 6.210000e+02, double -1.450000e+02, double 2.080000e+02, double 5.400000e+01, double -5.700000e+01, double 3.000000e+01, double 1.500000e+01, double 0.000000e+00], [9 x double] [double -2.343700e+04, double -2.634000e+03, double 6.601000e+03, double 6.259000e+03, double -1.507000e+03, double -1.821000e+03, double 2.620000e+03, double -2.115000e+03, double -1.489000e+03], [9 x double] [double 6.291100e+04, double -1.199190e+05, double 7.933600e+04, double 1.781400e+04, double -2.424100e+04, double 1.206800e+04, double 8.306000e+03, double -4.893000e+03, double 8.902000e+03], [9 x double] [double 3.890610e+05, double -2.621250e+05, double -4.408800e+04, double 8.387000e+03, double -2.297600e+04, double -2.093000e+03, double -6.150000e+02, double -9.720000e+03, double 6.633000e+03], [9 x double] [double -4.122350e+05, double -1.570460e+05, double -3.143000e+04, double 3.781700e+04, double -9.740000e+03, double -1.300000e+01, double -7.449000e+03, double 9.644000e+03, double 0.000000e+00]], align 16
@sa = internal constant [8 x [9 x double]] [[9 x double] [double -2.900000e+01, double -1.000000e+00, double 9.000000e+00, double 6.000000e+00, double -6.000000e+00, double 5.000000e+00, double 4.000000e+00, double 0.000000e+00, double 0.000000e+00], [9 x double] [double -4.800000e+01, double -1.250000e+02, double -2.600000e+01, double -3.700000e+01, double 1.800000e+01, double -1.300000e+01, double -2.000000e+01, double -2.000000e+00, double 0.000000e+00], [9 x double] [double -1.500000e+02, double -4.600000e+01, double 6.800000e+01, double 5.400000e+01, double 1.400000e+01, double 2.400000e+01, double -2.800000e+01, double 2.200000e+01, double 0.000000e+00], [9 x double] [double -6.210000e+02, double 5.320000e+02, double -6.940000e+02, double -2.000000e+01, double 1.920000e+02, double -9.400000e+01, double 7.100000e+01, double -7.300000e+01, double 0.000000e+00], [9 x double] [double -1.461400e+04, double -1.982800e+04, double -5.869000e+03, double 1.881000e+03, double -4.372000e+03, double -2.255000e+03, double 7.820000e+02, double 9.300000e+02, double 9.130000e+02], [9 x double] [double 1.397370e+05, double 0.000000e+00, double 2.466700e+04, double 5.112300e+04, double -5.102000e+03, double 7.429000e+03, double -4.095000e+03, double -1.976000e+03, double -9.566000e+03], [9 x double] [double -1.380810e+05, double 0.000000e+00, double 3.720500e+04, double -4.903900e+04, double -4.190100e+04, double -3.387200e+04, double -2.703700e+04, double -1.247400e+04, double 1.879700e+04], [9 x double] [double 0.000000e+00, double 2.849200e+04, double 1.332360e+05, double 6.965400e+04, double 5.232200e+04, double -4.957700e+04, double -2.643000e+04, double -3.593000e+03, double 0.000000e+00]], align 16
@cl = internal constant [8 x [10 x double]] [[10 x double] [double 2.100000e+01, double -9.500000e+01, double -1.570000e+02, double 4.100000e+01, double -5.000000e+00, double 4.200000e+01, double 2.300000e+01, double 3.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.600000e+02, double -3.130000e+02, double -2.350000e+02, double 6.000000e+01, double -7.400000e+01, double -7.600000e+01, double -2.700000e+01, double 3.400000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -3.250000e+02, double -3.220000e+02, double -7.900000e+01, double 2.320000e+02, double -5.200000e+01, double 9.700000e+01, double 5.500000e+01, double -4.100000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.268000e+03, double -9.790000e+02, double 8.020000e+02, double 6.020000e+02, double -6.680000e+02, double -3.300000e+01, double 3.450000e+02, double 2.010000e+02, double -5.500000e+01, double 0.000000e+00], [10 x double] [double 7.610000e+03, double -4.997000e+03, double -7.689000e+03, double -5.841000e+03, double -2.617000e+03, double 1.115000e+03, double -7.480000e+02, double -6.070000e+02, double 6.074000e+03, double 3.540000e+02], [10 x double] [double -1.854900e+04, double 3.012500e+04, double 2.001200e+04, double -7.300000e+02, double 8.240000e+02, double 2.300000e+01, double 1.289000e+03, double -3.520000e+02, double -1.476700e+04, double -2.062000e+03], [10 x double] [double -1.352450e+05, double -1.459400e+04, double 4.197000e+03, double -4.030000e+03, double -5.630000e+03, double -2.898000e+03, double 2.540000e+03, double -3.060000e+02, double 2.939000e+03, double 1.986000e+03], [10 x double] [double 8.994800e+04, double 2.103000e+03, double 8.963000e+03, double 2.695000e+03, double 3.682000e+03, double 1.648000e+03, double 8.660000e+02, double -1.540000e+02, double -1.963000e+03, double -2.830000e+02]], align 16
@sl = internal constant [8 x [10 x double]] [[10 x double] [double -3.420000e+02, double 1.360000e+02, double -2.300000e+01, double 6.200000e+01, double 6.600000e+01, double -5.200000e+01, double -3.300000e+01, double 1.700000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 5.240000e+02, double -1.490000e+02, double -3.500000e+01, double 1.170000e+02, double 1.510000e+02, double 1.220000e+02, double -7.100000e+01, double -6.200000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.050000e+02, double -1.370000e+02, double 2.580000e+02, double 3.500000e+01, double -1.160000e+02, double -8.800000e+01, double -1.120000e+02, double -8.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 8.540000e+02, double -2.050000e+02, double -9.360000e+02, double -2.400000e+02, double 1.400000e+02, double -3.410000e+02, double -9.700000e+01, double -2.320000e+02, double 5.360000e+02, double 0.000000e+00], [10 x double] [double -5.698000e+04, double 8.016000e+03, double 1.012000e+03, double 1.448000e+03, double -3.024000e+03, double -3.710000e+03, double 3.180000e+02, double 5.030000e+02, double 3.767000e+03, double 5.770000e+02], [10 x double] [double 1.386060e+05, double -1.347800e+04, double -4.964000e+03, double 1.441000e+03, double -1.319000e+03, double -1.482000e+03, double 4.270000e+02, double 1.236000e+03, double -9.167000e+03, double -1.918000e+03], [10 x double] [double 7.123400e+04, double -4.111600e+04, double 5.334000e+03, double -4.935000e+03, double -1.848000e+03, double 6.600000e+01, double 4.340000e+02, double -1.748000e+03, double 3.780000e+03, double -7.010000e+02], [10 x double] [double -4.764500e+04, double 1.164700e+04, double 2.166000e+03, double 3.194000e+03, double 6.790000e+02, double 0.000000e+00, double -2.440000e+02, double -4.190000e+02, double -2.531000e+03, double 4.800000e+01]], align 16
@amas = internal constant [8 x double] [double 6.023600e+06, double 0x4118EF2E00000000, double 0x4114131200000000, double 3.098710e+06, double 0x40905D6B851EB852, double 3.498500e+03, double 2.286900e+04, double 1.931400e+04], align 16
@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%f %f %f\0A\00", align 1
@stdout = external global ptr, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local double @anpm(double noundef %0) #0 {
anpm_BB1:
  %1 = call double @fmod(double noundef %0, double noundef 0x401921FB54442D18) #5
  %2 = call double @llvm.fabs.f64(double %1)
  %3 = fcmp ult double %2, 0x400921FB54442D18
  %4 = fcmp olt double %0, 0.000000e+00
  %5 = select i1 %4, double 0xC01921FB54442D18, double 0x401921FB54442D18
  %6 = select i1 %3, double 0.000000e+00, double %5
  %.0 = fsub double %1, %6
  ret double %.0
}

; Function Attrs: nounwind
declare double @fmod(double noundef, double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @planetpv(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
planetpv_BB1:
  %3 = load double, ptr %0, align 8
  %4 = fadd double %3, 0xC142B42C80000000
  %5 = getelementptr inbounds double, ptr %0, i64 1
  %6 = load double, ptr %5, align 8
  %7 = fadd double %4, %6
  %8 = fdiv double %7, 3.652500e+05
  %9 = sext i32 %1 to i64
  %10 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %9
  %11 = load double, ptr %10, align 8
  %12 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %9, i64 1
  %13 = load double, ptr %12, align 8
  %14 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %9, i64 2
  %15 = load double, ptr %14, align 8
  %16 = call double @llvm.fmuladd.f64(double %15, double %8, double %13)
  %17 = call double @llvm.fmuladd.f64(double %16, double %8, double %11)
  %18 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %9
  %19 = load double, ptr %18, align 8
  %20 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %9, i64 1
  %21 = load double, ptr %20, align 8
  %22 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %9, i64 2
  %23 = load double, ptr %22, align 8
  %24 = call double @llvm.fmuladd.f64(double %23, double %8, double %21)
  %25 = fmul double %8, %24
  %26 = call double @llvm.fmuladd.f64(double %19, double 3.600000e+03, double %25)
  %27 = fmul double %26, 0x3ED455A5B2FF8F9D
  %28 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %9
  %29 = load double, ptr %28, align 8
  %30 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %9, i64 1
  %31 = load double, ptr %30, align 8
  %32 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %9, i64 2
  %33 = load double, ptr %32, align 8
  %34 = call double @llvm.fmuladd.f64(double %33, double %8, double %31)
  %35 = call double @llvm.fmuladd.f64(double %34, double %8, double %29)
  %36 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %9
  %37 = load double, ptr %36, align 8
  %38 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %9, i64 1
  %39 = load double, ptr %38, align 8
  %40 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %9, i64 2
  %41 = load double, ptr %40, align 8
  %42 = call double @llvm.fmuladd.f64(double %41, double %8, double %39)
  %43 = fmul double %8, %42
  %44 = call double @llvm.fmuladd.f64(double %37, double 3.600000e+03, double %43)
  %45 = fmul double %44, 0x3ED455A5B2FF8F9D
  %46 = call double @anpm(double noundef %45)
  %47 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %9
  %48 = load double, ptr %47, align 8
  %49 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %9, i64 1
  %50 = load double, ptr %49, align 8
  %51 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %9, i64 2
  %52 = load double, ptr %51, align 8
  %53 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %9
  %54 = load double, ptr %53, align 8
  %55 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %9, i64 1
  %56 = load double, ptr %55, align 8
  %57 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %9, i64 2
  %58 = load double, ptr %57, align 8
  %59 = call double @llvm.fmuladd.f64(double %58, double %8, double %56)
  %60 = fmul double %8, %59
  %61 = call double @llvm.fmuladd.f64(double %54, double 3.600000e+03, double %60)
  %62 = fmul double %61, 0x3ED455A5B2FF8F9D
  %63 = call double @anpm(double noundef %62)
  %64 = fmul double %8, 0x3FD702A41F2E9970
  br label %planetpv_BB2_preheader

planetpv_BB2:                                     ; preds = %planetpv_BB2_preheader, %planetpv_BB3
  %.03 = phi i32 [ 0, %planetpv_BB2_preheader ], [ %91, %planetpv_BB3 ]
  %.02 = phi double [ %17, %planetpv_BB2_preheader ], [ %90, %planetpv_BB3 ]
  %.01 = phi double [ %27, %planetpv_BB2_preheader ], [ %87, %planetpv_BB3 ]
  %65 = icmp ult i32 %.03, 8
  br i1 %65, label %planetpv_BB3, label %planetpv_BB4

planetpv_BB3:                                     ; preds = %planetpv_BB2
  %66 = zext i32 %.03 to i64
  %67 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %9, i64 %66
  %68 = load double, ptr %67, align 8
  %69 = fmul double %64, %68
  %70 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %9, i64 %66
  %71 = load double, ptr %70, align 8
  %72 = fmul double %64, %71
  %73 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %9, i64 %66
  %74 = load double, ptr %73, align 8
  %75 = call double @cos(double noundef %69) #5
  %76 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %9, i64 %66
  %77 = load double, ptr %76, align 8
  %78 = call double @sin(double noundef %69) #5
  %79 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %9, i64 %66
  %80 = load double, ptr %79, align 8
  %81 = call double @cos(double noundef %72) #5
  %82 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %9, i64 %66
  %83 = load double, ptr %82, align 8
  %84 = call double @sin(double noundef %72) #5
  %85 = fmul double %83, %84
  %86 = call double @llvm.fmuladd.f64(double %80, double %81, double %85)
  %87 = call double @llvm.fmuladd.f64(double %86, double 0x3E7AD7F29ABCAF48, double %.01)
  %88 = fmul double %77, %78
  %89 = call double @llvm.fmuladd.f64(double %74, double %75, double %88)
  %90 = call double @llvm.fmuladd.f64(double %89, double 0x3E7AD7F29ABCAF48, double %.02)
  %91 = add nuw nsw i32 %.03, 1
  br label %planetpv_BB2, !llvm.loop !6

planetpv_BB4:                                     ; preds = %planetpv_BB2
  %92 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %9, i64 8
  %93 = load double, ptr %92, align 8
  %94 = fmul double %64, %93
  %95 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %9, i64 8
  %96 = load double, ptr %95, align 8
  %97 = call double @cos(double noundef %94) #5
  %98 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %9, i64 8
  %99 = load double, ptr %98, align 8
  %100 = call double @sin(double noundef %94) #5
  br label %planetpv_BB5_preheader

planetpv_BB5:                                     ; preds = %planetpv_BB5_preheader, %planetpv_BB6
  %.14 = phi i32 [ 8, %planetpv_BB5_preheader ], [ %116, %planetpv_BB6 ]
  %.1 = phi double [ %.01, %planetpv_BB5_preheader ], [ %115, %planetpv_BB6 ]
  %101 = icmp ult i32 %.14, 10
  br i1 %101, label %planetpv_BB6, label %planetpv_BB7

planetpv_BB6:                                     ; preds = %planetpv_BB5
  %102 = zext i32 %.14 to i64
  %103 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %9, i64 %102
  %104 = load double, ptr %103, align 8
  %105 = fmul double %64, %104
  %106 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %9, i64 %102
  %107 = load double, ptr %106, align 8
  %108 = call double @cos(double noundef %105) #5
  %109 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %9, i64 %102
  %110 = load double, ptr %109, align 8
  %111 = call double @sin(double noundef %105) #5
  %112 = fmul double %110, %111
  %113 = call double @llvm.fmuladd.f64(double %107, double %108, double %112)
  %114 = fmul double %8, %113
  %115 = call double @llvm.fmuladd.f64(double %114, double 0x3E7AD7F29ABCAF48, double %.1)
  %116 = add nuw nsw i32 %.14, 1
  br label %planetpv_BB5, !llvm.loop !8

planetpv_BB7:                                     ; preds = %planetpv_BB5
  %117 = call double @fmod(double noundef %.1, double noundef 0x401921FB54442D18) #5
  %118 = fsub double %117, %46
  %119 = call double @sin(double noundef %118) #5
  %120 = call double @llvm.fmuladd.f64(double %35, double %119, double %118)
  br label %planetpv_BB8_preheader

planetpv_BB8:                                     ; preds = %planetpv_BB8_preheader, %planetpv_BB8
  %.2 = phi i32 [ 0, %planetpv_BB8_preheader ], [ %129, %planetpv_BB8 ]
  %.0 = phi double [ %120, %planetpv_BB8_preheader ], [ %128, %planetpv_BB8 ]
  %121 = fsub double %118, %.0
  %122 = call double @sin(double noundef %.0) #5
  %123 = call double @llvm.fmuladd.f64(double %35, double %122, double %121)
  %124 = call double @cos(double noundef %.0) #5
  %125 = fneg double %35
  %126 = call double @llvm.fmuladd.f64(double %125, double %124, double 1.000000e+00)
  %127 = fdiv double %123, %126
  %128 = fadd double %.0, %127
  %129 = add nuw nsw i32 %.2, 1
  %130 = icmp ugt i32 %.2, 8
  %131 = call double @llvm.fabs.f64(double %127)
  %132 = fcmp olt double %131, 0x3D719799812DEA11
  %or.cond = select i1 %130, i1 true, i1 %132
  br i1 %or.cond, label %planetpv_BB9, label %planetpv_BB8

planetpv_BB9:                                     ; preds = %planetpv_BB8
  %133 = fmul double %99, %100
  %134 = call double @llvm.fmuladd.f64(double %96, double %97, double %133)
  %135 = fmul double %8, %134
  %136 = call double @llvm.fmuladd.f64(double %135, double 0x3E7AD7F29ABCAF48, double %.02)
  %137 = call double @llvm.fmuladd.f64(double %52, double %8, double %50)
  %138 = fmul double %8, %137
  %139 = call double @llvm.fmuladd.f64(double %48, double 3.600000e+03, double %138)
  %140 = fmul double %139, 0x3ED455A5B2FF8F9D
  %141 = fmul double %128, 5.000000e-01
  %142 = fadd double %35, 1.000000e+00
  %143 = fsub double 1.000000e+00, %35
  %144 = fdiv double %142, %143
  %145 = call double @sqrt(double noundef %144) #5
  %146 = call double @sin(double noundef %141) #5
  %147 = fmul double %145, %146
  %148 = call double @cos(double noundef %141) #5
  %149 = call double @atan2(double noundef %147, double noundef %148) #5
  %150 = fmul double %149, 2.000000e+00
  %151 = call double @cos(double noundef %128) #5
  %152 = call double @llvm.fmuladd.f64(double %125, double %151, double 1.000000e+00)
  %153 = fmul double %136, %152
  %154 = getelementptr inbounds [8 x double], ptr @amas, i64 0, i64 %9
  %155 = load double, ptr %154, align 8
  %156 = fdiv double 1.000000e+00, %155
  %157 = fadd double %156, 1.000000e+00
  %158 = fmul double %136, %136
  %159 = fmul double %136, %158
  %160 = fdiv double %157, %159
  %161 = call double @sqrt(double noundef %160) #5
  %162 = fmul double %161, 0x3F919D6D51A6B69A
  %163 = fmul double %140, 5.000000e-01
  %164 = call double @sin(double noundef %163) #5
  %165 = call double @cos(double noundef %63) #5
  %166 = fmul double %164, %165
  %167 = call double @sin(double noundef %63) #5
  %168 = fmul double %164, %167
  %169 = fadd double %46, %150
  %170 = call double @sin(double noundef %169) #5
  %171 = call double @cos(double noundef %169) #5
  %172 = fneg double %166
  %173 = fmul double %172, %170
  %174 = call double @llvm.fmuladd.f64(double %168, double %171, double %173)
  %175 = fmul double %174, 2.000000e+00
  %176 = call double @llvm.fmuladd.f64(double %125, double %35, double 1.000000e+00)
  %177 = call double @sqrt(double noundef %176) #5
  %178 = fdiv double %136, %177
  %179 = call double @cos(double noundef %163) #5
  %180 = call double @sin(double noundef %46) #5
  %181 = call double @llvm.fmuladd.f64(double %35, double %180, double %170)
  %182 = fmul double %178, %181
  %183 = call double @cos(double noundef %46) #5
  %184 = call double @llvm.fmuladd.f64(double %35, double %183, double %171)
  %185 = fmul double %178, %184
  %186 = fmul double %168, 2.000000e+00
  %187 = fmul double %166, %186
  %188 = fneg double %175
  %189 = call double @llvm.fmuladd.f64(double %188, double %168, double %171)
  %190 = fmul double %153, %189
  %191 = call double @llvm.fmuladd.f64(double %175, double %166, double %170)
  %192 = fmul double %153, %191
  %193 = fmul double %179, %188
  %194 = fmul double %153, %193
  store double %190, ptr %2, align 8
  %195 = fmul double %194, 0xBFD9752E50F4B399
  %196 = call double @llvm.fmuladd.f64(double %192, double 0x3FED5C0357681EF3, double %195)
  %197 = getelementptr inbounds [3 x double], ptr %2, i64 0, i64 1
  store double %196, ptr %197, align 8
  %198 = fmul double %194, 0x3FED5C0357681EF3
  %199 = call double @llvm.fmuladd.f64(double %192, double 0x3FD9752E50F4B399, double %198)
  %200 = getelementptr inbounds [3 x double], ptr %2, i64 0, i64 2
  store double %199, ptr %200, align 8
  %201 = call double @llvm.fmuladd.f64(double %186, double %168, double -1.000000e+00)
  %202 = fmul double %187, %185
  %203 = call double @llvm.fmuladd.f64(double %201, double %182, double %202)
  %204 = fmul double %162, %203
  %205 = fmul double %166, -2.000000e+00
  %206 = call double @llvm.fmuladd.f64(double %205, double %166, double 1.000000e+00)
  %207 = fneg double %187
  %208 = fmul double %207, %182
  %209 = call double @llvm.fmuladd.f64(double %206, double %185, double %208)
  %210 = fmul double %162, %209
  %211 = fmul double %179, 2.000000e+00
  %212 = fmul double %166, %185
  %213 = call double @llvm.fmuladd.f64(double %168, double %182, double %212)
  %214 = fmul double %211, %213
  %215 = fmul double %162, %214
  %216 = getelementptr inbounds [3 x double], ptr %2, i64 1
  store double %204, ptr %216, align 8
  %217 = fmul double %215, 0xBFD9752E50F4B399
  %218 = call double @llvm.fmuladd.f64(double %210, double 0x3FED5C0357681EF3, double %217)
  %219 = getelementptr inbounds [3 x double], ptr %2, i64 1, i64 1
  store double %218, ptr %219, align 8
  %220 = fmul double %215, 0x3FED5C0357681EF3
  %221 = call double @llvm.fmuladd.f64(double %210, double 0x3FD9752E50F4B399, double %220)
  %222 = getelementptr inbounds [3 x double], ptr %2, i64 1, i64 2
  store double %221, ptr %222, align 8
  ret void

planetpv_BB2_preheader:                           ; preds = %planetpv_BB1
  br label %planetpv_BB2

planetpv_BB5_preheader:                           ; preds = %planetpv_BB4
  br label %planetpv_BB5

planetpv_BB8_preheader:                           ; preds = %planetpv_BB7
  br label %planetpv_BB8
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nounwind
declare double @atan2(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @radecdist(ptr noundef %0, ptr noundef %1) #0 {
radecdist_BB1:
  %2 = load double, ptr %0, align 8
  %3 = getelementptr inbounds [3 x double], ptr %0, i64 0, i64 1
  %4 = load double, ptr %3, align 8
  %5 = fmul double %4, %4
  %6 = call double @llvm.fmuladd.f64(double %2, double %2, double %5)
  %7 = getelementptr inbounds [3 x double], ptr %0, i64 0, i64 2
  %8 = load double, ptr %7, align 8
  %9 = call double @llvm.fmuladd.f64(double %8, double %8, double %6)
  %10 = call double @sqrt(double noundef %9) #5
  %11 = getelementptr inbounds double, ptr %1, i64 2
  store double %10, ptr %11, align 8
  %12 = load double, ptr %3, align 8
  %13 = load double, ptr %0, align 8
  %14 = call double @atan2(double noundef %12, double noundef %13) #5
  %15 = fmul double %14, 0x400E8EC8A4AEACC4
  %16 = fcmp olt double %15, 0.000000e+00
  %17 = fadd double %15, 2.400000e+01
  %storemerge = select i1 %16, double %17, double %15
  store double %storemerge, ptr %1, align 8
  %18 = load double, ptr %7, align 8
  %19 = load double, ptr %11, align 8
  %20 = fdiv double %18, %19
  %21 = call double @asin(double noundef %20) #5
  %22 = fmul double %21, 0x404CA5DC1A63C1F8
  %23 = getelementptr inbounds double, ptr %1, i64 1
  store double %22, ptr %23, align 8
  ret void
}

; Function Attrs: nounwind
declare double @asin(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
main_BB1:
  %2 = alloca [2 x double], align 16
  %3 = alloca [2 x [3 x double]], align 16
  %4 = alloca [8 x [3 x double]], align 16
  %5 = icmp sgt i32 %0, 1
  br i1 %5, label %main_BB2_preheader, label %main_BB5

main_BB2:                                         ; preds = %main_BB2_preheader, %main_BB4
  %.02 = phi i32 [ %10, %main_BB4 ], [ 1, %main_BB2_preheader ]
  %6 = icmp slt i32 %.02, %0
  br i1 %6, label %main_BB3, label %main_BB5

main_BB3:                                         ; preds = %main_BB2
  %7 = getelementptr inbounds ptr, ptr %1, i64 1
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(4) @.str) #6
  %.not = icmp eq i32 %9, 0
  br i1 %.not, label %main_BB5, label %main_BB4

main_BB4:                                         ; preds = %main_BB3
  %10 = add nuw nsw i32 %.02, 1
  br label %main_BB2, !llvm.loop !9

main_BB5:                                         ; preds = %main_BB2, %main_BB3, %main_BB1
  br label %main_BB6_preheader

main_BB6:                                         ; preds = %main_BB6_preheader, %main_BB13
  %.13 = phi i32 [ 0, %main_BB6_preheader ], [ %21, %main_BB13 ]
  %11 = icmp ult i32 %.13, 20
  br i1 %11, label %main_BB7, label %main_BB14_preheader

main_BB7:                                         ; preds = %main_BB6
  store double 0x4142B42C80000000, ptr %2, align 16
  %12 = getelementptr inbounds [2 x double], ptr %2, i64 0, i64 1
  store double 0.000000e+00, ptr %12, align 8
  br label %main_BB8_preheader

main_BB8:                                         ; preds = %main_BB8_preheader, %main_BB12
  %.01 = phi i32 [ 0, %main_BB8_preheader ], [ %20, %main_BB12 ]
  %13 = icmp ult i32 %.01, 36525
  br i1 %13, label %main_BB9, label %main_BB13

main_BB9:                                         ; preds = %main_BB8
  %14 = load double, ptr %2, align 16
  %15 = fadd double %14, 1.000000e+00
  store double %15, ptr %2, align 16
  br label %main_BB10_preheader

main_BB10:                                        ; preds = %main_BB10_preheader, %main_BB11
  %.0 = phi i32 [ 0, %main_BB10_preheader ], [ %19, %main_BB11 ]
  %16 = icmp ult i32 %.0, 8
  br i1 %16, label %main_BB11, label %main_BB12

main_BB11:                                        ; preds = %main_BB10
  call void @planetpv(ptr noundef nonnull %2, i32 noundef %.0, ptr noundef nonnull %3)
  %17 = zext i32 %.0 to i64
  %18 = getelementptr inbounds [8 x [3 x double]], ptr %4, i64 0, i64 %17
  call void @radecdist(ptr noundef nonnull %3, ptr noundef nonnull %18)
  %19 = add nuw nsw i32 %.0, 1
  br label %main_BB10, !llvm.loop !10

main_BB12:                                        ; preds = %main_BB10
  %20 = add nuw nsw i32 %.01, 1
  br label %main_BB8, !llvm.loop !11

main_BB13:                                        ; preds = %main_BB8
  %21 = add nuw nsw i32 %.13, 1
  br label %main_BB6, !llvm.loop !12

main_BB14:                                        ; preds = %main_BB14_preheader, %main_BB15
  %.1 = phi i32 [ %31, %main_BB15 ], [ 0, %main_BB14_preheader ]
  %22 = icmp ult i32 %.1, 8
  br i1 %22, label %main_BB15, label %main_BB16

main_BB15:                                        ; preds = %main_BB14
  %23 = zext i32 %.1 to i64
  %24 = getelementptr inbounds [8 x [3 x double]], ptr %4, i64 0, i64 %23
  %25 = load double, ptr %24, align 8
  %26 = getelementptr inbounds [8 x [3 x double]], ptr %4, i64 0, i64 %23, i64 1
  %27 = load double, ptr %26, align 8
  %28 = getelementptr inbounds [8 x [3 x double]], ptr %4, i64 0, i64 %23, i64 2
  %29 = load double, ptr %28, align 8
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, double noundef %25, double noundef %27, double noundef %29) #5
  %31 = add nuw nsw i32 %.1, 1
  br label %main_BB14, !llvm.loop !13

main_BB16:                                        ; preds = %main_BB14
  %32 = load ptr, ptr @stdout, align 8
  %33 = call i32 @fflush(ptr noundef %32) #5
  ret i32 0

main_BB10_preheader:                              ; preds = %main_BB9
  br label %main_BB10

main_BB14_preheader:                              ; preds = %main_BB6
  br label %main_BB14

main_BB2_preheader:                               ; preds = %main_BB1
  br label %main_BB2

main_BB6_preheader:                               ; preds = %main_BB5
  br label %main_BB6

main_BB8_preheader:                               ; preds = %main_BB7
  br label %main_BB8
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

declare i32 @fflush(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
