--osc.lua

--this file was generated with create_lo_lua.sh
--Die Okt  3 18:48:30 UTC 2017
--1507056510
--ecb2498878072a68362960a09c609f85  /usr/local/include/lo/lo.h

local lo={}
--global
ffi=require("ffi")
--in ffi.C space
local liblo=ffi.load("lo",true)

ffi.cdef[[
//handy for "debugging" data types
int printf(const char *fmt, ...);
//handy for everything blob, (de-)serialise, ..
void *malloc(size_t size);
void free(void *ptr);
void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);
//following is expanded lo.h
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef int __daddr_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void * __timer_t;
typedef long int __blksize_t;
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
typedef long int __fsword_t;
typedef long int __ssize_t;
typedef long int __syscall_slong_t;
typedef unsigned long int __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;
typedef long int __intptr_t;
typedef unsigned int __socklen_t;
typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __off_t off_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __ssize_t ssize_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;
typedef __time_t time_t;
typedef __clockid_t clockid_t;
typedef __timer_t timer_t;
typedef long unsigned int size_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));
typedef int register_t __attribute__ ((__mode__ (__word__)));
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
typedef int __sig_atomic_t;
typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
typedef __sigset_t sigset_t;
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
typedef __suseconds_t suseconds_t;
typedef long int __fd_mask;
typedef struct
  {
    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
  } fd_set;
typedef __fd_mask fd_mask;
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef unsigned long int pthread_t;
union pthread_attr_t
{
  char __size[56];
  long int __align;
};
typedef union pthread_attr_t pthread_attr_t;
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
    unsigned int __nusers;
    int __kind;
    short __spins;
    short __elision;
    __pthread_list_t __list;
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
typedef union
{
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    signed char __rwelision;
    unsigned char __pad1[7];
    unsigned long int __pad2;
    unsigned int __flags;
  } __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;
typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long int uint64_t;
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;
typedef long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long int uint_least64_t;
typedef signed char int_fast8_t;
typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
typedef unsigned char uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
typedef long int intptr_t;
typedef unsigned long int uintptr_t;
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
extern ssize_t readv (int __fd, const struct iovec *__iovec, int __count)
  ;
extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count)
  ;
extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
         __off_t __offset) ;
extern ssize_t pwritev (int __fd, const struct iovec *__iovec, int __count,
   __off_t __offset) ;
typedef __socklen_t socklen_t;
enum __socket_type
{
  SOCK_STREAM = 1,
  SOCK_DGRAM = 2,
  SOCK_RAW = 3,
  SOCK_RDM = 4,
  SOCK_SEQPACKET = 5,
  SOCK_DCCP = 6,
  SOCK_PACKET = 10,
  SOCK_CLOEXEC = 02000000,
  SOCK_NONBLOCK = 00004000
};
typedef unsigned short int sa_family_t;
struct sockaddr
  {
    sa_family_t sa_family;
    char sa_data[14];
  };
struct sockaddr_storage
  {
    sa_family_t ss_family;
    char __ss_padding[(128 - (sizeof (unsigned short int)) - sizeof (unsigned long int))];
    unsigned long int __ss_align;
  };
enum
  {
    MSG_OOB = 0x01,
    MSG_PEEK = 0x02,
    MSG_DONTROUTE = 0x04,
    MSG_CTRUNC = 0x08,
    MSG_PROXY = 0x10,
    MSG_TRUNC = 0x20,
    MSG_DONTWAIT = 0x40,
    MSG_EOR = 0x80,
    MSG_WAITALL = 0x100,
    MSG_FIN = 0x200,
    MSG_SYN = 0x400,
    MSG_CONFIRM = 0x800,
    MSG_RST = 0x1000,
    MSG_ERRQUEUE = 0x2000,
    MSG_NOSIGNAL = 0x4000,
    MSG_MORE = 0x8000,
    MSG_WAITFORONE = 0x10000,
    MSG_FASTOPEN = 0x20000000,
    MSG_CMSG_CLOEXEC = 0x40000000
  };
struct msghdr
  {
    void *msg_name;
    socklen_t msg_namelen;
    struct iovec *msg_iov;
    size_t msg_iovlen;
    void *msg_control;
    size_t msg_controllen;
    int msg_flags;
  };
struct cmsghdr
  {
    size_t cmsg_len;
    int cmsg_level;
    int cmsg_type;
    __extension__ unsigned char __cmsg_data [];
  };
extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
          struct cmsghdr *__cmsg) __attribute__ ((__nothrow__ , __leaf__));
enum
  {
    SCM_RIGHTS = 0x01
  };
struct linger
  {
    int l_onoff;
    int l_linger;
  };
struct osockaddr
  {
    unsigned short int sa_family;
    unsigned char sa_data[14];
  };
enum
{
  SHUT_RD = 0,
  SHUT_WR,
  SHUT_RDWR
};
extern int socket (int __domain, int __type, int __protocol) __attribute__ ((__nothrow__ , __leaf__));
extern int socketpair (int __domain, int __type, int __protocol,
         int __fds[2]) __attribute__ ((__nothrow__ , __leaf__));
extern int bind (int __fd, const struct sockaddr * __addr, socklen_t __len)
     __attribute__ ((__nothrow__ , __leaf__));
extern int getsockname (int __fd, struct sockaddr *__restrict __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));
extern int connect (int __fd, const struct sockaddr * __addr, socklen_t __len);
extern int getpeername (int __fd, struct sockaddr *__restrict __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));
extern ssize_t send (int __fd, const void *__buf, size_t __n, int __flags);
extern ssize_t recv (int __fd, void *__buf, size_t __n, int __flags);
extern ssize_t sendto (int __fd, const void *__buf, size_t __n,
         int __flags, const struct sockaddr * __addr,
         socklen_t __addr_len);
extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
    int __flags, struct sockaddr *__restrict __addr,
    socklen_t *__restrict __addr_len);
