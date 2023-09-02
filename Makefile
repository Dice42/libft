# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mohammoh <mohammoh@student.42abudhabi.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/27 11:03:30 by nshahid           #+#    #+#              #
#    Updated: 2023/08/23 18:37:24 by mohammoh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCP		= ./
SRCP_B		= ./
SRCS		= ft_atoi.c \
				ft_bzero.c \
				ft_calloc.c \
				ft_isalnum.c \
				ft_isalpha.c \
				ft_isascii.c \
				ft_isdigit.c \
				ft_isprint.c \
				ft_itoa.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_memcpy.c \
				ft_memmove.c \
				ft_memset.c \
				ft_putchar_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c \
				ft_putstr_fd.c \
				ft_split.c \
				ft_strchr.c \
				ft_strdup.c \
				ft_striteri.c \
				ft_strjoin.c \
				ft_strlcat.c \
				ft_strlcpy.c \
				ft_strlen.c \
				ft_strmapi.c \
				ft_strncmp.c \
				ft_strnstr.c \
				ft_strrchr.c \
				ft_strtrim.c \
				ft_substr.c \
				ft_tolower.c \
				ft_toupper.c
SRCS_B		= ft_lstadd_back.c \
				ft_lstadd_front.c \
				ft_lstclear.c \
				ft_lstdelone.c \
				ft_lstiter.c \
				ft_lstlast.c \
				ft_lstmap.c \
				ft_lstnew.c \
				ft_lstsize.c
SRC			= $(addprefix $(SRCP), $(notdir $(SRCS)))
SRC_B		= $(addprefix $(SRCP_B), $(notdir $(SRCS_B)))
OBJS		= $(SRC:.c=.o)
OBJS_B		= $(SRC_B:.c=.o)

HEAD	= ./
NAME	= libft.a
AR		= ar rcs
RM		= rm -f
LIB		= ranlib
GCC		= gcc
CFLAGS	= -Wall -Wextra -Werror

RESET	= \033[0m #ANSI
BOLD	= \033[1m
RED		= \033[31m
GREEN	= \033[32m
PURPLE	= \033[35m
BLUE	= \033[34m

all: ${NAME}

$(OBJS): %.o: %.c
	@if ! $(GCC) $(CFLAGS) -c -I $(HEAD) $< -o $@ 2> error.txt; then \
		echo "$(RED)$(BOLD)MAKEFILE TERMINATED!$(RESET)"; \
		echo "$(PURPLE)Unable to create the object file for $<$(RESET)"; \
		echo "\n\n$(RED)$(BOLD)ERROR$(RESET)"; \
		sed '$$d' error.txt; \
		echo "\n\n$(PURPLE)EXITING$(RESET)"; \
		exit 1; \
	fi

$(OBJS_B): %.o: %.c
	@if ! $(GCC) $(CFLAGS) -c -I $(HEAD) $< -o $@ 2> error.txt; then \
		echo "$(RED)$(BOLD)MAKEFILE TERMINATED!$(RESET)"; \
		echo "$(PURPLE)Unable to create the object file for $<$(RESET)"; \
		echo "\n\n$(RED)$(BOLD)ERROR$(RESET)"; \
		sed '$$d' error.txt; \
		echo "\n\n$(PURPLE)EXITING$(RESET)"; \
		exit 1; \
	fi

${NAME}: $(OBJS)
	@$(AR) $(NAME) $(OBJS)
	@$(LIB) $(NAME)
	@echo "$(GREEN)$(BOLD)SUCCESS$(RESET)"
	@echo "$(PURPLE)Created: $(words $(OBJS)) object file(s)$(RESET)"
	@echo "$(PURPLE)Created: ${NAME}$(RESET)"

so: ${OBJS}
	@${GCC} -shared -o libft.so ${OBJS}
	@echo "$(PURPLE)Created: libft.so$(RESET)"

bonus: $(OBJS) $(OBJS_B)
	@$(AR) $(NAME) $(OBJS) $(OBJS_B)
	@$(LIB) $(NAME)
	@echo "$(GREEN)$(BOLD)SUCCESS$(RESET)"
	@echo "$(PURPLE)Created: $(words $(OBJS) $(OBJS_B)) object file(s)$(RESET)"
	@echo "$(PURPLE)Created: ${NAME}$(RESET)"

clean:
	@$(RM) $(OBJS) $(OBJS_B) error.txt
	@echo "$(GREEN)$(BOLD)SUCCESS$(RESET)"
	@echo "$(PURPLE)Removed: $(words $(OBJS) $(OBJS_B)) object file(s)$(RESET)"

fclean: clean
	@$(RM) $(NAME) libft.so
	@echo "$(PURPLE)Removed: ${NAME}$(RESET)"

re: fclean all

.PHONY: all clean fclean re so bonus
