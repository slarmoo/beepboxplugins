(module $corruption.wasm
  (type (;0;) (func (param i32 i32 i32 i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param f64 f64 i32) (result f64)))
  (type (;6;) (func (param f64 i32) (result f64)))
  (type (;7;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param f64 i32) (result i32)))
  (type (;9;) (func (param f64) (result f64)))
  (type (;10;) (func (param f64 f64) (result f64)))
  (type (;11;) (func (result i32)))
  (type (;12;) (func (param i32 i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i64 i32 i64 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32 f64 i32 i32 i32) (result i32)))
  (type (;16;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;17;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (import "bpbxplug" "log" (func $bpbxplug_log (type 1)))
  (func $abort (type 2)
    unreachable)
  (func $sbrk (type 3) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=4096
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable)
  (func $malloc (type 3) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4124
                              local.tee 2
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=4572
                                local.tee 3
                                br_if 0 (;@14;)
                                i32.const 0
                                i64.const -1
                                i64.store offset=4584 align=4
                                i32.const 0
                                i64.const 281474976776192
                                i64.store offset=4576 align=4
                                i32.const 0
                                local.get 1
                                i32.const 8
                                i32.add
                                i32.const -16
                                i32.and
                                i32.const 1431655768
                                i32.xor
                                local.tee 3
                                i32.store offset=4572
                                i32.const 0
                                i32.const 0
                                i32.store offset=4592
                                i32.const 0
                                i32.const 0
                                i32.store offset=4544
                              end
                              i32.const 131072
                              i32.const 70272
                              i32.lt_u
                              br_if 1 (;@12;)
                              i32.const 0
                              local.set 2
                              i32.const 131072
                              i32.const 70272
                              i32.sub
                              i32.const 89
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 4
                              i32.const 0
                              i32.const 70272
                              i32.store offset=4548
                              i32.const 0
                              i32.const 70272
                              i32.store offset=4116
                              i32.const 0
                              local.get 3
                              i32.store offset=4136
                              i32.const 0
                              i32.const -1
                              i32.store offset=4132
                              i32.const 0
                              i32.const 131072
                              i32.const 70272
                              i32.sub
                              local.tee 3
                              i32.store offset=4552
                              i32.const 0
                              local.get 3
                              i32.store offset=4536
                              i32.const 0
                              local.get 3
                              i32.store offset=4532
                              loop  ;; label = @14
                                local.get 4
                                i32.const 4160
                                i32.add
                                local.get 4
                                i32.const 4148
                                i32.add
                                local.tee 3
                                i32.store
                                local.get 3
                                local.get 4
                                i32.const 4140
                                i32.add
                                local.tee 5
                                i32.store
                                local.get 4
                                i32.const 4152
                                i32.add
                                local.get 5
                                i32.store
                                local.get 4
                                i32.const 4168
                                i32.add
                                local.get 4
                                i32.const 4156
                                i32.add
                                local.tee 5
                                i32.store
                                local.get 5
                                local.get 3
                                i32.store
                                local.get 4
                                i32.const 4176
                                i32.add
                                local.get 4
                                i32.const 4164
                                i32.add
                                local.tee 3
                                i32.store
                                local.get 3
                                local.get 5
                                i32.store
                                local.get 4
                                i32.const 4172
                                i32.add
                                local.get 3
                                i32.store
                                local.get 4
                                i32.const 32
                                i32.add
                                local.tee 4
                                i32.const 256
                                i32.ne
                                br_if 0 (;@14;)
                              end
                              i32.const 131072
                              i32.const -52
                              i32.add
                              i32.const 56
                              i32.store
                              i32.const 0
                              i32.const 0
                              i32.load offset=4588
                              i32.store offset=4128
                              i32.const 0
                              i32.const 70272
                              i32.const -8
                              i32.const 70272
                              i32.sub
                              i32.const 15
                              i32.and
                              local.tee 4
                              i32.add
                              local.tee 2
                              i32.store offset=4124
                              i32.const 0
                              i32.const 131072
                              i32.const 70272
                              i32.sub
                              local.get 4
                              i32.sub
                              i32.const -56
                              i32.add
                              local.tee 4
                              i32.store offset=4112
                              local.get 2
                              local.get 4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.const 236
                                i32.gt_u
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  i32.const 0
                                  i32.load offset=4100
                                  local.tee 6
                                  i32.const 16
                                  local.get 0
                                  i32.const 19
                                  i32.add
                                  i32.const 496
                                  i32.and
                                  local.get 0
                                  i32.const 11
                                  i32.lt_u
                                  select
                                  local.tee 5
                                  i32.const 3
                                  i32.shr_u
                                  local.tee 3
                                  i32.shr_u
                                  local.tee 4
                                  i32.const 3
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 4
                                      i32.const 1
                                      i32.and
                                      local.get 3
                                      i32.or
                                      i32.const 1
                                      i32.xor
                                      local.tee 5
                                      i32.const 3
                                      i32.shl
                                      local.tee 3
                                      i32.const 4140
                                      i32.add
                                      local.tee 4
                                      local.get 3
                                      i32.const 4148
                                      i32.add
                                      i32.load
                                      local.tee 3
                                      i32.load offset=8
                                      local.tee 0
                                      i32.ne
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.get 6
                                      i32.const -2
                                      local.get 5
                                      i32.rotl
                                      i32.and
                                      i32.store offset=4100
                                      br 1 (;@16;)
                                    end
                                    local.get 4
                                    local.get 0
                                    i32.store offset=8
                                    local.get 0
                                    local.get 4
                                    i32.store offset=12
                                  end
                                  local.get 3
                                  i32.const 8
                                  i32.add
                                  local.set 4
                                  local.get 3
                                  local.get 5
                                  i32.const 3
                                  i32.shl
                                  local.tee 5
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  local.get 3
                                  local.get 5
                                  i32.add
                                  local.tee 3
                                  local.get 3
                                  i32.load offset=4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  br 14 (;@1;)
                                end
                                local.get 5
                                i32.const 0
                                i32.load offset=4108
                                local.tee 7
                                i32.le_u
                                br_if 1 (;@13;)
                                block  ;; label = @15
                                  local.get 4
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 4
                                      local.get 3
                                      i32.shl
                                      i32.const 2
                                      local.get 3
                                      i32.shl
                                      local.tee 4
                                      i32.const 0
                                      local.get 4
                                      i32.sub
                                      i32.or
                                      i32.and
                                      i32.ctz
                                      local.tee 3
                                      i32.const 3
                                      i32.shl
                                      local.tee 4
                                      i32.const 4140
                                      i32.add
                                      local.tee 0
                                      local.get 4
                                      i32.const 4148
                                      i32.add
                                      i32.load
                                      local.tee 4
                                      i32.load offset=8
                                      local.tee 8
                                      i32.ne
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.get 6
                                      i32.const -2
                                      local.get 3
                                      i32.rotl
                                      i32.and
                                      local.tee 6
                                      i32.store offset=4100
                                      br 1 (;@16;)
                                    end
                                    local.get 0
                                    local.get 8
                                    i32.store offset=8
                                    local.get 8
                                    local.get 0
                                    i32.store offset=12
                                  end
                                  local.get 4
                                  local.get 5
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  local.get 4
                                  local.get 3
                                  i32.const 3
                                  i32.shl
                                  local.tee 3
                                  i32.add
                                  local.get 3
                                  local.get 5
                                  i32.sub
                                  local.tee 0
                                  i32.store
                                  local.get 4
                                  local.get 5
                                  i32.add
                                  local.tee 8
                                  local.get 0
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  block  ;; label = @16
                                    local.get 7
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 7
                                    i32.const -8
                                    i32.and
                                    i32.const 4140
                                    i32.add
                                    local.set 5
                                    i32.const 0
                                    i32.load offset=4120
                                    local.set 3
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 6
                                        i32.const 1
                                        local.get 7
                                        i32.const 3
                                        i32.shr_u
                                        i32.shl
                                        local.tee 9
                                        i32.and
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        local.get 6
                                        local.get 9
                                        i32.or
                                        i32.store offset=4100
                                        local.get 5
                                        local.set 9
                                        br 1 (;@17;)
                                      end
                                      local.get 5
                                      i32.load offset=8
                                      local.set 9
                                    end
                                    local.get 9
                                    local.get 3
                                    i32.store offset=12
                                    local.get 5
                                    local.get 3
                                    i32.store offset=8
                                    local.get 3
                                    local.get 5
                                    i32.store offset=12
                                    local.get 3
                                    local.get 9
                                    i32.store offset=8
                                  end
                                  local.get 4
                                  i32.const 8
                                  i32.add
                                  local.set 4
                                  i32.const 0
                                  local.get 8
                                  i32.store offset=4120
                                  i32.const 0
                                  local.get 0
                                  i32.store offset=4108
                                  br 14 (;@1;)
                                end
                                i32.const 0
                                i32.load offset=4104
                                local.tee 10
                                i32.eqz
                                br_if 1 (;@13;)
                                local.get 10
                                i32.ctz
                                i32.const 2
                                i32.shl
                                i32.const 4404
                                i32.add
                                i32.load
                                local.tee 8
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 5
                                i32.sub
                                local.set 3
                                local.get 8
                                local.set 0
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load offset=16
                                      local.tee 4
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.load offset=20
                                      local.tee 4
                                      i32.eqz
                                      br_if 2 (;@15;)
                                    end
                                    local.get 4
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 5
                                    i32.sub
                                    local.tee 0
                                    local.get 3
                                    local.get 0
                                    local.get 3
                                    i32.lt_u
                                    local.tee 0
                                    select
                                    local.set 3
                                    local.get 4
                                    local.get 8
                                    local.get 0
                                    select
                                    local.set 8
                                    local.get 4
                                    local.set 0
                                    br 0 (;@16;)
                                  end
                                end
                                local.get 8
                                i32.load offset=24
                                local.set 2
                                block  ;; label = @15
                                  local.get 8
                                  i32.load offset=12
                                  local.tee 4
                                  local.get 8
                                  i32.eq
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.load offset=8
                                  local.tee 0
                                  local.get 4
                                  i32.store offset=12
                                  local.get 4
                                  local.get 0
                                  i32.store offset=8
                                  br 13 (;@2;)
                                end
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 8
                                    i32.load offset=20
                                    local.tee 0
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 8
                                    i32.const 20
                                    i32.add
                                    local.set 9
                                    br 1 (;@15;)
                                  end
                                  local.get 8
                                  i32.load offset=16
                                  local.tee 0
                                  i32.eqz
                                  br_if 4 (;@11;)
                                  local.get 8
                                  i32.const 16
                                  i32.add
                                  local.set 9
                                end
                                loop  ;; label = @15
                                  local.get 9
                                  local.set 11
                                  local.get 0
                                  local.tee 4
                                  i32.const 20
                                  i32.add
                                  local.set 9
                                  local.get 4
                                  i32.load offset=20
                                  local.tee 0
                                  br_if 0 (;@15;)
                                  local.get 4
                                  i32.const 16
                                  i32.add
                                  local.set 9
                                  local.get 4
                                  i32.load offset=16
                                  local.tee 0
                                  br_if 0 (;@15;)
                                end
                                local.get 11
                                i32.const 0
                                i32.store
                                br 12 (;@2;)
                              end
                              i32.const -1
                              local.set 5
                              local.get 0
                              i32.const -65
                              i32.gt_u
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 19
                              i32.add
                              local.tee 4
                              i32.const -16
                              i32.and
                              local.set 5
                              i32.const 0
                              i32.load offset=4104
                              local.tee 10
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 31
                              local.set 7
                              block  ;; label = @14
                                local.get 0
                                i32.const 16777196
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 38
                                local.get 4
                                i32.const 8
                                i32.shr_u
                                i32.clz
                                local.tee 4
                                i32.sub
                                i32.shr_u
                                i32.const 1
                                i32.and
                                local.get 4
                                i32.const 1
                                i32.shl
                                i32.sub
                                i32.const 62
                                i32.add
                                local.set 7
                              end
                              i32.const 0
                              local.get 5
                              i32.sub
                              local.set 3
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 7
                                      i32.const 2
                                      i32.shl
                                      i32.const 4404
                                      i32.add
                                      i32.load
                                      local.tee 0
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 4
                                      i32.const 0
                                      local.set 9
                                      br 1 (;@16;)
                                    end
                                    i32.const 0
                                    local.set 4
                                    local.get 5
                                    i32.const 0
                                    i32.const 25
                                    local.get 7
                                    i32.const 1
                                    i32.shr_u
                                    i32.sub
                                    local.get 7
                                    i32.const 31
                                    i32.eq
                                    select
                                    i32.shl
                                    local.set 8
                                    i32.const 0
                                    local.set 9
                                    loop  ;; label = @17
                                      block  ;; label = @18
                                        local.get 0
                                        i32.load offset=4
                                        i32.const -8
                                        i32.and
                                        local.get 5
                                        i32.sub
                                        local.tee 6
                                        local.get 3
                                        i32.ge_u
                                        br_if 0 (;@18;)
                                        local.get 6
                                        local.set 3
                                        local.get 0
                                        local.set 9
                                        local.get 6
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        local.set 3
                                        local.get 0
                                        local.set 9
                                        local.get 0
                                        local.set 4
                                        br 3 (;@15;)
                                      end
                                      local.get 4
                                      local.get 0
                                      i32.load offset=20
                                      local.tee 6
                                      local.get 6
                                      local.get 0
                                      local.get 8
                                      i32.const 29
                                      i32.shr_u
                                      i32.const 4
                                      i32.and
                                      i32.add
                                      i32.load offset=16
                                      local.tee 11
                                      i32.eq
                                      select
                                      local.get 4
                                      local.get 6
                                      select
                                      local.set 4
                                      local.get 8
                                      i32.const 1
                                      i32.shl
                                      local.set 8
                                      local.get 11
                                      local.set 0
                                      local.get 11
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  block  ;; label = @16
                                    local.get 4
                                    local.get 9
                                    i32.or
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 9
                                    i32.const 2
                                    local.get 7
                                    i32.shl
                                    local.tee 4
                                    i32.const 0
                                    local.get 4
                                    i32.sub
                                    i32.or
                                    local.get 10
                                    i32.and
                                    local.tee 4
                                    i32.eqz
                                    br_if 3 (;@13;)
                                    local.get 4
                                    i32.ctz
                                    i32.const 2
                                    i32.shl
                                    i32.const 4404
                                    i32.add
                                    i32.load
                                    local.set 4
                                  end
                                  local.get 4
                                  i32.eqz
                                  br_if 1 (;@14;)
                                end
                                loop  ;; label = @15
                                  local.get 4
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 5
                                  i32.sub
                                  local.tee 6
                                  local.get 3
                                  i32.lt_u
                                  local.set 8
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=16
                                    local.tee 0
                                    br_if 0 (;@16;)
                                    local.get 4
                                    i32.load offset=20
                                    local.set 0
                                  end
                                  local.get 6
                                  local.get 3
                                  local.get 8
                                  select
                                  local.set 3
                                  local.get 4
                                  local.get 9
                                  local.get 8
                                  select
                                  local.set 9
                                  local.get 0
                                  local.set 4
                                  local.get 0
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 9
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 3
                              i32.const 0
                              i32.load offset=4108
                              local.get 5
                              i32.sub
                              i32.ge_u
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=24
                              local.set 11
                              block  ;; label = @14
                                local.get 9
                                i32.load offset=12
                                local.tee 4
                                local.get 9
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 9
                                i32.load offset=8
                                local.tee 0
                                local.get 4
                                i32.store offset=12
                                local.get 4
                                local.get 0
                                i32.store offset=8
                                br 11 (;@3;)
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 9
                                  i32.load offset=20
                                  local.tee 0
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 9
                                  i32.const 20
                                  i32.add
                                  local.set 8
                                  br 1 (;@14;)
                                end
                                local.get 9
                                i32.load offset=16
                                local.tee 0
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 9
                                i32.const 16
                                i32.add
                                local.set 8
                              end
                              loop  ;; label = @14
                                local.get 8
                                local.set 6
                                local.get 0
                                local.tee 4
                                i32.const 20
                                i32.add
                                local.set 8
                                local.get 4
                                i32.load offset=20
                                local.tee 0
                                br_if 0 (;@14;)
                                local.get 4
                                i32.const 16
                                i32.add
                                local.set 8
                                local.get 4
                                i32.load offset=16
                                local.tee 0
                                br_if 0 (;@14;)
                              end
                              local.get 6
                              i32.const 0
                              i32.store
                              br 10 (;@3;)
                            end
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4108
                              local.tee 4
                              local.get 5
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=4120
                              local.set 3
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  local.get 5
                                  i32.sub
                                  local.tee 0
                                  i32.const 16
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 3
                                  local.get 5
                                  i32.add
                                  local.tee 8
                                  local.get 0
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  local.get 3
                                  local.get 4
                                  i32.add
                                  local.get 0
                                  i32.store
                                  local.get 3
                                  local.get 5
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  br 1 (;@14;)
                                end
                                local.get 3
                                local.get 4
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 3
                                local.get 4
                                i32.add
                                local.tee 4
                                local.get 4
                                i32.load offset=4
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                i32.const 0
                                local.set 8
                                i32.const 0
                                local.set 0
                              end
                              i32.const 0
                              local.get 0
                              i32.store offset=4108
                              i32.const 0
                              local.get 8
                              i32.store offset=4120
                              local.get 3
                              i32.const 8
                              i32.add
                              local.set 4
                              br 12 (;@1;)
                            end
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4112
                              local.tee 0
                              local.get 5
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 2
                              local.get 5
                              i32.add
                              local.tee 4
                              local.get 0
                              local.get 5
                              i32.sub
                              local.tee 3
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.get 4
                              i32.store offset=4124
                              i32.const 0
                              local.get 3
                              i32.store offset=4112
                              local.get 2
                              local.get 5
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 2
                              i32.const 8
                              i32.add
                              local.set 4
                              br 12 (;@1;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=4572
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load offset=4580
                                local.set 3
                                br 1 (;@13;)
                              end
                              i32.const 0
                              i64.const -1
                              i64.store offset=4584 align=4
                              i32.const 0
                              i64.const 281474976776192
                              i64.store offset=4576 align=4
                              i32.const 0
                              local.get 1
                              i32.const 12
                              i32.add
                              i32.const -16
                              i32.and
                              i32.const 1431655768
                              i32.xor
                              i32.store offset=4572
                              i32.const 0
                              i32.const 0
                              i32.store offset=4592
                              i32.const 0
                              i32.const 0
                              i32.store offset=4544
                              i32.const 65536
                              local.set 3
                            end
                            i32.const 0
                            local.set 4
                            block  ;; label = @13
                              local.get 3
                              local.get 5
                              i32.const 71
                              i32.add
                              local.tee 11
                              i32.add
                              local.tee 8
                              i32.const 0
                              local.get 3
                              i32.sub
                              local.tee 6
                              i32.and
                              local.tee 9
                              local.get 5
                              i32.gt_u
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 48
                              i32.store offset=4096
                              br 12 (;@1;)
                            end
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4540
                              local.tee 4
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=4532
                                local.tee 3
                                local.get 9
                                i32.add
                                local.tee 7
                                local.get 3
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 7
                                local.get 4
                                i32.le_u
                                br_if 1 (;@13;)
                              end
                              i32.const 0
                              local.set 4
                              i32.const 0
                              i32.const 48
                              i32.store offset=4096
                              br 12 (;@1;)
                            end
                            i32.const 0
                            i32.load8_u offset=4544
                            i32.const 4
                            i32.and
                            br_if 5 (;@7;)
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 4548
                                  local.set 4
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 2
                                      local.get 4
                                      i32.load
                                      local.tee 3
                                      i32.lt_u
                                      br_if 0 (;@17;)
                                      local.get 2
                                      local.get 3
                                      local.get 4
                                      i32.load offset=4
                                      i32.add
                                      i32.lt_u
                                      br_if 3 (;@14;)
                                    end
                                    local.get 4
                                    i32.load offset=8
                                    local.tee 4
                                    br_if 0 (;@16;)
                                  end
                                end
                                i32.const 0
                                call $sbrk
                                local.tee 8
                                i32.const -1
                                i32.eq
                                br_if 6 (;@8;)
                                local.get 9
                                local.set 6
                                block  ;; label = @15
                                  i32.const 0
                                  i32.load offset=4576
                                  local.tee 4
                                  i32.const -1
                                  i32.add
                                  local.tee 3
                                  local.get 8
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 9
                                  local.get 8
                                  i32.sub
                                  local.get 3
                                  local.get 8
                                  i32.add
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.and
                                  i32.add
                                  local.set 6
                                end
                                local.get 6
                                local.get 5
                                i32.le_u
                                br_if 6 (;@8;)
                                local.get 6
                                i32.const 2147483646
                                i32.gt_u
                                br_if 6 (;@8;)
                                block  ;; label = @15
                                  i32.const 0
                                  i32.load offset=4540
                                  local.tee 4
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  i32.load offset=4532
                                  local.tee 3
                                  local.get 6
                                  i32.add
                                  local.tee 0
                                  local.get 3
                                  i32.le_u
                                  br_if 7 (;@8;)
                                  local.get 0
                                  local.get 4
                                  i32.gt_u
                                  br_if 7 (;@8;)
                                end
                                local.get 6
                                call $sbrk
                                local.tee 4
                                local.get 8
                                i32.ne
                                br_if 1 (;@13;)
                                br 8 (;@6;)
                              end
                              local.get 8
                              local.get 0
                              i32.sub
                              local.get 6
                              i32.and
                              local.tee 6
                              i32.const 2147483646
                              i32.gt_u
                              br_if 5 (;@8;)
                              local.get 6
                              call $sbrk
                              local.tee 8
                              local.get 4
                              i32.load
                              local.get 4
                              i32.load offset=4
                              i32.add
                              i32.eq
                              br_if 4 (;@9;)
                              local.get 8
                              local.set 4
                            end
                            block  ;; label = @13
                              local.get 6
                              local.get 5
                              i32.const 72
                              i32.add
                              i32.ge_u
                              br_if 0 (;@13;)
                              local.get 4
                              i32.const -1
                              i32.eq
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                local.get 11
                                local.get 6
                                i32.sub
                                i32.const 0
                                i32.load offset=4580
                                local.tee 3
                                i32.add
                                i32.const 0
                                local.get 3
                                i32.sub
                                i32.and
                                local.tee 3
                                i32.const 2147483646
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 4
                                local.set 8
                                br 8 (;@6;)
                              end
                              block  ;; label = @14
                                local.get 3
                                call $sbrk
                                i32.const -1
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 3
                                local.get 6
                                i32.add
                                local.set 6
                                local.get 4
                                local.set 8
                                br 8 (;@6;)
                              end
                              i32.const 0
                              local.get 6
                              i32.sub
                              call $sbrk
                              drop
                              br 5 (;@8;)
                            end
                            local.get 4
                            local.set 8
                            local.get 4
                            i32.const -1
                            i32.ne
                            br_if 6 (;@6;)
                            br 4 (;@8;)
                          end
                          unreachable
                        end
                        i32.const 0
                        local.set 4
                        br 8 (;@2;)
                      end
                      i32.const 0
                      local.set 4
                      br 6 (;@3;)
                    end
                    local.get 8
                    i32.const -1
                    i32.ne
                    br_if 2 (;@6;)
                  end
                  i32.const 0
                  i32.const 0
                  i32.load offset=4544
                  i32.const 4
                  i32.or
                  i32.store offset=4544
                end
                local.get 9
                i32.const 2147483646
                i32.gt_u
                br_if 1 (;@5;)
                local.get 9
                call $sbrk
                local.set 8
                i32.const 0
                call $sbrk
                local.set 4
                local.get 8
                i32.const -1
                i32.eq
                br_if 1 (;@5;)
                local.get 4
                i32.const -1
                i32.eq
                br_if 1 (;@5;)
                local.get 8
                local.get 4
                i32.ge_u
                br_if 1 (;@5;)
                local.get 4
                local.get 8
                i32.sub
                local.tee 6
                local.get 5
                i32.const 56
                i32.add
                i32.le_u
                br_if 1 (;@5;)
              end
              i32.const 0
              i32.const 0
              i32.load offset=4532
              local.get 6
              i32.add
              local.tee 4
              i32.store offset=4532
              block  ;; label = @6
                local.get 4
                i32.const 0
                i32.load offset=4536
                i32.le_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 4
                i32.store offset=4536
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=4124
                      local.tee 3
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 4548
                      local.set 4
                      loop  ;; label = @10
                        local.get 8
                        local.get 4
                        i32.load
                        local.tee 0
                        local.get 4
                        i32.load offset=4
                        local.tee 9
                        i32.add
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 4
                        i32.load offset=8
                        local.tee 4
                        br_if 0 (;@10;)
                        br 3 (;@7;)
                      end
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4116
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 8
                        local.get 4
                        i32.ge_u
                        br_if 1 (;@9;)
                      end
                      i32.const 0
                      local.get 8
                      i32.store offset=4116
                    end
                    i32.const 0
                    local.set 4
                    i32.const 0
                    local.get 6
                    i32.store offset=4552
                    i32.const 0
                    local.get 8
                    i32.store offset=4548
                    i32.const 0
                    i32.const -1
                    i32.store offset=4132
                    i32.const 0
                    i32.const 0
                    i32.load offset=4572
                    i32.store offset=4136
                    i32.const 0
                    i32.const 0
                    i32.store offset=4560
                    loop  ;; label = @9
                      local.get 4
                      i32.const 4160
                      i32.add
                      local.get 4
                      i32.const 4148
                      i32.add
                      local.tee 3
                      i32.store
                      local.get 3
                      local.get 4
                      i32.const 4140
                      i32.add
                      local.tee 0
                      i32.store
                      local.get 4
                      i32.const 4152
                      i32.add
                      local.get 0
                      i32.store
                      local.get 4
                      i32.const 4168
                      i32.add
                      local.get 4
                      i32.const 4156
                      i32.add
                      local.tee 0
                      i32.store
                      local.get 0
                      local.get 3
                      i32.store
                      local.get 4
                      i32.const 4176
                      i32.add
                      local.get 4
                      i32.const 4164
                      i32.add
                      local.tee 3
                      i32.store
                      local.get 3
                      local.get 0
                      i32.store
                      local.get 4
                      i32.const 4172
                      i32.add
                      local.get 3
                      i32.store
                      local.get 4
                      i32.const 32
                      i32.add
                      local.tee 4
                      i32.const 256
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    i32.const -8
                    local.get 8
                    i32.sub
                    i32.const 15
                    i32.and
                    local.tee 4
                    i32.add
                    local.tee 3
                    local.get 6
                    i32.const -56
                    i32.add
                    local.tee 0
                    local.get 4
                    i32.sub
                    local.tee 4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=4588
                    i32.store offset=4128
                    i32.const 0
                    local.get 4
                    i32.store offset=4112
                    i32.const 0
                    local.get 3
                    i32.store offset=4124
                    local.get 8
                    local.get 0
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    br 2 (;@6;)
                  end
                  local.get 3
                  local.get 8
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 0
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 4
                  i32.load offset=12
                  i32.const 8
                  i32.and
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const -8
                  local.get 3
                  i32.sub
                  i32.const 15
                  i32.and
                  local.tee 0
                  i32.add
                  local.tee 8
                  i32.const 0
                  i32.load offset=4112
                  local.get 6
                  i32.add
                  local.tee 11
                  local.get 0
                  i32.sub
                  local.tee 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 4
                  local.get 9
                  local.get 6
                  i32.add
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=4588
                  i32.store offset=4128
                  i32.const 0
                  local.get 0
                  i32.store offset=4112
                  i32.const 0
                  local.get 8
                  i32.store offset=4124
                  local.get 3
                  local.get 11
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 8
                  i32.const 0
                  i32.load offset=4116
                  i32.ge_u
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 8
                  i32.store offset=4116
                end
                local.get 8
                local.get 6
                i32.add
                local.set 0
                i32.const 4548
                local.set 4
                block  ;; label = @7
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 4
                      i32.load
                      local.tee 9
                      local.get 0
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 4
                      i32.load offset=8
                      local.tee 4
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                  end
                  local.get 4
                  i32.load8_u offset=12
                  i32.const 8
                  i32.and
                  i32.eqz
                  br_if 3 (;@4;)
                end
                i32.const 4548
                local.set 4
                block  ;; label = @7
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      local.get 4
                      i32.load
                      local.tee 0
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 3
                      local.get 0
                      local.get 4
                      i32.load offset=4
                      i32.add
                      local.tee 0
                      i32.lt_u
                      br_if 2 (;@7;)
                    end
                    local.get 4
                    i32.load offset=8
                    local.set 4
                    br 0 (;@8;)
                  end
                end
                local.get 8
                i32.const -8
                local.get 8
                i32.sub
                i32.const 15
                i32.and
                local.tee 4
                i32.add
                local.tee 11
                local.get 6
                i32.const -56
                i32.add
                local.tee 9
                local.get 4
                i32.sub
                local.tee 4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 8
                local.get 9
                i32.add
                i32.const 56
                i32.store offset=4
                local.get 3
                local.get 0
                i32.const 55
                local.get 0
                i32.sub
                i32.const 15
                i32.and
                i32.add
                i32.const -63
                i32.add
                local.tee 9
                local.get 9
                local.get 3
                i32.const 16
                i32.add
                i32.lt_u
                select
                local.tee 9
                i32.const 35
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=4588
                i32.store offset=4128
                i32.const 0
                local.get 4
                i32.store offset=4112
                i32.const 0
                local.get 11
                i32.store offset=4124
                local.get 9
                i32.const 16
                i32.add
                i32.const 0
                i64.load offset=4556 align=4
                i64.store align=4
                local.get 9
                i32.const 0
                i64.load offset=4548 align=4
                i64.store offset=8 align=4
                i32.const 0
                local.get 9
                i32.const 8
                i32.add
                i32.store offset=4556
                i32.const 0
                local.get 6
                i32.store offset=4552
                i32.const 0
                local.get 8
                i32.store offset=4548
                i32.const 0
                i32.const 0
                i32.store offset=4560
                local.get 9
                i32.const 36
                i32.add
                local.set 4
                loop  ;; label = @7
                  local.get 4
                  i32.const 7
                  i32.store
                  local.get 4
                  i32.const 4
                  i32.add
                  local.tee 4
                  local.get 0
                  i32.lt_u
                  br_if 0 (;@7;)
                end
                local.get 9
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 9
                local.get 9
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 9
                local.get 9
                local.get 3
                i32.sub
                local.tee 8
                i32.store
                local.get 3
                local.get 8
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 8
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 8
                    i32.const -8
                    i32.and
                    i32.const 4140
                    i32.add
                    local.set 4
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4100
                        local.tee 0
                        i32.const 1
                        local.get 8
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 8
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 0
                        local.get 8
                        i32.or
                        i32.store offset=4100
                        local.get 4
                        local.set 0
                        br 1 (;@9;)
                      end
                      local.get 4
                      i32.load offset=8
                      local.set 0
                    end
                    local.get 0
                    local.get 3
                    i32.store offset=12
                    local.get 4
                    local.get 3
                    i32.store offset=8
                    i32.const 12
                    local.set 8
                    i32.const 8
                    local.set 9
                    br 1 (;@7;)
                  end
                  i32.const 31
                  local.set 4
                  block  ;; label = @8
                    local.get 8
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 8
                    i32.const 38
                    local.get 8
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 4
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 4
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 4
                  end
                  local.get 3
                  local.get 4
                  i32.store offset=28
                  local.get 3
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 4
                  i32.const 2
                  i32.shl
                  i32.const 4404
                  i32.add
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4104
                        local.tee 9
                        i32.const 1
                        local.get 4
                        i32.shl
                        local.tee 6
                        i32.and
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 3
                        i32.store
                        i32.const 0
                        local.get 9
                        local.get 6
                        i32.or
                        i32.store offset=4104
                        local.get 3
                        local.get 0
                        i32.store offset=24
                        br 1 (;@9;)
                      end
                      local.get 8
                      i32.const 0
                      i32.const 25
                      local.get 4
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 4
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 4
                      local.get 0
                      i32.load
                      local.set 9
                      loop  ;; label = @10
                        local.get 9
                        local.tee 0
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 8
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 4
                        i32.const 29
                        i32.shr_u
                        local.set 9
                        local.get 4
                        i32.const 1
                        i32.shl
                        local.set 4
                        local.get 0
                        local.get 9
                        i32.const 4
                        i32.and
                        i32.add
                        local.tee 6
                        i32.load offset=16
                        local.tee 9
                        br_if 0 (;@10;)
                      end
                      local.get 6
                      i32.const 16
                      i32.add
                      local.get 3
                      i32.store
                      local.get 3
                      local.get 0
                      i32.store offset=24
                    end
                    i32.const 8
                    local.set 8
                    i32.const 12
                    local.set 9
                    local.get 3
                    local.set 0
                    local.get 3
                    local.set 4
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.set 4
                  local.get 0
                  local.get 3
                  i32.store offset=8
                  local.get 4
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 4
                  i32.store offset=8
                  i32.const 0
                  local.set 4
                  i32.const 24
                  local.set 8
                  i32.const 12
                  local.set 9
                end
                local.get 3
                local.get 9
                i32.add
                local.get 0
                i32.store
                local.get 3
                local.get 8
                i32.add
                local.get 4
                i32.store
              end
              i32.const 0
              i32.load offset=4112
              local.tee 4
              local.get 5
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=4124
              local.tee 3
              local.get 5
              i32.add
              local.tee 0
              local.get 4
              local.get 5
              i32.sub
              local.tee 4
              i32.const 1
              i32.or
              i32.store offset=4
              i32.const 0
              local.get 4
              i32.store offset=4112
              i32.const 0
              local.get 0
              i32.store offset=4124
              local.get 3
              local.get 5
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 3
              i32.const 8
              i32.add
              local.set 4
              br 4 (;@1;)
            end
            i32.const 0
            local.set 4
            i32.const 0
            i32.const 48
            i32.store offset=4096
            br 3 (;@1;)
          end
          local.get 4
          local.get 8
          i32.store
          local.get 4
          local.get 4
          i32.load offset=4
          local.get 6
          i32.add
          i32.store offset=4
          local.get 8
          local.get 9
          local.get 5
          call $prepend_alloc
          local.set 4
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 8
              i32.const 2
              i32.shl
              i32.const 4404
              i32.add
              local.tee 0
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.get 4
              i32.store
              local.get 4
              br_if 1 (;@4;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 8
              i32.rotl
              i32.and
              local.tee 10
              i32.store offset=4104
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 11
                i32.load offset=16
                local.get 9
                i32.ne
                br_if 0 (;@6;)
                local.get 11
                local.get 4
                i32.store offset=16
                br 1 (;@5;)
              end
              local.get 11
              local.get 4
              i32.store offset=20
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 4
          local.get 11
          i32.store offset=24
          block  ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 4
            i32.store offset=24
          end
          local.get 9
          i32.load offset=20
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 0
          i32.store offset=20
          local.get 0
          local.get 4
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 9
            local.get 3
            local.get 5
            i32.or
            local.tee 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 4
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 9
          local.get 5
          i32.add
          local.tee 8
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 9
          local.get 5
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -8
            i32.and
            i32.const 4140
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=4100
                local.tee 5
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 3
                i32.or
                i32.store offset=4100
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 3
            end
            local.get 3
            local.get 8
            i32.store offset=12
            local.get 4
            local.get 8
            i32.store offset=8
            local.get 8
            local.get 4
            i32.store offset=12
            local.get 8
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 4
          block  ;; label = @4
            local.get 3
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 4
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 4
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 4
          end
          local.get 8
          local.get 4
          i32.store offset=28
          local.get 8
          i64.const 0
          i64.store offset=16 align=4
          local.get 4
          i32.const 2
          i32.shl
          i32.const 4404
          i32.add
          local.set 5
          block  ;; label = @4
            local.get 10
            i32.const 1
            local.get 4
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            local.get 5
            local.get 8
            i32.store
            i32.const 0
            local.get 10
            local.get 0
            i32.or
            i32.store offset=4104
            local.get 8
            local.get 5
            i32.store offset=24
            local.get 8
            local.get 8
            i32.store offset=8
            local.get 8
            local.get 8
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 4
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 4
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 4
          local.get 5
          i32.load
          local.set 0
          block  ;; label = @4
            loop  ;; label = @5
              local.get 0
              local.tee 5
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 29
              i32.shr_u
              local.set 0
              local.get 4
              i32.const 1
              i32.shl
              local.set 4
              local.get 5
              local.get 0
              i32.const 4
              i32.and
              i32.add
              local.tee 6
              i32.load offset=16
              local.tee 0
              br_if 0 (;@5;)
            end
            local.get 6
            i32.const 16
            i32.add
            local.get 8
            i32.store
            local.get 8
            local.get 5
            i32.store offset=24
            local.get 8
            local.get 8
            i32.store offset=12
            local.get 8
            local.get 8
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=8
          local.tee 4
          local.get 8
          i32.store offset=12
          local.get 5
          local.get 8
          i32.store offset=8
          local.get 8
          i32.const 0
          i32.store offset=24
          local.get 8
          local.get 5
          i32.store offset=12
          local.get 8
          local.get 4
          i32.store offset=8
        end
        local.get 9
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            local.get 8
            i32.load offset=28
            local.tee 9
            i32.const 2
            i32.shl
            i32.const 4404
            i32.add
            local.tee 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store
            local.get 4
            br_if 1 (;@3;)
            i32.const 0
            local.get 10
            i32.const -2
            local.get 9
            i32.rotl
            i32.and
            i32.store offset=4104
            br 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.get 8
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 4
              i32.store offset=16
              br 1 (;@4;)
            end
            local.get 2
            local.get 4
            i32.store offset=20
          end
          local.get 4
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 4
        local.get 2
        i32.store offset=24
        block  ;; label = @3
          local.get 8
          i32.load offset=16
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 0
          i32.store offset=16
          local.get 0
          local.get 4
          i32.store offset=24
        end
        local.get 8
        i32.load offset=20
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 0
        i32.store offset=20
        local.get 0
        local.get 4
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 8
          local.get 3
          local.get 5
          i32.or
          local.tee 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 8
        local.get 5
        i32.add
        local.tee 0
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 8
        local.get 5
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 0
        local.get 3
        i32.add
        local.get 3
        i32.store
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          i32.const -8
          i32.and
          i32.const 4140
          i32.add
          local.set 5
          i32.const 0
          i32.load offset=4120
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 7
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 9
              local.get 6
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 9
              local.get 6
              i32.or
              i32.store offset=4100
              local.get 5
              local.set 9
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.set 9
          end
          local.get 9
          local.get 4
          i32.store offset=12
          local.get 5
          local.get 4
          i32.store offset=8
          local.get 4
          local.get 5
          i32.store offset=12
          local.get 4
          local.get 9
          i32.store offset=8
        end
        i32.const 0
        local.get 0
        i32.store offset=4120
        i32.const 0
        local.get 3
        i32.store offset=4108
      end
      local.get 8
      i32.const 8
      i32.add
      local.set 4
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $prepend_alloc (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    local.get 0
    i32.sub
    i32.const 15
    i32.and
    i32.add
    local.tee 3
    local.get 2
    i32.const 3
    i32.or
    i32.store offset=4
    local.get 1
    i32.const -8
    local.get 1
    i32.sub
    i32.const 15
    i32.and
    i32.add
    local.tee 4
    local.get 3
    local.get 2
    i32.add
    local.tee 5
    i32.sub
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=4124
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=4124
        i32.const 0
        i32.const 0
        i32.load offset=4112
        local.get 0
        i32.add
        local.tee 2
        i32.store offset=4112
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=4120
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=4120
        i32.const 0
        i32.const 0
        i32.load offset=4108
        local.get 0
        i32.add
        local.tee 2
        i32.store offset=4108
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 2
        i32.add
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.load offset=4
        local.tee 1
        i32.const 3
        i32.and
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        local.set 6
        local.get 4
        i32.load offset=12
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 2
              local.get 4
              i32.load offset=8
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=4100
              i32.const -2
              local.get 1
              i32.const 3
              i32.shr_u
              i32.rotl
              i32.and
              i32.store offset=4100
              br 2 (;@3;)
            end
            local.get 2
            local.get 7
            i32.store offset=8
            local.get 7
            local.get 2
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=24
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              local.get 4
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=8
              local.tee 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load offset=20
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 20
                  i32.add
                  local.set 7
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 1 (;@5;)
                local.get 4
                i32.const 16
                i32.add
                local.set 7
              end
              loop  ;; label = @6
                local.get 7
                local.set 9
                local.get 1
                local.tee 2
                i32.const 20
                i32.add
                local.set 7
                local.get 2
                i32.load offset=20
                local.tee 1
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.set 7
                local.get 2
                i32.load offset=16
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 9
              i32.const 0
              i32.store
              br 1 (;@4;)
            end
            i32.const 0
            local.set 2
          end
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              local.get 4
              i32.load offset=28
              local.tee 7
              i32.const 2
              i32.shl
              i32.const 4404
              i32.add
              local.tee 1
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=4104
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              i32.store offset=4104
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                i32.load offset=16
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                local.get 8
                local.get 2
                i32.store offset=16
                br 1 (;@5;)
              end
              local.get 8
              local.get 2
              i32.store offset=20
            end
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 8
          i32.store offset=24
          block  ;; label = @4
            local.get 4
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 2
            i32.store offset=24
          end
          local.get 4
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.store offset=20
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 6
        local.get 0
        i32.add
        local.set 0
        local.get 4
        local.get 6
        i32.add
        local.tee 4
        i32.load offset=4
        local.set 1
      end
      local.get 4
      local.get 1
      i32.const -2
      i32.and
      i32.store offset=4
      local.get 5
      local.get 0
      i32.add
      local.get 0
      i32.store
      local.get 5
      local.get 0
      i32.const 1
      i32.or
      i32.store offset=4
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 4140
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=4100
            local.tee 1
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            local.get 0
            i32.or
            i32.store offset=4100
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 5
        i32.store offset=12
        local.get 2
        local.get 5
        i32.store offset=8
        local.get 5
        local.get 2
        i32.store offset=12
        local.get 5
        local.get 0
        i32.store offset=8
        br 1 (;@1;)
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 5
      local.get 2
      i32.store offset=28
      local.get 5
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 4404
      i32.add
      local.set 1
      block  ;; label = @2
        i32.const 0
        i32.load offset=4104
        local.tee 7
        i32.const 1
        local.get 2
        i32.shl
        local.tee 4
        i32.and
        br_if 0 (;@2;)
        local.get 1
        local.get 5
        i32.store
        i32.const 0
        local.get 7
        local.get 4
        i32.or
        i32.store offset=4104
        local.get 5
        local.get 1
        i32.store offset=24
        local.get 5
        local.get 5
        i32.store offset=8
        local.get 5
        local.get 5
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.const 25
      local.get 2
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 2
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 2
      local.get 1
      i32.load
      local.set 7
      block  ;; label = @2
        loop  ;; label = @3
          local.get 7
          local.tee 1
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 0
          i32.eq
          br_if 1 (;@2;)
          local.get 2
          i32.const 29
          i32.shr_u
          local.set 7
          local.get 2
          i32.const 1
          i32.shl
          local.set 2
          local.get 1
          local.get 7
          i32.const 4
          i32.and
          i32.add
          local.tee 4
          i32.load offset=16
          local.tee 7
          br_if 0 (;@3;)
        end
        local.get 4
        i32.const 16
        i32.add
        local.get 5
        i32.store
        local.get 5
        local.get 1
        i32.store offset=24
        local.get 5
        local.get 5
        i32.store offset=12
        local.get 5
        local.get 5
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=8
      local.tee 2
      local.get 5
      i32.store offset=12
      local.get 1
      local.get 5
      i32.store offset=8
      local.get 5
      i32.const 0
      i32.store offset=24
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 2
      i32.store offset=8
    end
    local.get 3
    i32.const 8
    i32.add)
  (func $free (type 1) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 4
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=4116
        i32.lt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const 0
                i32.load offset=4120
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=12
                local.set 2
                block  ;; label = @7
                  local.get 4
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 1
                  i32.load offset=8
                  local.tee 5
                  i32.ne
                  br_if 2 (;@5;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=4100
                  i32.const -2
                  local.get 4
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store offset=4100
                  br 5 (;@2;)
                end
                local.get 1
                i32.load offset=24
                local.set 6
                block  ;; label = @7
                  local.get 2
                  local.get 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  br 4 (;@3;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load offset=20
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 20
                    i32.add
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 1
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.set 5
                end
                loop  ;; label = @7
                  local.get 5
                  local.set 7
                  local.get 4
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=20
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 3 (;@3;)
              end
              local.get 3
              i32.load offset=4
              local.tee 2
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 3 (;@2;)
              local.get 3
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              i32.const 0
              local.get 0
              i32.store offset=4108
              local.get 3
              local.get 0
              i32.store
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              return
            end
            local.get 2
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 2
            i32.store offset=12
            br 2 (;@2;)
          end
          i32.const 0
          local.set 2
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 1
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 4404
            i32.add
            local.tee 4
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.store
            local.get 2
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            i32.load offset=4104
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=4104
            br 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              i32.load offset=16
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              local.get 6
              local.get 2
              i32.store offset=16
              br 1 (;@4;)
            end
            local.get 6
            local.get 2
            i32.store offset=20
          end
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 2
        local.get 6
        i32.store offset=24
        block  ;; label = @3
          local.get 1
          i32.load offset=16
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.store offset=16
          local.get 4
          local.get 2
          i32.store offset=24
        end
        local.get 1
        i32.load offset=20
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store offset=20
        local.get 4
        local.get 2
        i32.store offset=24
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=4124
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=4124
                  i32.const 0
                  i32.const 0
                  i32.load offset=4112
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=4112
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  i32.const 0
                  i32.load offset=4120
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=4108
                  i32.const 0
                  i32.const 0
                  i32.store offset=4120
                  return
                end
                block  ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=4120
                  local.tee 6
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=4120
                  i32.const 0
                  i32.const 0
                  i32.load offset=4108
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=4108
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  return
                end
                local.get 4
                i32.const -8
                i32.and
                local.get 0
                i32.add
                local.set 0
                local.get 3
                i32.load offset=12
                local.set 2
                block  ;; label = @7
                  local.get 4
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    local.get 3
                    i32.load offset=8
                    local.tee 5
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=4100
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=4100
                    br 5 (;@3;)
                  end
                  local.get 2
                  local.get 5
                  i32.store offset=8
                  local.get 5
                  local.get 2
                  i32.store offset=12
                  br 4 (;@3;)
                end
                local.get 3
                i32.load offset=24
                local.set 8
                block  ;; label = @7
                  local.get 2
                  local.get 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  br 3 (;@4;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.load offset=20
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 20
                    i32.add
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 5
                end
                loop  ;; label = @7
                  local.get 5
                  local.set 7
                  local.get 4
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=20
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 3
              local.get 4
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              br 3 (;@2;)
            end
            i32.const 0
            local.set 2
          end
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              local.get 3
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 4404
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=4104
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=4104
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                i32.load offset=16
                local.get 3
                i32.ne
                br_if 0 (;@6;)
                local.get 8
                local.get 2
                i32.store offset=16
                br 1 (;@5;)
              end
              local.get 8
              local.get 2
              i32.store offset=20
            end
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 8
          i32.store offset=24
          block  ;; label = @4
            local.get 3
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 2
            i32.store offset=24
          end
          local.get 3
          i32.load offset=20
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.store offset=20
          local.get 4
          local.get 2
          i32.store offset=24
        end
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 6
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=4108
        return
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 4140
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=4100
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=4100
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 4404
      i32.add
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=4104
              local.tee 4
              i32.const 1
              local.get 2
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              local.get 5
              local.get 1
              i32.store
              i32.const 0
              local.get 4
              local.get 3
              i32.or
              i32.store offset=4104
              i32.const 8
              local.set 0
              i32.const 24
              local.set 2
              br 1 (;@4;)
            end
            local.get 0
            i32.const 0
            i32.const 25
            local.get 2
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 2
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 2
            local.get 5
            i32.load
            local.set 5
            loop  ;; label = @5
              local.get 5
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 5
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 4
              local.get 5
              i32.const 4
              i32.and
              i32.add
              local.tee 3
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 3
            i32.const 16
            i32.add
            local.get 1
            i32.store
            i32.const 8
            local.set 0
            i32.const 24
            local.set 2
            local.get 4
            local.set 5
          end
          local.get 1
          local.set 4
          local.get 1
          local.set 3
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 5
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        i32.const 0
        local.set 3
        i32.const 24
        local.set 0
        i32.const 8
        local.set 2
      end
      local.get 1
      local.get 2
      i32.add
      local.get 5
      i32.store
      local.get 1
      local.get 4
      i32.store offset=12
      local.get 1
      local.get 0
      i32.add
      local.get 3
      i32.store
      i32.const 0
      i32.const 0
      i32.load offset=4132
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=4132
    end)
  (func $__tan (type 5) (param f64 f64 i32) (result f64)
    (local i64 i32 i32 f64 f64 f64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.reinterpret_f64
        local.tee 3
        i64.const 9223372002495037440
        i64.and
        i64.const 4604249089280835585
        i64.lt_u
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      f64.const 0x1.921fb54442d18p-1 (;=0.785398;)
      local.get 0
      f64.abs
      f64.sub
      f64.const 0x1.1a62633145c07p-55 (;=3.06162e-17;)
      local.get 1
      local.get 1
      f64.neg
      local.get 3
      i64.const -1
      i64.gt_s
      local.tee 5
      select
      f64.sub
      f64.add
      local.set 0
      f64.const 0x0p+0 (;=0;)
      local.set 1
    end
    local.get 0
    local.get 0
    local.get 0
    local.get 0
    f64.mul
    local.tee 6
    f64.mul
    local.tee 7
    f64.const 0x1.5555555555563p-2 (;=0.333333;)
    f64.mul
    local.get 6
    local.get 7
    local.get 6
    local.get 6
    f64.mul
    local.tee 8
    local.get 8
    local.get 8
    local.get 8
    local.get 8
    f64.const -0x1.375cbdb605373p-16 (;=-1.85586e-05;)
    f64.mul
    f64.const 0x1.47e88a03792a6p-14 (;=7.81794e-05;)
    f64.add
    f64.mul
    f64.const 0x1.344d8f2f26501p-11 (;=0.000588041;)
    f64.add
    f64.mul
    f64.const 0x1.d6d22c9560328p-9 (;=0.00359208;)
    f64.add
    f64.mul
    f64.const 0x1.664f48406d637p-6 (;=0.0218695;)
    f64.add
    f64.mul
    f64.const 0x1.111111110fe7ap-3 (;=0.133333;)
    f64.add
    local.get 6
    local.get 8
    local.get 8
    local.get 8
    local.get 8
    local.get 8
    f64.const 0x1.b2a7074bf7ad4p-16 (;=2.59073e-05;)
    f64.mul
    f64.const 0x1.2b80f32f0a7e9p-14 (;=7.14072e-05;)
    f64.add
    f64.mul
    f64.const 0x1.026f71a8d1068p-12 (;=0.000246463;)
    f64.add
    f64.mul
    f64.const 0x1.7dbc8fee08315p-10 (;=0.00145621;)
    f64.add
    f64.mul
    f64.const 0x1.226e3e96e8493p-7 (;=0.00886324;)
    f64.add
    f64.mul
    f64.const 0x1.ba1ba1bb341fep-5 (;=0.0539683;)
    f64.add
    f64.mul
    f64.add
    f64.mul
    local.get 1
    f64.add
    f64.mul
    local.get 1
    f64.add
    f64.add
    local.tee 6
    f64.add
    local.set 8
    block  ;; label = @1
      local.get 4
      br_if 0 (;@1;)
      i32.const 1
      local.get 2
      i32.const 1
      i32.shl
      i32.sub
      f64.convert_i32_s
      local.tee 1
      local.get 0
      local.get 6
      local.get 8
      local.get 8
      f64.mul
      local.get 8
      local.get 1
      f64.add
      f64.div
      f64.sub
      f64.add
      local.tee 8
      local.get 8
      f64.add
      f64.sub
      local.tee 8
      local.get 8
      f64.neg
      local.get 5
      i32.const 1
      i32.and
      select
      return
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      f64.const -0x1p+0 (;=-1;)
      local.get 8
      f64.div
      local.tee 1
      local.get 1
      i64.reinterpret_f64
      i64.const -4294967296
      i64.and
      f64.reinterpret_i64
      local.tee 1
      local.get 6
      local.get 8
      i64.reinterpret_f64
      i64.const -4294967296
      i64.and
      f64.reinterpret_i64
      local.tee 8
      local.get 0
      f64.sub
      f64.sub
      f64.mul
      local.get 1
      local.get 8
      f64.mul
      f64.const 0x1p+0 (;=1;)
      f64.add
      f64.add
      f64.mul
      local.get 1
      f64.add
      local.set 8
    end
    local.get 8)
  (func $scalbn (type 6) (param f64 i32) (result f64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1024
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        f64.const 0x1p+1023 (;=8.98847e+307;)
        f64.mul
        local.set 0
        block  ;; label = @3
          local.get 1
          i32.const 2047
          i32.ge_u
          br_if 0 (;@3;)
          local.get 1
          i32.const -1023
          i32.add
          local.set 1
          br 2 (;@1;)
        end
        local.get 0
        f64.const 0x1p+1023 (;=8.98847e+307;)
        f64.mul
        local.set 0
        local.get 1
        i32.const 3069
        local.get 1
        i32.const 3069
        i32.lt_u
        select
        i32.const -2046
        i32.add
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.const -1023
      i32.gt_s
      br_if 0 (;@1;)
      local.get 0
      f64.const 0x1p-969 (;=2.00417e-292;)
      f64.mul
      local.set 0
      block  ;; label = @2
        local.get 1
        i32.const -1992
        i32.le_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 969
        i32.add
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      f64.const 0x1p-969 (;=2.00417e-292;)
      f64.mul
      local.set 0
      local.get 1
      i32.const -2960
      local.get 1
      i32.const -2960
      i32.gt_u
      select
      i32.const 1938
      i32.add
      local.set 1
    end
    local.get 0
    local.get 1
    i32.const 1023
    i32.add
    i64.extend_i32_u
    i64.const 52
    i64.shl
    f64.reinterpret_i64
    f64.mul)
  (func $__rem_pio2_large (type 7) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 f64 f64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 f64 f64 f64 f64)
    global.get $__stack_pointer
    i32.const 560
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 0
    local.set 6
    local.get 2
    i32.const -3
    i32.add
    i32.const 24
    i32.div_s
    local.tee 7
    i32.const 0
    local.get 7
    i32.const 0
    i32.gt_s
    select
    local.tee 8
    i32.const -24
    i32.mul
    local.get 2
    i32.add
    local.set 9
    block  ;; label = @1
      local.get 4
      i32.const 2
      i32.shl
      i32.const 1024
      i32.add
      i32.load
      local.tee 10
      local.get 3
      i32.const -1
      i32.add
      local.tee 11
      i32.add
      local.tee 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 8
      local.get 11
      i32.sub
      local.set 12
      local.get 10
      local.get 3
      i32.add
      local.tee 13
      i32.const 1
      i32.and
      local.set 14
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        i32.const 2
        i32.shl
        local.get 3
        i32.const 2
        i32.shl
        i32.sub
        i32.const 1048
        i32.add
        local.set 7
        local.get 13
        i32.const -2
        i32.and
        local.set 15
        local.get 5
        i32.const 320
        i32.add
        local.set 2
        i32.const 0
        local.set 6
        loop  ;; label = @3
          f64.const 0x0p+0 (;=0;)
          local.set 16
          f64.const 0x0p+0 (;=0;)
          local.set 17
          block  ;; label = @4
            local.get 12
            local.get 6
            i32.add
            local.tee 13
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 7
            i32.const -4
            i32.add
            i32.load
            f64.convert_i32_s
            local.set 17
          end
          local.get 2
          local.get 17
          f64.store
          block  ;; label = @4
            local.get 13
            i32.const -1
            i32.lt_s
            br_if 0 (;@4;)
            local.get 7
            i32.load
            f64.convert_i32_s
            local.set 16
          end
          local.get 2
          i32.const 8
          i32.add
          local.get 16
          f64.store
          local.get 2
          i32.const 16
          i32.add
          local.set 2
          local.get 7
          i32.const 8
          i32.add
          local.set 7
          local.get 15
          local.get 6
          i32.const 2
          i32.add
          local.tee 6
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 12
        local.get 6
        i32.add
        local.set 12
      end
      local.get 14
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 12
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          f64.const 0x0p+0 (;=0;)
          local.set 17
          br 1 (;@2;)
        end
        local.get 12
        i32.const 2
        i32.shl
        i32.const 1040
        i32.add
        i32.load
        f64.convert_i32_s
        local.set 17
      end
      local.get 5
      i32.const 320
      i32.add
      local.get 6
      i32.const 3
      i32.shl
      i32.add
      local.get 17
      f64.store
    end
    local.get 9
    i32.const -24
    i32.add
    local.set 18
    i32.const 0
    local.set 2
    local.get 10
    i32.const 0
    local.get 10
    i32.const 0
    i32.gt_s
    select
    local.set 14
    local.get 3
    i32.const 2147483646
    i32.and
    local.set 13
    local.get 3
    i32.const 1
    i32.and
    local.set 19
    local.get 3
    i32.const 3
    i32.shl
    local.get 5
    i32.const 320
    i32.add
    i32.add
    i32.const -16
    i32.add
    local.set 15
    loop  ;; label = @1
      local.get 2
      local.set 12
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 1
          i32.ge_s
          br_if 0 (;@3;)
          f64.const 0x0p+0 (;=0;)
          local.set 17
          br 1 (;@2;)
        end
        i32.const 0
        local.set 7
        f64.const 0x0p+0 (;=0;)
        local.set 17
        block  ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          local.get 15
          local.set 2
          local.get 0
          local.set 6
          loop  ;; label = @4
            local.get 6
            i32.const 8
            i32.add
            f64.load
            local.get 2
            f64.load
            f64.mul
            local.get 6
            f64.load
            local.get 2
            i32.const 8
            i32.add
            f64.load
            f64.mul
            local.get 17
            f64.add
            f64.add
            local.set 17
            local.get 2
            i32.const -16
            i32.add
            local.set 2
            local.get 6
            i32.const 16
            i32.add
            local.set 6
            local.get 13
            local.get 7
            i32.const 2
            i32.add
            local.tee 7
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 19
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 7
        i32.const 3
        i32.shl
        i32.add
        f64.load
        local.get 5
        i32.const 320
        i32.add
        local.get 12
        local.get 11
        i32.add
        local.get 7
        i32.sub
        i32.const 3
        i32.shl
        i32.add
        f64.load
        f64.mul
        local.get 17
        f64.add
        local.set 17
      end
      local.get 5
      local.get 12
      i32.const 3
      i32.shl
      i32.add
      local.get 17
      f64.store
      local.get 15
      i32.const 8
      i32.add
      local.set 15
      local.get 12
      i32.const 1
      i32.add
      local.set 2
      local.get 12
      local.get 14
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
    i32.const 2147483646
    i32.and
    local.set 13
    local.get 3
    i32.const 1
    i32.and
    local.set 20
    i32.const 47
    local.get 9
    i32.sub
    local.set 21
    i32.const 48
    local.get 9
    i32.sub
    local.set 22
    local.get 5
    i32.const 480
    i32.add
    i32.const -4
    i32.add
    local.tee 23
    local.get 10
    i32.const 2
    i32.shl
    i32.add
    local.set 24
    local.get 5
    i32.const 320
    i32.add
    i32.const -8
    i32.add
    local.set 25
    local.get 5
    i32.const 480
    i32.add
    i32.const -16
    i32.add
    local.set 26
    local.get 5
    i32.const -16
    i32.add
    local.set 27
    local.get 9
    i32.const -25
    i32.add
    local.set 28
    local.get 10
    local.set 12
    block  ;; label = @1
      loop  ;; label = @2
        local.get 5
        local.get 12
        i32.const 3
        i32.shl
        local.tee 2
        i32.add
        f64.load
        local.set 17
        block  ;; label = @3
          local.get 12
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          i32.const 0
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 12
              i32.const 1
              i32.ne
              br_if 0 (;@5;)
              local.get 12
              local.set 2
              br 1 (;@4;)
            end
            local.get 12
            i32.const 2147483646
            i32.and
            local.set 15
            local.get 27
            local.get 2
            i32.add
            local.set 2
            i32.const 0
            local.set 7
            local.get 5
            i32.const 480
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 6
              local.get 17
              f64.const 0x1p-24 (;=5.96046e-08;)
              f64.mul
              i32.trunc_sat_f64_s
              f64.convert_i32_s
              local.tee 16
              f64.const -0x1p+24 (;=-1.67772e+07;)
              f64.mul
              local.get 17
              f64.add
              i32.trunc_sat_f64_s
              i32.store
              local.get 6
              i32.const 4
              i32.add
              local.get 2
              i32.const 8
              i32.add
              f64.load
              local.get 16
              f64.add
              local.tee 17
              f64.const 0x1p-24 (;=5.96046e-08;)
              f64.mul
              i32.trunc_sat_f64_s
              f64.convert_i32_s
              local.tee 16
              f64.const -0x1p+24 (;=-1.67772e+07;)
              f64.mul
              local.get 17
              f64.add
              i32.trunc_sat_f64_s
              i32.store
              local.get 2
              f64.load
              local.get 16
              f64.add
              local.set 17
              local.get 6
              i32.const 8
              i32.add
              local.set 6
              local.get 2
              i32.const -16
              i32.add
              local.set 2
              local.get 15
              local.get 7
              i32.const 2
              i32.add
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 12
            local.get 7
            i32.sub
            local.set 2
          end
          local.get 12
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.const 480
          i32.add
          local.get 7
          i32.const 2
          i32.shl
          i32.add
          local.get 17
          f64.const 0x1p-24 (;=5.96046e-08;)
          f64.mul
          i32.trunc_sat_f64_s
          f64.convert_i32_s
          local.tee 16
          f64.const -0x1p+24 (;=-1.67772e+07;)
          f64.mul
          local.get 17
          f64.add
          i32.trunc_sat_f64_s
          i32.store
          local.get 2
          i32.const 3
          i32.shl
          local.get 5
          i32.add
          i32.const -8
          i32.add
          f64.load
          local.get 16
          f64.add
          local.set 17
        end
        local.get 17
        local.get 18
        call $scalbn
        local.tee 17
        f64.const 0x1p-3 (;=0.125;)
        f64.mul
        f64.floor
        f64.const -0x1p+3 (;=-8;)
        f64.mul
        local.get 17
        f64.add
        local.tee 17
        local.get 17
        i32.trunc_sat_f64_s
        local.tee 29
        f64.convert_i32_s
        f64.sub
        local.set 17
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 18
                  i32.const 1
                  i32.lt_s
                  local.tee 30
                  br_if 0 (;@7;)
                  local.get 12
                  i32.const 2
                  i32.shl
                  local.get 5
                  i32.const 480
                  i32.add
                  i32.add
                  i32.const -4
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load
                  local.tee 2
                  local.get 2
                  local.get 22
                  i32.shr_s
                  local.tee 2
                  local.get 22
                  i32.shl
                  i32.sub
                  local.tee 6
                  i32.store
                  local.get 6
                  local.get 21
                  i32.shr_s
                  local.set 31
                  local.get 2
                  local.get 29
                  i32.add
                  local.set 29
                  br 1 (;@6;)
                end
                local.get 18
                br_if 1 (;@5;)
                local.get 12
                i32.const 2
                i32.shl
                local.get 5
                i32.const 480
                i32.add
                i32.add
                i32.const -4
                i32.add
                i32.load
                i32.const 23
                i32.shr_s
                local.set 31
              end
              local.get 31
              i32.const 1
              i32.lt_s
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            i32.const 2
            local.set 31
            local.get 17
            f64.const 0x1p-1 (;=0.5;)
            f64.ge
            br_if 0 (;@4;)
            i32.const 0
            local.set 31
            br 1 (;@3;)
          end
          i32.const 1
          local.set 6
          block  ;; label = @4
            local.get 12
            i32.const 1
            i32.lt_s
            br_if 0 (;@4;)
            i32.const 1
            local.set 6
            local.get 12
            i32.const 1
            i32.and
            local.set 32
            i32.const 0
            local.set 7
            block  ;; label = @5
              local.get 12
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 12
              i32.const 2147483646
              i32.and
              local.set 19
              i32.const 0
              local.set 7
              local.get 5
              i32.const 480
              i32.add
              local.set 2
              i32.const 0
              local.set 15
              loop  ;; label = @6
                local.get 2
                i32.load
                local.set 6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 15
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 16777215
                        local.set 15
                        br 1 (;@9;)
                      end
                      local.get 6
                      i32.eqz
                      br_if 1 (;@8;)
                      i32.const 16777216
                      local.set 15
                    end
                    local.get 2
                    local.get 15
                    local.get 6
                    i32.sub
                    i32.store
                    i32.const 0
                    local.set 15
                    br 1 (;@7;)
                  end
                  i32.const 1
                  local.set 15
                end
                local.get 2
                i32.const 4
                i32.add
                local.tee 14
                i32.load
                local.set 6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 15
                        br_if 0 (;@10;)
                        i32.const 16777215
                        local.set 15
                        br 1 (;@9;)
                      end
                      local.get 6
                      i32.eqz
                      br_if 1 (;@8;)
                      i32.const 16777216
                      local.set 15
                    end
                    local.get 14
                    local.get 15
                    local.get 6
                    i32.sub
                    i32.store
                    i32.const 1
                    local.set 15
                    i32.const 0
                    local.set 6
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.set 15
                  i32.const 1
                  local.set 6
                end
                local.get 2
                i32.const 8
                i32.add
                local.set 2
                local.get 19
                local.get 7
                i32.const 2
                i32.add
                local.tee 7
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 32
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 480
            i32.add
            local.get 7
            i32.const 2
            i32.shl
            i32.add
            local.tee 7
            i32.load
            local.set 2
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 6
                  br_if 0 (;@7;)
                  i32.const 16777215
                  local.set 6
                  br 1 (;@6;)
                end
                local.get 2
                i32.eqz
                br_if 1 (;@5;)
                i32.const 16777216
                local.set 6
              end
              local.get 7
              local.get 6
              local.get 2
              i32.sub
              i32.store
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            i32.const 1
            local.set 6
          end
          block  ;; label = @4
            local.get 30
            br_if 0 (;@4;)
            i32.const 8388607
            local.set 2
            block  ;; label = @5
              block  ;; label = @6
                local.get 28
                br_table 1 (;@5;) 0 (;@6;) 2 (;@4;)
              end
              i32.const 4194303
              local.set 2
            end
            local.get 12
            i32.const 2
            i32.shl
            local.get 5
            i32.const 480
            i32.add
            i32.add
            i32.const -4
            i32.add
            local.tee 7
            local.get 7
            i32.load
            local.get 2
            i32.and
            i32.store
          end
          local.get 29
          i32.const 1
          i32.add
          local.set 29
          local.get 31
          i32.const 2
          i32.ne
          br_if 0 (;@3;)
          f64.const 0x1p+0 (;=1;)
          local.get 17
          f64.sub
          local.set 17
          i32.const 2
          local.set 31
          local.get 6
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 17
          f64.const 0x1p+0 (;=1;)
          local.get 18
          call $scalbn
          f64.sub
          local.set 17
        end
        block  ;; label = @3
          local.get 17
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 12
            local.get 10
            i32.le_s
            br_if 0 (;@4;)
            local.get 12
            local.get 10
            i32.sub
            local.tee 2
            i32.const 3
            i32.and
            local.set 7
            i32.const 0
            local.set 6
            local.get 12
            local.set 15
            block  ;; label = @5
              local.get 10
              local.get 12
              i32.sub
              i32.const -4
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const -4
              i32.and
              local.set 14
              local.get 26
              local.get 12
              i32.const 2
              i32.shl
              i32.add
              local.set 2
              i32.const 0
              local.set 6
              local.get 12
              local.set 15
              loop  ;; label = @6
                local.get 2
                i32.load
                local.get 2
                i32.const 4
                i32.add
                i32.load
                local.get 2
                i32.const 8
                i32.add
                i32.load
                local.get 2
                i32.const 12
                i32.add
                i32.load
                local.get 6
                i32.or
                i32.or
                i32.or
                i32.or
                local.set 6
                local.get 2
                i32.const -16
                i32.add
                local.set 2
                local.get 15
                i32.const -4
                i32.add
                local.set 15
                local.get 14
                i32.const -4
                i32.add
                local.tee 14
                br_if 0 (;@6;)
              end
            end
            block  ;; label = @5
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 23
              local.get 15
              i32.const 2
              i32.shl
              i32.add
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.load
                local.get 6
                i32.or
                local.set 6
                local.get 2
                i32.const -4
                i32.add
                local.set 2
                local.get 7
                i32.const -1
                i32.add
                local.tee 7
                br_if 0 (;@6;)
              end
            end
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 480
            i32.add
            local.get 12
            i32.const 2
            i32.shl
            i32.add
            i32.const -4
            i32.add
            local.set 2
            loop  ;; label = @5
              local.get 12
              i32.const -1
              i32.add
              local.set 12
              local.get 18
              i32.const -24
              i32.add
              local.set 18
              local.get 2
              i32.load
              local.set 6
              local.get 2
              i32.const -4
              i32.add
              local.set 2
              local.get 6
              i32.eqz
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          local.get 24
          local.set 2
          local.get 12
          local.set 15
          loop  ;; label = @4
            local.get 15
            i32.const 1
            i32.add
            local.set 15
            local.get 2
            i32.load
            local.set 6
            local.get 2
            i32.const -4
            i32.add
            local.set 2
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 25
          local.get 3
          local.get 12
          i32.add
          i32.const 3
          i32.shl
          i32.add
          local.set 14
          loop  ;; label = @4
            local.get 5
            i32.const 320
            i32.add
            local.get 12
            local.get 3
            i32.add
            local.tee 19
            i32.const 3
            i32.shl
            i32.add
            local.get 12
            i32.const 1
            i32.add
            local.tee 12
            local.get 8
            i32.add
            i32.const 2
            i32.shl
            i32.const 1040
            i32.add
            i32.load
            f64.convert_i32_s
            f64.store
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 1
                i32.ge_s
                br_if 0 (;@6;)
                f64.const 0x0p+0 (;=0;)
                local.set 17
                br 1 (;@5;)
              end
              i32.const 0
              local.set 7
              f64.const 0x0p+0 (;=0;)
              local.set 17
              block  ;; label = @6
                local.get 11
                i32.eqz
                br_if 0 (;@6;)
                local.get 14
                local.set 2
                local.get 0
                local.set 6
                loop  ;; label = @7
                  local.get 6
                  i32.const 8
                  i32.add
                  f64.load
                  local.get 2
                  f64.load
                  f64.mul
                  local.get 6
                  f64.load
                  local.get 2
                  i32.const 8
                  i32.add
                  f64.load
                  f64.mul
                  local.get 17
                  f64.add
                  f64.add
                  local.set 17
                  local.get 2
                  i32.const -16
                  i32.add
                  local.set 2
                  local.get 6
                  i32.const 16
                  i32.add
                  local.set 6
                  local.get 13
                  local.get 7
                  i32.const 2
                  i32.add
                  local.tee 7
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 20
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 7
              i32.const 3
              i32.shl
              i32.add
              f64.load
              local.get 5
              i32.const 320
              i32.add
              local.get 19
              local.get 7
              i32.sub
              i32.const 3
              i32.shl
              i32.add
              f64.load
              f64.mul
              local.get 17
              f64.add
              local.set 17
            end
            local.get 5
            local.get 12
            i32.const 3
            i32.shl
            i32.add
            local.get 17
            f64.store
            local.get 14
            i32.const 8
            i32.add
            local.set 14
            local.get 12
            local.get 15
            i32.lt_s
            br_if 0 (;@4;)
          end
          local.get 15
          local.set 12
          br 1 (;@2;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 17
          i32.const 24
          local.get 9
          i32.sub
          call $scalbn
          local.tee 17
          f64.const 0x1p+24 (;=1.67772e+07;)
          f64.ge
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.const 480
          i32.add
          local.get 12
          i32.const 2
          i32.shl
          i32.add
          local.get 17
          f64.const 0x1p-24 (;=5.96046e-08;)
          f64.mul
          i32.trunc_sat_f64_s
          local.tee 2
          f64.convert_i32_s
          f64.const -0x1p+24 (;=-1.67772e+07;)
          f64.mul
          local.get 17
          f64.add
          i32.trunc_sat_f64_s
          i32.store
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          local.set 18
          br 1 (;@2;)
        end
        local.get 17
        i32.trunc_sat_f64_s
        local.set 2
      end
      local.get 5
      i32.const 480
      i32.add
      local.get 12
      i32.const 2
      i32.shl
      i32.add
      local.get 2
      i32.store
    end
    block  ;; label = @1
      local.get 12
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      f64.const 0x1p+0 (;=1;)
      local.get 18
      call $scalbn
      local.set 17
      block  ;; label = @2
        block  ;; label = @3
          local.get 12
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 12
          local.set 6
          br 1 (;@2;)
        end
        local.get 5
        local.get 12
        i32.const 3
        i32.shl
        i32.add
        local.get 17
        local.get 5
        i32.const 480
        i32.add
        local.get 12
        i32.const 2
        i32.shl
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        f64.store
        local.get 12
        i32.const -1
        i32.add
        local.set 6
        local.get 17
        f64.const 0x1p-24 (;=5.96046e-08;)
        f64.mul
        local.set 17
      end
      block  ;; label = @2
        local.get 12
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 1
        i32.add
        local.set 7
        local.get 6
        i32.const 2
        i32.shl
        local.get 5
        i32.const 480
        i32.add
        i32.add
        i32.const -4
        i32.add
        local.set 2
        local.get 6
        i32.const 3
        i32.shl
        local.get 5
        i32.add
        i32.const -8
        i32.add
        local.set 6
        loop  ;; label = @3
          local.get 6
          local.get 17
          f64.const 0x1p-24 (;=5.96046e-08;)
          f64.mul
          local.tee 16
          local.get 2
          i32.load
          f64.convert_i32_s
          f64.mul
          f64.store
          local.get 6
          i32.const 8
          i32.add
          local.get 17
          local.get 2
          i32.const 4
          i32.add
          i32.load
          f64.convert_i32_s
          f64.mul
          f64.store
          local.get 2
          i32.const -8
          i32.add
          local.set 2
          local.get 6
          i32.const -16
          i32.add
          local.set 6
          local.get 16
          f64.const 0x1p-24 (;=5.96046e-08;)
          f64.mul
          local.set 17
          local.get 7
          i32.const -2
          i32.add
          local.tee 7
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 12
      i32.const 3
      i32.shl
      i32.add
      local.set 13
      local.get 12
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 10
            local.get 12
            local.get 2
            local.tee 14
            i32.sub
            local.tee 3
            local.get 10
            local.get 3
            i32.lt_s
            select
            local.tee 19
            i32.const 0
            i32.ge_s
            br_if 0 (;@4;)
            f64.const 0x0p+0 (;=0;)
            local.set 17
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 19
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              f64.const 0x0p+0 (;=0;)
              local.set 17
              br 1 (;@4;)
            end
            local.get 19
            i32.const 1
            i32.add
            i32.const -2
            i32.and
            local.set 15
            f64.const 0x0p+0 (;=0;)
            local.set 17
            i32.const 0
            local.set 2
            i32.const 0
            local.set 6
            loop  ;; label = @5
              local.get 2
              i32.const 3816
              i32.add
              f64.load
              local.get 13
              local.get 2
              i32.add
              local.tee 7
              i32.const 8
              i32.add
              f64.load
              f64.mul
              local.get 2
              i32.const 3808
              i32.add
              f64.load
              local.get 7
              f64.load
              f64.mul
              local.get 17
              f64.add
              f64.add
              local.set 17
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 15
              local.get 6
              i32.const 2
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 19
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 6
          i32.const 3
          i32.shl
          i32.const 3808
          i32.add
          f64.load
          local.get 5
          local.get 6
          local.get 14
          i32.add
          i32.const 3
          i32.shl
          i32.add
          f64.load
          f64.mul
          local.get 17
          f64.add
          local.set 17
        end
        local.get 5
        i32.const 160
        i32.add
        local.get 3
        i32.const 3
        i32.shl
        i32.add
        local.get 17
        f64.store
        local.get 13
        i32.const -8
        i32.add
        local.set 13
        local.get 14
        i32.const -1
        i32.add
        local.set 2
        local.get 14
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              br_table 1 (;@4;) 2 (;@3;) 2 (;@3;) 0 (;@5;) 4 (;@1;)
            end
            f64.const 0x0p+0 (;=0;)
            local.set 33
            block  ;; label = @5
              local.get 12
              i32.const 1
              i32.lt_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 160
              i32.add
              local.get 12
              i32.const 3
              i32.shl
              i32.add
              local.tee 6
              f64.load
              local.set 16
              block  ;; label = @6
                block  ;; label = @7
                  local.get 12
                  i32.const 1
                  i32.and
                  br_if 0 (;@7;)
                  local.get 16
                  local.set 17
                  local.get 12
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 5
                i32.const 160
                i32.add
                local.get 12
                i32.const -1
                i32.add
                local.tee 2
                i32.const 3
                i32.shl
                i32.add
                local.tee 7
                local.get 7
                f64.load
                local.tee 34
                local.get 16
                f64.add
                local.tee 17
                f64.store
                local.get 6
                local.get 16
                local.get 34
                local.get 17
                f64.sub
                f64.add
                f64.store
              end
              local.get 12
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 2
              i32.const 1
              i32.add
              local.set 6
              local.get 2
              i32.const 3
              i32.shl
              local.get 5
              i32.const 160
              i32.add
              i32.add
              i32.const -16
              i32.add
              local.set 2
              loop  ;; label = @6
                local.get 2
                local.get 2
                f64.load
                local.tee 35
                local.get 2
                i32.const 8
                i32.add
                local.tee 7
                f64.load
                local.tee 36
                local.get 17
                f64.add
                local.tee 16
                f64.add
                local.tee 34
                f64.store
                local.get 2
                i32.const 16
                i32.add
                local.get 17
                local.get 36
                local.get 16
                f64.sub
                f64.add
                f64.store
                local.get 7
                local.get 16
                local.get 35
                local.get 34
                f64.sub
                f64.add
                f64.store
                local.get 2
                i32.const -16
                i32.add
                local.set 2
                local.get 34
                local.set 17
                local.get 6
                i32.const -2
                i32.add
                local.tee 6
                i32.const 1
                i32.gt_u
                br_if 0 (;@6;)
              end
              local.get 12
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 12
              i32.const 1
              i32.add
              local.set 6
              local.get 5
              i32.const 160
              i32.add
              local.get 12
              i32.const 3
              i32.shl
              i32.add
              local.tee 7
              i32.const -8
              i32.add
              local.set 2
              local.get 7
              f64.load
              local.set 17
              loop  ;; label = @6
                local.get 2
                local.get 2
                f64.load
                local.tee 34
                local.get 17
                f64.add
                local.tee 16
                f64.store
                local.get 2
                i32.const 8
                i32.add
                local.get 17
                local.get 34
                local.get 16
                f64.sub
                f64.add
                f64.store
                local.get 2
                i32.const -8
                i32.add
                local.set 2
                local.get 16
                local.set 17
                local.get 6
                i32.const -1
                i32.add
                local.tee 6
                i32.const 2
                i32.gt_u
                br_if 0 (;@6;)
              end
              local.get 12
              i32.const 1
              i32.add
              local.set 6
              local.get 5
              i32.const 160
              i32.add
              local.get 12
              i32.const 3
              i32.shl
              i32.add
              local.set 2
              f64.const 0x0p+0 (;=0;)
              local.set 33
              loop  ;; label = @6
                local.get 33
                local.get 2
                f64.load
                f64.add
                local.set 33
                local.get 2
                i32.const -8
                i32.add
                local.set 2
                local.get 6
                i32.const -1
                i32.add
                local.tee 6
                i32.const 2
                i32.gt_s
                br_if 0 (;@6;)
              end
            end
            local.get 5
            f64.load offset=160
            local.set 17
            local.get 31
            br_if 2 (;@2;)
            local.get 1
            local.get 17
            f64.store
            local.get 1
            local.get 33
            f64.store offset=16
            local.get 1
            local.get 5
            f64.load offset=168
            f64.store offset=8
            br 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 12
              i32.const 0
              i32.ge_s
              br_if 0 (;@5;)
              f64.const 0x0p+0 (;=0;)
              local.set 17
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 12
                i32.const 3
                i32.and
                i32.const 3
                i32.ne
                br_if 0 (;@6;)
                f64.const 0x0p+0 (;=0;)
                local.set 17
                local.get 12
                local.set 6
                br 1 (;@5;)
              end
              local.get 12
              i32.const 1
              i32.add
              i32.const 3
              i32.and
              local.set 7
              local.get 5
              i32.const 160
              i32.add
              local.get 12
              i32.const 3
              i32.shl
              i32.add
              local.set 2
              f64.const 0x0p+0 (;=0;)
              local.set 17
              local.get 12
              local.set 6
              loop  ;; label = @6
                local.get 6
                i32.const -1
                i32.add
                local.set 6
                local.get 17
                local.get 2
                f64.load
                f64.add
                local.set 17
                local.get 2
                i32.const -8
                i32.add
                local.set 2
                local.get 7
                i32.const -1
                i32.add
                local.tee 7
                br_if 0 (;@6;)
              end
            end
            local.get 12
            i32.const 3
            i32.lt_u
            br_if 0 (;@4;)
            local.get 6
            i32.const 1
            i32.add
            local.set 7
            local.get 6
            i32.const 3
            i32.shl
            local.get 5
            i32.const 160
            i32.add
            i32.add
            i32.const -24
            i32.add
            local.set 2
            loop  ;; label = @5
              local.get 17
              local.get 2
              i32.const 24
              i32.add
              f64.load
              f64.add
              local.get 2
              i32.const 16
              i32.add
              f64.load
              f64.add
              local.get 2
              i32.const 8
              i32.add
              f64.load
              f64.add
              local.get 2
              f64.load
              f64.add
              local.set 17
              local.get 2
              i32.const -32
              i32.add
              local.set 2
              local.get 7
              i32.const -4
              i32.add
              local.tee 7
              br_if 0 (;@5;)
            end
          end
          local.get 1
          local.get 17
          f64.neg
          local.get 17
          local.get 31
          select
          f64.store
          br 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 12
            i32.const 0
            i32.ge_s
            br_if 0 (;@4;)
            f64.const 0x0p+0 (;=0;)
            local.set 17
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 12
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 0 (;@5;)
              f64.const 0x0p+0 (;=0;)
              local.set 17
              local.get 12
              local.set 6
              br 1 (;@4;)
            end
            local.get 12
            i32.const 1
            i32.add
            i32.const 3
            i32.and
            local.set 7
            local.get 5
            i32.const 160
            i32.add
            local.get 12
            i32.const 3
            i32.shl
            i32.add
            local.set 2
            f64.const 0x0p+0 (;=0;)
            local.set 17
            local.get 12
            local.set 6
            loop  ;; label = @5
              local.get 6
              i32.const -1
              i32.add
              local.set 6
              local.get 17
              local.get 2
              f64.load
              f64.add
              local.set 17
              local.get 2
              i32.const -8
              i32.add
              local.set 2
              local.get 7
              i32.const -1
              i32.add
              local.tee 7
              br_if 0 (;@5;)
            end
          end
          local.get 12
          i32.const 3
          i32.lt_u
          br_if 0 (;@3;)
          local.get 6
          i32.const 1
          i32.add
          local.set 7
          local.get 6
          i32.const 3
          i32.shl
          local.get 5
          i32.const 160
          i32.add
          i32.add
          i32.const -24
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 17
            local.get 2
            i32.const 24
            i32.add
            f64.load
            f64.add
            local.get 2
            i32.const 16
            i32.add
            f64.load
            f64.add
            local.get 2
            i32.const 8
            i32.add
            f64.load
            f64.add
            local.get 2
            f64.load
            f64.add
            local.set 17
            local.get 2
            i32.const -32
            i32.add
            local.set 2
            local.get 7
            i32.const -4
            i32.add
            local.tee 7
            br_if 0 (;@4;)
          end
        end
        local.get 1
        local.get 17
        f64.neg
        local.get 17
        local.get 31
        select
        f64.store
        local.get 5
        f64.load offset=160
        local.get 17
        f64.sub
        local.set 17
        i32.const 1
        local.set 2
        block  ;; label = @3
          local.get 12
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          local.get 12
          i32.const 3
          i32.and
          local.set 6
          block  ;; label = @4
            local.get 12
            i32.const -1
            i32.add
            i32.const 3
            i32.lt_u
            br_if 0 (;@4;)
            local.get 12
            i32.const 2147483644
            i32.and
            local.set 13
            local.get 5
            i32.const 160
            i32.add
            i32.const 32
            i32.add
            local.set 2
            i32.const 0
            local.set 7
            loop  ;; label = @5
              local.get 17
              local.get 2
              i32.const -24
              i32.add
              f64.load
              f64.add
              local.get 2
              i32.const -16
              i32.add
              f64.load
              f64.add
              local.get 2
              i32.const -8
              i32.add
              f64.load
              f64.add
              local.get 2
              f64.load
              f64.add
              local.set 17
              local.get 2
              i32.const 32
              i32.add
              local.set 2
              local.get 13
              local.get 7
              i32.const 4
              i32.add
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 7
            i32.const 1
            i32.add
            local.set 2
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.const 160
          i32.add
          local.get 2
          i32.const 3
          i32.shl
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 17
            local.get 2
            f64.load
            f64.add
            local.set 17
            local.get 2
            i32.const 8
            i32.add
            local.set 2
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 1
        local.get 17
        f64.neg
        local.get 17
        local.get 31
        select
        f64.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      local.get 17
      f64.neg
      f64.store
      local.get 1
      local.get 33
      f64.neg
      f64.store offset=16
      local.get 1
      local.get 5
      f64.load offset=168
      f64.neg
      f64.store offset=8
    end
    local.get 5
    i32.const 560
    i32.add
    global.set $__stack_pointer
    local.get 29
    i32.const 7
    i32.and)
  (func $__rem_pio2 (type 8) (param f64 i32) (result i32)
    (local i32 i64 i32 i32 f64 f64 f64 f64 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i64.reinterpret_f64
            local.tee 3
            i64.const 32
            i64.shr_u
            i32.wrap_i64
            local.tee 4
            i32.const 2147483647
            i32.and
            local.tee 5
            i32.const 1074752122
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 1048575
            i32.and
            i32.const 598523
            i32.eq
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 5
              i32.const 1073928572
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 3
                i64.const 0
                i64.lt_s
                br_if 0 (;@6;)
                local.get 1
                local.get 0
                f64.const -0x1.921fb544p+0 (;=-1.5708;)
                f64.add
                local.tee 0
                f64.const -0x1.0b4611a626331p-34 (;=-6.0771e-11;)
                f64.add
                local.tee 6
                f64.store
                local.get 1
                local.get 0
                local.get 6
                f64.sub
                f64.const -0x1.0b4611a626331p-34 (;=-6.0771e-11;)
                f64.add
                f64.store offset=8
                i32.const 1
                local.set 4
                br 5 (;@1;)
              end
              local.get 1
              local.get 0
              f64.const 0x1.921fb544p+0 (;=1.5708;)
              f64.add
              local.tee 0
              f64.const 0x1.0b4611a626331p-34 (;=6.0771e-11;)
              f64.add
              local.tee 6
              f64.store
              local.get 1
              local.get 0
              local.get 6
              f64.sub
              f64.const 0x1.0b4611a626331p-34 (;=6.0771e-11;)
              f64.add
              f64.store offset=8
              i32.const -1
              local.set 4
              br 4 (;@1;)
            end
            block  ;; label = @5
              local.get 3
              i64.const 0
              i64.lt_s
              br_if 0 (;@5;)
              local.get 1
              local.get 0
              f64.const -0x1.921fb544p+1 (;=-3.14159;)
              f64.add
              local.tee 0
              f64.const -0x1.0b4611a626331p-33 (;=-1.21542e-10;)
              f64.add
              local.tee 6
              f64.store
              local.get 1
              local.get 0
              local.get 6
              f64.sub
              f64.const -0x1.0b4611a626331p-33 (;=-1.21542e-10;)
              f64.add
              f64.store offset=8
              i32.const 2
              local.set 4
              br 4 (;@1;)
            end
            local.get 1
            local.get 0
            f64.const 0x1.921fb544p+1 (;=3.14159;)
            f64.add
            local.tee 0
            f64.const 0x1.0b4611a626331p-33 (;=1.21542e-10;)
            f64.add
            local.tee 6
            f64.store
            local.get 1
            local.get 0
            local.get 6
            f64.sub
            f64.const 0x1.0b4611a626331p-33 (;=1.21542e-10;)
            f64.add
            f64.store offset=8
            i32.const -2
            local.set 4
            br 3 (;@1;)
          end
          block  ;; label = @4
            local.get 5
            i32.const 1075594811
            i32.gt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 5
              i32.const 1075183036
              i32.gt_u
              br_if 0 (;@5;)
              local.get 5
              i32.const 1074977148
              i32.eq
              br_if 2 (;@3;)
              block  ;; label = @6
                local.get 3
                i64.const 0
                i64.lt_s
                br_if 0 (;@6;)
                local.get 1
                local.get 0
                f64.const -0x1.2d97c7f3p+2 (;=-4.71239;)
                f64.add
                local.tee 0
                f64.const -0x1.90e91a79394cap-33 (;=-1.82313e-10;)
                f64.add
                local.tee 6
                f64.store
                local.get 1
                local.get 0
                local.get 6
                f64.sub
                f64.const -0x1.90e91a79394cap-33 (;=-1.82313e-10;)
                f64.add
                f64.store offset=8
                i32.const 3
                local.set 4
                br 5 (;@1;)
              end
              local.get 1
              local.get 0
              f64.const 0x1.2d97c7f3p+2 (;=4.71239;)
              f64.add
              local.tee 0
              f64.const 0x1.90e91a79394cap-33 (;=1.82313e-10;)
              f64.add
              local.tee 6
              f64.store
              local.get 1
              local.get 0
              local.get 6
              f64.sub
              f64.const 0x1.90e91a79394cap-33 (;=1.82313e-10;)
              f64.add
              f64.store offset=8
              i32.const -3
              local.set 4
              br 4 (;@1;)
            end
            local.get 5
            i32.const 1075388923
            i32.eq
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 3
              i64.const 0
              i64.lt_s
              br_if 0 (;@5;)
              local.get 1
              local.get 0
              f64.const -0x1.921fb544p+2 (;=-6.28319;)
              f64.add
              local.tee 0
              f64.const -0x1.0b4611a626331p-32 (;=-2.43084e-10;)
              f64.add
              local.tee 6
              f64.store
              local.get 1
              local.get 0
              local.get 6
              f64.sub
              f64.const -0x1.0b4611a626331p-32 (;=-2.43084e-10;)
              f64.add
              f64.store offset=8
              i32.const 4
              local.set 4
              br 4 (;@1;)
            end
            local.get 1
            local.get 0
            f64.const 0x1.921fb544p+2 (;=6.28319;)
            f64.add
            local.tee 0
            f64.const 0x1.0b4611a626331p-32 (;=2.43084e-10;)
            f64.add
            local.tee 6
            f64.store
            local.get 1
            local.get 0
            local.get 6
            f64.sub
            f64.const 0x1.0b4611a626331p-32 (;=2.43084e-10;)
            f64.add
            f64.store offset=8
            i32.const -4
            local.set 4
            br 3 (;@1;)
          end
          local.get 5
          i32.const 1094263290
          i32.gt_u
          br_if 1 (;@2;)
        end
        local.get 1
        local.get 0
        local.get 0
        f64.const 0x1.45f306dc9c883p-1 (;=0.63662;)
        f64.mul
        f64.const 0x1.8p+52 (;=6.7554e+15;)
        f64.add
        f64.const -0x1.8p+52 (;=-6.7554e+15;)
        f64.add
        local.tee 6
        f64.const -0x1.921fb544p+0 (;=-1.5708;)
        f64.mul
        f64.add
        local.tee 7
        local.get 6
        f64.const 0x1.0b4611a626331p-34 (;=6.0771e-11;)
        f64.mul
        local.tee 8
        f64.sub
        local.tee 0
        f64.store
        block  ;; label = @3
          local.get 5
          i32.const 20
          i32.shr_u
          local.tee 4
          local.get 0
          i64.reinterpret_f64
          i64.const 52
          i64.shr_u
          i32.wrap_i64
          i32.const 2047
          i32.and
          i32.sub
          i32.const 17
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 7
          local.get 6
          f64.const 0x1.0b4611a6p-34 (;=6.0771e-11;)
          f64.mul
          local.tee 0
          f64.sub
          local.tee 9
          local.get 6
          f64.const 0x1.3198a2e037073p-69 (;=2.02227e-21;)
          f64.mul
          local.get 7
          local.get 9
          f64.sub
          local.get 0
          f64.sub
          f64.sub
          local.tee 8
          f64.sub
          local.tee 0
          f64.store
          block  ;; label = @4
            local.get 4
            local.get 0
            i64.reinterpret_f64
            i64.const 52
            i64.shr_u
            i32.wrap_i64
            i32.const 2047
            i32.and
            i32.sub
            i32.const 50
            i32.ge_s
            br_if 0 (;@4;)
            local.get 9
            local.set 7
            br 1 (;@3;)
          end
          local.get 1
          local.get 9
          local.get 6
          f64.const 0x1.3198a2ep-69 (;=2.02227e-21;)
          f64.mul
          local.tee 0
          f64.sub
          local.tee 7
          local.get 6
          f64.const 0x1.b839a252049c1p-104 (;=8.47843e-32;)
          f64.mul
          local.get 9
          local.get 7
          f64.sub
          local.get 0
          f64.sub
          f64.sub
          local.tee 8
          f64.sub
          local.tee 0
          f64.store
        end
        local.get 6
        i32.trunc_sat_f64_s
        local.set 4
        local.get 1
        local.get 7
        local.get 0
        f64.sub
        local.get 8
        f64.sub
        f64.store offset=8
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 5
        i32.const 2146435072
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        local.get 0
        f64.sub
        local.tee 0
        f64.store
        local.get 1
        local.get 0
        f64.store offset=8
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 2
      local.get 3
      i64.const 4503599627370495
      i64.and
      i64.const 4710765210229538816
      i64.or
      f64.reinterpret_i64
      local.tee 0
      i32.trunc_sat_f64_s
      f64.convert_i32_s
      local.tee 6
      f64.store offset=16
      local.get 2
      local.get 0
      local.get 6
      f64.sub
      f64.const 0x1p+24 (;=1.67772e+07;)
      f64.mul
      local.tee 0
      i32.trunc_sat_f64_s
      f64.convert_i32_s
      local.tee 6
      f64.store offset=24
      local.get 2
      local.get 0
      local.get 6
      f64.sub
      f64.const 0x1p+24 (;=1.67772e+07;)
      f64.mul
      f64.store offset=32
      local.get 2
      i32.const 32
      i32.add
      local.set 4
      i32.const 4
      local.set 10
      loop  ;; label = @2
        local.get 10
        i32.const -1
        i32.add
        local.set 10
        local.get 4
        f64.load
        local.set 0
        local.get 4
        i32.const -8
        i32.add
        local.set 4
        local.get 0
        f64.const 0x0p+0 (;=0;)
        f64.eq
        br_if 0 (;@2;)
      end
      local.get 2
      i32.const 16
      i32.add
      local.get 2
      local.get 5
      i32.const 20
      i32.shr_u
      i32.const -1046
      i32.add
      local.get 10
      i32.const 1
      call $__rem_pio2_large
      local.set 4
      local.get 2
      f64.load
      local.set 0
      block  ;; label = @2
        local.get 3
        i64.const -1
        i64.gt_s
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        f64.neg
        f64.store
        local.get 1
        local.get 2
        f64.load offset=8
        f64.neg
        f64.store offset=8
        i32.const 0
        local.get 4
        i32.sub
        local.set 4
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      f64.store
      local.get 1
      local.get 2
      f64.load offset=8
      f64.store offset=8
    end
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $tan (type 9) (param f64) (result f64)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.reinterpret_f64
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.const 2147483647
        i32.and
        local.tee 2
        i32.const 1072243195
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 1044381696
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        f64.const 0x0p+0 (;=0;)
        i32.const 0
        call $__tan
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        i32.const 2146435072
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        f64.sub
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      call $__rem_pio2
      local.set 2
      local.get 1
      f64.load
      local.get 1
      f64.load offset=8
      local.get 2
      i32.const 1
      i32.and
      call $__tan
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $__cos (type 10) (param f64 f64) (result f64)
    (local f64 f64 f64)
    f64.const 0x1p+0 (;=1;)
    local.get 0
    local.get 0
    f64.mul
    local.tee 2
    f64.const 0x1p-1 (;=0.5;)
    f64.mul
    local.tee 3
    f64.sub
    local.tee 4
    f64.const 0x1p+0 (;=1;)
    local.get 4
    f64.sub
    local.get 3
    f64.sub
    local.get 2
    local.get 2
    local.get 2
    local.get 2
    f64.const 0x1.a01a019cb159p-16 (;=2.48016e-05;)
    f64.mul
    f64.const -0x1.6c16c16c15177p-10 (;=-0.00138889;)
    f64.add
    f64.mul
    f64.const 0x1.555555555554cp-5 (;=0.0416667;)
    f64.add
    f64.mul
    local.get 2
    local.get 2
    f64.mul
    local.tee 3
    local.get 3
    f64.mul
    local.get 2
    local.get 2
    f64.const -0x1.8fae9be8838d4p-37 (;=-1.13596e-11;)
    f64.mul
    f64.const 0x1.1ee9ebdb4b1c4p-29 (;=2.08757e-09;)
    f64.add
    f64.mul
    f64.const -0x1.27e4f809c52adp-22 (;=-2.75573e-07;)
    f64.add
    f64.mul
    f64.add
    f64.mul
    local.get 0
    local.get 1
    f64.mul
    f64.sub
    f64.add
    f64.add)
  (func $__sin (type 5) (param f64 f64 i32) (result f64)
    (local f64 f64 f64)
    local.get 0
    local.get 0
    f64.mul
    local.tee 3
    local.get 3
    local.get 3
    f64.mul
    f64.mul
    local.get 3
    f64.const 0x1.5d93a5acfd57cp-33 (;=1.58969e-10;)
    f64.mul
    f64.const -0x1.ae5e68a2b9cebp-26 (;=-2.50508e-08;)
    f64.add
    f64.mul
    local.get 3
    local.get 3
    f64.const 0x1.71de357b1fe7dp-19 (;=2.75573e-06;)
    f64.mul
    f64.const -0x1.a01a019c161d5p-13 (;=-0.000198413;)
    f64.add
    f64.mul
    f64.const 0x1.111111110f8a6p-7 (;=0.00833333;)
    f64.add
    f64.add
    local.set 4
    local.get 0
    local.get 3
    f64.mul
    local.set 5
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      local.get 4
      f64.mul
      f64.const -0x1.5555555555549p-3 (;=-0.166667;)
      f64.add
      f64.mul
      local.get 0
      f64.add
      return
    end
    local.get 0
    local.get 3
    local.get 1
    f64.const 0x1p-1 (;=0.5;)
    f64.mul
    local.get 5
    local.get 4
    f64.mul
    f64.sub
    f64.mul
    local.get 1
    f64.sub
    local.get 5
    f64.const 0x1.5555555555549p-3 (;=0.166667;)
    f64.mul
    f64.add
    f64.sub)
  (func $cos (type 9) (param f64) (result f64)
    (local i32 i32 f64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.reinterpret_f64
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.const 2147483647
        i32.and
        local.tee 2
        i32.const 1072243195
        i32.gt_u
        br_if 0 (;@2;)
        f64.const 0x1p+0 (;=1;)
        local.set 3
        local.get 2
        i32.const 1044816030
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        f64.const 0x0p+0 (;=0;)
        call $__cos
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        i32.const 2146435072
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        f64.sub
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      call $__rem_pio2
      local.set 2
      local.get 1
      f64.load offset=8
      local.set 0
      local.get 1
      f64.load
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 3
              i32.and
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;) 0 (;@5;)
            end
            local.get 3
            local.get 0
            call $__cos
            local.set 3
            br 3 (;@1;)
          end
          local.get 3
          local.get 0
          i32.const 1
          call $__sin
          f64.neg
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        local.get 0
        call $__cos
        f64.neg
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      local.get 0
      i32.const 1
      call $__sin
      local.set 3
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $asin (type 9) (param f64) (result f64)
    (local i64 i32 f64 f64 f64)
    block  ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 1
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.const 2147483647
      i32.and
      local.tee 2
      i32.const 1072693248
      i32.lt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const -1072693248
        i32.add
        local.get 1
        i32.wrap_i64
        i32.or
        br_if 0 (;@2;)
        local.get 0
        f64.const 0x1.921fb54442d18p+0 (;=1.5708;)
        f64.mul
        f64.const 0x1p-120 (;=7.52316e-37;)
        f64.add
        return
      end
      f64.const 0x0p+0 (;=0;)
      local.get 0
      local.get 0
      f64.sub
      f64.div
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1071644671
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const -1048576
        i32.add
        i32.const 1044381696
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 0
        local.get 0
        f64.mul
        local.tee 3
        local.get 3
        local.get 3
        local.get 3
        local.get 3
        local.get 3
        f64.const 0x1.23de10dfdf709p-15 (;=3.47933e-05;)
        f64.mul
        f64.const 0x1.9efe07501b288p-11 (;=0.000791535;)
        f64.add
        f64.mul
        f64.const -0x1.48228b5688f3bp-5 (;=-0.0400555;)
        f64.add
        f64.mul
        f64.const 0x1.9c1550e884455p-3 (;=0.201213;)
        f64.add
        f64.mul
        f64.const -0x1.4d61203eb6f7dp-2 (;=-0.325566;)
        f64.add
        f64.mul
        f64.const 0x1.5555555555555p-3 (;=0.166667;)
        f64.add
        f64.mul
        local.get 3
        local.get 3
        local.get 3
        local.get 3
        f64.const 0x1.3b8c5b12e9282p-4 (;=0.0770382;)
        f64.mul
        f64.const -0x1.6066c1b8d0159p-1 (;=-0.688284;)
        f64.add
        f64.mul
        f64.const 0x1.02ae59c598ac8p+1 (;=2.02095;)
        f64.add
        f64.mul
        f64.const -0x1.33a271c8a2d4bp+1 (;=-2.40339;)
        f64.add
        f64.mul
        f64.const 0x1p+0 (;=1;)
        f64.add
        f64.div
        f64.mul
        local.get 0
        f64.add
        return
      end
      f64.const 0x1p+0 (;=1;)
      local.get 0
      f64.abs
      f64.sub
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 0
      local.get 0
      local.get 0
      local.get 0
      local.get 0
      local.get 0
      f64.const 0x1.23de10dfdf709p-15 (;=3.47933e-05;)
      f64.mul
      f64.const 0x1.9efe07501b288p-11 (;=0.000791535;)
      f64.add
      f64.mul
      f64.const -0x1.48228b5688f3bp-5 (;=-0.0400555;)
      f64.add
      f64.mul
      f64.const 0x1.9c1550e884455p-3 (;=0.201213;)
      f64.add
      f64.mul
      f64.const -0x1.4d61203eb6f7dp-2 (;=-0.325566;)
      f64.add
      f64.mul
      f64.const 0x1.5555555555555p-3 (;=0.166667;)
      f64.add
      f64.mul
      local.get 0
      local.get 0
      local.get 0
      local.get 0
      f64.const 0x1.3b8c5b12e9282p-4 (;=0.0770382;)
      f64.mul
      f64.const -0x1.6066c1b8d0159p-1 (;=-0.688284;)
      f64.add
      f64.mul
      f64.const 0x1.02ae59c598ac8p+1 (;=2.02095;)
      f64.add
      f64.mul
      f64.const -0x1.33a271c8a2d4bp+1 (;=-2.40339;)
      f64.add
      f64.mul
      f64.const 0x1p+0 (;=1;)
      f64.add
      f64.div
      local.set 4
      local.get 0
      f64.sqrt
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1072640819
          i32.lt_u
          br_if 0 (;@3;)
          f64.const 0x1.921fb54442d18p+0 (;=1.5708;)
          local.get 3
          local.get 4
          f64.mul
          local.get 3
          f64.add
          local.tee 0
          local.get 0
          f64.add
          f64.const -0x1.1a62633145c07p-54 (;=-6.12323e-17;)
          f64.add
          f64.sub
          local.set 0
          br 1 (;@2;)
        end
        f64.const 0x1.921fb54442d18p-1 (;=0.785398;)
        local.get 3
        i64.reinterpret_f64
        i64.const -4294967296
        i64.and
        f64.reinterpret_i64
        local.tee 5
        local.get 5
        f64.add
        f64.sub
        local.get 3
        local.get 3
        f64.add
        local.get 4
        f64.mul
        f64.const 0x1.1a62633145c07p-54 (;=6.12323e-17;)
        local.get 0
        local.get 5
        local.get 5
        f64.mul
        f64.sub
        local.get 3
        local.get 5
        f64.add
        f64.div
        local.tee 0
        local.get 0
        f64.add
        f64.sub
        f64.sub
        f64.sub
        f64.const 0x1.921fb54442d18p-1 (;=0.785398;)
        f64.add
        local.set 0
      end
      local.get 0
      f64.neg
      local.get 0
      local.get 1
      i64.const 0
      i64.lt_s
      select
      local.set 0
    end
    local.get 0)
  (func $bpbxplug_entry (type 11) (result i32)
    i32.const 3945
    call $bpbxplug_log
    i32.const 3996)
  (func $pluginInit (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 24
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i64.const 0
      i64.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 2
      i32.const 16
      i32.add
      i64.const 0
      i64.store
      local.get 2
      i32.const 8
      i32.add
      i64.const 0
      i64.store
      i32.const 0
      local.set 3
      i32.const 3983
      i32.const 0
      call $bpbxplug_logf
      local.get 1
      local.get 0
      i32.load offset=8
      i32.store offset=32
      i32.const 3895
      local.get 1
      i32.const 32
      i32.add
      call $bpbxplug_logf
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        loop  ;; label = @3
          local.get 1
          local.get 0
          i32.load offset=12
          local.get 3
          i32.add
          f64.load
          f64.store offset=24
          local.get 1
          local.get 4
          i32.store offset=16
          i32.const 3929
          local.get 1
          i32.const 16
          i32.add
          call $bpbxplug_logf
          local.get 3
          i32.const 8
          i32.add
          local.set 3
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          local.get 0
          i32.load offset=8
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 0
      f64.load offset=24
      f64.store
      i32.const 3911
      local.get 1
      call $bpbxplug_logf
    end
    local.get 1
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.ne)
  (func $bpbxplug_logf (type 12) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 4608
    i32.const 128
    local.get 0
    local.get 1
    call $vsnprintf_
    drop
    i32.const 4608
    call $bpbxplug_log
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $pluginDestroy (type 1) (param i32)
    i32.const 3872
    i32.const 0
    call $bpbxplug_logf
    local.get 0
    i32.load offset=4
    call $free)
  (func $pluginTick (type 12) (param i32 i32)
    (local i32 f64)
    local.get 0
    i32.load offset=4
    local.tee 2
    local.get 0
    i32.load offset=12
    local.tee 0
    f64.load
    f64.store
    local.get 0
    f64.load offset=8
    local.set 3
    local.get 2
    local.get 0
    f64.load offset=16
    f64.const 0x1p+0 (;=1;)
    f64.add
    f64.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        f64.abs
        f64.const 0x1p+31 (;=2.14748e+09;)
        f64.lt
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.trunc_f64_s
        local.set 0
        br 1 (;@1;)
      end
      i32.const -2147483648
      local.set 0
    end
    local.get 2
    local.get 0
    i32.store offset=8)
  (func $pluginRender (type 12) (param i32 i32)
    (local i32 f64 f64 f64 f64 f64 i32 i32 f64 i32 f64 f64 f64 f64 f64 f64 f64)
    local.get 0
    i32.load offset=4
    local.tee 2
    f64.load offset=16
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=8
      local.set 1
      f64.const 0x1p+4 (;=16;)
      local.get 2
      f64.load
      local.tee 4
      f64.const -0x1p+4 (;=-16;)
      f64.add
      f64.abs
      f64.sub
      local.tee 5
      f64.const 0x0p+0 (;=0;)
      local.get 5
      f64.const 0x0p+0 (;=0;)
      f64.gt
      select
      local.tee 5
      f64.const 0x1p+0 (;=1;)
      local.get 5
      f64.const 0x1p+0 (;=1;)
      f64.lt
      select
      local.set 6
      f64.const 0x1p+0 (;=1;)
      local.get 4
      f64.abs
      f64.sub
      local.tee 5
      f64.const 0x0p+0 (;=0;)
      local.get 5
      f64.const 0x0p+0 (;=0;)
      f64.gt
      select
      f64.const 0x1p+0 (;=1;)
      local.get 4
      f64.const -0x1p+5 (;=-32;)
      f64.add
      f64.abs
      f64.sub
      local.tee 5
      f64.const 0x0p+0 (;=0;)
      local.get 5
      f64.const 0x0p+0 (;=0;)
      f64.gt
      select
      f64.sub
      local.set 7
      local.get 2
      i32.load offset=8
      local.tee 8
      i32.const 31
      i32.shr_s
      local.tee 9
      local.get 8
      local.get 9
      i32.xor
      i32.sub
      i32.const 1
      i32.add
      local.tee 9
      i32.const 0
      local.get 9
      i32.const 0
      i32.gt_s
      select
      f64.convert_i32_u
      local.set 10
      local.get 8
      i32.const -3
      i32.add
      local.tee 9
      i32.const 31
      i32.shr_s
      local.tee 11
      local.get 9
      local.get 11
      i32.xor
      i32.sub
      i32.const 1
      i32.add
      local.tee 9
      i32.const 0
      local.get 9
      i32.const 0
      i32.gt_s
      select
      f64.convert_i32_u
      local.set 12
      local.get 8
      i32.const -2
      i32.add
      local.tee 9
      i32.const 31
      i32.shr_s
      local.tee 11
      local.get 9
      local.get 11
      i32.xor
      i32.sub
      i32.const 1
      i32.add
      local.tee 9
      i32.const 0
      local.get 9
      i32.const 0
      i32.gt_s
      select
      f64.convert_i32_u
      local.set 13
      local.get 8
      i32.const -1
      i32.add
      local.tee 8
      i32.const 31
      i32.shr_s
      local.tee 9
      local.get 8
      local.get 9
      i32.xor
      i32.sub
      i32.const 1
      i32.add
      local.tee 8
      i32.const 0
      local.get 8
      i32.const 0
      i32.gt_s
      select
      f64.convert_i32_u
      local.set 14
      f64.const 0x1p+0 (;=1;)
      local.get 0
      f64.convert_i32_u
      f64.div
      local.set 15
      loop  ;; label = @2
        local.get 4
        local.get 3
        f64.mul
        f64.const 0x1p-5 (;=0.03125;)
        f64.mul
        local.tee 5
        f64.const 0x1.68p+6 (;=90;)
        f64.add
        call $tan
        local.set 16
        local.get 1
        local.get 6
        local.get 5
        local.get 5
        f64.const 0x1p-1 (;=0.5;)
        f64.mul
        f64.trunc
        local.tee 17
        local.get 17
        f64.add
        f64.sub
        local.get 5
        f64.copysign
        f64.floor
        local.tee 17
        local.get 17
        f64.add
        f64.const -0x1p+0 (;=-1;)
        f64.add
        f64.mul
        local.get 7
        f64.add
        local.get 10
        f64.mul
        local.get 1
        f64.load
        local.tee 17
        f64.mul
        local.get 17
        local.get 5
        call $cos
        call $asin
        f64.const 0x1.45f306dc9c883p-1 (;=0.63662;)
        f64.mul
        local.get 14
        f64.mul
        f64.mul
        f64.add
        local.get 17
        local.get 13
        local.get 5
        f64.const -0x1p+0 (;=-1;)
        f64.add
        local.tee 5
        local.get 5
        f64.const 0x1p-1 (;=0.5;)
        f64.mul
        f64.trunc
        local.tee 18
        local.get 18
        f64.add
        f64.sub
        local.get 5
        f64.copysign
        f64.mul
        f64.mul
        f64.sub
        local.get 17
        local.get 16
        f64.const -0x1p+0 (;=-1;)
        local.get 16
        f64.const -0x1p+0 (;=-1;)
        f64.gt
        select
        local.tee 5
        f64.const 0x1p+0 (;=1;)
        local.get 5
        f64.const 0x1p+0 (;=1;)
        f64.lt
        select
        local.get 12
        f64.mul
        f64.mul
        f64.sub
        f64.store
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 3
        local.get 15
        f64.add
        local.set 3
        local.get 0
        i32.const -1
        i32.add
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    local.get 2
    local.get 3
    f64.store offset=16)
  (func $memset (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 33
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        local.get 2
        memory.fill
        local.get 0
        return
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 5
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      i32.const 60
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=24
      local.get 5
      local.get 3
      i32.store offset=20
      local.get 5
      local.get 3
      i32.store offset=16
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 5
      local.get 2
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 6
        i64.store
        local.get 2
        i32.const 24
        i32.add
        local.get 6
        i64.store
        local.get 2
        i32.const 16
        i32.add
        local.get 6
        i64.store
        local.get 2
        i32.const 8
        i32.add
        local.get 6
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const -32
        i32.add
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $_vsnprintf (type 7) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32)
    local.get 0
    i32.const 5
    local.get 1
    select
    local.set 5
    i32.const 0
    local.set 6
    loop (result i32)  ;; label = @1
      local.get 3
      i32.const 2
      i32.add
      local.set 0
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load8_u
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 37
                  i32.ne
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 7
                  block  ;; label = @8
                    loop  ;; label = @9
                      i32.const 1
                      local.set 3
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  i32.const -1
                                  i32.add
                                  local.tee 8
                                  i32.load8_u
                                  local.tee 9
                                  i32.const -43
                                  i32.add
                                  br_table 2 (;@13;) 7 (;@8;) 1 (;@14;) 7 (;@8;) 7 (;@8;) 5 (;@10;) 0 (;@15;)
                                end
                                local.get 9
                                i32.const -32
                                i32.add
                                br_table 2 (;@12;) 6 (;@8;) 6 (;@8;) 3 (;@11;) 6 (;@8;)
                              end
                              i32.const 2
                              local.set 3
                              br 3 (;@10;)
                            end
                            i32.const 4
                            local.set 3
                            br 2 (;@10;)
                          end
                          i32.const 8
                          local.set 3
                          br 1 (;@10;)
                        end
                        i32.const 16
                        local.set 3
                      end
                      local.get 0
                      i32.const 1
                      i32.add
                      local.set 0
                      local.get 7
                      local.get 3
                      i32.or
                      local.set 7
                      br 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 9
                      i32.const -48
                      i32.add
                      i32.const 255
                      i32.and
                      i32.const 9
                      i32.gt_u
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 3
                      loop  ;; label = @10
                        local.get 3
                        i32.const 10
                        i32.mul
                        local.get 9
                        i32.const 255
                        i32.and
                        i32.add
                        i32.const -48
                        i32.add
                        local.set 3
                        local.get 8
                        i32.load8_u offset=1
                        local.set 9
                        local.get 8
                        i32.const 1
                        i32.add
                        local.tee 0
                        local.set 8
                        local.get 9
                        i32.const -48
                        i32.add
                        i32.const 255
                        i32.and
                        i32.const 10
                        i32.lt_u
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                    end
                    i32.const 0
                    local.set 3
                    block  ;; label = @9
                      local.get 9
                      i32.const 42
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 8
                      local.set 0
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.load
                    local.tee 9
                    local.get 9
                    i32.const 31
                    i32.shr_s
                    local.tee 3
                    i32.xor
                    local.get 3
                    i32.sub
                    local.set 3
                    local.get 4
                    i32.const 4
                    i32.add
                    local.set 4
                    local.get 9
                    i32.const 30
                    i32.shr_u
                    i32.const 2
                    i32.and
                    local.get 7
                    i32.or
                    local.set 7
                    local.get 0
                    i32.load8_u
                    local.set 9
                  end
                  i32.const 0
                  local.set 10
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 9
                      i32.const 255
                      i32.and
                      i32.const 46
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 0
                    i32.const 1
                    i32.add
                    local.set 8
                    local.get 7
                    i32.const 1024
                    i32.or
                    local.set 7
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u offset=1
                      local.tee 9
                      i32.const -48
                      i32.add
                      i32.const 255
                      i32.and
                      i32.const 9
                      i32.gt_u
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 10
                      loop  ;; label = @10
                        local.get 10
                        i32.const 10
                        i32.mul
                        local.get 9
                        i32.const 255
                        i32.and
                        i32.add
                        i32.const -48
                        i32.add
                        local.set 10
                        local.get 8
                        i32.load8_u offset=1
                        local.set 9
                        local.get 8
                        i32.const 1
                        i32.add
                        local.tee 0
                        local.set 8
                        local.get 9
                        i32.const -48
                        i32.add
                        i32.const 255
                        i32.and
                        i32.const 10
                        i32.lt_u
                        br_if 0 (;@10;)
                      end
                      local.get 0
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 9
                    i32.const 255
                    i32.and
                    i32.const 42
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 4
                    i32.load
                    local.tee 9
                    i32.const 0
                    local.get 9
                    i32.const 0
                    i32.gt_s
                    select
                    local.set 10
                    local.get 0
                    i32.const 2
                    i32.add
                    local.set 8
                    local.get 4
                    i32.const 4
                    i32.add
                    local.set 4
                    local.get 0
                    i32.load8_u offset=2
                    local.set 9
                  end
                  i32.const 1
                  local.set 11
                  i32.const 256
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 9
                            i32.extend8_s
                            i32.const -104
                            i32.add
                            i32.const 31
                            i32.rotl
                            br_table 1 (;@11;) 2 (;@10;) 0 (;@12;) 4 (;@8;) 4 (;@8;) 4 (;@8;) 3 (;@9;) 4 (;@8;) 4 (;@8;) 3 (;@9;) 4 (;@8;)
                          end
                          block  ;; label = @12
                            local.get 8
                            i32.load8_u offset=1
                            local.tee 9
                            i32.const 108
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 8
                            i32.const 1
                            i32.add
                            local.set 8
                            local.get 7
                            i32.const 256
                            i32.or
                            local.set 7
                            br 4 (;@8;)
                          end
                          i32.const 2
                          local.set 11
                          i32.const 768
                          local.set 0
                          br 2 (;@9;)
                        end
                        block  ;; label = @11
                          local.get 8
                          i32.load8_u offset=1
                          local.tee 9
                          i32.const 104
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 8
                          i32.const 1
                          i32.add
                          local.set 8
                          local.get 7
                          i32.const 128
                          i32.or
                          local.set 7
                          br 3 (;@8;)
                        end
                        i32.const 2
                        local.set 11
                        i32.const 192
                        local.set 0
                        br 1 (;@9;)
                      end
                      i32.const 512
                      local.set 0
                    end
                    local.get 7
                    local.get 0
                    i32.or
                    local.set 7
                    local.get 8
                    local.get 11
                    i32.add
                    local.tee 8
                    i32.load8_u
                    local.set 9
                  end
                  i32.const 16
                  local.set 11
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 9
                                        i32.const 255
                                        i32.and
                                        local.tee 0
                                        i32.const 97
                                        i32.gt_s
                                        br_if 0 (;@18;)
                                        block  ;; label = @19
                                          local.get 0
                                          i32.const -69
                                          i32.add
                                          br_table 7 (;@12;) 5 (;@14;) 6 (;@13;) 0 (;@19;)
                                        end
                                        local.get 0
                                        i32.const 37
                                        i32.eq
                                        br_if 10 (;@8;)
                                        local.get 0
                                        i32.const 88
                                        i32.eq
                                        br_if 1 (;@17;)
                                        br 14 (;@4;)
                                      end
                                      i32.const 8
                                      local.set 12
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 0
                                          i32.const -98
                                          i32.add
                                          br_table 0 (;@19;) 8 (;@11;) 1 (;@18;) 7 (;@12;) 5 (;@14;) 6 (;@13;) 15 (;@4;) 1 (;@18;) 15 (;@4;) 15 (;@4;) 15 (;@4;) 15 (;@4;) 15 (;@4;) 3 (;@16;) 10 (;@9;) 15 (;@4;) 15 (;@4;) 9 (;@10;) 15 (;@4;) 1 (;@18;) 15 (;@4;) 15 (;@4;) 2 (;@17;) 15 (;@4;)
                                        end
                                        i32.const 2
                                        local.set 12
                                        br 2 (;@16;)
                                      end
                                      local.get 7
                                      i32.const -17
                                      i32.and
                                      local.set 7
                                      i32.const 10
                                      local.set 11
                                    end
                                    local.get 7
                                    i32.const 32
                                    i32.or
                                    local.get 7
                                    local.get 0
                                    i32.const 88
                                    i32.eq
                                    select
                                    local.set 7
                                    block  ;; label = @17
                                      local.get 0
                                      i32.const 100
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 11
                                      local.set 12
                                      br 2 (;@15;)
                                    end
                                    local.get 11
                                    local.set 12
                                    local.get 0
                                    i32.const 105
                                    i32.eq
                                    br_if 1 (;@15;)
                                  end
                                  local.get 7
                                  i32.const -13
                                  i32.and
                                  local.set 7
                                end
                                local.get 7
                                i32.const -2
                                i32.and
                                local.get 7
                                local.get 7
                                i32.const 1024
                                i32.and
                                select
                                local.set 7
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 0
                                    i32.const 105
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 100
                                    i32.ne
                                    br_if 1 (;@15;)
                                  end
                                  block  ;; label = @16
                                    local.get 7
                                    i32.const 512
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 4
                                    i32.const 7
                                    i32.add
                                    i32.const -8
                                    i32.and
                                    local.tee 0
                                    i32.const 8
                                    i32.add
                                    local.set 4
                                    local.get 5
                                    local.get 1
                                    local.get 6
                                    local.get 2
                                    local.get 0
                                    i64.load
                                    local.tee 13
                                    local.get 13
                                    i64.const 63
                                    i64.shr_s
                                    local.tee 14
                                    i64.xor
                                    local.get 14
                                    i64.sub
                                    local.get 13
                                    i64.const 63
                                    i64.shr_u
                                    i32.wrap_i64
                                    local.get 12
                                    i64.extend_i32_u
                                    local.get 10
                                    local.get 3
                                    local.get 7
                                    call $_ntoa_long_long
                                    local.set 6
                                    br 14 (;@2;)
                                  end
                                  block  ;; label = @16
                                    local.get 7
                                    i32.const 256
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 4
                                    i32.load
                                    local.set 0
                                    local.get 4
                                    i32.const 4
                                    i32.add
                                    local.set 4
                                    local.get 5
                                    local.get 1
                                    local.get 6
                                    local.get 2
                                    local.get 0
                                    local.get 0
                                    i32.const 31
                                    i32.shr_s
                                    local.tee 9
                                    i32.xor
                                    local.get 9
                                    i32.sub
                                    local.get 0
                                    i32.const 31
                                    i32.shr_u
                                    local.get 12
                                    local.get 10
                                    local.get 3
                                    local.get 7
                                    call $_ntoa_long
                                    local.set 6
                                    br 14 (;@2;)
                                  end
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 7
                                      i32.const 64
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 4
                                      i32.load8_s
                                      local.set 0
                                      br 1 (;@16;)
                                    end
                                    local.get 4
                                    i32.load
                                    local.set 0
                                    local.get 7
                                    i32.const 128
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.extend16_s
                                    local.set 0
                                  end
                                  local.get 4
                                  i32.const 4
                                  i32.add
                                  local.set 4
                                  local.get 5
                                  local.get 1
                                  local.get 6
                                  local.get 2
                                  local.get 0
                                  local.get 0
                                  i32.const 31
                                  i32.shr_s
                                  local.tee 9
                                  i32.xor
                                  local.get 9
                                  i32.sub
                                  local.get 0
                                  i32.const 31
                                  i32.shr_u
                                  local.get 12
                                  local.get 10
                                  local.get 3
                                  local.get 7
                                  call $_ntoa_long
                                  local.set 6
                                  br 13 (;@2;)
                                end
                                block  ;; label = @15
                                  local.get 7
                                  i32.const 512
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 4
                                  i32.const 7
                                  i32.add
                                  i32.const -8
                                  i32.and
                                  local.tee 0
                                  i32.const 8
                                  i32.add
                                  local.set 4
                                  local.get 5
                                  local.get 1
                                  local.get 6
                                  local.get 2
                                  local.get 0
                                  i64.load
                                  i32.const 0
                                  local.get 12
                                  i64.extend_i32_u
                                  local.get 10
                                  local.get 3
                                  local.get 7
                                  call $_ntoa_long_long
                                  local.set 6
                                  br 13 (;@2;)
                                end
                                block  ;; label = @15
                                  local.get 7
                                  i32.const 256
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 5
                                  local.get 1
                                  local.get 6
                                  local.get 2
                                  local.get 4
                                  i32.load
                                  i32.const 0
                                  local.get 12
                                  local.get 10
                                  local.get 3
                                  local.get 7
                                  call $_ntoa_long
                                  local.set 6
                                  local.get 4
                                  i32.const 4
                                  i32.add
                                  local.set 4
                                  br 13 (;@2;)
                                end
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 7
                                    i32.const 64
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 4
                                    i32.load8_u
                                    local.set 0
                                    br 1 (;@15;)
                                  end
                                  local.get 4
                                  i32.load
                                  local.tee 0
                                  i32.const 65535
                                  i32.and
                                  local.get 0
                                  local.get 7
                                  i32.const 128
                                  i32.and
                                  select
                                  local.set 0
                                end
                                local.get 4
                                i32.const 4
                                i32.add
                                local.set 4
                                local.get 5
                                local.get 1
                                local.get 6
                                local.get 2
                                local.get 0
                                i32.const 0
                                local.get 12
                                local.get 10
                                local.get 3
                                local.get 7
                                call $_ntoa_long
                                local.set 6
                                br 12 (;@2;)
                              end
                              local.get 4
                              i32.const 7
                              i32.add
                              i32.const -8
                              i32.and
                              local.tee 9
                              i32.const 8
                              i32.add
                              local.set 4
                              local.get 5
                              local.get 1
                              local.get 6
                              local.get 2
                              local.get 9
                              f64.load
                              local.get 10
                              local.get 3
                              local.get 7
                              i32.const 32
                              i32.or
                              local.get 7
                              local.get 0
                              i32.const 70
                              i32.eq
                              select
                              call $_ftoa
                              local.set 6
                              br 11 (;@2;)
                            end
                            local.get 7
                            i32.const 2048
                            i32.or
                            local.set 7
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.const -69
                              i32.add
                              br_table 0 (;@13;) 1 (;@12;) 0 (;@13;) 1 (;@12;)
                            end
                            local.get 7
                            i32.const 32
                            i32.or
                            local.set 7
                          end
                          local.get 4
                          i32.const 7
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 0
                          i32.const 8
                          i32.add
                          local.set 4
                          local.get 5
                          local.get 1
                          local.get 6
                          local.get 2
                          local.get 0
                          f64.load
                          local.get 10
                          local.get 3
                          local.get 7
                          call $_etoa
                          local.set 6
                          br 9 (;@2;)
                        end
                        i32.const 1
                        local.set 9
                        block  ;; label = @11
                          local.get 7
                          i32.const 2
                          i32.and
                          local.tee 10
                          br_if 0 (;@11;)
                          i32.const 2
                          local.set 9
                          local.get 3
                          i32.const 2
                          i32.lt_u
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const -1
                          i32.add
                          local.set 7
                          local.get 3
                          i32.const 1
                          i32.add
                          local.set 9
                          i32.const 0
                          local.set 0
                          loop  ;; label = @12
                            i32.const 32
                            local.get 1
                            local.get 6
                            local.get 0
                            i32.add
                            local.get 2
                            local.get 5
                            call_indirect (type 0)
                            local.get 7
                            local.get 0
                            i32.const 1
                            i32.add
                            local.tee 0
                            i32.ne
                            br_if 0 (;@12;)
                          end
                          local.get 6
                          local.get 0
                          i32.add
                          local.set 6
                        end
                        local.get 4
                        i32.load8_s
                        local.get 1
                        local.get 6
                        local.get 2
                        local.get 5
                        call_indirect (type 0)
                        local.get 6
                        i32.const 1
                        i32.add
                        local.set 6
                        local.get 4
                        i32.const 4
                        i32.add
                        local.set 4
                        local.get 10
                        i32.eqz
                        br_if 8 (;@2;)
                        local.get 3
                        local.get 9
                        i32.le_u
                        br_if 8 (;@2;)
                        local.get 3
                        local.get 9
                        i32.sub
                        local.set 0
                        loop  ;; label = @11
                          i32.const 32
                          local.get 1
                          local.get 6
                          local.get 2
                          local.get 5
                          call_indirect (type 0)
                          local.get 6
                          i32.const 1
                          i32.add
                          local.set 6
                          local.get 0
                          i32.const -1
                          i32.add
                          local.tee 0
                          br_if 0 (;@11;)
                          br 9 (;@2;)
                        end
                      end
                      local.get 4
                      i32.load
                      local.tee 15
                      local.set 12
                      block  ;; label = @10
                        local.get 15
                        i32.load8_u
                        local.tee 11
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 10
                        i32.const -1
                        local.get 10
                        select
                        i32.const -1
                        i32.add
                        local.set 16
                        local.get 15
                        local.set 0
                        loop  ;; label = @11
                          local.get 16
                          local.set 9
                          local.get 0
                          i32.const 1
                          i32.add
                          local.set 12
                          local.get 0
                          i32.load8_u offset=1
                          i32.eqz
                          br_if 1 (;@10;)
                          local.get 9
                          i32.const -1
                          i32.add
                          local.set 16
                          local.get 12
                          local.set 0
                          local.get 9
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 12
                      local.get 15
                      i32.sub
                      local.tee 0
                      local.get 10
                      local.get 0
                      local.get 10
                      i32.lt_u
                      select
                      local.get 0
                      local.get 7
                      i32.const 1024
                      i32.and
                      local.tee 9
                      select
                      local.set 12
                      block  ;; label = @10
                        local.get 7
                        i32.const 2
                        i32.and
                        local.tee 16
                        br_if 0 (;@10;)
                        block  ;; label = @11
                          local.get 3
                          local.get 12
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 12
                          i32.const 1
                          i32.add
                          local.set 12
                          br 1 (;@10;)
                        end
                        local.get 3
                        local.get 12
                        i32.sub
                        local.set 7
                        local.get 3
                        i32.const 1
                        i32.add
                        local.set 12
                        i32.const 0
                        local.set 0
                        loop  ;; label = @11
                          i32.const 32
                          local.get 1
                          local.get 6
                          local.get 0
                          i32.add
                          local.get 2
                          local.get 5
                          call_indirect (type 0)
                          local.get 7
                          local.get 0
                          i32.const 1
                          i32.add
                          local.tee 0
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        local.get 6
                        local.get 0
                        i32.add
                        local.set 6
                        local.get 15
                        i32.load8_u
                        local.set 11
                      end
                      block  ;; label = @10
                        local.get 11
                        i32.const 255
                        i32.and
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 15
                        i32.const 1
                        i32.add
                        local.set 0
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 9
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 10
                            i32.eqz
                            br_if 2 (;@10;)
                            local.get 10
                            i32.const -1
                            i32.add
                            local.set 10
                          end
                          local.get 11
                          i32.extend8_s
                          local.get 1
                          local.get 6
                          local.get 2
                          local.get 5
                          call_indirect (type 0)
                          local.get 6
                          i32.const 1
                          i32.add
                          local.set 6
                          local.get 0
                          i32.load8_u
                          local.set 11
                          local.get 0
                          i32.const 1
                          i32.add
                          local.set 0
                          local.get 11
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 4
                      i32.const 4
                      i32.add
                      local.set 4
                      local.get 16
                      i32.eqz
                      br_if 7 (;@2;)
                      local.get 3
                      local.get 12
                      i32.le_u
                      br_if 7 (;@2;)
                      local.get 3
                      local.get 12
                      i32.sub
                      local.set 0
                      loop  ;; label = @10
                        i32.const 32
                        local.get 1
                        local.get 6
                        local.get 2
                        local.get 5
                        call_indirect (type 0)
                        local.get 6
                        i32.const 1
                        i32.add
                        local.set 6
                        local.get 0
                        i32.const -1
                        i32.add
                        local.tee 0
                        br_if 0 (;@10;)
                        br 8 (;@2;)
                      end
                    end
                    local.get 5
                    local.get 1
                    local.get 6
                    local.get 2
                    local.get 4
                    i32.load
                    i32.const 0
                    i32.const 16
                    local.get 10
                    i32.const 8
                    local.get 7
                    i32.const 33
                    i32.or
                    call $_ntoa_long
                    local.set 6
                    local.get 4
                    i32.const 4
                    i32.add
                    local.set 4
                    br 6 (;@2;)
                  end
                  i32.const 37
                  local.get 1
                  local.get 6
                  local.get 2
                  local.get 5
                  call_indirect (type 0)
                  br 4 (;@3;)
                end
                i32.const 0
                local.get 1
                local.get 6
                local.get 2
                i32.const -1
                i32.add
                local.get 6
                local.get 2
                i32.lt_u
                select
                local.get 2
                local.get 5
                call_indirect (type 0)
                local.get 6
                return
              end
              local.get 7
              i32.extend8_s
              local.get 1
              local.get 6
              local.get 2
              local.get 5
              call_indirect (type 0)
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              local.get 6
              i32.const 1
              i32.add
              local.set 6
              br 0 (;@5;)
            end
          end
          local.get 9
          i32.extend8_s
          local.get 1
          local.get 6
          local.get 2
          local.get 5
          call_indirect (type 0)
        end
        local.get 6
        i32.const 1
        i32.add
        local.set 6
      end
      local.get 8
      i32.const 1
      i32.add
      local.set 3
      br 0 (;@1;)
    end)
  (func $_out_null (type 0) (param i32 i32 i32 i32))
  (func $_ntoa_long_long (type 13) (param i32 i32 i32 i32 i64 i32 i64 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 10
    global.set $__stack_pointer
    local.get 9
    local.get 9
    i32.const -17
    i32.and
    local.get 4
    i64.const 0
    i64.ne
    local.tee 11
    select
    local.set 12
    block  ;; label = @1
      block  ;; label = @2
        local.get 11
        br_if 0 (;@2;)
        i32.const 0
        local.set 11
        local.get 12
        i32.const 1024
        i32.and
        br_if 1 (;@1;)
      end
      local.get 12
      i32.const 32
      i32.and
      i32.const 97
      i32.xor
      i32.const 246
      i32.add
      local.set 13
      i32.const 0
      local.set 9
      loop  ;; label = @2
        local.get 10
        local.get 9
        i32.add
        local.get 4
        local.get 4
        local.get 6
        i64.div_u
        local.tee 14
        local.get 6
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 11
        i32.const 48
        i32.or
        local.get 13
        local.get 11
        i32.add
        local.get 11
        i32.const 254
        i32.and
        i32.const 10
        i32.lt_u
        select
        i32.store8
        local.get 9
        i32.const 1
        i32.add
        local.set 11
        local.get 4
        local.get 6
        i64.lt_u
        br_if 1 (;@1;)
        local.get 9
        i32.const 31
        i32.lt_u
        local.set 15
        local.get 11
        local.set 9
        local.get 14
        local.set 4
        local.get 15
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 10
    local.get 11
    local.get 5
    local.get 6
    i32.wrap_i64
    local.get 7
    local.get 8
    local.get 12
    call $_ntoa_format
    local.set 9
    local.get 10
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 9)
  (func $_ntoa_long (type 14) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 10
    global.set $__stack_pointer
    local.get 9
    local.get 9
    i32.const -17
    i32.and
    local.get 4
    select
    local.set 11
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        i32.const 0
        local.set 12
        local.get 11
        i32.const 1024
        i32.and
        br_if 1 (;@1;)
      end
      local.get 11
      i32.const 32
      i32.and
      i32.const 97
      i32.xor
      i32.const 246
      i32.add
      local.set 13
      i32.const 0
      local.set 9
      loop  ;; label = @2
        local.get 10
        local.get 9
        i32.add
        local.get 4
        local.get 4
        local.get 6
        i32.div_u
        local.tee 14
        local.get 6
        i32.mul
        i32.sub
        local.tee 12
        i32.const 48
        i32.or
        local.get 13
        local.get 12
        i32.add
        local.get 12
        i32.const 254
        i32.and
        i32.const 10
        i32.lt_u
        select
        i32.store8
        local.get 9
        i32.const 1
        i32.add
        local.set 12
        local.get 4
        local.get 6
        i32.lt_u
        br_if 1 (;@1;)
        local.get 9
        i32.const 31
        i32.lt_u
        local.set 15
        local.get 12
        local.set 9
        local.get 14
        local.set 4
        local.get 15
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 10
    local.get 12
    local.get 5
    local.get 6
    local.get 7
    local.get 8
    local.get 11
    call $_ntoa_format
    local.set 4
    local.get 10
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ftoa (type 15) (param i32 i32 i32 i32 f64 i32 i32 i32) (result i32)
    (local i32 i32 f64 i32 i32 i32 f64 f64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 8
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        local.get 4
        f64.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 3887
        i32.const 3
        local.get 6
        local.get 7
        call $_out_rev
        local.set 9
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        f64.const -0x1.fffffffffffffp+1023 (;=-1.79769e+308;)
        f64.lt
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 3973
        i32.const 4
        local.get 6
        local.get 7
        call $_out_rev
        local.set 9
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        f64.const 0x1.fffffffffffffp+1023 (;=1.79769e+308;)
        f64.gt
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 3978
        i32.const 3891
        local.get 7
        i32.const 4
        i32.and
        local.tee 9
        select
        i32.const 4
        i32.const 3
        local.get 9
        select
        local.get 6
        local.get 7
        call $_out_rev
        local.set 9
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        f64.abs
        f64.const 0x1.dcd65p+29 (;=1e+09;)
        f64.gt
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        local.get 4
        local.get 5
        local.get 6
        local.get 7
        call $_etoa
        local.set 9
        br 1 (;@1;)
      end
      f64.const 0x0p+0 (;=0;)
      local.get 4
      f64.sub
      local.get 4
      local.get 4
      f64.const 0x0p+0 (;=0;)
      f64.lt
      select
      local.set 10
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 6
          local.get 7
          i32.const 1024
          i32.and
          select
          local.tee 11
          i32.const 10
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          i32.const 0
          local.set 9
          br 1 (;@2;)
        end
        local.get 8
        i32.const 48
        local.get 11
        i32.const -10
        i32.add
        local.tee 9
        i32.const 31
        local.get 9
        i32.const 31
        i32.lt_u
        select
        i32.const 1
        i32.add
        local.tee 9
        call $memset
        drop
        i32.const 0
        local.set 12
        loop  ;; label = @3
          local.get 9
          local.get 12
          i32.const 1
          i32.add
          local.tee 12
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 5
        local.get 12
        i32.sub
        local.set 11
        local.get 12
        i32.const -1
        i32.add
        i32.const 31
        i32.lt_u
        local.set 5
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 10
          f64.abs
          f64.const 0x1p+31 (;=2.14748e+09;)
          f64.lt
          i32.eqz
          br_if 0 (;@3;)
          local.get 10
          i32.trunc_f64_s
          local.set 13
          br 1 (;@2;)
        end
        i32.const -2147483648
        local.set 13
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 10
          local.get 13
          f64.convert_i32_s
          f64.sub
          local.get 11
          i32.const 3
          i32.shl
          i32.const 4016
          i32.add
          f64.load
          local.tee 14
          f64.mul
          local.tee 15
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 15
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 15
          i32.trunc_f64_u
          local.set 12
          br 1 (;@2;)
        end
        i32.const 0
        local.set 12
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 15
          local.get 12
          f64.convert_i32_u
          f64.sub
          local.tee 15
          f64.const 0x1p-1 (;=0.5;)
          f64.gt
          i32.eqz
          br_if 0 (;@3;)
          local.get 14
          local.get 12
          i32.const 1
          i32.add
          local.tee 12
          f64.convert_i32_u
          f64.le
          i32.eqz
          br_if 1 (;@2;)
          local.get 13
          i32.const 1
          i32.add
          local.set 13
          i32.const 0
          local.set 12
          br 1 (;@2;)
        end
        local.get 15
        f64.const 0x1p-1 (;=0.5;)
        f64.lt
        br_if 0 (;@2;)
        local.get 12
        i32.eqz
        local.get 12
        i32.or
        i32.const 1
        i32.and
        local.get 12
        i32.add
        local.set 12
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 11
            br_if 0 (;@4;)
            local.get 13
            local.get 10
            local.get 13
            f64.convert_i32_s
            f64.sub
            f64.const 0x1p-1 (;=0.5;)
            f64.lt
            i32.const 1
            i32.xor
            local.get 13
            i32.and
            i32.add
            local.set 13
            br 1 (;@3;)
          end
          i32.const 32
          local.set 16
          local.get 5
          i32.eqz
          br_if 1 (;@2;)
          local.get 8
          local.get 9
          i32.add
          local.set 17
          i32.const 0
          local.set 5
          block  ;; label = @4
            loop  ;; label = @5
              local.get 17
              local.get 5
              i32.add
              local.get 12
              local.get 12
              i32.const 10
              i32.div_u
              local.tee 18
              i32.const 10
              i32.mul
              i32.sub
              i32.const 48
              i32.or
              i32.store8
              local.get 5
              i32.const 1
              i32.add
              local.set 19
              local.get 9
              local.get 5
              i32.add
              i32.const 30
              i32.gt_u
              br_if 1 (;@4;)
              local.get 12
              i32.const 9
              i32.gt_u
              local.set 20
              local.get 19
              local.set 5
              local.get 18
              local.set 12
              local.get 20
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            local.get 9
            local.get 19
            i32.add
            local.tee 12
            i32.const -1
            i32.add
            i32.const 30
            i32.gt_u
            local.tee 18
            br_if 0 (;@4;)
            local.get 11
            local.get 19
            i32.eq
            br_if 0 (;@4;)
            local.get 9
            local.get 19
            i32.add
            local.tee 20
            local.get 8
            i32.add
            i32.const 48
            local.get 19
            i32.const -1
            i32.xor
            local.get 11
            i32.add
            local.tee 19
            i32.const 31
            local.get 20
            i32.sub
            local.tee 9
            local.get 19
            local.get 9
            i32.lt_u
            select
            i32.const 1
            i32.add
            call $memset
            drop
            i32.const 0
            local.set 9
            block  ;; label = @5
              loop  ;; label = @6
                local.get 9
                i32.const 1
                i32.add
                local.set 12
                local.get 20
                local.get 9
                i32.add
                i32.const 30
                i32.gt_u
                local.tee 18
                br_if 1 (;@5;)
                local.get 19
                local.get 9
                i32.ne
                local.set 5
                local.get 12
                local.set 9
                local.get 5
                br_if 0 (;@6;)
              end
            end
            local.get 20
            local.get 12
            i32.add
            local.set 12
          end
          local.get 18
          br_if 1 (;@2;)
          local.get 8
          local.get 12
          i32.add
          i32.const 46
          i32.store8
          local.get 12
          i32.const 1
          i32.add
          local.set 9
        end
        i32.const 32
        local.set 16
        local.get 9
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 8
          local.get 9
          i32.add
          local.get 13
          local.get 13
          i32.const 10
          i32.div_s
          local.tee 12
          i32.const 10
          i32.mul
          i32.sub
          i32.const 48
          i32.add
          i32.store8
          local.get 9
          i32.const 1
          i32.add
          local.set 16
          local.get 9
          i32.const 30
          i32.gt_u
          br_if 1 (;@2;)
          local.get 13
          i32.const -10
          i32.add
          local.set 5
          local.get 16
          local.set 9
          local.get 12
          local.set 13
          local.get 5
          i32.const -19
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          i32.const 3
          i32.and
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            local.get 6
            local.get 4
            f64.const 0x0p+0 (;=0;)
            f64.lt
            local.get 7
            i32.const 12
            i32.and
            i32.const 0
            i32.ne
            i32.or
            i32.sub
            local.set 6
          end
          local.get 6
          i32.const 32
          local.get 6
          i32.const 32
          i32.lt_u
          select
          local.tee 9
          local.get 16
          i32.le_u
          br_if 0 (;@3;)
          local.get 8
          local.get 16
          i32.add
          i32.const 48
          local.get 9
          local.get 16
          i32.sub
          call $memset
          drop
          br 1 (;@2;)
        end
        local.get 16
        local.set 9
      end
      i32.const 32
      local.set 12
      block  ;; label = @2
        local.get 9
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            f64.const 0x0p+0 (;=0;)
            f64.lt
            i32.eqz
            br_if 0 (;@4;)
            i32.const 45
            local.set 12
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 7
            i32.const 4
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            i32.const 43
            local.set 12
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 7
            i32.const 8
            i32.and
            br_if 0 (;@4;)
            local.get 9
            local.set 12
            br 2 (;@2;)
          end
          i32.const 32
          local.set 12
        end
        local.get 8
        local.get 9
        i32.add
        local.get 12
        i32.store8
        local.get 9
        i32.const 1
        i32.add
        local.set 12
      end
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      local.get 8
      local.get 12
      local.get 6
      local.get 7
      call $_out_rev
      local.set 9
    end
    local.get 8
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 9)
  (func $_etoa (type 15) (param i32 i32 i32 i32 f64 i32 i32 i32) (result i32)
    (local f64 i64 f64 i32 f64 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        f64.const -0x1.fffffffffffffp+1023 (;=-1.79769e+308;)
        f64.lt
        br_if 0 (;@2;)
        local.get 4
        local.get 4
        f64.ne
        br_if 0 (;@2;)
        local.get 4
        f64.const 0x1.fffffffffffffp+1023 (;=1.79769e+308;)
        f64.gt
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      local.get 6
      local.get 7
      call $_ftoa
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        f64.neg
        local.get 4
        local.get 4
        f64.const 0x0p+0 (;=0;)
        f64.lt
        select
        local.tee 8
        i64.reinterpret_f64
        local.tee 9
        i64.const 4503599627370495
        i64.and
        i64.const 4607182418800017408
        i64.or
        f64.reinterpret_i64
        f64.const -0x1.8p+0 (;=-1.5;)
        f64.add
        f64.const 0x1.287a7636f4361p-2 (;=0.28953;)
        f64.mul
        local.get 9
        i64.const 52
        i64.shr_u
        i32.wrap_i64
        i32.const 2047
        i32.and
        i32.const -1023
        i32.add
        f64.convert_i32_s
        f64.const 0x1.34413509f79fbp-2 (;=0.30103;)
        f64.mul
        f64.const 0x1.68a288b60c8b3p-3 (;=0.176091;)
        f64.add
        f64.add
        local.tee 10
        f64.abs
        f64.const 0x1p+31 (;=2.14748e+09;)
        f64.lt
        i32.eqz
        br_if 0 (;@2;)
        local.get 10
        i32.trunc_f64_s
        local.set 11
        br 1 (;@1;)
      end
      i32.const -2147483648
      local.set 11
    end
    local.get 11
    f64.convert_i32_s
    local.tee 10
    f64.const 0x1.26bb1bbb55516p+1 (;=2.30259;)
    f64.mul
    local.set 12
    block  ;; label = @1
      block  ;; label = @2
        local.get 10
        f64.const 0x1.a934f0979a371p+1 (;=3.32193;)
        f64.mul
        f64.const 0x1p-1 (;=0.5;)
        f64.add
        local.tee 10
        f64.abs
        f64.const 0x1p+31 (;=2.14748e+09;)
        f64.lt
        i32.eqz
        br_if 0 (;@2;)
        local.get 10
        i32.trunc_f64_s
        local.set 13
        br 1 (;@1;)
      end
      i32.const -2147483648
      local.set 13
    end
    local.get 7
    i32.const 1024
    i32.and
    local.set 14
    block  ;; label = @1
      local.get 8
      local.get 12
      local.get 13
      f64.convert_i32_s
      f64.const -0x1.62e42fefa39efp-1 (;=-0.693147;)
      f64.mul
      f64.add
      local.tee 10
      local.get 10
      f64.add
      f64.const 0x1p+1 (;=2;)
      local.get 10
      f64.sub
      local.get 10
      local.get 10
      f64.mul
      local.tee 10
      local.get 10
      local.get 10
      f64.const 0x1.cp+3 (;=14;)
      f64.div
      f64.const 0x1.4p+3 (;=10;)
      f64.add
      f64.div
      f64.const 0x1.8p+2 (;=6;)
      f64.add
      f64.div
      f64.add
      f64.div
      f64.const 0x1p+0 (;=1;)
      f64.add
      local.get 13
      i32.const 1023
      i32.add
      i64.extend_i32_u
      i64.const 52
      i64.shl
      f64.reinterpret_i64
      f64.mul
      local.tee 10
      f64.lt
      i32.eqz
      br_if 0 (;@1;)
      local.get 10
      f64.const 0x1.4p+3 (;=10;)
      f64.div
      local.set 10
      local.get 11
      i32.const -1
      i32.add
      local.set 11
    end
    local.get 5
    i32.const 6
    local.get 14
    select
    local.set 15
    i32.const 4
    i32.const 5
    local.get 11
    i32.const 99
    i32.add
    i32.const 199
    i32.lt_u
    select
    local.set 13
    block  ;; label = @1
      local.get 7
      i32.const 2048
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 8
        f64.const 0x1.a36e2eb1c432dp-14 (;=0.0001;)
        f64.ge
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        f64.const 0x1.e848p+19 (;=1e+06;)
        f64.lt
        i32.eqz
        br_if 0 (;@2;)
        local.get 15
        local.get 11
        i32.gt_s
        local.set 5
        local.get 11
        i32.const -1
        i32.xor
        local.set 13
        i32.const 0
        local.set 11
        local.get 15
        local.get 13
        i32.add
        i32.const 0
        local.get 5
        select
        local.set 15
        local.get 7
        i32.const 1024
        i32.or
        local.set 7
        i32.const 0
        local.set 13
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 15
        br_if 0 (;@2;)
        i32.const 0
        local.set 15
        br 1 (;@1;)
      end
      local.get 5
      i32.const -1
      i32.add
      i32.const 6
      local.get 14
      select
      local.set 15
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 8
    local.get 10
    f64.div
    local.get 8
    local.get 11
    select
    local.tee 10
    f64.neg
    local.get 10
    local.get 4
    f64.const 0x0p+0 (;=0;)
    f64.lt
    select
    local.get 15
    i32.const 0
    i32.const 0
    local.get 6
    local.get 13
    i32.sub
    local.tee 5
    local.get 5
    local.get 6
    i32.gt_u
    select
    local.tee 5
    local.get 13
    select
    local.get 5
    local.get 7
    i32.const 2
    i32.and
    local.tee 14
    i32.const 1
    i32.shr_u
    select
    local.get 7
    i32.const -2049
    i32.and
    call $_ftoa
    local.set 5
    block  ;; label = @1
      local.get 13
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      i32.const 32
      i32.and
      i32.const 101
      i32.xor
      local.get 1
      local.get 5
      local.get 3
      local.get 0
      call_indirect (type 0)
      local.get 0
      local.get 1
      local.get 5
      i32.const 1
      i32.add
      local.get 3
      local.get 11
      local.get 11
      i32.const 31
      i32.shr_s
      local.tee 5
      i32.xor
      local.get 5
      i32.sub
      local.get 11
      i32.const 31
      i32.shr_u
      i32.const 10
      i32.const 0
      local.get 13
      i32.const -1
      i32.add
      i32.const 5
      call $_ntoa_long
      local.set 5
      local.get 14
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      local.get 2
      i32.sub
      local.get 6
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      i32.sub
      local.set 7
      loop  ;; label = @2
        i32.const 32
        local.get 1
        local.get 5
        local.get 3
        local.get 0
        call_indirect (type 0)
        local.get 7
        local.get 5
        i32.const 1
        i32.add
        local.tee 5
        i32.add
        local.get 6
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 5)
  (func $_out_buffer (type 0) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.add
      local.get 0
      i32.store8
    end)
  (func $vsnprintf_ (type 16) (param i32 i32 i32 i32) (result i32)
    i32.const 6
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_vsnprintf)
  (func $_ntoa_format (type 17) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 10
      i32.const 2
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 9
          br_if 0 (;@3;)
          i32.const 0
          local.set 9
          br 1 (;@2;)
        end
        local.get 10
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        local.get 10
        i32.const 12
        i32.and
        i32.const 0
        i32.ne
        local.get 6
        i32.or
        i32.sub
        local.set 9
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 8
          i32.const 32
          local.get 8
          i32.const 32
          i32.lt_u
          select
          local.tee 11
          local.get 5
          i32.gt_u
          br_if 0 (;@3;)
          local.get 5
          local.set 11
          br 1 (;@2;)
        end
        local.get 4
        local.get 5
        i32.add
        i32.const 48
        local.get 11
        local.get 5
        i32.sub
        call $memset
        drop
      end
      block  ;; label = @2
        local.get 10
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 11
        local.get 9
        i32.const 32
        local.get 9
        i32.const 32
        i32.lt_u
        select
        local.tee 5
        i32.ge_u
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 4
          local.get 11
          i32.add
          i32.const 48
          i32.store8
          local.get 11
          i32.const 1
          i32.add
          local.tee 11
          local.get 5
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 11
      local.set 5
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 10
        i32.const 16
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 10
          i32.const 1024
          i32.and
          br_if 0 (;@3;)
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            local.get 8
            i32.eq
            br_if 0 (;@4;)
            local.get 5
            local.get 9
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 5
          i32.const -2
          i32.add
          local.get 5
          i32.const -1
          i32.add
          local.tee 11
          local.get 11
          select
          local.get 11
          local.get 7
          i32.const 16
          i32.eq
          select
          local.set 5
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const 16
              i32.ne
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 10
                i32.const 32
                i32.and
                local.tee 11
                br_if 0 (;@6;)
                local.get 5
                i32.const 32
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 120
                local.set 11
                br 2 (;@4;)
              end
              local.get 11
              i32.eqz
              br_if 2 (;@3;)
              local.get 5
              i32.const 32
              i32.ge_u
              br_if 2 (;@3;)
              i32.const 88
              local.set 11
              br 1 (;@4;)
            end
            local.get 7
            i32.const 2
            i32.ne
            br_if 1 (;@3;)
            local.get 5
            i32.const 31
            i32.gt_u
            br_if 1 (;@3;)
            i32.const 98
            local.set 11
          end
          local.get 4
          local.get 5
          i32.add
          local.get 11
          i32.store8
          local.get 5
          i32.const 1
          i32.add
          local.set 5
        end
        local.get 5
        i32.const 31
        i32.gt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 5
        i32.add
        i32.const 48
        i32.store8
        local.get 5
        i32.const 1
        i32.add
        local.set 5
      end
      local.get 5
      i32.const 31
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          i32.const 45
          local.set 11
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 10
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          i32.const 43
          local.set 11
          br 1 (;@2;)
        end
        local.get 10
        i32.const 8
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        i32.const 32
        local.set 11
      end
      local.get 4
      local.get 5
      i32.add
      local.get 11
      i32.store8
      local.get 5
      i32.const 1
      i32.add
      local.set 5
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 5
    local.get 9
    local.get 10
    call $_out_rev)
  (func $_out_rev (type 18) (param i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    local.set 8
    block  ;; label = @1
      local.get 7
      i32.const 3
      i32.and
      br_if 0 (;@1;)
      local.get 2
      local.set 8
      local.get 6
      local.get 5
      i32.le_u
      br_if 0 (;@1;)
      local.get 6
      local.get 5
      i32.sub
      local.set 9
      local.get 2
      local.set 8
      loop  ;; label = @2
        i32.const 32
        local.get 1
        local.get 8
        local.get 3
        local.get 0
        call_indirect (type 0)
        local.get 8
        i32.const 1
        i32.add
        local.set 8
        local.get 9
        i32.const -1
        i32.add
        local.tee 9
        br_if 0 (;@2;)
      end
    end
    local.get 7
    i32.const 2
    i32.and
    local.set 7
    block  ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const -1
      i32.add
      local.set 9
      loop  ;; label = @2
        local.get 9
        local.get 5
        i32.add
        i32.load8_s
        local.get 1
        local.get 8
        local.get 3
        local.get 0
        call_indirect (type 0)
        local.get 8
        i32.const 1
        i32.add
        local.set 8
        local.get 5
        i32.const -1
        i32.add
        local.tee 5
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 8
      local.get 2
      i32.sub
      local.get 6
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      i32.sub
      local.set 5
      loop  ;; label = @2
        i32.const 32
        local.get 1
        local.get 8
        local.get 3
        local.get 0
        call_indirect (type 0)
        local.get 5
        local.get 8
        i32.const 1
        i32.add
        local.tee 8
        i32.add
        local.get 6
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 8)
  (func $dummy (type 2))
  (func $__wasm_call_dtors (type 2)
    call $dummy
    call $dummy)
  (func $malloc.command_export (type 3) (param i32) (result i32)
    local.get 0
    call $malloc
    call $__wasm_call_dtors)
  (func $free.command_export (type 1) (param i32)
    local.get 0
    call $free
    call $__wasm_call_dtors)
  (func $bpbxplug_entry.command_export (type 11) (result i32)
    call $bpbxplug_entry
    call $__wasm_call_dtors)
  (table (;0;) 7 7 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 70272))
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "malloc" (func $malloc.command_export))
  (export "free" (func $free.command_export))
  (export "bpbxplug_entry" (func $bpbxplug_entry.command_export))
  (elem (;0;) (i32.const 1) func $pluginInit $pluginDestroy $pluginTick $pluginRender $_out_null $_out_buffer)
  (data $.rodata (i32.const 1024) "\03\00\00\00\04\00\00\00\04\00\00\00\06\00\00\00\83\f9\a2\00DNn\00\fc)\15\00\d1W'\00\dd4\f5\00b\db\c0\00<\99\95\00A\90C\00cQ\fe\00\bb\de\ab\00\b7a\c5\00:n$\00\d2MB\00I\06\e0\00\09\ea.\00\1c\92\d1\00\eb\1d\fe\00)\b1\1c\00\e8>\a7\00\f55\82\00D\bb.\00\9c\e9\84\00\b4&p\00A~_\00\d6\919\00S\839\00\9c\f49\00\8b_\84\00(\f9\bd\00\f8\1f;\00\de\ff\97\00\0f\98\05\00\11/\ef\00\0aZ\8b\00m\1fm\00\cf~6\00\09\cb'\00FO\b7\00\9ef?\00-\ea_\00\ba'u\00\e5\eb\c7\00={\f1\00\f79\07\00\92R\8a\00\fbk\ea\00\1f\b1_\00\08]\8d\000\03V\00{\fcF\00\f0\abk\00 \bc\cf\006\f4\9a\00\e3\a9\1d\00^a\91\00\08\1b\e6\00\85\99e\00\a0\14_\00\8d@h\00\80\d8\ff\00'sM\00\06\061\00\caV\15\00\c9\a8s\00{\e2`\00k\8c\c0\00\19\c4G\00\cdg\c3\00\09\e8\dc\00Y\83*\00\8bv\c4\00\a6\1c\96\00D\af\dd\00\19W\d1\00\a5>\05\00\05\07\ff\003~?\00\c22\e8\00\98O\de\00\bb}2\00&=\c3\00\1ek\ef\00\9f\f8^\005\1f:\00\7f\f2\ca\00\f1\87\1d\00|\90!\00j$|\00\d5n\fa\000-w\00\15;C\00\b5\14\c6\00\c3\19\9d\00\ad\c4\c2\00,MA\00\0c\00]\00\86}F\00\e3q-\00\9b\c6\9a\003b\00\00\b4\d2|\00\b4\a7\97\007U\d5\00\d7>\f6\00\a3\10\18\00Mv\fc\00d\9d*\00p\d7\ab\00c|\f8\00z\b0W\00\17\15\e7\00\c0IV\00;\d6\d9\00\a7\848\00$#\cb\00\d6\8aw\00ZT#\00\00\1f\b9\00\f1\0a\1b\00\19\ce\df\00\9f1\ff\00f\1ej\00\99Wa\00\ac\fbG\00~\7f\d8\00\22e\b7\002\e8\89\00\e6\bf`\00\ef\c4\cd\00l6\09\00]?\d4\00\16\de\d7\00X;\de\00\de\9b\92\00\d2\22(\00(\86\e8\00\e2XM\00\c6\ca2\00\08\e3\16\00\e0}\cb\00\17\c0P\00\f3\1d\a7\00\18\e0[\00.\134\00\83\12b\00\83H\01\00\f5\8e[\00\ad\b0\7f\00\1e\e9\f2\00HJC\00\10g\d3\00\aa\dd\d8\00\ae_B\00ja\ce\00\0a(\a4\00\d3\99\b4\00\06\a6\f2\00\5cw\7f\00\a3\c2\83\00a<\88\00\8asx\00\af\8cZ\00o\d7\bd\00-\a6c\00\f4\bf\cb\00\8d\81\ef\00&\c1g\00U\caE\00\ca\d96\00(\a8\d2\00\c2a\8d\00\12\c9w\00\04&\14\00\12F\9b\00\c4Y\c4\00\c8\c5D\00M\b2\91\00\00\17\f3\00\d4C\ad\00)I\e5\00\fd\d5\10\00\00\be\fc\00\1e\94\cc\00p\ce\ee\00\13>\f5\00\ec\f1\80\00\b3\e7\c3\00\c7\f8(\00\93\05\94\00\c1q>\00.\09\b3\00\0bE\f3\00\88\12\9c\00\ab {\00.\b5\9f\00G\92\c2\00{2/\00\0cUm\00r\a7\90\00k\e7\1f\001\cb\96\00y\16J\00Ay\e2\00\f4\df\89\00\e8\94\97\00\e2\e6\84\00\991\97\00\88\edk\00__6\00\bb\fd\0e\00H\9a\b4\00g\a4l\00qrB\00\8d]2\00\9f\15\b8\00\bc\e5\09\00\8d1%\00\f7t9\000\05\1c\00\0d\0c\01\00K\08h\00,\eeX\00G\aa\90\00t\e7\02\00\bd\d6$\00\f7}\a6\00nHr\00\9f\16\ef\00\8e\94\a6\00\b4\91\f6\00\d1SQ\00\cf\0a\f2\00 \983\00\f5K~\00\b2ch\00\dd>_\00@]\03\00\85\89\7f\00UR)\007d\c0\00m\d8\10\002H2\00[Lu\00Nq\d4\00ETn\00\0b\09\c1\00*\f5i\00\14f\d5\00'\07\9d\00]\04P\00\b4;\db\00\eav\c5\00\87\f9\17\00Ik}\00\1d'\ba\00\96i)\00\c6\cc\ac\00\ad\14T\00\90\e2j\00\88\d9\89\00,rP\00\04\a4\be\00w\07\94\00\f30p\00\00\fc'\00\eaq\a8\00f\c2I\00d\e0=\00\97\dd\83\00\a3?\97\00C\94\fd\00\0d\86\8c\001A\de\00\929\9d\00\ddp\8c\00\17\b7\e7\00\08\df;\00\157+\00\5c\80\a0\00Z\80\93\00\10\11\92\00\0f\e8\d8\00l\80\af\00\db\ffK\008\90\0f\00Y\18v\00b\a5\15\00a\cb\bb\00\c7\89\b9\00\10@\bd\00\d2\f2\04\00Iu'\00\eb\b6\f6\00\db\22\bb\00\0a\14\aa\00\89&/\00d\83v\00\09;3\00\0e\94\1a\00Q:\aa\00\1d\a3\c2\00\af\ed\ae\00\5c&\12\00m\c2M\00-z\9c\00\c0V\97\00\03?\83\00\09\f0\f6\00+@\8c\00m1\99\009\b4\07\00\0c \15\00\d8\c3[\00\f5\92\c4\00\c6\adK\00N\ca\a5\00\a77\cd\00\e6\a96\00\ab\92\94\00\ddBh\00\19c\de\00v\8c\ef\00h\8bR\00\fc\db7\00\ae\a1\ab\00\df\151\00\00\ae\a1\00\0c\fb\da\00dMf\00\ed\05\b7\00)e0\00WV\bf\00G\ff:\00j\f9\b9\00u\be\f3\00(\93\df\00\ab\800\00f\8c\f6\00\04\cb\15\00\fa\22\06\00\d9\e4\1d\00=\b3\a4\00W\1b\8f\006\cd\09\00NB\e9\00\13\be\a4\003#\b5\00\f0\aa\1a\00Oe\a8\00\d2\c1\a5\00\0b?\0f\00[x\cd\00#\f9v\00{\8b\04\00\89\17r\00\c6\a6S\00on\e2\00\ef\eb\00\00\9bJX\00\c4\da\b7\00\aaf\ba\00v\cf\cf\00\d1\02\1d\00\b1\f1-\00\8c\99\c1\00\c3\adw\00\86H\da\00\f7]\a0\00\c6\80\f4\00\ac\f0/\00\dd\ec\9a\00?\5c\bc\00\d0\dem\00\90\c7\1f\00*\db\b6\00\a3%:\00\00\af\9a\00\adS\93\00\b6W\04\00)-\b4\00K\80~\00\da\07\a7\00v\aa\0e\00{Y\a1\00\16\12*\00\dc\b7-\00\fa\e5\fd\00\89\db\fe\00\89\be\fd\00\e4vl\00\06\a9\fc\00>\80p\00\85n\15\00\fd\87\ff\00(>\07\00ag3\00*\18\86\00M\bd\ea\00\b3\e7\af\00\8fmn\00\95g9\001\bf[\00\84\d7H\000\df\16\00\c7-C\00%a5\00\c9p\ce\000\cb\b8\00\bfl\fd\00\a4\00\a2\00\05l\e4\00Z\dd\a0\00!oG\00b\12\d2\00\b9\5c\84\00paI\00kV\e0\00\99R\01\00PU7\00\1e\d5\b7\003\f1\c4\00\13n_\00]0\e4\00\85.\a9\00\1d\b2\c3\00\a126\00\08\b7\a4\00\ea\b1\d4\00\16\f7!\00\8fi\e4\00'\ffw\00\0c\03\80\00\8d@-\00O\cd\a0\00 \a5\99\00\b3\a2\d3\00/]\0a\00\b4\f9B\00\11\da\cb\00}\be\d0\00\9b\db\c1\00\ab\17\bd\00\ca\a2\81\00\08j\5c\00.U\17\00'\00U\00\7f\14\f0\00\e1\07\86\00\14\0bd\00\96A\8d\00\87\be\de\00\da\fd*\00k%\b6\00{\894\00\05\f3\fe\00\b9\bf\9e\00hjO\00J*\a8\00O\c4Z\00-\f8\bc\00\d7Z\98\00\f4\c7\95\00\0dM\8d\00 :\a6\00\a4W_\00\14?\b1\00\808\95\00\cc \01\00q\dd\86\00\c9\de\b6\00\bf`\f5\00Me\11\00\01\07k\00\8c\b0\ac\00\b2\c0\d0\00QUH\00\1e\fb\0e\00\95r\c3\00\a3\06;\00\c0@5\00\06\dc{\00\e0E\cc\00N)\fa\00\d6\ca\c8\00\e8\f3A\00|d\de\00\9bd\d8\00\d9\be1\00\a4\97\c3\00wX\d4\00i\e3\c5\00\f0\da\13\00\ba:<\00F\18F\00Uu_\00\d2\bd\f5\00n\92\c6\00\ac.]\00\0eD\ed\00\1c>B\00a\c4\87\00)\fd\e9\00\e7\d6\f3\00\22|\ca\00o\915\00\08\e0\c5\00\ff\d7\8d\00nj\e2\00\b0\fd\c6\00\93\08\c1\00|]t\00k\ad\b2\00\cdn\9d\00>r{\00\c6\11j\00\f7\cf\a9\00)s\df\00\b5\c9\ba\00\b7\00Q\00\e2\b2\0d\00t\ba$\00\e5}`\00t\d8\8a\00\0d\15,\00\81\18\0c\00~f\94\00\01)\16\00\9fzv\00\fd\fd\be\00VE\ef\00\d9~6\00\ec\d9\13\00\8b\ba\b9\00\c4\97\fc\001\a8'\00\f1n\c3\00\94\c56\00\d8\a8V\00\b4\a8\b5\00\cf\cc\0e\00\12\89-\00oW4\00,V\89\00\99\ce\e3\00\d6 \b9\00k^\aa\00>*\9c\00\11_\cc\00\fd\0bJ\00\e1\f4\fb\00\8e;m\00\e2\86,\00\e9\d4\84\00\fc\b4\a9\00\ef\ee\d1\00.5\c9\00/9a\008!D\00\1b\d9\c8\00\81\fc\0a\00\fbJj\00/\1c\d8\00S\b4\84\00N\99\8c\00T\22\cc\00*U\dc\00\c0\c6\d6\00\0b\19\96\00\1ap\b8\00i\95d\00&Z`\00?R\ee\00\7f\11\0f\00\f4\b5\11\00\fc\cb\f5\004\bc-\004\bc\ee\00\e8]\cc\00\dd^`\00g\8e\9b\00\923\ef\00\c9\17\b8\00aX\9b\00\e1W\bc\00Q\83\c6\00\d8>\10\00\ddqH\00-\1c\dd\00\af\18\a1\00!,F\00Y\f3\d7\00\d9z\98\00\9eT\c0\00O\86\fa\00V\06\fc\00\e5y\ae\00\89\226\008\ad\22\00g\93\dc\00U\e8\aa\00\82&8\00\ca\e7\9b\00Q\0d\a4\00\993\b1\00\a9\d7\0e\00i\05H\00e\b2\f0\00\7f\88\a7\00\88L\97\00\f9\d16\00!\92\b3\00{\82J\00\98\cf!\00@\9f\dc\00\dcGU\00\e1t:\00g\ebB\00\fe\9d\df\00^\d4_\00{g\a4\00\ba\acz\00U\f6\a2\00+\88#\00A\baU\00Yn\08\00!*\86\009G\83\00\89\e3\e6\00\e5\9e\d4\00I\fb@\00\ffV\e9\00\1c\0f\ca\00\c5Y\8a\00\94\fa+\00\d3\c1\c5\00\0f\c5\cf\00\dbZ\ae\00G\c5\86\00\85Cb\00!\86;\00,y\94\00\10a\87\00*L{\00\80,\1a\00C\bf\12\00\88&\90\00x<\89\00\a8\c4\e4\00\e5\db{\00\c4:\c2\00&\f4\ea\00\f7g\8a\00\0d\92\bf\00e\a3+\00=\93\b1\00\bd|\0b\00\a4Q\dc\00'\ddc\00i\e1\dd\00\9a\94\19\00\a8)\95\00h\ce(\00\09\ed\b4\00D\9f \00N\98\ca\00p\82c\00~|#\00\0f\b92\00\a7\f5\8e\00\14V\e7\00!\f1\08\00\b5\9d*\00o~M\00\a5\19Q\00\b5\f9\ab\00\82\df\d6\00\96\dda\00\166\02\00\c4:\9f\00\83\a2\a1\00r\edm\009\8dz\00\82\b8\a9\00k2\5c\00F'[\00\004\ed\00\d2\00w\00\fc\f4U\00\01YM\00\e0q\80\00\00\00\00\00\00\00\00\00\00\00\00@\fb!\f9?\00\00\00\00-Dt>\00\00\00\80\98F\f8<\00\00\00`Q\ccx;\00\00\00\80\83\1b\f09\00\00\00@ %z8\00\00\00\80\22\82\e36\00\00\00\00\1d\f3i5destroy plugin\00nan\00fni\00param count: %i\00sample rate: %.1f\00\09param[%i] = %f\00bpbxplug_entry called\000.0.1\00fni-\00fni+\00init called!\00\7f\0f\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\00\00\00\00\00\00\f0?\00\00\00\00\00\00$@\00\00\00\00\00\00Y@\00\00\00\00\00@\8f@\00\00\00\00\00\88\c3@\00\00\00\00\00j\f8@\00\00\00\00\80\84.A\00\00\00\00\d0\12cA\00\00\00\00\84\d7\97A\00\00\00\00e\cd\cdA"))