extern ssize_t sendmsg (int __fd, const struct msghdr *__message,
   int __flags);
extern ssize_t recvmsg (int __fd, struct msghdr *__message, int __flags);
extern int getsockopt (int __fd, int __level, int __optname,
         void *__restrict __optval,
         socklen_t *__restrict __optlen) __attribute__ ((__nothrow__ , __leaf__));
extern int setsockopt (int __fd, int __level, int __optname,
         const void *__optval, socklen_t __optlen) __attribute__ ((__nothrow__ , __leaf__));
extern int listen (int __fd, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int accept (int __fd, struct sockaddr *__restrict __addr,
     socklen_t *__restrict __addr_len);
extern int shutdown (int __fd, int __how) __attribute__ ((__nothrow__ , __leaf__));
extern int sockatmark (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern int isfdtype (int __fd, int __fdtype) __attribute__ ((__nothrow__ , __leaf__));
typedef uint32_t in_addr_t;
struct in_addr
  {
    in_addr_t s_addr;
  };
struct ip_opts
  {
    struct in_addr ip_dst;
    char ip_opts[40];
  };
struct ip_mreqn
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_address;
    int imr_ifindex;
  };
struct in_pktinfo
  {
    int ipi_ifindex;
    struct in_addr ipi_spec_dst;
    struct in_addr ipi_addr;
  };
enum
  {
    IPPROTO_IP = 0,
    IPPROTO_ICMP = 1,
    IPPROTO_IGMP = 2,
    IPPROTO_IPIP = 4,
    IPPROTO_TCP = 6,
    IPPROTO_EGP = 8,
    IPPROTO_PUP = 12,
    IPPROTO_UDP = 17,
    IPPROTO_IDP = 22,
    IPPROTO_TP = 29,
    IPPROTO_DCCP = 33,
    IPPROTO_IPV6 = 41,
    IPPROTO_RSVP = 46,
    IPPROTO_GRE = 47,
    IPPROTO_ESP = 50,
    IPPROTO_AH = 51,
    IPPROTO_MTP = 92,
    IPPROTO_BEETPH = 94,
    IPPROTO_ENCAP = 98,
    IPPROTO_PIM = 103,
    IPPROTO_COMP = 108,
    IPPROTO_SCTP = 132,
    IPPROTO_UDPLITE = 136,
    IPPROTO_MPLS = 137,
    IPPROTO_RAW = 255,
    IPPROTO_MAX
  };
enum
  {
    IPPROTO_HOPOPTS = 0,
    IPPROTO_ROUTING = 43,
    IPPROTO_FRAGMENT = 44,
    IPPROTO_ICMPV6 = 58,
    IPPROTO_NONE = 59,
    IPPROTO_DSTOPTS = 60,
    IPPROTO_MH = 135
  };
typedef uint16_t in_port_t;
enum
  {
    IPPORT_ECHO = 7,
    IPPORT_DISCARD = 9,
    IPPORT_SYSTAT = 11,
    IPPORT_DAYTIME = 13,
    IPPORT_NETSTAT = 15,
    IPPORT_FTP = 21,
    IPPORT_TELNET = 23,
    IPPORT_SMTP = 25,
    IPPORT_TIMESERVER = 37,
    IPPORT_NAMESERVER = 42,
    IPPORT_WHOIS = 43,
    IPPORT_MTP = 57,
    IPPORT_TFTP = 69,
    IPPORT_RJE = 77,
    IPPORT_FINGER = 79,
    IPPORT_TTYLINK = 87,
    IPPORT_SUPDUP = 95,
    IPPORT_EXECSERVER = 512,
    IPPORT_LOGINSERVER = 513,
    IPPORT_CMDSERVER = 514,
    IPPORT_EFSSERVER = 520,
    IPPORT_BIFFUDP = 512,
    IPPORT_WHOSERVER = 513,
    IPPORT_ROUTESERVER = 520,
    IPPORT_RESERVED = 1024,
    IPPORT_USERRESERVED = 5000
  };
struct in6_addr
  {
    union
      {
 uint8_t __u6_addr8[16];
 uint16_t __u6_addr16[8];
 uint32_t __u6_addr32[4];
      } __in6_u;
  };
extern const struct in6_addr in6addr_any;
extern const struct in6_addr in6addr_loopback;
struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;
    struct in_addr sin_addr;
    unsigned char sin_zero[sizeof (struct sockaddr) -
      (sizeof (unsigned short int)) -
      sizeof (in_port_t) -
      sizeof (struct in_addr)];
  };
struct sockaddr_in6
  {
    sa_family_t sin6_family;
    in_port_t sin6_port;
    uint32_t sin6_flowinfo;
    struct in6_addr sin6_addr;
    uint32_t sin6_scope_id;
  };
struct ip_mreq
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_interface;
  };
struct ip_mreq_source
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_interface;
    struct in_addr imr_sourceaddr;
  };
struct ipv6_mreq
  {
    struct in6_addr ipv6mr_multiaddr;
    unsigned int ipv6mr_interface;
  };
struct group_req
  {
    uint32_t gr_interface;
    struct sockaddr_storage gr_group;
  };
struct group_source_req
  {
    uint32_t gsr_interface;
    struct sockaddr_storage gsr_group;
    struct sockaddr_storage gsr_source;
  };
struct ip_msfilter
  {
    struct in_addr imsf_multiaddr;
    struct in_addr imsf_interface;
    uint32_t imsf_fmode;
    uint32_t imsf_numsrc;
    struct in_addr imsf_slist[1];
  };
