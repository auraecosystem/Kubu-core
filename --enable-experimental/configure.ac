AC_PREREQ([2.69])

AC_INIT([KUBU Core],
        [1.0.0],
        [support@kubucoin.org],
        [kubu])

AC_CONFIG_SRCDIR([src/kubud.cpp])
AC_CONFIG_HEADERS([src/config/kubu-config.h])

AM_INIT_AUTOMAKE([foreign subdir-objects])

AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET

AC_LANG([C++])

AC_PROG_CC
AC_PROG_CXX
AC_PROG_INSTALL
AC_PROG_MAKE_SET

LT_INIT

AC_USE_SYSTEM_EXTENSIONS

AC_CHECK_HEADERS([
    stdio.h
    stdlib.h
    string.h
    unistd.h
    sys/types.h
    sys/socket.h
    netinet/in.h
    arpa/inet.h
])

AC_ARG_ENABLE([wallet],
    AS_HELP_STRING(
        [--disable-wallet],
        [Disable wallet functionality]
    ),
    [],
    [enable_wallet=yes])

AC_ARG_ENABLE([gui],
    AS_HELP_STRING(
        [--disable-gui],
        [Disable Qt GUI wallet]
    ),
    [],
    [enable_gui=yes])

AC_ARG_ENABLE([tests],
    AS_HELP_STRING(
        [--disable-tests],
        [Disable unit tests]
    ),
    [],
    [enable_tests=yes])

AC_ARG_ENABLE([bench],
    AS_HELP_STRING(
        [--enable-bench],
        [Enable benchmarking tools]
    ),
    [],
    [enable_bench=no])

AC_ARG_ENABLE([upnp],
    AS_HELP_STRING(
        [--enable-upnp],
        [Enable UPnP support]
    ),
    [],
    [enable_upnp=no])

AC_ARG_WITH([boost],
    AS_HELP_STRING(
        [--with-boost=PATH],
        [Specify Boost location]
    ))

AC_ARG_WITH([miniupnpc],
    AS_HELP_STRING(
        [--with-miniupnpc],
        [Enable miniupnpc support]
    ))

PKG_PROG_PKG_CONFIG

PKG_CHECK_MODULES(
    [OPENSSL],
    [openssl >= 1.1.1],
    [],
    [AC_MSG_ERROR([OpenSSL not found])]
)

PKG_CHECK_MODULES(
    [LIBEVENT],
    [libevent >= 2.1],
    [],
    [AC_MSG_ERROR([libevent not found])]
)

AC_CHECK_LIB(
    [pthread],
    [pthread_create],
    [],
    [AC_MSG_ERROR([pthread library not found])]
)

AC_CHECK_LIB(
    [z],
    [inflate],
    [],
    [AC_MSG_ERROR([zlib not found])]
)

if test "x$enable_gui" = "xyes"; then
    PKG_CHECK_MODULES(
        [QT],
        [Qt5Core Qt5Gui Qt5Widgets],
        [],
        [AC_MSG_ERROR([Qt5 not found])]
    )
fi

AC_DEFINE_UNQUOTED(
    [KUBU_COIN_NAME],
    ["KUBU"],
    [Coin Name]
)

AC_DEFINE_UNQUOTED(
    [KUBU_TICKER],
    ["KUBU"],
    [Ticker Symbol]
)

AC_DEFINE_UNQUOTED(
    [KUBU_DEFAULT_RPC_PORT],
    [45873],
    [Default RPC Port]
)

AC_DEFINE_UNQUOTED(
    [KUBU_DEFAULT_P2P_PORT],
    [45874],
    [Default P2P Port]
)

AC_DEFINE_UNQUOTED(
    [KUBU_BLOCK_TIME],
    [54],
    [Block Time Seconds]
)

AM_CONDITIONAL(
    [BUILD_GUI],
    [test "x$enable_gui" = "xyes"]
)

AM_CONDITIONAL(
    [BUILD_WALLET],
    [test "x$enable_wallet" = "xyes"]
)

AM_CONDITIONAL(
    [BUILD_TESTS],
    [test "x$enable_tests" = "xyes"]
)

AC_CONFIG_FILES([
Makefile
src/Makefile
src/config/Makefile
doc/Makefile
test/Makefile
])

AC_OUTPUT

AC_MSG_NOTICE([])
AC_MSG_NOTICE([KUBU Core Configuration])
AC_MSG_NOTICE([Coin: KUBU])
AC_MSG_NOTICE([Ticker: KUBU])
AC_MSG_NOTICE([Wallet: $enable_wallet])
AC_MSG_NOTICE([GUI: $enable_gui])
AC_MSG_NOTICE([Tests: $enable_tests])
AC_MSG_NOTICE([Benchmarks: $enable_bench])
AC_MSG_NOTICE([])
