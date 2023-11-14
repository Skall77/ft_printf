# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aaudevar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/20 19:04:49 by aaudevar          #+#    #+#              #
#    Updated: 2022/11/20 19:04:49 by aaudevar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIRSRC = ./srcs/

DIRCINC = ./includes/

DIRLIB = ./libft/

SRC =  ft_printf \
		conversions \
		more_conversions \
		ft_printf_utils \
		hexadecimals_functions \

SRCS = $(addprefix ${DIRSRC}, $(addsuffix .c, ${SRC}))

OBJS = ${SRCS:.c=.o}

NAME = libftprintf.a
LFT = libft.a
LIB = ar rcs
RANL = ranlib
CC = cc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

.c.o:
	${CC} ${CFLAGS} -c -I${DIRCINC} -I${DIRLIB} $< -o ${<:.c=.o}

${NAME}: ${OBJS}
	cd ${DIRLIB} && ${MAKE} && cp -v ${LFT} ../${NAME}
	${LIB} ${NAME} ${OBJS}
	${RANL} ${NAME}

all: ${NAME}

clean:
	${RM} ${OBJS}
	cd ${DIRLIB} && ${MAKE} clean

fclean: clean
	${RM} ${NAME}
	cd ${DIRLIB} && ${MAKE} fclean

re : fclean all

.PHONY : all clean fclean re