struct group_filter
  {
    uint32_t gf_interface;
    struct sockaddr_storage gf_group;
    uint32_t gf_fmode;
    uint32_t gf_numsrc;
    struct sockaddr_storage gf_slist[1];
};
extern uint32_t ntohl (uint32_t __netlong) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t ntohs (uint16_t __netshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint32_t htonl (uint32_t __hostlong)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t htons (uint16_t __hostshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int bindresvport (int __sockfd, struct sockaddr_in *__sock_in) __attribute__ ((__nothrow__ , __leaf__));
extern int bindresvport6 (int __sockfd, struct sockaddr_in6 *__sock_in)
     __attribute__ ((__nothrow__ , __leaf__));
typedef union {
    uint64_t all;
    struct {
 uint32_t a;
 uint32_t b;
    } part;
} lo_split64;
static inline uint64_t lo_swap64(uint64_t x)
{
    lo_split64 in, out;
    in.all = x;
    out.part.a = htonl(in.part.b);
    out.part.b = htonl(in.part.a);
    return out.all;
}
struct rpcent
{
  char *r_name;
  char **r_aliases;
  int r_number;
};
extern void setrpcent (int __stayopen) __attribute__ ((__nothrow__ , __leaf__));
extern void endrpcent (void) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcbyname (const char *__name) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcbynumber (int __number) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcent (void) __attribute__ ((__nothrow__ , __leaf__));
extern int getrpcbyname_r (const char *__name, struct rpcent *__result_buf,
      char *__buffer, size_t __buflen,
      struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));
extern int getrpcbynumber_r (int __number, struct rpcent *__result_buf,
        char *__buffer, size_t __buflen,
        struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));
extern int getrpcent_r (struct rpcent *__result_buf, char *__buffer,
   size_t __buflen, struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));
struct netent
{
  char *n_name;
  char **n_aliases;
  int n_addrtype;
  uint32_t n_net;
};
extern int *__h_errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern void herror (const char *__str) __attribute__ ((__nothrow__ , __leaf__));
extern const char *hstrerror (int __err_num) __attribute__ ((__nothrow__ , __leaf__));
struct hostent
{
  char *h_name;
  char **h_aliases;
  int h_addrtype;
  int h_length;
  char **h_addr_list;
};
extern void sethostent (int __stay_open);
extern void endhostent (void);
extern struct hostent *gethostent (void);
extern struct hostent *gethostbyaddr (const void *__addr, __socklen_t __len,
          int __type);
extern struct hostent *gethostbyname (const char *__name);
extern struct hostent *gethostbyname2 (const char *__name, int __af);
extern int gethostent_r (struct hostent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct hostent **__restrict __result,
    int *__restrict __h_errnop);
extern int gethostbyaddr_r (const void *__restrict __addr, __socklen_t __len,
       int __type,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);
extern int gethostbyname_r (const char *__restrict __name,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);
extern int gethostbyname2_r (const char *__restrict __name, int __af,
        struct hostent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct hostent **__restrict __result,
        int *__restrict __h_errnop);
extern void setnetent (int __stay_open);
extern void endnetent (void);
extern struct netent *getnetent (void);
extern struct netent *getnetbyaddr (uint32_t __net, int __type);
extern struct netent *getnetbyname (const char *__name);
extern int getnetent_r (struct netent *__restrict __result_buf,
   char *__restrict __buf, size_t __buflen,
   struct netent **__restrict __result,
   int *__restrict __h_errnop);
extern int getnetbyaddr_r (uint32_t __net, int __type,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);
extern int getnetbyname_r (const char *__restrict __name,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);
struct servent
{
  char *s_name;
  char **s_aliases;
  int s_port;
  char *s_proto;
};
extern void setservent (int __stay_open);
extern void endservent (void);
extern struct servent *getservent (void);
extern struct servent *getservbyname (const char *__name, const char *__proto);
extern struct servent *getservbyport (int __port, const char *__proto);
extern int getservent_r (struct servent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct servent **__restrict __result);
extern int getservbyname_r (const char *__restrict __name,
       const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);
extern int getservbyport_r (int __port, const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);
struct protoent
{
  char *p_name;
  char **p_aliases;
  int p_proto;
};
extern void setprotoent (int __stay_open);
extern void endprotoent (void);
extern struct protoent *getprotoent (void);
extern struct protoent *getprotobyname (const char *__name);
extern struct protoent *getprotobynumber (int __proto);
extern int getprotoent_r (struct protoent *__restrict __result_buf,
     char *__restrict __buf, size_t __buflen,
     struct protoent **__restrict __result);
extern int getprotobyname_r (const char *__restrict __name,
        struct protoent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct protoent **__restrict __result);
extern int getprotobynumber_r (int __proto,
          struct protoent *__restrict __result_buf,
          char *__restrict __buf, size_t __buflen,
          struct protoent **__restrict __result);
extern int setnetgrent (const char *__netgroup);
extern void endnetgrent (void);
extern int getnetgrent (char **__restrict __hostp,
   char **__restrict __userp,
   char **__restrict __domainp);
extern int innetgr (const char *__netgroup, const char *__host,
      const char *__user, const char *__domain);
extern int getnetgrent_r (char **__restrict __hostp,
     char **__restrict __userp,
     char **__restrict __domainp,
     char *__restrict __buffer, size_t __buflen);
extern int rcmd (char **__restrict __ahost, unsigned short int __rport,
   const char *__restrict __locuser,
   const char *__restrict __remuser,
   const char *__restrict __cmd, int *__restrict __fd2p);
extern int rcmd_af (char **__restrict __ahost, unsigned short int __rport,
      const char *__restrict __locuser,
      const char *__restrict __remuser,
      const char *__restrict __cmd, int *__restrict __fd2p,
      sa_family_t __af);
extern int rexec (char **__restrict __ahost, int __rport,
    const char *__restrict __name,
    const char *__restrict __pass,
    const char *__restrict __cmd, int *__restrict __fd2p);
extern int rexec_af (char **__restrict __ahost, int __rport,
       const char *__restrict __name,
       const char *__restrict __pass,
       const char *__restrict __cmd, int *__restrict __fd2p,
       sa_family_t __af);
extern int ruserok (const char *__rhost, int __suser,
      const char *__remuser, const char *__locuser);
