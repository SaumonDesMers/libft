NAME		= libft.a

SRC_DIR		= src
SRCS		=	$(patsubst %, $(SRC_DIR)/%, ft_memset.c ft_bzero.c \
				ft_memcpy.c ft_memccpy.c ft_memmove.c ft_memchr.c \
				ft_memcmp.c ft_strlen.c ft_isalpha.c ft_isdigit.c \
				ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c \
				ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c \
				ft_strlcpy.c ft_strlcat.c ft_strnstr.c ft_atoi.c \
				ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c \
				ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
				ft_putchar_fd.c ft_putnbr_fd.c ft_putstr_fd.c ft_putendl_fd.c \
<<<<<<< HEAD
				ft_gnl.c ft_atol.c)
=======
				ft_atof.c ft_gnl.c ft_split_utils.c)
>>>>>>> f8e5ae5f4893b640326114c179a6564d6f9d928c

LIST_DIR	= src
LIST_SRCS	=	$(patsubst %, $(LIST_DIR)/%, ft_lstnew.c ft_lstadd_front.c \
				ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c \
				ft_lstclear.c ft_lstiter.c ft_lstmap.c ft_lstget_front.c \
				ft_lstprint.c)

OBJ_DIR		= obj
OBJS		=	$(SRCS:$(SRC_DIR)/%.c=${OBJ_DIR}/%.o) \
				$(LIST_SRCS:$(LIST_DIR)/%.c=${OBJ_DIR}/%.o) \

CC			= cc
CFLAGS		= -Wall -Wextra -Werror
AR			= ar rcs
RM			= rm -f

${OBJ_DIR}/%.o:$(SRC_DIR)/%.c
			@mkdir -p ${OBJ_DIR}
			@${CC} ${CFLAGS} -I includes -c $< -o $@

${NAME}:	${OBJS}
			@${AR} ${NAME} ${OBJS}
			@echo "Done"

all:		${NAME}

so:
			$(CC) -fPIC $(CFLAGS) -c $(SRCS) $(LIST_SRCS)
			gcc -shared -o libft.so ${OBJS}

clean:
			@${RM} ${OBJS}
			@echo "Remove obj"

fclean:		clean
			@${RM} ${NAME}
			@echo "Remove ${NAME}"

re:			fclean all

.PHONY:		all clean fclean re