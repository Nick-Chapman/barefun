(*stage2*)
let k () = ()
let u_11 = fix (fun [] eq_list_2_47'8 eq_1_47'16 k ->
  let lam_10_0'0 = fun [eq_1_47'16,eq_list_2_47'8] f_3 k ->
    let lam_9_0'0 = fun [eq_1_47'16,eq_list_2_47'8,f_3] f_4 k ->
      match f_3 with
      | Nil0 ->
        match f_4 with
        | Nil0 ->
          let con_1_49'33 = true1 in
          k con_1_49'33
        | Cons1(__5_49'40,__6_49'43) ->
          let con_2_49'48 = false0 in
          k con_2_49'48
      | Cons1(x_7_50'4,xs_8_50'7) ->
        match f_4 with
        | Nil0 ->
          let con_3_52'13 = false0 in
          k con_3_52'13
        | Cons1(y_9_53'7,ys_10_53'10) ->
          let k [eq_1_47'16,eq_list_2_47'8,xs_8_50'7,ys_10_53'10] app_4_54'16 =
            match app_4_54'16 with
            | true1 ->
              let k [ys_10_53'10] app_6_54'34 = app_6_54'34 ys_10_53'10 k in
              let k [xs_8_50'7] app_7_54'31 = app_7_54'31 xs_8_50'7 k in
              eq_list_2_47'8 eq_1_47'16 k
            | false0 ->
              let con_8_54'45 = false0 in
              k con_8_54'45 in
          let k [y_9_53'7] app_5_54'14 = app_5_54'14 y_9_53'7 k in
          eq_1_47'16 x_7_50'4 k in
    k lam_9_0'0 in
  k lam_10_0'0) in
let u_18 = fix (fun [] append_13_58'8 xs_12_58'15 k ->
  let lam_13_0'0 = fun [xs_12_58'15,append_13_58'8] f_14 k ->
    match xs_12_58'15 with
    | Nil0 -> k f_14
    | Cons1(x_15_61'4,xs_16_61'7) ->
      let k [x_15_61'4] u_17 =
        let con_12_0'0 = Cons1[x_15_61'4,u_17] in
        k con_12_0'0 in
      let k [f_14] app_11_61'28 = app_11_61'28 f_14 k in
      append_13_58'8 xs_16_61'7 k in
  k lam_13_0'0) in
let u_26 = fix (fun [] map_20_71'8 f_19_71'12 k ->
  let lam_20_0'0 = fun [f_19_71'12,map_20_71'8] f_21 k ->
    match f_21 with
    | Nil0 ->
      let con_14_73'10 = Nil0 in
      k con_14_73'10
    | Cons1(x_22_74'4,xs_23_74'7) ->
      let k [f_19_71'12,map_20_71'8,xs_23_74'7] uLET_15_0'0 =
        let k [uLET_15_0'0] app_18_74'26 = uLET_15_0'0 app_18_74'26 k in
        let k [xs_23_74'7] app_19_74'24 = app_19_74'24 xs_23_74'7 k in
        map_20_71'8 f_19_71'12 k in
      let k [] u_24 =
        let lam_17_0'0 = fun [u_24] f_25 k ->
          let con_16_0'0 = Cons1[u_24,f_25] in
          k con_16_0'0 in
        k lam_17_0'0 in
      f_19_71'12 x_22_74'4 k in
  k lam_20_0'0) in
let u_33 = fix (fun [] length_28_76'8 xs_27_76'15 k ->
  match xs_27_76'15 with
  | Nil0 ->
    let lit_21_78'10 = 0 in
    k lit_21_78'10
  | Cons1(__29_79'4,xs_30_79'7) ->
    let k [length_28_76'8,xs_30_79'7] uLET_22_0'0 =
      let k [uLET_22_0'0] app_25_79'27 = uLET_22_0'0 app_25_79'27 k in
      length_28_76'8 xs_30_79'7 k in
    let u_31 = 1 in
    let lam_24_0'0 = fun [u_31] f_32 k ->
      let prim_23_0'0 = PRIM_AddInt(u_31,f_32) in
      k prim_23_0'0 in
    k lam_24_0'0) in
let u_52 = fix (fun [] put_chars_35_90'8 xs_34_90'18 k ->
  match xs_34_90'18 with
  | Nil0 ->
    let con_26_92'10 = Unit0 in
    k con_26_92'10
  | Cons1(x_36_93'4,xs_37_93'7) ->
    let k [put_chars_35_90'8,xs_37_93'7] u_51 = put_chars_35_90'8 xs_37_93'7 k in
    let u_38 = 8 in
    let u_39 = PRIM_CharOrd(x_36_93'4) in
    let prim_27_0'0 = PRIM_EqInt(u_39,u_38) in
    match prim_27_0'0 with
    | true1 ->
      let prim_28_0'0 = PRIM_PutChar(x_36_93'4) in
      k prim_28_0'0
    | false0 ->
      let k [x_36_93'4,u_39] uLET_29_0'0 =
        match uLET_29_0'0 with
        | true1 ->
          let prim_31_0'0 = PRIM_PutChar(x_36_93'4) in
          k prim_31_0'0
        | false0 ->
          let k [x_36_93'4,u_39] uLET_32_0'0 =
            match uLET_32_0'0 with
            | true1 ->
              let prim_34_0'0 = PRIM_PutChar(x_36_93'4) in
              k prim_34_0'0
            | false0 ->
              let k [u_39] u_43 =
                let k [] u_50 =
                  let prim_45_0'0 = PRIM_PutChar(u_50) in
                  k prim_45_0'0 in
                let k [] u_49 =
                  let prim_44_0'0 = PRIM_CharChr(u_49) in
                  k prim_44_0'0 in
                let k [] uLET_36_0'0 =
                  let lit_43_18'52 = 1 in
                  uLET_36_0'0 lit_43_18'52 k in
                let k [] u_47 =
                  let lam_42_0'0 = fun [u_47] f_48 k ->
                    let prim_41_0'0 = PRIM_SubInt(u_47,f_48) in
                    k prim_41_0'0 in
                  k lam_42_0'0 in
                let k [u_39] uLET_37_0'0 = uLET_37_0'0 u_39 k in
                let k [] u_45 =
                  let lam_40_0'0 = fun [u_45] f_46 k ->
                    let prim_39_0'0 = PRIM_AddInt(u_45,f_46) in
                    k prim_39_0'0 in
                  k lam_40_0'0 in
                let u_44 = 'A' in
                let prim_38_0'0 = PRIM_CharOrd(u_44) in
                k prim_38_0'0 in
              let u_42 = '^' in
              let prim_35_0'0 = PRIM_PutChar(u_42) in
              k prim_35_0'0 in
          let u_41 = 26 in
          let prim_33_0'0 = PRIM_LessInt(u_41,u_39) in
          k prim_33_0'0 in
      let u_40 = '\n' in
      let prim_30_0'0 = PRIM_EqChar(x_36_93'4,u_40) in
      k prim_30_0'0) in
let u_60 = fix (fun [] fib_54_121'8 n_53_121'12 k ->
  let k [n_53_121'12,fib_54_121'8] uLET_46_0'0 =
    match uLET_46_0'0 with
    | true1 -> k n_53_121'12
    | false0 ->
      let k [n_53_121'12,fib_54_121'8] uLET_48_0'0 =
        let k [uLET_48_0'0] app_53_123'39 = uLET_48_0'0 app_53_123'39 k in
        let k [fib_54_121'8] uLET_54_0'0 = fib_54_121'8 uLET_54_0'0 k in
        let u_59 = 2 in
        let prim_55_0'0 = PRIM_SubInt(n_53_121'12,u_59) in
        k prim_55_0'0 in
      let k [] u_57 =
        let lam_52_0'0 = fun [u_57] f_58 k ->
          let prim_51_0'0 = PRIM_AddInt(u_57,f_58) in
          k prim_51_0'0 in
        k lam_52_0'0 in
      let k [fib_54_121'8] uLET_49_0'0 = fib_54_121'8 uLET_49_0'0 k in
      let u_56 = 1 in
      let prim_50_0'0 = PRIM_SubInt(n_53_121'12,u_56) in
      k prim_50_0'0 in
  let u_55 = 2 in
  let prim_47_0'0 = PRIM_LessInt(n_53_121'12,u_55) in
  k prim_47_0'0) in
let u_68 = fix (fun [] fact_62_125'8 n_61_125'13 k ->
  let k [n_61_125'13,fact_62_125'8] uLET_56_0'0 =
    match uLET_56_0'0 with
    | true1 ->
      let k [n_61_125'13] uLET_59_0'0 = uLET_59_0'0 n_61_125'13 k in
      let k [] u_66 =
        let lam_63_0'0 = fun [u_66] f_67 k ->
          let prim_62_0'0 = PRIM_MulInt(u_66,f_67) in
          k prim_62_0'0 in
        k lam_63_0'0 in
      let k [fact_62_125'8] uLET_60_0'0 = fact_62_125'8 uLET_60_0'0 k in
      let u_65 = 1 in
      let prim_61_0'0 = PRIM_SubInt(n_61_125'13,u_65) in
      k prim_61_0'0
    | false0 ->
      let lit_64_127'37 = 1 in
      k lit_64_127'37 in
  let u_63 = 2 in
  let u_64 = PRIM_LessInt(n_61_125'13,u_63) in
  match u_64 with
  | true1 ->
    let con_57_4'12 = false0 in
    k con_57_4'12
  | false0 ->
    let con_58_5'13 = true1 in
    k con_58_5'13) in
let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68] u_72 =
  let u_855 = fix (fun [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72] mainloop_74_213'8 __73_213'17 k ->
    let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8] u_75 =
      let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8] u_258 =
        let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] app_297_56'41 =
          match app_297_56'41 with
          | true1 ->
            let con_303_216'42 = Unit0 in
            k con_303_216'42
          | false0 ->
            let k [mainloop_74_213'8] u_854 =
              let con_1004_217'26 = Unit0 in
              mainloop_74_213'8 con_1004_217'26 k in
            let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,u_258] u_292 =
              match u_292 with
              | Nil0 ->
                let con_340_206'10 = Unit0 in
                k con_340_206'10
              | Cons1(command_293_207'4,args_294_207'13) ->
                let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,u_258,command_293_207'4,args_294_207'13] uLET_341_0'0 =
                  match uLET_341_0'0 with
                  | true1 ->
                    let k [u_52,u_60,args_294_207'13] u_300 =
                      match args_294_207'13 with
                      | Nil0 ->
                        let u_301 = "expected an argument" in
                        let k [u_52,u_301] u_303 =
                          let k [] u_304 =
                            let u_305 = Unit0 in
                            let u_306 = '\n' in
                            let u_307 = 8 in
                            let u_308 = PRIM_CharOrd(u_306) in
                            let prim_351_0'0 = PRIM_EqInt(u_308,u_307) in
                            match prim_351_0'0 with
                            | true1 ->
                              let prim_352_0'0 = PRIM_PutChar(u_306) in
                              k prim_352_0'0
                            | false0 ->
                              let k [u_306,u_308] uLET_353_0'0 =
                                match uLET_353_0'0 with
                                | true1 ->
                                  let prim_355_0'0 = PRIM_PutChar(u_306) in
                                  k prim_355_0'0
                                | false0 ->
                                  let k [u_306,u_308] uLET_356_0'0 =
                                    match uLET_356_0'0 with
                                    | true1 ->
                                      let prim_358_0'0 = PRIM_PutChar(u_306) in
                                      k prim_358_0'0
                                    | false0 ->
                                      let k [u_308] u_312 =
                                        let k [] u_319 =
                                          let prim_369_0'0 = PRIM_PutChar(u_319) in
                                          k prim_369_0'0 in
                                        let k [] u_318 =
                                          let prim_368_0'0 = PRIM_CharChr(u_318) in
                                          k prim_368_0'0 in
                                        let k [] uLET_360_0'0 =
                                          let lit_367_18'52 = 1 in
                                          uLET_360_0'0 lit_367_18'52 k in
                                        let k [] u_316 =
                                          let lam_366_0'0 = fun [u_316] f_317 k ->
                                            let prim_365_0'0 = PRIM_SubInt(u_316,f_317) in
                                            k prim_365_0'0 in
                                          k lam_366_0'0 in
                                        let k [u_308] uLET_361_0'0 = uLET_361_0'0 u_308 k in
                                        let k [] u_314 =
                                          let lam_364_0'0 = fun [u_314] f_315 k ->
                                            let prim_363_0'0 = PRIM_AddInt(u_314,f_315) in
                                            k prim_363_0'0 in
                                          k lam_364_0'0 in
                                        let u_313 = 'A' in
                                        let prim_362_0'0 = PRIM_CharOrd(u_313) in
                                        k prim_362_0'0 in
                                      let u_311 = '^' in
                                      let prim_359_0'0 = PRIM_PutChar(u_311) in
                                      k prim_359_0'0 in
                                  let u_310 = 26 in
                                  let prim_357_0'0 = PRIM_LessInt(u_310,u_308) in
                                  k prim_357_0'0 in
                              let u_309 = '\n' in
                              let prim_354_0'0 = PRIM_EqChar(u_306,u_309) in
                              k prim_354_0'0 in
                          let prim_350_0'0 = PRIM_Explode(u_301) in
                          u_52 prim_350_0'0 k in
                        let u_302 = "ERROR: " in
                        let prim_349_0'0 = PRIM_Explode(u_302) in
                        u_52 prim_349_0'0 k
                      | Cons1(arg1_320_135'4,more_321_135'10) ->
                        match more_321_135'10 with
                        | Cons1(__322_137'7,__323_137'10) ->
                          let u_324 = "expected exactly one argument" in
                          let k [u_52,u_324] u_326 =
                            let k [] u_327 =
                              let u_328 = Unit0 in
                              let u_329 = '\n' in
                              let u_330 = 8 in
                              let u_331 = PRIM_CharOrd(u_329) in
                              let prim_372_0'0 = PRIM_EqInt(u_331,u_330) in
                              match prim_372_0'0 with
                              | true1 ->
                                let prim_373_0'0 = PRIM_PutChar(u_329) in
                                k prim_373_0'0
                              | false0 ->
                                let k [u_329,u_331] uLET_374_0'0 =
                                  match uLET_374_0'0 with
                                  | true1 ->
                                    let prim_376_0'0 = PRIM_PutChar(u_329) in
                                    k prim_376_0'0
                                  | false0 ->
                                    let k [u_329,u_331] uLET_377_0'0 =
                                      match uLET_377_0'0 with
                                      | true1 ->
                                        let prim_379_0'0 = PRIM_PutChar(u_329) in
                                        k prim_379_0'0
                                      | false0 ->
                                        let k [u_331] u_335 =
                                          let k [] u_342 =
                                            let prim_390_0'0 = PRIM_PutChar(u_342) in
                                            k prim_390_0'0 in
                                          let k [] u_341 =
                                            let prim_389_0'0 = PRIM_CharChr(u_341) in
                                            k prim_389_0'0 in
                                          let k [] uLET_381_0'0 =
                                            let lit_388_18'52 = 1 in
                                            uLET_381_0'0 lit_388_18'52 k in
                                          let k [] u_339 =
                                            let lam_387_0'0 = fun [u_339] f_340 k ->
                                              let prim_386_0'0 = PRIM_SubInt(u_339,f_340) in
                                              k prim_386_0'0 in
                                            k lam_387_0'0 in
                                          let k [u_331] uLET_382_0'0 = uLET_382_0'0 u_331 k in
                                          let k [] u_337 =
                                            let lam_385_0'0 = fun [u_337] f_338 k ->
                                              let prim_384_0'0 = PRIM_AddInt(u_337,f_338) in
                                              k prim_384_0'0 in
                                            k lam_385_0'0 in
                                          let u_336 = 'A' in
                                          let prim_383_0'0 = PRIM_CharOrd(u_336) in
                                          k prim_383_0'0 in
                                        let u_334 = '^' in
                                        let prim_380_0'0 = PRIM_PutChar(u_334) in
                                        k prim_380_0'0 in
                                    let u_333 = 26 in
                                    let prim_378_0'0 = PRIM_LessInt(u_333,u_331) in
                                    k prim_378_0'0 in
                                let u_332 = '\n' in
                                let prim_375_0'0 = PRIM_EqChar(u_329,u_332) in
                                k prim_375_0'0 in
                            let prim_371_0'0 = PRIM_Explode(u_324) in
                            u_52 prim_371_0'0 k in
                          let u_325 = "ERROR: " in
                          let prim_370_0'0 = PRIM_Explode(u_325) in
                          u_52 prim_370_0'0 k
                        | Nil0 ->
                          let k [u_52,u_60] uLET_391_0'0 =
                            match uLET_391_0'0 with
                            | None1 ->
                              let u_362 = "expected arg1 to be numeric" in
                              let k [u_52,u_362] u_364 =
                                let k [] u_365 =
                                  let u_366 = Unit0 in
                                  let u_367 = '\n' in
                                  let u_368 = 8 in
                                  let u_369 = PRIM_CharOrd(u_367) in
                                  let prim_422_0'0 = PRIM_EqInt(u_369,u_368) in
                                  match prim_422_0'0 with
                                  | true1 ->
                                    let prim_423_0'0 = PRIM_PutChar(u_367) in
                                    k prim_423_0'0
                                  | false0 ->
                                    let k [u_367,u_369] uLET_424_0'0 =
                                      match uLET_424_0'0 with
                                      | true1 ->
                                        let prim_426_0'0 = PRIM_PutChar(u_367) in
                                        k prim_426_0'0
                                      | false0 ->
                                        let k [u_367,u_369] uLET_427_0'0 =
                                          match uLET_427_0'0 with
                                          | true1 ->
                                            let prim_429_0'0 = PRIM_PutChar(u_367) in
                                            k prim_429_0'0
                                          | false0 ->
                                            let k [u_369] u_373 =
                                              let k [] u_380 =
                                                let prim_440_0'0 = PRIM_PutChar(u_380) in
                                                k prim_440_0'0 in
                                              let k [] u_379 =
                                                let prim_439_0'0 = PRIM_CharChr(u_379) in
                                                k prim_439_0'0 in
                                              let k [] uLET_431_0'0 =
                                                let lit_438_18'52 = 1 in
                                                uLET_431_0'0 lit_438_18'52 k in
                                              let k [] u_377 =
                                                let lam_437_0'0 = fun [u_377] f_378 k ->
                                                  let prim_436_0'0 = PRIM_SubInt(u_377,f_378) in
                                                  k prim_436_0'0 in
                                                k lam_437_0'0 in
                                              let k [u_369] uLET_432_0'0 = uLET_432_0'0 u_369 k in
                                              let k [] u_375 =
                                                let lam_435_0'0 = fun [u_375] f_376 k ->
                                                  let prim_434_0'0 = PRIM_AddInt(u_375,f_376) in
                                                  k prim_434_0'0 in
                                                k lam_435_0'0 in
                                              let u_374 = 'A' in
                                              let prim_433_0'0 = PRIM_CharOrd(u_374) in
                                              k prim_433_0'0 in
                                            let u_372 = '^' in
                                            let prim_430_0'0 = PRIM_PutChar(u_372) in
                                            k prim_430_0'0 in
                                        let u_371 = 26 in
                                        let prim_428_0'0 = PRIM_LessInt(u_371,u_369) in
                                        k prim_428_0'0 in
                                    let u_370 = '\n' in
                                    let prim_425_0'0 = PRIM_EqChar(u_367,u_370) in
                                    k prim_425_0'0 in
                                let prim_421_0'0 = PRIM_Explode(u_362) in
                                u_52 prim_421_0'0 k in
                              let u_363 = "ERROR: " in
                              let prim_420_0'0 = PRIM_Explode(u_363) in
                              u_52 prim_420_0'0 k
                            | Some0(n_381_141'15) ->
                              let k [u_52,n_381_141'15] u_382 =
                                let k [u_52,u_382] u_399 =
                                  let k [u_52,u_382] u_401 =
                                    let k [] u_418 =
                                      let u_419 = Unit0 in
                                      let u_420 = '\n' in
                                      let u_421 = 8 in
                                      let u_422 = PRIM_CharOrd(u_420) in
                                      let prim_486_0'0 = PRIM_EqInt(u_422,u_421) in
                                      match prim_486_0'0 with
                                      | true1 ->
                                        let prim_487_0'0 = PRIM_PutChar(u_420) in
                                        k prim_487_0'0
                                      | false0 ->
                                        let k [u_420,u_422] uLET_488_0'0 =
                                          match uLET_488_0'0 with
                                          | true1 ->
                                            let prim_490_0'0 = PRIM_PutChar(u_420) in
                                            k prim_490_0'0
                                          | false0 ->
                                            let k [u_420,u_422] uLET_491_0'0 =
                                              match uLET_491_0'0 with
                                              | true1 ->
                                                let prim_493_0'0 = PRIM_PutChar(u_420) in
                                                k prim_493_0'0
                                              | false0 ->
                                                let k [u_422] u_426 =
                                                  let k [] u_433 =
                                                    let prim_504_0'0 = PRIM_PutChar(u_433) in
                                                    k prim_504_0'0 in
                                                  let k [] u_432 =
                                                    let prim_503_0'0 = PRIM_CharChr(u_432) in
                                                    k prim_503_0'0 in
                                                  let k [] uLET_495_0'0 =
                                                    let lit_502_18'52 = 1 in
                                                    uLET_495_0'0 lit_502_18'52 k in
                                                  let k [] u_430 =
                                                    let lam_501_0'0 = fun [u_430] f_431 k ->
                                                      let prim_500_0'0 = PRIM_SubInt(u_430,f_431) in
                                                      k prim_500_0'0 in
                                                    k lam_501_0'0 in
                                                  let k [u_422] uLET_496_0'0 = uLET_496_0'0 u_422 k in
                                                  let k [] u_428 =
                                                    let lam_499_0'0 = fun [u_428] f_429 k ->
                                                      let prim_498_0'0 = PRIM_AddInt(u_428,f_429) in
                                                      k prim_498_0'0 in
                                                    k lam_499_0'0 in
                                                  let u_427 = 'A' in
                                                  let prim_497_0'0 = PRIM_CharOrd(u_427) in
                                                  k prim_497_0'0 in
                                                let u_425 = '^' in
                                                let prim_494_0'0 = PRIM_PutChar(u_425) in
                                                k prim_494_0'0 in
                                            let u_424 = 26 in
                                            let prim_492_0'0 = PRIM_LessInt(u_424,u_422) in
                                            k prim_492_0'0 in
                                        let u_423 = '\n' in
                                        let prim_489_0'0 = PRIM_EqChar(u_420,u_423) in
                                        k prim_489_0'0 in
                                    let k [u_52] uLET_464_0'0 = u_52 uLET_464_0'0 k in
                                    let k [u_382] u_403 =
                                      let u_414 = fix (fun [u_403] loop_405_84'10 acc_404_84'15 k ->
                                        let lam_477_0'0 = fun [u_403,acc_404_84'15,loop_405_84'10] f_406 k ->
                                          let k [u_403,acc_404_84'15,loop_405_84'10,f_406] uLET_466_0'0 =
                                            match uLET_466_0'0 with
                                            | true1 -> k acc_404_84'15
                                            | false0 ->
                                              let k [f_406] app_468_86'11 =
                                                let k [app_468_86'11] uLET_475_0'0 = app_468_86'11 uLET_475_0'0 k in
                                                let u_413 = 10 in
                                                let prim_476_0'0 = PRIM_DivInt(f_406,u_413) in
                                                k prim_476_0'0 in
                                              let k [loop_405_84'10] app_469_86'40 = loop_405_84'10 app_469_86'40 k in
                                              let k [acc_404_84'15] uLET_470_0'0 = uLET_470_0'0 acc_404_84'15 k in
                                              let k [] u_411 =
                                                let lam_474_0'0 = fun [u_411] f_412 k ->
                                                  let con_473_0'0 = Cons1[u_411,f_412] in
                                                  k con_473_0'0 in
                                                k lam_474_0'0 in
                                              let k [u_403] u_409 =
                                                let u_410 = PRIM_AddInt(u_403,u_409) in
                                                let prim_472_0'0 = PRIM_CharChr(u_410) in
                                                k prim_472_0'0 in
                                              let u_408 = 10 in
                                              let prim_471_0'0 = PRIM_ModInt(f_406,u_408) in
                                              k prim_471_0'0 in
                                          let u_407 = 0 in
                                          let prim_467_0'0 = PRIM_EqInt(f_406,u_407) in
                                          k prim_467_0'0 in
                                        k lam_477_0'0) in
                                      let k [u_382,u_414] uLET_478_0'0 =
                                        match uLET_478_0'0 with
                                        | true1 ->
                                          let k [] uLET_480_0'0 =
                                            let con_483_88'25 = Nil0 in
                                            uLET_480_0'0 con_483_88'25 k in
                                          let u_416 = '0' in
                                          let lam_482_0'0 = fun [u_416] f_417 k ->
                                            let con_481_0'0 = Cons1[u_416,f_417] in
                                            k con_481_0'0 in
                                          k lam_482_0'0
                                        | false0 ->
                                          let k [u_382] app_484_88'38 = app_484_88'38 u_382 k in
                                          let con_485_88'38 = Nil0 in
                                          u_414 con_485_88'38 k in
                                      let u_415 = 0 in
                                      let prim_479_0'0 = PRIM_EqInt(u_382,u_415) in
                                      k prim_479_0'0 in
                                    let u_402 = '0' in
                                    let prim_465_0'0 = PRIM_CharOrd(u_402) in
                                    k prim_465_0'0 in
                                  let u_400 = " --> " in
                                  let prim_463_0'0 = PRIM_Explode(u_400) in
                                  u_52 prim_463_0'0 k in
                                let k [u_52] uLET_441_0'0 = u_52 uLET_441_0'0 k in
                                let k [n_381_141'15] u_384 =
                                  let u_395 = fix (fun [u_384] loop_386_84'10 acc_385_84'15 k ->
                                    let lam_454_0'0 = fun [u_384,acc_385_84'15,loop_386_84'10] f_387 k ->
                                      let k [u_384,acc_385_84'15,loop_386_84'10,f_387] uLET_443_0'0 =
                                        match uLET_443_0'0 with
                                        | true1 -> k acc_385_84'15
                                        | false0 ->
                                          let k [f_387] app_445_86'11 =
                                            let k [app_445_86'11] uLET_452_0'0 = app_445_86'11 uLET_452_0'0 k in
                                            let u_394 = 10 in
                                            let prim_453_0'0 = PRIM_DivInt(f_387,u_394) in
                                            k prim_453_0'0 in
                                          let k [loop_386_84'10] app_446_86'40 = loop_386_84'10 app_446_86'40 k in
                                          let k [acc_385_84'15] uLET_447_0'0 = uLET_447_0'0 acc_385_84'15 k in
                                          let k [] u_392 =
                                            let lam_451_0'0 = fun [u_392] f_393 k ->
                                              let con_450_0'0 = Cons1[u_392,f_393] in
                                              k con_450_0'0 in
                                            k lam_451_0'0 in
                                          let k [u_384] u_390 =
                                            let u_391 = PRIM_AddInt(u_384,u_390) in
                                            let prim_449_0'0 = PRIM_CharChr(u_391) in
                                            k prim_449_0'0 in
                                          let u_389 = 10 in
                                          let prim_448_0'0 = PRIM_ModInt(f_387,u_389) in
                                          k prim_448_0'0 in
                                      let u_388 = 0 in
                                      let prim_444_0'0 = PRIM_EqInt(f_387,u_388) in
                                      k prim_444_0'0 in
                                    k lam_454_0'0) in
                                  let k [n_381_141'15,u_395] uLET_455_0'0 =
                                    match uLET_455_0'0 with
                                    | true1 ->
                                      let k [] uLET_457_0'0 =
                                        let con_460_88'25 = Nil0 in
                                        uLET_457_0'0 con_460_88'25 k in
                                      let u_397 = '0' in
                                      let lam_459_0'0 = fun [u_397] f_398 k ->
                                        let con_458_0'0 = Cons1[u_397,f_398] in
                                        k con_458_0'0 in
                                      k lam_459_0'0
                                    | false0 ->
                                      let k [n_381_141'15] app_461_88'38 = app_461_88'38 n_381_141'15 k in
                                      let con_462_88'38 = Nil0 in
                                      u_395 con_462_88'38 k in
                                  let u_396 = 0 in
                                  let prim_456_0'0 = PRIM_EqInt(n_381_141'15,u_396) in
                                  k prim_456_0'0 in
                                let u_383 = '0' in
                                let prim_442_0'0 = PRIM_CharOrd(u_383) in
                                k prim_442_0'0 in
                              u_60 n_381_141'15 k in
                          let u_361 = fix (fun [] loop_344_35'10 acc_343_35'15 k ->
                            let lam_417_0'0 = fun [acc_343_35'15,loop_344_35'10] f_345 k ->
                              match f_345 with
                              | Nil0 ->
                                let con_392_37'12 = Some0[acc_343_35'15] in
                                k con_392_37'12
                              | Cons1(x_346_38'6,xs_347_38'9) ->
                                let k [acc_343_35'15,loop_344_35'10,xs_347_38'9] uLET_393_0'0 =
                                  match uLET_393_0'0 with
                                  | None1 ->
                                    let con_408_40'18 = None1 in
                                    k con_408_40'18
                                  | Some0(d_356_41'15) ->
                                    let k [xs_347_38'9] app_409_41'25 = app_409_41'25 xs_347_38'9 k in
                                    let k [loop_344_35'10] app_410_41'37 = loop_344_35'10 app_410_41'37 k in
                                    let k [d_356_41'15] uLET_411_0'0 = uLET_411_0'0 d_356_41'15 k in
                                    let k [] u_359 =
                                      let lam_416_0'0 = fun [u_359] f_360 k ->
                                        let prim_415_0'0 = PRIM_AddInt(u_359,f_360) in
                                        k prim_415_0'0 in
                                      k lam_416_0'0 in
                                    let k [acc_343_35'15] uLET_412_0'0 = uLET_412_0'0 acc_343_35'15 k in
                                    let u_357 = 10 in
                                    let lam_414_0'0 = fun [u_357] f_358 k ->
                                      let prim_413_0'0 = PRIM_MulInt(u_357,f_358) in
                                      k prim_413_0'0 in
                                    k lam_414_0'0 in
                                let k [] u_351 =
                                  let k [u_351] uLET_399_0'0 =
                                    match uLET_399_0'0 with
                                    | true1 ->
                                      let k [u_351] uLET_402_0'0 =
                                        match uLET_402_0'0 with
                                        | true1 ->
                                          let con_405_32'32 = Some0[u_351] in
                                          k con_405_32'32
                                        | false0 ->
                                          let con_406_32'45 = None1 in
                                          k con_406_32'45 in
                                      let u_354 = 9 in
                                      let u_355 = PRIM_LessInt(u_354,u_351) in
                                      match u_355 with
                                      | true1 ->
                                        let con_403_4'12 = false0 in
                                        k con_403_4'12
                                      | false0 ->
                                        let con_404_5'13 = true1 in
                                        k con_404_5'13
                                    | false0 ->
                                      let con_407_32'55 = None1 in
                                      k con_407_32'55 in
                                  let u_352 = 0 in
                                  let u_353 = PRIM_LessInt(u_351,u_352) in
                                  match u_353 with
                                  | true1 ->
                                    let con_400_4'12 = false0 in
                                    k con_400_4'12
                                  | false0 ->
                                    let con_401_5'13 = true1 in
                                    k con_401_5'13 in
                                let k [] uLET_394_0'0 =
                                  let k [uLET_394_0'0] uLET_397_0'0 = uLET_394_0'0 uLET_397_0'0 k in
                                  let u_350 = '0' in
                                  let prim_398_0'0 = PRIM_CharOrd(u_350) in
                                  k prim_398_0'0 in
                                let u_348 = PRIM_CharOrd(x_346_38'6) in
                                let lam_396_0'0 = fun [u_348] f_349 k ->
                                  let prim_395_0'0 = PRIM_SubInt(u_348,f_349) in
                                  k prim_395_0'0 in
                                k lam_396_0'0 in
                            k lam_417_0'0) in
                          let k [arg1_320_135'4] app_418_43'7 = app_418_43'7 arg1_320_135'4 k in
                          let lit_419_43'7 = 0 in
                          u_361 lit_419_43'7 k in
                    let u_299 = "fib: " in
                    let prim_348_0'0 = PRIM_Explode(u_299) in
                    u_52 prim_348_0'0 k
                  | false0 ->
                    let k [u_11,u_18,u_26,u_33,u_52,u_68,u_72,u_258,command_293_207'4,args_294_207'13] uLET_505_0'0 =
                      match uLET_505_0'0 with
                      | true1 ->
                        let k [u_52,u_68,args_294_207'13] u_439 =
                          match args_294_207'13 with
                          | Nil0 ->
                            let u_440 = "expected an argument" in
                            let k [u_52,u_440] u_442 =
                              let k [] u_443 =
                                let u_444 = Unit0 in
                                let u_445 = '\n' in
                                let u_446 = 8 in
                                let u_447 = PRIM_CharOrd(u_445) in
                                let prim_515_0'0 = PRIM_EqInt(u_447,u_446) in
                                match prim_515_0'0 with
                                | true1 ->
                                  let prim_516_0'0 = PRIM_PutChar(u_445) in
                                  k prim_516_0'0
                                | false0 ->
                                  let k [u_445,u_447] uLET_517_0'0 =
                                    match uLET_517_0'0 with
                                    | true1 ->
                                      let prim_519_0'0 = PRIM_PutChar(u_445) in
                                      k prim_519_0'0
                                    | false0 ->
                                      let k [u_445,u_447] uLET_520_0'0 =
                                        match uLET_520_0'0 with
                                        | true1 ->
                                          let prim_522_0'0 = PRIM_PutChar(u_445) in
                                          k prim_522_0'0
                                        | false0 ->
                                          let k [u_447] u_451 =
                                            let k [] u_458 =
                                              let prim_533_0'0 = PRIM_PutChar(u_458) in
                                              k prim_533_0'0 in
                                            let k [] u_457 =
                                              let prim_532_0'0 = PRIM_CharChr(u_457) in
                                              k prim_532_0'0 in
                                            let k [] uLET_524_0'0 =
                                              let lit_531_18'52 = 1 in
                                              uLET_524_0'0 lit_531_18'52 k in
                                            let k [] u_455 =
                                              let lam_530_0'0 = fun [u_455] f_456 k ->
                                                let prim_529_0'0 = PRIM_SubInt(u_455,f_456) in
                                                k prim_529_0'0 in
                                              k lam_530_0'0 in
                                            let k [u_447] uLET_525_0'0 = uLET_525_0'0 u_447 k in
                                            let k [] u_453 =
                                              let lam_528_0'0 = fun [u_453] f_454 k ->
                                                let prim_527_0'0 = PRIM_AddInt(u_453,f_454) in
                                                k prim_527_0'0 in
                                              k lam_528_0'0 in
                                            let u_452 = 'A' in
                                            let prim_526_0'0 = PRIM_CharOrd(u_452) in
                                            k prim_526_0'0 in
                                          let u_450 = '^' in
                                          let prim_523_0'0 = PRIM_PutChar(u_450) in
                                          k prim_523_0'0 in
                                      let u_449 = 26 in
                                      let prim_521_0'0 = PRIM_LessInt(u_449,u_447) in
                                      k prim_521_0'0 in
                                  let u_448 = '\n' in
                                  let prim_518_0'0 = PRIM_EqChar(u_445,u_448) in
                                  k prim_518_0'0 in
                              let prim_514_0'0 = PRIM_Explode(u_440) in
                              u_52 prim_514_0'0 k in
                            let u_441 = "ERROR: " in
                            let prim_513_0'0 = PRIM_Explode(u_441) in
                            u_52 prim_513_0'0 k
                          | Cons1(arg1_459_152'4,more_460_152'10) ->
                            match more_460_152'10 with
                            | Cons1(__461_154'7,__462_154'10) ->
                              let u_463 = "expected exactly one argument" in
                              let k [u_52,u_463] u_465 =
                                let k [] u_466 =
                                  let u_467 = Unit0 in
                                  let u_468 = '\n' in
                                  let u_469 = 8 in
                                  let u_470 = PRIM_CharOrd(u_468) in
                                  let prim_536_0'0 = PRIM_EqInt(u_470,u_469) in
                                  match prim_536_0'0 with
                                  | true1 ->
                                    let prim_537_0'0 = PRIM_PutChar(u_468) in
                                    k prim_537_0'0
                                  | false0 ->
                                    let k [u_468,u_470] uLET_538_0'0 =
                                      match uLET_538_0'0 with
                                      | true1 ->
                                        let prim_540_0'0 = PRIM_PutChar(u_468) in
                                        k prim_540_0'0
                                      | false0 ->
                                        let k [u_468,u_470] uLET_541_0'0 =
                                          match uLET_541_0'0 with
                                          | true1 ->
                                            let prim_543_0'0 = PRIM_PutChar(u_468) in
                                            k prim_543_0'0
                                          | false0 ->
                                            let k [u_470] u_474 =
                                              let k [] u_481 =
                                                let prim_554_0'0 = PRIM_PutChar(u_481) in
                                                k prim_554_0'0 in
                                              let k [] u_480 =
                                                let prim_553_0'0 = PRIM_CharChr(u_480) in
                                                k prim_553_0'0 in
                                              let k [] uLET_545_0'0 =
                                                let lit_552_18'52 = 1 in
                                                uLET_545_0'0 lit_552_18'52 k in
                                              let k [] u_478 =
                                                let lam_551_0'0 = fun [u_478] f_479 k ->
                                                  let prim_550_0'0 = PRIM_SubInt(u_478,f_479) in
                                                  k prim_550_0'0 in
                                                k lam_551_0'0 in
                                              let k [u_470] uLET_546_0'0 = uLET_546_0'0 u_470 k in
                                              let k [] u_476 =
                                                let lam_549_0'0 = fun [u_476] f_477 k ->
                                                  let prim_548_0'0 = PRIM_AddInt(u_476,f_477) in
                                                  k prim_548_0'0 in
                                                k lam_549_0'0 in
                                              let u_475 = 'A' in
                                              let prim_547_0'0 = PRIM_CharOrd(u_475) in
                                              k prim_547_0'0 in
                                            let u_473 = '^' in
                                            let prim_544_0'0 = PRIM_PutChar(u_473) in
                                            k prim_544_0'0 in
                                        let u_472 = 26 in
                                        let prim_542_0'0 = PRIM_LessInt(u_472,u_470) in
                                        k prim_542_0'0 in
                                    let u_471 = '\n' in
                                    let prim_539_0'0 = PRIM_EqChar(u_468,u_471) in
                                    k prim_539_0'0 in
                                let prim_535_0'0 = PRIM_Explode(u_463) in
                                u_52 prim_535_0'0 k in
                              let u_464 = "ERROR: " in
                              let prim_534_0'0 = PRIM_Explode(u_464) in
                              u_52 prim_534_0'0 k
                            | Nil0 ->
                              let k [u_52,u_68] uLET_555_0'0 =
                                match uLET_555_0'0 with
                                | None1 ->
                                  let u_501 = "expected arg1 to be numeric" in
                                  let k [u_52,u_501] u_503 =
                                    let k [] u_504 =
                                      let u_505 = Unit0 in
                                      let u_506 = '\n' in
                                      let u_507 = 8 in
                                      let u_508 = PRIM_CharOrd(u_506) in
                                      let prim_586_0'0 = PRIM_EqInt(u_508,u_507) in
                                      match prim_586_0'0 with
                                      | true1 ->
                                        let prim_587_0'0 = PRIM_PutChar(u_506) in
                                        k prim_587_0'0
                                      | false0 ->
                                        let k [u_506,u_508] uLET_588_0'0 =
                                          match uLET_588_0'0 with
                                          | true1 ->
                                            let prim_590_0'0 = PRIM_PutChar(u_506) in
                                            k prim_590_0'0
                                          | false0 ->
                                            let k [u_506,u_508] uLET_591_0'0 =
                                              match uLET_591_0'0 with
                                              | true1 ->
                                                let prim_593_0'0 = PRIM_PutChar(u_506) in
                                                k prim_593_0'0
                                              | false0 ->
                                                let k [u_508] u_512 =
                                                  let k [] u_519 =
                                                    let prim_604_0'0 = PRIM_PutChar(u_519) in
                                                    k prim_604_0'0 in
                                                  let k [] u_518 =
                                                    let prim_603_0'0 = PRIM_CharChr(u_518) in
                                                    k prim_603_0'0 in
                                                  let k [] uLET_595_0'0 =
                                                    let lit_602_18'52 = 1 in
                                                    uLET_595_0'0 lit_602_18'52 k in
                                                  let k [] u_516 =
                                                    let lam_601_0'0 = fun [u_516] f_517 k ->
                                                      let prim_600_0'0 = PRIM_SubInt(u_516,f_517) in
                                                      k prim_600_0'0 in
                                                    k lam_601_0'0 in
                                                  let k [u_508] uLET_596_0'0 = uLET_596_0'0 u_508 k in
                                                  let k [] u_514 =
                                                    let lam_599_0'0 = fun [u_514] f_515 k ->
                                                      let prim_598_0'0 = PRIM_AddInt(u_514,f_515) in
                                                      k prim_598_0'0 in
                                                    k lam_599_0'0 in
                                                  let u_513 = 'A' in
                                                  let prim_597_0'0 = PRIM_CharOrd(u_513) in
                                                  k prim_597_0'0 in
                                                let u_511 = '^' in
                                                let prim_594_0'0 = PRIM_PutChar(u_511) in
                                                k prim_594_0'0 in
                                            let u_510 = 26 in
                                            let prim_592_0'0 = PRIM_LessInt(u_510,u_508) in
                                            k prim_592_0'0 in
                                        let u_509 = '\n' in
                                        let prim_589_0'0 = PRIM_EqChar(u_506,u_509) in
                                        k prim_589_0'0 in
                                    let prim_585_0'0 = PRIM_Explode(u_501) in
                                    u_52 prim_585_0'0 k in
                                  let u_502 = "ERROR: " in
                                  let prim_584_0'0 = PRIM_Explode(u_502) in
                                  u_52 prim_584_0'0 k
                                | Some0(n_520_158'15) ->
                                  let k [u_52,n_520_158'15] u_521 =
                                    let k [u_52,u_521] u_538 =
                                      let k [u_52,u_521] u_540 =
                                        let k [] u_557 =
                                          let u_558 = Unit0 in
                                          let u_559 = '\n' in
                                          let u_560 = 8 in
                                          let u_561 = PRIM_CharOrd(u_559) in
                                          let prim_650_0'0 = PRIM_EqInt(u_561,u_560) in
                                          match prim_650_0'0 with
                                          | true1 ->
                                            let prim_651_0'0 = PRIM_PutChar(u_559) in
                                            k prim_651_0'0
                                          | false0 ->
                                            let k [u_559,u_561] uLET_652_0'0 =
                                              match uLET_652_0'0 with
                                              | true1 ->
                                                let prim_654_0'0 = PRIM_PutChar(u_559) in
                                                k prim_654_0'0
                                              | false0 ->
                                                let k [u_559,u_561] uLET_655_0'0 =
                                                  match uLET_655_0'0 with
                                                  | true1 ->
                                                    let prim_657_0'0 = PRIM_PutChar(u_559) in
                                                    k prim_657_0'0
                                                  | false0 ->
                                                    let k [u_561] u_565 =
                                                      let k [] u_572 =
                                                        let prim_668_0'0 = PRIM_PutChar(u_572) in
                                                        k prim_668_0'0 in
                                                      let k [] u_571 =
                                                        let prim_667_0'0 = PRIM_CharChr(u_571) in
                                                        k prim_667_0'0 in
                                                      let k [] uLET_659_0'0 =
                                                        let lit_666_18'52 = 1 in
                                                        uLET_659_0'0 lit_666_18'52 k in
                                                      let k [] u_569 =
                                                        let lam_665_0'0 = fun [u_569] f_570 k ->
                                                          let prim_664_0'0 = PRIM_SubInt(u_569,f_570) in
                                                          k prim_664_0'0 in
                                                        k lam_665_0'0 in
                                                      let k [u_561] uLET_660_0'0 = uLET_660_0'0 u_561 k in
                                                      let k [] u_567 =
                                                        let lam_663_0'0 = fun [u_567] f_568 k ->
                                                          let prim_662_0'0 = PRIM_AddInt(u_567,f_568) in
                                                          k prim_662_0'0 in
                                                        k lam_663_0'0 in
                                                      let u_566 = 'A' in
                                                      let prim_661_0'0 = PRIM_CharOrd(u_566) in
                                                      k prim_661_0'0 in
                                                    let u_564 = '^' in
                                                    let prim_658_0'0 = PRIM_PutChar(u_564) in
                                                    k prim_658_0'0 in
                                                let u_563 = 26 in
                                                let prim_656_0'0 = PRIM_LessInt(u_563,u_561) in
                                                k prim_656_0'0 in
                                            let u_562 = '\n' in
                                            let prim_653_0'0 = PRIM_EqChar(u_559,u_562) in
                                            k prim_653_0'0 in
                                        let k [u_52] uLET_628_0'0 = u_52 uLET_628_0'0 k in
                                        let k [u_521] u_542 =
                                          let u_553 = fix (fun [u_542] loop_544_84'10 acc_543_84'15 k ->
                                            let lam_641_0'0 = fun [u_542,acc_543_84'15,loop_544_84'10] f_545 k ->
                                              let k [u_542,acc_543_84'15,loop_544_84'10,f_545] uLET_630_0'0 =
                                                match uLET_630_0'0 with
                                                | true1 -> k acc_543_84'15
                                                | false0 ->
                                                  let k [f_545] app_632_86'11 =
                                                    let k [app_632_86'11] uLET_639_0'0 = app_632_86'11 uLET_639_0'0 k in
                                                    let u_552 = 10 in
                                                    let prim_640_0'0 = PRIM_DivInt(f_545,u_552) in
                                                    k prim_640_0'0 in
                                                  let k [loop_544_84'10] app_633_86'40 = loop_544_84'10 app_633_86'40 k in
                                                  let k [acc_543_84'15] uLET_634_0'0 = uLET_634_0'0 acc_543_84'15 k in
                                                  let k [] u_550 =
                                                    let lam_638_0'0 = fun [u_550] f_551 k ->
                                                      let con_637_0'0 = Cons1[u_550,f_551] in
                                                      k con_637_0'0 in
                                                    k lam_638_0'0 in
                                                  let k [u_542] u_548 =
                                                    let u_549 = PRIM_AddInt(u_542,u_548) in
                                                    let prim_636_0'0 = PRIM_CharChr(u_549) in
                                                    k prim_636_0'0 in
                                                  let u_547 = 10 in
                                                  let prim_635_0'0 = PRIM_ModInt(f_545,u_547) in
                                                  k prim_635_0'0 in
                                              let u_546 = 0 in
                                              let prim_631_0'0 = PRIM_EqInt(f_545,u_546) in
                                              k prim_631_0'0 in
                                            k lam_641_0'0) in
                                          let k [u_521,u_553] uLET_642_0'0 =
                                            match uLET_642_0'0 with
                                            | true1 ->
                                              let k [] uLET_644_0'0 =
                                                let con_647_88'25 = Nil0 in
                                                uLET_644_0'0 con_647_88'25 k in
                                              let u_555 = '0' in
                                              let lam_646_0'0 = fun [u_555] f_556 k ->
                                                let con_645_0'0 = Cons1[u_555,f_556] in
                                                k con_645_0'0 in
                                              k lam_646_0'0
                                            | false0 ->
                                              let k [u_521] app_648_88'38 = app_648_88'38 u_521 k in
                                              let con_649_88'38 = Nil0 in
                                              u_553 con_649_88'38 k in
                                          let u_554 = 0 in
                                          let prim_643_0'0 = PRIM_EqInt(u_521,u_554) in
                                          k prim_643_0'0 in
                                        let u_541 = '0' in
                                        let prim_629_0'0 = PRIM_CharOrd(u_541) in
                                        k prim_629_0'0 in
                                      let u_539 = " --> " in
                                      let prim_627_0'0 = PRIM_Explode(u_539) in
                                      u_52 prim_627_0'0 k in
                                    let k [u_52] uLET_605_0'0 = u_52 uLET_605_0'0 k in
                                    let k [n_520_158'15] u_523 =
                                      let u_534 = fix (fun [u_523] loop_525_84'10 acc_524_84'15 k ->
                                        let lam_618_0'0 = fun [u_523,acc_524_84'15,loop_525_84'10] f_526 k ->
                                          let k [u_523,acc_524_84'15,loop_525_84'10,f_526] uLET_607_0'0 =
                                            match uLET_607_0'0 with
                                            | true1 -> k acc_524_84'15
                                            | false0 ->
                                              let k [f_526] app_609_86'11 =
                                                let k [app_609_86'11] uLET_616_0'0 = app_609_86'11 uLET_616_0'0 k in
                                                let u_533 = 10 in
                                                let prim_617_0'0 = PRIM_DivInt(f_526,u_533) in
                                                k prim_617_0'0 in
                                              let k [loop_525_84'10] app_610_86'40 = loop_525_84'10 app_610_86'40 k in
                                              let k [acc_524_84'15] uLET_611_0'0 = uLET_611_0'0 acc_524_84'15 k in
                                              let k [] u_531 =
                                                let lam_615_0'0 = fun [u_531] f_532 k ->
                                                  let con_614_0'0 = Cons1[u_531,f_532] in
                                                  k con_614_0'0 in
                                                k lam_615_0'0 in
                                              let k [u_523] u_529 =
                                                let u_530 = PRIM_AddInt(u_523,u_529) in
                                                let prim_613_0'0 = PRIM_CharChr(u_530) in
                                                k prim_613_0'0 in
                                              let u_528 = 10 in
                                              let prim_612_0'0 = PRIM_ModInt(f_526,u_528) in
                                              k prim_612_0'0 in
                                          let u_527 = 0 in
                                          let prim_608_0'0 = PRIM_EqInt(f_526,u_527) in
                                          k prim_608_0'0 in
                                        k lam_618_0'0) in
                                      let k [n_520_158'15,u_534] uLET_619_0'0 =
                                        match uLET_619_0'0 with
                                        | true1 ->
                                          let k [] uLET_621_0'0 =
                                            let con_624_88'25 = Nil0 in
                                            uLET_621_0'0 con_624_88'25 k in
                                          let u_536 = '0' in
                                          let lam_623_0'0 = fun [u_536] f_537 k ->
                                            let con_622_0'0 = Cons1[u_536,f_537] in
                                            k con_622_0'0 in
                                          k lam_623_0'0
                                        | false0 ->
                                          let k [n_520_158'15] app_625_88'38 = app_625_88'38 n_520_158'15 k in
                                          let con_626_88'38 = Nil0 in
                                          u_534 con_626_88'38 k in
                                      let u_535 = 0 in
                                      let prim_620_0'0 = PRIM_EqInt(n_520_158'15,u_535) in
                                      k prim_620_0'0 in
                                    let u_522 = '0' in
                                    let prim_606_0'0 = PRIM_CharOrd(u_522) in
                                    k prim_606_0'0 in
                                  u_68 n_520_158'15 k in
                              let u_500 = fix (fun [] loop_483_35'10 acc_482_35'15 k ->
                                let lam_581_0'0 = fun [acc_482_35'15,loop_483_35'10] f_484 k ->
                                  match f_484 with
                                  | Nil0 ->
                                    let con_556_37'12 = Some0[acc_482_35'15] in
                                    k con_556_37'12
                                  | Cons1(x_485_38'6,xs_486_38'9) ->
                                    let k [acc_482_35'15,loop_483_35'10,xs_486_38'9] uLET_557_0'0 =
                                      match uLET_557_0'0 with
                                      | None1 ->
                                        let con_572_40'18 = None1 in
                                        k con_572_40'18
                                      | Some0(d_495_41'15) ->
                                        let k [xs_486_38'9] app_573_41'25 = app_573_41'25 xs_486_38'9 k in
                                        let k [loop_483_35'10] app_574_41'37 = loop_483_35'10 app_574_41'37 k in
                                        let k [d_495_41'15] uLET_575_0'0 = uLET_575_0'0 d_495_41'15 k in
                                        let k [] u_498 =
                                          let lam_580_0'0 = fun [u_498] f_499 k ->
                                            let prim_579_0'0 = PRIM_AddInt(u_498,f_499) in
                                            k prim_579_0'0 in
                                          k lam_580_0'0 in
                                        let k [acc_482_35'15] uLET_576_0'0 = uLET_576_0'0 acc_482_35'15 k in
                                        let u_496 = 10 in
                                        let lam_578_0'0 = fun [u_496] f_497 k ->
                                          let prim_577_0'0 = PRIM_MulInt(u_496,f_497) in
                                          k prim_577_0'0 in
                                        k lam_578_0'0 in
                                    let k [] u_490 =
                                      let k [u_490] uLET_563_0'0 =
                                        match uLET_563_0'0 with
                                        | true1 ->
                                          let k [u_490] uLET_566_0'0 =
                                            match uLET_566_0'0 with
                                            | true1 ->
                                              let con_569_32'32 = Some0[u_490] in
                                              k con_569_32'32
                                            | false0 ->
                                              let con_570_32'45 = None1 in
                                              k con_570_32'45 in
                                          let u_493 = 9 in
                                          let u_494 = PRIM_LessInt(u_493,u_490) in
                                          match u_494 with
                                          | true1 ->
                                            let con_567_4'12 = false0 in
                                            k con_567_4'12
                                          | false0 ->
                                            let con_568_5'13 = true1 in
                                            k con_568_5'13
                                        | false0 ->
                                          let con_571_32'55 = None1 in
                                          k con_571_32'55 in
                                      let u_491 = 0 in
                                      let u_492 = PRIM_LessInt(u_490,u_491) in
                                      match u_492 with
                                      | true1 ->
                                        let con_564_4'12 = false0 in
                                        k con_564_4'12
                                      | false0 ->
                                        let con_565_5'13 = true1 in
                                        k con_565_5'13 in
                                    let k [] uLET_558_0'0 =
                                      let k [uLET_558_0'0] uLET_561_0'0 = uLET_558_0'0 uLET_561_0'0 k in
                                      let u_489 = '0' in
                                      let prim_562_0'0 = PRIM_CharOrd(u_489) in
                                      k prim_562_0'0 in
                                    let u_487 = PRIM_CharOrd(x_485_38'6) in
                                    let lam_560_0'0 = fun [u_487] f_488 k ->
                                      let prim_559_0'0 = PRIM_SubInt(u_487,f_488) in
                                      k prim_559_0'0 in
                                    k lam_560_0'0 in
                                k lam_581_0'0) in
                              let k [arg1_459_152'4] app_582_43'7 = app_582_43'7 arg1_459_152'4 k in
                              let lit_583_43'7 = 0 in
                              u_500 lit_583_43'7 k in
                        let u_438 = "fact: " in
                        let prim_512_0'0 = PRIM_Explode(u_438) in
                        u_52 prim_512_0'0 k
                      | false0 ->
                        let k [u_11,u_18,u_26,u_33,u_52,u_72,u_258,args_294_207'13] uLET_669_0'0 =
                          match uLET_669_0'0 with
                          | true1 ->
                            match args_294_207'13 with
                            | Cons1(__577_178'4,__578_178'7) ->
                              let u_579 = "rev: expected no arguments" in
                              let k [u_52,u_579] u_581 =
                                let k [] u_582 =
                                  let u_583 = Unit0 in
                                  let u_584 = '\n' in
                                  let u_585 = 8 in
                                  let u_586 = PRIM_CharOrd(u_584) in
                                  let prim_678_0'0 = PRIM_EqInt(u_586,u_585) in
                                  match prim_678_0'0 with
                                  | true1 ->
                                    let prim_679_0'0 = PRIM_PutChar(u_584) in
                                    k prim_679_0'0
                                  | false0 ->
                                    let k [u_584,u_586] uLET_680_0'0 =
                                      match uLET_680_0'0 with
                                      | true1 ->
                                        let prim_682_0'0 = PRIM_PutChar(u_584) in
                                        k prim_682_0'0
                                      | false0 ->
                                        let k [u_584,u_586] uLET_683_0'0 =
                                          match uLET_683_0'0 with
                                          | true1 ->
                                            let prim_685_0'0 = PRIM_PutChar(u_584) in
                                            k prim_685_0'0
                                          | false0 ->
                                            let k [u_586] u_590 =
                                              let k [] u_597 =
                                                let prim_696_0'0 = PRIM_PutChar(u_597) in
                                                k prim_696_0'0 in
                                              let k [] u_596 =
                                                let prim_695_0'0 = PRIM_CharChr(u_596) in
                                                k prim_695_0'0 in
                                              let k [] uLET_687_0'0 =
                                                let lit_694_18'52 = 1 in
                                                uLET_687_0'0 lit_694_18'52 k in
                                              let k [] u_594 =
                                                let lam_693_0'0 = fun [u_594] f_595 k ->
                                                  let prim_692_0'0 = PRIM_SubInt(u_594,f_595) in
                                                  k prim_692_0'0 in
                                                k lam_693_0'0 in
                                              let k [u_586] uLET_688_0'0 = uLET_688_0'0 u_586 k in
                                              let k [] u_592 =
                                                let lam_691_0'0 = fun [u_592] f_593 k ->
                                                  let prim_690_0'0 = PRIM_AddInt(u_592,f_593) in
                                                  k prim_690_0'0 in
                                                k lam_691_0'0 in
                                              let u_591 = 'A' in
                                              let prim_689_0'0 = PRIM_CharOrd(u_591) in
                                              k prim_689_0'0 in
                                            let u_589 = '^' in
                                            let prim_686_0'0 = PRIM_PutChar(u_589) in
                                            k prim_686_0'0 in
                                        let u_588 = 26 in
                                        let prim_684_0'0 = PRIM_LessInt(u_588,u_586) in
                                        k prim_684_0'0 in
                                    let u_587 = '\n' in
                                    let prim_681_0'0 = PRIM_EqChar(u_584,u_587) in
                                    k prim_681_0'0 in
                                let prim_677_0'0 = PRIM_Explode(u_579) in
                                u_52 prim_677_0'0 k in
                              let u_580 = "ERROR: " in
                              let prim_676_0'0 = PRIM_Explode(u_580) in
                              u_52 prim_676_0'0 k
                            | Nil0 ->
                              let k [u_11,u_52,u_72] u_599 =
                                let u_600 = Unit0 in
                                let u_811 = fix (fun [u_11,u_52,u_72] loop_602_169'10 __601_169'14 k ->
                                  let k [u_11,u_52,u_72,loop_602_169'10] u_785 =
                                    let k [u_52,loop_602_169'10,u_785] app_918_56'41 =
                                      match app_918_56'41 with
                                      | true1 ->
                                        let con_924_171'44 = Unit0 in
                                        k con_924_171'44
                                      | false0 ->
                                        let k [loop_602_169'10] u_794 =
                                          let k [loop_602_169'10] u_810 =
                                            let con_950_172'46 = Unit0 in
                                            loop_602_169'10 con_950_172'46 k in
                                          let u_795 = Unit0 in
                                          let u_796 = '\n' in
                                          let u_797 = 8 in
                                          let u_798 = PRIM_CharOrd(u_796) in
                                          let prim_931_0'0 = PRIM_EqInt(u_798,u_797) in
                                          match prim_931_0'0 with
                                          | true1 ->
                                            let prim_932_0'0 = PRIM_PutChar(u_796) in
                                            k prim_932_0'0
                                          | false0 ->
                                            let k [u_796,u_798] uLET_933_0'0 =
                                              match uLET_933_0'0 with
                                              | true1 ->
                                                let prim_935_0'0 = PRIM_PutChar(u_796) in
                                                k prim_935_0'0
                                              | false0 ->
                                                let k [u_796,u_798] uLET_936_0'0 =
                                                  match uLET_936_0'0 with
                                                  | true1 ->
                                                    let prim_938_0'0 = PRIM_PutChar(u_796) in
                                                    k prim_938_0'0
                                                  | false0 ->
                                                    let k [u_798] u_802 =
                                                      let k [] u_809 =
                                                        let prim_949_0'0 = PRIM_PutChar(u_809) in
                                                        k prim_949_0'0 in
                                                      let k [] u_808 =
                                                        let prim_948_0'0 = PRIM_CharChr(u_808) in
                                                        k prim_948_0'0 in
                                                      let k [] uLET_940_0'0 =
                                                        let lit_947_18'52 = 1 in
                                                        uLET_940_0'0 lit_947_18'52 k in
                                                      let k [] u_806 =
                                                        let lam_946_0'0 = fun [u_806] f_807 k ->
                                                          let prim_945_0'0 = PRIM_SubInt(u_806,f_807) in
                                                          k prim_945_0'0 in
                                                        k lam_946_0'0 in
                                                      let k [u_798] uLET_941_0'0 = uLET_941_0'0 u_798 k in
                                                      let k [] u_804 =
                                                        let lam_944_0'0 = fun [u_804] f_805 k ->
                                                          let prim_943_0'0 = PRIM_AddInt(u_804,f_805) in
                                                          k prim_943_0'0 in
                                                        k lam_944_0'0 in
                                                      let u_803 = 'A' in
                                                      let prim_942_0'0 = PRIM_CharOrd(u_803) in
                                                      k prim_942_0'0 in
                                                    let u_801 = '^' in
                                                    let prim_939_0'0 = PRIM_PutChar(u_801) in
                                                    k prim_939_0'0 in
                                                let u_800 = 26 in
                                                let prim_937_0'0 = PRIM_LessInt(u_800,u_798) in
                                                k prim_937_0'0 in
                                            let u_799 = '\n' in
                                            let prim_934_0'0 = PRIM_EqChar(u_796,u_799) in
                                            k prim_934_0'0 in
                                        let k [u_52] uLET_925_0'0 = u_52 uLET_925_0'0 k in
                                        let u_793 = fix (fun [] loop_789_64'10 acc_788_64'15 k ->
                                          let lam_928_0'0 = fun [acc_788_64'15,loop_789_64'10] f_790 k ->
                                            match f_790 with
                                            | Nil0 -> k acc_788_64'15
                                            | Cons1(x_791_67'6,xs_792_67'9) ->
                                              let k [xs_792_67'9] app_926_67'20 = app_926_67'20 xs_792_67'9 k in
                                              let con_927_0'0 = Cons1[x_791_67'6,acc_788_64'15] in
                                              loop_789_64'10 con_927_0'0 k in
                                          k lam_928_0'0) in
                                        let k [u_785] app_929_69'7 = app_929_69'7 u_785 k in
                                        let con_930_69'7 = Nil0 in
                                        u_793 con_930_69'7 k in
                                    let k [u_72] app_919_56'39 = app_919_56'39 u_72 k in
                                    let k [u_785] app_920_56'31 = app_920_56'31 u_785 k in
                                    let lam_921_0'0 = fun [] f_786 k ->
                                      let lam_923_0'0 = fun [f_786] f_787 k ->
                                        let prim_922_0'0 = PRIM_EqChar(f_786,f_787) in
                                        k prim_922_0'0 in
                                      k lam_923_0'0 in
                                    u_11 lam_921_0'0 k in
                                  let u_603 = Unit0 in
                                  let k [] u_605 =
                                    let u_784 = fix (fun [u_605] loop_607_103'10 acc_606_103'15 k ->
                                      let k [u_605,acc_606_103'15,loop_607_103'10] u_609 =
                                        let u_610 = PRIM_CharOrd(u_609) in
                                        let k [u_605,acc_606_103'15,loop_607_103'10,u_609,u_610] uLET_700_0'0 =
                                          match uLET_700_0'0 with
                                          | true1 ->
                                            let k [acc_606_103'15] u_627 =
                                              let u_633 = fix (fun [] loop_629_64'10 acc_628_64'15 k ->
                                                let lam_723_0'0 = fun [acc_628_64'15,loop_629_64'10] f_630 k ->
                                                  match f_630 with
                                                  | Nil0 -> k acc_628_64'15
                                                  | Cons1(x_631_67'6,xs_632_67'9) ->
                                                    let k [xs_632_67'9] app_721_67'20 = app_721_67'20 xs_632_67'9 k in
                                                    let con_722_0'0 = Cons1[x_631_67'6,acc_628_64'15] in
                                                    loop_629_64'10 con_722_0'0 k in
                                                k lam_723_0'0) in
                                              let k [acc_606_103'15] app_724_69'7 = app_724_69'7 acc_606_103'15 k in
                                              let con_725_69'7 = Nil0 in
                                              u_633 con_725_69'7 k in
                                            let u_612 = Unit0 in
                                            let u_613 = '\n' in
                                            let u_614 = 8 in
                                            let u_615 = PRIM_CharOrd(u_613) in
                                            let prim_702_0'0 = PRIM_EqInt(u_615,u_614) in
                                            match prim_702_0'0 with
                                            | true1 ->
                                              let prim_703_0'0 = PRIM_PutChar(u_613) in
                                              k prim_703_0'0
                                            | false0 ->
                                              let k [u_613,u_615] uLET_704_0'0 =
                                                match uLET_704_0'0 with
                                                | true1 ->
                                                  let prim_706_0'0 = PRIM_PutChar(u_613) in
                                                  k prim_706_0'0
                                                | false0 ->
                                                  let k [u_613,u_615] uLET_707_0'0 =
                                                    match uLET_707_0'0 with
                                                    | true1 ->
                                                      let prim_709_0'0 = PRIM_PutChar(u_613) in
                                                      k prim_709_0'0
                                                    | false0 ->
                                                      let k [u_615] u_619 =
                                                        let k [] u_626 =
                                                          let prim_720_0'0 = PRIM_PutChar(u_626) in
                                                          k prim_720_0'0 in
                                                        let k [] u_625 =
                                                          let prim_719_0'0 = PRIM_CharChr(u_625) in
                                                          k prim_719_0'0 in
                                                        let k [] uLET_711_0'0 =
                                                          let lit_718_18'52 = 1 in
                                                          uLET_711_0'0 lit_718_18'52 k in
                                                        let k [] u_623 =
                                                          let lam_717_0'0 = fun [u_623] f_624 k ->
                                                            let prim_716_0'0 = PRIM_SubInt(u_623,f_624) in
                                                            k prim_716_0'0 in
                                                          k lam_717_0'0 in
                                                        let k [u_615] uLET_712_0'0 = uLET_712_0'0 u_615 k in
                                                        let k [] u_621 =
                                                          let lam_715_0'0 = fun [u_621] f_622 k ->
                                                            let prim_714_0'0 = PRIM_AddInt(u_621,f_622) in
                                                            k prim_714_0'0 in
                                                          k lam_715_0'0 in
                                                        let u_620 = 'A' in
                                                        let prim_713_0'0 = PRIM_CharOrd(u_620) in
                                                        k prim_713_0'0 in
                                                      let u_618 = '^' in
                                                      let prim_710_0'0 = PRIM_PutChar(u_618) in
                                                      k prim_710_0'0 in
                                                  let u_617 = 26 in
                                                  let prim_708_0'0 = PRIM_LessInt(u_617,u_615) in
                                                  k prim_708_0'0 in
                                              let u_616 = '\n' in
                                              let prim_705_0'0 = PRIM_EqChar(u_613,u_616) in
                                              k prim_705_0'0
                                          | false0 ->
                                            let prim_726_0'0 = PRIM_EqChar(u_609,u_605) in
                                            match prim_726_0'0 with
                                            | true1 ->
                                              let k [u_605,acc_606_103'15] u_647 =
                                                let k [u_605,acc_606_103'15] u_663 =
                                                  let u_664 = Cons1[u_605,acc_606_103'15] in
                                                  let u_670 = fix (fun [] loop_666_64'10 acc_665_64'15 k ->
                                                    let lam_767_0'0 = fun [acc_665_64'15,loop_666_64'10] f_667 k ->
                                                      match f_667 with
                                                      | Nil0 -> k acc_665_64'15
                                                      | Cons1(x_668_67'6,xs_669_67'9) ->
                                                        let k [xs_669_67'9] app_765_67'20 = app_765_67'20 xs_669_67'9 k in
                                                        let con_766_0'0 = Cons1[x_668_67'6,acc_665_64'15] in
                                                        loop_666_64'10 con_766_0'0 k in
                                                    k lam_767_0'0) in
                                                  let k [u_664] app_768_69'7 = app_768_69'7 u_664 k in
                                                  let con_769_69'7 = Nil0 in
                                                  u_670 con_769_69'7 k in
                                                let u_648 = Unit0 in
                                                let u_649 = '\n' in
                                                let u_650 = 8 in
                                                let u_651 = PRIM_CharOrd(u_649) in
                                                let prim_746_0'0 = PRIM_EqInt(u_651,u_650) in
                                                match prim_746_0'0 with
                                                | true1 ->
                                                  let prim_747_0'0 = PRIM_PutChar(u_649) in
                                                  k prim_747_0'0
                                                | false0 ->
                                                  let k [u_649,u_651] uLET_748_0'0 =
                                                    match uLET_748_0'0 with
                                                    | true1 ->
                                                      let prim_750_0'0 = PRIM_PutChar(u_649) in
                                                      k prim_750_0'0
                                                    | false0 ->
                                                      let k [u_649,u_651] uLET_751_0'0 =
                                                        match uLET_751_0'0 with
                                                        | true1 ->
                                                          let prim_753_0'0 = PRIM_PutChar(u_649) in
                                                          k prim_753_0'0
                                                        | false0 ->
                                                          let k [u_651] u_655 =
                                                            let k [] u_662 =
                                                              let prim_764_0'0 = PRIM_PutChar(u_662) in
                                                              k prim_764_0'0 in
                                                            let k [] u_661 =
                                                              let prim_763_0'0 = PRIM_CharChr(u_661) in
                                                              k prim_763_0'0 in
                                                            let k [] uLET_755_0'0 =
                                                              let lit_762_18'52 = 1 in
                                                              uLET_755_0'0 lit_762_18'52 k in
                                                            let k [] u_659 =
                                                              let lam_761_0'0 = fun [u_659] f_660 k ->
                                                                let prim_760_0'0 = PRIM_SubInt(u_659,f_660) in
                                                                k prim_760_0'0 in
                                                              k lam_761_0'0 in
                                                            let k [u_651] uLET_756_0'0 = uLET_756_0'0 u_651 k in
                                                            let k [] u_657 =
                                                              let lam_759_0'0 = fun [u_657] f_658 k ->
                                                                let prim_758_0'0 = PRIM_AddInt(u_657,f_658) in
                                                                k prim_758_0'0 in
                                                              k lam_759_0'0 in
                                                            let u_656 = 'A' in
                                                            let prim_757_0'0 = PRIM_CharOrd(u_656) in
                                                            k prim_757_0'0 in
                                                          let u_654 = '^' in
                                                          let prim_754_0'0 = PRIM_PutChar(u_654) in
                                                          k prim_754_0'0 in
                                                      let u_653 = 26 in
                                                      let prim_752_0'0 = PRIM_LessInt(u_653,u_651) in
                                                      k prim_752_0'0 in
                                                  let u_652 = '\n' in
                                                  let prim_749_0'0 = PRIM_EqChar(u_649,u_652) in
                                                  k prim_749_0'0 in
                                              let u_634 = 8 in
                                              let u_635 = PRIM_CharOrd(u_609) in
                                              let prim_727_0'0 = PRIM_EqInt(u_635,u_634) in
                                              match prim_727_0'0 with
                                              | true1 ->
                                                let prim_728_0'0 = PRIM_PutChar(u_609) in
                                                k prim_728_0'0
                                              | false0 ->
                                                let k [u_609,u_635] uLET_729_0'0 =
                                                  match uLET_729_0'0 with
                                                  | true1 ->
                                                    let prim_731_0'0 = PRIM_PutChar(u_609) in
                                                    k prim_731_0'0
                                                  | false0 ->
                                                    let k [u_609,u_635] uLET_732_0'0 =
                                                      match uLET_732_0'0 with
                                                      | true1 ->
                                                        let prim_734_0'0 = PRIM_PutChar(u_609) in
                                                        k prim_734_0'0
                                                      | false0 ->
                                                        let k [u_635] u_639 =
                                                          let k [] u_646 =
                                                            let prim_745_0'0 = PRIM_PutChar(u_646) in
                                                            k prim_745_0'0 in
                                                          let k [] u_645 =
                                                            let prim_744_0'0 = PRIM_CharChr(u_645) in
                                                            k prim_744_0'0 in
                                                          let k [] uLET_736_0'0 =
                                                            let lit_743_18'52 = 1 in
                                                            uLET_736_0'0 lit_743_18'52 k in
                                                          let k [] u_643 =
                                                            let lam_742_0'0 = fun [u_643] f_644 k ->
                                                              let prim_741_0'0 = PRIM_SubInt(u_643,f_644) in
                                                              k prim_741_0'0 in
                                                            k lam_742_0'0 in
                                                          let k [u_635] uLET_737_0'0 = uLET_737_0'0 u_635 k in
                                                          let k [] u_641 =
                                                            let lam_740_0'0 = fun [u_641] f_642 k ->
                                                              let prim_739_0'0 = PRIM_AddInt(u_641,f_642) in
                                                              k prim_739_0'0 in
                                                            k lam_740_0'0 in
                                                          let u_640 = 'A' in
                                                          let prim_738_0'0 = PRIM_CharOrd(u_640) in
                                                          k prim_738_0'0 in
                                                        let u_638 = '^' in
                                                        let prim_735_0'0 = PRIM_PutChar(u_638) in
                                                        k prim_735_0'0 in
                                                    let u_637 = 26 in
                                                    let prim_733_0'0 = PRIM_LessInt(u_637,u_635) in
                                                    k prim_733_0'0 in
                                                let u_636 = '\n' in
                                                let prim_730_0'0 = PRIM_EqChar(u_609,u_636) in
                                                k prim_730_0'0
                                            | false0 ->
                                              let k [acc_606_103'15,loop_607_103'10,u_609,u_610] uLET_770_0'0 =
                                                match uLET_770_0'0 with
                                                | true1 -> loop_607_103'10 acc_606_103'15 k
                                                | false0 ->
                                                  let k [acc_606_103'15,loop_607_103'10,u_609] uLET_772_0'0 =
                                                    match uLET_772_0'0 with
                                                    | true1 ->
                                                      match acc_606_103'15 with
                                                      | Nil0 -> loop_607_103'10 acc_606_103'15 k
                                                      | Cons1(c_673_112'14,tail_674_112'17) ->
                                                        let k [loop_607_103'10,tail_674_112'17] u_723 =
                                                          let k [loop_607_103'10,tail_674_112'17] u_769 = loop_607_103'10 tail_674_112'17 k in
                                                          let u_724 = Unit0 in
                                                          let k [] u_726 =
                                                            let k [u_726] u_740 =
                                                              let k [u_726] u_755 =
                                                                let u_756 = 8 in
                                                                let u_757 = PRIM_CharOrd(u_726) in
                                                                let prim_878_0'0 = PRIM_EqInt(u_757,u_756) in
                                                                match prim_878_0'0 with
                                                                | true1 ->
                                                                  let prim_879_0'0 = PRIM_PutChar(u_726) in
                                                                  k prim_879_0'0
                                                                | false0 ->
                                                                  let k [u_726,u_757] uLET_880_0'0 =
                                                                    match uLET_880_0'0 with
                                                                    | true1 ->
                                                                      let prim_882_0'0 = PRIM_PutChar(u_726) in
                                                                      k prim_882_0'0
                                                                    | false0 ->
                                                                      let k [u_726,u_757] uLET_883_0'0 =
                                                                        match uLET_883_0'0 with
                                                                        | true1 ->
                                                                          let prim_885_0'0 = PRIM_PutChar(u_726) in
                                                                          k prim_885_0'0
                                                                        | false0 ->
                                                                          let k [u_757] u_761 =
                                                                            let k [] u_768 =
                                                                              let prim_896_0'0 = PRIM_PutChar(u_768) in
                                                                              k prim_896_0'0 in
                                                                            let k [] u_767 =
                                                                              let prim_895_0'0 = PRIM_CharChr(u_767) in
                                                                              k prim_895_0'0 in
                                                                            let k [] uLET_887_0'0 =
                                                                              let lit_894_18'52 = 1 in
                                                                              uLET_887_0'0 lit_894_18'52 k in
                                                                            let k [] u_765 =
                                                                              let lam_893_0'0 = fun [u_765] f_766 k ->
                                                                                let prim_892_0'0 = PRIM_SubInt(u_765,f_766) in
                                                                                k prim_892_0'0 in
                                                                              k lam_893_0'0 in
                                                                            let k [u_757] uLET_888_0'0 = uLET_888_0'0 u_757 k in
                                                                            let k [] u_763 =
                                                                              let lam_891_0'0 = fun [u_763] f_764 k ->
                                                                                let prim_890_0'0 = PRIM_AddInt(u_763,f_764) in
                                                                                k prim_890_0'0 in
                                                                              k lam_891_0'0 in
                                                                            let u_762 = 'A' in
                                                                            let prim_889_0'0 = PRIM_CharOrd(u_762) in
                                                                            k prim_889_0'0 in
                                                                          let u_760 = '^' in
                                                                          let prim_886_0'0 = PRIM_PutChar(u_760) in
                                                                          k prim_886_0'0 in
                                                                      let u_759 = 26 in
                                                                      let prim_884_0'0 = PRIM_LessInt(u_759,u_757) in
                                                                      k prim_884_0'0 in
                                                                  let u_758 = '\n' in
                                                                  let prim_881_0'0 = PRIM_EqChar(u_726,u_758) in
                                                                  k prim_881_0'0 in
                                                              let u_741 = ' ' in
                                                              let u_742 = 8 in
                                                              let u_743 = PRIM_CharOrd(u_741) in
                                                              let prim_859_0'0 = PRIM_EqInt(u_743,u_742) in
                                                              match prim_859_0'0 with
                                                              | true1 ->
                                                                let prim_860_0'0 = PRIM_PutChar(u_741) in
                                                                k prim_860_0'0
                                                              | false0 ->
                                                                let k [u_741,u_743] uLET_861_0'0 =
                                                                  match uLET_861_0'0 with
                                                                  | true1 ->
                                                                    let prim_863_0'0 = PRIM_PutChar(u_741) in
                                                                    k prim_863_0'0
                                                                  | false0 ->
                                                                    let k [u_741,u_743] uLET_864_0'0 =
                                                                      match uLET_864_0'0 with
                                                                      | true1 ->
                                                                        let prim_866_0'0 = PRIM_PutChar(u_741) in
                                                                        k prim_866_0'0
                                                                      | false0 ->
                                                                        let k [u_743] u_747 =
                                                                          let k [] u_754 =
                                                                            let prim_877_0'0 = PRIM_PutChar(u_754) in
                                                                            k prim_877_0'0 in
                                                                          let k [] u_753 =
                                                                            let prim_876_0'0 = PRIM_CharChr(u_753) in
                                                                            k prim_876_0'0 in
                                                                          let k [] uLET_868_0'0 =
                                                                            let lit_875_18'52 = 1 in
                                                                            uLET_868_0'0 lit_875_18'52 k in
                                                                          let k [] u_751 =
                                                                            let lam_874_0'0 = fun [u_751] f_752 k ->
                                                                              let prim_873_0'0 = PRIM_SubInt(u_751,f_752) in
                                                                              k prim_873_0'0 in
                                                                            k lam_874_0'0 in
                                                                          let k [u_743] uLET_869_0'0 = uLET_869_0'0 u_743 k in
                                                                          let k [] u_749 =
                                                                            let lam_872_0'0 = fun [u_749] f_750 k ->
                                                                              let prim_871_0'0 = PRIM_AddInt(u_749,f_750) in
                                                                              k prim_871_0'0 in
                                                                            k lam_872_0'0 in
                                                                          let u_748 = 'A' in
                                                                          let prim_870_0'0 = PRIM_CharOrd(u_748) in
                                                                          k prim_870_0'0 in
                                                                        let u_746 = '^' in
                                                                        let prim_867_0'0 = PRIM_PutChar(u_746) in
                                                                        k prim_867_0'0 in
                                                                    let u_745 = 26 in
                                                                    let prim_865_0'0 = PRIM_LessInt(u_745,u_743) in
                                                                    k prim_865_0'0 in
                                                                let u_744 = '\n' in
                                                                let prim_862_0'0 = PRIM_EqChar(u_741,u_744) in
                                                                k prim_862_0'0 in
                                                            let u_727 = 8 in
                                                            let u_728 = PRIM_CharOrd(u_726) in
                                                            let prim_840_0'0 = PRIM_EqInt(u_728,u_727) in
                                                            match prim_840_0'0 with
                                                            | true1 ->
                                                              let prim_841_0'0 = PRIM_PutChar(u_726) in
                                                              k prim_841_0'0
                                                            | false0 ->
                                                              let k [u_726,u_728] uLET_842_0'0 =
                                                                match uLET_842_0'0 with
                                                                | true1 ->
                                                                  let prim_844_0'0 = PRIM_PutChar(u_726) in
                                                                  k prim_844_0'0
                                                                | false0 ->
                                                                  let k [u_726,u_728] uLET_845_0'0 =
                                                                    match uLET_845_0'0 with
                                                                    | true1 ->
                                                                      let prim_847_0'0 = PRIM_PutChar(u_726) in
                                                                      k prim_847_0'0
                                                                    | false0 ->
                                                                      let k [u_728] u_732 =
                                                                        let k [] u_739 =
                                                                          let prim_858_0'0 = PRIM_PutChar(u_739) in
                                                                          k prim_858_0'0 in
                                                                        let k [] u_738 =
                                                                          let prim_857_0'0 = PRIM_CharChr(u_738) in
                                                                          k prim_857_0'0 in
                                                                        let k [] uLET_849_0'0 =
                                                                          let lit_856_18'52 = 1 in
                                                                          uLET_849_0'0 lit_856_18'52 k in
                                                                        let k [] u_736 =
                                                                          let lam_855_0'0 = fun [u_736] f_737 k ->
                                                                            let prim_854_0'0 = PRIM_SubInt(u_736,f_737) in
                                                                            k prim_854_0'0 in
                                                                          k lam_855_0'0 in
                                                                        let k [u_728] uLET_850_0'0 = uLET_850_0'0 u_728 k in
                                                                        let k [] u_734 =
                                                                          let lam_853_0'0 = fun [u_734] f_735 k ->
                                                                            let prim_852_0'0 = PRIM_AddInt(u_734,f_735) in
                                                                            k prim_852_0'0 in
                                                                          k lam_853_0'0 in
                                                                        let u_733 = 'A' in
                                                                        let prim_851_0'0 = PRIM_CharOrd(u_733) in
                                                                        k prim_851_0'0 in
                                                                      let u_731 = '^' in
                                                                      let prim_848_0'0 = PRIM_PutChar(u_731) in
                                                                      k prim_848_0'0 in
                                                                  let u_730 = 26 in
                                                                  let prim_846_0'0 = PRIM_LessInt(u_730,u_728) in
                                                                  k prim_846_0'0 in
                                                              let u_729 = '\n' in
                                                              let prim_843_0'0 = PRIM_EqChar(u_726,u_729) in
                                                              k prim_843_0'0 in
                                                          let u_725 = 8 in
                                                          let prim_839_0'0 = PRIM_CharChr(u_725) in
                                                          k prim_839_0'0 in
                                                        let k [] app_774_113'28 =
                                                          match app_774_113'28 with
                                                          | true1 ->
                                                            let u_678 = Unit0 in
                                                            let k [] u_680 =
                                                              let k [u_680] u_694 =
                                                                let k [u_680] u_709 =
                                                                  let u_710 = 8 in
                                                                  let u_711 = PRIM_CharOrd(u_680) in
                                                                  let prim_819_0'0 = PRIM_EqInt(u_711,u_710) in
                                                                  match prim_819_0'0 with
                                                                  | true1 ->
                                                                    let prim_820_0'0 = PRIM_PutChar(u_680) in
                                                                    k prim_820_0'0
                                                                  | false0 ->
                                                                    let k [u_680,u_711] uLET_821_0'0 =
                                                                      match uLET_821_0'0 with
                                                                      | true1 ->
                                                                        let prim_823_0'0 = PRIM_PutChar(u_680) in
                                                                        k prim_823_0'0
                                                                      | false0 ->
                                                                        let k [u_680,u_711] uLET_824_0'0 =
                                                                          match uLET_824_0'0 with
                                                                          | true1 ->
                                                                            let prim_826_0'0 = PRIM_PutChar(u_680) in
                                                                            k prim_826_0'0
                                                                          | false0 ->
                                                                            let k [u_711] u_715 =
                                                                              let k [] u_722 =
                                                                                let prim_837_0'0 = PRIM_PutChar(u_722) in
                                                                                k prim_837_0'0 in
                                                                              let k [] u_721 =
                                                                                let prim_836_0'0 = PRIM_CharChr(u_721) in
                                                                                k prim_836_0'0 in
                                                                              let k [] uLET_828_0'0 =
                                                                                let lit_835_18'52 = 1 in
                                                                                uLET_828_0'0 lit_835_18'52 k in
                                                                              let k [] u_719 =
                                                                                let lam_834_0'0 = fun [u_719] f_720 k ->
                                                                                  let prim_833_0'0 = PRIM_SubInt(u_719,f_720) in
                                                                                  k prim_833_0'0 in
                                                                                k lam_834_0'0 in
                                                                              let k [u_711] uLET_829_0'0 = uLET_829_0'0 u_711 k in
                                                                              let k [] u_717 =
                                                                                let lam_832_0'0 = fun [u_717] f_718 k ->
                                                                                  let prim_831_0'0 = PRIM_AddInt(u_717,f_718) in
                                                                                  k prim_831_0'0 in
                                                                                k lam_832_0'0 in
                                                                              let u_716 = 'A' in
                                                                              let prim_830_0'0 = PRIM_CharOrd(u_716) in
                                                                              k prim_830_0'0 in
                                                                            let u_714 = '^' in
                                                                            let prim_827_0'0 = PRIM_PutChar(u_714) in
                                                                            k prim_827_0'0 in
                                                                        let u_713 = 26 in
                                                                        let prim_825_0'0 = PRIM_LessInt(u_713,u_711) in
                                                                        k prim_825_0'0 in
                                                                    let u_712 = '\n' in
                                                                    let prim_822_0'0 = PRIM_EqChar(u_680,u_712) in
                                                                    k prim_822_0'0 in
                                                                let u_695 = ' ' in
                                                                let u_696 = 8 in
                                                                let u_697 = PRIM_CharOrd(u_695) in
                                                                let prim_800_0'0 = PRIM_EqInt(u_697,u_696) in
                                                                match prim_800_0'0 with
                                                                | true1 ->
                                                                  let prim_801_0'0 = PRIM_PutChar(u_695) in
                                                                  k prim_801_0'0
                                                                | false0 ->
                                                                  let k [u_695,u_697] uLET_802_0'0 =
                                                                    match uLET_802_0'0 with
                                                                    | true1 ->
                                                                      let prim_804_0'0 = PRIM_PutChar(u_695) in
                                                                      k prim_804_0'0
                                                                    | false0 ->
                                                                      let k [u_695,u_697] uLET_805_0'0 =
                                                                        match uLET_805_0'0 with
                                                                        | true1 ->
                                                                          let prim_807_0'0 = PRIM_PutChar(u_695) in
                                                                          k prim_807_0'0
                                                                        | false0 ->
                                                                          let k [u_697] u_701 =
                                                                            let k [] u_708 =
                                                                              let prim_818_0'0 = PRIM_PutChar(u_708) in
                                                                              k prim_818_0'0 in
                                                                            let k [] u_707 =
                                                                              let prim_817_0'0 = PRIM_CharChr(u_707) in
                                                                              k prim_817_0'0 in
                                                                            let k [] uLET_809_0'0 =
                                                                              let lit_816_18'52 = 1 in
                                                                              uLET_809_0'0 lit_816_18'52 k in
                                                                            let k [] u_705 =
                                                                              let lam_815_0'0 = fun [u_705] f_706 k ->
                                                                                let prim_814_0'0 = PRIM_SubInt(u_705,f_706) in
                                                                                k prim_814_0'0 in
                                                                              k lam_815_0'0 in
                                                                            let k [u_697] uLET_810_0'0 = uLET_810_0'0 u_697 k in
                                                                            let k [] u_703 =
                                                                              let lam_813_0'0 = fun [u_703] f_704 k ->
                                                                                let prim_812_0'0 = PRIM_AddInt(u_703,f_704) in
                                                                                k prim_812_0'0 in
                                                                              k lam_813_0'0 in
                                                                            let u_702 = 'A' in
                                                                            let prim_811_0'0 = PRIM_CharOrd(u_702) in
                                                                            k prim_811_0'0 in
                                                                          let u_700 = '^' in
                                                                          let prim_808_0'0 = PRIM_PutChar(u_700) in
                                                                          k prim_808_0'0 in
                                                                      let u_699 = 26 in
                                                                      let prim_806_0'0 = PRIM_LessInt(u_699,u_697) in
                                                                      k prim_806_0'0 in
                                                                  let u_698 = '\n' in
                                                                  let prim_803_0'0 = PRIM_EqChar(u_695,u_698) in
                                                                  k prim_803_0'0 in
                                                              let u_681 = 8 in
                                                              let u_682 = PRIM_CharOrd(u_680) in
                                                              let prim_781_0'0 = PRIM_EqInt(u_682,u_681) in
                                                              match prim_781_0'0 with
                                                              | true1 ->
                                                                let prim_782_0'0 = PRIM_PutChar(u_680) in
                                                                k prim_782_0'0
                                                              | false0 ->
                                                                let k [u_680,u_682] uLET_783_0'0 =
                                                                  match uLET_783_0'0 with
                                                                  | true1 ->
                                                                    let prim_785_0'0 = PRIM_PutChar(u_680) in
                                                                    k prim_785_0'0
                                                                  | false0 ->
                                                                    let k [u_680,u_682] uLET_786_0'0 =
                                                                      match uLET_786_0'0 with
                                                                      | true1 ->
                                                                        let prim_788_0'0 = PRIM_PutChar(u_680) in
                                                                        k prim_788_0'0
                                                                      | false0 ->
                                                                        let k [u_682] u_686 =
                                                                          let k [] u_693 =
                                                                            let prim_799_0'0 = PRIM_PutChar(u_693) in
                                                                            k prim_799_0'0 in
                                                                          let k [] u_692 =
                                                                            let prim_798_0'0 = PRIM_CharChr(u_692) in
                                                                            k prim_798_0'0 in
                                                                          let k [] uLET_790_0'0 =
                                                                            let lit_797_18'52 = 1 in
                                                                            uLET_790_0'0 lit_797_18'52 k in
                                                                          let k [] u_690 =
                                                                            let lam_796_0'0 = fun [u_690] f_691 k ->
                                                                              let prim_795_0'0 = PRIM_SubInt(u_690,f_691) in
                                                                              k prim_795_0'0 in
                                                                            k lam_796_0'0 in
                                                                          let k [u_682] uLET_791_0'0 = uLET_791_0'0 u_682 k in
                                                                          let k [] u_688 =
                                                                            let lam_794_0'0 = fun [u_688] f_689 k ->
                                                                              let prim_793_0'0 = PRIM_AddInt(u_688,f_689) in
                                                                              k prim_793_0'0 in
                                                                            k lam_794_0'0 in
                                                                          let u_687 = 'A' in
                                                                          let prim_792_0'0 = PRIM_CharOrd(u_687) in
                                                                          k prim_792_0'0 in
                                                                        let u_685 = '^' in
                                                                        let prim_789_0'0 = PRIM_PutChar(u_685) in
                                                                        k prim_789_0'0 in
                                                                    let u_684 = 26 in
                                                                    let prim_787_0'0 = PRIM_LessInt(u_684,u_682) in
                                                                    k prim_787_0'0 in
                                                                let u_683 = '\n' in
                                                                let prim_784_0'0 = PRIM_EqChar(u_680,u_683) in
                                                                k prim_784_0'0 in
                                                            let u_679 = 8 in
                                                            let prim_780_0'0 = PRIM_CharChr(u_679) in
                                                            k prim_780_0'0
                                                          | false0 ->
                                                            let con_838_113'55 = Unit0 in
                                                            k con_838_113'55 in
                                                        let k [] uLET_775_0'0 =
                                                          let lit_779_113'28 = 26 in
                                                          uLET_775_0'0 lit_779_113'28 k in
                                                        let u_675 = PRIM_CharOrd(c_673_112'14) in
                                                        let lam_778_0'0 = fun [u_675] f_676 k ->
                                                          let u_677 = PRIM_LessInt(f_676,u_675) in
                                                          match u_677 with
                                                          | true1 ->
                                                            let con_776_4'12 = false0 in
                                                            k con_776_4'12
                                                          | false0 ->
                                                            let con_777_5'13 = true1 in
                                                            k con_777_5'13 in
                                                        k lam_778_0'0
                                                    | false0 ->
                                                      let k [acc_606_103'15,loop_607_103'10,u_609] u_783 =
                                                        let con_916_0'0 = Cons1[u_609,acc_606_103'15] in
                                                        loop_607_103'10 con_916_0'0 k in
                                                      let u_770 = 8 in
                                                      let u_771 = PRIM_CharOrd(u_609) in
                                                      let prim_897_0'0 = PRIM_EqInt(u_771,u_770) in
                                                      match prim_897_0'0 with
                                                      | true1 ->
                                                        let prim_898_0'0 = PRIM_PutChar(u_609) in
                                                        k prim_898_0'0
                                                      | false0 ->
                                                        let k [u_609,u_771] uLET_899_0'0 =
                                                          match uLET_899_0'0 with
                                                          | true1 ->
                                                            let prim_901_0'0 = PRIM_PutChar(u_609) in
                                                            k prim_901_0'0
                                                          | false0 ->
                                                            let k [u_609,u_771] uLET_902_0'0 =
                                                              match uLET_902_0'0 with
                                                              | true1 ->
                                                                let prim_904_0'0 = PRIM_PutChar(u_609) in
                                                                k prim_904_0'0
                                                              | false0 ->
                                                                let k [u_771] u_775 =
                                                                  let k [] u_782 =
                                                                    let prim_915_0'0 = PRIM_PutChar(u_782) in
                                                                    k prim_915_0'0 in
                                                                  let k [] u_781 =
                                                                    let prim_914_0'0 = PRIM_CharChr(u_781) in
                                                                    k prim_914_0'0 in
                                                                  let k [] uLET_906_0'0 =
                                                                    let lit_913_18'52 = 1 in
                                                                    uLET_906_0'0 lit_913_18'52 k in
                                                                  let k [] u_779 =
                                                                    let lam_912_0'0 = fun [u_779] f_780 k ->
                                                                      let prim_911_0'0 = PRIM_SubInt(u_779,f_780) in
                                                                      k prim_911_0'0 in
                                                                    k lam_912_0'0 in
                                                                  let k [u_771] uLET_907_0'0 = uLET_907_0'0 u_771 k in
                                                                  let k [] u_777 =
                                                                    let lam_910_0'0 = fun [u_777] f_778 k ->
                                                                      let prim_909_0'0 = PRIM_AddInt(u_777,f_778) in
                                                                      k prim_909_0'0 in
                                                                    k lam_910_0'0 in
                                                                  let u_776 = 'A' in
                                                                  let prim_908_0'0 = PRIM_CharOrd(u_776) in
                                                                  k prim_908_0'0 in
                                                                let u_774 = '^' in
                                                                let prim_905_0'0 = PRIM_PutChar(u_774) in
                                                                k prim_905_0'0 in
                                                            let u_773 = 26 in
                                                            let prim_903_0'0 = PRIM_LessInt(u_773,u_771) in
                                                            k prim_903_0'0 in
                                                        let u_772 = '\n' in
                                                        let prim_900_0'0 = PRIM_EqChar(u_609,u_772) in
                                                        k prim_900_0'0 in
                                                  let u_672 = 127 in
                                                  let prim_773_0'0 = PRIM_EqInt(u_610,u_672) in
                                                  k prim_773_0'0 in
                                              let u_671 = 127 in
                                              let prim_771_0'0 = PRIM_LessInt(u_671,u_610) in
                                              k prim_771_0'0 in
                                        let u_611 = '\n' in
                                        let prim_701_0'0 = PRIM_EqChar(u_609,u_611) in
                                        k prim_701_0'0 in
                                      let u_608 = Unit0 in
                                      let prim_699_0'0 = PRIM_GetChar(u_608) in
                                      k prim_699_0'0) in
                                    let con_917_119'7 = Nil0 in
                                    u_784 con_917_119'7 k in
                                  let u_604 = 4 in
                                  let prim_698_0'0 = PRIM_CharChr(u_604) in
                                  k prim_698_0'0) in
                                let con_951_174'6 = Unit0 in
                                u_811 con_951_174'6 k in
                              let u_598 = "(reverse typed lines until ^D)\n" in
                              let prim_697_0'0 = PRIM_Explode(u_598) in
                              u_52 prim_697_0'0 k
                          | false0 ->
                            let k [u_18,u_33,u_52,u_258] u_814 =
                              let k [u_18,u_52,u_258,u_814] u_815 =
                                let k [u_52,u_815] u_817 =
                                  let k [u_52,u_815] u_819 =
                                    let k [u_52] u_836 =
                                      let k [] u_838 =
                                        let u_839 = Unit0 in
                                        let u_840 = '\n' in
                                        let u_841 = 8 in
                                        let u_842 = PRIM_CharOrd(u_840) in
                                        let prim_985_0'0 = PRIM_EqInt(u_842,u_841) in
                                        match prim_985_0'0 with
                                        | true1 ->
                                          let prim_986_0'0 = PRIM_PutChar(u_840) in
                                          k prim_986_0'0
                                        | false0 ->
                                          let k [u_840,u_842] uLET_987_0'0 =
                                            match uLET_987_0'0 with
                                            | true1 ->
                                              let prim_989_0'0 = PRIM_PutChar(u_840) in
                                              k prim_989_0'0
                                            | false0 ->
                                              let k [u_840,u_842] uLET_990_0'0 =
                                                match uLET_990_0'0 with
                                                | true1 ->
                                                  let prim_992_0'0 = PRIM_PutChar(u_840) in
                                                  k prim_992_0'0
                                                | false0 ->
                                                  let k [u_842] u_846 =
                                                    let k [] u_853 =
                                                      let prim_1003_0'0 = PRIM_PutChar(u_853) in
                                                      k prim_1003_0'0 in
                                                    let k [] u_852 =
                                                      let prim_1002_0'0 = PRIM_CharChr(u_852) in
                                                      k prim_1002_0'0 in
                                                    let k [] uLET_994_0'0 =
                                                      let lit_1001_18'52 = 1 in
                                                      uLET_994_0'0 lit_1001_18'52 k in
                                                    let k [] u_850 =
                                                      let lam_1000_0'0 = fun [u_850] f_851 k ->
                                                        let prim_999_0'0 = PRIM_SubInt(u_850,f_851) in
                                                        k prim_999_0'0 in
                                                      k lam_1000_0'0 in
                                                    let k [u_842] uLET_995_0'0 = uLET_995_0'0 u_842 k in
                                                    let k [] u_848 =
                                                      let lam_998_0'0 = fun [u_848] f_849 k ->
                                                        let prim_997_0'0 = PRIM_AddInt(u_848,f_849) in
                                                        k prim_997_0'0 in
                                                      k lam_998_0'0 in
                                                    let u_847 = 'A' in
                                                    let prim_996_0'0 = PRIM_CharOrd(u_847) in
                                                    k prim_996_0'0 in
                                                  let u_845 = '^' in
                                                  let prim_993_0'0 = PRIM_PutChar(u_845) in
                                                  k prim_993_0'0 in
                                              let u_844 = 26 in
                                              let prim_991_0'0 = PRIM_LessInt(u_844,u_842) in
                                              k prim_991_0'0 in
                                          let u_843 = '\n' in
                                          let prim_988_0'0 = PRIM_EqChar(u_840,u_843) in
                                          k prim_988_0'0 in
                                      let u_837 = " chars)" in
                                      let prim_984_0'0 = PRIM_Explode(u_837) in
                                      u_52 prim_984_0'0 k in
                                    let k [u_52] uLET_962_0'0 = u_52 uLET_962_0'0 k in
                                    let k [u_815] u_821 =
                                      let u_832 = fix (fun [u_821] loop_823_84'10 acc_822_84'15 k ->
                                        let lam_975_0'0 = fun [u_821,acc_822_84'15,loop_823_84'10] f_824 k ->
                                          let k [u_821,acc_822_84'15,loop_823_84'10,f_824] uLET_964_0'0 =
                                            match uLET_964_0'0 with
                                            | true1 -> k acc_822_84'15
                                            | false0 ->
                                              let k [f_824] app_966_86'11 =
                                                let k [app_966_86'11] uLET_973_0'0 = app_966_86'11 uLET_973_0'0 k in
                                                let u_831 = 10 in
                                                let prim_974_0'0 = PRIM_DivInt(f_824,u_831) in
                                                k prim_974_0'0 in
                                              let k [loop_823_84'10] app_967_86'40 = loop_823_84'10 app_967_86'40 k in
                                              let k [acc_822_84'15] uLET_968_0'0 = uLET_968_0'0 acc_822_84'15 k in
                                              let k [] u_829 =
                                                let lam_972_0'0 = fun [u_829] f_830 k ->
                                                  let con_971_0'0 = Cons1[u_829,f_830] in
                                                  k con_971_0'0 in
                                                k lam_972_0'0 in
                                              let k [u_821] u_827 =
                                                let u_828 = PRIM_AddInt(u_821,u_827) in
                                                let prim_970_0'0 = PRIM_CharChr(u_828) in
                                                k prim_970_0'0 in
                                              let u_826 = 10 in
                                              let prim_969_0'0 = PRIM_ModInt(f_824,u_826) in
                                              k prim_969_0'0 in
                                          let u_825 = 0 in
                                          let prim_965_0'0 = PRIM_EqInt(f_824,u_825) in
                                          k prim_965_0'0 in
                                        k lam_975_0'0) in
                                      let k [u_815,u_832] uLET_976_0'0 =
                                        match uLET_976_0'0 with
                                        | true1 ->
                                          let k [] uLET_978_0'0 =
                                            let con_981_88'25 = Nil0 in
                                            uLET_978_0'0 con_981_88'25 k in
                                          let u_834 = '0' in
                                          let lam_980_0'0 = fun [u_834] f_835 k ->
                                            let con_979_0'0 = Cons1[u_834,f_835] in
                                            k con_979_0'0 in
                                          k lam_980_0'0
                                        | false0 ->
                                          let k [u_815] app_982_88'38 = app_982_88'38 u_815 k in
                                          let con_983_88'38 = Nil0 in
                                          u_832 con_983_88'38 k in
                                      let u_833 = 0 in
                                      let prim_977_0'0 = PRIM_EqInt(u_815,u_833) in
                                      k prim_977_0'0 in
                                    let u_820 = '0' in
                                    let prim_963_0'0 = PRIM_CharOrd(u_820) in
                                    k prim_963_0'0 in
                                  let u_818 = "\" (" in
                                  let prim_961_0'0 = PRIM_Explode(u_818) in
                                  u_52 prim_961_0'0 k in
                                let k [u_52] app_956_186'46 = u_52 app_956_186'46 k in
                                let k [u_258,u_814] app_957_186'20 =
                                  let k [app_957_186'20] app_960_186'60 = app_957_186'20 app_960_186'60 k in
                                  u_814 u_258 k in
                                let k [u_18] uLET_958_0'0 = u_18 uLET_958_0'0 k in
                                let u_816 = "You wrote: \"" in
                                let prim_959_0'0 = PRIM_Explode(u_816) in
                                k prim_959_0'0 in
                              u_33 u_258 k in
                            let lam_952_0'0 = fun [] f_812 k ->
                              let k [f_812] uLET_953_0'0 =
                                match uLET_953_0'0 with
                                | true1 ->
                                  let lit_955_184'57 = '*' in
                                  k lit_955_184'57
                                | false0 -> k f_812 in
                              let u_813 = 'o' in
                              let prim_954_0'0 = PRIM_EqChar(f_812,u_813) in
                              k prim_954_0'0 in
                            u_26 lam_952_0'0 k in
                        let k [u_11,command_293_207'4] u_574 =
                          let k [u_574] app_671_56'39 = app_671_56'39 u_574 k in
                          let k [command_293_207'4] app_672_56'31 = app_672_56'31 command_293_207'4 k in
                          let lam_673_0'0 = fun [] f_575 k ->
                            let lam_675_0'0 = fun [f_575] f_576 k ->
                              let prim_674_0'0 = PRIM_EqChar(f_575,f_576) in
                              k prim_674_0'0 in
                            k lam_675_0'0 in
                          u_11 lam_673_0'0 k in
                        let u_573 = "rev" in
                        let prim_670_0'0 = PRIM_Explode(u_573) in
                        k prim_670_0'0 in
                    let k [u_11,command_293_207'4] u_435 =
                      let k [u_435] app_507_56'39 = app_507_56'39 u_435 k in
                      let k [command_293_207'4] app_508_56'31 = app_508_56'31 command_293_207'4 k in
                      let lam_509_0'0 = fun [] f_436 k ->
                        let lam_511_0'0 = fun [f_436] f_437 k ->
                          let prim_510_0'0 = PRIM_EqChar(f_436,f_437) in
                          k prim_510_0'0 in
                        k lam_511_0'0 in
                      u_11 lam_509_0'0 k in
                    let u_434 = "fact" in
                    let prim_506_0'0 = PRIM_Explode(u_434) in
                    k prim_506_0'0 in
                let k [u_11,command_293_207'4] u_296 =
                  let k [u_296] app_343_56'39 = app_343_56'39 u_296 k in
                  let k [command_293_207'4] app_344_56'31 = app_344_56'31 command_293_207'4 k in
                  let lam_345_0'0 = fun [] f_297 k ->
                    let lam_347_0'0 = fun [f_297] f_298 k ->
                      let prim_346_0'0 = PRIM_EqChar(f_297,f_298) in
                      k prim_346_0'0 in
                    k lam_347_0'0 in
                  u_11 lam_345_0'0 k in
                let u_295 = "fib" in
                let prim_342_0'0 = PRIM_Explode(u_295) in
                k prim_342_0'0 in
            let u_291 = fix (fun [] loop_262_193'10 accWs_261_193'15 k ->
              let lam_335_0'0 = fun [accWs_261_193'15,loop_262_193'10] f_263 k ->
                let lam_334_0'0 = fun [accWs_261_193'15,loop_262_193'10,f_263] f_264 k ->
                  match f_264 with
                  | Nil0 ->
                    let k [] u_273 =
                      let u_279 = fix (fun [] loop_275_64'10 acc_274_64'15 k ->
                        let lam_314_0'0 = fun [acc_274_64'15,loop_275_64'10] f_276 k ->
                          match f_276 with
                          | Nil0 -> k acc_274_64'15
                          | Cons1(x_277_67'6,xs_278_67'9) ->
                            let k [xs_278_67'9] app_312_67'20 = app_312_67'20 xs_278_67'9 k in
                            let con_313_0'0 = Cons1[x_277_67'6,acc_274_64'15] in
                            loop_275_64'10 con_313_0'0 k in
                        k lam_314_0'0) in
                      let k [u_273] app_315_69'7 = app_315_69'7 u_273 k in
                      let con_316_69'7 = Nil0 in
                      u_279 con_316_69'7 k in
                    let k [accWs_261_193'15] uLET_304_0'0 = uLET_304_0'0 accWs_261_193'15 k in
                    let k [] u_271 =
                      let lam_311_0'0 = fun [u_271] f_272 k ->
                        let con_310_0'0 = Cons1[u_271,f_272] in
                        k con_310_0'0 in
                      k lam_311_0'0 in
                    let u_270 = fix (fun [] loop_266_64'10 acc_265_64'15 k ->
                      let lam_307_0'0 = fun [acc_265_64'15,loop_266_64'10] f_267 k ->
                        match f_267 with
                        | Nil0 -> k acc_265_64'15
                        | Cons1(x_268_67'6,xs_269_67'9) ->
                          let k [xs_269_67'9] app_305_67'20 = app_305_67'20 xs_269_67'9 k in
                          let con_306_0'0 = Cons1[x_268_67'6,acc_265_64'15] in
                          loop_266_64'10 con_306_0'0 k in
                      k lam_307_0'0) in
                    let k [f_263] app_308_69'7 = app_308_69'7 f_263 k in
                    let con_309_69'7 = Nil0 in
                    u_270 con_309_69'7 k
                  | Cons1(x_280_197'6,xs_281_197'9) ->
                    let k [accWs_261_193'15,loop_262_193'10,f_263,x_280_197'6,xs_281_197'9] uLET_317_0'0 =
                      match uLET_317_0'0 with
                      | true1 ->
                        let k [xs_281_197'9] app_319_198'59 = app_319_198'59 xs_281_197'9 k in
                        let k [] app_320_198'34 =
                          let con_330_198'59 = Nil0 in
                          app_320_198'34 con_330_198'59 k in
                        let k [loop_262_193'10] app_321_198'52 = loop_262_193'10 app_321_198'52 k in
                        let k [accWs_261_193'15] uLET_322_0'0 = uLET_322_0'0 accWs_261_193'15 k in
                        let k [] u_289 =
                          let lam_329_0'0 = fun [u_289] f_290 k ->
                            let con_328_0'0 = Cons1[u_289,f_290] in
                            k con_328_0'0 in
                          k lam_329_0'0 in
                        let u_288 = fix (fun [] loop_284_64'10 acc_283_64'15 k ->
                          let lam_325_0'0 = fun [acc_283_64'15,loop_284_64'10] f_285 k ->
                            match f_285 with
                            | Nil0 -> k acc_283_64'15
                            | Cons1(x_286_67'6,xs_287_67'9) ->
                              let k [xs_287_67'9] app_323_67'20 = app_323_67'20 xs_287_67'9 k in
                              let con_324_0'0 = Cons1[x_286_67'6,acc_283_64'15] in
                              loop_284_64'10 con_324_0'0 k in
                          k lam_325_0'0) in
                        let k [f_263] app_326_69'7 = app_326_69'7 f_263 k in
                        let con_327_69'7 = Nil0 in
                        u_288 con_327_69'7 k
                      | false0 ->
                        let k [xs_281_197'9] app_331_199'23 = app_331_199'23 xs_281_197'9 k in
                        let k [f_263,x_280_197'6] app_332_199'17 =
                          let con_333_0'0 = Cons1[x_280_197'6,f_263] in
                          app_332_199'17 con_333_0'0 k in
                        loop_262_193'10 accWs_261_193'15 k in
                    let u_282 = ' ' in
                    let prim_318_0'0 = PRIM_EqChar(x_280_197'6,u_282) in
                    k prim_318_0'0 in
                k lam_334_0'0 in
              k lam_335_0'0) in
            let k [u_258] app_336_201'10 = app_336_201'10 u_258 k in
            let k [] app_337_201'7 =
              let con_339_201'10 = Nil0 in
              app_337_201'7 con_339_201'10 k in
            let con_338_201'7 = Nil0 in
            u_291 con_338_201'7 k in
        let k [u_72] app_298_56'39 = app_298_56'39 u_72 k in
        let k [u_258] app_299_56'31 = app_299_56'31 u_258 k in
        let lam_300_0'0 = fun [] f_259 k ->
          let lam_302_0'0 = fun [f_259] f_260 k ->
            let prim_301_0'0 = PRIM_EqChar(f_259,f_260) in
            k prim_301_0'0 in
          k lam_302_0'0 in
        u_11 lam_300_0'0 k in
      let u_76 = Unit0 in
      let k [] u_78 =
        let u_257 = fix (fun [u_78] loop_80_103'10 acc_79_103'15 k ->
          let k [u_78,acc_79_103'15,loop_80_103'10] u_82 =
            let u_83 = PRIM_CharOrd(u_82) in
            let k [u_78,acc_79_103'15,loop_80_103'10,u_82,u_83] uLET_79_0'0 =
              match uLET_79_0'0 with
              | true1 ->
                let k [acc_79_103'15] u_100 =
                  let u_106 = fix (fun [] loop_102_64'10 acc_101_64'15 k ->
                    let lam_102_0'0 = fun [acc_101_64'15,loop_102_64'10] f_103 k ->
                      match f_103 with
                      | Nil0 -> k acc_101_64'15
                      | Cons1(x_104_67'6,xs_105_67'9) ->
                        let k [xs_105_67'9] app_100_67'20 = app_100_67'20 xs_105_67'9 k in
                        let con_101_0'0 = Cons1[x_104_67'6,acc_101_64'15] in
                        loop_102_64'10 con_101_0'0 k in
                    k lam_102_0'0) in
                  let k [acc_79_103'15] app_103_69'7 = app_103_69'7 acc_79_103'15 k in
                  let con_104_69'7 = Nil0 in
                  u_106 con_104_69'7 k in
                let u_85 = Unit0 in
                let u_86 = '\n' in
                let u_87 = 8 in
                let u_88 = PRIM_CharOrd(u_86) in
                let prim_81_0'0 = PRIM_EqInt(u_88,u_87) in
                match prim_81_0'0 with
                | true1 ->
                  let prim_82_0'0 = PRIM_PutChar(u_86) in
                  k prim_82_0'0
                | false0 ->
                  let k [u_86,u_88] uLET_83_0'0 =
                    match uLET_83_0'0 with
                    | true1 ->
                      let prim_85_0'0 = PRIM_PutChar(u_86) in
                      k prim_85_0'0
                    | false0 ->
                      let k [u_86,u_88] uLET_86_0'0 =
                        match uLET_86_0'0 with
                        | true1 ->
                          let prim_88_0'0 = PRIM_PutChar(u_86) in
                          k prim_88_0'0
                        | false0 ->
                          let k [u_88] u_92 =
                            let k [] u_99 =
                              let prim_99_0'0 = PRIM_PutChar(u_99) in
                              k prim_99_0'0 in
                            let k [] u_98 =
                              let prim_98_0'0 = PRIM_CharChr(u_98) in
                              k prim_98_0'0 in
                            let k [] uLET_90_0'0 =
                              let lit_97_18'52 = 1 in
                              uLET_90_0'0 lit_97_18'52 k in
                            let k [] u_96 =
                              let lam_96_0'0 = fun [u_96] f_97 k ->
                                let prim_95_0'0 = PRIM_SubInt(u_96,f_97) in
                                k prim_95_0'0 in
                              k lam_96_0'0 in
                            let k [u_88] uLET_91_0'0 = uLET_91_0'0 u_88 k in
                            let k [] u_94 =
                              let lam_94_0'0 = fun [u_94] f_95 k ->
                                let prim_93_0'0 = PRIM_AddInt(u_94,f_95) in
                                k prim_93_0'0 in
                              k lam_94_0'0 in
                            let u_93 = 'A' in
                            let prim_92_0'0 = PRIM_CharOrd(u_93) in
                            k prim_92_0'0 in
                          let u_91 = '^' in
                          let prim_89_0'0 = PRIM_PutChar(u_91) in
                          k prim_89_0'0 in
                      let u_90 = 26 in
                      let prim_87_0'0 = PRIM_LessInt(u_90,u_88) in
                      k prim_87_0'0 in
                  let u_89 = '\n' in
                  let prim_84_0'0 = PRIM_EqChar(u_86,u_89) in
                  k prim_84_0'0
              | false0 ->
                let prim_105_0'0 = PRIM_EqChar(u_82,u_78) in
                match prim_105_0'0 with
                | true1 ->
                  let k [u_78,acc_79_103'15] u_120 =
                    let k [u_78,acc_79_103'15] u_136 =
                      let u_137 = Cons1[u_78,acc_79_103'15] in
                      let u_143 = fix (fun [] loop_139_64'10 acc_138_64'15 k ->
                        let lam_146_0'0 = fun [acc_138_64'15,loop_139_64'10] f_140 k ->
                          match f_140 with
                          | Nil0 -> k acc_138_64'15
                          | Cons1(x_141_67'6,xs_142_67'9) ->
                            let k [xs_142_67'9] app_144_67'20 = app_144_67'20 xs_142_67'9 k in
                            let con_145_0'0 = Cons1[x_141_67'6,acc_138_64'15] in
                            loop_139_64'10 con_145_0'0 k in
                        k lam_146_0'0) in
                      let k [u_137] app_147_69'7 = app_147_69'7 u_137 k in
                      let con_148_69'7 = Nil0 in
                      u_143 con_148_69'7 k in
                    let u_121 = Unit0 in
                    let u_122 = '\n' in
                    let u_123 = 8 in
                    let u_124 = PRIM_CharOrd(u_122) in
                    let prim_125_0'0 = PRIM_EqInt(u_124,u_123) in
                    match prim_125_0'0 with
                    | true1 ->
                      let prim_126_0'0 = PRIM_PutChar(u_122) in
                      k prim_126_0'0
                    | false0 ->
                      let k [u_122,u_124] uLET_127_0'0 =
                        match uLET_127_0'0 with
                        | true1 ->
                          let prim_129_0'0 = PRIM_PutChar(u_122) in
                          k prim_129_0'0
                        | false0 ->
                          let k [u_122,u_124] uLET_130_0'0 =
                            match uLET_130_0'0 with
                            | true1 ->
                              let prim_132_0'0 = PRIM_PutChar(u_122) in
                              k prim_132_0'0
                            | false0 ->
                              let k [u_124] u_128 =
                                let k [] u_135 =
                                  let prim_143_0'0 = PRIM_PutChar(u_135) in
                                  k prim_143_0'0 in
                                let k [] u_134 =
                                  let prim_142_0'0 = PRIM_CharChr(u_134) in
                                  k prim_142_0'0 in
                                let k [] uLET_134_0'0 =
                                  let lit_141_18'52 = 1 in
                                  uLET_134_0'0 lit_141_18'52 k in
                                let k [] u_132 =
                                  let lam_140_0'0 = fun [u_132] f_133 k ->
                                    let prim_139_0'0 = PRIM_SubInt(u_132,f_133) in
                                    k prim_139_0'0 in
                                  k lam_140_0'0 in
                                let k [u_124] uLET_135_0'0 = uLET_135_0'0 u_124 k in
                                let k [] u_130 =
                                  let lam_138_0'0 = fun [u_130] f_131 k ->
                                    let prim_137_0'0 = PRIM_AddInt(u_130,f_131) in
                                    k prim_137_0'0 in
                                  k lam_138_0'0 in
                                let u_129 = 'A' in
                                let prim_136_0'0 = PRIM_CharOrd(u_129) in
                                k prim_136_0'0 in
                              let u_127 = '^' in
                              let prim_133_0'0 = PRIM_PutChar(u_127) in
                              k prim_133_0'0 in
                          let u_126 = 26 in
                          let prim_131_0'0 = PRIM_LessInt(u_126,u_124) in
                          k prim_131_0'0 in
                      let u_125 = '\n' in
                      let prim_128_0'0 = PRIM_EqChar(u_122,u_125) in
                      k prim_128_0'0 in
                  let u_107 = 8 in
                  let u_108 = PRIM_CharOrd(u_82) in
                  let prim_106_0'0 = PRIM_EqInt(u_108,u_107) in
                  match prim_106_0'0 with
                  | true1 ->
                    let prim_107_0'0 = PRIM_PutChar(u_82) in
                    k prim_107_0'0
                  | false0 ->
                    let k [u_82,u_108] uLET_108_0'0 =
                      match uLET_108_0'0 with
                      | true1 ->
                        let prim_110_0'0 = PRIM_PutChar(u_82) in
                        k prim_110_0'0
                      | false0 ->
                        let k [u_82,u_108] uLET_111_0'0 =
                          match uLET_111_0'0 with
                          | true1 ->
                            let prim_113_0'0 = PRIM_PutChar(u_82) in
                            k prim_113_0'0
                          | false0 ->
                            let k [u_108] u_112 =
                              let k [] u_119 =
                                let prim_124_0'0 = PRIM_PutChar(u_119) in
                                k prim_124_0'0 in
                              let k [] u_118 =
                                let prim_123_0'0 = PRIM_CharChr(u_118) in
                                k prim_123_0'0 in
                              let k [] uLET_115_0'0 =
                                let lit_122_18'52 = 1 in
                                uLET_115_0'0 lit_122_18'52 k in
                              let k [] u_116 =
                                let lam_121_0'0 = fun [u_116] f_117 k ->
                                  let prim_120_0'0 = PRIM_SubInt(u_116,f_117) in
                                  k prim_120_0'0 in
                                k lam_121_0'0 in
                              let k [u_108] uLET_116_0'0 = uLET_116_0'0 u_108 k in
                              let k [] u_114 =
                                let lam_119_0'0 = fun [u_114] f_115 k ->
                                  let prim_118_0'0 = PRIM_AddInt(u_114,f_115) in
                                  k prim_118_0'0 in
                                k lam_119_0'0 in
                              let u_113 = 'A' in
                              let prim_117_0'0 = PRIM_CharOrd(u_113) in
                              k prim_117_0'0 in
                            let u_111 = '^' in
                            let prim_114_0'0 = PRIM_PutChar(u_111) in
                            k prim_114_0'0 in
                        let u_110 = 26 in
                        let prim_112_0'0 = PRIM_LessInt(u_110,u_108) in
                        k prim_112_0'0 in
                    let u_109 = '\n' in
                    let prim_109_0'0 = PRIM_EqChar(u_82,u_109) in
                    k prim_109_0'0
                | false0 ->
                  let k [acc_79_103'15,loop_80_103'10,u_82,u_83] uLET_149_0'0 =
                    match uLET_149_0'0 with
                    | true1 -> loop_80_103'10 acc_79_103'15 k
                    | false0 ->
                      let k [acc_79_103'15,loop_80_103'10,u_82] uLET_151_0'0 =
                        match uLET_151_0'0 with
                        | true1 ->
                          match acc_79_103'15 with
                          | Nil0 -> loop_80_103'10 acc_79_103'15 k
                          | Cons1(c_146_112'14,tail_147_112'17) ->
                            let k [loop_80_103'10,tail_147_112'17] u_196 =
                              let k [loop_80_103'10,tail_147_112'17] u_242 = loop_80_103'10 tail_147_112'17 k in
                              let u_197 = Unit0 in
                              let k [] u_199 =
                                let k [u_199] u_213 =
                                  let k [u_199] u_228 =
                                    let u_229 = 8 in
                                    let u_230 = PRIM_CharOrd(u_199) in
                                    let prim_257_0'0 = PRIM_EqInt(u_230,u_229) in
                                    match prim_257_0'0 with
                                    | true1 ->
                                      let prim_258_0'0 = PRIM_PutChar(u_199) in
                                      k prim_258_0'0
                                    | false0 ->
                                      let k [u_199,u_230] uLET_259_0'0 =
                                        match uLET_259_0'0 with
                                        | true1 ->
                                          let prim_261_0'0 = PRIM_PutChar(u_199) in
                                          k prim_261_0'0
                                        | false0 ->
                                          let k [u_199,u_230] uLET_262_0'0 =
                                            match uLET_262_0'0 with
                                            | true1 ->
                                              let prim_264_0'0 = PRIM_PutChar(u_199) in
                                              k prim_264_0'0
                                            | false0 ->
                                              let k [u_230] u_234 =
                                                let k [] u_241 =
                                                  let prim_275_0'0 = PRIM_PutChar(u_241) in
                                                  k prim_275_0'0 in
                                                let k [] u_240 =
                                                  let prim_274_0'0 = PRIM_CharChr(u_240) in
                                                  k prim_274_0'0 in
                                                let k [] uLET_266_0'0 =
                                                  let lit_273_18'52 = 1 in
                                                  uLET_266_0'0 lit_273_18'52 k in
                                                let k [] u_238 =
                                                  let lam_272_0'0 = fun [u_238] f_239 k ->
                                                    let prim_271_0'0 = PRIM_SubInt(u_238,f_239) in
                                                    k prim_271_0'0 in
                                                  k lam_272_0'0 in
                                                let k [u_230] uLET_267_0'0 = uLET_267_0'0 u_230 k in
                                                let k [] u_236 =
                                                  let lam_270_0'0 = fun [u_236] f_237 k ->
                                                    let prim_269_0'0 = PRIM_AddInt(u_236,f_237) in
                                                    k prim_269_0'0 in
                                                  k lam_270_0'0 in
                                                let u_235 = 'A' in
                                                let prim_268_0'0 = PRIM_CharOrd(u_235) in
                                                k prim_268_0'0 in
                                              let u_233 = '^' in
                                              let prim_265_0'0 = PRIM_PutChar(u_233) in
                                              k prim_265_0'0 in
                                          let u_232 = 26 in
                                          let prim_263_0'0 = PRIM_LessInt(u_232,u_230) in
                                          k prim_263_0'0 in
                                      let u_231 = '\n' in
                                      let prim_260_0'0 = PRIM_EqChar(u_199,u_231) in
                                      k prim_260_0'0 in
                                  let u_214 = ' ' in
                                  let u_215 = 8 in
                                  let u_216 = PRIM_CharOrd(u_214) in
                                  let prim_238_0'0 = PRIM_EqInt(u_216,u_215) in
                                  match prim_238_0'0 with
                                  | true1 ->
                                    let prim_239_0'0 = PRIM_PutChar(u_214) in
                                    k prim_239_0'0
                                  | false0 ->
                                    let k [u_214,u_216] uLET_240_0'0 =
                                      match uLET_240_0'0 with
                                      | true1 ->
                                        let prim_242_0'0 = PRIM_PutChar(u_214) in
                                        k prim_242_0'0
                                      | false0 ->
                                        let k [u_214,u_216] uLET_243_0'0 =
                                          match uLET_243_0'0 with
                                          | true1 ->
                                            let prim_245_0'0 = PRIM_PutChar(u_214) in
                                            k prim_245_0'0
                                          | false0 ->
                                            let k [u_216] u_220 =
                                              let k [] u_227 =
                                                let prim_256_0'0 = PRIM_PutChar(u_227) in
                                                k prim_256_0'0 in
                                              let k [] u_226 =
                                                let prim_255_0'0 = PRIM_CharChr(u_226) in
                                                k prim_255_0'0 in
                                              let k [] uLET_247_0'0 =
                                                let lit_254_18'52 = 1 in
                                                uLET_247_0'0 lit_254_18'52 k in
                                              let k [] u_224 =
                                                let lam_253_0'0 = fun [u_224] f_225 k ->
                                                  let prim_252_0'0 = PRIM_SubInt(u_224,f_225) in
                                                  k prim_252_0'0 in
                                                k lam_253_0'0 in
                                              let k [u_216] uLET_248_0'0 = uLET_248_0'0 u_216 k in
                                              let k [] u_222 =
                                                let lam_251_0'0 = fun [u_222] f_223 k ->
                                                  let prim_250_0'0 = PRIM_AddInt(u_222,f_223) in
                                                  k prim_250_0'0 in
                                                k lam_251_0'0 in
                                              let u_221 = 'A' in
                                              let prim_249_0'0 = PRIM_CharOrd(u_221) in
                                              k prim_249_0'0 in
                                            let u_219 = '^' in
                                            let prim_246_0'0 = PRIM_PutChar(u_219) in
                                            k prim_246_0'0 in
                                        let u_218 = 26 in
                                        let prim_244_0'0 = PRIM_LessInt(u_218,u_216) in
                                        k prim_244_0'0 in
                                    let u_217 = '\n' in
                                    let prim_241_0'0 = PRIM_EqChar(u_214,u_217) in
                                    k prim_241_0'0 in
                                let u_200 = 8 in
                                let u_201 = PRIM_CharOrd(u_199) in
                                let prim_219_0'0 = PRIM_EqInt(u_201,u_200) in
                                match prim_219_0'0 with
                                | true1 ->
                                  let prim_220_0'0 = PRIM_PutChar(u_199) in
                                  k prim_220_0'0
                                | false0 ->
                                  let k [u_199,u_201] uLET_221_0'0 =
                                    match uLET_221_0'0 with
                                    | true1 ->
                                      let prim_223_0'0 = PRIM_PutChar(u_199) in
                                      k prim_223_0'0
                                    | false0 ->
                                      let k [u_199,u_201] uLET_224_0'0 =
                                        match uLET_224_0'0 with
                                        | true1 ->
                                          let prim_226_0'0 = PRIM_PutChar(u_199) in
                                          k prim_226_0'0
                                        | false0 ->
                                          let k [u_201] u_205 =
                                            let k [] u_212 =
                                              let prim_237_0'0 = PRIM_PutChar(u_212) in
                                              k prim_237_0'0 in
                                            let k [] u_211 =
                                              let prim_236_0'0 = PRIM_CharChr(u_211) in
                                              k prim_236_0'0 in
                                            let k [] uLET_228_0'0 =
                                              let lit_235_18'52 = 1 in
                                              uLET_228_0'0 lit_235_18'52 k in
                                            let k [] u_209 =
                                              let lam_234_0'0 = fun [u_209] f_210 k ->
                                                let prim_233_0'0 = PRIM_SubInt(u_209,f_210) in
                                                k prim_233_0'0 in
                                              k lam_234_0'0 in
                                            let k [u_201] uLET_229_0'0 = uLET_229_0'0 u_201 k in
                                            let k [] u_207 =
                                              let lam_232_0'0 = fun [u_207] f_208 k ->
                                                let prim_231_0'0 = PRIM_AddInt(u_207,f_208) in
                                                k prim_231_0'0 in
                                              k lam_232_0'0 in
                                            let u_206 = 'A' in
                                            let prim_230_0'0 = PRIM_CharOrd(u_206) in
                                            k prim_230_0'0 in
                                          let u_204 = '^' in
                                          let prim_227_0'0 = PRIM_PutChar(u_204) in
                                          k prim_227_0'0 in
                                      let u_203 = 26 in
                                      let prim_225_0'0 = PRIM_LessInt(u_203,u_201) in
                                      k prim_225_0'0 in
                                  let u_202 = '\n' in
                                  let prim_222_0'0 = PRIM_EqChar(u_199,u_202) in
                                  k prim_222_0'0 in
                              let u_198 = 8 in
                              let prim_218_0'0 = PRIM_CharChr(u_198) in
                              k prim_218_0'0 in
                            let k [] app_153_113'28 =
                              match app_153_113'28 with
                              | true1 ->
                                let u_151 = Unit0 in
                                let k [] u_153 =
                                  let k [u_153] u_167 =
                                    let k [u_153] u_182 =
                                      let u_183 = 8 in
                                      let u_184 = PRIM_CharOrd(u_153) in
                                      let prim_198_0'0 = PRIM_EqInt(u_184,u_183) in
                                      match prim_198_0'0 with
                                      | true1 ->
                                        let prim_199_0'0 = PRIM_PutChar(u_153) in
                                        k prim_199_0'0
                                      | false0 ->
                                        let k [u_153,u_184] uLET_200_0'0 =
                                          match uLET_200_0'0 with
                                          | true1 ->
                                            let prim_202_0'0 = PRIM_PutChar(u_153) in
                                            k prim_202_0'0
                                          | false0 ->
                                            let k [u_153,u_184] uLET_203_0'0 =
                                              match uLET_203_0'0 with
                                              | true1 ->
                                                let prim_205_0'0 = PRIM_PutChar(u_153) in
                                                k prim_205_0'0
                                              | false0 ->
                                                let k [u_184] u_188 =
                                                  let k [] u_195 =
                                                    let prim_216_0'0 = PRIM_PutChar(u_195) in
                                                    k prim_216_0'0 in
                                                  let k [] u_194 =
                                                    let prim_215_0'0 = PRIM_CharChr(u_194) in
                                                    k prim_215_0'0 in
                                                  let k [] uLET_207_0'0 =
                                                    let lit_214_18'52 = 1 in
                                                    uLET_207_0'0 lit_214_18'52 k in
                                                  let k [] u_192 =
                                                    let lam_213_0'0 = fun [u_192] f_193 k ->
                                                      let prim_212_0'0 = PRIM_SubInt(u_192,f_193) in
                                                      k prim_212_0'0 in
                                                    k lam_213_0'0 in
                                                  let k [u_184] uLET_208_0'0 = uLET_208_0'0 u_184 k in
                                                  let k [] u_190 =
                                                    let lam_211_0'0 = fun [u_190] f_191 k ->
                                                      let prim_210_0'0 = PRIM_AddInt(u_190,f_191) in
                                                      k prim_210_0'0 in
                                                    k lam_211_0'0 in
                                                  let u_189 = 'A' in
                                                  let prim_209_0'0 = PRIM_CharOrd(u_189) in
                                                  k prim_209_0'0 in
                                                let u_187 = '^' in
                                                let prim_206_0'0 = PRIM_PutChar(u_187) in
                                                k prim_206_0'0 in
                                            let u_186 = 26 in
                                            let prim_204_0'0 = PRIM_LessInt(u_186,u_184) in
                                            k prim_204_0'0 in
                                        let u_185 = '\n' in
                                        let prim_201_0'0 = PRIM_EqChar(u_153,u_185) in
                                        k prim_201_0'0 in
                                    let u_168 = ' ' in
                                    let u_169 = 8 in
                                    let u_170 = PRIM_CharOrd(u_168) in
                                    let prim_179_0'0 = PRIM_EqInt(u_170,u_169) in
                                    match prim_179_0'0 with
                                    | true1 ->
                                      let prim_180_0'0 = PRIM_PutChar(u_168) in
                                      k prim_180_0'0
                                    | false0 ->
                                      let k [u_168,u_170] uLET_181_0'0 =
                                        match uLET_181_0'0 with
                                        | true1 ->
                                          let prim_183_0'0 = PRIM_PutChar(u_168) in
                                          k prim_183_0'0
                                        | false0 ->
                                          let k [u_168,u_170] uLET_184_0'0 =
                                            match uLET_184_0'0 with
                                            | true1 ->
                                              let prim_186_0'0 = PRIM_PutChar(u_168) in
                                              k prim_186_0'0
                                            | false0 ->
                                              let k [u_170] u_174 =
                                                let k [] u_181 =
                                                  let prim_197_0'0 = PRIM_PutChar(u_181) in
                                                  k prim_197_0'0 in
                                                let k [] u_180 =
                                                  let prim_196_0'0 = PRIM_CharChr(u_180) in
                                                  k prim_196_0'0 in
                                                let k [] uLET_188_0'0 =
                                                  let lit_195_18'52 = 1 in
                                                  uLET_188_0'0 lit_195_18'52 k in
                                                let k [] u_178 =
                                                  let lam_194_0'0 = fun [u_178] f_179 k ->
                                                    let prim_193_0'0 = PRIM_SubInt(u_178,f_179) in
                                                    k prim_193_0'0 in
                                                  k lam_194_0'0 in
                                                let k [u_170] uLET_189_0'0 = uLET_189_0'0 u_170 k in
                                                let k [] u_176 =
                                                  let lam_192_0'0 = fun [u_176] f_177 k ->
                                                    let prim_191_0'0 = PRIM_AddInt(u_176,f_177) in
                                                    k prim_191_0'0 in
                                                  k lam_192_0'0 in
                                                let u_175 = 'A' in
                                                let prim_190_0'0 = PRIM_CharOrd(u_175) in
                                                k prim_190_0'0 in
                                              let u_173 = '^' in
                                              let prim_187_0'0 = PRIM_PutChar(u_173) in
                                              k prim_187_0'0 in
                                          let u_172 = 26 in
                                          let prim_185_0'0 = PRIM_LessInt(u_172,u_170) in
                                          k prim_185_0'0 in
                                      let u_171 = '\n' in
                                      let prim_182_0'0 = PRIM_EqChar(u_168,u_171) in
                                      k prim_182_0'0 in
                                  let u_154 = 8 in
                                  let u_155 = PRIM_CharOrd(u_153) in
                                  let prim_160_0'0 = PRIM_EqInt(u_155,u_154) in
                                  match prim_160_0'0 with
                                  | true1 ->
                                    let prim_161_0'0 = PRIM_PutChar(u_153) in
                                    k prim_161_0'0
                                  | false0 ->
                                    let k [u_153,u_155] uLET_162_0'0 =
                                      match uLET_162_0'0 with
                                      | true1 ->
                                        let prim_164_0'0 = PRIM_PutChar(u_153) in
                                        k prim_164_0'0
                                      | false0 ->
                                        let k [u_153,u_155] uLET_165_0'0 =
                                          match uLET_165_0'0 with
                                          | true1 ->
                                            let prim_167_0'0 = PRIM_PutChar(u_153) in
                                            k prim_167_0'0
                                          | false0 ->
                                            let k [u_155] u_159 =
                                              let k [] u_166 =
                                                let prim_178_0'0 = PRIM_PutChar(u_166) in
                                                k prim_178_0'0 in
                                              let k [] u_165 =
                                                let prim_177_0'0 = PRIM_CharChr(u_165) in
                                                k prim_177_0'0 in
                                              let k [] uLET_169_0'0 =
                                                let lit_176_18'52 = 1 in
                                                uLET_169_0'0 lit_176_18'52 k in
                                              let k [] u_163 =
                                                let lam_175_0'0 = fun [u_163] f_164 k ->
                                                  let prim_174_0'0 = PRIM_SubInt(u_163,f_164) in
                                                  k prim_174_0'0 in
                                                k lam_175_0'0 in
                                              let k [u_155] uLET_170_0'0 = uLET_170_0'0 u_155 k in
                                              let k [] u_161 =
                                                let lam_173_0'0 = fun [u_161] f_162 k ->
                                                  let prim_172_0'0 = PRIM_AddInt(u_161,f_162) in
                                                  k prim_172_0'0 in
                                                k lam_173_0'0 in
                                              let u_160 = 'A' in
                                              let prim_171_0'0 = PRIM_CharOrd(u_160) in
                                              k prim_171_0'0 in
                                            let u_158 = '^' in
                                            let prim_168_0'0 = PRIM_PutChar(u_158) in
                                            k prim_168_0'0 in
                                        let u_157 = 26 in
                                        let prim_166_0'0 = PRIM_LessInt(u_157,u_155) in
                                        k prim_166_0'0 in
                                    let u_156 = '\n' in
                                    let prim_163_0'0 = PRIM_EqChar(u_153,u_156) in
                                    k prim_163_0'0 in
                                let u_152 = 8 in
                                let prim_159_0'0 = PRIM_CharChr(u_152) in
                                k prim_159_0'0
                              | false0 ->
                                let con_217_113'55 = Unit0 in
                                k con_217_113'55 in
                            let k [] uLET_154_0'0 =
                              let lit_158_113'28 = 26 in
                              uLET_154_0'0 lit_158_113'28 k in
                            let u_148 = PRIM_CharOrd(c_146_112'14) in
                            let lam_157_0'0 = fun [u_148] f_149 k ->
                              let u_150 = PRIM_LessInt(f_149,u_148) in
                              match u_150 with
                              | true1 ->
                                let con_155_4'12 = false0 in
                                k con_155_4'12
                              | false0 ->
                                let con_156_5'13 = true1 in
                                k con_156_5'13 in
                            k lam_157_0'0
                        | false0 ->
                          let k [acc_79_103'15,loop_80_103'10,u_82] u_256 =
                            let con_295_0'0 = Cons1[u_82,acc_79_103'15] in
                            loop_80_103'10 con_295_0'0 k in
                          let u_243 = 8 in
                          let u_244 = PRIM_CharOrd(u_82) in
                          let prim_276_0'0 = PRIM_EqInt(u_244,u_243) in
                          match prim_276_0'0 with
                          | true1 ->
                            let prim_277_0'0 = PRIM_PutChar(u_82) in
                            k prim_277_0'0
                          | false0 ->
                            let k [u_82,u_244] uLET_278_0'0 =
                              match uLET_278_0'0 with
                              | true1 ->
                                let prim_280_0'0 = PRIM_PutChar(u_82) in
                                k prim_280_0'0
                              | false0 ->
                                let k [u_82,u_244] uLET_281_0'0 =
                                  match uLET_281_0'0 with
                                  | true1 ->
                                    let prim_283_0'0 = PRIM_PutChar(u_82) in
                                    k prim_283_0'0
                                  | false0 ->
                                    let k [u_244] u_248 =
                                      let k [] u_255 =
                                        let prim_294_0'0 = PRIM_PutChar(u_255) in
                                        k prim_294_0'0 in
                                      let k [] u_254 =
                                        let prim_293_0'0 = PRIM_CharChr(u_254) in
                                        k prim_293_0'0 in
                                      let k [] uLET_285_0'0 =
                                        let lit_292_18'52 = 1 in
                                        uLET_285_0'0 lit_292_18'52 k in
                                      let k [] u_252 =
                                        let lam_291_0'0 = fun [u_252] f_253 k ->
                                          let prim_290_0'0 = PRIM_SubInt(u_252,f_253) in
                                          k prim_290_0'0 in
                                        k lam_291_0'0 in
                                      let k [u_244] uLET_286_0'0 = uLET_286_0'0 u_244 k in
                                      let k [] u_250 =
                                        let lam_289_0'0 = fun [u_250] f_251 k ->
                                          let prim_288_0'0 = PRIM_AddInt(u_250,f_251) in
                                          k prim_288_0'0 in
                                        k lam_289_0'0 in
                                      let u_249 = 'A' in
                                      let prim_287_0'0 = PRIM_CharOrd(u_249) in
                                      k prim_287_0'0 in
                                    let u_247 = '^' in
                                    let prim_284_0'0 = PRIM_PutChar(u_247) in
                                    k prim_284_0'0 in
                                let u_246 = 26 in
                                let prim_282_0'0 = PRIM_LessInt(u_246,u_244) in
                                k prim_282_0'0 in
                            let u_245 = '\n' in
                            let prim_279_0'0 = PRIM_EqChar(u_82,u_245) in
                            k prim_279_0'0 in
                      let u_145 = 127 in
                      let prim_152_0'0 = PRIM_EqInt(u_83,u_145) in
                      k prim_152_0'0 in
                  let u_144 = 127 in
                  let prim_150_0'0 = PRIM_LessInt(u_144,u_83) in
                  k prim_150_0'0 in
            let u_84 = '\n' in
            let prim_80_0'0 = PRIM_EqChar(u_82,u_84) in
            k prim_80_0'0 in
          let u_81 = Unit0 in
          let prim_78_0'0 = PRIM_GetChar(u_81) in
          k prim_78_0'0) in
        let con_296_119'7 = Nil0 in
        u_257 con_296_119'7 k in
      let u_77 = 4 in
      let prim_77_0'0 = PRIM_CharChr(u_77) in
      k prim_77_0'0 in
    let k [u_52] con_70_214'13 = u_52 con_70_214'13 k in
    let lit_71_214'13 = '>' in
    let k [lit_71_214'13] con_72_214'17 =
      let con_76_214'13 = Cons1[lit_71_214'13,con_72_214'17] in
      k con_76_214'13 in
    let lit_73_214'17 = ' ' in
    let con_74_214'20 = Nil0 in
    let con_75_214'17 = Cons1[lit_73_214'17,con_74_214'20] in
    k con_75_214'17) in
  let u_856 = Unit0 in
  let k [u_855] u_858 =
    let con_1006_221'11 = Unit0 in
    u_855 con_1006_221'11 k in
  let u_857 = "This is a shell prototype. Try: fib, fact, rev\n" in
  let prim_1005_0'0 = PRIM_Explode(u_857) in
  u_52 prim_1005_0'0 k in
let k [] uLET_65_0'0 =
  let con_69_166'31 = Nil0 in
  uLET_65_0'0 con_69_166'31 k in
let k [] u_70 =
  let lam_68_0'0 = fun [u_70] f_71 k ->
    let con_67_0'0 = Cons1[u_70,f_71] in
    k con_67_0'0 in
  k lam_68_0'0 in
let u_69 = 4 in
let prim_66_0'0 = PRIM_CharChr(u_69) in
k prim_66_0'0