extern int ruserok_af (const char *__rhost, int __suser,
         const char *__remuser, const char *__locuser,
         sa_family_t __af);
extern int iruserok (uint32_t __raddr, int __suser,
       const char *__remuser, const char *__locuser);
extern int iruserok_af (const void *__raddr, int __suser,
   const char *__remuser, const char *__locuser,
   sa_family_t __af);
extern int rresvport (int *__alport);
extern int rresvport_af (int *__alport, sa_family_t __af);
struct addrinfo
{
  int ai_flags;
  int ai_family;
  int ai_socktype;
  int ai_protocol;
  socklen_t ai_addrlen;
  struct sockaddr *ai_addr;
  char *ai_canonname;
  struct addrinfo *ai_next;
};
extern int getaddrinfo (const char *__restrict __name,
   const char *__restrict __service,
   const struct addrinfo *__restrict __req,
   struct addrinfo **__restrict __pai);
extern void freeaddrinfo (struct addrinfo *__ai) __attribute__ ((__nothrow__ , __leaf__));
extern const char *gai_strerror (int __ecode) __attribute__ ((__nothrow__ , __leaf__));
extern int getnameinfo (const struct sockaddr *__restrict __sa,
   socklen_t __salen, char *__restrict __host,
   socklen_t __hostlen, char *__restrict __serv,
   socklen_t __servlen, int __flags);
typedef struct {
 uint32_t sec;
 uint32_t frac;
} lo_timetag;
typedef enum {
 LO_ELEMENT_MESSAGE = 1,
 LO_ELEMENT_BUNDLE = 2
} lo_element_type;
typedef enum {
 LO_INT32 = 'i',
 LO_FLOAT = 'f',
 LO_STRING = 's',
 LO_BLOB = 'b',
 LO_INT64 = 'h',
 LO_TIMETAG = 't',
 LO_DOUBLE = 'd',
 LO_SYMBOL = 'S',
 LO_CHAR = 'c',
 LO_MIDI = 'm',
 LO_TRUE = 'T',
 LO_FALSE = 'F',
 LO_NIL = 'N',
 LO_INFINITUM = 'I'
} lo_type;
typedef union {
    int32_t i;
    int32_t i32;
    int64_t h;
    int64_t i64;
    float f;
    float f32;
    double d;
    double f64;
    char s;
    char S;
    unsigned char c;
    uint8_t m[4];
    lo_timetag t;
    struct {
        int32_t size;
        char data;
    } blob;
} lo_arg;
typedef void *lo_address;
typedef void *lo_blob;
typedef void *lo_message;
typedef void *lo_bundle;
typedef void *lo_method;
typedef void *lo_server;
typedef void *lo_server_thread;
typedef void (*lo_err_handler)(int num, const char *msg, const char *where);
typedef int (*lo_method_handler)(const char *path, const char *types,
     lo_arg **argv, int argc, lo_message msg,
     void *user_data);
typedef int (*lo_bundle_start_handler)(lo_timetag time, void *user_data);
typedef int (*lo_bundle_end_handler)(void *user_data);
typedef int (*lo_server_thread_init_callback)(lo_server_thread s,
                                              void *user_data);
typedef void (*lo_server_thread_cleanup_callback)(lo_server_thread s,
                                                  void *user_data);
typedef __builtin_va_list __gnuc_va_list;
typedef __gnuc_va_list va_list;
typedef long double lo_hires;
int lo_send_message(lo_address targ, const char *path, lo_message msg);
int lo_send_message_from(lo_address targ, lo_server serv,
     const char *path, lo_message msg);
int lo_send_bundle(lo_address targ, lo_bundle b);
int lo_send_bundle_from(lo_address targ, lo_server serv, lo_bundle b);
lo_message lo_message_new();
void lo_message_incref(lo_message m);
lo_message lo_message_clone(lo_message m);
void lo_message_free(lo_message m);
int lo_message_add(lo_message m, const char *types, ...);
int lo_message_add_internal(lo_message m, const char *file, const int line,
                            const char *types, ...);
int lo_message_add_varargs(lo_message m, const char *types, va_list ap);
int lo_message_add_varargs_internal(lo_message m, const char *types, va_list ap,
                                    const char *file, const int line);
int lo_message_add_int32(lo_message m, int32_t a);
int lo_message_add_float(lo_message m, float a);
int lo_message_add_string(lo_message m, const char *a);
int lo_message_add_blob(lo_message m, lo_blob a);
int lo_message_add_int64(lo_message m, int64_t a);
int lo_message_add_timetag(lo_message m, lo_timetag a);
int lo_message_add_double(lo_message m, double a);
int lo_message_add_symbol(lo_message m, const char *a);
int lo_message_add_char(lo_message m, char a);
int lo_message_add_midi(lo_message m, uint8_t a[4]);
int lo_message_add_true(lo_message m);
int lo_message_add_false(lo_message m);
int lo_message_add_nil(lo_message m);
int lo_message_add_infinitum(lo_message m);
lo_address lo_message_get_source(lo_message m);
lo_timetag lo_message_get_timestamp(lo_message m);
char *lo_message_get_types(lo_message m);
int lo_message_get_argc(lo_message m);
lo_arg **lo_message_get_argv(lo_message m);
size_t lo_message_length(lo_message m, const char *path);
void *lo_message_serialise(lo_message m, const char *path, void *to,
      size_t *size);
