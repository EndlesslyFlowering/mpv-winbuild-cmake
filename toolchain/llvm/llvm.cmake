set(clang_version "20")
ExternalProject_Add(llvm
    GIT_REPOSITORY https://github.com/llvm/llvm-project.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !*/test !/lldb !/mlir !/clang-tools-extra !/mlir !/polly !/bolt !/flang"
    UPDATE_COMMAND ""
    GIT_REMOTE_NAME origin
    GIT_TAG release/20.x
    LIST_SEPARATOR ,
    CONFIGURE_COMMAND ${EXEC} CONF=1 PATH=$O_PATH cmake -H<SOURCE_DIR>/llvm -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_C_COMPILER=clang
        -DCMAKE_CXX_COMPILER=clang++
        ${llvm_ccache}
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
        -DLLVM_INSTALL_TOOLCHAIN_ONLY=ON
        -DLLVM_TARGETS_TO_BUILD='AArch64,X86,NVPTX'
        -DLLVM_ENABLE_PROJECTS='clang,lld'
        -DLLVM_ENABLE_ASSERTIONS=OFF
        -DLLVM_ENABLE_LIBCXX=ON
        -DLLVM_ENABLE_LLD=ON
        -DLLVM_ENABLE_PIC=OFF
        -DLLVM_ENABLE_UNWIND_TABLES=OFF
        -DLLVM_ENABLE_LIBXML2=OFF
        -DLLVM_ENABLE_TERMINFO=OFF
        -DLLVM_ENABLE_LTO=${LLVM_ENABLE_LTO}
        -DCLANG_ENABLE_ARCMT=OFF
        -DCLANG_ENABLE_STATIC_ANALYZER=OFF
        -DLLVM_INCLUDE_TESTS=OFF
        -DLLVM_INCLUDE_EXAMPLES=OFF
        -DLLVM_INCLUDE_DOCS=OFF
        -DLLVM_INCLUDE_UTILS=OFF
        -DLLVM_INCLUDE_BENCHMARKS=OFF
        -DCLANG_DEFAULT_RTLIB=compiler-rt
        -DCLANG_DEFAULT_UNWINDLIB=libunwind
        -DCLANG_DEFAULT_CXX_STDLIB=libc++
        -DCLANG_DEFAULT_LINKER=lld
        -DLLD_DEFAULT_LD_LLD_IS_MINGW=ON
        -DLLVM_LINK_LLVM_DYLIB=OFF
        -DLLVM_BUILD_LLVM_DYLIB=OFF
        -DBUILD_SHARED_LIBS=OFF
        -DLLVM_BUILD_UTILS=OFF
        -DCLANG_BUILD_TOOLS=OFF
        -DCLANG_TOOL_AMDGPU_ARCH_BUILD=OFF
        -DCLANG_TOOL_APINOTES_TEST_BUILD=OFF
        -DCLANG_TOOL_ARCMT_TEST_BUILD=OFF
        -DCLANG_TOOL_C_ARCMT_TEST_BUILD=OFF
        -DCLANG_TOOL_C_INDEX_TEST_BUILD=OFF
        -DCLANG_TOOL_CLANG_CHECK_BUILD=OFF
        -DCLANG_TOOL_CLANG_DIFF_BUILD=OFF
        -DCLANG_TOOL_CLANG_EXTDEF_MAPPING_BUILD=OFF
        -DCLANG_TOOL_CLANG_FORMAT_BUILD=OFF
        -DCLANG_TOOL_CLANG_FORMAT_VS_BUILD=OFF
        -DCLANG_TOOL_CLANG_FUZZER_BUILD=OFF
        -DCLANG_TOOL_CLANG_INSTALLAPI_BUILD=OFF
        -DCLANG_TOOL_CLANG_IMPORT_TEST_BUILD=OFF
        -DCLANG_TOOL_CLANG_LINKER_WRAPPER_BUILD=OFF
        -DCLANG_TOOL_CLANG_NVLINK_WRAPPER_BUILD=OFF
        -DCLANG_TOOL_CLANG_OFFLOAD_BUNDLER_BUILD=OFF
        -DCLANG_TOOL_CLANG_OFFLOAD_PACKAGER_BUILD=OFF
        -DCLANG_TOOL_CLANG_REFACTOR_BUILD=OFF
        -DCLANG_TOOL_CLANG_RENAME_BUILD=OFF
        -DCLANG_TOOL_CLANG_REPL_BUILD=OFF
        -DCLANG_TOOL_CLANG_SCAN_DEPS_BUILD=ON
        -DCLANG_TOOL_CLANG_SHLIB_BUILD=OFF
        -DCLANG_TOOL_DIAGTOOL_BUILD=OFF
        -DCLANG_TOOL_LIBCLANG_BUILD=OFF
        -DCLANG_TOOL_NVPTX_ARCH_BUILD=OFF
        -DCLANG_TOOL_SCAN_BUILD_BUILD=OFF
        -DCLANG_TOOL_SCAN_BUILD_PY_BUILD=OFF
        -DCLANG_TOOL_SCAN_VIEW_BUILD=OFF
        -DLLVM_TOOL_BUGPOINT_BUILD=OFF
        -DLLVM_TOOL_BUGPOINT_PASSES_BUILD=OFF
        -DLLVM_TOOL_DSYMUTIL_BUILD=OFF
        -DLLVM_TOOL_DXIL_DIS_BUILD=OFF
        -DLLVM_TOOL_GOLD_BUILD=OFF
        -DLLVM_TOOL_LLC_BUILD=OFF
        -DLLVM_TOOL_LLI_BUILD=OFF
        -DLLVM_TOOL_LLVM_DRIVER_BUILD=ON
        -DLLVM_TOOL_LLVM_AS_BUILD=OFF
        -DLLVM_TOOL_LLVM_AS_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_BCANALYZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_C_TEST_BUILD=OFF
        -DLLVM_TOOL_LLVM_CAT_BUILD=OFF
        -DLLVM_TOOL_LLVM_CFI_VERIFY_BUILD=OFF
        -DLLVM_TOOL_LLVM_CONFIG_BUILD=OFF
        -DLLVM_TOOL_LLVM_COV_BUILD=OFF
        -DLLVM_TOOL_LLVM_CTXPROF_UTIL_BUILD=OFF
        -DLLVM_TOOL_LLVM_CXXDUMP_BUILD=OFF
        -DLLVM_TOOL_LLVM_CXXFILT_BUILD=OFF
        -DLLVM_TOOL_LLVM_CXXMAP_BUILD=OFF
        -DLLVM_TOOL_LLVM_DEBUGINFO_ANALYZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_DEBUGINFOD_BUILD=OFF
        -DLLVM_TOOL_LLVM_DEBUGINFOD_FIND_BUILD=OFF
        -DLLVM_TOOL_LLVM_DIFF_BUILD=OFF
        -DLLVM_TOOL_LLVM_DIS_BUILD=OFF
        -DLLVM_TOOL_LLVM_DIS_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_DLANG_DEMANGLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_DWARFDUMP_BUILD=OFF
        -DLLVM_TOOL_LLVM_DWARFUTIL_BUILD=OFF
        -DLLVM_TOOL_LLVM_DWP_BUILD=OFF
        -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=OFF
        -DLLVM_TOOL_LLVM_EXTRACT_BUILD=OFF
        -DLLVM_TOOL_LLVM_GSYMUTIL_BUILD=OFF
        -DLLVM_TOOL_LLVM_IFS_BUILD=OFF
        -DLLVM_TOOL_LLVM_ISEL_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_ITANIUM_DEMANGLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_JITLINK_BUILD=OFF
        -DLLVM_TOOL_LLVM_JITLISTENER_BUILD=OFF
        -DLLVM_TOOL_LLVM_LIBTOOL_DARWIN_BUILD=OFF
        -DLLVM_TOOL_LLVM_LINK_BUILD=OFF
        -DLLVM_TOOL_LLVM_LIPO_BUILD=OFF
        -DLLVM_TOOL_LLVM_LTO_BUILD=OFF
        -DLLVM_TOOL_LLVM_LTO2_BUILD=OFF
        -DLLVM_TOOL_LLVM_MC_ASSEMBLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_MC_BUILD=OFF
        -DLLVM_TOOL_LLVM_MC_DISASSEMBLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_MCA_BUILD=OFF
        -DLLVM_TOOL_LLVM_MICROSOFT_DEMANGLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_MODEXTRACT_BUILD=OFF
        -DLLVM_TOOL_LLVM_MT_BUILD=OFF
        -DLLVM_TOOL_LLVM_OPT_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_OPT_REPORT_BUILD=OFF
        -DLLVM_TOOL_LLVM_PDBUTIL_BUILD=OFF
        -DLLVM_TOOL_LLVM_PROFGEN_BUILD=OFF
        -DLLVM_TOOL_LLVM_READTAPI_BUILD=OFF
        -DLLVM_TOOL_LLVM_REDUCE_BUILD=OFF
        -DLLVM_TOOL_LLVM_REMARKUTIL_BUILD=OFF
        -DLLVM_TOOL_LLVM_RTDYLD_BUILD=OFF
        -DLLVM_TOOL_LLVM_RUST_DEMANGLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_SHLIB_BUILD=OFF
        -DLLVM_TOOL_LLVM_SIM_BUILD=OFF
        -DLLVM_TOOL_LLVM_SPECIAL_CASE_LIST_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_SPLIT_BUILD=OFF
        -DLLVM_TOOL_LLVM_STRESS_BUILD=OFF
        -DLLVM_TOOL_LLVM_TLI_CHECKER_BUILD=OFF
        -DLLVM_TOOL_LLVM_UNDNAME_BUILD=OFF
        -DLLVM_TOOL_LLVM_XRAY_BUILD=OFF
        -DLLVM_TOOL_LLVM_YAML_NUMERIC_PARSER_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LLVM_YAML_PARSER_FUZZER_BUILD=OFF
        -DLLVM_TOOL_LTO_BUILD=OFF
        -DLLVM_TOOL_OBJ2YAML_BUILD=OFF
        -DLLVM_TOOL_OPT_BUILD=OFF
        -DLLVM_TOOL_OPT_VIEWER_BUILD=OFF
        -DLLVM_TOOL_REDUCE_CHUNK_LIST_BUILD=OFF
        -DLLVM_TOOL_REMARKS_SHLIB_BUILD=OFF
        -DLLVM_TOOL_SANCOV_BUILD=OFF
        -DLLVM_TOOL_SANSTATS_BUILD=OFF
        -DLLVM_TOOL_SPIRV_TOOLS_BUILD=OFF
        -DLLVM_TOOL_VERIFY_USELISTORDER_BUILD=OFF
        -DLLVM_TOOL_VFABI_DEMANGLE_FUZZER_BUILD=OFF
        -DLLVM_TOOL_XCODE_TOOLCHAIN_BUILD=OFF
        -DLLVM_TOOL_YAML2OBJ_BUILD=OFF
        "-DLLVM_THINLTO_CACHE_PATH='${CMAKE_INSTALL_PREFIX}/llvm-thinlto'"
        "-DCMAKE_C_FLAGS='-g0 -ftls-model=local-exec ${llvm_lto} ${llvm_pgo}'"
        "-DCMAKE_CXX_FLAGS='-g0 -ftls-model=local-exec ${llvm_lto} ${llvm_pgo}'"
        "-DCMAKE_EXE_LINKER_FLAGS='-fuse-ld=lld -Xlinker -s -Xlinker --icf=all -Xlinker --thinlto-cache-policy=cache_size_bytes=1g:prune_interval=1m'"
        -DLLVM_TOOLCHAIN_TOOLS='llvm-driver,llvm-ar,llvm-ranlib,llvm-objdump,llvm-rc,llvm-cvtres,llvm-nm,llvm-strings,llvm-readobj,llvm-dlltool,llvm-pdbutil,llvm-objcopy,llvm-strip,llvm-cov,llvm-profdata,llvm-addr2line,llvm-symbolizer,llvm-windres,llvm-ml,llvm-readelf,llvm-size,llvm-config'
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(llvm)
cleanup(llvm install)
get_property(LLVM_SRC TARGET llvm PROPERTY _EP_SOURCE_DIR)