lo_message lo_message_deserialise(void *data, size_t size, int *result);
int lo_server_dispatch_data(lo_server s, void *data, size_t size);
const char *lo_address_get_hostname(lo_address a);
const char *lo_address_get_port(lo_address a);
int lo_address_get_protocol(lo_address a);
char *lo_address_get_url(lo_address a);
void lo_address_set_ttl(lo_address t, int ttl);
int lo_address_get_ttl(lo_address t);
int lo_address_set_iface(lo_address t, const char *iface, const char *ip);
const char* lo_address_get_iface(lo_address t);
int lo_address_set_tcp_nodelay(lo_address t, int enable);
int lo_address_set_stream_slip(lo_address t, int enable);
lo_bundle lo_bundle_new(lo_timetag tt);
void lo_bundle_incref(lo_bundle b);
int lo_bundle_add_message(lo_bundle b, const char *path, lo_message m);
int lo_bundle_add_bundle(lo_bundle b, lo_bundle n);
size_t lo_bundle_length(lo_bundle b);
unsigned int lo_bundle_count(lo_bundle b);
lo_element_type lo_bundle_get_type(lo_bundle b, int index);
lo_bundle lo_bundle_get_bundle(lo_bundle b, int index);
lo_message lo_bundle_get_message(lo_bundle b, int index,
                                 const char **path);
lo_timetag lo_bundle_get_timestamp(lo_bundle b);
void *lo_bundle_serialise(lo_bundle b, void *to, size_t *size);
void lo_bundle_free(lo_bundle b);
void lo_bundle_free_recursive(lo_bundle b);
void lo_bundle_free_messages(lo_bundle b);
int lo_is_numerical_type(lo_type a);
int lo_is_string_type(lo_type a);
int lo_coerce(lo_type type_to, lo_arg *to, lo_type type_from, lo_arg *from);
lo_hires lo_hires_val(lo_type type, lo_arg *p);
lo_server lo_server_new(const char *port, lo_err_handler err_h);
lo_server lo_server_new_with_proto(const char *port, int proto,
                                   lo_err_handler err_h);
lo_server lo_server_new_multicast(const char *group, const char *port,
                                  lo_err_handler err_h);
lo_server lo_server_new_multicast_iface(const char *group, const char *port,
                                        const char *iface, const char *ip,
                                        lo_err_handler err_h);
lo_server lo_server_new_from_url(const char *url,
                                 lo_err_handler err_h);
int lo_server_enable_coercion(lo_server server, int enable);
void lo_server_free(lo_server s);
int lo_server_wait(lo_server s, int timeout);
int lo_server_recv_noblock(lo_server s, int timeout);
int lo_server_recv(lo_server s);
lo_method lo_server_add_method(lo_server s, const char *path,
                               const char *typespec, lo_method_handler h,
                               const void *user_data);
void lo_server_del_method(lo_server s, const char *path,
                               const char *typespec);
int lo_server_del_lo_method(lo_server s, lo_method m);
int lo_server_add_bundle_handlers(lo_server s,
                                  lo_bundle_start_handler sh,
                                  lo_bundle_end_handler eh,
                                  void *user_data);
int lo_server_get_socket_fd(lo_server s);
int lo_server_get_port(lo_server s);
int lo_server_get_protocol(lo_server s);
char *lo_server_get_url(lo_server s);
int lo_server_enable_queue(lo_server s, int queue_enabled,
                           int dispatch_remaining);
int lo_server_events_pending(lo_server s);
double lo_server_next_event_delay(lo_server s);
int lo_server_max_msg_size(lo_server s, int req_size);
char *lo_url_get_protocol(const char *url);
int lo_url_get_protocol_id(const char *url);
char *lo_url_get_hostname(const char *url);
char *lo_url_get_port(const char *url);
char *lo_url_get_path(const char *url);
int lo_strsize(const char *s);
uint32_t lo_blobsize(lo_blob b);
int lo_pattern_match(const char *str, const char *p);
int lo_send_internal(lo_address t, const char *file, const int line,
     const char *path, const char *types, ...);
int lo_send_timestamped_internal(lo_address t, const char *file, const int line,
     lo_timetag ts, const char *path, const char *types, ...);
int lo_send_from_internal(lo_address targ, lo_server from, const char *file,
     const int line, const lo_timetag ts,
     const char *path, const char *types, ...);
double lo_timetag_diff(lo_timetag a, lo_timetag b);
void lo_timetag_now(lo_timetag *t);
size_t lo_arg_size(lo_type type, void *data);
char *lo_get_path(void *data, ssize_t size);
void lo_arg_host_endian(lo_type type, void *data);
void lo_arg_network_endian(lo_type type, void *data);
void lo_bundle_pp(lo_bundle b);
void lo_message_pp(lo_message m);
void lo_arg_pp(lo_type type, void *data);
void lo_server_pp(lo_server s);
void lo_method_pp(lo_method m);
void lo_method_pp_prefix(lo_method m, const char *p);
lo_server_thread lo_server_thread_new(const char *port, lo_err_handler err_h);
lo_server_thread lo_server_thread_new_multicast(const char *group, const char *port,
                                                lo_err_handler err_h);
lo_server_thread lo_server_thread_new_multicast_iface(const char *group, const char *port,
            const char *iface, const char *ip,
            lo_err_handler err_h);
lo_server_thread lo_server_thread_new_with_proto(const char *port, int proto,
       lo_err_handler err_h);
lo_server_thread lo_server_thread_new_from_url(const char *url,
                                               lo_err_handler err_h);
void lo_server_thread_free(lo_server_thread st);
lo_method lo_server_thread_add_method(lo_server_thread st, const char *path,
                               const char *typespec, lo_method_handler h,
                               const void *user_data);
void lo_server_thread_del_method(lo_server_thread st, const char *path,
     const char *typespec);
int lo_server_thread_del_lo_method(lo_server_thread st, lo_method m);
void lo_server_thread_set_callbacks(lo_server_thread st,
                                    lo_server_thread_init_callback init,
                                    lo_server_thread_cleanup_callback cleanup,
                                    void *user_data);
int lo_server_thread_start(lo_server_thread st);
int lo_server_thread_stop(lo_server_thread st);
int lo_server_thread_get_port(lo_server_thread st);
char *lo_server_thread_get_url(lo_server_thread st);
lo_server lo_server_thread_get_server(lo_server_thread st);
int lo_server_thread_events_pending(lo_server_thread st);
void lo_server_thread_set_error_context(lo_server_thread st, void *user_data);
void lo_server_thread_pp(lo_server_thread st);
lo_address lo_address_new(const char *host, const char *port);
lo_address lo_address_new_with_proto(int proto, const char *host, const char *port);
lo_address lo_address_new_from_url(const char *url);
void lo_address_free(lo_address t);
void lo_address_set_ttl(lo_address t, int ttl);
int lo_address_get_ttl(lo_address t);
int lo_send(lo_address targ, const char *path, const char *type, ...);
int lo_send_from(lo_address targ, lo_server from, lo_timetag ts,
          const char *path, const char *type, ...);
int lo_send_timestamped(lo_address targ, lo_timetag ts, const char *path,
          const char *type, ...);
int lo_address_errno(lo_address a);
const char *lo_address_errstr(lo_address a);
lo_blob lo_blob_new(int32_t size, const void *data);
void lo_blob_free(lo_blob b);
uint32_t lo_blob_datasize(lo_blob b);
void *lo_blob_dataptr(lo_blob b);
void lo_version(char *verstr, int verstr_size,
                int *major, int *minor, char *extra, int extra_size,
                int *lt_major, int *lt_minor, int *lt_bug);
]]

--used in lo:send() method body, useful beyond lo:send()
--http://lua-users.org/wiki/SwitchStatement
function switch(n, ...)
	for _,v in ipairs {...} do
		if v[1] == n or v[1] == nil then
			return v[2]()
		end
	end
end
function case(n,f) return {n,f} end
function default(f) return {nil,f} end

--lo_* methods
function lo:send_message(...) return ffi.C.lo_send_message(...) end
function lo:send_message_from(...) return ffi.C.lo_send_message_from(...) end
function lo:send_bundle(...) return ffi.C.lo_send_bundle(...) end
function lo:send_bundle_from(...) return ffi.C.lo_send_bundle_from(...) end
function lo:message_new() return ffi.C.lo_message_new() end
function lo:message_incref(...)  ffi.C.lo_message_incref(...) end
function lo:message_clone(...) return ffi.C.lo_message_clone(...) end
function lo:message_free(...)  ffi.C.lo_message_free(...) end
function lo:message_add_int32(...) return ffi.C.lo_message_add_int32(...) end
function lo:message_add_float(...) return ffi.C.lo_message_add_float(...) end
function lo:message_add_string(...) return ffi.C.lo_message_add_string(...) end
function lo:message_add_blob(...) return ffi.C.lo_message_add_blob(...) end
function lo:message_add_int64(...) return ffi.C.lo_message_add_int64(...) end
function lo:message_add_timetag(...) return ffi.C.lo_message_add_timetag(...) end
function lo:message_add_double(...) return ffi.C.lo_message_add_double(...) end
function lo:message_add_symbol(...) return ffi.C.lo_message_add_symbol(...) end
function lo:message_add_char(...) return ffi.C.lo_message_add_char(...) end
function lo:message_add_midi(...) return ffi.C.lo_message_add_midi(...) end
function lo:message_add_true(...) return ffi.C.lo_message_add_true(...) end
function lo:message_add_false(...) return ffi.C.lo_message_add_false(...) end
function lo:message_add_nil(...) return ffi.C.lo_message_add_nil(...) end
function lo:message_add_infinitum(...) return ffi.C.lo_message_add_infinitum(...) end
function lo:message_get_source(...) return ffi.C.lo_message_get_source(...) end
function lo:message_get_timestamp(...) return ffi.C.lo_message_get_timestamp(...) end
function lo:message_get_types(...) return ffi.C.lo_message_get_types(...) end
function lo:message_get_types_string(...) return ffi.string(ffi.C.lo_message_get_types(...)) end
function lo:message_get_argc(...) return ffi.C.lo_message_get_argc(...) end
function lo:message_get_argv(...) return ffi.C.lo_message_get_argv(...) end
function lo:message_length(...) return ffi.C.lo_message_length(...) end
function lo:message_serialise(...)  ffi.C.lo_message_serialise(...) end
function lo:message_deserialise(...) return ffi.C.lo_message_deserialise(...) end
function lo:server_dispatch_data(...) return ffi.C.lo_server_dispatch_data(...) end
function lo:address_get_hostname(...) return ffi.C.lo_address_get_hostname(...) end
function lo:address_get_hostname_string(...) return ffi.string(ffi.C.lo_address_get_hostname(...)) end
function lo:address_get_port(...) return ffi.C.lo_address_get_port(...) end
function lo:address_get_port_string(...) return ffi.string(ffi.C.lo_address_get_port(...)) end
function lo:address_get_protocol(...) return ffi.C.lo_address_get_protocol(...) end
function lo:address_get_url(...) return ffi.C.lo_address_get_url(...) end
function lo:address_get_url_string(...) return ffi.string(ffi.C.lo_address_get_url(...)) end
function lo:address_set_ttl(...)  ffi.C.lo_address_set_ttl(...) end
function lo:address_get_ttl(...) return ffi.C.lo_address_get_ttl(...) end
function lo:address_set_iface(...) return ffi.C.lo_address_set_iface(...) end
function lo:address_get_iface(...) return ffi.C.lo_address_get_iface(...) end
function lo:address_get_iface_string(...) return ffi.string(ffi.C.lo_address_get_iface(...)) end
function lo:address_set_tcp_nodelay(...) return ffi.C.lo_address_set_tcp_nodelay(...) end
function lo:address_set_stream_slip(...) return ffi.C.lo_address_set_stream_slip(...) end
function lo:bundle_new(...) return ffi.C.lo_bundle_new(...) end
function lo:bundle_incref(...)  ffi.C.lo_bundle_incref(...) end
function lo:bundle_add_message(...) return ffi.C.lo_bundle_add_message(...) end
function lo:bundle_add_bundle(...) return ffi.C.lo_bundle_add_bundle(...) end
function lo:bundle_length(...) return ffi.C.lo_bundle_length(...) end
function lo:bundle_get_type(...) return ffi.C.lo_bundle_get_type(...) end
function lo:bundle_get_bundle(...) return ffi.C.lo_bundle_get_bundle(...) end
function lo:bundle_get_message(...) return ffi.C.lo_bundle_get_message(...) end
function lo:bundle_get_timestamp(...) return ffi.C.lo_bundle_get_timestamp(...) end
function lo:bundle_serialise(...)  ffi.C.lo_bundle_serialise(...) end
function lo:bundle_free(...)  ffi.C.lo_bundle_free(...) end
function lo:bundle_free_recursive(...)  ffi.C.lo_bundle_free_recursive(...) end
function lo:bundle_free_messages(...)  ffi.C.lo_bundle_free_messages(...) end
function lo:is_numerical_type(...) return ffi.C.lo_is_numerical_type(...) end
function lo:is_string_type(...) return ffi.C.lo_is_string_type(...) end
function lo:coerce(...) return ffi.C.lo_coerce(...) end
function lo:hires_val(...) return ffi.C.lo_hires_val(...) end
function lo:server_new(...) return ffi.C.lo_server_new(...) end
function lo:server_new_with_proto(...) return ffi.C.lo_server_new_with_proto(...) end
function lo:server_new_multicast(...) return ffi.C.lo_server_new_multicast(...) end
function lo:server_new_multicast_iface(...) return ffi.C.lo_server_new_multicast_iface(...) end
function lo:server_new_from_url(...) return ffi.C.lo_server_new_from_url(...) end
function lo:server_enable_coercion(...) return ffi.C.lo_server_enable_coercion(...) end
function lo:server_free(...)  ffi.C.lo_server_free(...) end
function lo:server_wait(...) return ffi.C.lo_server_wait(...) end
function lo:server_recv_noblock(...) return ffi.C.lo_server_recv_noblock(...) end
function lo:server_recv(...) return ffi.C.lo_server_recv(...) end
function lo:server_add_method(...) return ffi.C.lo_server_add_method(...) end
function lo:server_del_method(...)  ffi.C.lo_server_del_method(...) end
function lo:server_del_lo_method(...) return ffi.C.lo_server_del_lo_method(...) end
function lo:server_add_bundle_handlers(...) return ffi.C.lo_server_add_bundle_handlers(...) end
function lo:server_get_socket_fd(...) return ffi.C.lo_server_get_socket_fd(...) end
function lo:server_get_port(...) return ffi.C.lo_server_get_port(...) end
function lo:server_get_protocol(...) return ffi.C.lo_server_get_protocol(...) end
function lo:server_get_url(...) return ffi.C.lo_server_get_url(...) end
function lo:server_get_url_string(...) return ffi.string(ffi.C.lo_server_get_url(...)) end
function lo:server_enable_queue(...) return ffi.C.lo_server_enable_queue(...) end
function lo:server_events_pending(...) return ffi.C.lo_server_events_pending(...) end
function lo:server_next_event_delay(...) return ffi.C.lo_server_next_event_delay(...) end
function lo:server_max_msg_size(...) return ffi.C.lo_server_max_msg_size(...) end
function lo:url_get_protocol(...) return ffi.C.lo_url_get_protocol(...) end
function lo:url_get_protocol_string(...) return ffi.string(ffi.C.lo_url_get_protocol(...)) end
function lo:url_get_protocol_id(...) return ffi.C.lo_url_get_protocol_id(...) end
function lo:url_get_hostname(...) return ffi.C.lo_url_get_hostname(...) end
function lo:url_get_hostname_string(...) return ffi.string(ffi.C.lo_url_get_hostname(...)) end
function lo:url_get_port(...) return ffi.C.lo_url_get_port(...) end
function lo:url_get_port_string(...) return ffi.string(ffi.C.lo_url_get_port(...)) end
function lo:url_get_path(...) return ffi.C.lo_url_get_path(...) end
function lo:url_get_path_string(...) return ffi.string(ffi.C.lo_url_get_path(...)) end
function lo:strsize(...) return ffi.C.lo_strsize(...) end
function lo:blobsize(...) return ffi.C.lo_blobsize(...) end
function lo:pattern_match(...) return ffi.C.lo_pattern_match(...) end
function lo:timetag_diff(...) return ffi.C.lo_timetag_diff(...) end
function lo:timetag_now(...)  ffi.C.lo_timetag_now(...) end
function lo:arg_size(...) return ffi.C.lo_arg_size(...) end
function lo:get_path(...) return ffi.C.lo_get_path(...) end
function lo:get_path_string(...) return ffi.string(ffi.C.lo_get_path(...)) end
function lo:arg_host_endian(...)  ffi.C.lo_arg_host_endian(...) end
function lo:arg_network_endian(...)  ffi.C.lo_arg_network_endian(...) end
function lo:bundle_pp(...)  ffi.C.lo_bundle_pp(...) end
function lo:message_pp(...)  ffi.C.lo_message_pp(...) end
function lo:arg_pp(...)  ffi.C.lo_arg_pp(...) end
function lo:server_pp(...)  ffi.C.lo_server_pp(...) end
function lo:method_pp(...)  ffi.C.lo_method_pp(...) end
function lo:method_pp_prefix(...)  ffi.C.lo_method_pp_prefix(...) end
function lo:server_thread_new(...) return ffi.C.lo_server_thread_new(...) end
function lo:server_thread_new_multicast(...) return ffi.C.lo_server_thread_new_multicast(...) end
function lo:server_thread_new_multicast_iface(...) return ffi.C.lo_server_thread_new_multicast_iface(...) end
function lo:server_thread_new_with_proto(...) return ffi.C.lo_server_thread_new_with_proto(...) end
function lo:server_thread_new_from_url(...) return ffi.C.lo_server_thread_new_from_url(...) end
function lo:server_thread_free(...)  ffi.C.lo_server_thread_free(...) end
function lo:server_thread_add_method(...) return ffi.C.lo_server_thread_add_method(...) end
function lo:server_thread_del_method(...)  ffi.C.lo_server_thread_del_method(...) end
function lo:server_thread_del_lo_method(...) return ffi.C.lo_server_thread_del_lo_method(...) end
function lo:server_thread_set_callbacks(...)  ffi.C.lo_server_thread_set_callbacks(...) end
function lo:server_thread_start(...) return ffi.C.lo_server_thread_start(...) end
function lo:server_thread_stop(...) return ffi.C.lo_server_thread_stop(...) end
function lo:server_thread_get_port(...) return ffi.C.lo_server_thread_get_port(...) end
function lo:server_thread_get_url(...) return ffi.C.lo_server_thread_get_url(...) end
function lo:server_thread_get_url_string(...) return ffi.string(ffi.C.lo_server_thread_get_url(...)) end
function lo:server_thread_get_server(...) return ffi.C.lo_server_thread_get_server(...) end
function lo:server_thread_events_pending(...) return ffi.C.lo_server_thread_events_pending(...) end
function lo:server_thread_set_error_context(...)  ffi.C.lo_server_thread_set_error_context(...) end
function lo:server_thread_pp(...)  ffi.C.lo_server_thread_pp(...) end
function lo:address_new(...) return ffi.C.lo_address_new(...) end
function lo:address_new_with_proto(...) return ffi.C.lo_address_new_with_proto(...) end
function lo:address_new_from_url(...) return ffi.C.lo_address_new_from_url(...) end
function lo:address_free(...)  ffi.C.lo_address_free(...) end
function lo:address_set_ttl(...)  ffi.C.lo_address_set_ttl(...) end
function lo:address_get_ttl(...) return ffi.C.lo_address_get_ttl(...) end
function lo:address_errno(...) return ffi.C.lo_address_errno(...) end
function lo:address_errstr(...) return ffi.C.lo_address_errstr(...) end
function lo:address_errstr_string(...) return ffi.string(ffi.C.lo_address_errstr(...)) end
function lo:blob_new(...) return ffi.C.lo_blob_new(...) end
function lo:blob_free(...)  ffi.C.lo_blob_free(...) end
function lo:blob_datasize(...) return ffi.C.lo_blob_datasize(...) end
function lo:blob_dataptr(...)  ffi.C.lo_blob_dataptr(...) end
function lo:version(...)  ffi.C.lo_version(...) end

--lo_* method equivalents that are a macro in lo.h
--lo_* helper methods
--other convenience methods that are no part of liblo

function lo:send_flat(host,port,path,typestring,...)
	return lo:send(lo:address_new(host,port),path,typestring,...)
end

function lo:send(address,path,typestring,...)
	local n = select('#', ...)
	local t = {...}
--	for i = 1,n do
--		print(t[i])
--	end

	local m=lo:message_new()

	local t_offset=0
	for i = 1, #typestring do
		local type=string.sub(typestring, i, i)
		switch( type,
			case( "i", function() lo:message_add_int32 (m,t[i-t_offset]) end),
			case( "f", function() lo:message_add_float (m,t[i-t_offset]) end),
			case( "s", function() lo:message_add_string(m,t[i-t_offset]) end),
			case( "h", function() lo:message_add_int64 (m,t[i-t_offset]) end),
			case( "d", function() lo:message_add_double(m,t[i-t_offset]) end),
			case( "c", function() lo:message_add_char(m,t[i-t_offset]) end),
			case( "S", function() lo:message_add_symbol(m,t[i-t_offset]) end),
			case( "b", function() lo:message_add_blob(m,t[i-t_offset]) end),
			case( "m", function() lo:message_add_midi(m,t[i-t_offset]) end),
			case( "t", function() lo:message_add_timetag(m,t[i-t_offset]) end),

			case( "T", function() lo:message_add_true(m) t_offset=t_offset+1 end),
			case( "F", function() lo:message_add_false(m) t_offset=t_offset+1 end),
			case( "N", function() lo:message_add_nil(m) t_offset=t_offset+1 end),
			case( "I", function() lo:message_add_infinitum(m) t_offset=t_offset+1 end),

			--///ignore
			case( "[", function() t_offset=t_offset+1 end),
			case( "]", function() t_offset=t_offset+1 end),
			--case( "r", function() end),

			default( function() print("unknown OSC type: " .. type) return 1 end)
		)
	end

	--local address=lo:address_new(host,port)
	local r=lo:send_message(address,path,m)
	--lo:address_free(address)
	lo:message_free(m)
end

function lo:version_helper()
	local verstr_size=128
	local extra_size=128
	local verstr = ffi.new("uint8_t[?]", verstr_size)
	local extra = ffi.new("uint8_t[?]", extra_size)

	--http://luajit.org/ext_ffi_tutorial.html
	--In C you'd pass in the address of a local variable (&buflen). But since there's no address-of operator in Lua, we'll just pass in a one-element array.
	major=ffi.new("int[1]")
	minor=ffi.new("int[1]")
	lt_major=ffi.new("int[1]")
	lt_minor=ffi.new("int[1]")
	lt_bug=ffi.new("int[1]")

	lo:version(verstr, verstr_size, major, minor, extra, extra_size, lt_major, lt_minor, lt_bug)

	return ffi.string(verstr), tonumber(major[0]), tonumber(minor[0]),
		ffi.string(extra), tonumber(lt_major[0]), tonumber(lt_minor[0]), tonumber(lt_bug[0])
end

function lo:malloc_gc(len)
	--eventually garbage collect malloced buffer using C.free after buffer was nil'ed
	return ffi.gc(ffi.C.malloc(ffi.cast("size_t",len)), ffi.C.free)
end

--uncomment the following line if lo.lua should be totally quiet
print("osc.lua loaded. using liblo version: " .. lo:version_helper())
return lo

--EOF
